#!/usr/bin/env python3
"""Schrifttest nach 05-spielsysteme.md (Schrift, „Test vor der Entscheidung“).

Setzt den Testsatz in jeder Kandidatin bei Originalgröße (320×180, ohne Kantenglättung) als
Sprechblase auf drei Hintergründe (Dachboden, Zauberwald, Neonstadt) und zeigt fehlende
Zeichen an. Ausgabe: je Schrift ein Bild in 6-facher Vergrößerung plus eine Übersicht.

    python3 tools/schrifttest.py SCHRIFT.ttf[:GRÖSSE] ... --aus ORDNER
"""
import argparse
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

WURZEL = Path(__file__).resolve().parent.parent
TESTSATZ = "„Größer als Ostern.“ Äpfel, Öl, Übermut – Straße, Zapp-O-Mat 3000, 20:15 Uhr… Weißt du’s? Ja! (5 %)"
PRUEFZEICHEN = "äöüÄÖÜß„“‚‘’–…%"
ENDESGA = ["be4a2f", "d77643", "ead4aa", "e4a672", "b86f50", "733e39", "3e2731", "a22633", "e43b44",
           "f77622", "feae34", "fee761", "63c74d", "3e8948", "265c42", "193c3e", "124e89", "0099db",
           "2ce8f5", "ffffff", "c0cbdc", "8b9bb4", "5a6988", "3a4466", "262b44", "181425", "ff0044",
           "68386c", "b55088", "f6757a", "e8b796", "c28569"]
RAND = (0x26, 0x2b, 0x44)
FARBEN = {"Max": (255, 255, 255), "Pixel": (0x2c, 0xe8, 0xf5), "Opa": (0xf7, 0x76, 0x22)}
W, H, BLASE_MAX = 320, 180, 240


def palette_bild(img):
    pal = Image.new("P", (1, 1))
    werte = []
    for h in ENDESGA:
        werte += [int(h[i:i + 2], 16) for i in (0, 2, 4)]
    pal.putpalette(werte + [0] * (768 - len(werte)))
    return img.convert("RGB").quantize(palette=pal, dither=Image.Dither.NONE).convert("RGB")


def hintergruende():
    konzept = WURZEL / "concepts" / "w0_concept_dachboden.png"
    if konzept.exists():
        dach = palette_bild(Image.open(konzept).resize((W, H), Image.Resampling.LANCZOS))
    else:
        dach = Image.new("RGB", (W, H), (0x73, 0x3e, 0x39))
    wald = Image.new("RGB", (W, H), (0x19, 0x3c, 0x3e))
    d = ImageDraw.Draw(wald)
    for i, x in enumerate(range(0, W, 23)):
        d.rectangle([x, 0, x + 8 + i % 3 * 3, H], fill=(0x26, 0x5c, 0x42))
        d.ellipse([x - 14, 20 + i % 4 * 12, x + 26, 70 + i % 4 * 12], fill=(0x3e, 0x89, 0x48))
        d.ellipse([x + 4, 150 - i % 3 * 6, x + 12, 158 - i % 3 * 6], fill=(0xfe, 0xe7, 0x61))
    d.rectangle([0, 150, W, H], fill=(0x26, 0x5c, 0x42))
    neon = Image.new("RGB", (W, H), (0x18, 0x14, 0x25))
    d = ImageDraw.Draw(neon)
    for i, x in enumerate(range(0, W, 40)):
        h = 60 + (i * 37) % 70
        d.rectangle([x, H - h, x + 34, H], fill=(0x3a, 0x44, 0x66))
        for y in range(H - h + 6, H - 6, 10):
            d.rectangle([x + 5, y, x + 9, y + 3], fill=(0xfe, 0xe7, 0x61) if (x + y) % 3 else (0x2c, 0xe8, 0xf5))
    d.rectangle([20, 30, 140, 44], outline=(0xff, 0x00, 0x44))
    d.rectangle([180, 40, 300, 52], outline=(0xb5, 0x50, 0x88))
    return [("Dachboden", dach), ("Zauberwald", wald), ("Neonstadt", neon)]


def umbrechen(text, font, breite):
    zeilen, akt = [], ""
    for wort in text.split(" "):
        probe = (akt + " " + wort).strip()
        if font.getlength(probe) <= breite or not akt:
            akt = probe
        else:
            zeilen.append(akt)
            akt = wort
    return zeilen + [akt]


def blase(bild, text, font, farbe, oben):
    d = ImageDraw.Draw(bild)
    d.fontmode = "1"                       # keine Kantenglättung
    zeilen = umbrechen(text, font, BLASE_MAX - 8)
    asc, desc = font.getmetrics()
    zh = asc + desc
    breite = int(max(font.getlength(z) for z in zeilen)) + 8
    hoehe = zh * len(zeilen) + 6
    x = (W - breite) // 2
    d.rectangle([x, oben, x + breite, oben + hoehe], fill=(0x18, 0x14, 0x25), outline=RAND)
    for i, z in enumerate(zeilen):
        tx, ty = x + 4, oben + 3 + i * zh
        for dx, dy in ((-1, 0), (1, 0), (0, -1), (0, 1)):
            d.text((tx + dx, ty + dy), z, font=font, fill=RAND)
        d.text((tx, ty), z, font=font, fill=farbe)
    return len(zeilen), oben + hoehe


def fehlende(pfad):
    try:
        from fontTools.ttLib import TTFont
    except ImportError:
        return None
    cmap = TTFont(str(pfad)).getBestCmap()
    return [c for c in PRUEFZEICHEN if ord(c) not in cmap]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("schriften", nargs="+", help="Pfad[:Größe in Pixeln]")
    ap.add_argument("--aus", default="schrifttest")
    a = ap.parse_args()
    aus = Path(a.aus)
    aus.mkdir(parents=True, exist_ok=True)
    hg = hintergruende()
    bericht = ["| Schrift | Größe | Zeilen je Blase | Fehlende Zeichen |", "| --- | --- | --- | --- |"]
    uebersicht = []
    for angabe in a.schriften:
        pfad, _, groesse = angabe.partition(":")
        pfad = Path(pfad)
        groesse = int(groesse or 16)
        font = ImageFont.truetype(str(pfad), groesse)
        reihe = Image.new("RGB", (W * 3, H))
        for i, (_, bild) in enumerate(hg):
            b = bild.copy()
            n, unten = blase(b, TESTSATZ, font, FARBEN["Max"], 8)
            _, unten = blase(b, "Pixel: Thunfisch. Jetzt. Bitte.", font, FARBEN["Pixel"], unten + 6)
            blase(b, "Opa: Größer als Ostern!", font, FARBEN["Opa"], unten + 6)
            reihe.paste(b, (i * W, 0))
        reihe.resize((W * 3 * 6, H * 6), Image.Resampling.NEAREST).save(aus / f"{pfad.stem}_{groesse}px_x6.png")
        uebersicht.append(reihe)
        f = fehlende(pfad)
        bericht.append(f"| {pfad.stem} | {groesse} | {n} | {'nicht geprüft' if f is None else (', '.join(f) or 'keine')} |")
    gesamt = Image.new("RGB", (W * 3, H * len(uebersicht)))
    for i, r in enumerate(uebersicht):
        gesamt.paste(r, (0, i * H))
    gesamt.resize((W * 3 * 2, H * len(uebersicht) * 2), Image.Resampling.NEAREST).save(aus / "uebersicht_x2.png")
    (aus / "bericht.md").write_text("\n".join(bericht) + "\n")
    print("\n".join(bericht))


if __name__ == "__main__":
    main()
