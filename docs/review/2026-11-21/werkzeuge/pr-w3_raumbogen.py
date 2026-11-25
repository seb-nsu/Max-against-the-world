#!/usr/bin/env python3
"""Kontaktbogen aus Raumaufnahmen (pr-w3): pr-w3_raumbogen.py ZIEL.png SPALTEN BILD1 BILD2 ...
Breite Bilder werden auf 640 px Breite verkleinert; unter jedem Bild steht der Dateiname."""
import sys, os
from PIL import Image, ImageDraw
ziel, spalten, bilder = sys.argv[1], int(sys.argv[2]), sys.argv[3:]
B, H = 640, 360
zeilen = (len(bilder) + spalten - 1) // spalten
bogen = Image.new("RGB", (spalten * (B + 6), zeilen * (H + 20)), "white")
z = ImageDraw.Draw(bogen)
for n, p in enumerate(bilder):
    b = Image.open(p).convert("RGB")
    if b.width != B:
        b = b.resize((B, max(1, round(b.height * B / b.width))), Image.NEAREST)
    x, y = (n % spalten) * (B + 6), (n // spalten) * (H + 20)
    bogen.paste(b.crop((0, 0, B, min(H, b.height))), (x, y))
    z.text((x + 4, y + H + 3), os.path.basename(p), fill="black")
bogen.save(ziel)
print(ziel, bogen.size)
