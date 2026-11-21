"""Welt-3-Räume, zweite Fassung (AP-09, 21.11.): Sebastians Gemini-Bilder mit Skizze auf Spielgröße.

Ablauf je Raum (lessons-learned.md, Zustände und Varianten; Prüfbericht
docs/review/2026-11-20/notizen/hintergruende-pruefung.md):
1. JPEG-Ränder glätten (Median 3×3 im Original), dann wie tools/pixelieren.py verkleinern
   (k-Centroid je Zielpixel; Panoramen 1280 × 360, sonst 640 × 360).
2. Eine gemeinsame Palette je Raum aus Grundbild und Varianten (Stadtstraße Nacht: eigenes Vollbild
   mit eigener Palette, weil Gemini es neu belichtet und gedehnt hat).
3. Nacharbeit im gepixelten Bild (NACHARBEIT, nur Kopieren und Malen mit Palettenfarben): Einhorn
   kleiner, leerer Türrahmen in der Basis weg, Tasse an die Tischkante, Kaffeespur, Weckeranzeige
   schwarz und Nachttisch als Vordergrundteil, drittes Glas in der Küche, Kritzelei ohne Schein-Schrift,
   Mopp im Laboreingang weg.
4. Zustände nur an der geänderten Stelle: Unterschied der verkleinerten Bilder innerhalb grober
   Rechtecke (BEREICHE), nach Umriss übernommen; „ganz“ nimmt das Rechteck vollständig. Kombinationen
   aus den Masken mehrerer Zustände (Basis: Schnee + Kaffee). Gemalte Zustände (Kaffee) entstehen
   als Nacharbeit auf dem Grundbild.

Ausgabe: game/grafik/hintergruende/w3_bg_<raum>[_<zustand>]_v02.png, Vordergrundteile nach
game/grafik/props/ (w3_*_v02.png). Die alten _v01-Fassungen bleiben liegen.

Aufruf: py -3 tools/grafik_w3/raeume_pixelieren.py <ordner mit W3-R*.jpeg> [raum …] [--masken <ordner>]
Quelle: E:/Game Engine/Grafiken/assets/welt3/raeume_v2 (nur lesen).
"""
import io
import sys
from pathlib import Path

import numpy as np
from PIL import Image, ImageFilter
from scipy import ndimage

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from pixelieren import farben_32, oklab, palette_finden, verkleinern  # noqa: E402

WURZEL = Path(__file__).resolve().parents[2]
ZIEL = WURZEL / "game/grafik/hintergruende"
PROPS = WURZEL / "game/grafik/props"
VERSION = "v02"

