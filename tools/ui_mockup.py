#!/usr/bin/env python3
"""UI-Mockup nach 05-spielsysteme.md (UI, „Mockup“): ein Bild in 320×180 mit allen Elementen
der Tabelle „Bildschirmaufbau“ auf dem Dachboden. Figuren und Porträts sind aus den Konzeptbildern
verkleinert, die Farben auf Endesga 32 gesetzt. Ausgabe in 1-, 4- und 6-facher Größe.

    python3 tools/ui_mockup.py SCHRIFT.ttf[:GRÖSSE] [--aus ORDNER]
"""
import argparse
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
from schrifttest import palette_bild, RAND, FARBEN, W, H, umbrechen

WURZEL = Path(__file__).resolve().parent.parent
K = WURZEL / "concepts"
DUNKEL = (0x18, 0x14, 0x25)
GRAU = (0x5a, 0x69, 0x88)


def freistellen(img, box, hoehe):
    teil = img.convert("RGBA").crop(box)
    px = teil.load()
    for y in range(teil.height):
        for x in range(teil.width):
            r, g, b, a = px[x, y]
            if r > 236 and g > 236 and b > 236:
                px[x, y] = (0, 0, 0, 0)
    breite = round(teil.width * hoehe / teil.height)
    klein = teil.resize((breite, hoehe), Image.Resampling.LANCZOS)
    alpha = klein.getchannel("A").point(lambda v: 255 if v > 140 else 0)
    farbig = palette_bild(klein.convert("RGB"))
    farbig.putalpha(alpha)
    return farbig


