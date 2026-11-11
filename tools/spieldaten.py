#!/usr/bin/env python3
"""Spieldaten für Godot aus den Besitzer-Dateien erzeugen (A14 und Welt-Daten).

Aufruf aus dem Repo-Wurzelverzeichnis:
  python3 tools/spieldaten.py            # schreibt game/daten/
  python3 tools/spieldaten.py --pruefen  # exit 1, wenn game/daten/ veraltet ist

Ausgaben (werden eingecheckt, nie von Hand bearbeiten):
  game/daten/welten/<abschnitt>.json  die Welt-Tabelle 1:1 als JSON, damit das Spiel
                                      dieselben IDs, Schalter und Abhängigkeiten nutzt
  game/daten/hinweise/<abschnitt>.json  Hinweis-Datei der Hilfe-Pfote: ein Eintrag je
                                      Rätselschritt mit Notizbuch-Ziel, Bedingungen,
                                      Schaltern und den drei Hinweis-Zeilen-IDs

Die Zuordnung Schritt → Hinweiszeilen liest das Skript aus dem Auslöser der
Hinweiszeilen („R1c, Stufe 3“), wie in docs/05-spielsysteme.md festgelegt.
"""
import json
import re
import sys
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "docs"
ZIEL = ROOT / "game" / "daten"
ABSCHNITTE = ["prolog", "welt-1", "welt-2", "welt-3", "welt-4", "finale"]
SKRIPT = {
    "prolog": "skript/prolog.md", "welt-1": "skript/welt-1.md", "welt-2": "skript/welt-2.md",
    "welt-3": "skript/welt-3.md", "welt-4": "skript/welt-4.md",
    "finale": "skript/zwischenspiele-und-finale.md",
}
# Hinweise, die nicht als HINT-Zeile im Skript stehen (Opa gibt sie im Prolog über Reden)
FESTE_HINWEISE = {"prolog": {"P1": ["P0_DACH_OPA_1324", "P0_DACH_OPA_1326", "P0_DACH_OPA_1328"]}}
FINALE_SCHRITT = {"0": "F1", "A": "F1a", "B": "F1b", "C": "F1c", "D": "F1d"}


def liste(x):
    if x is None:
        return []
    return x if isinstance(x, list) else [x]


def schritt_id(ab, text, raetsel_ids):
    """Wandelt den Auslöser einer Hinweiszeile in die Rätsel-ID der Welt-Tabelle."""
    t = text.replace("\\_", "_")
    m = re.match(r"^Schritt ([0A-D])\b", t)
    if m:
        return FINALE_SCHRITT[m.group(1)]
    if t.startswith("Bonus Kekse") and "F2" in raetsel_ids:
        return "F2"
    m = re.match(r"^(?:W\d_)?([RP])0?(\d+)(?:_([A-D])|([a-d]))?(?: Teil (\d))?\b", t)
    if not m:
        return None
    buchst, nr, gross, klein, teil = m.groups()
    rid = f"{buchst}{int(nr)}"
    if gross:
        rid += gross.lower()
    elif klein:
        rid += klein
    elif teil:
        rid += "ab"[int(teil) - 1]
    return rid if rid in raetsel_ids else None


BEDINGUNG_RE = re.compile(r"^(nur|ohne) ([A-Z0-9_]+)$")


def nie_allein_offen(ab, rid, r, raetsel):
    """Sammelschritt (R4 mit R4a bis R4d), der im Spiel nie für sich offen ist: Er hat keinen
    eigenen „…_GELOEST“-Schalter und gilt als gelöst, sobald seine Teile gelöst sind. Oder die
    Regeln des Abschnitts lösen ihn immer im selben Zug mit einem Teilschritt (direkt nach
    Zustand.loese("<Teil>")). Hat er dagegen einen eigenen letzten Schritt (Welt 4, R4: der
    Hyäne die Zeitschrift zeigen), ist er offen und braucht Hinweise."""
    if not any(o != rid and re.fullmatch(re.escape(rid) + r"[a-z]", o) for o in raetsel):
        return False
    if not any(str(s).endswith("_GELOEST") for s in liste(r.get("schalter"))):
        return True
    regeln = ROOT / "game" / "skripte" / f"{ab.replace('-', '_')}.gd"
    if not regeln.exists():
        return False
    zeilen = [z.strip() for z in regeln.read_text(encoding="utf-8").splitlines() if z.strip()]
    stellen = [i for i, z in enumerate(zeilen) if f'Zustand.loese("{rid}")' in z]
    teil = re.compile(r'Zustand\.loese\("' + re.escape(rid) + r'[a-z]"\)')
    return bool(stellen) and all(i > 0 and teil.search(zeilen[i - 1]) for i in stellen)


def stufen_luecken(hinweise):
    """Stufen 1 bis 3, für die nicht in jedem Fall eine Zeile gilt: Entweder steht eine Zeile ohne
    Bedingung da, oder zu einem Schalter gibt es beide Fassungen („nur X“ und „ohne X“)."""
    fehlt = []
    for s in (1, 2, 3):
        bed = [h.get("bedingung", "") for h in hinweise if h["stufe"] == s]
        paare = {}
        for b in bed:
            if m := BEDINGUNG_RE.match(b):
                paare.setdefault(m.group(2), set()).add(m.group(1))
        if "" not in bed and not any(v == {"nur", "ohne"} for v in paare.values()):
            fehlt.append(s)
    return fehlt