# Raum: Breite, Grundbild, {Zustand: Quelle (None = gemalt)}, {Kombination: [Zustände]}, Farbanzahl
RAEUME = {
    "unterstadt_strasse": (1280, "W3-R01_unterstadt_strasse", {}, {}, 40),
    "apothekengasse": (1280, "W3-R02_apothekengasse_zu", {"faecher_offen": "W3-R02b_apothekengasse_offen"}, {}, 40),
    "widerstandsbasis": (1280, "W3-R03_widerstandsbasis", {"schnee": "W3-R03b_widerstandsbasis_schnee",
                                                           "kaffee": None},
                         {"schnee_kaffee": ["schnee", "kaffee"]}, 40),
    "kuehlung": (640, "W3-R04_kuehlung", {"taut": "W3-R04b_kuehlung_getaut"}, {}, 32),
    "laboreingang": (640, "W3-R05_laboreingang_zu", {"offen": "W3-R05b_laboreingang_offen"}, {}, 32),
    "stadtstrasse": (1280, "W3-R06_stadtstrasse_tag", {}, {}, 40),
    "stadtstrasse_nacht": (1280, "W3-R06b_stadtstrasse_nacht", {}, {}, 40),
    "kueche_orakel": (640, "W3-R07_kueche_orakel", {"scherben": "W3-R07b_kueche_orakel_scherben"}, {}, 40),
    "buero_50": (1280, "W3-R08_buero_50", {}, {}, 40),
    "testkammer_1": (640, "W3-R09_testkammer_1_zu", {"offen": "W3-R09b_testkammer_1_offen"}, {}, 32),
    "testkammer_2": (640, "W3-R10_testkammer_2_toedlich", {"laser_gestoert": "W3-R10b_testkammer_2_harmlos"}, {}, 40),
    "testkammer_3": (640, "W3-R11_testkammer_3_zu", {"offen": "W3-R11b_testkammer_3_offen"}, {}, 32),
    "kern": (640, "W3-R12_kern_gluehend", {"vereist": "W3-R12b_kern_vereist", "sockel_leer": "W3-R12c_kern_leer"}, {}, 32),
}
# Bereiche [x, y, b, h] in Spielpixeln, in denen der Zustand etwas ändert; außerhalb bleibt das Grundbild
BEREICHE = {
    ("apothekengasse", "faecher_offen"): [[576, 206, 130, 44]],
    ("kuehlung", "taut"): [[215, 185, 300, 140]],
    ("laboreingang", "offen"): [[255, 120, 150, 155, "ganz"]],
    ("testkammer_1", "offen"): [[412, 108, 112, 168, "ganz"]],
    ("testkammer_2", "laser_gestoert"): [[463, 181, 98, 92, "ganz"]],
    ("testkammer_3", "offen"): [[430, 100, 88, 182, "ganz"]],
    ("kern", "vereist"): [[290, 126, 60, 100, "ganz"]],
    ("kern", "sockel_leer"): [[290, 126, 60, 100, "ganz"], [260, 150, 140, 160]],
}
# Zustände, die die Nacharbeit selbst aus der Quelle zusammensetzt (Maske danach aus dem Unterschied)
IN_NACHARBEIT = {("widerstandsbasis", "schnee"), ("kueche_orakel", "scherben")}
SCHWELLE = 42      # Farbabstand (RGB), ab dem ein Pixel als geändert gilt
MIN_FLECK = 40     # kleinere zusammenhängende Flecken sind Rauschen


def laden(datei):
    """Original laden und JPEG-Ränder glätten (Median 3×3), als PNG-Puffer für verkleinern()."""
    im = Image.open(datei).convert("RGB").filter(ImageFilter.MedianFilter(3))
    puffer = io.BytesIO()
    im.save(puffer, "PNG")
    puffer.seek(0)
    return puffer


def maske(a, b):
    d = np.sqrt(((a.astype(np.float32) - b.astype(np.float32)) ** 2).sum(-1))
    m = d > SCHWELLE
    m = ndimage.binary_opening(m, iterations=1)
    m = ndimage.binary_closing(m, iterations=3)
    lab, n = ndimage.label(m)
    if n:
        groesse = ndimage.sum(m, lab, range(1, n + 1))
        m = np.isin(lab, 1 + np.nonzero(groesse >= MIN_FLECK)[0])
    m = ndimage.binary_fill_holes(m)
    return ndimage.binary_dilation(m, iterations=1)


# --------------------------------------------------------------------------------------------
# Nacharbeit (Prüfbericht 20.11.); alle Koordinaten in Spielpixeln des jeweiligen Bildes
# --------------------------------------------------------------------------------------------

def naechste(pal, rgb):
    """Palettenfarbe, die rgb am nächsten liegt (OKLab)."""
    z = oklab(np.array([rgb], np.float32))
    return pal[int(((oklab(pal.astype(np.float32)) - z) ** 2).sum(-1).argmin())]


def kopiere(a, x, y, w, h, nx, ny, quelle=None, maske=None):
    """Rechteck (x, y, w, h) aus quelle (Standard: Kopie von a vor der Änderung) nach (nx, ny)."""
    q = (a if quelle is None else quelle)[y:y + h, x:x + w].copy()
    if maske is None:
        a[ny:ny + h, nx:nx + w] = q
    else:
        ziel = a[ny:ny + h, nx:nx + w]
        ziel[maske] = q[maske]


NACHARBEIT = {}   # Raum: [Funktion(bilder, pal) -> bilder], wird unten gefüllt


