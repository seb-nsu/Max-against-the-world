"""Nahansichten von Welt 4 mit Schrift (Pixelify Sans ohne Kantenglättung), deutsch und englisch.
Die englischen Bilder heißen <name>_en.png. Texte wie im Skript (texte.csv: W4_FERN_MAX_0150–0220 für die
Programmzeitschrift, W4_EMPF_MAX_0250 für das Messingschild, W4_FERN_MAX_0180 für die Pausentafel).

Quelle sind Sebastians Gemini-Bilder W4-N01 … W4-N03 (2752×1536, Schrift- und Titelflächen leer). Das Werkzeug
rechnet sie selbst auf 640×360 und 40 Farben um (tools/pixelieren.py) und setzt danach die Schrift:

- programmzeitschrift: links die Zeitleiste (fünf Sender auf den farbigen Reitern, sechs Sendezeiten), rechts
  sechs Kästen. Der Kasten mit dem Testbild bleibt leer mit Goldrand (Kanal 999, „nur ein leeres Feld mit
  Goldrand“). Im Kasten unten rechts ersetzt ein Ausschnitt aus dem Werbespot-Set das Stadtbild.
- messingschild: drei Zeilen auf dem Schild unter dem Porträt (Jahreszahl 1988 für den Aufzugscode).
- pausentafel: Banner der Mitternachts-Pausentafel.

Aufruf:  python3 tools/nahansichten_welt4_schrift.py [quellordner] [zielordner]"""
import sys
from pathlib import Path
import numpy as np
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
from pixelieren import farben_32, verkleinern  # noqa: E402

S = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(r"E:/Game Engine/Grafiken/Welt 4/Nahansichten")
Z = Path(sys.argv[2]) if len(sys.argv) > 2 else ROOT / "game" / "grafik" / "nahansichten"
TTF = str(ROOT / "game" / "schriften" / "pixelify-sans.ttf")
WERBESPOT = ROOT / "game" / "grafik" / "hintergruende" / "w4_bg_werbespot_set_v01.png"
TINTE = (38, 33, 48); GRAU = (92, 84, 96); WEISS = (250, 244, 230); GOLD = (214, 164, 52); GOLD_HELL = (250, 214, 110)
GRAVUR = (92, 58, 20); GRAVUR_LICHT = (255, 236, 160); BANNER = (70, 40, 90)

QUELLEN = {"programmzeitschrift": "W4-N01_programmzeitschrift.png", "messingschild": "W4-N02_messingschild.png",
           "pausentafel": "W4-N03_pausentafel.png"}

T = {
    "de": {
        "sender": ["GLÜCK", "SITCOM", "TIER", "GRUSEL", "COMIC"],
        "zeiten": ["18:00", "19:00", "20:15", "21:00", "22:00", "0:00"],
        # Zellen je Sender (Spalte) und Zeit (Zeile); None: Pfeil „läuft weiter“
        "zellen": [["Glücks-|rad", None, None, None, None, None],
                   ["Wdh.", "Wdh.", "Küche|brennt|F. 112", "Werbung", "Wdh.", "Sende-|schluss"],
                   ["Doku", "Doku", "Tier-|tort", "Wdh.", "Wdh.", "Wdh."],
                   ["Pause", "Pause", "Pause", "Pause", "Pause", "Fried-|hofs-|Funk"],
                   ["Kapi-|tolis", "Wdh.", "Wdh.", "Werbung", "Wdh.", "Pause"]],
        "kaesten": [
            None,                                                                    # Kanal 999: leer, Goldrand
            ("Glücks-|rad", "rund um|die Uhr", "Mit Gerd Glück und|dem Trödel-Experten."),
            ("20:15 Uhr", "Die Küche|brennt", "Folge 112:|Fondue-Abend"),
            ("Tiertort", "Der Fall|der fehlen-|den Krone", "Seit 20:15 in|Dauerschleife."),
            ("0:00 Uhr", "Friedhofs-|Funk", "Mitternachts-TV:|Musikvideo mit Zombies"),
            ("Werbung", "Dr. Werbe-|pause", "präsentiert den|Couch-Magnet 3000"),
        ],
        "schild": ["ZAPPMANN", "Intendant seit 1988", "Davor: siehe Kellerarchiv"],
        "banner": ["Mitternachts-TV", "Sendebeginn 0:00 Uhr"],
    },
    "en": {
        "sender": ["LUCK", "SITCOM", "ANIMAL", "SPOOKY", "COMIC"],
        "zeiten": ["6 pm", "7 pm", "8:15", "9 pm", "10 pm", "0:00"],
        "zellen": [["Lucky|Wheel", None, None, None, None, None],
                   ["Rpt.", "Rpt.", "Kitchen|on Fire|Ep. 112", "Ads", "Rpt.", "Close-|down"],
                   ["Docu", "Docu", "Paw &|Order", "Rpt.", "Rpt.", "Rpt."],
                   ["Break", "Break", "Break", "Break", "Break", "Grave-|yard|Funk"],
                   ["Capi-|tolis", "Rpt.", "Rpt.", "Ads", "Rpt.", "Break"]],
        "kaesten": [
            None,
            ("Lucky|Wheel", "round the|clock", "With Gerd Lucky and|the junk expert."),
            ("8:15 pm", "The|Kitchen's|on Fire", "Episode 112:|Fondue Night"),
            ("Paw and|Order", "The Case|of the|Missing|Crown", "On a loop|since 8:15."),
            ("Midnight", "Graveyard|Funk", "Midnight TV:|music video, zombies"),
            ("Advert", "Dr. Ad-|break", "presents the|Couch Magnet 3000"),
        ],
        "schild": ["ZAPPMANN", "Director general since 1988", "Before that: see cellar archive"],
        "banner": ["Midnight TV", "On air at midnight"],
    },
}