def hinweise_lesen(ab, raetsel_ids):
    schritte, sonder, fehler = {}, {}, []
    for z in (DOCS / SKRIPT[ab]).read_text(encoding="utf-8").splitlines():
        if "\\_HINT\\_" not in z or not z.startswith("| "):
            continue
        zellen = [c.strip() for c in z.strip().strip("|").split(" | ")]
        zid, ausl = zellen[0].replace("\\_", "_"), zellen[-1]
        stufe = re.search(r"Stufe (\d)", ausl)
        if not stufe:
            # „Hilfe-Pfote in Zwischenspiel 1 bis 3“ (ZS1_HINT_PIX_0010) gilt nur in den Zwischenspielen
            art = "wartezeile" if "Warte" in ausl else "zwischenspiel" if "Zwischenspiel" in ausl else "nichts_offen"
            sonder[art] = zid
            continue
        bedingung = ausl.split(";", 1)[1].strip().replace("\\_", "_") if ";" in ausl else ""
        rid = schritt_id(ab, ausl, raetsel_ids)
        if rid is None:
            fehler.append(f"{zid}: Schritt in „{ausl}“ nicht erkannt")
            continue
        eintrag = {"stufe": int(stufe.group(1)), "zeile": zid}
        if bedingung:
            if not BEDINGUNG_RE.match(bedingung):
                fehler.append(f"{zid}: Bedingung „{bedingung}“ versteht das Spiel nicht (nur <Schalter> oder ohne <Schalter>)")
                continue
            eintrag["bedingung"] = bedingung
        schritte.setdefault(rid, []).append(eintrag)
    for rid, ids in FESTE_HINWEISE.get(ab, {}).items():
        schritte[rid] = [{"stufe": i + 1, "zeile": z} for i, z in enumerate(ids)]
    return schritte, sonder, fehler


def erzeugen():
    dateien, fehler = {}, []
    for ab in ABSCHNITTE:
        d = yaml.safe_load((DOCS / "welten" / f"{ab}.yaml").read_text(encoding="utf-8"))
        dateien[f"welten/{ab}.json"] = d
        raetsel = {r["id"]: r for r in d.get("raetsel") or []}
        gegen = {g["id"]: g for g in d.get("gegenstaende") or []}
        schritte, sonder, f = hinweise_lesen(ab, set(raetsel))
        fehler += [f"{ab}: {x}" for x in f]
        eintraege = []
        for rid, r in raetsel.items():
            hat_teile = any(o != rid and re.fullmatch(re.escape(rid) + r"[a-z]", o) for o in raetsel)
            h = sorted(schritte.get(rid, []), key=lambda e: (e["stufe"], e.get("bedingung", "")))
            # Ohne eigene Zeilen gelten die des Sammelschritts (Welt 1: die Wege R10a und R10b
            # teilen sich die drei Zeilen von R10). Jeder Schritt, der im Spiel offen sein kann,
            # braucht alle drei Stufen, sonst leuchtet die Pfote und Pixel hat nichts zu sagen.
            eltern = re.sub(r"[a-z]$", "", rid)
            von = eltern if not h and eltern != rid and schritte.get(eltern) else ""
            if not nie_allein_offen(ab, rid, r, raetsel):
                gelten = h or schritte.get(von, [])
                if not gelten:
                    fehler.append(f"{ab}: Rätselschritt {rid} kann offen sein und hat keine Hinweise im Skript")
                elif fehlt := stufen_luecken(gelten):
                    fehler.append(f"{ab}: Rätselschritt {rid} kann offen sein, es fehlt Stufe "
                                  f"{', '.join(map(str, fehlt))} (oder sie gilt nicht in jedem Fall)")
            eintraege.append({
                "schritt": rid,
                "ziel": r.get("name", ""),
                "raum": r.get("raum"),
                "offen_wenn": liste(r.get("benoetigt")),
                "offen_wenn_eins_von": liste(r.get("benoetigt_eins_von")),
                "geloest_schalter": liste(r.get("schalter"))[:1],
                "objekte": [b for b in liste(r.get("benoetigt")) + liste(r.get("benoetigt_eins_von")) if b in gegen],
                "optional": bool(r.get("optional")),
                "sammelschritt": hat_teile,
                "hinweise": h,
                **({"hinweise_von": von} if von else {}),
            })
        dateien[f"hinweise/{ab}.json"] = {"abschnitt": ab, "sonderzeilen": sonder, "schritte": eintraege}
    texte = {p: json.dumps(v, ensure_ascii=False, indent=1, sort_keys=False) + "\n" for p, v in dateien.items()}
    return texte, fehler


def main():
    texte, fehler = erzeugen()
    if "--pruefen" in sys.argv:
        alt = [p for p, t in texte.items()
               if not (ZIEL / p).exists() or (ZIEL / p).read_text(encoding="utf-8") != t]
        for x in fehler:
            print("FEHLER  ", x)
        if alt:
            print("game/daten/ ist veraltet: python3 tools/spieldaten.py ausführen")
        if alt or fehler:
            sys.exit(1)
        return
    for p, t in texte.items():
        (ZIEL / p).parent.mkdir(parents=True, exist_ok=True)
        (ZIEL / p).write_text(t, encoding="utf-8")
    for x in fehler:
        print("WARNUNG ", x)
    print(f"geschrieben: {len(texte)} Dateien in game/daten/")


if __name__ == "__main__":
    main()