def fuellen(a, leer, waagerecht=False):
    """Maskierte Pixel mit dem nächsten freien Pixel füllen (euklidisch, oder nur in derselben Zeile:
    gibt auf nassem Boden Spiegelstreifen statt Dreiecken)."""
    if waagerecht:
        alt = a.copy()
        for y in np.nonzero(leer.any(1))[0]:
            frei = np.nonzero(~leer[y])[0]
            for x in np.nonzero(leer[y])[0]:
                a[y, x] = alt[y, frei[np.abs(frei - x).argmin()]]
        return
    _, (iy, ix) = ndimage.distance_transform_edt(leer, return_indices=True)
    a[leer] = a[iy[leer], ix[leer]]


BAYER = np.array([[0, 8, 2, 10], [12, 4, 14, 6], [3, 11, 1, 9], [15, 7, 13, 5]], np.float32) / 16.0 - 0.47


def gerastert(a, flaeche, feld, pal, staerke=14.0):
    """Farbfläche (float RGB) im feld auf die Palette bringen, mit 4×4-Bayer-Raster wie das gemalte Dithering."""
    ys, xs = np.nonzero(feld)
    werte = flaeche[ys, xs] + (BAYER[ys % 4, xs % 4] * staerke)[:, None]
    lab_pal = oklab(pal.astype(np.float32))
    lab = oklab(np.clip(werte, 0, 255))
    a[ys, xs] = pal[((lab[:, None, :] - lab_pal[None]) ** 2).sum(-1).argmin(1)]


def malen(a, x, y, zeilen, farben):
    """Pixel als Text setzen (wie draw_rows): je Zeile ein String, Zeichen → Farbe, „.“ bleibt."""
    for dy, z in enumerate(zeilen):
        for dx, c in enumerate(z):
            if c in farben:
                a[y + dy, x + dx] = farben[c]


# Origami-Einhorn, etwa handgroß (21 × 14): Schweif links, Kopf mit Horn rechts
EINHORN = [
    "..................D..",
    ".................DLD.",
    "................DLD..",
    "..............DDLD...",
    ".............DLLLDD..",
    "............DLLMLLLD.",
    "....DD.....DLLMMDDD..",
    "...DLLD...DLLMMMD....",
    "....DLLDDDLLMMMMD....",
    ".....DLLLLLMMMMMD....",
    ".....DLLLLMMMMMMD....",
    "......DLLLMMDMMD.....",
    "......DLLMMD.DMD.....",
    ".......DDDD...DD.....",
]


def nach_einhorn(bilder, pal):
    """Unterstadt: Origami-Einhorn (44 × 34) durch eines von etwa 21 × 14 ersetzen, eine Stufe
    dunkler; die Pfütze drumherum bleibt (W3-R01-03)."""
    a = bilder[""]
    x0, y0, x1, y1 = 354, 310, 408, 350
    teil = a[y0:y1, x0:x1].astype(int)
    papier = teil.sum(-1) > 430
    lab, n = ndimage.label(ndimage.binary_dilation(papier, iterations=1))
    gr = ndimage.sum(papier, lab, range(1, n + 1))
    papier = lab == (int(np.argmax(gr)) + 1)             # das Einhorn, nicht die Glanzstellen der Pfütze
    leer = np.zeros(a.shape[:2], bool)
    leer[y0:y1, x0:x1] = ndimage.binary_dilation(ndimage.binary_fill_holes(papier), iterations=2)
    fuellen(a, leer, waagerecht=True)
    farben = {"D": pal[np.argmin(pal.astype(int).sum(-1))], "L": naechste(pal, (165, 225, 220)),
              "M": naechste(pal, (110, 160, 170))}
    malen(a, 372, 330, EINHORN, farben)      # Fuß bei y 343, mitten in der Pfütze
    return bilder


def vordergrund_schneiden(name, rechtecke):
    """Vordergrundteil als Ausschnitt aus Rechtecken (das Bild bleibt darunter unverändert)."""
    def schritt(bilder, pal):
        a = bilder[""]
        m = np.zeros(a.shape[:2], bool)
        for x, y, w, h in rechtecke:
            m[y:y + h, x:x + w] = True
        ys, xs = np.nonzero(m)
        x0, y0, x1, y1 = xs.min(), ys.min(), xs.max() + 1, ys.max() + 1
        teil = np.zeros((y1 - y0, x1 - x0, 4), np.uint8)
        teil[..., :3] = a[y0:y1, x0:x1]
        teil[..., 3] = m[y0:y1, x0:x1] * 255
        Image.fromarray(teil).save(PROPS / f"{name}_{VERSION}.png")
        print("  Vordergrund", name, "rect", [int(x0), int(y0), int(x1 - x0), int(y1 - y0)], "baseline", int(y1))
        return bilder
    return schritt


