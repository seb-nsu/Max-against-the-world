"""Schrift und Zeichen auf die Nahansichten von Welt 3 (Pixelify Sans ohne Kantenglättung), deutsch und englisch.
Die englischen Bilder heißen <name>_en.png. Texte wie im Skript (texte.csv: W3_STR_MAX_0070, W3_TURM_MAX_0460/0470,
W3_KUCH_MAX_0550/0560, W3_KAM2_MAX_0140/0150, W3_PIEP_MAX_0220/0225). Die Ziffern kommen aus der Welt-2-Tabelle
(Pixelify verwechselt 2/5 mit 8/9).

Aufruf:  python3 tools/nahansichten_welt3_schrift.py [quellordner] [zielordner]
Quelle: mit tools/pixelieren.py umgerechnete Gemini-Bilder W3-N01 … W3-N05 (640×360)."""
import sys
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
from nahansichten_welt2_schrift import schreiben, umbrechen  # noqa: E402

S = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(r"E:/Game Engine/Grafiken/assets/welt3/nahansichten/pixel")
Z = Path(sys.argv[2]) if len(sys.argv) > 2 else ROOT / "game" / "grafik" / "nahansichten"
TTF = str(ROOT / "game" / "schriften" / "pixelify-sans.ttf")
TINTE = (38, 43, 68); ROT = (162, 38, 51); MARKER = (24, 20, 37); GRAU = (90, 105, 136)


def font(g):
    return ImageFont.truetype(TTF, g)


def titel(d, xy, text, farbe):
    """Überschrift in Größe 12, fett durch Doppeldruck: Pixelify in Größe 16 verwechselt 2 mit 8."""
    for dx in (0, 1):
        schreiben(d, (xy[0] + dx, xy[1]), text, font(12), farbe)


def block(d, text, f, x0, y0, x1, farbe, abstand=None, mitte=False):
    zeilen = umbrechen(d, text, f, x1 - x0)
    h = abstand or f.size + 3
    for i, z in enumerate(zeilen):
        x = (x0 + x1 - d.textlength(z, font=f)) / 2 if mitte else x0
        schreiben(d, (x, y0 + i * h), z, f, farbe)
    return y0 + len(zeilen) * h


T = {
    "de": {
        "tb_name": "Konner, Sahra", "tb_n": 47,
        "akte_titel": "Regel 1", "akte": "Testpersonen sind zu beschützen. Vor allem. Vor allen. Vor sich selbst.",
        "stempel": ["M.U.T.T.I.", "Fürsorge", "+ Verfolgung"],
        "akte2": "Testperson 48 hat im Regen gestanden und nichts getan. Verdächtig menschlich.",
        "koch_titel": "Regel 2", "koch": "Nach jedem Rührgang gibt es Kuchen.",
        "koch2": "Warnung: Das Gerät kann Zuneigung entwickeln. Nicht in der Nähe von Kindern aufladen.",
        "kritz": ["DER KUCHEN", "EXISTIERT", "NICHT."],
        "regel3": "Regel 3: Zucker ist gesundheitsschädlich und verboten. Gez. M.U.T.T.I.",
        "morse_kopf": ["Miau", "heißt"], "morse": [("•", "E"), ("— —", "T"), ("•  •", "I"), ("— •", "N"),
                                                    ("• —", "A"), ("•••", "S"), ("~~~", "Thunfisch")],
        "morse_fuss": "Schnurren heißt OK.",
    },
    "en": {
        "tb_name": "Konner, Sahra", "tb_n": 47,
        "akte_titel": "Rule 1", "akte": "Test subjects are to be protected. From everything. From everyone. From themselves.",
        "stempel": ["M.O.T.H.E.R.", "Care", "+ Pursuit"],
        "akte2": "Test subject 48 stood in the rain and did nothing. Suspiciously human.",
        "koch_titel": "Rule 2", "koch": "After every mixing cycle there is cake.",
        "koch2": "Warning: the appliance may develop affection. Do not charge near children.",
        "kritz": ["THE CAKE", "DOES NOT", "EXIST."],
        "regel3": "Rule 3: Sugar is harmful to health and forbidden. Signed, M.O.T.H.E.R.",
        "morse_kopf": ["Meow", "means"], "morse": [("•", "E"), ("— —", "T"), ("•  •", "I"), ("— •", "N"),
                                                     ("• —", "A"), ("•••", "S"), ("~~~", "Tuna")],
        "morse_fuss": "Purring means OK.",
    },
}


