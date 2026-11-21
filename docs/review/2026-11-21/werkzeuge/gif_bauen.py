#!/usr/bin/env python3
"""Baut aus einer Bildfolge der Fernsteuerung (ORDNER/filme/NAME/b_0001.png …) ein GIF.

  py -3 gif_bauen.py FILMORDNER ZIEL.gif [--ausschnitt x y w h] [--skala 1|2] [--jedes N] [--max-kb 600]

Standard: ganze Bilder 640×360 in einfacher Größe, 48 Farben. Ausschnitt in Spielpixeln hält die
Datei klein; --jedes 2 nimmt nur jedes zweite Bild. Die Bildrate steht in fps.txt des Filmordners.
Zusätzlich: --bogen ZIEL.png schreibt die Bilder als Kontaktbogen nebeneinander (für Einzelbildprüfung).
"""
import argparse
import glob
import os
import sys

from PIL import Image


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("ordner")
    ap.add_argument("ziel")
    ap.add_argument("--ausschnitt", nargs=4, type=int)
    ap.add_argument("--skala", type=int, default=1)
    ap.add_argument("--jedes", type=int, default=1)
    ap.add_argument("--max-kb", type=int, default=600)
    ap.add_argument("--bogen")
    ap.add_argument("--farben", type=int, default=48)
    a = ap.parse_args()
    dateien = sorted(glob.glob(os.path.join(a.ordner, "b_*.png")))[:: a.jedes]
    if not dateien:
        print("keine Bilder in", a.ordner)
        return 1
    fps = 10.0
    fp = os.path.join(a.ordner, "fps.txt")
    if os.path.exists(fp):
        fps = float(open(fp).read().strip() or 10)
    fps /= a.jedes
    bilder = []
    for d in dateien:
        im = Image.open(d).convert("RGB")
        if a.ausschnitt:
            x, y, w, h = a.ausschnitt
            im = im.crop((x, y, x + w, y + h))
        if a.skala != 1:
            im = im.resize((im.width * a.skala, im.height * a.skala), Image.NEAREST)
        bilder.append(im)
    if a.bogen:
        n = len(bilder)
        spalten = min(n, 8)
        zeilen = (n + spalten - 1) // spalten
        bogen = Image.new("RGB", (spalten * bilder[0].width, zeilen * bilder[0].height), (40, 40, 60))
        for i, im in enumerate(bilder):
            bogen.paste(im, ((i % spalten) * im.width, (i // spalten) * im.height))
        bogen.save(a.bogen)
        print("Bogen", a.bogen, bogen.size)
    farben = a.farben
    while True:
        pal = [im.quantize(colors=farben, method=Image.MEDIANCUT, dither=Image.NONE) for im in bilder]
        pal[0].save(a.ziel, save_all=True, append_images=pal[1:], duration=int(1000 / fps), loop=0, optimize=True)
        kb = os.path.getsize(a.ziel) / 1024
        if kb <= a.max_kb or farben <= 16:
            break
        farben = max(16, farben // 2)
    print("GIF %s: %d Bilder, %.1f Bilder/s, %d Farben, %.0f KB" % (a.ziel, len(bilder), fps, farben, kb))
    if kb > a.max_kb:
        print("Hinweis: über %d KB. Ausschnitt wählen oder --jedes 2." % a.max_kb)
    return 0


if __name__ == "__main__":
    sys.exit(main())