def text(d, xy, s, font, farbe, rand=True):
    if rand:
        for dx, dy in ((-1, 0), (1, 0), (0, -1), (0, 1)):
            d.text((xy[0] + dx, xy[1] + dy), s, font=font, fill=RAND)
    d.text(xy, s, font=font, fill=farbe)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("schrift")
    ap.add_argument("--aus", default="mockup")
    a = ap.parse_args()
    pfad, _, gr = a.schrift.partition(":")
    font = ImageFont.truetype(pfad, int(gr or 16))
    asc, desc = font.getmetrics()
    zh = asc + desc

    bild = palette_bild(Image.open(K / "w0_concept_dachboden.png").resize((W, H), Image.Resampling.LANCZOS))
    max_ = freistellen(Image.open(K / "w0_concept_max.png"), (118, 12, 238, 368), 56)
    pixel = freistellen(Image.open(K / "w0_concept_pixel.png"), (38, 30, 312, 300), 18)
    boden = H - (zh * 4 + 4) - 2          # Füße knapp über der Dialogauswahl
    bild.paste(max_, (150, boden - 56), max_)
    bild.paste(pixel, (176, boden - 18), pixel)
    d = ImageDraw.Draw(bild)
    d.fontmode = "1"

    # Inventarleiste oben (ausgeklappt), Porträts links, Pfote rechts
    d.rectangle([0, 0, W - 1, 31], fill=DUNKEL)
    d.line([0, 31, W - 1, 31], fill=RAND)
    p_max = freistellen(Image.open(K / "w0_concept_max.png"), (432, 8, 530, 106), 22)
    p_pix = freistellen(Image.open(K / "w0_concept_pixel.png"), (58, 352, 202, 496), 22)
    for i, (p, aktiv) in enumerate(((p_max, True), (p_pix, False))):
        x = 3 + i * 26
        d.rectangle([x, 3, x + 23, 26], fill=(0x3a, 0x44, 0x66) if aktiv else (0x26, 0x2b, 0x44),
                    outline=(0xff, 0xff, 0xff) if aktiv else GRAU)
        if not aktiv:
            p = Image.blend(p.convert("RGB"), Image.new("RGB", p.size, (0x26, 0x2b, 0x44)), 0.55).convert("RGBA")
            p.putalpha(freistellen(Image.open(K / "w0_concept_pixel.png"), (58, 352, 202, 496), 22).getchannel("A"))
        bild.paste(p, (x + 1 + (22 - p.width) // 2, 4), p)
    symbole = ["pixel", "gegenstand_thunfischdose", "gegenstand_notizbuch", "gegenstand_opas_zettel",
               "gegenstand_reisetasche", "", "", ""]
    pl = WURZEL / "game" / "grafik" / "platzhalter"
    for i, s in enumerate(symbole):
        x = 58 + i * 26
        d.rectangle([x, 3, x + 23, 26], fill=(0x26, 0x2b, 0x44), outline=(0x3a, 0x44, 0x66))
        if s == "pixel":
            ic = freistellen(Image.open(K / "w0_concept_pixel.png"), (38, 30, 312, 300), 16)
            bild.paste(ic, (x + 2, 7), ic)
            d.rectangle([x, 3, x + 23, 26], outline=(0x2c, 0xe8, 0xf5))
        elif s and (pl / f"{s}.png").exists():
            ic = Image.open(pl / f"{s}.png").convert("RGBA").resize((22, 22), Image.Resampling.NEAREST)
            bild.paste(ic, (x + 1, 4), ic)
    d.polygon([(268, 15), (272, 11), (272, 19)], fill=GRAU)          # Blättern
    # Hilfe-Pfote
    x0 = W - 27
    d.rectangle([x0, 3, x0 + 23, 26], fill=(0x26, 0x2b, 0x44), outline=(0xfe, 0xe7, 0x61))
    d.ellipse([x0 + 7, 12, x0 + 16, 21], fill=(0xfe, 0xae, 0x34))
    for dx, dy in ((5, 7), (9, 5), (14, 5), (18, 7)):
        d.ellipse([x0 + dx - 2, dy, x0 + dx + 1, dy + 3], fill=(0xfe, 0xae, 0x34))

    # Sprechblase über Max, drei Zeilen
    satz = "Opa will, dass ich Kanal 7 finde. Ich hab nicht mal die Fernbedienung gefunden. Und die liegt hier dreimal."
    zeilen = umbrechen(satz, font, 232)[:3]
    breite = int(max(font.getlength(z) for z in zeilen)) + 8
    hoehe = zh * len(zeilen) + 5
    bx = max(4, min(W - breite - 4, 160 - breite // 2))
    by = boden - 56 - hoehe - 4
    for i, z in enumerate(zeilen):
        text(d, (bx + 4, by + 2 + i * zh), z, font, FARBEN["Max"])

    # Zeiger mit Objektname
    cx, cy = 236, 70
    d.polygon([(cx, cy), (cx, cy + 8), (cx + 2, cy + 6), (cx + 4, cy + 10), (cx + 5, cy + 9),
               (cx + 3, cy + 5), (cx + 6, cy + 5)], fill=(255, 255, 255), outline=RAND)
    name = "Kleiderschrank"
    text(d, (cx - int(font.getlength(name)) // 2 + 3, cy + 12), name, font, (0xfe, 0xe7, 0x61))

    # Dialogauswahl unten, vier Zeilen
    optionen = [("Wo ist die Fernbedienung, Opa?", True), ("Was ist Kanal 7?", False),
                ("Warum ist Pixel so dick?", False), ("Tschüss.", False)]
    oh = zh * 4 + 4
    d.rectangle([0, H - oh, W - 1, H - 1], fill=DUNKEL)
    d.line([0, H - oh, W - 1, H - oh], fill=RAND)
    for i, (o, gelesen) in enumerate(optionen):
        farbe = GRAU if gelesen else ((0xfe, 0xe7, 0x61) if i == 1 else (255, 255, 255))
        text(d, (6, H - oh + 2 + i * zh), o, font, farbe, rand=False)

    aus = Path(a.aus)
    aus.mkdir(parents=True, exist_ok=True)
    stamm = f"ui_mockup_{Path(pfad).stem}"
    bild.save(aus / f"{stamm}_x1.png")
    for f in (4, 6):
        bild.resize((W * f, H * f), Image.Resampling.NEAREST).save(aus / f"{stamm}_x{f}.png")
    print(aus / f"{stamm}_x4.png")


if __name__ == "__main__":
    main()