def telefonbuch(t):
    im = Image.open(S / "W3-N01_telefonbuchseite.png").convert("RGB"); d = ImageDraw.Draw(im); d.fontmode = "1"
    # Spalte 3 (x 330–425): 47 Zeilen „Konner, Sahra“ würden nicht passen; Kopfzeile und hervorgehobene Einträge
    f = font(12)
    d.rectangle((334, 92, 428, 254), fill=(206, 214, 216))
    d.line((334, 104, 428, 104), fill=GRAU)
    schreiben(d, (336, 92), "Konner", f, TINTE)
    for i in range(10):
        y = 108 + i * 14
        schreiben(d, (336, y), t["tb_name"], font(12), TINTE)
    schreiben(d, (336, 248 - 4), f"… {t['tb_n']}×", font(12), ROT)
    return im


def akte(t):
    im = Image.open(S / "W3-N02_akte.png").convert("RGB"); d = ImageDraw.Draw(im); d.fontmode = "1"
    titel(d, (106, 58), t["akte_titel"], TINTE)
    block(d, t["akte"], font(12), 106, 80, 284, TINTE, 14)
    block(d, t["akte2"], font(12), 106, 182, 284, TINTE, 32)
    for i, z in enumerate(t["stempel"]):
        w = d.textlength(z, font=font(12))
        schreiben(d, (262 - w / 2, 274 + i * 12), z, font(12), ROT)
    return im


def kochbuch(t):
    im = Image.open(S / "W3-N03_kochbuch.png").convert("RGB"); d = ImageDraw.Draw(im); d.fontmode = "1"
    titel(d, (342, 52), t["koch_titel"], TINTE)
    unten = block(d, t["koch"], font(12), 342, 74, 528, TINTE, 14)
    for k in range(2):   # zweimal unterstrichen
        d.line((342, unten + 1 + k * 3, 520, unten + 1 + k * 3), fill=ROT)
    d.rectangle((336, 170, 486, 212), fill=(236, 226, 196))
    block(d, t["koch2"], font(12), 342, 168, 486, GRAU, 13)
    return im


def kritzelei(t):
    im = Image.open(S / "W3-N04_kritzelei.png").convert("RGB"); d = ImageDraw.Draw(im); d.fontmode = "1"
    f = font(32)
    for i, z in enumerate(t["kritz"]):
        for dx, dy in ((0, 0), (1, 0)):          # Filzstift: etwas fetter
            d.text((96 + dx + i * 6, 46 + i * 38 + dy), z, font=f, fill=MARKER)
    # eigenes, größeres Schild über dem gemalten (das gemalte ist für den Text zu klein)
    d.rectangle((448, 110, 604, 230), fill=(150, 160, 176)); d.rectangle((450, 112, 602, 228), fill=(244, 246, 248))
    block(d, t["regel3"], font(12), 458, 120, 596, TINTE, 14)
    return im


def morse(t):
    im = Image.open(S / "W3-N05_morse_tabelle.png").convert("RGB"); d = ImageDraw.Draw(im); d.fontmode = "1"
    f = font(12)
    linien = [67, 91, 115, 138, 163, 186, 211, 235, 259, 282]   # gemessene Zeilenlinien, Spalten 121 | 320 | 520
    x_l, x_r = 130, 330
    def zeile(i):
        return (linien[i] + linien[i + 1]) // 2 - 8
    titel(d, (x_l, zeile(0)), t["morse_kopf"][0], GRAU); titel(d, (x_r, zeile(0)), t["morse_kopf"][1], GRAU)
    for i, (zeichen, bedeutung) in enumerate(t["morse"]):
        y = zeile(i + 1); x = x_l
        for ch in zeichen:   # Pfote = kurz, Strich = lang, Welle = Schnurren/Thunfisch
            if ch == "•":
                d.ellipse((x, y + 6, x + 6, y + 11), fill=TINTE)
                for zx in (0, 2, 4, 6):
                    d.point((x + zx, y + 3 + (zx in (2, 4)) * -1), fill=TINTE)
                x += 11
            elif ch == "—":
                d.rectangle((x, y + 7, x + 12, y + 8), fill=TINTE); x += 16
            elif ch == "~":
                d.arc((x, y + 4, x + 7, y + 11), 180, 360, fill=TINTE); x += 8
            else:
                x += 3
        schreiben(d, (x_r, y), bedeutung, f, TINTE)
    schreiben(d, (x_l, zeile(8)), t["morse_fuss"], f, GRAU)
    return im


Z.mkdir(parents=True, exist_ok=True)
for sprache, t in T.items():
    zus = "" if sprache == "de" else "_en"
    for name, fn in (("telefonbuchseite", telefonbuch), ("schmidts_akte", akte), ("kochbuch", kochbuch),
                     ("kritzelei_kammer_2", kritzelei), ("morse_tabelle", morse)):
        fn(t).save(Z / f"{name}{zus}.png")
        print(Z / f"{name}{zus}.png")
