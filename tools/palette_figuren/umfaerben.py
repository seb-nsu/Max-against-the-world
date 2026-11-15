#!/usr/bin/env python3
"""Umfärben ohne Aseprite (gleiches Ergebnis wie umfaerben.lua): jede Pixelfarbe, die in der Tabelle
<figur>.csv steht, wird durch die neue ersetzt (exakter RGB-Vergleich, Alpha bleibt).

Aufruf: python3 tools/palette_figuren/umfaerben.py moderwort zeldina maklerin
"""
import csv
import sys
from pathlib import Path

from PIL import Image

HIER = Path(__file__).resolve().parent
SPIEL = HIER.parent.parent / "game"


def farbe(text):
    t = text.strip().lstrip("#")
    return tuple(int(t[i:i + 2], 16) for i in (0, 2, 4))


def main():
    for fid in sys.argv[1:]:
        with open(HIER / f"{fid}.csv", newline="", encoding="utf-8") as f:
            zeilen = [z for z in f if not z.startswith("# ")]   # Kommentarzeilen
            karte = {farbe(z["alt"]): farbe(z["neu"]) for z in csv.DictReader(zeilen, delimiter=";")}
        pfad = SPIEL / "grafik" / "figuren" / f"{fid}.png"
        im = Image.open(pfad).convert("RGBA")
        px = im.load()
        n = 0
        for y in range(im.size[1]):
            for x in range(im.size[0]):
                r, g, b, a = px[x, y]
                if a and (r, g, b) in karte:
                    px[x, y] = karte[(r, g, b)] + (a,)
                    n += 1
        im.save(pfad)
        print(f"{fid}: {len(karte)} Farben, {n} Pixel umgefärbt")


if __name__ == "__main__":
    main()
