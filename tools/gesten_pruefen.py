#!/usr/bin/env python3
"""Prüft die Gesten-Tabellen (game/skripte/gesten_einsatz.gd, gesten_welt_1.gd, gesten_welt_2.gd).

Für jede Zeile der Tabelle ZEILE: Gibt es die Zeilen-ID im Skript (lokalisierung/texte.csv), gibt es
das Kürzel als Figur, und hat diese Figur (oder eine ihrer Bild-Varianten) die Bewegung? Für RUHE und
WARTEN: Gibt es die Figur, die Bewegungen, die Räume und die Rätsel? Die Art muss bekannt sein.
Ein Tippfehler in den Tabellen fiele im Spiel nicht auf (die Geste wird still übergangen), darum
läuft diese Prüfung in GitHub Actions.

Aufruf: python3 tools/gesten_pruefen.py   (Rückgabe 1 bei Fehlern)
"""
import csv
import json
import re
import sys
from pathlib import Path

WURZEL = Path(__file__).resolve().parent.parent
SPIEL = WURZEL / "game"
ARTEN = {"vor", "mit", "statt_talk", "bleibt", "halten", "halten_mit"}
# Bild-Varianten einer Figur (CQFigur.grafik_laden(variante)); ihre Bewegungen zählen mit
VARIANTEN = {
    "sobek": ["sobek_land"],
    "archimedes": ["archimedes_handtuch"],
    "pixel": ["pixel_ziege"],
    "max": ["max_pilz"],
    "faecherwedler": ["faecherwedler_gelb"],
}
TABELLEN = {
    "gesten_einsatz.gd": ["prolog", "finale", "welt-1", "welt-2", "welt-3", "welt-4"],
    "gesten_welt_1.gd": ["welt-1"],
    "gesten_welt_2.gd": ["welt-2"],
}


def bewegungen(figur_id):
    namen = set()
    for fid in [figur_id] + VARIANTEN.get(figur_id, []):
        pfad = SPIEL / "daten" / "figuren" / f"{fid}.json"
        if pfad.exists():
            namen |= set(json.loads(pfad.read_text())["animationen"])
    return namen


def abschnitte():
    figuren, raeume, raetsel = {}, {}, {}
    for pfad in sorted((SPIEL / "daten" / "raeume").glob("*.json")):
        d = json.loads(pfad.read_text())
        ab = d["abschnitt"]
        figuren[ab] = {f["kuerzel"]: f["id"] for f in d.get("figuren", []) if f.get("kuerzel")}
        raeume[ab] = {r["id"] for r in d.get("raeume", [])}
    for pfad in sorted((SPIEL / "daten" / "welten").glob("*.json")):
        d = json.loads(pfad.read_text())
        raetsel[pfad.stem] = {r["id"] for r in d.get("raetsel", [])}
    return figuren, raeume, raetsel


def konstante(text, name):
    """Inhalt von const NAME := {...} als Text (bis zur passenden Klammer)."""
    m = re.search(r"^const %s := \{" % name, text, re.M)
    if not m:
        return ""
    tiefe, i = 0, m.end() - 1
    for j in range(i, len(text)):
        if text[j] == "{":
            tiefe += 1
        elif text[j] == "}":
            tiefe -= 1
            if tiefe == 0:
                return text[i + 1:j]
    return ""


def klammer(text, i):
    """Text von der eckigen Klammer an Stelle i bis zur passenden schließenden."""
    tiefe = 0
    for j in range(i, len(text)):
        if text[j] == "[":
            tiefe += 1
        elif text[j] == "]":
            tiefe -= 1
            if tiefe == 0:
                return text[i:j + 1]
    return text[i:]


def eintraege(inhalt):
    """(Figur-ID, Text des Eintrags) für jede Zeile „"id": [ … ]“ der obersten Ebene."""
    treffer = list(re.finditer(r'^\t"([a-z0-9_]+)":\s*\[', inhalt, re.M))
    return [(m.group(1), klammer(inhalt, m.end() - 1)) for m in treffer]


def ohne_kommentare(text):
    return "\n".join(re.sub(r"\s#.*$", "", z) for z in text.splitlines())


def main():
    ids = set()
    with open(SPIEL / "lokalisierung" / "texte.csv", newline="", encoding="utf-8") as f:
        for zeile in csv.reader(f):
            if zeile:
                ids.add(zeile[0])
    figuren, raeume, raetsel = abschnitte()
    fehler = []
    for datei, abs_ in TABELLEN.items():
        text = ohne_kommentare((SPIEL / "skripte" / datei).read_text(encoding="utf-8"))
        kuerzel = {}
        for ab in abs_:
            for k, fid in figuren.get(ab, {}).items():
                kuerzel.setdefault(k, set()).add(fid)
        alle_figuren = {fid for ab in abs_ for fid in figuren.get(ab, {}).values()}
        alle_raeume = {r for ab in abs_ for r in raeume.get(ab, set())}
        alle_raetsel = {r for ab in abs_ for r in raetsel.get(ab, set())}
        for m in re.finditer(r'"([A-Z0-9_]+)":\s*\[([^\]]*)\]', konstante(text, "ZEILE")):
            zid, teile = m.group(1), [t.strip().strip('"') for t in m.group(2).split(",")]
            if zid not in ids:
                fehler.append(f"{datei}: Zeile {zid} gibt es nicht im Skript")
            if len(teile) < 3 or teile[2] not in ARTEN:
                fehler.append(f"{datei}: {zid}: unbekannte Art {teile[2:3]}")
                continue
            fids = kuerzel.get(teile[0], set())
            if not fids:
                fehler.append(f"{datei}: {zid}: Kürzel {teile[0]} ist keine Figur")
            elif not any(teile[1] in bewegungen(fid) for fid in fids):
                fehler.append(f"{datei}: {zid}: {'/'.join(sorted(fids))} hat keine Bewegung {teile[1]}")
        for tabelle in ("RUHE", "WARTEN"):
            inhalt = konstante(text, tabelle)
            for fid, eintrag in eintraege(inhalt):
                if fid not in alle_figuren:
                    fehler.append(f"{datei}: {tabelle}: Figur {fid} gibt es in {abs_} nicht")
                    continue
                namen = set(re.findall(r'geste = "([A-Za-z0-9_]+)"', eintrag))
                for start in [m.end() for m in re.finditer(r"gesten = \[", eintrag)]:
                    namen |= set(re.findall(r'"([A-Za-z0-9_]+)"', klammer(eintrag, start - 1)))
                for n in sorted(namen - bewegungen(fid)):
                    fehler.append(f"{datei}: {tabelle}: {fid} hat keine Bewegung {n}")
                for r in re.findall(r'raum = (?:"([A-Za-z0-9_]+)"|\[([^\]]*)\])', eintrag):
                    for name in [r[0]] if r[0] else re.findall(r'"([A-Za-z0-9_]+)"', r[1]):
                        if name not in alle_raeume:
                            fehler.append(f"{datei}: {tabelle}: {fid}: Raum {name} gibt es nicht")
                for r in re.findall(r'(?:vor|nach) = "([A-Za-z0-9_]+)"', eintrag):
                    if r not in alle_raetsel:
                        fehler.append(f"{datei}: {tabelle}: {fid}: Rätsel {r} gibt es nicht")
    for f in fehler:
        print("FEHLER:", f)
    print(f"Gesten-Tabellen geprüft, {len(fehler)} Fehler")
    return 1 if fehler else 0


if __name__ == "__main__":
    sys.exit(main())
