#!/usr/bin/env python3
"""an-b: Film der Fernsteuerung auswerten (Bildabstände prüfen, Kontaktbogen, GIF-Ausschnitt).

  an-b_film.py FILMORDNER [--von N] [--bis N] [--box x y w h] [--n 16] [--spalten 8] [--faktor 1.0]
               [--bogen ZIEL.png] [--gif ZIEL.gif] [--jedes 1] [--skala 2] [--max-kb 400] [--alle]

Ohne --bogen/--gif nur die Zeitprüfung: Die Bilder tragen keine Zeit im Namen, deshalb nimmt das Skript
die Änderungszeit der Dateien (Echtzeit). Gemeldet werden Sollabstand (fps.txt), Median, größter Abstand
und die Bildnummern mit mehr als dem 1,6-fachen Sollabstand (dort ruckelt die Aufnahme, nicht das Spiel).
--alle: Bogen aus allen Bildern zwischen von und bis (sonst --n gleichmäßig verteilte).
Bildnummern zählen ab 1 wie die Dateinamen b_0001.png.
"""
import argparse
import glob
import os
import statistics

from PIL import Image, ImageDraw


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("ordner")
    ap.add_argument("--von", type=int, default=1)
    ap.add_argument("--bis", type=int, default=0)
    ap.add_argument("--box", nargs=4, type=int)
    ap.add_argument("--n", type=int, default=16)
    ap.add_argument("--spalten", type=int, default=8)
    ap.add_argument("--faktor", type=float, default=1.0)
    ap.add_argument("--bogen")
    ap.add_argument("--gif")
    ap.add_argument("--jedes", type=int, default=1)
    ap.add_argument("--skala", type=int, default=2)
    ap.add_argument("--max-kb", type=int, default=400)
    ap.add_argument("--alle", action="store_true")
    a = ap.parse_args()
    d = sorted(glob.glob(os.path.join(a.ordner, "b_*.png")))
    if not d:
        print("keine Bilder")
        return 1
    fps = 10.0
    fp = os.path.join(a.ordner, "fps.txt")
    if os.path.exists(fp):
        fps = float(open(fp).read().strip() or 10)
    bis = a.bis if a.bis > 0 else len(d)
    bis = min(bis, len(d))
    von = max(1, a.von)
    # Zeitprüfung über den gewählten Bereich
    zeiten = [os.path.getmtime(x) for x in d[von - 1:bis]]
    ab = [zeiten[i + 1] - zeiten[i] for i in range(len(zeiten) - 1)]
    if ab:
        soll = 1.0 / fps
        lang = [(von + i + 1, round(x, 3)) for i, x in enumerate(ab) if x > 1.6 * soll]
        print("%d Bilder (%d–%d), Soll %.3f s, Median %.3f s, größter Abstand %.3f s, Dauer %.1f s, %d Abstände über 1,6×Soll%s" % (
            len(zeiten), von, bis, soll, statistics.median(ab), max(ab), zeiten[-1] - zeiten[0], len(lang),
            (": " + ", ".join("%d(%.2f)" % x for x in lang[:12])) if lang else ""))
    box = tuple(a.box) if a.box else (0, 0, 640, 360)

    def bild(i):
        im = Image.open(d[i - 1]).convert("RGB")
        return im.crop((box[0], box[1], box[0] + box[2], box[1] + box[3]))

    if a.bogen:
        if a.alle:
            idx = list(range(von, bis + 1, a.jedes))
        else:
            idx = sorted(set(von + round(i * (bis - von) / max(1, a.n - 1)) for i in range(a.n)))
        w, h = round(box[2] * a.faktor), round(box[3] * a.faktor)
        sp = min(a.spalten, len(idx))
        ze = (len(idx) + sp - 1) // sp
        bogen = Image.new("RGB", (sp * (w + 2), ze * (h + 2)), (40, 40, 60))
        z = ImageDraw.Draw(bogen)
        for n, i in enumerate(idx):
            b = bild(i).resize((w, h), Image.NEAREST if a.faktor >= 1 else Image.BILINEAR)
            x, y = (n % sp) * (w + 2), (n // sp) * (h + 2)
            bogen.paste(b, (x, y))
            z.text((x + 2, y + 1), str(i), fill="yellow")
        bogen.save(a.bogen)
        print("Bogen", a.bogen, bogen.size, len(idx), "Bilder")
    if a.gif:
        idx = list(range(von, bis + 1, a.jedes))
        bilder = [bild(i) for i in idx]
        if a.skala != 1:
            bilder = [b.resize((b.width * a.skala, b.height * a.skala), Image.NEAREST) for b in bilder]
        farben = 48
        jedes = 1
        while True:
            bb = bilder[::jedes]
            pal = [im.quantize(colors=farben, method=Image.MEDIANCUT, dither=Image.NONE) for im in bb]
            pal[0].save(a.gif, save_all=True, append_images=pal[1:], duration=int(1000 * a.jedes * jedes / fps),
                        loop=0, optimize=True)
            kb = os.path.getsize(a.gif) / 1024
            if kb <= a.max_kb or (farben <= 16 and jedes >= 3):
                break
            if farben > 16:
                farben //= 2
            else:
                jedes += 1
        print("GIF", a.gif, "%d KB, %d Bilder, %.1f Bilder/s, %d Farben" % (kb, len(bb), fps / (a.jedes * jedes), farben))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
