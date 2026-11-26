"""Skizzen der festen Bild-in-Bild-Szenen (Rätsel 6 und 13) aus den Rohbau-Bildern (Pillow).

R6: links die rechte Hälfte der Sitcom-Küche (Tür am rechten Rand), rechts der Spukhaus-Keller
(verkettete Tür am linken Rand). Beide Türen stoßen an die Naht; die Küchentür wird über den
dünnen weißen Rahmen hinübergeschoben. R13: links Zappmanns Studio, rechts die Kindersendung 1977.
Jede Hälfte ist 320 × 360 im Spiel (hier doppelt so groß), Godot setzt beide Szenen nebeneinander.

Aufruf: python3 tools/grafik_w4/bild_in_bild_skizze.py docs/grafik/skizzen/welt-4/rohbau
"""
import sys
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ordner = Path(sys.argv[1])
try:
    font = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 22)
except OSError:
    try:
        font = ImageFont.truetype("C:/Windows/Fonts/arial.ttf", 22)
    except OSError:
        font = ImageFont.load_default()


def mitte(im, breite):
    """Ausschnitt in Bildbreite `breite` aus der Mitte (Seitenverhältnis 8:9 je Hälfte)."""
    x0 = (im.width - breite) // 2
    return im.crop((x0, 0, x0 + breite, im.height))


def zusammen(links, rechts, name, texte):
    h = 720
    l = links.resize((640, h)) if links.size != (640, h) else links
    r = rechts.resize((640, h)) if rechts.size != (640, h) else rechts
    out = Image.new("RGB", (1280, h), "white")
    out.paste(l, (0, 0))
    out.paste(r, (640, 0))
    d = ImageDraw.Draw(out)
    d.rectangle([636, 0, 643, h], fill="white")
    d.rectangle([0, 0, 1279, h - 1], outline="white", width=6)
    for x, y, t in texts_layout(texte):
        w = d.textlength(t, font=font) + 10
        d.rectangle([x, y, x + w, y + 30], fill=(255, 255, 255), outline=(20, 60, 160))
        d.text((x + 5, y + 3), t, fill=(20, 60, 160), font=font)
    out.save(ordner / name)
    print("ok", name)


def texts_layout(texte):
    return texte


kueche = Image.open(ordner / "sitcom_kueche_rohbau.png")       # 2560 × 720
keller = Image.open(ordner / "spukhaus_keller_rohbau.png")     # 1280 × 720
studio = Image.open(ordner / "zappmanns_studio_rohbau.png")
kinder = Image.open(ordner / "kindersendung_rohbau.png")

# Küche: rechter Rand mit der Tür (letzte 720 Pixel Breite = 8:9), Keller: linker Rand mit der Tür
zusammen(kueche.crop((2560 - 640, 0, 2560, 720)), keller.crop((0, 0, 640, 720)), "bild_in_bild_r6_skizze.png",
         [(20, 20, "SITCOM KITCHEN (right part)"), (660, 20, "CELLAR (left part)"),
          (430, 660, "kitchen door slides over the white seam -> replaces the chained door")])
zusammen(mitte(studio, 640), mitte(kinder, 640), "bild_in_bild_r13_skizze.png",
         [(20, 20, "ZAPPMANN SHOW (live)"), (660, 20, "ARCHIVE TAPE: kids' show 1977")])
