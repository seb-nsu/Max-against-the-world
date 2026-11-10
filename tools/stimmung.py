#!/usr/bin/env python3
"""Lichtstimmungen aus einem fertigen Hintergrund ableiten (umfärben statt neu erzeugen).

Verdunkelt und tönt das Bild, färbt helles Licht (Fenster, Sonnenstrahl) passend zur Tageszeit und
kann eine Lampe mit warmem Lichtkegel einschalten. Danach wieder 32 eigene Farben wie bei
tools/pixelieren.py. Neue Dinge im Bild (Mond, Maschine) gehen so nicht, dafür Gemini Bild-zu-Bild.

Aufruf:  python3 tools/stimmung.py grund.png ziel.png STIMMUNG [--lampe X,Y]
STIMMUNG: spaeter_nachmittag | frueher_abend | abendrot
"""
import argparse
import sys
from pathlib import Path

import numpy as np
from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parent))
from pixelieren import farben_32  # noqa: E402

# Helligkeit, Tönung der hellen Stellen (warm), Tönung der Schatten (kühl), Farbe des Tageslichts
# (Fenster und Strahl), Stärke der Lichtfarbe und Randabdunklung (0 = keine).
# Warm heißt hier golden bis orange: Blau sinkt immer stärker als Grün, sonst kippt es ins Rosa.
STIMMUNGEN = {
    "spaeter_nachmittag": (0.90, (1.05, 1.00, 0.86), (0.98, 0.99, 1.02), (255, 220, 140), 0.35, 0.10),
    "frueher_abend": (0.70, (1.10, 0.95, 0.70), (0.92, 0.95, 1.04), (255, 175, 80), 0.55, 0.28),
    "abendrot": (0.52, (1.14, 0.90, 0.58), (0.84, 0.90, 1.08), (255, 140, 50), 0.65, 0.38),
}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("grund"); ap.add_argument("ziel"); ap.add_argument("stimmung", choices=STIMMUNGEN)
    ap.add_argument("--lampe", help="X,Y der Glühbirne: Lampe an, warmer Lichtkegel")
    ap.add_argument("--lampe-aus", help="X,Y der Glühbirne: Birne dunkel")
    a = ap.parse_args()
    hell, warm, kuehl, licht, staerke, rand = STIMMUNGEN[a.stimmung]
    b = np.asarray(Image.open(a.grund).convert("RGB"), dtype=np.float32)
    lum = b @ np.array([0.299, 0.587, 0.114], dtype=np.float32)
    # Tageslicht = die hellsten Stellen (Fenster, Sonnenstrahl); weich ausblenden
    m = np.clip((lum - 150) / 70, 0, 1)[..., None]
    # Lichter warm, Schatten leicht kühl: so bleiben Grün und Blau im Bild erkennbar
    t = np.clip(lum / 255, 0, 1)[..., None] ** 0.8
    toenung = np.array(kuehl, dtype=np.float32) * (1 - t) + np.array(warm, dtype=np.float32) * t
    neu = b * hell * toenung
    neu = neu * (1 - m * staerke) + (np.array(licht, dtype=np.float32) * lum[..., None] / 255) * m * staerke
    hh, ww = lum.shape
    yy, xx = np.mgrid[0:hh, 0:ww]
    if rand:
        r = np.sqrt(((xx - ww / 2) / (ww / 2)) ** 2 + ((yy - hh / 2) / (hh / 2)) ** 2) / np.sqrt(2)
        neu *= (1 - rand * r ** 1.5)[..., None]
    if a.lampe or a.lampe_aus:
        x, y = (int(v) for v in (a.lampe or a.lampe_aus).split(","))
        d = np.sqrt((xx - x) ** 2 + ((yy - y) * 1.2) ** 2)
        if a.lampe:
            kegel = np.clip(1 - d / 230, 0, 1) ** 2.0
            # Glühbirnenlicht: gelb, nicht orange; Blau bekommt fast nichts dazu
            neu = neu * (1 + np.array([0.40, 0.33, 0.10], dtype=np.float32) * kegel[..., None]) \
                + np.array([48, 38, 8], dtype=np.float32) * kegel[..., None]
            neu[d < 6] = np.maximum(neu[d < 6], [255, 240, 170])
        else:
            birne = (d < 8) & (lum > 170)
            neu[birne] = neu[birne] * 0.45 + np.array([40, 36, 30], dtype=np.float32)
    farben_32(np.clip(neu, 0, 255).astype(np.uint8)).save(a.ziel)
    print(a.ziel)


if __name__ == "__main__":
    main()
