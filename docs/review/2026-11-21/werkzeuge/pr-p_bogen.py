#!/usr/bin/env python3
"""Kontaktbogen aus einem Film-Ordner der Fernsteuerung (pr-p).
Aufruf: pr-p_bogen.py FILMORDNER ZIEL.png x y w h SPALTEN [VON BIS] [ANZAHL] [SKALA]
Nimmt ANZAHL Bilder gleichmäßig zwischen VON und BIS (Bildnummern), schneidet aus und setzt sie in ein Raster."""
import sys, glob, os
from PIL import Image, ImageDraw
ordner, ziel = sys.argv[1], sys.argv[2]
x, y, w, h, spalten = map(int, sys.argv[3:8])
dateien = sorted(glob.glob(os.path.join(ordner, "b_*.png")))
von = int(sys.argv[8]) if len(sys.argv) > 8 else 0
bis = int(sys.argv[9]) if len(sys.argv) > 9 else len(dateien) - 1
anzahl = int(sys.argv[10]) if len(sys.argv) > 10 else 20
skala = int(sys.argv[11]) if len(sys.argv) > 11 else 1
bis = min(bis, len(dateien) - 1)
idx = [von + round(i * (bis - von) / max(1, anzahl - 1)) for i in range(anzahl)]
zeilen = (anzahl + spalten - 1) // spalten
bogen = Image.new("RGB", (spalten * (w * skala + 4), zeilen * (h * skala + 4)), "white")
for n, i in enumerate(idx):
    b = Image.open(dateien[i]).convert("RGB").crop((x, y, x + w, y + h))
    if skala > 1:
        b = b.resize((w * skala, h * skala), Image.NEAREST)
    ImageDraw.Draw(b).text((2, 2), str(i), fill=(255, 255, 0))
    bogen.paste(b, ((n % spalten) * (w * skala + 4), (n // spalten) * (h * skala + 4)))
bogen.save(ziel)
print(ziel, bogen.size, len(dateien), "Bilder")
