"""Welt-3-Effekte für die Stadtstraße (R06) und den Kern (R12), nachdem Sebastians Hintergründe da sind.
Ausschnitte in Hintergrundgröße mit Lage im Raum (JSON), wie effekte_raum3.py.
- W3-B34 Glastür redet: Sprechanlage neben der Glastür, Bildschirm und Lochreihe leuchten grün im Sprechtakt, LED blinkt
- W3-B50/B51 Radiowecker: Anzeige 5:59 (Ruhe, Doppelpunkt blinkt) und 6:00 klingelnd (Ziffern blinken, Wecker zittert)
- W3-B29 Kern: Lichtband läuft im unteren orangen Streifen von links nach rechts
- W3-B52 Kern: Hitzeflimmern über der glühenden Zelle; W3-B53 Kern: Kabel pulsieren orange vom Sockel weg
Aufruf: py -3 effekte_raum4.py <pixel-ordner> <ausgabe-ordner>"""
import json, sys, math
from pathlib import Path
import numpy as np
from PIL import Image

P, AUS = Path(sys.argv[1]), Path(sys.argv[2])


def raum(n):
    return np.asarray(Image.open(P / f"{n}.png").convert("RGBA")).copy()


def speichern(name, bilder, ms, raumname, x, y, schleife=True, extra=None):
    h, w = bilder[0].shape[:2]
    Image.fromarray(np.concatenate(bilder, 1)).save(AUS / f"{name}.png")
    meta = {"bild": [w, h], "bilder": len(bilder), "ms": ms, "schleife": schleife, "raum": raumname, "lage": [x, y],
            "hinweis": "Ausschnitt in Hintergrundgröße, links oben an lage legen"}
    meta.update(extra or {})
    (AUS / f"{name}.json").write_text(json.dumps(meta, indent=1, ensure_ascii=False), encoding="utf-8")
    print(name, len(bilder), "Bilder", w, "x", h, "bei", x, y)


# 3×5-Ziffern für die Weckeranzeige
ZIFFERN = {"5": ["###", "#..", "###", "..#", "###"], "9": ["###", "#.#", "###", "..#", "###"],
           "6": ["###", "#..", "###", "#.#", "###"], "0": ["###", "#.#", "#.#", "#.#", "###"]}
ROT, ROT_DUNKEL, SCHWARZ = (0xff, 0x00, 0x44), (0x68, 0x18, 0x2c), (0x18, 0x14, 0x25)


def anzeige(b, text, ox, oy, doppelpunkt=True, an=True):
    x = ox
    for ch in text:
        if ch == ":":
            if doppelpunkt and an:
                b[oy + 1, x, :3] = ROT; b[oy + 3, x, :3] = ROT
            x += 2; continue
        for dy, zeile in enumerate(ZIFFERN[ch]):
            for dx, c in enumerate(zeile):
                b[oy + dy, x + dx, :3] = (ROT if an else ROT_DUNKEL) if c == "#" else SCHWARZ
        x += 4


def wecker(raumname, suffix):
    r = raum(raumname)
    x0, y0, W, H = 108, 262, 52, 36          # Nachttisch-Oberteil mit Wecker; Anzeige innen 122..148 × 274..282
    g = r[y0:y0 + H, x0:x0 + W].copy()
    g[276 - y0:282 - y0, 123 - x0:147 - x0, :3] = SCHWARZ      # alte, unleserliche Ziffern weg
    ox, oy = 128 - x0, 276 - y0
    ruhe = []
    for dp in (True, False):
        b = g.copy(); anzeige(b, "5:59", ox, oy, doppelpunkt=dp); ruhe += [b] * 1
    speichern(f"W3-B50_radiowecker_559{suffix}", ruhe, 500, raumname, x0, y0)
    klingeln = []
    for i, (an, dx) in enumerate(((1, 0), (1, 1), (0, -1), (1, 1), (1, 0), (0, -1))):
        b = g.copy(); anzeige(b, "6:00", ox, oy, an=bool(an))
        if dx:   # Wecker zittert: Oberteil ab der Antenne um einen Pixel versetzt
            teil = b[:282 - y0 + 2].copy(); b[:282 - y0 + 2] = np.roll(teil, dx, axis=1)
        klingeln.append(b)
    speichern(f"W3-B51_radiowecker_klingelt{suffix}", klingeln, 90, raumname, x0, y0)


# Glastür redet: Sprechanlage (Platte 1189..1203 × 243..262)
def sprechanlage(raumname, suffix):
    r = raum(raumname); x0, y0, W, H = 1186, 240, 22, 25
    g = r[y0:y0 + H, x0:x0 + W].copy()
    gruen, hell, dunkel = (0x63, 0xc7, 0x4d), (0xb6, 0xff, 0x9a), (0x26, 0x5c, 0x42)
    bilder = []
    for f, balken in enumerate(((2, 4, 1, 3), (4, 2, 3, 1), (1, 3, 4, 2), (3, 1, 2, 4))):
        b = g.copy()
        b[245 - y0:250 - y0, 1192 - x0:1201 - x0, :3] = dunkel          # Bildschirm
        for i, h in enumerate(balken):                                   # Sprech-Pegel
            xx = 1193 - x0 + i * 2
            b[250 - y0 - h:250 - y0, xx, :3] = gruen
        for i, xx in enumerate(range(1194, 1200)):                       # Lochreihe
            if (i + f) % 2 == 0:
                b[252 - y0, xx - x0, :3] = hell
        b[245 - y0, 1202 - x0, :3] = (0xff, 0x00, 0x44) if f % 2 == 0 else (0x68, 0x38, 0x6c)
        bilder.append(b)
    speichern(f"W3-B34_glastuer_redet{suffix}", bilder, 120, raumname, x0, y0)


