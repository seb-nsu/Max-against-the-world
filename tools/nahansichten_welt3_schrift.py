"""Schrift und Zeichen auf die Nahansichten von Welt 3 (Pixelify Sans ohne Kantenglättung), deutsch und englisch.
Die englischen Bilder heißen <name>_en.png. Texte wie im Skript (texte.csv: W3_STR_MAX_0070, W3_TURM_MAX_0460–0480,
W3_KUCH_MAX_0550/0560, W3_KAM2_MAX_0140–0150, W3_PIEP_MAX_0220/0225). Ziffern aus der Welt-2-Tabelle.

Fassung 2 (20.11., Sebastians Bilder): Die Seiten liegen schräg im Bild. Jede Schreibfläche wird deshalb flach
gezeichnet (Papier, Linien, Schrift) und perspektivisch auf ihr Viereck im Bild gelegt; die Schrift wird dabei
vierfach überabgetastet und erst dann auf Pixel gebracht, damit sie lesbar bleibt. Die gemalte Schein-Schrift
verschwindet so unter dem neuen Papier.

Aufruf:  python3 tools/nahansichten_welt3_schrift.py [quellordner] [zielordner]
Quelle: mit tools/pixelieren.py umgerechnete Gemini-Bilder W3-N01 … W3-N05 (640×360)."""
import sys
from pathlib import Path
import numpy as np
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
from nahansichten_welt2_schrift import schreiben, umbrechen  # noqa: E402

S = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(r"E:/Game Engine/Grafiken/assets/welt3/nahansichten/pixel")
Z = Path(sys.argv[2]) if len(sys.argv) > 2 else ROOT / "game" / "grafik" / "nahansichten"
TTF = str(ROOT / "game" / "schriften" / "pixelify-sans.ttf")
TINTE = (38, 43, 68); ROT = (162, 38, 51); MARKER = (24, 20, 37); GRAU = (90, 105, 136); BLEI = (120, 128, 150)


def font(g):
    return ImageFont.truetype(TTF, g)


def koeff(ziel, quelle):
    """Perspektive: für jeden Zielpunkt den Quellpunkt (PIL-Transform rechnet rückwärts)."""
    A, b = [], []
    for (x, y), (u, v) in zip(ziel, quelle):
        A.append([x, y, 1, 0, 0, 0, -u * x, -u * y]); b.append(u)
        A.append([0, 0, 0, x, y, 1, -v * x, -v * y]); b.append(v)
    return np.linalg.solve(np.array(A, float), np.array(b, float)).tolist()


def auflegen(bild, viereck, flach, tinte, k=4):
    """flach: RGB-Fläche (Papier und Linien), tinte: Liste (Maske als L-Bild, Farbe) in derselben Größe.
    viereck: Zielpunkte links oben, rechts oben, rechts unten, links unten im Bild."""
    w, h = flach.size; W, H = bild.size
    q = [(x * k, y * k) for x, y in viereck]
    c = koeff(q, [(0, 0), (w * k, 0), (w * k, h * k), (0, h * k)])
    gross = flach.resize((w * k, h * k), Image.NEAREST)
    papier = gross.transform((W * k, H * k), Image.PERSPECTIVE, c, Image.NEAREST).resize((W, H), Image.NEAREST)
    m = Image.new("L", (W * k, H * k), 0); ImageDraw.Draw(m).polygon(q, fill=255)
    m = np.asarray(m.resize((W, H), Image.BOX)) > 127
    a = np.asarray(bild).copy(); a[m] = np.asarray(papier)[m]
    for maske, farbe in tinte:
        mg = maske if maske.size == (w * k, h * k) else maske.resize((w * k, h * k), Image.NEAREST)
        mt = np.asarray(mg.transform((W * k, H * k), Image.PERSPECTIVE, c, Image.BILINEAR).resize((W, H), Image.BOX))
        a[(mt > 100) & m] = farbe
    return Image.fromarray(a)


