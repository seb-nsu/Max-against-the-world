#!/usr/bin/env python3
"""Telemetrie aus dem Testbuild auswerten (03-produktion.md, A9).

Aufruf aus dem Repo-Wurzelverzeichnis:
  python3 tools/telemetrie_auswertung.py DATEI.jsonl [ORDNER …]   # Bericht auf stdout
  python3 tools/telemetrie_auswertung.py tests/ -o bericht.md        # Bericht in Datei
  python3 tools/telemetrie_auswertung.py … --mit-tests               # auch Sitzungen aus dem Headless-Test

Liest eine oder mehrere Protokolldateien (user://telemetrie/<sitzung>.jsonl, ein JSON-Objekt
je Zeile, Felder in game/skripte/telemetrie.gd). Ordner werden nach *.jsonl durchsucht.
Sitzungen desselben Testers (gleiche zufällige Tester-ID) gehören zusammen.

Bericht als Markdown:
  - je Rätselschritt: Median und Maximum der Zeit von „offen“ bis „gelöst“ (Spielzeit, läuft
    über Speichern und neue Sitzungen weiter), wie viele Tester Hinweisstufe 1, 2, 3 brauchten,
    Fehlklicks (Aktionen, die mit einer Ersatzzeile endeten, im Raum des Schritts, solange er
    offen war)
  - je Rätsel (P1, R1 mit R1a–R1c …): Zeit vom ersten offenen Teilschritt bis zum letzten gelösten
  - Stufe 3 je Tester und Welt, Spielzeit bis R4 gelöst (Vertical Slice), Fehlklicks je Objekt,
    Klicks ins Leere je Raum
Zielwerte (03-produktion.md, A9, Testen, Stufe 2): kein Schritt über 10 Minuten im Median,
Rätsel unter 12 Minuten, höchstens eine Stufe 3 je Welt und Tester, Stufe 3 bei unter
20 Prozent der Tester, Vertical Slice (bis R4) in 40 Minuten.

Für Lach-Stellen und Beobachtungen gibt es den Beobachtungsbogen (docs/test/beobachtungsbogen.md);
die Auswertung beider zusammen ist A15.
"""
import argparse
import json
import re
import statistics
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
WELTEN = ROOT / "game" / "daten" / "welten"

ZIEL_SCHRITT_MIN = 10
ZIEL_RAETSEL_MIN = 12
ZIEL_STUFE3_JE_WELT = 1
ZIEL_STUFE3_ANTEIL = 0.20
ZIEL_SLICE_MIN = 40
SLICE_ENDE = ("welt-1", "R4")
ABSCHNITT_NAME = {"prolog": "Prolog", "welt-1": "Welt 1", "welt-2": "Welt 2", "welt-3": "Welt 3",
                  "welt-4": "Welt 4", "finale": "Zwischenspiele und Finale"}


def lade_raetsel():
    """{abschnitt: {schritt: {name, raum, reihenfolge}}} aus den erzeugten Welt-Daten."""
    out = {}
    for datei in sorted(WELTEN.glob("*.json")):
        d = json.loads(datei.read_text(encoding="utf-8"))
        out[d["abschnitt"]] = {r["id"]: {"name": r.get("name", ""), "raum": r.get("raum", ""), "nr": i}
                               for i, r in enumerate(d.get("raetsel", []))}
    return out


def dateien(pfade):
    for p in map(Path, pfade):
        if p.is_dir():
            yield from sorted(p.rglob("*.jsonl"))
        elif p.exists():
            yield p
        else:
            print(f"WARNUNG  {p} gibt es nicht", file=sys.stderr)


