"""Welt-3-Effekte, die auf einem Ausschnitt des Hintergrunds liegen, neu für die zweite Fassung der Räume (AP-09).

Die alten Streifen (effekte_raum.py bis effekte_raum4.py) sind Ausschnitte aus den ersten Hintergründen und passen
nicht mehr. Hier dieselben Bewegungen auf den _v02-Bildern an den neu gemessenen Stellen; sichtbar bleibt nur, was
sich zwischen den Bildern ändert (wie effekte_einbau.py), alles andere ist durchsichtig.

Ausgabe: game/grafik/ambiente/w3_<name>_v02.png (Bilder nebeneinander) und eine Zeile je Effekt mit Fußpunkt (pos,
unten in der Mitte) und Bildzahl für tools/layout/welt-3.yaml. Ohne Bild-KI.

AP-05 (21.11.): dazu die sechs Effekte, die bis dahin Ausschnitte der ersten Räume waren (Fächer, Küchenradio,
Lautsprecher der drei Testkammern, Tür in Kammer 3, Kopieren) und das Traumbild der blauen Pastille (w3_sofa_traum).

Aufruf: py -3 tools/grafik_w3/effekte_raum_v02.py [<stand-ordner mit klon.png und max_sofa_handy.png>]
        (Standard E:/Game Engine/Grafiken/assets/welt3/stand: Klone hinter dem Fenster im Büro, Sofa-Standbild)
"""
import json
import math
import random
import sys
from pathlib import Path

import numpy as np
from PIL import Image

WURZEL = Path(__file__).resolve().parents[2]
HG = WURZEL / "game/grafik/hintergruende"
AUS = WURZEL / "game/grafik/ambiente"
STAND = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("E:/Game Engine/Grafiken/assets/welt3/stand")
ZEILEN = []


HINTERGRUND = []   # zuletzt geladener Raum (für speichern)


def raum(n):
    a = np.asarray(Image.open(HG / f"w3_bg_{n}_v02.png").convert("RGBA")).copy()
    HINTERGRUND[:] = [a]
    return a