class Flaeche:
    """Flache Schreibfläche: Papier mit Linien (einfach) und Tintenmasken je Farbe (vierfach, Schrift in
    vierfacher Größe gesetzt, damit sie nach der Perspektive sauber auf Pixel kommt). Koordinaten immer einfach."""
    K = 4

    def __init__(self, w, h, papier):
        self.p = Image.new("RGB", (w, h), papier); self.dp = ImageDraw.Draw(self.p)
        self.m = {}

    def tinte(self, farbe):
        if farbe not in self.m:
            self.m[farbe] = Image.new("L", (self.p.size[0] * self.K, self.p.size[1] * self.K), 0)
        return ImageDraw.Draw(self.m[farbe])

    def text(self, xy, t, f, farbe):
        if any(ch.isdigit() for ch in t) and f.size == 12:
            # Ziffern aus der Welt-2-Tabelle (Pixelify verwechselt 4/9 und 2/8): einfach zeichnen, dann vergrößern
            klein = Image.new("L", self.p.size, 0); dk = ImageDraw.Draw(klein); dk.fontmode = "1"
            schreiben(dk, xy, t, f, 255)
            gross = klein.resize(self.m.setdefault(farbe, Image.new("L", (self.p.size[0] * self.K, self.p.size[1] * self.K), 0)).size, Image.NEAREST)
            self.m[farbe] = Image.fromarray(np.maximum(np.asarray(self.m[farbe]), np.asarray(gross)))
            return
        self.tinte(farbe).text((xy[0] * self.K, xy[1] * self.K), t, font=font(f.size * self.K), fill=255)

    def breite(self, t, f):
        return ImageDraw.Draw(self.p).textlength(t, font=f)

    def block(self, t, f, x0, y0, x1, farbe, abstand=None):
        zeilen = umbrechen(ImageDraw.Draw(self.p), t, f, x1 - x0); h = abstand or f.size + 3
        for i, z in enumerate(zeilen):
            self.text((x0, y0 + i * h), z, f, farbe)
        return y0 + len(zeilen) * h

    def form(self, farbe):
        """Zeichenfläche für Formen in einfachen Koordinaten (wird vierfach gezeichnet)."""
        K = self.K; d = self.tinte(farbe)

        class F:
            def ellipse(s, b, **kw): d.ellipse([v * K for v in b], **{**kw, **({"width": kw.get("width", 1) * K} if "outline" in kw else {})})
            def line(s, b, **kw): d.line([v * K for v in b], fill=kw.get("fill", 255), width=kw.get("width", 1) * K)
            def rect(s, b, r=0): d.rounded_rectangle([v * K for v in b], r * K, fill=255)
            def point(s, xy): d.rectangle((xy[0] * K, xy[1] * K, xy[0] * K + K - 1, xy[1] * K + K - 1), fill=255)
            def arc(s, b, a0, a1): d.arc([v * K for v in b], a0, a1, fill=255, width=K)
        return F()


def papierfarbe(bild, box):
    a = np.asarray(bild.crop(box)).reshape(-1, 3)
    hell = a[a.sum(1) >= np.percentile(a.sum(1), 60)]
    return tuple(int(v) for v in np.median(hell, 0))


def dunkler(c, n):
    return tuple(max(0, v - n) for v in c)