def lese(pfade, mit_tests):
    """Ereignisse je Tester, nach Sitzung und Zeit geordnet."""
    tester = defaultdict(list)
    sitzungen = 0
    for datei in dateien(pfade):
        ev = []
        for nr, zeile in enumerate(datei.read_text(encoding="utf-8").splitlines(), 1):
            if not zeile.strip():
                continue
            try:
                ev.append(json.loads(zeile))
            except json.JSONDecodeError:
                print(f"WARNUNG  {datei}:{nr}: kein JSON, übersprungen", file=sys.stderr)
        if not ev:
            continue
        start = ev[0] if ev[0].get("ev") == "sitzung_start" else {}
        if start.get("testmodus") and not mit_tests:
            continue
        sitzungen += 1
        tid = start.get("tester") or start.get("sitzung") or datei.stem
        for e in ev:
            e["_sitzung"] = start.get("sitzung", datei.stem)
        tester[tid].extend(ev)
    return tester, sitzungen


def minuten(s):
    return "–" if s is None else f"{s / 60:.1f}".replace(".", ",")


def median(werte):
    return statistics.median(werte) if werte else None


def auswerten(tester, raetsel):
    schritt_zeit = defaultdict(list)        # (ab, schritt) → [sekunden]
    schritt_offen_bei = defaultdict(set)    # (ab, schritt) → Tester, bei denen er offen war
    stufe_max = defaultdict(dict)           # (ab, schritt) → {tester: stufe}
    hinweis_klicks = defaultdict(int)       # (ab, schritt) → Klicks inkl. Wiederholungen
    fehl_schritt = defaultdict(int)         # (ab, schritt) → Fehlklicks
    fehl_objekt = defaultdict(int)          # (ab, raum, objekt, aktion, gegenstand) → Anzahl
    fehl_ohne = 0
    leer_raum = defaultdict(int)            # (ab, raum) → Klicks ins Leere
    raetsel_zeit = defaultdict(list)        # (ab, rätsel) → [sekunden]
    stufe3_welt = defaultdict(dict)         # ab → {tester: anzahl}
    slice_zeit = {}                         # tester → spielzeit bei R4 gelöst
    spielzeit_tester = {}

    for tid, ev in tester.items():
        offen, geloest = {}, {}
        for e in ev:
            k = (e.get("abschnitt", ""), e.get("schritt", ""))
            if e["ev"] == "schritt_offen" and k not in offen:
                offen[k] = e
            elif e["ev"] == "schritt_geloest" and k not in geloest:
                geloest[k] = e
        spielzeit_tester[tid] = max((float(e.get("spielzeit", 0)) for e in ev), default=0.0)

        for k, o in offen.items():
            schritt_offen_bei[k].add(tid)
            g = geloest.get(k)
            if not g:
                continue
            d = float(g["spielzeit"]) - float(o["spielzeit"])
            if d < 0 and g["_sitzung"] == o["_sitzung"]:
                d = float(g["t"]) - float(o["t"])  # älterer Stand geladen: Echtzeit der Sitzung
            if d >= 0:
                schritt_zeit[k].append(d)

        # Rätsel = Schritte mit derselben Nummer (R1 = R1, R1a, R1b, R1c)
        gruppen = defaultdict(lambda: {"offen": [], "geloest": []})
        for (ab, s), o in offen.items():
            gruppen[(ab, raetsel_id(s))]["offen"].append(float(o["spielzeit"]))
        for (ab, s), g in geloest.items():
            gruppen[(ab, raetsel_id(s))]["geloest"].append(float(g["spielzeit"]))
        for k, gr in gruppen.items():
            teile = [s for s in raetsel.get(k[0], {}) if raetsel_id(s) == k[1]]
            # gelöst: das Rätsel selbst (Sammelschritt, auch R10 über Weg A oder B) oder alle Teile
            fertig = k in geloest or (all((k[0], s) in geloest for s in teile) if teile else False)
            if gr["offen"] and fertig:
                d = max(gr["geloest"]) - min(gr["offen"])
                if d >= 0:
                    raetsel_zeit[k].append(d)

        if SLICE_ENDE in geloest:
            slice_zeit[tid] = float(geloest[SLICE_ENDE]["spielzeit"])

        for e in ev:
            ab = e.get("abschnitt", "")
            if e["ev"] == "hinweis" and e.get("schritt"):
                k = (ab, e["schritt"])
                hinweis_klicks[k] += 1
                st = int(e.get("stufe", 0))
                if st > stufe_max[k].get(tid, 0):
                    stufe_max[k][tid] = st
            elif e["ev"] == "fehlklick":
                fehl_objekt[(ab, e.get("raum", ""), e.get("objekt", ""), e.get("aktion", ""),
                             e.get("gegenstand", ""))] += 1
                zeit = float(e.get("spielzeit", 0))
                treffer = [k for k, o in offen.items()
                           if k[0] == ab and raetsel.get(ab, {}).get(k[1], {}).get("raum") == e.get("raum")
                           and float(o["spielzeit"]) <= zeit
                           and (k not in geloest or zeit <= float(geloest[k]["spielzeit"]))]
                for k in treffer:
                    fehl_schritt[k] += 1
                if not treffer:
                    fehl_ohne += 1
            elif e["ev"] == "klick_leer":
                leer_raum[(ab, e.get("raum", ""))] += 1

        for (ab, s), st in ((k, v.get(tid, 0)) for k, v in stufe_max.items()):
            if st >= 3:
                stufe3_welt[ab][tid] = stufe3_welt[ab].get(tid, 0) + 1

    return dict(schritt_zeit=schritt_zeit, schritt_offen_bei=schritt_offen_bei, stufe_max=stufe_max,
                hinweis_klicks=hinweis_klicks, fehl_schritt=fehl_schritt, fehl_objekt=fehl_objekt,
                fehl_ohne=fehl_ohne, leer_raum=leer_raum, raetsel_zeit=raetsel_zeit,
                stufe3_welt=stufe3_welt, slice_zeit=slice_zeit, spielzeit_tester=spielzeit_tester)


