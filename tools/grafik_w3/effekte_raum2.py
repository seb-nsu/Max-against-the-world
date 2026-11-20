"""Welt-3-Effekte in Küche, Büroturm und Testkammer 3 (B27 Eieruhr, B28 Klone tippen, B35 Kopierer, B10 Kopieren,
B36 Lautsprecher). Ausschnitte in Hintergrundgröße mit Lage im Raum, ohne Bild-KI.
Aufruf: py -3 effekte_raum2.py <pixel-ordner> <ausgabe-ordner> <stand-ordner>"""
import json, sys, math
from pathlib import Path
import numpy as np
from PIL import Image

P, AUS, ST = Path(sys.argv[1]), Path(sys.argv[2]), Path(sys.argv[3])


def raum(n):
    return np.asarray(Image.open(P / f"{n}.png").convert("RGBA")).copy()


def speichern(name, bilder, ms, raumname, x, y, schleife=True):
    h, w = bilder[0].shape[:2]
    Image.fromarray(np.concatenate(bilder, 1)).save(AUS / f"{name}.png")
    (AUS / f"{name}.json").write_text(json.dumps({"bild": [w, h], "bilder": len(bilder), "ms": ms, "schleife": schleife,
        "raum": raumname, "lage": [x, y], "hinweis": "Ausschnitt in Hintergrundgröße, links oben an lage legen"}, indent=1))
    print(name, len(bilder), "Bilder", w, "x", h, "bei", x, y)


def figur(name, hoehe):
    im = Image.open(ST / f"{name}.png").convert("RGBA")
    return np.asarray(im.resize((max(1, round(im.width * hoehe / im.height)), hoehe), Image.NEAREST))


def legen(ziel, bild, x, y):
    h, w = bild.shape[:2]
    for yy in range(h):
        for xx in range(w):
            if bild[yy, xx, 3] and 0 <= y + yy < ziel.shape[0] and 0 <= x + xx < ziel.shape[1]:
                ziel[y + yy, x + xx] = bild[yy, xx]


# B27 Eieruhr: die Henne wackelt mit jedem Ticken leicht nach links und rechts, der Fuß bleibt stehen
def eieruhr():
    r = raum("W3-R07_kueche_orakel"); x0, y0, W, H = 526, 156, 36, 36
    grund = r[y0:y0 + H, x0:x0 + W].copy()
    fuss = 188 - y0                                     # Brett-Oberkante
    bilder = []
    for neig in (0, 1, 0, -1):
        b = grund.copy()
        for y in range(4, fuss):
            versatz = int(round(neig * (fuss - y) / (fuss - 4)))
            if versatz:
                b[y, 4:W - 4] = np.roll(grund[y, 4:W - 4], versatz, axis=0)
        bilder.append(b)
    speichern("W3-B27_eieruhr", bilder, 250, "W3-R07_kueche_orakel", x0, y0)


# B35 Kopierer rattert: Gerät zittert, Lichtbalken unter dem Deckel, Blatt flattert in der Ablage
def kopierer():
    r = raum("W3-R08_buero_50"); x0, y0, W, H = 464, 176, 82, 128
    grund = r[y0:y0 + H, x0:x0 + W].copy()
    bilder = []
    for f in range(4):
        b = grund.copy()
        if f % 2:
            b[:H - 8] = np.roll(grund[:H - 8], 1, axis=1)   # Zittern, Füße bleiben
        lx = 14 + f * 12
        b[214 - y0:217 - y0, lx:lx + 8] = (0xff, 0xff, 0xf0, 255)
        blatt_y = 250 - y0 - (2 if f in (1, 3) else 0)
        b[blatt_y:blatt_y + 2, 40:58] = (0xf4, 0xf4, 0xf4, 255)
        bilder.append(b)
    speichern("W3-B35_kopierer", bilder, 90, "W3-R08_buero_50", x0, y0)