T = {
    "de": {
        "tb_name": "Konner, Sahra", "tb_kopf": "Konner", "tb_n": "47×",
        "akte_titel": "Regel  1", "akte": "Testpersonen sind zu beschützen. Vor allem. Vor allen. Vor sich selbst.",
        "stempel": ["M.U.T.T.I.", "Fürsorge +", "Verfolgung"],
        "bericht": "Bericht", "akte2": "Testperson 48 hat im Regen gestanden und nichts getan. Verdächtig menschlich.",
        "koch_titel": "Regel  2", "koch": "Nach jedem Rührgang gibt es Kuchen.",
        "koch2": "Warnung: Das Gerät kann Zuneigung entwickeln. Nicht in der Nähe von Kindern aufladen.",
        "kritz": ["DER KUCHEN", "EXISTIERT", "NICHT."],
        "regel3": "Regel 3: Zucker ist gesundheitsschädlich und verboten. Gez. M.U.T.T.I.",
        "morse_kopf": ["Miau", "heißt"], "morse": [("•", "E"), ("— —", "T"), ("•  •", "I"), ("— •", "N"),
                                                    ("• —", "A"), ("•••", "S"), ("~~~", "Thunfisch")],
        "morse_fuss": "Schnurren heißt OK.",
    },
    "en": {
        "tb_name": "Konner, Sahra", "tb_kopf": "Konner", "tb_n": "47×",
        "akte_titel": "Rule  1", "akte": "Test subjects are to be protected. From everything. From everyone. From themselves.",
        "stempel": ["M.O.T.H.E.R.", "Care +", "Pursuit"],
        "bericht": "Report", "akte2": "Test subject 48 stood in the rain and did nothing. Suspiciously human.",
        "koch_titel": "Rule  2", "koch": "After every mixing cycle there is cake.",
        "koch2": "Warning: the appliance may develop affection. Do not charge near children.",
        "kritz": ["THE CAKE", "DOES NOT", "EXIST."],
        "regel3": "Rule 3: Sugar is harmful to health and forbidden. Signed, M.O.T.H.E.R.",
        "morse_kopf": ["Meow", "means"], "morse": [("•", "E"), ("— —", "T"), ("•  •", "I"), ("— •", "N"),
                                                     ("• —", "A"), ("•••", "S"), ("~~~", "Tuna")],
        "morse_fuss": "Purring means OK.",
    },
}


def telefonbuch(t):
    im = Image.open(S / "W3-N01_telefonbuchseite.png").convert("RGB")
    pap = papierfarbe(im, (420, 150, 470, 200))
    W, H = 94, 214
    f = Flaeche(W, H, pap)
    f.dp.rectangle((0, 0, W - 1, 12), fill=dunkler(pap, 60))                     # Kopfbalken
    f.text((3, -1), t["tb_kopf"], font(12), "kopf")
    for i in range(13):
        y = 16 + i * 14
        f.dp.line((0, y + 13, W, y + 13), fill=dunkler(pap, 18))
        f.text((3, y), t["tb_name"], font(12), "tinte")
    f.text((3, 16 + 13 * 14 - 2), "… " + t["tb_n"], font(12), "rot")
    for y in range(14, 16 + 13 * 14, 3):                                          # Bleistift-Klammer
        f.form("blei").point((W - 3, y))
    farben = {"kopf": (236, 240, 242), "tinte": TINTE, "rot": ROT, "blei": BLEI}
    return auflegen(im, [(399, 88), (488, 106), (406, 309), (301, 291)], f.p, [(m, farben[k]) for k, m in f.m.items()])


def stempel(f, cx, cy, r, zeilen):
    d = f.form("rot")
    for rr in (r, r - 3):
        d.ellipse((cx - rr, cy - rr, cx + rr, cy + rr), outline=255)
    for i, z in enumerate(zeilen):
        f.text((cx - f.breite(z, font(12)) / 2, cy - 22 + i * 14), z, font(12), "rot")


