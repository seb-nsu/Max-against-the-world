"""Kleines Sprite an die Stelle im Hintergrund angleichen, damit es nicht wie aufgeklebt wirkt
(Sebastian, 13. November 2026: „man sieht sie zu deutlich“).

- Farben ein Stück zur mittleren Farbe der Umgebung ziehen (Raumlicht) und etwas entsättigen,
- den dunklen Umriss (Spiel-Kontur #262b44) durch die dunkelste Farbe der Umgebung ersetzen,
- insgesamt etwas abdunkeln, wenn die Umgebung dunkel ist.

Aufruf: py -3 tools/angleichen.py sprite.png hintergrund.png X Y B H [ziel.png] [--staerke 0.3]
X Y B H: Rechteck im Hintergrund, in dem das Sprite liegt (Spielpixel)."""
import argparse
import colorsys

import numpy as np
from PIL import Image

ap = argparse.ArgumentParser()
ap.add_argument("sprite"); ap.add_argument("hintergrund")
ap.add_argument("x", type=int); ap.add_argument("y", type=int); ap.add_argument("b", type=int); ap.add_argument("h", type=int)
ap.add_argument("ziel", nargs="?")
ap.add_argument("--staerke", type=float, default=0.3)
a = ap.parse_args()

sp = np.asarray(Image.open(a.sprite).convert("RGBA")).astype(float)
bg = np.asarray(Image.open(a.hintergrund).convert("RGB")).astype(float)
rand = 12
umg = bg[max(0, a.y - rand):a.y + a.h + rand, max(0, a.x - rand):a.x + a.b + rand]
px = umg.reshape(-1, 3)
mittel = px.mean(0)
hell = px.sum(1)
dunkel = px[hell <= np.percentile(hell, 8)].mean(0)
lum_umg = mittel.mean() / 255.0

rgb, al = sp[..., :3], sp[..., 3]
sichtbar = al > 0
# Umriss: sehr dunkle, bläuliche Pixel (Spielkontur)
summe = rgb.sum(2)
umriss = sichtbar & (summe < 170)
k = a.staerke
neu = rgb * (1 - k) + mittel * k
# entsättigen um 20 Prozent der Stärke
grau = neu.mean(2, keepdims=True)
neu = neu * (1 - 0.6 * k) + grau * (0.6 * k)
# in dunkler Umgebung abdunkeln
if lum_umg < 0.45:
    neu *= 0.75 + 0.5 * lum_umg
neu[umriss] = dunkel * 0.9
out = sp.copy()
out[..., :3] = np.clip(neu, 0, 255)
Image.fromarray(out.astype(np.uint8), "RGBA").save(a.ziel or a.sprite)
print(a.ziel or a.sprite, "Umgebung", mittel.round(), "dunkel", dunkel.round(), "Helligkeit", round(lum_umg, 2))
