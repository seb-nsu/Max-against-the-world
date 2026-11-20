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


def auflegen(bild, viereck, flach, tinte, k=4, papier_auflegen=True):
    """flach: RGB-Fläche (Papier und Linien), tinte: Liste (Maske als L-Bild, Farbe) in derselben Größe.
    viereck: Zielpunkte links oben, rechts oben, rechts unten, links unten im Bild.
    papier_auflegen=False: nur die Tinte auf das vorhandene (gesäuberte) Papier setzen."""
    w, h = flach.size; W, H = bild.size
    q = [(x * k, y * k) for x, y in viereck]
    c = koeff(q, [(0, 0), (w * k, 0), (w * k, h * k), (0, h * k)])
    m = Image.new("L", (W * k, H * k), 0); ImageDraw.Draw(m).polygon(q, fill=255)
    m = np.asarray(m.resize((W, H), Image.BOX)) > 127
    a = np.asarray(bild).copy()
    if papier_auflegen:
        gross = flach.resize((w * k, h * k), Image.NEAREST)
        papier = gross.transform((W * k, H * k), Image.PERSPECTIVE, c, Image.NEAREST).resize((W, H), Image.NEAREST)
        a[m] = np.asarray(papier)[m]
    for maske, farbe in tinte:
        mg = maske if maske.size == (w * k, h * k) else maske.resize((w * k, h * k), Image.NEAREST)
        mt = np.asarray(mg.transform((W * k, H * k), Image.PERSPECTIVE, c, Image.BILINEAR).resize((W, H), Image.BOX))
        a[(mt > 100) & m] = farbe
    return Image.fromarray(a)


def flach_uv(viereck, w, h, groesse):
    """Für jedes Bildpixel die Lage (u, v) in der flachen Fläche w × h; außerhalb liegen die Werte außerhalb."""
    a, b, c, d, e, f, g, hh = koeff(viereck, [(0, 0), (w, 0), (w, h), (0, h)])   # Bild -> flach
    W, H = groesse
    yy, xx = np.mgrid[0:H, 0:W].astype(float)
    n = g * xx + hh * yy + 1
    return (a * xx + b * yy + c) / n, (d * xx + e * yy + f) / n


def ausbessern(a, weg):
    """Pixel unter der Maske mit der Farbe des nächsten Pixels außerhalb füllen (Papier, Glanz und Verlauf bleiben)."""
    from scipy import ndimage
    if not weg.any():
        return a
    _, (iy, ix) = ndimage.distance_transform_edt(weg, return_indices=True)
    a = a.copy(); a[weg] = a[iy[weg], ix[weg]]
    return a


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


def grau_und_klein_weg(a, u, v, w, h, rand=4):
    """Schein-Schrift (graue Balken, dunkler als das Papier, heller als die schwarzen Formularlinien) innerhalb der
    Fläche entfernen; Rot (Stempel) bleibt."""
    c = a.astype(int); s = c.sum(-1)
    rot = (c[..., 0] - c[..., 2] > 50) & (c[..., 0] > 120)
    innen = (u > rand) & (u < w - rand) & (v > rand) & (v < h - rand)
    pap = np.median(s[innen & (s > np.percentile(s[innen], 60))])
    grau = innen & ~rot & (s < pap - 45) & (s > 230)
    return grau