def akte(t):
    im = Image.open(S / "W3-N02_akte.png").convert("RGB")
    pap = papierfarbe(im, (180, 140, 240, 180))
    linie = dunkler(pap, 70)
    W, H = 200, 250                                   # linke Seite: Regel 1 und Stempel
    f = Flaeche(W, H, pap)
    f.dp.rectangle((6, 6, W - 8, H - 8), outline=linie)
    f.text((14, 12), t["akte_titel"], font(12), "tinte"); f.text((15, 12), t["akte_titel"], font(12), "tinte")
    f.dp.line((12, 28, W - 14, 28), fill=linie)
    unten = f.block(t["akte"], font(12), 14, 34, W - 16, "tinte", 15)
    for y in range(unten + 6, H - 70, 14):
        f.dp.line((14, y, W - 16, y), fill=dunkler(pap, 25))
    stempel(f, W - 54, H - 50, 44, t["stempel"])
    farben = {"tinte": TINTE, "rot": ROT}
    im = auflegen(im, [(84, 113), (271, 75), (346, 311), (127, 340)], f.p, [(m, farben[k]) for k, m in f.m.items()])
    W, H = 190, 200                                   # rechte Seite: Bericht über Max (unter der Büroklammer-Notiz)
    f = Flaeche(W, H, pap)
    f.dp.rectangle((4, 4, W - 6, H - 6), outline=linie)
    f.text((12, 10), t["bericht"], font(12), "grau")
    f.dp.line((10, 26, W - 12, 26), fill=linie)
    unten = f.block(t["akte2"], font(12), 12, 32, W - 14, "tinte", 15)
    for y in range(unten + 8, H - 14, 14):
        f.dp.line((12, y, W - 14, y), fill=dunkler(pap, 25))
    farben = {"tinte": TINTE, "grau": GRAU}
    return auflegen(im, [(316, 94), (500, 80), (562, 240), (368, 298)], f.p, [(m, farben[k]) for k, m in f.m.items()])


def kochbuch(t):
    im = Image.open(S / "W3-N03_kochbuch.png").convert("RGB")
    pap = papierfarbe(im, (420, 60, 470, 90))
    W, H = 200, 228
    f = Flaeche(W, H, pap)
    f.text((8, 6), t["koch_titel"], font(12), "tinte"); f.text((9, 6), t["koch_titel"], font(12), "tinte")
    unten = f.block(t["koch"], font(12), 8, 28, W - 10, "tinte", 15)
    d = f.form("rot")
    for k in range(2):   # zweimal unterstrichen
        d.line((8, unten + 1 + k * 3, W - 18, unten + 1 + k * 3 - k))
    f.dp.rectangle((8, 108, W - 14, 196), fill=(244, 230, 170), outline=(184, 150, 90))
    f.block(t["koch2"], font(12), 14, 112, W - 20, "grau", 14)
    farben = {"tinte": TINTE, "rot": ROT, "grau": GRAU}
    return auflegen(im, [(342, 44), (546, 44), (550, 272), (346, 274)], f.p, [(m, farben[k]) for k, m in f.m.items()])


def kritzelei(t):
    import random
    from scipy import ndimage
    im = Image.open(S / "W3-N04_kritzelei.png").convert("RGB")
    a = np.asarray(im).copy()
    # gemalte Schein-Kritzelei und Schein-Druckzeilen entfernen: Wand aus den sauberen Paneelen links nachbauen
    # (Fugen bei x 145, 318, 497 und y 148, 290; zwei Stücke, damit die Fuge bei 497 an ihrer Stelle bleibt)
    q = np.asarray(Image.open(S / "W3-N04_kritzelei.png").convert("RGB"))
    a[150:332, 320:484] = q[150:332, 150:314]
    a[150:332, 484:614] = q[150:332, 132:262]
    im = Image.fromarray(a); d = ImageDraw.Draw(im); d.fontmode = "1"
    f = font(32); x0, y0 = 40, 154
    for i, z in enumerate(t["kritz"]):
        for dx, dy in ((0, 0), (1, 0), (0, 1)):          # Filzstift: fetter
            d.text((x0 + dx + i * 5, y0 + i * 34 + dy + (i % 2)), z, font=f, fill=MARKER)
    rnd = random.Random(3)
    for k in range(3):                                    # dreimal unterstrichen, zittrig
        y = y0 + 3 * 34 + 8 + k * 4; x = x0
        while x < x0 + 236:
            nx = x + rnd.randint(8, 16)
            d.line((x, y + rnd.randint(-1, 1), nx, y + rnd.randint(-1, 1)), fill=MARKER, width=2); x = nx
    cx, cy = x0 + 122, 302                                # kleiner Kuchen mit Kerze, zweimal durchgestrichen
    d.rectangle((cx - 22, cy, cx + 22, cy + 16), outline=MARKER, width=2)      # unterer Boden
    d.rectangle((cx - 14, cy - 10, cx + 14, cy), outline=MARKER, width=2)      # obere Lage
    for x in range(cx - 20, cx + 21, 6):                                         # Sahne-Wellen
        d.arc((x - 3, cy - 2, x + 3, cy + 4), 0, 180, fill=MARKER)
    d.line((cx, cy - 18, cx, cy - 11), fill=MARKER, width=2)
    d.ellipse((cx - 2, cy - 24, cx + 2, cy - 19), fill=(247, 118, 34))
    d.line((cx - 30, cy + 22, cx + 30, cy - 22), fill=MARKER, width=3)
    d.line((cx - 30, cy - 18, cx + 30, cy + 24), fill=MARKER, width=3)
    d.rectangle((486, 172, 632, 274), fill=(150, 160, 176)); d.rectangle((488, 174, 630, 272), fill=(232, 236, 242))
    for sx, sy in ((491, 177), (627, 177), (491, 269), (627, 269)):
        d.point((sx, sy), fill=(90, 105, 136))
    for i, z in enumerate(umbrechen(d, t["regel3"], font(12), 132)):
        schreiben(d, (494, 180 + i * 14), z, font(12), TINTE)
    return im