def font(g):
    return ImageFont.truetype(TTF, g)


def breite(text, f):
    return f.getbbox(text)[2]


def schreiben(d, xy, text, f, farbe, mitte=False):
    x, y = xy
    if mitte:
        x -= breite(text, f) // 2
    d.text((x, y), text, font=f, fill=farbe)


def zeilen(d, x, y, text, f, farbe, abstand, mitte=False):
    for i, z in enumerate(text.split("|")):
        schreiben(d, (x, y + i * abstand), z, f, farbe, mitte)


def papier(a, box):
    """Fläche mit der häufigsten hellen Papierfarbe der Umgebung füllen (gemalte Schein-Schrift weg)."""
    x0, y0, x1, y1 = box
    teil = a[y0:y1, x0:x1].reshape(-1, 3)
    hell = teil[teil.sum(1) > 560]
    farben, n = np.unique(hell, axis=0, return_counts=True)
    a[y0:y1, x0:x1] = farben[n.argmax()]


def grundbild(name):
    klein = verkleinern(S / QUELLEN[name], 640, 360)
    im = farben_32(klein, n=40)
    return np.asarray(im.convert("RGB") if isinstance(im, Image.Image) else im, dtype=np.uint8).copy()


def neu(a):
    im = Image.fromarray(a)
    d = ImageDraw.Draw(im)
    d.fontmode = "1"                       # keine Kantenglättung
    return im, d


# ---------------------------------------------------------------- Programmzeitschrift
SPALTEN_OBEN = [66, 113, 160, 208, 256, 303]   # senkrechte Linien bei y = 100
SPALTEN_UNTEN = [60, 109, 157, 205, 254, 302]  # bei y = 300 (die Seite ist leicht schräg)
ZEILEN = [57, 101, 145, 188, 232, 276, 319]
ZEIT_LINKS = (37, 28)                          # linker Rand der Zeitspalte oben und unten
REITER = [(72, 113), (118, 160), (166, 207), (213, 255), (261, 302)]
REITER_Y = 43
REITER_FARBEN = [((206, 62, 62), WEISS), ((44, 150, 214), WEISS), ((242, 212, 64), TINTE), ((84, 172, 92), WEISS),
                 ((236, 142, 52), WEISS)]
# Bildflächen der Kästen (bleiben stehen, der Rest des Kastens wird Papier)
BILDER = [(341, 51, 403, 101), (483, 52, 540, 101), (342, 144, 403, 190), (485, 145, 542, 191), (342, 239, 405, 285),
          (487, 240, 546, 284)]
# Kästen rechts: Bild (x0, y0, x1, y1), Titel und Kurztext rechts vom Bild, Langtext darunter
KAESTEN = [
    {"rand": (336, 47, 472, 133), "rechts": (405, 50, 467, 99), "unten": (343, 103, 467, 129)},
    {"rand": (479, 47, 605, 133), "rechts": (543, 53, 600, 99), "unten": (485, 104, 600, 129)},
    {"rand": (337, 140, 474, 228), "rechts": (406, 143, 468, 191), "unten": (344, 194, 468, 224)},
    {"rand": (481, 140, 608, 228), "rechts": (544, 144, 602, 192), "unten": (487, 195, 602, 224)},
    {"rand": (338, 233, 478, 322), "rechts": (409, 237, 470, 287), "unten": (344, 289, 472, 318)},
    {"rand": (482, 234, 616, 322), "rechts": (548, 239, 607, 287), "unten": (489, 290, 607, 319),
     "bild": (488, 241, 545, 283)},
]


def spalte_x(i, y):
    """x der i-ten senkrechten Linie auf Höhe y (linear zwischen y = 100 und y = 300)."""
    t = (y - 100) / 200
    return SPALTEN_OBEN[i] + (SPALTEN_UNTEN[i] - SPALTEN_OBEN[i]) * t