# Tresen der Nudelbude mit Hockern und allem, was auf dem Tresen steht (Herr Vier steht dahinter)
TRESEN = [[72, 213, 251, 86], [103, 195, 32, 18], [137, 176, 69, 37], [210, 197, 63, 16], [277, 192, 13, 21]]
NACHARBEIT["unterstadt_strasse"] = [nach_einhorn, vordergrund_schneiden("w3_tresen_nudelbude", TRESEN)]


def nach_basis(bilder, pal):
    """Widerstandsbasis: leeren Türrahmen zwischen Luke und Kapsel 1 übermalen, Tasse an die
    Tischkante; Zustand „kaffee“: Tasse weg, Kaffeespur von der Tischkante in die Ecke."""
    a = bilder[""]
    alt = a.copy()
    # 1. Türrahmen (x 181–262, y 96–283) mit der Wand übermalen: je Zeile Verlauf zwischen der Wand links
    #    (x 176–179) und rechts (x 264–268), unter Kapsel-Höhe nach unten fortgesetzt, leicht gerastert
    links = alt[:, 176:180].astype(np.float32).mean(1)
    rechts = alt[:, 266:271].astype(np.float32).mean(1)
    flaeche = np.zeros((360, 1280, 3), np.float32)
    for y in range(96, 232):
        t = (np.arange(181, 266) - 180) / 86.0
        flaeche[y, 181:266] = links[y] * (1 - t[:, None]) + rechts[min(y, 211)] * t[:, None]
    for y in range(212, 281):
        t = (np.arange(181, 238) - 180) / 84.0
        dunkler = 1.0 - 0.18 * (y - 212) / 68.0
        flaeche[y, 181:238] = (links[y] * (1 - t[:, None]) + flaeche[211, 181:238] * t[:, None]) * dunkler
    feld = np.zeros((360, 1280), bool)
    feld[96:212, 181:266] = True
    feld[212:281, 181:238] = True
    for x in range(238, 266):                              # über der schrägen Oberkante von Kapsel 1
        feld[212:int(228 - 0.5 * (x - 240)) - 1, x] = True
    gerastert(a, flaeche, feld, pal)
    dunkel = pal[np.argmin(pal.astype(int).sum(-1))]
    a[281, 181:238] = dunkel                               # Fußleiste wie an der Wand rechts
    a[282:285, 181:238] = alt[286:289, 181:238]            # Boden unter der alten Schwelle
    # 2. Kalles Tasse (x 1029–1050, y 218–239) an die vordere Tischkante (Skript: „genau am Rand“)
    bx0, by0, bx1, by1 = 1026, 214, 1054, 241
    box = alt[by0:by1, bx0:bx1].astype(int).sum(-1)
    kandidat = (box < 200) | (box > 470)
    kandidat[10:13, :] &= False                            # Hinterkante des Tisches (y 224–226) nicht mitnehmen
    kandidat[10:13, 3:25] |= ((box < 200) | (box > 470))[10:13, 3:25]
    lab, _ = ndimage.label(kandidat)
    tasse = ndimage.binary_fill_holes(lab == lab[14, 14])
    leer = np.zeros(a.shape[:2], bool)
    leer[by0:by1, bx0:bx1] = ndimage.binary_dilation(tasse, iterations=1)
    schatten = alt[232:241, 1030:1056].astype(int).sum(-1) < 400          # Schatten der Tasse auf dem Tisch
    leer[232:241, 1030:1056] |= schatten
    fuellen(a, leer, waagerecht=True)
    TASSE_DX, TASSE_DY = 30, 2
    ohne_tasse = a.copy()
    kopiere(a, bx0, by0, bx1 - bx0, by1 - by0, bx0 + TASSE_DX, by0 + TASSE_DY, quelle=alt, maske=tasse)
    # 3. Zustand „schnee“ (W3_SCHNEE): Gemini hat das ganze Bild neu gezeichnet und gedehnt, darum nur
    #    das Fenster (Rechteck), Schnee auf Kapsel 1 und 2 und die Flocken einzeln aus der Quelle
    q = bilder["schnee"]
    sch = a.copy()
    sch[8:88, 214:342] = q[8:88, 214:342]
    weiss, schatten = np.array((0xe8, 0xf0, 0xf8)), np.array((0xa8, 0xc0, 0xd8))
    hell = q.astype(int).sum(-1)
    flocken = np.zeros(hell.shape, bool)
    flocken[84:212, 250:420] = (hell[84:212, 250:420] > 540) & (np.ptp(q[84:212, 250:420].astype(int), axis=-1) < 50)
    lab, n = ndimage.label(flocken)
    if n:
        gr = ndimage.sum(flocken, lab, range(1, n + 1))
        flocken = np.isin(lab, 1 + np.nonzero(gr <= 4)[0])            # nur einzelne Flocken, kein Schnee am Rahmen
    sch[flocken] = weiss
    haube = np.zeros(hell.shape, bool)
    haube[200:228, 240:420] = (hell[200:228, 240:420] > 520) & (np.ptp(q[200:228, 240:420].astype(int), axis=-1) < 60)
    haube = ndimage.binary_opening(haube) | (ndimage.binary_dilation(haube) & (hell > 470))
    sch[haube] = np.where((hell[haube] > 600)[:, None], weiss, schatten)
    bilder["schnee"] = sch
    # 4. Zustand „kaffee“ (R13): Tasse weg, zähe Kaffeespur von unter der Tischkante in die rechte Ecke,
    #    schwarzbraun mit Glanz, deutlich anders als die blaugrauen Ölflecken (Prüfbericht zu 3qpige)
    k = ohne_tasse
    from PIL import ImageDraw
    spur = Image.new("L", (1280, 360))
    d = ImageDraw.Draw(spur)
    d.ellipse([1054, 305, 1094, 321], fill=255)                        # Pfütze unter der Tischkante
    d.ellipse([1044, 309, 1062, 317], fill=255)
    zufall = np.random.default_rng(13)
    pfad = [(1078, 314), (1104, 321), (1132, 325), (1162, 326), (1192, 323), (1222, 317), (1250, 311), (1276, 305)]
    for (x0_, y0_), (x1_, y1_) in zip(pfad, pfad[1:]):
        for t in np.linspace(0, 1, 12, endpoint=False):
            x = x0_ + (x1_ - x0_) * t
            y = y0_ + (y1_ - y0_) * t + np.sin(x / 9.0) * 1.5
            r = 2.6 + zufall.random() * 2.2
            d.ellipse([x - r * 1.6, y - r, x + r * 1.6, y + r], fill=255)
    d.ellipse([1232, 298, 1280, 316], fill=255)                        # Lache in der Ecke
    for x, y, r in ((1118, 328, 2), (1176, 330, 1.5), (1214, 323, 2), (1098, 326, 1.5)):   # Spritzer
        d.ellipse([x - r * 1.5, y - r, x + r * 1.5, y + r], fill=255)
    m = np.asarray(spur) > 0
    kaffee, glanz, rand = (0x2b, 0x1a, 0x12), (0x6b, 0x4a, 0x36), (0x16, 0x0c, 0x08)
    k[m] = kaffee
    unten = m & ~np.roll(m, -2, axis=0)                                # Unterkante dunkler (Wölbung)
    k[unten] = (0x1f, 0x12, 0x0c)
    k[ndimage.binary_dilation(m) & ~m] = rand
    oben = m & ~np.roll(m, 1, axis=0)                                  # Oberkante: Licht von oben
    ys, xs = np.nonzero(np.roll(oben, 1, axis=0) & m)
    for y, x in zip(ys, xs):
        if (x // 5) % 3 != 2:                                          # unterbrochener Glanzstreifen
            k[y, x] = glanz
    for x, y in ((1066, 310), (1067, 310), (1150, 324), (1151, 324), (1255, 305), (1256, 305), (1257, 306)):
        k[y, x] = (0x8a, 0x64, 0x48)                                   # Glanzpunkte
    bilder["kaffee"] = k
    return bilder


NACHARBEIT["widerstandsbasis"] = [nach_basis]


def _regal_drei_glaeser(a):
    """Regal über dem Eieruhr-Brett: Brett 13 px nach links verlängern, Sparschwein 13 und Radio 15 px nach
    links, in die Lücke eine Kopie des rechten Glases (Zimt, Zucker, „Nicht anfassen“: drei Gläser)."""
    alt = a.copy()
    kopiere(a, 391, 138, 13, 12, 378, 138, quelle=alt)       # linkes Brettende samt Schatten
    kopiere(a, 415, 139, 4, 7, 391, 139, quelle=alt)         # Brettmitte über dem alten Ende
    kopiere(a, 393, 110, 37, 30, 380, 110, quelle=alt)       # Sparschwein (oder leere Stelle)
    kopiere(a, 430, 103, 19, 37, 415, 103, quelle=alt)       # Radio mit Antenne
    kopiere(a, 436, 84, 24, 16, 436, 103, quelle=alt)        # alte Antenne mit Tapete darüber verdecken
    kopiere(a, 462, 114, 15, 26, 434, 114, quelle=alt)       # drittes Glas


def nach_kueche(bilder, pal):
    """Küche: drittes Glas auf dem Regal (W3_KUCH_MAX_0700), in beiden Zuständen gleich; die Scherben
    nur an Regal- und Bodenstelle aus der Variante übernehmen."""
    _regal_drei_glaeser(bilder[""])
    _regal_drei_glaeser(bilder["scherben"])
    g, v = bilder[""], bilder["scherben"]
    out = g.copy()
    out[108:141, 378:418] = v[108:141, 378:418]                 # Sparschwein weg
    d = np.sqrt(((g.astype(int) - v.astype(int)) ** 2).sum(-1)) > 42
    boden = np.zeros(d.shape, bool)
    boden[270:320, 415:485] = d[270:320, 415:485]
    lab, n = ndimage.label(ndimage.binary_closing(boden, iterations=1))
    if n:
        gr = ndimage.sum(boden, lab, range(1, n + 1))
        boden = ndimage.binary_dilation(np.isin(lab, 1 + np.nonzero(gr >= 12)[0]))
    out[boden] = v[boden]
    bilder["scherben"] = out
    return bilder


NACHARBEIT["kueche_orakel"] = [nach_kueche]


# Kritzelei an der Wand in Kammer 2: unlesbare Krakel statt Schein-Schrift; je Zeile (y, x von, x bis)
KRAKEL = [(226, 292, 318), (226, 326, 346), (233, 297, 340), (240, 292, 312), (240, 318, 344),
          (247, 300, 334), (255, 296, 316), (254, 336, 350)]


def nach_kammer2(bilder, pal):
    """Kammer 2: Schein-Schrift der Kritzelei (x 288–352, y 218–266) entfernen und durch Krakel ersetzen,
    die man nicht lesen kann; den echten Satz zeigt die Nahansicht (Prüfbericht zu ha447k)."""
    for name, a in bilder.items():
        if a is None:
            continue
        alt = a.copy()
        dunkel = alt[218:268, 288:354].astype(int).sum(-1) < np.where(np.arange(288, 354) < 320, 715, 625)[None, :]
        for x in range(288, 354):
            if x in (320, 321):
                continue                                   # Fuge zwischen den Platten bleibt
            wand = alt[214, x] if x < 320 else alt[214, x]
            spalte = dunkel[:, x - 288]
            a[218:268, x][spalte] = wand
        tinte = alt[230, 318] if alt[230, 318].astype(int).sum() < 200 else pal[np.argmin(pal.astype(int).sum(-1))]
        tinte = pal[np.argmin(pal.astype(int).sum(-1))]
        for y, x0_, x1_ in KRAKEL:
            for x in range(x0_, x1_):
                if x in (320, 321):
                    continue
                dy = (0, -1, -2, -1, 0, 1)[(x * 7 // 5 + y) % 6]
                a[y + dy, x] = tinte
    return bilder


def nach_laser_rot(bilder, pal):
    """Kammer 2: Die Palette macht die tödlichen Strahlen orange wie die Warnstreifen; zurück auf Rot
    (Skript: „Ein roter Strahl“), nur zwischen den Pfosten oberhalb der Streifen."""
    a = bilder[""]
    feld = a[182:269, 463:560].astype(int)
    r, g, b = feld[..., 0], feld[..., 1], feld[..., 2]
    orange = (r > 170) & (g > 60) & (g < 190) & (b < 150) & (r - b > 60)
    hell = orange & (g > 140)
    t = a[182:269, 463:560]
    t[orange & ~hell] = (0xd8, 0x24, 0x3c)
    t[hell] = (0xff, 0x8c, 0x9c)
    return bilder


NACHARBEIT["testkammer_2"] = [nach_kammer2, nach_laser_rot]


# Nachttisch mit Radiowecker vorn links (Umriss je Fassung; die Nacht ist um 1–2 px gedehnt)
NACHTTISCH = {
    "stadtstrasse": {"umriss": [(167, 262), (216, 262), (216, 275), (229, 272), (230, 278), (227, 281), (226, 330),
                                (210, 339), (155, 339), (155, 288), (150, 288), (150, 281), (160, 276), (167, 275)],
                     "anzeige": (171, 267, 37, 9)},
    "stadtstrasse_nacht": {"umriss": [(170, 262), (218, 262), (218, 276), (231, 272), (232, 279), (229, 282), (228, 331),
                                      (212, 340), (157, 340), (157, 289), (152, 289), (152, 282), (162, 277),
                                      (170, 276)],
                           "anzeige": (173, 268, 37, 9)},
}


def nach_nachttisch(raum):
    def schritt(bilder, pal):
        """Stadtstraße: Weckeranzeige schwarz (die Ziffern 5:59 und 6:00 zeigt der Effekt), Nachttisch samt
        Wecker als eigenes Vordergrundteil (AP-09, W3-R06-06) und dahinter Fahrbahn und Gehweg fortsetzen."""
        from PIL import ImageDraw
        a = bilder[""]
        n = NACHTTISCH[raum]
        x, y, w, h = n["anzeige"]
        a[y:y + h, x:x + w] = pal[np.argmin(pal.astype(int).sum(-1))]
        bild = Image.new("L", (a.shape[1], a.shape[0]))
        ImageDraw.Draw(bild).polygon(n["umriss"], fill=255, outline=255)
        m = np.asarray(bild) > 0                            # Umriss von Hand nachgezogen (9-fach vergrößert)
        ys, xs = np.nonzero(m)
        x0, y0, x1, y1 = xs.min(), ys.min(), xs.max() + 1, ys.max() + 1
        teil = np.zeros((y1 - y0, x1 - x0, 4), np.uint8)
        teil[..., :3] = a[y0:y1, x0:x1]
        teil[..., 3] = m[y0:y1, x0:x1] * 255
        Image.fromarray(teil).save(PROPS / f"w3_nachttisch{'_nacht' if 'nacht' in raum else ''}_{VERSION}.png")
        print("  Nachttisch", raum, "rect", [int(x0), int(y0), int(x1 - x0), int(y1 - y0)], "baseline", int(y1))
        fuellen(a, m, waagerecht=True)
        return bilder
    return schritt


NACHARBEIT["stadtstrasse"] = [nach_nachttisch("stadtstrasse")]
NACHARBEIT["stadtstrasse_nacht"] = [nach_nachttisch("stadtstrasse_nacht")]


def nach_laboreingang(bilder, pal):
    """Mopp an der Wand weg (Sebastian, 21.11.: „mopp kann raus“; der Hausmeister hat seinen eigenen).
    Je Band die Stelle derselben Zeilen, deren Rand am besten anschließt (gesucht über die Randpixel):
    Wand hinter dem Stiel 351 px weiter rechts, Warnstreifen 343 px weiter rechts. Boden darunter neu
    gerastert: je Zeile Verlauf zwischen dem Boden links (x 124–133) und rechts vom Eimer (x 226–235)."""
    for name, a in bilder.items():
        if a is None:
            continue
        alt = a.copy()
        a[166:268, 146:162] = alt[166:268, 497:513]
        a[268:289, 136:171] = alt[268:289, 479:514]
        y0, y1, x0, x1 = 289, 305, 134, 174
        links = ndimage.uniform_filter1d(alt[y0:y1, 124:134].astype(np.float32).mean(1), 7, axis=0)
        rechts = ndimage.uniform_filter1d(alt[y0:y1, 226:236].astype(np.float32).mean(1), 7, axis=0)
        t = ((np.arange(x0, x1) - 129) / (231 - 129))[None, :, None]
        flaeche = np.zeros(a.shape, np.float32)
        flaeche[y0:y1, x0:x1] = links[:, None] * (1 - t) + rechts[:, None] * t
        feld = np.zeros(a.shape[:2], bool)
        feld[y0:y1, x0:x1] = True
        gerastert(a, flaeche, feld, pal)
    return bilder


NACHARBEIT["laboreingang"] = [nach_laboreingang]


def raum_bauen(quelle, raum, masken=None):
    W, grund, varianten, kombis, n_farben = RAEUME[raum]
    H = 360
    klein = {"": verkleinern(laden(quelle / f"{grund}.jpeg"), W, H)}
    for name, datei in varianten.items():
        if datei:
            klein[name] = verkleinern(laden(quelle / f"{datei}.jpeg"), W, H)
    rng = np.random.default_rng(1)
    px = np.concatenate([k.reshape(-1, 3)[rng.choice(W * H, 80000, replace=False)] for k in klein.values()])
    pal, _ = palette_finden(px.astype(np.float32), n_farben)
    bilder = {n: np.asarray(farben_32(k, palette=pal)).copy() for n, k in klein.items()}
    # Masken der gelieferten Zustände (aus den Bildern vor der Palette, nur in den BEREICHEN)
    m = {}
    for name, datei in varianten.items():
        if not datei:
            if name not in bilder:
                bilder[name] = None       # entsteht in der Nacharbeit
            continue
        mm = maske(klein[""], klein[name])
        if (raum, name) in BEREICHE:
            b = np.zeros_like(mm)
            ganz = np.zeros_like(mm)
            for x, y, w, h, *art in BEREICHE[(raum, name)]:
                (ganz if art == ["ganz"] else b)[y:y + h, x:x + w] = True
            mm = (mm & b) | ganz
        m[name] = mm
    for f in NACHARBEIT.get(raum, []):
        bilder = f(bilder, pal)
    grundbild = bilder[""]
    for name in bilder:            # gemalte Zustände: Maske = Unterschied zum nachgearbeiteten Grundbild
        if name and (name not in m or (raum, name) in IN_NACHARBEIT):
            m[name] = (bilder[name] != grundbild).any(-1)
    Image.fromarray(grundbild).save(ZIEL / f"w3_bg_{raum}_{VERSION}.png")
    print(raum, "Grundbild", W, "x", H, len(np.unique(grundbild.reshape(-1, 3), axis=0)), "Farben")
    for name in list(m) + list(kombis):
        out = grundbild.copy()
        for teil in kombis.get(name, [name]):
            out = np.where(m[teil][..., None], bilder[teil], out)
        m.setdefault(name, np.logical_or.reduce([m[t] for t in kombis.get(name, [name])]))
        Image.fromarray(out).save(ZIEL / f"w3_bg_{raum}_{name}_{VERSION}.png")
        print(" ", name, f"{m[name].mean() * 100:.1f} % geändert")
        if masken:
            masken.mkdir(parents=True, exist_ok=True)
            vorschau = grundbild.copy()
            vorschau[m[name]] = (vorschau[m[name]] * 0.4 + np.array([255, 0, 255]) * 0.6).astype(np.uint8)
            Image.fromarray(vorschau).save(masken / f"{raum}_{name}.png")
    return bilder


def main():
    quelle = Path(sys.argv[1])
    masken = Path(sys.argv[sys.argv.index("--masken") + 1]) if "--masken" in sys.argv else None
    nur = [a for a in sys.argv[2:] if a in RAEUME]
    for raum in RAEUME:
        if nur and raum not in nur:
            continue
        raum_bauen(quelle, raum, masken)


if __name__ == "__main__":
    main()
