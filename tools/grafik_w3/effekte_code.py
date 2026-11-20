"""Welt-3-Effekte, die ohne Bild-KI entstehen: Regen (B13), Schnee (B14), Hologramm-Kegel (B15), Verwandlung (B11).
Jeder Effekt als Streifen <name>.png (Bilder nebeneinander) plus JSON (bild, bilder, ms, schleife).
Regen und Schnee sind kachelbar (640×360), Pixel nur in 1–2 Pixel Größe, Farben aus der Welt-3-Palette.
Aufruf: py -3 effekte_code.py <ausgabe-ordner>"""
import json, sys, math, random
from pathlib import Path
import numpy as np
from PIL import Image

AUS = Path(sys.argv[1]); AUS.mkdir(parents=True, exist_ok=True)


def speichern(name, bilder, ms, schleife=True):
    h, w = bilder[0].shape[:2]
    Image.fromarray(np.concatenate(bilder, 1)).save(AUS / f"{name}.png")
    (AUS / f"{name}.json").write_text(json.dumps({"bild": [w, h], "bilder": len(bilder), "ms": ms, "schleife": schleife}, indent=1))
    print(name, len(bilder), "Bilder", w, "x", h)


def regen(n=4, W=640, H=360, tropfen=260):
    rnd = random.Random(3)
    ts = [(rnd.randrange(W), rnd.randrange(H), rnd.choice((6, 8, 10)), rnd.random() < 0.3) for _ in range(tropfen)]
    bilder = []
    for f in range(n):
        a = np.zeros((H, W, 4), np.uint8)
        for x0, y0, L, hell in ts:
            # pro Bild ein Viertel der Kachelhöhe nach unten, schräg nach rechts: nach 4 Bildern wieder am Anfang
            y = (y0 + f * H // n) % H; x = (x0 + f * (H // n) // 3) % W
            col = (0x9c, 0xe8, 0xf5, 200) if hell else (0x5a, 0x9b, 0xb4, 150)
            for i in range(L):
                a[(y + i) % H, (x + i // 3) % W] = col
        # Spritzer am Boden (untere 40 Pixel), wechseln je Bild
        for _ in range(40):
            x = rnd.randrange(W); y = rnd.randrange(H - 40, H - 2)
            for dx, dy in ((-1, 0), (1, 0), (0, -1)):
                a[y + dy, (x + dx) % W] = (0x9c, 0xe8, 0xf5, 160)
        bilder.append(a)
    speichern("W3-B13_regen", bilder, 70)


def schnee(n=4, W=640, H=360, flocken=170):
    rnd = random.Random(5)
    fs = [(rnd.randrange(W), rnd.randrange(H), rnd.random() < 0.35, rnd.random() * 6.28) for _ in range(flocken)]
    bilder = []
    for f in range(n):
        a = np.zeros((H, W, 4), np.uint8)
        for x0, y0, gross, ph in fs:
            y = (y0 + f * H // n) % H
            x = int(x0 + 2 * math.sin(ph + f * math.pi / 2)) % W
            c = (0xff, 0xff, 0xff, 230) if gross else (0xc0, 0xcb, 0xdc, 200)
            a[y, x] = c
            if gross:
                a[y, (x + 1) % W] = c; a[(y + 1) % H, x] = c; a[(y + 1) % H, (x + 1) % W] = c
        bilder.append(a)
    speichern("W3-B14_schnee", bilder, 220)


def hologramm(n=6, W=64, H=96):
    bilder = []
    for f in range(n):
        a = np.zeros((H, W, 4), np.uint8)
        for y in range(H):
            t = 1 - y / H                         # unten schmal (Linse), oben breit
            halb = int(4 + t * 26)
            hell = 70 + int(50 * t)
            for x in range(W // 2 - halb, W // 2 + halb):
                rand = abs(x - W // 2) / max(halb, 1)
                alpha = int(hell * (1 - 0.6 * rand))
                if (y + f * 2) % 6 < 2:            # waagrechte Scanlines, laufen nach oben
                    alpha = int(alpha * 1.6)
                if f in (2,) and y % 11 == 0:      # kurzes Flackern
                    alpha //= 3
                a[y, x] = (0x2c, 0xe8, 0xf5, min(alpha, 200))
        a[H - 4:H, W // 2 - 5:W // 2 + 5] = (0x0d, 0x99, 0xdb, 255)   # Linse auf Piepsi
        a[H - 3, W // 2 - 2:W // 2 + 2] = (0xff, 0xff, 0xff, 255)
        bilder.append(a)
    speichern("W3-B15_hologramm", bilder, 110)


def verwandlung(n=6, W=64, H=64):
    rnd = random.Random(11)
    farben = [(0x63, 0xc7, 0x4d), (0x3e, 0x89, 0x48), (0xb6, 0xff, 0x9a), (0x26, 0x5c, 0x42)]
    bilder = []
    for f in range(n):
        a = np.zeros((H, W, 4), np.uint8)
        dichte = [0.25, 0.5, 0.65, 0.45, 0.2, 0.06][f]
        groesse = [4, 4, 3, 3, 2, 2][f]
        for y in range(0, H, groesse):
            for x in range(0, W, groesse):
                r = math.hypot(x - W / 2, y - H / 2) / (W / 2)
                if rnd.random() < dichte * (1.2 - r) and r < 1:
                    c = rnd.choice(farben)
                    a[y:y + groesse - 1, x:x + groesse - 1] = (*c, 230)
        # waagrechte Störstreifen
        for _ in range(2 if f < 4 else 0):
            y = rnd.randrange(H); a[y, :] = (0xb6, 0xff, 0x9a, 120)
        bilder.append(a)
    speichern("W3-B11_verwandlung", bilder, 70, schleife=False)


regen(); schnee(); hologramm(); verwandlung()
