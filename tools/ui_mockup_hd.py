#!/usr/bin/env python3
"""UI-Mockup, Variante „Text in voller Auflösung“: Bild, Figuren und Inventarleiste in Spielauflösung
(tools/aufloesung.py), ganzzahlig auf 1920×1080 vergrößert; Sprechblasen, Objektnamen und Dialogauswahl in einer glatten
Schrift direkt in 1920×1080 (wie bei Thimbleweed Park). Zwei Bilder: Erkunden (Leiste offen,
Zeiger mit Objektname, kurze Pixel-Zeile) und Gespräch (Leiste eingeklappt, Blase mit höchstens
zwei Zeilen, Dialogauswahl unten).

    python3 tools/ui_mockup_hd.py SCHRIFT.ttf[:GRÖSSE] [--aus ORDNER]
"""
import argparse
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
from schrifttest import palette_bild, RAND, FARBEN
from ui_mockup import freistellen, K, WURZEL, DUNKEL, GRAU
from aufloesung import BREITE as W, HOEHE as H

F = 1920 // W              # Vergrößerung auf 1920×1080
Q = H / 180                # Maße unten sind für 320×180 gedacht


def q(v):
    return round(v * Q)
GELB = (0xfe, 0xe7, 0x61)


def szene(leiste: bool, dialog_px: int):
    """Pixel-Ebene in Spielauflösung (tools/aufloesung.py). dialog_px: Höhe der Dialogauswahl in Bildpunkten (1080p)."""
    bild = palette_bild(Image.open(K / "w0_concept_dachboden.png").resize((W, H), Image.Resampling.LANCZOS))
    max_ = freistellen(Image.open(K / "w0_concept_max.png"), (118, 12, 238, 368), q(56))
    pixel = freistellen(Image.open(K / "w0_concept_pixel.png"), (38, 30, 312, 300), q(18))
    boden = H - q(8) - (dialog_px + F - 1) // F
    bild.paste(max_, (q(150), boden - max_.height), max_)
    bild.paste(pixel, (q(176), boden - pixel.height), pixel)
    d = ImageDraw.Draw(bild)
    if leiste:
        d.rectangle([0, 0, W - 1, q(31)], fill=DUNKEL)
        d.line([0, q(31), W - 1, q(31)], fill=RAND)
        p_max = freistellen(Image.open(K / "w0_concept_max.png"), (432, 8, 530, 106), q(22))
        p_pix = freistellen(Image.open(K / "w0_concept_pixel.png"), (58, 352, 202, 496), q(22))
        for i, (p, aktiv) in enumerate(((p_max, True), (p_pix, False))):
            x = q(3) + i * q(26)
            d.rectangle([x, q(3), x + q(23), q(26)], fill=(0x3a, 0x44, 0x66) if aktiv else (0x26, 0x2b, 0x44),
                        outline=(255, 255, 255) if aktiv else GRAU)
            bild.paste(p, (x + 1 + (q(22) - p.width) // 2, q(4)), p)
        pl = WURZEL / "game" / "grafik" / "platzhalter"
        for i, s in enumerate(["pixel", "gegenstand_thunfischdose", "gegenstand_notizbuch",
                               "gegenstand_opas_zettel", "gegenstand_reisetasche", "", "", ""]):
            x = q(58) + i * q(26)
            d.rectangle([x, q(3), x + q(23), q(26)], fill=(0x26, 0x2b, 0x44), outline=(0x3a, 0x44, 0x66))
            if s == "pixel":
                ic = freistellen(Image.open(K / "w0_concept_pixel.png"), (38, 30, 312, 300), q(16))
                bild.paste(ic, (x + 2, q(7)), ic)
                d.rectangle([x, q(3), x + q(23), q(26)], outline=(0x2c, 0xe8, 0xf5))
            elif s and (pl / f"{s}.png").exists():
                ic = Image.open(pl / f"{s}.png").convert("RGBA").resize((q(22), q(22)), Image.Resampling.NEAREST)
                bild.paste(ic, (x + 1, q(4)), ic)
        d.polygon([(q(268), q(15)), (q(272), q(11)), (q(272), q(19))], fill=GRAU)
    else:
        # eingeklappt: nur ein schmaler Griff oben in der Mitte
        d.rectangle([W // 2 - q(14), 0, W // 2 + q(14), q(3)], fill=DUNKEL, outline=RAND)
    # Hilfe-Pfote bleibt immer sichtbar
    x0 = W - q(27)
    d.rectangle([x0, q(3), x0 + q(23), q(26)], fill=(0x26, 0x2b, 0x44), outline=GELB)
    d.ellipse([x0 + q(7), q(12), x0 + q(16), q(21)], fill=(0xfe, 0xae, 0x34))
    for dx, dy in ((q(5), q(7)), (q(9), q(5)), (q(14), q(5)), (q(18), q(7))):
        d.ellipse([x0 + dx - q(2), dy, x0 + dx + 1, dy + q(3)], fill=(0xfe, 0xae, 0x34))
    return bild.resize((W * F, H * F), Image.Resampling.NEAREST), boden * F


def umbrechen(s, font, breite):
    # Zwei Sätze, die je in eine Zeile passen, bekommen je eine Zeile
    import re
    saetze = re.split(r"(?<=[.!?…])\s+", s)
    if len(saetze) == 2 and all(font.getlength(x) <= breite for x in saetze):
        return saetze
    zeilen, z = [], ""
    for wort in s.split():
        t = f"{z} {wort}".strip()
        if font.getlength(t) <= breite or not z:
            z = t
        else:
            zeilen.append(z)
            z = wort
    return zeilen + [z]


def text(d, xy, s, font, farbe, rand=True, anker="la"):
    d.text(xy, s, font=font, fill=farbe, anchor=anker,
           stroke_width=max(3, font.size // 11) if rand else 0, stroke_fill=RAND)


def blase(d, s, font, farbe, mitte_x, unten_y, breite=1080):
    zeilen = umbrechen(s, font, breite)
    assert len(zeilen) <= 2, zeilen
    zh = round(font.size * 1.18)
    y = unten_y - zh * len(zeilen)
    for i, z in enumerate(zeilen):
        text(d, (mitte_x, y + i * zh), z, font, farbe, anker="ma")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("schrift")
    ap.add_argument("--aus", default="mockup")
    a = ap.parse_args()
    pfad, _, gr = a.schrift.partition(":")
    font = ImageFont.truetype(pfad, int(gr or 46))
    klein = ImageFont.truetype(pfad, round(font.size * 0.85))
    aus = Path(a.aus)
    aus.mkdir(parents=True, exist_ok=True)
    stamm = f"ui_mockup_hd_{Path(pfad).stem}"

    # 1. Erkunden: Leiste offen, Zeiger mit Objektname, Pixel sagt einen kurzen Satz
    bild, fuss = szene(leiste=True, dialog_px=0)
    d = ImageDraw.Draw(bild)
    blase(d, "Da drüben im Schrank riecht es nach Fisch. Nur so als Hinweis.",
          font, FARBEN["Pixel"], q(176) * F + 54, fuss - q(56) * F - 24)   # auf Kopfhöhe von Max, nicht über ihm
    cx, cy = q(236) * F, q(70) * F
    zeiger = [(0, 0), (0, 8), (2, 6), (4, 10), (5, 9), (3, 5), (6, 5)]
    d.polygon([(cx + x * F, cy + y * F) for x, y in zeiger], fill=(255, 255, 255), outline=RAND, width=F)
    text(d, (cx + 18, cy + q(12) * F), "Kleiderschrank", klein, GELB, anker="ma")
    bild.save(aus / f"{stamm}_erkunden.png")
    e = bild

    # 2. Gespräch: Leiste eingeklappt, Blase mit zwei Zeilen, Dialogauswahl unten
    optionen = [("Wo ist die Fernbedienung, Opa?", GRAU), ("Was ist Kanal 7?", GELB),
                ("Warum ist Pixel so dick?", (255, 255, 255)), ("Tschüss.", (255, 255, 255))]
    zh = round(klein.size * 1.25)
    oh = zh * len(optionen) + 36
    bild, fuss = szene(leiste=False, dialog_px=oh)
    d = ImageDraw.Draw(bild)
    blase(d, "Ich hab nicht mal die Fernbedienung gefunden. Und die liegt hier dreimal.",
          font, FARBEN["Max"], q(160) * F, fuss - q(56) * F - 24)
    d.rectangle([0, H * F - oh, W * F, H * F], fill=DUNKEL)
    d.rectangle([0, H * F - oh, W * F, H * F - oh + F - 1], fill=RAND)
    for i, (o, farbe) in enumerate(optionen):
        text(d, (48, H * F - oh + 18 + i * zh), o, klein, farbe, rand=False)
    bild.save(aus / f"{stamm}_gespraech.png")

    # Übersicht nebeneinander, halbe Größe
    ue = Image.new("RGB", (W * F, H * F // 2), DUNKEL)
    ue.paste(e.resize((W * F // 2, H * F // 2), Image.Resampling.LANCZOS), (0, 0))
    ue.paste(bild.resize((W * F // 2, H * F // 2), Image.Resampling.LANCZOS), (W * F // 2, 0))
    ue.save(aus / f"{stamm}_uebersicht.png")
    print(aus / f"{stamm}_gespraech.png")


if __name__ == "__main__":
    main()