def zeitschrift(sprache):
    t = T[sprache]
    a = grundbild("programmzeitschrift")
    # Werbespot-Bild in den letzten Kasten (statt des Stadtbilds)
    x0, y0, x1, y1 = KAESTEN[5]["bild"]
    ws = Image.open(WERBESPOT).convert("RGB").crop((545, 75, 745, 222)).resize((x1 - x0, y1 - y0), Image.BOX)
    a[y0:y1, x0:x1] = np.asarray(ws)
    for kasten, (bx0, by0, bx1, by1) in zip(KAESTEN, BILDER):
        x0, y0, x1, y1 = kasten["rand"]
        bild = a[by0:by1, bx0:bx1].copy()
        papier(a, (x0 + 3, y0 + 3, x1 - 2, y1 - 2))
        a[by0:by1, bx0:bx1] = bild
    # Reiter wieder in ihren Farben (die 40-Farben-Umrechnung macht Rot braun und Orange beige)
    for (rx0, rx1), (farbe, _) in zip(REITER, REITER_FARBEN):
        teil = a[35:57, rx0 - 2:rx1 + 1].astype(int)
        bunt = (teil.max(2) - teil.min(2) > 40) & (teil.sum(2) > 150)
        teil[bunt] = farbe
        a[35:57, rx0 - 2:rx1 + 1] = teil
    im, d = neu(a)
    f10, f12 = font(10), font(12)
    # Reiter
    for (rx0, rx1), name, (_, schrift) in zip(REITER, t["sender"], REITER_FARBEN):
        schreiben(d, ((rx0 + rx1) // 2, REITER_Y), name, f10, schrift, mitte=True)
    # Zeiten und Zellen
    for z in range(6):
        ya, yb = ZEILEN[z], ZEILEN[z + 1]
        ym = (ya + yb) / 2
        links = ZEIT_LINKS[0] + (ZEIT_LINKS[1] - ZEIT_LINKS[0]) * (ym - 100) / 200
        schreiben(d, (round((links + spalte_x(0, ym)) / 2), ya + 4), t["zeiten"][z], f10, TINTE, mitte=True)
        for s in range(5):
            text = t["zellen"][s][z]
            xm = round((spalte_x(s, ym) + spalte_x(s + 1, ym)) / 2)
            if text is None:                          # Pfeil: läuft weiter
                d.line([(xm, ya + 4), (xm, yb - 8)], fill=GRAU)
                d.polygon([(xm - 3, yb - 9), (xm + 3, yb - 9), (xm, yb - 5)], fill=GRAU)
                continue
            n = text.count("|") + 1
            schreiben_y = ya + (yb - ya - n * 11) // 2 - 1
            zeilen(d, xm, schreiben_y, text, f10, TINTE, 11, mitte=True)
    # Kästen
    for kasten, inhalt in zip(KAESTEN, t["kaesten"]):
        if inhalt is None:
            x0, y0, x1, y1 = kasten["rand"]
            d.rectangle([x0 - 1, y0 - 1, x1 + 1, y1 + 1], outline=GOLD, width=2)
            d.rectangle([x0 + 2, y0 + 2, x1 - 2, y1 - 2], outline=GOLD_HELL)
            continue
        titel, kurz, lang = inhalt
        rx0, ry0, rx1, ry1 = kasten["rechts"]
        n = titel.count("|") + 1
        zeilen(d, rx0 + 1, ry0, titel, f12, TINTE, 11)
        d.line([(rx0 + 1, ry0 + n * 11 + 3), (rx1 - 2, ry0 + n * 11 + 3)], fill=TINTE)
        zeilen(d, rx0 + 1, ry0 + n * 11 + 5, kurz, f10, GRAU, 10)
        ux0, uy0, _, _ = kasten["unten"]
        zeilen(d, ux0 + 1, uy0 + 1, lang, f10, TINTE, 11)
        for z in titel.split("|") + kurz.split("|"):
            assert rx0 + 1 + breite(z, f12 if z in titel else f10) <= rx1, f"zu breit: {z}"
        for z in lang.split("|"):
            assert ux0 + 1 + breite(z, f10) <= kasten["unten"][2], f"zu breit: {z}"
    return im


def schild(sprache):
    t = T[sprache]
    a = grundbild("messingschild")
    im, d = neu(a)
    mitte = 320
    for text, y, g in zip(t["schild"], (146, 178, 208), (16, 12, 12)):
        f = font(g)
        schreiben(d, (mitte + 1, y + 1), text, f, GRAVUR_LICHT, mitte=True)
        schreiben(d, (mitte, y), text, f, GRAVUR, mitte=True)
    return im


def pausentafel(sprache):
    t = T[sprache]
    a = grundbild("pausentafel")
    im, d = neu(a)
    schreiben(d, (316, 280), t["banner"][0], font(16), BANNER, mitte=True)
    schreiben(d, (316, 300), t["banner"][1], font(12), BANNER, mitte=True)
    return im


def main():
    Z.mkdir(parents=True, exist_ok=True)
    for name, fn in (("programmzeitschrift", zeitschrift), ("messingschild", schild), ("pausentafel", pausentafel)):
        for sprache in ("de", "en"):
            ziel = Z / (f"{name}.png" if sprache == "de" else f"{name}_en.png")
            fn(sprache).save(ziel)
            print("geschrieben:", ziel.relative_to(ROOT) if ziel.is_relative_to(ROOT) else ziel)


if __name__ == "__main__":
    main()