def felder_leeren(a, u, v, w, h, rechtecke, rand=4, stempel_weg=False):
    """Schein-Schrift entfernen: in den Textfeldern (flache Rechtecke) alles außer Rot, sonst auf der ganzen Seite
    die grauen Balken. Gefüllt wird mit dem nächsten echten Papierpixel derselben Seite, so bleibt der Farbverlauf."""
    from scipy import ndimage
    c = a.astype(int); s = c.sum(-1); rot = (c[..., 0] > 120) & (c[..., 1] < 110) & (c[..., 2] < 110) & (c[..., 0] - c[..., 2] > 50)
    seite = (u > rand) & (u < w - rand) & (v > rand) & (v < h - rand)
    pap = np.median(s[seite & (s > np.percentile(s[seite], 55))])
    papier = seite & (s >= pap - 25) & ~rot
    weg = seite & ~rot & (s < pap - 45) & (s > 230)                     # graue Schein-Zeilen
    for x0, y0, x1, y1 in rechtecke:
        weg |= (u > x0) & (u < x1) & (v > y0) & (v < y1) & ~rot & ~papier
    if stempel_weg:
        weg |= seite & rot
        rot = np.zeros_like(rot)
    weg = ndimage.binary_dilation(weg) & seite & ~rot
    papier &= ~weg
    _, (iy, ix) = ndimage.distance_transform_edt(~papier, return_indices=True)
    a = a.copy(); a[weg] = a[iy[weg], ix[weg]]
    # übrig gebliebene kurze Linienstücke der zerschnittenen Felder auch weg (lange Linien bleiben)
    s2 = a.astype(int).sum(-1); dunkel = seite & (s2 < pap - 45)
    lab, n = ndimage.label(dunkel, np.ones((3, 3)))
    if n:
        gr = ndimage.sum(dunkel, lab, range(1, n + 1))
        kurz = np.isin(lab, [i + 1 for i, g in enumerate(gr) if g < 70]) & ~rot
        papier = seite & (s2 >= pap - 25) & ~kurz
        _, (iy, ix) = ndimage.distance_transform_edt(~papier, return_indices=True)
        a[kurz] = a[iy[kurz], ix[kurz]]
    return a


def akte(t):
    im = Image.open(S / "W3-N02_akte.png").convert("RGB"); a = np.asarray(im).copy()
    QL = [(84, 113), (271, 75), (346, 311), (127, 340)]          # linke Seite, flach 200 × 250
    QR = [(300, 62), (505, 40), (580, 248), (366, 312)]          # rechte Seite, flach 220 × 250
    u, v = flach_uv(QL, 200, 250, im.size)
    # Feld oben (Regel 1), Kästchenreihe und die beiden unteren Felder; Ränder der Felder bleiben stehen
    a = felder_leeren(a, u, v, 200, 250, [(12, 3, 188, 97), (12, 124, 188, 158), (14, 166, 128, 246)], stempel_weg=True)
    u2, v2 = flach_uv(QR, 220, 250, im.size)
    a = felder_leeren(a, u2, v2, 220, 250, [(14, 44, 186, 157), (14, 160, 186, 238)], 8)
    im = Image.fromarray(a)
    f = Flaeche(200, 250, (0, 0, 0))
    f.text((16, 6), t["akte_titel"], font(12), "tinte"); f.text((16.5, 6), t["akte_titel"], font(12), "tinte")
    f.block(t["akte"], font(12), 16, 26, 184, "tinte", 15)
    stempel(f, 150, 202, 40, t["stempel"])                                          # größer als der gemalte
    lf = f.form("linie")
    for y in range(184, 246, 14):                                                  # Schreiblinien im unteren Feld
        lf.line((18, y, 126, y))
    farben = {"tinte": TINTE, "rot": ROT, "linie": (150, 120, 96)}
    im = auflegen(im, QL, f.p, [(m, farben[k]) for k, m in f.m.items()], papier_auflegen=False)
    f = Flaeche(220, 250, (0, 0, 0))
    f.text((18, 48), t["bericht"], font(12), "grau")
    f.block(t["akte2"], font(12), 18, 66, 194, "tinte", 15)
    lf = f.form("linie")
    for y in range(176, 236, 14):
        lf.line((18, y, 196, y))
    farben = {"tinte": TINTE, "grau": GRAU, "linie": (150, 120, 96)}
    return auflegen(im, QR, f.p, [(m, farben[k]) for k, m in f.m.items()], papier_auflegen=False)


