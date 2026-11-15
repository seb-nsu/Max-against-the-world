"""Korrekturen an fertigen Spiel-Sprites (Prüfung g2, 15.11.2026).
Kopie aus E:/Game Engine/Grafiken/3d/skripte (läuft lokal; Pfade zeigen auf die Asset-Ordner auf Sebastians Rechner).

py -3 -B sprite_korrektur.py <sprite.png> <figur-id> [--json <daten.json>] [--aus <ziel.png>] [--trocken]

  sprite.png   Spielbogen, wird an Ort und Stelle überschrieben (außer --aus / --trocken)
  figur-id     beamter_2 | archimedes | archimedes_handtuch | cicero | schreiber
  --json       Figurendaten mit "bild": [Breite, Höhe] der Zelle
               (Standard: E:\\Claude\\cq-einbau\\game\\daten\\figuren\\<id>.json)
  --trocken    nur zählen, nichts schreiben

Was je Figur passiert (jede Zelle des Bogens einzeln):
  beamter_2   Stempelkopf #193c3e -> #733e39 (nur im Stempelbereich x 77-90, y 33-53 der Zelle;
              Haare und Gürtel bleiben grün); grüne Einzelpixel an Beinen/Sandalen (y >= 100)
              -> #b86f50, wie in den Bewegungen
  archimedes, archimedes_handtuch, cicero, schreiber
              magenta-nahe Pixel -> häufigste Nachbarfarbe (am Rand: durchsichtig);
              dabei neu entstandene Einzelpixel werden entfernt
  cicero      zusätzlich kleine eingeschlossene Löcher (<= 6 px) ab Zeile 180 der Zelle
              (Sandalensohle) mit der Nachbarfarbe füllen
Das Skript ist idempotent: ein zweiter Lauf ändert nichts mehr.
"""
import argparse, json
from collections import Counter
from pathlib import Path
import numpy as np
from PIL import Image
from scipy import ndimage

GRUEN = np.array([0x19, 0x3c, 0x3e], np.uint8)
DUNKELBRAUN = np.array([0x73, 0x3e, 0x39], np.uint8)
SANDALE = np.array([0xb8, 0x6f, 0x50], np.uint8)
STEMPEL_BOX = (77, 33, 91, 54)   # x0, y0, x1, y1 in der Zelle (beamter_2, 90x198)


def magenta_maske(z):
    r, g, b = (z[..., i].astype(int) for i in range(3))
    return (z[..., 3] > 0) & (r > 140) & (b > 120) & (g < 110) & (r - g > 60) & (b - g > 50)


def inseln(al):
    lab, n = ndimage.label(al, structure=np.ones((3, 3)))
    gr = ndimage.sum(al, lab, range(1, n + 1))
    return {tuple(np.argwhere(lab == l + 1)[0]) for l, g in enumerate(gr) if g == 1}


def entmagenta(z):
    mag = magenta_maske(z)
    if not mag.any():
        return 0
    vorher = inseln(z[..., 3] > 0)
    H, W = mag.shape
    for y, x in zip(*np.nonzero(mag)):
        nb, trans = [], 0
        for dy in (-1, 0, 1):
            for dx in (-1, 0, 1):
                yy, xx = y + dy, x + dx
                if (dy or dx) and 0 <= yy < H and 0 <= xx < W:
                    if z[yy, xx, 3] == 0:
                        trans += 1
                    elif not mag[yy, xx]:
                        nb.append(tuple(z[yy, xx, :3]))
        if trans >= 4 or not nb:
            z[y, x] = 0
        else:
            z[y, x, :3] = Counter(nb).most_common(1)[0][0]
    for y, x in inseln(z[..., 3] > 0) - vorher:
        z[y, x] = 0
    return int(mag.sum())


def loecher(z, max_px=6, ab_y=180):
    al = z[..., 3] > 0
    lab, n = ndimage.label(~al)
    rand = set(np.unique(np.concatenate([lab[0], lab[-1], lab[:, 0], lab[:, -1]])))
    gef = 0
    for l in range(1, n + 1):
        if l in rand:
            continue
        m = lab == l
        if m.sum() > max_px or np.nonzero(m)[0].min() < ab_y:
            continue
        nb = ndimage.binary_dilation(m) & ~m & al
        z[m] = Counter(map(tuple, z[nb])).most_common(1)[0][0]
        gef += int(m.sum())
    return gef


def stempel(z):
    x0, y0, x1, y1 = STEMPEL_BOX
    sub = z[y0:y1, x0:x1]
    m = (sub[..., 3] > 0) & np.all(sub[..., :3] == GRUEN, -1)
    sub[m, :3] = DUNKELBRAUN
    unten = z[100:]
    m2 = (unten[..., 3] > 0) & np.all(unten[..., :3] == GRUEN, -1)
    unten[m2, :3] = SANDALE
    return int(m.sum()), int(m2.sum())


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("sprite"); ap.add_argument("id")
    ap.add_argument("--json"); ap.add_argument("--aus"); ap.add_argument("--trocken", action="store_true")
    a = ap.parse_args()
    jp = Path(a.json) if a.json else Path(r"E:\Claude\cq-einbau\game\daten\figuren") / f"{a.id}.json"
    cw, ch = json.loads(jp.read_text(encoding="utf-8"))["bild"]
    s = np.asarray(Image.open(a.sprite).convert("RGBA")).copy()
    nx, ny = s.shape[1] // cw, s.shape[0] // ch
    summe = Counter()
    for j in range(ny):
        for i in range(nx):
            z = s[j * ch:(j + 1) * ch, i * cw:(i + 1) * cw]   # Ansicht, Änderungen gehen in s
            if not (z[..., 3] > 0).any():
                continue
            if a.id == "beamter_2":
                st, sa = stempel(z); summe["Stempel"] += st; summe["Beine"] += sa
            if a.id in ("archimedes", "archimedes_handtuch", "cicero", "schreiber"):
                summe["Magenta"] += entmagenta(z)
            if a.id == "cicero":
                summe["Löcher"] += loecher(z)
    print(f"{a.id}: {nx * ny} Zellen {cw}x{ch}, geändert: " + (", ".join(f"{k} {v} px" for k, v in summe.items()) or "nichts"))
    if not a.trocken:
        ziel = a.aus or a.sprite
        Image.fromarray(s, "RGBA").save(ziel)
        print("geschrieben:", ziel)


if __name__ == "__main__":
    main()