def morse(t):
    im = Image.open(S / "W3-N05_morse_tabelle.png").convert("RGB")
    pap = papierfarbe(im, (300, 120, 380, 180))
    linie = (58, 68, 102)
    W, H = 290, 230
    f = Flaeche(W, H, pap)
    zeilen = 9; zh = H / zeilen; sp = int(W * 0.52)
    f.dp.rectangle((0, 0, W - 1, H - 1), outline=linie, width=2)
    for i in range(1, zeilen):
        f.dp.line((0, int(i * zh), W, int(i * zh)), fill=linie)
    f.dp.line((sp, 0, sp, H), fill=linie)
    f.text((10, 4), t["morse_kopf"][0], font(12), "grau"); f.text((sp + 10, 4), t["morse_kopf"][1], font(12), "grau")
    d = f.form("tinte")
    for i, (zeichen, bedeutung) in enumerate(t["morse"]):
        y = int((i + 1) * zh) + 4; x = 12
        for ch in zeichen:          # Pfote = kurz, Strich = lang, Welle = Schnurren/Thunfisch
            if ch == "•":
                d.ellipse((x, y + 7, x + 7, y + 13), fill=255)
                for zx, zy in ((0, 4), (2, 2), (5, 2), (7, 4)):
                    d.point((x + zx, y + zy))
                x += 13
            elif ch == "—":
                d.rect((x, y + 8, x + 16, y + 11), 1); x += 20
            elif ch == "~":
                d.arc((x, y + 5, x + 8, y + 13), 180, 360); x += 9
            else:
                x += 3
        g = 20 if len(bedeutung) == 1 else 12
        for dx in ((0, 0.75) if g == 20 else (0,)):
            f.text((sp + 12 + dx, y - (4 if g == 20 else 0)), bedeutung, font(g), "tinte")
    farben = {"tinte": TINTE, "grau": GRAU}
    im = auflegen(im, [(146, 81), (409, 42), (499, 239), (221, 305)], f.p, [(m, farben[k]) for k, m in f.m.items()])
    f2 = Flaeche(124, 12, pap); f2.text((2, -3), t["morse_fuss"], font(12), "grau")
    return auflegen(im, [(229, 326), (352, 301), (354, 311), (232, 336)], f2.p, [(m, GRAU) for m in f2.m.values()])


Z.mkdir(parents=True, exist_ok=True)
for sprache, t in T.items():
    zus = "" if sprache == "de" else "_en"
    for name, fn in (("telefonbuchseite", telefonbuch), ("schmidts_akte", akte), ("kochbuch", kochbuch),
                     ("kritzelei_kammer_2", kritzelei), ("morse_tabelle", morse)):
        fn(t).save(Z / f"{name}{zus}.png")
        print(Z / f"{name}{zus}.png")