def orange_maske(a, y_von, y_bis):
    r, g, b = (a[..., i].astype(int) for i in range(3))
    m = (r > 200) & (g > 80) & (g < 170) & (b < 90)
    m[:y_von] = False; m[y_bis:] = False
    return m


# Kern: Lichtband im unteren Streifen
def lichtband():
    n = "W3-R12_kern"; r = raum(n)
    m = orange_maske(r, 222, 262)
    m[:, 290:350] = False                          # die Zelle selbst nicht
    ys, xs = np.nonzero(m); x0, y0, x1, y1 = xs.min(), ys.min(), xs.max() + 1, ys.max() + 1
    g = r[y0:y1, x0:x1].copy(); mm = m[y0:y1, x0:x1]
    W = x1 - x0; bilder = []
    for f in range(8):
        b = g.copy(); mitte = -40 + f * (W + 80) / 8
        d = np.abs(np.arange(W) - mitte)[None, :].repeat(y1 - y0, 0)
        b[mm & (d < 28), :3] = (0xfe, 0xae, 0x34)
        b[mm & (d < 10), :3] = (0xfe, 0xe7, 0x61)
        bilder.append(b)
    speichern("W3-B29_kern_lichtband", bilder, 110, n, int(x0), int(y0))


# Kern: Hitzeflimmern über der Zelle (Zeilen seitlich verschoben)
def flimmern():
    n = "W3-R12_kern"; r = raum(n)
    x0, y0, W, H = 296, 124, 48, 62
    g = r[y0:y0 + H, x0:x0 + W].copy(); bilder = []
    for f in range(4):
        b = g.copy()
        for y in range(H - 8):            # unten (an der Zelle) bleibt fest
            dx = int(round(math.sin(y / 3.0 + f * math.pi / 2) * (1.2 if y > 10 else 0.6)))
            if dx:
                b[y, 6:W - 6] = np.roll(g[y, 6:W - 6], dx, axis=0)
        bilder.append(b)
    speichern("W3-B52_kern_hitzeflimmern", bilder, 130, n, x0, y0)


# Kern: Kabel pulsieren orange (dunkle Kabel am Boden, Puls läuft vom Sockel nach außen)
def kabel():
    n = "W3-R12_kern"; r = raum(n)
    x0, y0, x1, y1 = 60, 268, 640, 350
    g = r[y0:y1, x0:x1].copy()
    c = g[..., :3].astype(int); hell = c.sum(-1); sat = c.max(-1) - c.min(-1)
    kab = (hell < 330) & (sat < 40)
    kab[:, 290 - x0:350 - x0] = False                 # Sockel selbst nicht
    kab[:290 - y0] = False; kab[:, 525 - x0:] = False  # nur die Bodenkabel, nicht Wand und Lüftung
    dist = np.abs(np.arange(x1 - x0) + x0 - 320)[None, :].repeat(y1 - y0, 0)
    bilder = []
    for f in range(6):
        b = g.copy(); front = 30 + f * 50
        welle = kab & (np.abs(dist - front) < 14)
        b[welle, :3] = np.where((np.abs(dist - front) < 6)[welle][:, None], (0xfe, 0xae, 0x34), (0xb8, 0x6f, 0x50))
        bilder.append(b)
    speichern("W3-B53_kern_kabel_puls", bilder, 120, n, x0, y0)


wecker("W3-R06_stadtstrasse", ""); wecker("W3-R06b_stadtstrasse_nacht", "_nacht")
sprechanlage("W3-R06_stadtstrasse", ""); sprechanlage("W3-R06b_stadtstrasse_nacht", "_nacht")
lichtband(); flimmern(); kabel()


# Platzierung auf der Stadtstraße (Vorschlag für den Einbau, in Hintergrundpixeln)
platz = {
    "raum": "W3-R06_stadtstrasse", "groesse": [1280, 360],
    "laufen_fusslinie_y": [328, 352], "max_start": [200, 344],
    "passanten": {"anzahl": 3, "fusslinie_y": 336, "abstand_x": 70, "von_x": 1190, "nach_x": -80,
                  "tempo_px_s": 45, "hinweis": "Gleichschritt: alle drei starten im selben Bild der Laufschleife (passant_gehen), aus der Glastür nach links"},
    "katze": {"fusslinie_y": 306, "von_x": 1300, "nach_x": -60, "hinweis": "zweimal gleich, auf der Bordsteinkante vor dem Rasen"},
    "autos": {"unterkante_y": 304, "von_x": -170, "nach_x": 1290, "abstand_x": 440, "tempo_px_s": 60,
              "hinweis": "W3-B54_auto_im_takt, hinter allen Figuren"},
    "vogelschwarm": {"bahn": [[-70, 70], [640, 46], [1350, 70]], "alle_s": 12, "hinweis": "W3-B26, immer dieselbe Bahn"},
    "hotspots": {"radiowecker": [108, 262, 52, 36], "gasse": [60, 150, 90, 160], "haus_orakel_oma_tuer": [500, 205, 40, 75],
                 "glastuer": [1112, 195, 73, 105], "sprechanlage": [1186, 240, 22, 25]},
}
(AUS / "W3-R06_platzierung.json").write_text(json.dumps(platz, indent=1, ensure_ascii=False), encoding="utf-8")
print("W3-R06_platzierung.json")
