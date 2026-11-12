#!/usr/bin/env python3
"""Konzeptbild (Gemini) -> Pixelart-Hintergrund ohne KI und ohne Größengrenze.

Aufs Zielformat zuschneiden (Standard 16:9), je Zielpixel einen 4×4-Block mit k-Centroid (k=2) auf die vorherrschende Farbe bringen
(Kanten bleiben hart), 32 eigene Farben per k-Means in OKLab (Farbigkeit doppelt gewichtet), Streupixel
entfernen. Ersetzt Neural Pixelate von Retro Diffusion (docs/grafik/00-stil-und-werkzeuge.md, Ablauf).

Aufruf:  python3 tools/pixelieren.py original.jpg ziel.png [BREITE HOEHE]   (Standard tools/aufloesung.py)

Gemeinsame Raumpalette (vorbereitet, Prüfbericht Fund 29): Statt je Bild 32 eigene Farben zu wählen,
kann eine feste Palette für mehrere Räume gelten, damit die Bilder eines Abschnitts Farben teilen.
  python3 tools/pixelieren.py --palette-bestimmen raum.hex [--farben 56] bild1 bild2 …
      bestimmt aus mehreren Vorlagen (Originale oder fertige Hintergründe) eine gemeinsame Palette
      und schreibt sie als Textdatei, eine Farbe je Zeile (#rrggbb)
  python3 tools/pixelieren.py original.jpg ziel.png [BREITE HOEHE] --palette raum.hex
      rechnet das Bild auf genau diese Palette (jede Farbe auf die nächste in OKLab)
"""
import sys
from pathlib import Path

import numpy as np
from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parent))
from aufloesung import BREITE, HOEHE  # noqa: E402

F = 4  # Vorlage wird auf das Vierfache der Zielgröße gebracht, je Zielpixel ein 4×4-Block


def verkleinern(src, W, H):
    """Aufs Seitenverhältnis W:H zuschneiden (16:9, bei Breitwandräumen wie dem Dorfplatz 1280×360
    entsprechend breiter) und mit k-Centroid (k=2) auf W×H bringen; Kanten bleiben hart."""
    im = Image.open(src).convert("RGB")
    w, h = im.size
    if w / h > W / H:
        nw = round(h * W / H); im = im.crop(((w - nw) // 2, 0, (w - nw) // 2 + nw, h))
    else:
        nh = round(w * H / W); im = im.crop((0, (h - nh) // 2, w, (h - nh) // 2 + nh))
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


GEWICHT = np.array([1.0, 2.0, 2.0])   # Farbigkeit stärker gewichten, damit kräftige Töne eine eigene Farbe bekommen


def palette_finden(px, n):
    """n Farben für die Pixel px (N×3, float32) per k-Means in OKLab; liefert Palette und Zuordnung."""
    lab = oklab(px) * GEWICHT
    bild = Image.fromarray(px.astype(np.uint8).reshape(1, -1, 3))
    k0 = np.asarray(bild.quantize(n, method=Image.Quantize.MEDIANCUT, dither=Image.Dither.NONE)).ravel()
    zent = np.array([lab[k0 == i].mean(0) if (k0 == i).any() else lab[0] for i in range(n)])
    for _ in range(20):
        d = ((lab[:, None, :] - zent[None]) ** 2).sum(-1); z = d.argmin(1)
        for i in range(n):
            s = z == i
            zent[i] = lab[s].mean(0) if s.any() else lab[d.min(1).argmax()]
    pal = np.array([np.median(px[z == i], 0) if (z == i).any() else [0, 0, 0] for i in range(n)]).astype(np.uint8)
    return pal, z


def palette_lesen(pfad):
    """Palette aus einer Textdatei: eine Farbe je Zeile als #rrggbb; Leerzeilen und Kommentare (;) zählen nicht."""
    farben = []
    for zeile in Path(pfad).read_text(encoding="utf-8").splitlines():
        z = zeile.split(";")[0].strip().lstrip("#")
        if z:
            farben.append([int(z[i:i + 2], 16) for i in (0, 2, 4)])
    if not farben:
        sys.exit(f"{pfad}: keine Farben gefunden")
    return np.array(farben, dtype=np.uint8)


def palette_bestimmen(ziel, bilder, n=56, W=BREITE, H=HOEHE):
    """Gemeinsame Palette für mehrere Räume: alle Bilder verkleinern, Pixel mischen, n Farben suchen."""
    rng = np.random.default_rng(1)   # fester Zufall: gleiche Eingabe, gleiche Palette
    teile = []
    for b in bilder:
        px = verkleinern(b, W, H).reshape(-1, 3)
        teile.append(px[rng.choice(len(px), min(len(px), 60000), replace=False)])   # je Bild gleich viele Pixel
    pal, _ = palette_finden(np.concatenate(teile).astype(np.float32), n)
    pal = pal[np.lexsort((pal[:, 2], pal[:, 1], pal[:, 0]))]
    pal = np.unique(pal, axis=0)
    Path(ziel).write_text("".join("#%02x%02x%02x\n" % tuple(c) for c in pal), encoding="utf-8")
    return pal


def farben_32(klein, n=32, palette=None):
    """Bild (H×W×3, uint8) auf n eigene Farben bringen (k-Means in OKLab), Streupixel entfernen.
    Mit palette (K×3, uint8) stattdessen auf genau diese Farben rechnen."""
    H, W = klein.shape[:2]
    px = klein.reshape(-1, 3).astype(np.float32)
    if palette is None:
        pal, z = palette_finden(px, n)
    else:
        pal = palette
        ziel = oklab(pal.astype(np.float32)) * GEWICHT
        lab = oklab(px) * GEWICHT
        z = np.concatenate([((lab[i:i + 50000, None, :] - ziel[None]) ** 2).sum(-1).argmin(1)
                            for i in range(0, len(lab), 50000)])
    idx = z.reshape(H, W).astype(np.uint8)
    # Streupixel: Pixel, dessen vier Nachbarn alle dieselbe andere Farbe haben
    for _ in range(2):
        p = np.pad(idx, 1, mode="edge")
        o, u, l, r = p[:-2, 1:-1], p[2:, 1:-1], p[1:-1, :-2], p[1:-1, 2:]
        s = (o == u) & (u == l) & (l == r) & (o != idx)
        idx[s] = o[s]
    return Image.fromarray(pal[idx])


def main():
    arg = sys.argv[1:]
    if arg[:1] == ["--palette-bestimmen"]:
        n = 56
        if "--farben" in arg:
            i = arg.index("--farben"); n = int(arg[i + 1]); del arg[i:i + 2]
        if len(arg) < 3:
            sys.exit(__doc__)
        pal = palette_bestimmen(arg[1], arg[2:], n)
        print(arg[1], len(pal), "Farben aus", len(arg) - 2, "Bildern")
        return
    palette = None
    if "--palette" in arg:
        i = arg.index("--palette"); palette = palette_lesen(arg[i + 1]); del arg[i:i + 2]
    if len(arg) not in (2, 4):
        sys.exit(__doc__)
    src, out = arg[0], arg[1]
    W, H = (int(arg[2]), int(arg[3])) if len(arg) == 4 else (BREITE, HOEHE)
    e = farben_32(verkleinern(src, W, H), palette=palette)
    e.save(out)
    print(out, e.size, len(e.getcolors(999)))


if __name__ == "__main__":
    main()
