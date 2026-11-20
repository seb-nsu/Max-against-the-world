"""Gemalte Lauf-Einzelbilder (freigestellt) zu einem Streifen: jedes Bild an der Rumpflänge auf denselben Maßstab,
gemeinsame Bodenlinie, ausgerichtet an der Rumpfmitte, ohne Palettenzwang, Kontur 262b44, Auge gelbgrün.
Aufruf: py -3 katze_gemalt.py ordner_mit_1..8.png ziel_ohne_endung [rumpf_px]"""
import sys, json
from pathlib import Path
import numpy as np
from PIL import Image
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import figur

ordner, ziel = Path(sys.argv[1]), sys.argv[2]; RUMPF = int(sys.argv[3]) if len(sys.argv) > 3 else 36
figur.LINIEN = 0.4; figur.SAETTIGUNG = 1.0
AUGE = np.array([0xc5, 0xe0, 0x3a])
teile = []
for i in range(1, 9):
    rgba = np.asarray(Image.open(ordner / f"{i}.png").convert("RGBA"))
    rgb = np.ascontiguousarray(rgba[..., :3]); m = rgba[..., 3] > 127
    ys, xs = np.nonzero(m); r = (xs.min(), ys.min(), xs.max() + 1, ys.max() + 1)
    # Rumpflänge: breiteste Zeile im mittleren Drittel zwischen Rücken und Bauch
    zeilen = m[r[1]:r[3]].sum(1); h = r[3] - r[1]
    band = zeilen[int(h * 0.45):int(h * 0.75)]
    s = RUMPF / float(band.max())
    klein, alpha = figur.verkleinern(rgb, ~m, r, 0, s, m)
    # Auge: gelbgrüne Pixel im Original -> Zielpixel
    gelb = m & (rgb[..., 0] > 140) & (rgb[..., 1] > 150) & (rgb[..., 2] < 140)
    gy, gx = np.nonzero(gelb)
    b = figur.fertig(klein, alpha, "keine", True, "262b44", False)
    if len(gy):
        ay = int((gy.mean() - r[1]) * s); ax = int((gx.mean() - r[0]) * s)
        ay = min(max(ay, 0), b.shape[0] - 1); ax = min(max(ax, 0), b.shape[1] - 1)
        b[ay, ax, :3] = AUGE; b[ay, ax, 3] = 255
    teile.append(b)
H = max(t.shape[0] for t in teile) + 2
def mitte(t):
    a = t[..., 3] > 0; hh = a.shape[0]; xs = np.nonzero(a[int(hh * 0.45):int(hh * 0.75)])[1]; return xs.mean()
mx = [mitte(t) for t in teile]
links = max(mx); rechts = max(t.shape[1] - m_ for t, m_ in zip(teile, mx))
W = int(np.ceil(links + rechts)) + 4
aus = []
for t, m_ in zip(teile, mx):
    f = np.zeros((H, W, 4), np.uint8); x = int(round(2 + links - m_)); y = H - 1 - t.shape[0]
    f[y:y + t.shape[0], x:x + t.shape[1]] = t; aus.append(f)
Image.fromarray(np.concatenate(aus, 1)).save(ziel + ".png")
json.dump({"bild": [W, H], "bilder": 8, "ms": 110, "schleife": True, "folge": [str(i) for i in range(1, 9)],
           "hinweis": "gemalt (Gemini) nach Blender-Posen, katze_gemalt.py"}, open(ziel + ".json", "w"), indent=1)
print(ziel, W, H, [t.shape for t in teile])