def raetsel_id(schritt):
    m = re.match(r"([A-Z]+\d+)", schritt)
    return m.group(1) if m else schritt


def sortierschluessel(raetsel):
    reihenfolge = list(ABSCHNITT_NAME)

    def f(k):
        ab, s = k
        return (reihenfolge.index(ab) if ab in reihenfolge else 99,
                raetsel.get(ab, {}).get(s, {}).get("nr", 999), s)
    return f


def bericht(tester, sitzungen, raetsel, quellen):
    a = auswerten(tester, raetsel)
    n = len(tester)
    out = ["# Telemetrie-Auswertung", ""]
    out.append(f"{n} Tester, {sitzungen} Sitzungen, aus {', '.join(quellen)}. Zeiten in Minuten Spielzeit "
               "(läuft nur im Raum, über Speichern und Laden hinweg). Zielwerte aus `docs/03-produktion.md` "
               "(A9, Testen, Stufe 2).")
    out.append("")
    if not n:
        out.append("Keine Sitzungen gefunden.")
        return "\n".join(out) + "\n"

    # --- Zusammenfassung der Zielwerte ---
    ueber = []
    schritte = sorted(set(a["schritt_offen_bei"]) | set(a["schritt_zeit"]) | set(a["stufe_max"]),
                      key=sortierschluessel(raetsel))
    for k in schritte:
        m = median(a["schritt_zeit"].get(k, []))
        if m is not None and m > ZIEL_SCHRITT_MIN * 60:
            ueber.append(f"Schritt {k[1]} ({ABSCHNITT_NAME.get(k[0], k[0])}): Median {minuten(m)} min")
    for k, werte in sorted(a["raetsel_zeit"].items(), key=lambda kv: sortierschluessel(raetsel)(kv[0])):
        m = median(werte)
        if m is not None and m >= ZIEL_RAETSEL_MIN * 60:
            ueber.append(f"Rätsel {k[1]} ({ABSCHNITT_NAME.get(k[0], k[0])}): Median {minuten(m)} min")
    for k in schritte:
        basis = len(a["schritt_offen_bei"].get(k, set())) or 1
        s3 = sum(1 for st in a["stufe_max"].get(k, {}).values() if st >= 3)
        if s3 and s3 / basis >= ZIEL_STUFE3_ANTEIL:
            ueber.append(f"Schritt {k[1]}: Stufe 3 bei {s3} von {basis} Testern")
    for ab, je in a["stufe3_welt"].items():
        zu_viel = [t for t, z in je.items() if z > ZIEL_STUFE3_JE_WELT]
        if zu_viel:
            ueber.append(f"{ABSCHNITT_NAME.get(ab, ab)}: {len(zu_viel)} Tester mit mehr als "
                         f"{ZIEL_STUFE3_JE_WELT} Stufe 3")
    if a["slice_zeit"]:
        m = median(list(a["slice_zeit"].values()))
        if m > ZIEL_SLICE_MIN * 60:
            ueber.append(f"Vertical Slice bis R4: Median {minuten(m)} min")
    out.append("## Zielwerte")
    out.append("")
    out.append("| Ziel | Wert |")
    out.append("| --- | --- |")
    out.append(f"| Kein Schritt über {ZIEL_SCHRITT_MIN} min im Median | "
               f"{_ok(not any(u.startswith('Schritt') and 'Median' in u for u in ueber))} |")
    out.append(f"| Rätsel unter {ZIEL_RAETSEL_MIN} min (Median) | "
               f"{_ok(not any(u.startswith('Rätsel') for u in ueber))} |")
    out.append(f"| Höchstens {ZIEL_STUFE3_JE_WELT} Stufe 3 je Welt und Tester | "
               f"{_ok(not any('mehr als' in u for u in ueber))} |")
    out.append(f"| Stufe 3 bei unter {int(ZIEL_STUFE3_ANTEIL * 100)} Prozent der Tester je Schritt | "
               f"{_ok(not any('Stufe 3 bei' in u for u in ueber))} |")
    if a["slice_zeit"]:
        out.append(f"| Vertical Slice (Prolog bis R4) in {ZIEL_SLICE_MIN} min | "
                   f"{_ok(not any(u.startswith('Vertical') for u in ueber))}, Median "
                   f"{minuten(median(list(a['slice_zeit'].values())))} min, "
                   f"{len(a['slice_zeit'])} von {n} Testern bis R4 |")
    out.append("")
    if ueber:
        out.append("Über dem Ziel:")
        out.append("")
        out.extend(f"- {u}" for u in ueber)
        out.append("")

    # --- Schritte ---
    out.append("## Rätselschritte")
    out.append("")
    out.append("Zeit von „offen“ bis „gelöst“. Stufe 1/2/3: Tester, die diese Stufe höchstens erreicht "
               "haben (Stufe 3 zählt nicht bei 2 mit). Klicks: alle Pfoten- und Opa-Klicks mit "
               "Wiederholungen. Fehlklicks: Ersatzzeilen im Raum des Schritts, solange er offen war.")
    out.append("")
    out.append("| Abschnitt | Schritt | Name | Tester | gelöst | Median | Max | Stufe 1 | Stufe 2 | Stufe 3 "
               "| Hinweis-Klicks | Fehlklicks | Ziel |")
    out.append("| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |")
    for k in schritte:
        ab, s = k
        zeiten = a["schritt_zeit"].get(k, [])
        stufen = list(a["stufe_max"].get(k, {}).values())
        m = median(zeiten)
        basis = len(a["schritt_offen_bei"].get(k, set()))
        s3 = stufen.count(3)
        ok = (m is None or m <= ZIEL_SCHRITT_MIN * 60) and (not basis or s3 / basis < ZIEL_STUFE3_ANTEIL)
        out.append("| {} | {} | {} | {} | {} | {} | {} | {} | {} | {} | {} | {} | {} |".format(
            ABSCHNITT_NAME.get(ab, ab), s, raetsel.get(ab, {}).get(s, {}).get("name", ""), basis, len(zeiten),
            minuten(m), minuten(max(zeiten) if zeiten else None), stufen.count(1), stufen.count(2), s3,
            a["hinweis_klicks"].get(k, 0), a["fehl_schritt"].get(k, 0),
            "–" if m is None and not stufen else _ok(ok)))
    out.append("")

    # --- Rätsel ---
    out.append("## Rätsel")
    out.append("")
    out.append("Vom ersten offenen Teilschritt bis zum letzten gelösten.")
    out.append("")
    out.append("| Abschnitt | Rätsel | Tester | Median | Max | Ziel unter 12 min |")
    out.append("| --- | --- | --- | --- | --- | --- |")
    for k, werte in sorted(a["raetsel_zeit"].items(), key=lambda kv: sortierschluessel(raetsel)(kv[0])):
        m = median(werte)
        out.append(f"| {ABSCHNITT_NAME.get(k[0], k[0])} | {k[1]} | {len(werte)} | {minuten(m)} | "
                   f"{minuten(max(werte))} | {_ok(m < ZIEL_RAETSEL_MIN * 60)} |")
    out.append("")

    # --- Stufe 3 je Welt ---
    out.append("## Stufe 3 je Welt und Tester")
    out.append("")
    out.append("| Abschnitt | Tester mit Stufe 3 | höchstens 1 | mehr als 1 |")
    out.append("| --- | --- | --- | --- |")
    for ab, je in sorted(a["stufe3_welt"].items(), key=lambda x: list(ABSCHNITT_NAME).index(x[0])
                         if x[0] in ABSCHNITT_NAME else 99):
        out.append(f"| {ABSCHNITT_NAME.get(ab, ab)} | {len(je)} | "
                   f"{sum(1 for z in je.values() if z <= ZIEL_STUFE3_JE_WELT)} | "
                   f"{sum(1 for z in je.values() if z > ZIEL_STUFE3_JE_WELT)} |")
    if not a["stufe3_welt"]:
        out.append("| – | 0 | – | – |")
    out.append("")

    # --- Fehlklicks je Objekt ---
    out.append("## Fehlklicks je Objekt")
    out.append("")
    out.append("Aktionen, die mit einer Ersatzzeile endeten, häufigste zuerst (höchstens 30). "
               f"Davon ohne offenen Schritt im Raum: {a['fehl_ohne']}.")
    out.append("")
    out.append("| Abschnitt | Raum | Objekt | Aktion | Gegenstand | Anzahl |")
    out.append("| --- | --- | --- | --- | --- | --- |")
    for (ab, raum, obj, akt, geg), z in sorted(a["fehl_objekt"].items(), key=lambda x: -x[1])[:30]:
        out.append(f"| {ABSCHNITT_NAME.get(ab, ab)} | {raum} | {obj} | {akt} | {geg or '–'} | {z} |")
    out.append("")

    # --- Klicks ins Leere ---
    out.append("## Klicks ins Leere je Raum")
    out.append("")
    out.append("| Abschnitt | Raum | Klicks |")
    out.append("| --- | --- | --- |")
    for (ab, raum), z in sorted(a["leer_raum"].items(), key=lambda x: -x[1]):
        out.append(f"| {ABSCHNITT_NAME.get(ab, ab)} | {raum} | {z} |")
    out.append("")
    return "\n".join(out) + "\n"


def _ok(b):
    return "ok" if b else "über Ziel"


def main():
    ap = argparse.ArgumentParser(description="Telemetrie aus dem Testbuild auswerten (A9).")
    ap.add_argument("pfade", nargs="+", help=".jsonl-Dateien oder Ordner")
    ap.add_argument("-o", "--ausgabe", help="Markdown-Datei (sonst stdout)")
    ap.add_argument("--mit-tests", action="store_true", help="auch Sitzungen aus dem Headless-Testmodus")
    args = ap.parse_args()
    tester, sitzungen = lese(args.pfade, args.mit_tests)
    text = bericht(tester, sitzungen, lade_raetsel(), args.pfade)
    if args.ausgabe:
        Path(args.ausgabe).write_text(text, encoding="utf-8")
        print(f"geschrieben: {args.ausgabe}")
    else:
        sys.stdout.write(text)


if __name__ == "__main__":
    main()
