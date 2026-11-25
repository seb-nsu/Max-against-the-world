#!/usr/bin/env python3
"""Kontaktbogen aus einem Film-Ordner, verkleinert (pr-w3):
pr-w3_filmbogen.py FILMORDNER ZIEL.png [ANZAHL=12] [SPALTEN=4] [VON BIS] [x y w h] [FAKTOR=0.6667]
Nimmt ANZAHL Bilder gleichmäßig zwischen VON und BIS, optional einen Ausschnitt, und schreibt die Bildnummer dazu."""
import sys, glob, os
from PIL import Image, ImageDraw
a = sys.argv
ordner, ziel = a[1], a[2]
anzahl = int(a[3]) if len(a) > 3 else 12
spalten = int(a[4]) if len(a) > 4 else 4
d = sorted(glob.glob(os.path.join(ordner, "b_*.png")))
von = int(a[5]) if len(a) > 5 else 0
bis = min(int(a[6]) if len(a) > 6 else len(d) - 1, len(d) - 1)
box = tuple(map(int, a[7:11])) if len(a) > 10 else (0, 0, 640, 360)
f = float(a[11]) if len(a) > 11 else 2 / 3
w, h = round(box[2] * f), round(box[3] * f)
idx = sorted(set(von + round(i * (bis - von) / max(1, anzahl - 1)) for i in range(anzahl)))
zeilen = (len(idx) + spalten - 1) // spalten
bogen = Image.new("RGB", (spalten * (w + 3), zeilen * (h + 3)), "white")
z = ImageDraw.Draw(bogen)
for n, i in enumerate(idx):
    b = Image.open(d[i]).convert("RGB").crop((box[0], box[1], box[0] + box[2], box[1] + box[3]))
    b = b.resize((w, h), Image.NEAREST if f >= 1 else Image.BILINEAR)
    x, y = (n % spalten) * (w + 3), (n // spalten) * (h + 3)
    bogen.paste(b, (x, y)); z.text((x + 3, y + 2), str(i), fill="yellow")
bogen.save(ziel); print(ziel, bogen.size, len(d), "Bilder")
