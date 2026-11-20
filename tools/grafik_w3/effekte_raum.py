"""Welt-3-Effekte, die auf einem Ausschnitt des fertigen, pixelierten Hintergrunds liegen (B17, B18, B23, B24, B25, B33).
Jeder Effekt ist ein Streifen aus Ausschnitten in Hintergrundgröße; die JSON nennt die Lage im Raum (x, y, Raumgröße).
Ohne Bild-KI, nur aus dem Hintergrund selbst. Aufruf: py -3 effekte_raum.py <pixel-ordner> <ausgabe-ordner>"""
import json, sys, math, random
from pathlib import Path
import numpy as np
from PIL import Image

P, AUS = Path(sys.argv[1]), Path(sys.argv[2]); AUS.mkdir(parents=True, exist_ok=True)


def raum(n):
    return np.asarray(Image.open(P / f"{n}.png").convert("RGBA")).copy()


def speichern(name, bilder, ms, raumname, x, y, schleife=True):
    h, w = bilder[0].shape[:2]
    Image.fromarray(np.concatenate(bilder, 1)).save(AUS / f"{name}.png")
    (AUS / f"{name}.json").write_text(json.dumps({"bild": [w, h], "bilder": len(bilder), "ms": ms, "schleife": schleife,
        "raum": raumname, "lage": [x, y], "hinweis": "Ausschnitt in Hintergrundgröße, links oben an lage legen"}, indent=1))
    print(name, len(bilder), "Bilder", w, "x", h, "bei", x, y)


def ausschnitt(a, x, y, w, h):
    return a[y:y + h, x:x + w].copy()


# B17 Nudeltopf dampft: weiße Schwaden über dem Topf, steigen und zerfasern; nur der Dampf, durchsichtig
def nudeltopf():
    W, H = 44, 52; x0, y0 = 54, 150          # Topf bei etwa x 60-100, y 190-205 im 1280er Bild
    rnd = random.Random(2)
    teilchen = [(rnd.uniform(14, 30), i / 16 + rnd.uniform(0, 0.03), rnd.uniform(0.9, 1.4)) for i in range(16)]
    bilder = []
    for f in range(6):
        a = np.zeros((H, W, 4), np.uint8)
        for sx, ph, gr in teilchen:
            t = (ph + f / 6) % 1.0
            y = int(H - 6 - t * (H - 8)); x = int(sx + 5 * math.sin(t * 6 + sx))
            r = int(2 + gr * (1 + 3 * t)); alpha = int(120 * (1 - t) ** 0.8)
            for dy in range(-r, r + 1):
                for dx in range(-r, r + 1):
                    if dx * dx + dy * dy <= r * r and 0 <= y + dy < H and 0 <= x + dx < W:
                        a[y + dy, x + dx] = (0xe8, 0xee, 0xf4, max(a[y + dy, x + dx, 3], alpha))
        bilder.append(a)
    speichern("W3-B17_nudeltopf_dampf", bilder, 120, "W3-R01_unterstadt", x0, y0)


# B18 Neonschild mit Wackelkontakt: cyanfarbene Röhre zweimal aus und an, ein Funke; Magenta bleibt
def neonschild():
    r = raum("W3-R01_unterstadt"); x0, y0, W, H = 256, 108, 64, 88
    grund = ausschnitt(r, x0, y0, W, H)
    rgb = grund[..., :3].astype(int)
    cyan = (rgb[..., 1] > 170) & (rgb[..., 2] > 170) & (rgb[..., 0] < 190)
    aus = grund.copy(); aus[cyan, :3] = (rgb[cyan] * 0.35).astype(np.uint8)
    ys, xs = np.nonzero(cyan)
    funke = grund.copy()
    if len(ys):
        fy, fx = ys.max(), int(xs.mean())
        funke = aus.copy()
        for dy, dx in ((0, 0), (-1, 0), (1, 0), (0, -1), (0, 1), (-2, 1)):
            if 0 <= fy + dy < H and 0 <= fx + dx < W:
                funke[fy + dy, fx + dx] = (255, 255, 230, 255)
    speichern("W3-B18_neonschild", [grund, aus, grund, aus, funke, grund], 110, "W3-R01_unterstadt", x0, y0)


# B23 Automat scannt: grüner Lichtring wandert um die Linse und pulsiert einmal
def automat_scannt():
    r = raum("W3-R02_apothekengasse"); cx, cy, R = 647, 120, 30
    x0, y0, W, H = cx - 36, cy - 36, 72, 72
    grund = ausschnitt(r, x0, y0, W, H)
    yy, xx = np.mgrid[0:H, 0:W]; d = np.hypot(yy - 36, xx - 36); wink = np.arctan2(yy - 36, xx - 36)
    ring = (d >= R - 2) & (d <= R)
    bilder = []
    for f in range(6):
        b = grund.copy()
        if f < 5:
            mitte = -math.pi + f * 2 * math.pi / 5
            sel = ring & (np.abs((wink - mitte + math.pi) % (2 * math.pi) - math.pi) < 0.7)
            b[sel] = (0x63, 0xc7, 0x4d, 255)
        else:
            b[ring] = (0x9e, 0xf0, 0x7a, 255)
        bilder.append(b)
    speichern("W3-B23_automat_scannt", bilder, 110, "W3-R02_apothekengasse", x0, y0)


