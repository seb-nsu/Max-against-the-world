"""M.U.T.T.I. in Ruhe: die rosa Lockenwickler-Antennen wippen, die Maschine sinkt kurz um einen Pixel.
Ein Rig dreht hier zu viel mit (Nähte im Gehäuse), deshalb werden nur die Antennenpixel samt Kontur verschoben.
Aufruf: py -3 mutti_ruhe.py <stand/mutti.png> <ausgabe/mutti_idle.png>"""
import sys
import numpy as np
from PIL import Image
from scipy import ndimage

st = np.asarray(Image.open(sys.argv[1]).convert("RGBA")).copy()
r, g, b = (st[..., i].astype(int) for i in range(3))
pink = (st[..., 3] > 0) & (r > 180) & (r - g > 40) & (b > 100)
pink[:70] = False; pink[130:] = False
lab, n = ndimage.label(pink); gr = ndimage.sum(pink, lab, range(1, n + 1))
pink = np.isin(lab, [i + 1 for i, v in enumerate(gr) if v > 30])
maske = ndimage.binary_dilation(pink, iterations=1) & (st[..., 3] > 0)
H, W = st.shape[:2]


def verschieben(dy):
    f = st.copy()
    if dy == 0:
        return f
    ys, xs = np.nonzero(maske)
    for y, x in zip(ys, xs):   # frei werdende Stellen mit dem Gehäuse darunter füllen
        y3 = min(y + 3, H - 1); y6 = min(y + 6, H - 1)
        f[y, x] = st[y3, x] if not maske[y3, x] else st[y6, x]
    for y, x in zip(ys, xs):
        f[y + dy, x] = st[y, x]
    return f


bilder = []
for dy, koerper in ((0, 0), (-1, 0), (-2, 1), (-1, 1), (0, 0), (0, 0)):
    f = np.zeros((H + 4, W, 4), np.uint8)
    f[2 + koerper:2 + koerper + H] = verschieben(dy)
    bilder.append(f)
Image.fromarray(np.concatenate(bilder, 1)).save(sys.argv[2])
print(sys.argv[2], "6 Bilder, 260 ms, Schleife")
