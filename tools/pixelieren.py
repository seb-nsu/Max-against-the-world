#!/usr/bin/env python3
"""Konzeptbild (Gemini) -> Pixelart-Hintergrund ohne KI und ohne Größengrenze.

16:9 zuschneiden, je Zielpixel einen 4×4-Block mit k-Centroid (k=2) auf die vorherrschende Farbe bringen
(Kanten bleiben hart), 32 eigene Farben per k-Means in OKLab (Farbigkeit doppelt gewichtet), Streupixel
entfernen. Ersetzt Neural Pixelate von Retro Diffusion (docs/grafik/00-stil-und-werkzeuge.md, Ablauf).

Aufruf:  python3 tools/pixelieren.py original.jpg ziel.png [BREITE HOEHE]   (Standard tools/aufloesung.py)
"""
import sys
from pathlib import Path

import numpy as np
from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parent))
from aufloesung import BREITE, HOEHE  # noqa: E402

F = 4  # Vorlage wird auf das Vierfache der Zielgröße gebracht, je Zielpixel ein 4×4-Block


def verkleinern(src, W, H):
    """16:9 zuschneiden und mit k-Centroid (k=2) auf W×H bringen; Kanten bleiben hart."""
    im = Image.open(src).convert("RGB")
    w, h = im.size
    if w / h > 16 / 9:
        nw = round(h * 16 / 9); im = im.crop(((w - nw) // 2, 0, (w - nw) // 2 + nw, h))
    else:
        nh = round(w * 9 / 16); im = im.crop((0, (h - nh) // 2, w, (h - nh) // 2 + nh))
    a = np.asarray(im.resize((W * F, H * F), Image.LANCZOS), dtype=np.float32)
    b = a.reshape(H, F, W, F, 3).transpose(0, 2, 1, 3, 4).reshape(H, W, F * F, 3)
    hell = b.mean(-1)
    c1 = np.take_along_axis(b, hell.argmin(-1)[..., None, None], 2)[:, :, 0]
    c2 = np.take_along_axis(b, hell.argmax(-1)[..., None, None], 2)[:, :, 0]
    for _ in range(6):
        d1 = ((b - c1[:, :, None]) ** 2).sum(-1); d2 = ((b - c2[:, :, None]) ** 2).sum(-1)
        m = (d1 <= d2)[..., None]
        n1 = m.sum(2); n2 = (~m).sum(2)
        c1 = np.where(n1 > 0, (b * m).sum(2) / np.maximum(n1, 1), c1)
        c2 = np.where(n2 > 0, (b * ~m).sum(2) / np.maximum(n2, 1), c2)
    return np.where(n1 >= n2, c1, c2).clip(0, 255).astype(np.uint8)


def oklab(rgb):
    c = rgb / 255.0
    c = np.where(c <= 0.04045, c / 12.92, ((c + 0.055) / 1.055) ** 2.4)
    M1 = np.array([[0.4122214708, 0.5363325363, 0.0514459929], [0.2119034982, 0.6806995451, 0.1073969566], [0.0883024619, 0.2817188376, 0.6299787005]])
    M2 = np.array([[0.2104542553, 0.7936177850, -0.0040720468], [1.9779984951, -2.4285922050, 0.4505937099], [0.0259040371, 0.7827717662, -0.8086757660]])
    return np.cbrt(c @ M1.T) @ M2.T


def farben_32(klein, n=32):
    """Bild (H×W×3, uint8) auf n eigene Farben bringen (k-Means in OKLab), Streupixel entfernen."""
    H, W = klein.shape[:2]
    px = klein.reshape(-1, 3).astype(np.float32)
    lab = oklab(px) * np.array([1.0, 2.0, 2.0])   # Farbigkeit stärker gewichten, damit kräftige Töne eine eigene Farbe bekommen
    k0 = np.asarray(Image.fromarray(klein).quantize(n, method=Image.Quantize.MEDIANCUT, dither=Image.Dither.NONE)).ravel()
    zent = np.array([lab[k0 == i].mean(0) if (k0 == i).any() else lab[0] for i in range(n)])
    for _ in range(20):
        d = ((lab[:, None, :] - zent[None]) ** 2).sum(-1); z = d.argmin(1)
        for i in range(n):
            s = z == i
            zent[i] = lab[s].mean(0) if s.any() else lab[d.min(1).argmax()]
    pal = np.array([np.median(px[z == i], 0) if (z == i).any() else [0, 0, 0] for i in range(n)]).astype(np.uint8)
    idx = z.reshape(H, W).astype(np.uint8)
    # Streupixel: Pixel, dessen vier Nachbarn alle dieselbe andere Farbe haben
    for _ in range(2):
        p = np.pad(idx, 1, mode="edge")
        o, u, l, r = p[:-2, 1:-1], p[2:, 1:-1], p[1:-1, :-2], p[1:-1, 2:]
        s = (o == u) & (u == l) & (l == r) & (o != idx)
        idx[s] = o[s]
    return Image.fromarray(pal[idx])


def main():
    if len(sys.argv) not in (3, 5):
        sys.exit(__doc__)
    src, out = sys.argv[1], sys.argv[2]
    W, H = (int(sys.argv[3]), int(sys.argv[4])) if len(sys.argv) == 5 else (BREITE, HOEHE)
    e = farben_32(verkleinern(src, W, H))
    e.save(out)
    print(out, e.size, len(e.getcolors(999)))


if __name__ == "__main__":
    main()
