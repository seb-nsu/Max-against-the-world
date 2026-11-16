#!/usr/bin/env python3
"""Verschiebt alle Bilder einer Bewegung im Sprite-Sheet einer Figur um dx, dy Pixel innerhalb ihrer Zelle.

Für Bewegungen, deren Körper nicht auf dem Fußpunkt des Stands liegt (die Figur springt beim Wechsel
zwischen Stand und Bewegung zur Seite). Was über den Zellrand geschoben würde, fällt weg; das Werkzeug
bricht ab, wenn dabei sichtbare Pixel verloren gingen.

Aufruf: python3 tools/sheet_verschieben.py FIGUR BEWEGUNG DX [DY]
"""
import json
import sys
from pathlib import Path

from PIL import Image

SPIEL = Path(__file__).resolve().parent.parent / "game"


def main():
    fid, anim, dx = sys.argv[1], sys.argv[2], int(sys.argv[3])
    dy = int(sys.argv[4]) if len(sys.argv) > 4 else 0
    d = json.loads((SPIEL / "daten" / "figuren" / f"{fid}.json").read_text())
    w, h = d["bild"]
    gesamt = max(a["von"] + a["bilder"] for a in d["animationen"].values())
    spalten = d.get("spalten", gesamt)
    pfad = SPIEL / "grafik" / "figuren" / f"{fid}.png"
    im = Image.open(pfad).convert("RGBA")
    a = d["animationen"][anim]
    for i in range(a["bilder"]):
        k = a["von"] + i
        x, y = (k % spalten) * w, (k // spalten) * h
        zelle = im.crop((x, y, x + w, y + h))
        bb = zelle.getbbox()
        if bb and (bb[0] + dx < 0 or bb[2] + dx > w or bb[1] + dy < 0 or bb[3] + dy > h):
            sys.exit(f"Bild {i}: sichtbare Pixel fielen aus der Zelle ({bb}, dx={dx}, dy={dy})")
        neu = Image.new("RGBA", (w, h), (0, 0, 0, 0))
        neu.paste(zelle, (dx, dy))
        im.paste(neu, (x, y))
    im.save(pfad)
    print(f"{fid} {anim}: {a['bilder']} Bilder um ({dx}, {dy}) verschoben")


if __name__ == "__main__":
    main()
