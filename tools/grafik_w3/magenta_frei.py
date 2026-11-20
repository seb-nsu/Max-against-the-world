"""Magenta-Hintergrund (auch Verlauf) freistellen und Magenta-Stich in durchscheinenden Teilen entfärben.

Aufruf: py -3 magenta_frei.py quelle ziel.png [rand]
rand (Standard 1000): Pixel links und rechts anfügen. Konzeptblätter mit breiten Figuren brauchen das, sonst hält
tools/figur.py den Oberkörper für eine Bodenlinie (Zeile über die halbe Bildbreite) und schneidet die Figur.
Für Posenbögen rand 0. Viertes Argument „ohne“: keinen Magenta-Stich entfärben (Figuren mit echtem Rosa oder Lila)."""
import sys
import numpy as np
from PIL import Image
from scipy import ndimage
a = np.asarray(Image.open(sys.argv[1]).convert("RGB")).astype(int)
r, g, b = a[..., 0], a[..., 1], a[..., 2]
mag = (r > 140) & (b > 140) & (g < 140) & (r - g > 70) & (b - g > 70)
lab, n = ndimage.label(~mag)
groesse = ndimage.sum(np.ones_like(lab), lab, range(1, n + 1))
behalten = np.zeros(n + 1, bool); behalten[1:] = groesse > 400
fg = behalten[lab]
fg = ndimage.binary_fill_holes(fg) & ~(mag & ~ndimage.binary_erosion(fg, iterations=1))
out = np.dstack([a.astype(np.uint8), (fg * 255).astype(np.uint8)])
P = int(sys.argv[3]) if len(sys.argv) > 3 else 1000
out = np.pad(out, ((0, 0), (P, P), (0, 0)))
Image.fromarray(out, "RGBA").save(sys.argv[2])
# Magenta-Stich in durchscheinenden Teilen (Poncho, Regentropfen) entfärben: rosa -> kühles Grau-Blau
if len(sys.argv) > 4 and sys.argv[4] == "ohne":
    sys.exit(0)
o = np.asarray(Image.open(sys.argv[2])).copy()
r, g, b = (o[..., i].astype(int) for i in range(3))
stich = (o[..., 3] > 0) & (r - g > 25) & (b - g > 25) & (np.abs(r - b) < 90)
o[stich, 0] = np.clip(g[stich] + (b[stich] - g[stich]) * 0.25, 0, 255)
Image.fromarray(o, "RGBA").save(sys.argv[2])
print(sys.argv[2], "Magenta-Stich entfärbt:", int(stich.sum()))
