#!/usr/bin/env python3
"""Prüft, ob jede Skriptzeile im Spiel vorkommt.

Eine Zeile gilt als benutzt, wenn ihre ID in den Spieldaten (game/daten), in einem Skript
oder einer Szene unter game/ steht. Skripte, die IDs zusammensetzen („W3_KAM1_MAX_“ + „0500“),
zählen mit, wenn Präfix und Nummer beide als Text im selben Skript stehen. Tests zählen nicht.

Zeilen, die bewusst nicht vorkommen, stehen im Skript mit „Reserve, kommt nicht vor“ in der
letzten Spalte; sie werden nur aufgezählt.

    python3 tools/abdeckung.py            Liste der ungenutzten Zeilen
    python3 tools/abdeckung.py --pruefen  Fehler (Rückgabe 1), wenn eine Zeile ohne Reserve-Vermerk fehlt
"""
import csv
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
GAME = ROOT / "game"
ID_RE = re.compile(r"(?:W[1-4]|ZS[1-3]|FI|P0)_[A-Z0-9]+_[A-Z]+_\d{4}")
ZEILE_RE = re.compile(r"^\| ((?:[A-Z0-9]+\\_)+[A-Z0-9]+\\_\d{4}) \|")


def main():
    pruefen = "--pruefen" in sys.argv
    with open(GAME / "lokalisierung" / "texte.csv", encoding="utf-8") as f:
        ids = [r["keys"] for r in csv.DictReader(f) if ID_RE.fullmatch(r["keys"])]

    text, skripte = [], []
    for muster in ("daten/**/*.json", "**/*.gd", "**/*.tscn", "**/*.tres"):
        for p in GAME.glob(muster):
            teile = p.relative_to(GAME).parts
            if ".godot" in teile or "tests" in teile or "addons" in teile:
                continue
            t = p.read_text(encoding="utf-8", errors="ignore")
            text.append(t)
            if p.suffix == ".gd":
                skripte.append(t)
    benutzt = set(ID_RE.findall("\n".join(text)))

    def zusammengesetzt(i):
        praefix, nummer = i.rsplit("_", 1)
        return any(f'"{praefix}_"' in t and f'"{nummer}"' in t for t in skripte)

    fehlend = [i for i in ids if i not in benutzt and not zusammengesetzt(i)]

    reserve, zeilen = set(), {}
    for datei in sorted((ROOT / "docs" / "skript").glob("*.md")):
        for nr, zeile in enumerate(datei.read_text(encoding="utf-8").splitlines(), 1):
            m = ZEILE_RE.match(zeile)
            if not m:
                continue
            zid = m.group(1).replace("\\", "")
            zeilen[zid] = f"{datei.relative_to(ROOT)}:{nr}"
            if "Reserve, kommt nicht vor" in zeile:
                reserve.add(zid)

    fehler = [i for i in fehlend if i not in reserve]
    for i in fehlend:
        art = "Reserve" if i in reserve else "FEHLT  "
        print(f"{art}  {i}  ({zeilen.get(i, '?')})")
    print(f"{len(ids)} Zeilen, {len(fehlend) - len(fehler)} Reserve, {len(fehler)} kommen im Spiel nicht vor.")
    if pruefen and fehler:
        sys.exit(1)


if __name__ == "__main__":
    main()