def kochbuch(t):
    im = Image.open(S / "W3-N03_kochbuch.png").convert("RGB")
    pap = papierfarbe(im, (420, 60, 470, 90))
    W, H = 207, 250
    f = Flaeche(W, H, pap)
    f.text((8, 6), t["koch_titel"], font(12), "tinte"); f.text((9, 6), t["koch_titel"], font(12), "tinte")
    unten = f.block(t["koch"], font(12), 8, 28, W - 10, "tinte", 15)
    d = f.form("rot")
    for k in range(2):   # zweimal unterstrichen
        d.line((8, unten + 1 + k * 3, W - 18, unten + 1 + k * 3 - k))
    f.dp.rectangle((8, 108, W - 14, 196), fill=(244, 230, 170), outline=(184, 150, 90))
    f.block(t["koch2"], font(12), 14, 112, W - 20, "grau", 14)
    farben = {"tinte": TINTE, "rot": ROT, "grau": GRAU}
    return auflegen(im, [(342, 44), (553, 44), (557, 294), (346, 296)], f.p, [(m, farben[k]) for k, m in f.m.items()])


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
    for i, z in enumerate(umbrechen(d, t["regel3"], font(12), 126)):           # klein, in Druckschrift daneben
        schreiben(d, (504, 196 + i * 14), z, font(12), GRAU)
    return im


def morse(t):
    from scipy import ndimage
    im = Image.open(S / "W3-N05_morse_tabelle.png").convert("RGB"); a = np.asarray(im).copy()
    QM = [(124.3, 47.4), (402.9, 9.8), (516.2, 255.7), (217.4, 329.2)]   # flach 310 × 290, Tabelle 10..300 × 37..271
    W, H = 310, 290
    linien = [38, 62, 86, 111, 138, 165, 192, 218, 245, 270]             # gemessen an der rechten Spalte (9 Zeilen)
    sp = 157                                                             # Spaltenlinie
    u, v = flach_uv(QM, W, H, im.size)
    s = a.astype(int).sum(-1)
    # linke Spalte ganz leeren (Pfoten samt der gemalten Zeilenlinien), Linien danach neu ziehen, passend zur rechten Spalte
    weg = (u > 14) & (u < sp - 3.5) & (v > linien[0] + 2.5) & (v < linien[-1] - 2.5) & (s < 420)
    nah = np.zeros_like(weg)
    for y in linien:
        nah |= np.abs(v - y) < 3
    weg |= (u > sp + 4) & (u < 296) & (v > linien[0] + 2.5) & (v < linien[-1] - 2.5) & ~nah & (s < 600)
    a = ausbessern(a, ndimage.binary_dilation(weg))
    im = Image.fromarray(a)
    f = Flaeche(W, H, (0, 0, 0))
    lf = f.form("linie")
    for y in linien[1:-1]:
        lf.line((12, y, sp, y), width=1)
    mitte = lambda i: (linien[i] + linien[i + 1]) / 2
    f.text((20, mitte(0) - 8), t["morse_kopf"][0], font(12), "grau"); f.text((sp + 10, mitte(0) - 8), t["morse_kopf"][1], font(12), "grau")
    d = f.form("tinte")
    for i, (zeichen, bedeutung) in enumerate(t["morse"]):
        y = mitte(i + 1) - 10; x = 20
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
            f.text((sp + 12 + dx, y - (2 if g == 20 else -2)), bedeutung, font(g), "tinte")
    farben = {"tinte": TINTE, "grau": GRAU, "linie": (58, 68, 102)}
    im = auflegen(im, QM, f.p, [(m, farben[k]) for k, m in f.m.items()], papier_auflegen=False)
    pap = papierfarbe(im, (300, 120, 380, 180))
    f2 = Flaeche(124, 12, pap); f2.text((2, -3), t["morse_fuss"], font(12), "grau")
    return auflegen(im, [(229, 326), (352, 301), (354, 311), (232, 336)], f2.p, [(m, GRAU) for m in f2.m.values()])


Z.mkdir(parents=True, exist_ok=True)
for sprache, t in T.items():
    zus = "" if sprache == "de" else "_en"
    for name, fn in (("telefonbuchseite", telefonbuch), ("schmidts_akte", akte), ("kochbuch", kochbuch),
                     ("kritzelei_kammer_2", kritzelei), ("morse_tabelle", morse)):
        fn(t).save(Z / f"{name}{zus}.png")
        print(Z / f"{name}{zus}.png")
