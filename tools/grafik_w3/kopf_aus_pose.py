"""Kopf eines Stand-Sprites durch den Kopf aus einer Pose ersetzen (Review 20.11., W3-15: Morphäus hat im Stand die
Brille auf den Augen und ein dunkleres Gesicht, in allen Posen die Brille auf der Stirn). Kein Neumalen: Der Kopf
kommt Pixel für Pixel aus einem vorhandenen Posenbild, ausgerichtet an der besten Umriss-Überdeckung (IoU) der
obersten 30 Zeilen. Ersetzt werden nur die Zeilen bis <schnitt> (gezählt ab der obersten Zeile der Figur), darunter
bleibt der Stand (Kragen, Mantel, Arme).

Aufruf: py -3 kopf_aus_pose.py <stand.png> <bewegung.json> <bild-kennung> <schnitt> <ausgabe.png>
  Morphäus: stand/morphaeus.png bewegungen/morphaeus_schild_umdrehen.json P1 36 (IoU 0,99, Lage 4,0)
Danach reden_ruhe.py (Mundstelle prüfen), stelle_uebertragen.py … weit (Stand-Bilder in Gesten und Gang) und
figuren_einbau.py.
"""
import json
import sys
from pathlib import Path

import numpy as np
from PIL import Image

KOPF = 30


def oben(b):
    return int(np.nonzero(b[..., 3].any(axis=1))[0].min())


def main():
    stand = np.array(Image.open(sys.argv[1]).convert("RGBA"))
    j = Path(sys.argv[2])
    kennung, schnitt, aus = sys.argv[3], int(sys.argv[4]), Path(sys.argv[5])
    info = json.load(open(j, encoding="utf-8"))
    n = int(info["bilder"])
    streifen = np.array(Image.open(j.with_suffix(".png")).convert("RGBA"))
    w = streifen.shape[1] // n
    i = info["folge"].index(kennung)
    pose = streifen[:, i * w:(i + 1) * w].copy()
    stand[stand[..., 3] == 0] = 0
    pose[pose[..., 3] == 0] = 0
    ts, tp = oben(stand), oben(pose)
    sm = stand[ts:ts + KOPF, :, 3] > 0
    best = (-1.0, 0, 0)
    for dy in range(-4, 5):
        for dx in range(-(w + stand.shape[1]) // 2, (w + stand.shape[1]) // 2):
            pm = np.zeros_like(sm)
            for y in range(KOPF):
                Y = tp + y + dy
                if not 0 <= Y < pose.shape[0]:
                    continue
                xa, xb = max(0, -dx), min(sm.shape[1], w - dx)
                if xb > xa:
                    pm[y, xa:xb] = pose[Y, xa + dx:xb + dx, 3] > 0
            iou = (sm & pm).sum() / max((sm | pm).sum(), 1)
            if iou > best[0]:
                best = (iou, dx, dy)
    iou, dx, dy = best
    if iou < 0.9:
        sys.exit(f"Kopf passt nicht (IoU {iou:.2f}); andere Pose wählen")
    neu = stand.copy()
    for y in range(-ts, schnitt):
        Y = tp + y + dy
        if 0 <= ts + y < neu.shape[0] and 0 <= Y < pose.shape[0]:
            zeile = np.zeros((stand.shape[1], 4), np.uint8)
            xa, xb = max(0, -dx), min(stand.shape[1], w - dx)
            zeile[xa:xb] = pose[Y, xa + dx:xb + dx]
            neu[ts + y] = zeile
    Image.fromarray(neu, "RGBA").save(aus)
    print(f"Kopf aus {j.stem}:{kennung}, IoU {iou:.2f}, Lage {dx},{dy}, {int((neu != stand).any(axis=2).sum())} px geändert")


if __name__ == "__main__":
    main()
