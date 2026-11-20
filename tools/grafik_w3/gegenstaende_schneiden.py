"""Gegenstände aus einem freigestellten Sammelbild (magenta_frei.py) als zusammenhängende Flächen ausschneiden,
in Lesereihenfolge (Zeile für Zeile, links nach rechts), längste Seite = Größe, ohne Palettenzwang, Kontur 262b44.
Aufruf: py -3 gegenstaende_schneiden.py frei.png ordner name1:groesse,name2:groesse,… [spaltenluecke]   („-“ überspringt)"""
import sys
from pathlib import Path
import numpy as np
from PIL import Image
from scipy import ndimage
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import figur

quelle, ordner = sys.argv[1], Path(sys.argv[2]); ordner.mkdir(parents=True, exist_ok=True)
namen = [t.split(":") for t in sys.argv[3].split(",")]
figur.LINIEN = 0.4; figur.SAETTIGUNG = 1.2
rgba = np.asarray(Image.open(quelle).convert("RGBA"))
rgb = np.ascontiguousarray(rgba[..., :3]); m = rgba[..., 3] > 127
# Zeilen und Spalten über Lücken in der Projektion trennen (zerfallene Teile wie Dampf, Scherben,
# Konfetti oder Uhrgewichte bleiben so bei ihrem Gegenstand)
H, W = m.shape
reihe = []
for y0, y1 in figur.abschnitte(m.any(1), max(8, H // 40)):
    for x0, x1 in figur.abschnitte(m[y0:y1].any(0), int(sys.argv[4]) if len(sys.argv) > 4 else max(8, W // 60)):
        mm = np.zeros_like(m); mm[y0:y1, x0:x1] = m[y0:y1, x0:x1]
        if mm.sum() < 400:
            continue
        ys, xs = np.nonzero(mm)
        reihe.append((0, 0, (xs.min(), ys.min(), xs.max() + 1, ys.max() + 1), mm))
print(len(reihe), "Gegenstände gefunden,", len(namen), "Namen")
for (name, groesse), (_, _, r, mm) in zip(namen, reihe):
    if name == "-":
        continue
    g = int(groesse); x0, y0, x1, y1 = r
    h = max(1, round(g * (y1 - y0) / max(x1 - x0, y1 - y0)))
    k, a = figur.verkleinern(rgb, ~mm, r, h, None, mm)
    Image.fromarray(figur.fertig(k, a, "keine", True, "262b44", False), "RGBA").save(ordner / f"{name}.png")
    print(name, (x1 - x0, y1 - y0), "->", g)