def speichern(name, bilder, x, y, fps):
    """Nur Pixel behalten, die sich zwischen den Bildern ändern oder vom Hintergrund abweichen; Streifen
    speichern, Layout-Zeile merken."""
    st = np.stack(bilder)
    h, w = bilder[0].shape[:2]
    r = HINTERGRUND[0][y:y + h, x:x + w, :3] if HINTERGRUND and HINTERGRUND[0].shape[0] >= y + h else None
    gleich = (st[:, :, :, :3] == st[:1, :, :, :3]).all(-1).all(0)
    if r is not None and r.shape[:2] == (h, w):
        gleich &= (st[0, :, :, :3] == r).all(-1)
    for b in bilder:
        b[gleich, 3] = 0
    h, w = bilder[0].shape[:2]
    Image.fromarray(np.concatenate(bilder, 1)).save(AUS / f"w3_{name}_v02.png")
    pos = [x + w // 2, y + h]
    ZEILEN.append(f"{name}: bild res://grafik/ambiente/w3_{name}_v02.png, bilder: {len(bilder)}, pos: {pos}, fps: {fps}")
    print(ZEILEN[-1])


# Apothekengasse: grüner Lichtring wandert um die Linse und pulsiert einmal (W3-B23)
def automat_scannt():
    r = raum("apothekengasse"); cx, cy, R = 640, 149, 31
    x0, y0, W, H = cx - 36, cy - 36, 72, 72
    g = r[y0:y0 + H, x0:x0 + W]
    yy, xx = np.mgrid[0:H, 0:W]; d = np.hypot(yy - 36, xx - 36); wink = np.arctan2(yy - 36, xx - 36)
    ring = (d >= R - 2) & (d <= R)
    bilder = []
    for f in range(6):
        b = g.copy()
        if f < 5:
            mitte = -math.pi + f * 2 * math.pi / 5
            b[ring & (np.abs((wink - mitte + math.pi) % (2 * math.pi) - math.pi) < 0.7)] = (0x63, 0xc7, 0x4d, 255)
        else:
            b[ring] = (0x9e, 0xf0, 0x7a, 255)
        bilder.append(b)
    speichern("automat_scannt", bilder, x0, y0, 9)


# Basis: Bandspulen des Großrechners drehen gegenläufig, die gelbe Lampe blinkt (W3-B24)
def grossrechner():
    r = raum("widerstandsbasis"); x0, y0, W, H = 928, 118, 66, 94
    g = r[y0:y0 + H, x0:x0 + W]
    spulen = [(947 - x0, 136 - y0, 1), (978 - x0, 136 - y0, -1), (947 - x0, 169 - y0, 1)]
    lampe = (983 - x0, 201 - y0, 8)
    yy, xx = np.mgrid[0:H, 0:W]
    bilder = []
    for f in range(4):
        b = g.copy()
        for cx, cy, richtung in spulen:
            m = np.hypot(yy - cy, xx - cx) <= 12
            w = richtung * f * math.pi / 6
            ys, xs = np.nonzero(m)
            qx = np.round(cx + (xs - cx) * math.cos(w) - (ys - cy) * math.sin(w)).astype(int)
            qy = np.round(cy + (xs - cx) * math.sin(w) + (ys - cy) * math.cos(w)).astype(int)
            ok = (qx >= 0) & (qx < W) & (qy >= 0) & (qy < H)
            b[ys[ok], xs[ok]] = g[qy[ok], qx[ok]]
        if f in (1, 2):
            m = np.hypot(yy - lampe[1], xx - lampe[0]) <= lampe[2]
            b[m, :3] = (b[m, :3] * 0.55).astype(np.uint8)
        bilder.append(b)
    speichern("grossrechner", bilder, x0, y0, 6)


# Kühlung: Schatten der Lüfterflügel wandern durch das kleine Gitter unten am Kühlgerät (W3-B25)
def ventilator():
    r = raum("kuehlung"); x0, y0, W, H = 328, 275, 26, 18
    g = r[y0:y0 + H, x0:x0 + W]
    bilder = []
    for f in range(4):
        b = g.copy()
        for y in range(2, H - 2):
            if (y + f * 2) % 6 < 2:
                b[y, 2:W - 2, :3] = (b[y, 2:W - 2, :3] * 0.5).astype(np.uint8)
        bilder.append(b)
    speichern("ventilator", bilder, x0, y0, 9)


# Laboreingang: Kartenleser blinkt rot (W3-B40)
def kartenleser():
    r = raum("laboreingang"); x0, y0, W, H = 424, 160, 22, 32
    g = r[y0:y0 + H, x0:x0 + W]; lx, ly = 434 - x0, 167 - y0
    bilder = []
    for an in (1, 1, 0, 0):
        b = g.copy()
        b[ly - 1:ly + 2, lx - 2:lx + 3, :3] = (0xff, 0x00, 0x44) if an else (0x68, 0x38, 0x6c)
        if an:
            b[ly, lx, :3] = (0xff, 0x9a, 0xa8)
        bilder.append(b)
    speichern("kartenleser", bilder, x0, y0, 3)


# Stadtstraße: Radiowecker 5:59 (Ruhe, Doppelpunkt blinkt) und 6:00 klingelnd (W3-B50, W3-B51), Tag und Nacht
ZIFFERN = {"5": ["###", "#..", "###", "..#", "###"], "9": ["###", "#.#", "###", "..#", "###"],
           "6": ["###", "#..", "###", "#.#", "###"], "0": ["###", "#.#", "#.#", "#.#", "###"]}
ROT, ROT_DUNKEL = (0xff, 0x00, 0x44), (0x68, 0x18, 0x2c)


def anzeige(b, text, ox, oy, doppelpunkt=True, an=True):
    x = ox
    for ch in text:
        if ch == ":":
            if doppelpunkt and an:
                b[oy + 1, x, :3] = ROT; b[oy + 3, x, :3] = ROT
            x += 2
            continue
        for dy, zeile in enumerate(ZIFFERN[ch]):
            for dx, c in enumerate(zeile):
                if c == "#":
                    b[oy + dy, x + dx, :3] = ROT if an else ROT_DUNKEL
        x += 4


def wecker(nachttisch, ecke, anzeige_xy, suffix):
    """Der Nachttisch ist ein eigenes Vordergrundteil (ecke = linke obere Ecke im Raum); der Ausschnitt kommt aus
    ihm, und im Layout braucht der Effekt eine baseline hinter der des Nachttischs, damit er darüber liegt."""
    t = np.asarray(Image.open(WURZEL / f"game/grafik/props/{nachttisch}").convert("RGBA"))
    x0, y0 = anzeige_xy[0] - 4, anzeige_xy[1] - 3
    W, H = 30, 14
    g = t[y0 - ecke[1]:y0 - ecke[1] + H, x0 - ecke[0]:x0 - ecke[0] + W].copy()
    voll = np.zeros((360, 1280, 4), np.uint8)
    voll[ecke[1]:ecke[1] + t.shape[0], ecke[0]:ecke[0] + t.shape[1]] = t
    HINTERGRUND[:] = [voll]                          # Vergleich gegen den Nachttisch, nicht den Hintergrund
    ox, oy = 6, 5
    ruhe = []
    for dp in (True, False):
        b = g.copy(); anzeige(b, "5:59", ox, oy, doppelpunkt=dp); ruhe.append(b)
    speichern(f"radiowecker_559{suffix}", ruhe, x0, y0, 2)
    klingeln = []
    for an, dx in ((1, 0), (1, 1), (0, -1), (1, 1), (1, 0), (0, -1)):
        b = g.copy(); anzeige(b, "6:00", ox, oy, an=bool(an))
        if dx:
            b[:] = np.roll(b, dx, axis=1)
        klingeln.append(b)
    speichern(f"radiowecker_klingelt{suffix}", klingeln, x0, y0, 11)
    return t


# Stadtstraße: Sprechanlage der Glastür redet (W3-B34): Pegel auf dem Bildschirm, Lochreihe, LED
def sprechanlage(raumname, x0, y0, suffix):
    r = raum(raumname); W, H = 18, 26
    g = r[y0:y0 + H, x0:x0 + W]
    gruen, hell, dunkel = (0x63, 0xc7, 0x4d), (0xb6, 0xff, 0x9a), (0x26, 0x5c, 0x42)
    bilder = []
    for f, balken in enumerate(((2, 4, 1, 3), (4, 2, 3, 1), (1, 3, 4, 2), (3, 1, 2, 4))):
        b = g.copy()
        b[4:10, 3:13, :3] = dunkel
        for i, h in enumerate(balken):
            b[10 - h:10, 4 + i * 2, :3] = gruen
        for i, xx in enumerate(range(4, 12)):
            if (i + f) % 2 == 0:
                b[14, xx, :3] = hell
        b[4, 14, :3] = (0xff, 0x00, 0x44) if f % 2 == 0 else (0x68, 0x38, 0x6c)
        bilder.append(b)
    speichern(f"glastuer_redet{suffix}", bilder, x0, y0, 8)


# Küche: Eieruhr-Henne wackelt mit jedem Ticken (W3-B27)
def eieruhr():
    r = raum("kueche_orakel"); x0, y0, W, H = 424, 176, 30, 26
    g = r[y0:y0 + H, x0:x0 + W]
    fuss = 201 - y0
    bilder = []
    for neig in (0, 1, 0, -1):
        b = g.copy()
        for y in range(2, fuss):
            v = int(round(neig * (fuss - y) / (fuss - 2)))
            if v:
                b[y, 2:W - 2] = np.roll(g[y, 2:W - 2], v, axis=0)
        bilder.append(b)
    speichern("eieruhr", bilder, x0, y0, 4)


# Küche: Kuckucksuhr ruft „Milch!“: Türchen auf, Vogel kommt heraus, Schnabel auf, zurück (W3-B39)
def kuckucksuhr():
    r = raum("kueche_orakel"); x0, y0, W, H = 196, 104, 32, 22
    g = r[y0:y0 + H, x0:x0 + W]
    tx, ty, tw, th = 206 - x0, 112 - y0, 9, 7

    def tuer_auf(b):
        b[ty:ty + th, tx:tx + tw, :3] = (0x3e, 0x27, 0x31)
        b[ty:ty + th, tx - 2:tx, :3] = (0xb8, 0x6f, 0x50)

    def vogel(b, raus, schnabel):
        form = [".##..", "####.", "####.", ".##.."]
        cx, cy = tx + 2 + raus, ty + 2
        for dy, zeile in enumerate(form):
            for dx, ch in enumerate(zeile):
                if ch == "#" and 0 <= cx + dx < W:
                    b[cy + dy, cx + dx, :3] = (0xfe, 0xe7, 0x61)
        b[cy + 1, cx + 2, :3] = (0x26, 0x2b, 0x44)
        b[cy + 1, cx + 4, :3] = (0xf7, 0x76, 0x22)
        if schnabel:
            b[cy + 2, cx + 4, :3] = (0xa2, 0x26, 0x33)

    bilder = []
    for zustand in ("zu", "auf", "v0", "v1s", "v1", "v1s", "v0", "zu"):
        b = g.copy()
        if zustand != "zu":
            tuer_auf(b)
        if zustand.startswith("v"):
            vogel(b, int(zustand[1]) * 3, zustand.endswith("s"))
        bilder.append(b)
    speichern("kuckucksuhr", bilder, x0, y0, 7)


# Büro 50: Terminal zeigt Pixels Hinweise, grüne Zeilen laufen, Cursor blinkt (W3-B46)
def terminal():
    r = raum("buero_50"); x0, y0, W, H = 850, 201, 32, 21
    g = r[y0:y0 + H, x0:x0 + W]
    bs, gruen, hell = (0x26, 0x3a, 0x2c), (0x63, 0xc7, 0x4d), (0xb6, 0xff, 0x9a)
    rnd = random.Random(4)
    zeilen = [[rnd.randint(4, 18), rnd.randint(0, 3)] for _ in range(8)]
    bilder = []
    for f in range(4):
        b = g.copy(); b[1:20, 1:31, :3] = bs
        for i in range(4):
            laenge, ein = zeilen[(i + f) % len(zeilen)]
            b[3 + i * 4, 3 + ein:3 + ein + laenge, :3] = gruen
        if f % 2 == 0:
            b[17:19, 4:6, :3] = hell
        bilder.append(b)
    speichern("terminal_buero", bilder, x0, y0, 6)


# Büro 50: Kopierer rattert, Gerät zittert, Lichtbalken unter dem Deckel (W3-B35)
def kopierer():
    r = raum("buero_50"); x0, y0, W, H = 376, 196, 90, 114
    g = r[y0:y0 + H, x0:x0 + W]
    bilder = []
    for f in range(4):
        b = g.copy()
        if f % 2:
            b[:H - 8] = np.roll(g[:H - 8], 1, axis=1)
        lx = 12 + f * 16
        b[218 - y0:220 - y0, lx:lx + 10] = (0xff, 0xff, 0xf0, 255)
        bilder.append(b)
    speichern("kopierer", bilder, x0, y0, 11)


# Büro 50: drei gleiche Klone tippen hinter dem Fenster (Flur dahinter), drehen gleichzeitig den Kopf (W3-B28)
def klone_tippen():
    r = raum("buero_50"); x0, y0, W, H = 344, 150, 76, 56
    g = r[y0:y0 + H, x0:x0 + W]
    im = Image.open(STAND / "klon.png").convert("RGBA")
    f_ = 22 / im.height
    klon = np.asarray(im.resize((max(1, round(im.width * f_)), 22), Image.NEAREST))
    bilder = []
    for f in range(6):
        b = g.copy()
        for x in (6, 30, 54):
            k = klon[:, ::-1] if f == 4 else klon
            dy = 1 if f % 2 else 0
            kh, kw = k.shape[:2]
            ys, xs = np.nonzero(k[..., 3] > 0)
            yy = 40 - kh + dy + ys
            ok = (yy >= 0) & (yy < H) & (x + xs < W)
            b[yy[ok], x + xs[ok]] = k[ys[ok], xs[ok]]
            b[38:42, x - 2:x + 14] = (0x8b, 0x9b, 0xb4, 255)
            b[42:48, x - 1:x + 1] = (0x5a, 0x69, 0x88, 255); b[42:48, x + 11:x + 13] = (0x5a, 0x69, 0x88, 255)
        m = (b != g).any(-1)
        b[m, :3] = (b[m, :3] * 0.7 + g[m, :3] * 0.3).astype(np.uint8)   # durch die Scheibe etwas blasser
        bilder.append(b)
    speichern("klone_tippen", bilder, x0, y0, 7)


# Kern: Lichtband läuft im orangen Streifen, Hitzeflimmern über der glühenden Zelle, Kabel pulsieren (B29, B52, B53)
def orange_maske(a, y_von, y_bis):
    r, g, b = (a[..., i].astype(int) for i in range(3))
    m = (r > 200) & (g > 80) & (g < 170) & (b < 90)
    m[:y_von] = False; m[y_bis:] = False
    return m


def kern():
    r = raum("kern")
    m = orange_maske(r, 170, 220)
    m[:, 300:345] = False
    ys, xs = np.nonzero(m); x0, y0, x1, y1 = xs.min(), ys.min(), xs.max() + 1, ys.max() + 1
    g = r[y0:y1, x0:x1]; mm = m[y0:y1, x0:x1]; W = x1 - x0
    bilder = []
    for f in range(8):
        b = g.copy(); mitte = -40 + f * (W + 80) / 8
        d = np.abs(np.arange(W) - mitte)[None, :].repeat(y1 - y0, 0)
        b[mm & (d < 28), :3] = (0xfe, 0xae, 0x34)
        b[mm & (d < 10), :3] = (0xfe, 0xe7, 0x61)
        bilder.append(b)
    speichern("kern_lichtband", bilder, int(x0), int(y0), 9)
    x0, y0, W, H = 298, 128, 46, 44
    g = r[y0:y0 + H, x0:x0 + W]
    bilder = []
    for f in range(4):
        b = g.copy()
        for y in range(H - 6):
            dx = int(round(math.sin(y / 3.0 + f * math.pi / 2) * (1.2 if y > 10 else 0.6)))
            if dx:
                b[y, 5:W - 5] = np.roll(g[y, 5:W - 5], dx, axis=0)
        bilder.append(b)
    speichern("kern_hitzeflimmern", bilder, x0, y0, 8)
    x0, y0, x1, y1 = 200, 252, 640, 360
    g = r[y0:y1, x0:x1]
    c = g[..., :3].astype(int); hell = c.sum(-1); sat = c.max(-1) - c.min(-1)
    kab = (hell < 260) & (sat < 40)
    kab[:, 290 - x0:350 - x0] = False
    dist = np.abs(np.arange(x1 - x0) + x0 - 320)[None, :].repeat(y1 - y0, 0)
    bilder = []
    for f in range(6):
        b = g.copy(); front = 30 + f * 50
        welle = kab & (np.abs(dist - front) < 14)
        b[welle, :3] = np.where((np.abs(dist - front) < 6)[welle][:, None], (0xfe, 0xae, 0x34), (0xb8, 0x6f, 0x50))
        bilder.append(b)
    speichern("kern_kabel_puls", bilder, x0, y0, 8)


# --- AP-05 (21.11.): sechs Effekte, die bis dahin Ausschnitte der ersten Hintergründe waren -------------------------
ORANGE = np.array([0xf7, 0x76, 0x22])
GRUEN, GRUEN_HELL = np.array([0x63, 0xc7, 0x4d]), np.array([0xb6, 0xff, 0x9a])


def tonen(b, maske, farbe, anteil):
    """Pixel unter der Maske zur Farbe hin mischen (Licht auf hellem und dunklem Grund)."""
    if anteil > 0:
        b[maske, :3] = np.clip(b[maske, :3] * (1 - anteil) + np.asarray(farbe) * anteil, 0, 255).astype(np.uint8)


def wellen(b, cx, cy, rx, ry, stufe, farbe, seiten=("l", "r")):
    """Schallbögen neben einem Lautsprecher: kurze Kreisbögen außerhalb des Rands, je Stufe einer mehr."""
    h, w = b.shape[:2]
    for k in range(stufe):
        d = 3 + 3 * k
        for t in np.linspace(-0.6, 0.6, 9):
            for seite in seiten:
                sx = -1 if seite == "l" else 1
                x = int(round(cx + sx * (rx + d) * math.cos(t)))
                y = int(round(cy + (ry + d) * math.sin(t)))
                if 0 <= x < w and 0 <= y < h:
                    b[y, x, :3] = farbe


# Apothekengasse: Linse leuchtet grün auf, dann klappen beide Fächer von oben nach unten auf (W3-B33, AUT_0130).
# Das letzte Bild ist die Fassung „faecher_offen“, die ab R3a als Hintergrund gilt.
def faecher_oeffnen():
    zu = raum("apothekengasse")
    offen = np.asarray(Image.open(HG / "w3_bg_apothekengasse_faecher_offen_v02.png").convert("RGBA"))
    x0, y0, W, H = 572, 112, 138, 142
    a, o = zu[y0:y0 + H, x0:x0 + W].copy(), offen[y0:y0 + H, x0:x0 + W].copy()
    yy, xx = np.mgrid[0:H, 0:W]
    linse = (np.hypot(yy - (149 - y0), xx - (640 - x0)) <= 27) & (a[..., :3].astype(int).sum(-1) < 330)
    anders = (a[..., :3].astype(int) != o[..., :3].astype(int)).any(-1)
    ys = np.nonzero(anders.any(1))[0]
    oben, unten = int(ys.min()), int(ys.max()) + 1

    def bild(glanz, anteil):
        b = a.copy()
        if anteil > 0:
            grenze = oben + int(round((unten - oben) * anteil))
            b[oben:grenze] = o[oben:grenze]
        tonen(b, linse, GRUEN, glanz)
        return b
    bilder = [bild(0.3, 0), bild(0.55, 0), bild(0.55, 0.34), bild(0.4, 0.67), bild(0.2, 1.0), o.copy()]
    speichern("faecher_oeffnen", bilder, x0, y0, 8)


# Küche: Pixel (oder die Nachrichten) aus dem Küchenradio: Gitter glimmt im Takt, zittert, Schallbögen (W3-B38).
# Die Fassung mit Scherben (ab R4) hat am Regal andere Farbwerte, darum ein eigener Streifen.
def kuechenradio(fassung=""):
    r = raum("kueche_orakel" + fassung)
    x0, y0, W, H = 412, 104, 40, 40
    g = r[y0:y0 + H, x0:x0 + W]
    yy, xx = np.mgrid[0:H, 0:W]
    cx, cy = 426 - x0, 132 - y0
    e = ((xx - cx) / 6.0) ** 2 + ((yy - cy) / 7.0) ** 2
    innen = e <= 0.85
    bilder = []
    for stufe, dx in ((0, 0), (2, 1), (1, 0), (2, -1)):
        b = g.copy()
        if dx:
            b[innen] = np.roll(g, dx, axis=1)[innen]   # das Gitter zittert, der Kasten bleibt
        tonen(b, innen, ORANGE, (0, 0.3, 0.55)[stufe])
        bilder.append(b)
    speichern("kuechenradio" + ("_r4" if fassung else ""), bilder, x0, y0, 8)


# Testkammern: M.U.T.T.I. oder Pixel spricht aus dem Lautsprecher: Gitter leuchtet orange im Takt, Schallbögen
# daneben auf der Wand (W3-B41 bis B43)
def lautsprecher(raumname, name, cx, cy, rx, ry, innen_r, seiten=("l", "r"), farbe=(0x7c, 0x84, 0x9c)):
    r = raum(raumname)
    rand = 12
    x0, y0 = cx - rx - rand, max(0, cy - ry - rand)
    W, H = 2 * (rx + rand) + 1, (cy + ry + rand + 1) - y0
    g = r[y0:y0 + H, x0:x0 + W]
    yy, xx = np.mgrid[0:H, 0:W]
    innen = ((xx - (cx - x0)) / innen_r[0]) ** 2 + ((yy - (cy - y0)) / innen_r[1]) ** 2 <= 1.0
    bilder = []
    for stufe in (0, 2, 1, 2):
        b = g.copy()
        tonen(b, innen, ORANGE, (0, 0.3, 0.55)[stufe])
        wellen(b, cx - x0, cy - y0, rx, ry, stufe, farbe, seiten)
        bilder.append(b)
    speichern(name, bilder, x0, y0, 8)


# Testkammer 3: Die Tür redet (nach dem Tausch mit dem Lautsprecher): das Schlüsselloch im Schloss-Symbol leuchtet
# grün und geht beim Sprechen auf und zu wie ein Mund (W3-B44)
def tuer_kammer3_redet():
    r = raum("testkammer_3")
    x0, y0, W, H = 452, 160, 42, 56
    g = r[y0:y0 + H, x0:x0 + W]
    c = g[..., :3].astype(int)
    feld = np.zeros(c.shape[:2], bool)
    feld[189 - y0:205 - y0, 467 - x0:479 - x0] = True
    schloss = c[200 - y0, 460 - x0]               # Farbe des Schlosskörpers
    naht = c.sum(-1) < 150                          # die dunkle Fuge zwischen den Türhälften bleibt
    loch = feld & (np.abs(c - schloss).sum(-1) > 30) & ~naht
    gross = loch.copy()
    gross[1:] |= loch[:-1]; gross[:-1] |= loch[1:]; gross[:, 1:] |= loch[:, :-1]; gross[:, :-1] |= loch[:, 1:]
    gross &= feld & ~naht
    bilder = []
    for stufe in (1, 2, 1, 2, 0):
        b = g.copy()
        if stufe == 2:
            b[gross, :3] = GRUEN
            b[loch, :3] = GRUEN_HELL
        elif stufe == 1:
            b[loch, :3] = GRUEN
        bilder.append(b)
    speichern("tuer_kammer3_redet", bilder, x0, y0, 8)


# Büro 50: Schmidt legt die Hand auf den Kopierer, Blitz unter dem Deckel, ein Blatt gleitet aus der Ablage auf den
# Boden und richtet sich als Kopie auf (W3-B10, W3_TURM_SCH_0030). Das letzte Bild ist der Klon in Spielgröße an seinem Fußpunkt
# KOPIE_FUSS; danach übernimmt die Figur Klon (welt_3.gd, gleiche Stelle).
KOPIE_FUSS = (336, 318)


def kopieren():
    r = raum("buero_50")
    x0, y0, W, H = 286, 120, 186, 200
    g = r[y0:y0 + H, x0:x0 + W]
    d = json.load(open(WURZEL / "game/daten/figuren/klon.json", encoding="utf-8"))
    zw, zh = d["bild"]
    zelle = np.asarray(Image.open(WURZEL / "game/grafik/figuren/klon.png").convert("RGBA"))[:zh, :zw]
    # Größe wie im Spiel: Tiefe des Büros (0,39 ab y 200, 1,0 an der Unterkante des Laufbereichs y 356)
    skala = 0.39 + (KOPIE_FUSS[1] - 200) / (356 - 200) * (1 - 0.39)
    kw, kh = max(1, round(zw * skala)), max(1, round(zh * skala))
    klon = np.asarray(Image.fromarray(zelle).resize((kw, kh), Image.NEAREST))
    ys, xs = np.nonzero(klon[..., 3] > 0)
    klon = klon[ys.min():ys.max() + 1, xs.min():xs.max() + 1]
    links = KOPIE_FUSS[0] - kw // 2 + xs.min() - x0       # Umriss liegt wie bei der Figur
    unten_voll = KOPIE_FUSS[1] - kh + ys.max() + 1 - y0
    ablage = 236 - y0                                       # linke Ablage des Kopierers
    glas = (393 - x0, 452 - x0, 213 - y0)

    def blitz(b, staerke):
        hell = 255 if staerke == 2 else 210
        b[glas[2]:glas[2] + 3, glas[0]:glas[1], :3] = (hell, hell, 0xf0)
        if staerke == 2:
            m = np.zeros(b.shape[:2], bool)
            m[glas[2] - 9:glas[2], glas[0] - 4:glas[1] + 4] = True
            tonen(b, m, (0xff, 0xff, 0xf4), 0.55)

    def blatt_legen(b, y, breite, mx):
        # das kopierte Blatt, flach (2 px hoch)
        b[y - 2:y, mx - breite // 2:mx + breite // 2, :3] = (0xf4, 0xf4, 0xf4)
        b[y, mx - breite // 2:mx + breite // 2, :3] = (0xc0, 0xcb, 0xdc)

    def kopie(b, anteil):
        # richtet sich vom Boden aus auf: Füße bleiben am Fußpunkt, die Höhe wächst
        h = max(2, int(round(klon.shape[0] * anteil)))
        k = np.asarray(Image.fromarray(klon).resize((klon.shape[1], h), Image.NEAREST))
        ky, kx = np.nonzero(k[..., 3] > 0)
        yy, xx = unten_voll - h + ky, links + kx
        ok = (yy >= 0) & (yy < H) & (xx >= 0) & (xx < W)
        b[yy[ok], xx[ok]] = k[ky[ok], kx[ok]]

    bilder = []
    for st, schritt in ((1, ""), (2, ""), (1, "ablage"), (0, "boden"), (0, 0.3), (0, 0.65), (0, 1.0), (0, 1.0)):
        b = g.copy()
        if st:
            blitz(b, st)
        if schritt == "ablage":
            blatt_legen(b, ablage, 20, 364 - x0)
        elif schritt == "boden":
            blatt_legen(b, unten_voll, 26, links + klon.shape[1] // 2)
        elif schritt:
            kopie(b, schritt)
        bilder.append(b)
    speichern("kopieren", bilder, x0, y0, 9)


# Opas Wohnzimmer als Traumbild (blaue Pastille, W3_SOFA_NAR_0480 „Wohnzimmer aus dem Prolog mit weichem Filter“):
# Prolog-Wohnzimmer weich und warm, davor Max mit Handy auf dem Sofa (Standbild max_sofa_handy, doppelte Größe).
# Ein Bild 640×360; welt_3.gd blendet es über die Gasse.
SOFA_LAGE = (30, 172)


def sofa_traum(sofa_png):
    from PIL import ImageFilter
    bg = Image.open(WURZEL / "game/grafik/hintergruende/w0_bg_wohnzimmer_v03.png").convert("RGB")
    bg = bg.filter(ImageFilter.GaussianBlur(2.2))
    a = np.asarray(bg).astype(float)
    a = a * 0.82 + np.array([255, 196, 140]) * 0.18                 # warm
    yy, xx = np.mgrid[0:360, 0:640]
    rand = np.clip(np.hypot((xx - 320) / 360.0, (yy - 180) / 230.0) - 0.55, 0, 1)
    a = a * (1 - 0.55 * rand[..., None])                             # Vignette
    bild = Image.fromarray(a.astype(np.uint8)).convert("RGBA")
    sofa = Image.open(sofa_png).convert("RGBA")
    sofa = sofa.resize((sofa.width * 2, sofa.height * 2), Image.NEAREST)
    bild.alpha_composite(sofa, SOFA_LAGE)
    bild.save(AUS / "w3_sofa_traum.png")
    print("sofa_traum: res://grafik/ambiente/w3_sofa_traum.png 640x360, Sofa bei", SOFA_LAGE, "Größe", sofa.size)


def ap05(sofa_png):
    faecher_oeffnen(); kuechenradio(); kuechenradio("_scherben")
    lautsprecher("testkammer_1", "lautsprecher_kammer1", 320, 26, 14, 6, (11, 4))
    lautsprecher("testkammer_2", "lautsprecher_kammer2", 320, 90, 20, 20, (16, 16))
    lautsprecher("testkammer_3", "lautsprecher_kammer3", 344, 166, 47, 47, (42, 42))
    tuer_kammer3_redet(); kopieren()
    if Path(sofa_png).exists():
        sofa_traum(sofa_png)
    else:
        print("Sofa-Standbild fehlt:", sofa_png)


def main():
    automat_scannt(); grossrechner(); ventilator(); kartenleser()
    wecker("w3_nachttisch_v02.png", (150, 262), (171, 267), "")
    wecker("w3_nachttisch_nacht_v02.png", (152, 262), (173, 268), "_nacht")
    sprechanlage("stadtstrasse", 1023, 180, ""); sprechanlage("stadtstrasse_nacht", 1026, 180, "_nacht")
    eieruhr(); kuckucksuhr(); terminal(); kopierer(); klone_tippen(); kern()
    ap05(STAND / "max_sofa_handy.png")


if __name__ == "__main__":
    main()