# B10 Kopieren: Blitz unter dem Deckel, eine Kopie von Schmidt gleitet flach aus der Ablage und richtet sich auf
def kopieren():
    r = raum("W3-R08_buero_50"); x0, y0, W, H = 380, 100, 166, 230
    grund = r[y0:y0 + H, x0:x0 + W].copy()
    klon = figur("klon", 172)                       # etwas kleiner als vorn: steht in der Tiefe am Kopierer
    boden = 322 - y0; ablage_y = 252 - y0
    bilder = []
    for f, (blitz, anteil) in enumerate([(1, 0), (2, 0), (1, 0.08), (0, 0.25), (0, 0.5), (0, 0.8), (0, 1.0), (0, 1.0)]):
        b = np.zeros((H, W, 4), np.uint8)
        if blitz:
            hell = 255 if blitz == 2 else 200
            b[214 - y0:218 - y0, 476 - x0:536 - x0] = (hell, hell, 0xf0, 255)
            if blitz == 2:
                b[206 - y0:214 - y0, 470 - x0:540 - x0] = (0xff, 0xff, 0xff, 140)
        if anteil:
            h = max(2, int(klon.shape[0] * anteil))
            k = np.asarray(Image.fromarray(klon).resize((klon.shape[1], h), Image.NEAREST))
            unten = int(ablage_y + (boden - ablage_y) * min(1.0, anteil * 1.5))
            x = 470 - x0 - int(40 * min(1.0, anteil * 1.3))
            legen(b, k, x, unten - h)
        bilder.append(b)
    speichern("W3-B10_kopieren", bilder, 110, "W3-R08_buero_50", x0, y0, schleife=False)


# B28 Klone tippen: drei gleiche Klone an Tischen hinter der Glasscheibe links, tippen im Takt, drehen gleichzeitig den Kopf
def klone_tippen():
    r = raum("W3-R08_buero_50"); x0, y0, W, H = 96, 150, 54, 70
    grund = r[y0:y0 + H, x0:x0 + W].copy()
    klon = figur("klon", 26)
    bilder = []
    for f in range(6):
        b = grund.copy()
        for i, x in enumerate((2, 19, 36)):
            k = klon[:, ::-1] if f == 4 else klon            # alle zugleich: Kopf wendet sich
            dy = 1 if f % 2 else 0                         # Tippen im Takt
            legen(b, k, x, 38 - k.shape[0] + dy)
            b[36:41, x - 1:x + 14] = (0x8b, 0x9b, 0xb4, 255)   # Tisch davor
            b[41:48, x:x + 2] = (0x5a, 0x69, 0x88, 255); b[41:48, x + 11:x + 13] = (0x5a, 0x69, 0x88, 255)
        # durch die Scheibe: etwas blasser
        m = b[..., 3] > 0
        b[m, :3] = (b[m, :3] * 0.75 + grund[m, :3] * 0.25).astype(np.uint8)
        bilder.append(b)
    speichern("W3-B28_klone_tippen", bilder, 140, "W3-R08_buero_50", x0, y0)


# B36 Lautsprecher in Testkammer 3: das Gitter klappt zu wie ein Mund, kleiner Funke, dann schmollt er
def lautsprecher():
    r = raum("W3-R11_testkammer_3"); x0, y0, W, H = 532, 52, 46, 60
    grund = r[y0:y0 + H, x0:x0 + W].copy()
    cx, cy, rx, ry = 551 - x0, 81 - y0, 11, 21
    yy, xx = np.mgrid[0:H, 0:W]
    gitter = ((xx - cx) / rx) ** 2 + ((yy - cy) / ry) ** 2 <= 1
    deckel = np.array([0xc0, 0xcb, 0xdc, 255], np.uint8); linie = np.array([0x26, 0x2b, 0x44, 255], np.uint8)
    def zu(anteil):
        b = grund.copy(); halb = int(ry * anteil)
        sel = gitter & ((yy < cy - ry + halb) | (yy > cy + ry - halb))
        b[sel] = deckel
        if anteil >= 1:
            b[gitter & (np.abs(yy - cy) < 1)] = linie
        return b
    funke = zu(1)
    for dy, dx in ((-24, 12), (-25, 13), (-23, 13), (-24, 14), (-26, 15)):
        if 0 <= cy + dy < H and 0 <= cx + dx < W:
            funke[cy + dy, cx + dx] = (0xfe, 0xe7, 0x61, 255)
    speichern("W3-B36_lautsprecher", [zu(0.5), zu(1), funke, zu(1)], 120, "W3-R11_testkammer_3", x0, y0, schleife=False)


eieruhr(); kopierer(); kopieren(); klone_tippen(); lautsprecher()