# B33 Fächer öffnen: Linse leuchtet grün, dann gleiten beide Klappen von oben nach unten auf (zweite Fassung des Raums)
def faecher():
    zu, offen = raum("W3-R02_apothekengasse"), raum("W3-R02b_apothekengasse_offen")
    x0, y0, W, H = 580, 82, 136, 160
    a, b = ausschnitt(zu, x0, y0, W, H), ausschnitt(offen, x0, y0, W, H)
    yy, xx = np.mgrid[0:H, 0:W]; d = np.hypot(yy - 38, xx - 67)
    def linse(img, staerke):
        img = img.copy(); m = (d <= 22) & (img[..., 3] > 0)
        img[m, :3] = np.clip(img[m, :3] * (1 - staerke) + np.array([0x63, 0xc7, 0x4d]) * staerke, 0, 255).astype(np.uint8)
        return img
    fach = slice(108, 160)                    # Fächer liegen etwa y 193-237 im Raum
    def teil(anteil):
        c = linse(a, 0.45); grenze = 108 + int((160 - 108) * anteil)
        c[108:grenze] = linse(b, 0.45)[108:grenze]
        return c
    bilder = [a, linse(a, 0.25), linse(a, 0.5), teil(0.35), teil(0.7), linse(b, 0.3)]
    speichern("W3-B33_faecher_oeffnen", bilder, 120, "W3-R02_apothekengasse", x0, y0, schleife=False)


# B24 Großrechner: Bandspulen drehen sich gegenläufig in Schritten, die Lampe blinkt
def grossrechner():
    r = raum("W3-R03_widerstandsbasis"); x0, y0, W, H = 858, 58, 84, 96
    grund = ausschnitt(r, x0, y0, W, H)
    spulen = [(889 - x0, 132 - y0, 1), (923 - x0, 132 - y0, -1)]; lampe = (877 - x0, 77 - y0, 16)
    yy, xx = np.mgrid[0:H, 0:W]
    bilder = []
    for f in range(4):
        b = grund.copy()
        for cx, cy, richtung in spulen:
            m = np.hypot(yy - cy, xx - cx) <= 13
            wink = richtung * f * math.pi / 6       # 30 Grad je Bild
            ys, xs = np.nonzero(m)
            qx = np.round(cx + (xs - cx) * math.cos(wink) - (ys - cy) * math.sin(wink)).astype(int)
            qy = np.round(cy + (xs - cx) * math.sin(wink) + (ys - cy) * math.cos(wink)).astype(int)
            ok = (qx >= 0) & (qx < W) & (qy >= 0) & (qy < H)
            b[ys[ok], xs[ok]] = grund[qy[ok], qx[ok]]
        if f in (1, 2):                            # Lampe dunkler
            m = np.hypot(yy - lampe[1], xx - lampe[0]) <= lampe[2]
            b[m, :3] = (b[m, :3] * 0.55).astype(np.uint8)
        bilder.append(b)
    speichern("W3-B24_grossrechner", bilder, 160, "W3-R03_widerstandsbasis", x0, y0)


# B25 Kühlung, Ventilator: dunkle Lamellen-Schatten wandern durch das Gitter, Reif glitzert, Statuslicht blinkt
def ventilator():
    r = raum("W3-R04_kuehlung"); x0, y0, W, H = 380, 170, 66, 88
    grund = ausschnitt(r, x0, y0, W, H)
    gx0, gx1, gy0, gy1 = 388 - x0, 434 - x0, 210 - y0, 252 - y0
    licht = (435 - x0, 178 - y0)
    bilder = []
    for f in range(4):
        b = grund.copy()
        for y in range(gy0, gy1):
            if (y + f * 2) % 8 < 3:                # Schatten der Flügel hinter den Lamellen
                b[y, gx0:gx1, :3] = (b[y, gx0:gx1, :3] * 0.45).astype(np.uint8)
        gx = gx0 + 6 + f * 10
        if gx < gx1: b[gy0 + 2, gx] = (255, 255, 255, 255)
        if f % 2 == 0:
            lx, ly = licht; b[ly - 1:ly + 2, lx - 1:lx + 2, :3] = (0xb5, 0x50, 0x88)
        bilder.append(b)
    speichern("W3-B25_ventilator", bilder, 110, "W3-R04_kuehlung", x0, y0)


nudeltopf(); neonschild(); automat_scannt(); faecher(); grossrechner(); ventilator()
