"""Beschriftet die Rohbau-Renders aus rohbau_raeume.py (Pillow).

Aufruf: py -3 tools/grafik_w3/rohbau_notiz.py ORDNER (auch für Welt 4: docs/grafik/skizzen/welt-4/rohbau)
Liest <raum>_rohbau.png und .json, schreibt <raum>_rohbau_notiz.png: Beschriftungen (englisch, wie
die Prompts), Figurenplätze lila gestrichelt (Platz frei lassen, eigene Sprites), Max grau als Maßstab.
"""
import json
import sys
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ordner = Path(sys.argv[1])
font = font_k = None
for _datei in ("C:/Windows/Fonts/arial.ttf", "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"):
    try:
        font = ImageFont.truetype(_datei, 17)
        font_k = ImageFont.truetype(_datei, 15)
        break
    except OSError:
        pass
if font is None:
    font = font_k = ImageFont.load_default()


def gestrichelt(d, box, farbe, laenge=8):
    x0, y0, x1, y1 = box
    for (a, b) in [((x0, y0), (x1, y0)), ((x1, y0), (x1, y1)), ((x1, y1), (x0, y1)), ((x0, y1), (x0, y0))]:
        n = max(1, int(((b[0] - a[0]) ** 2 + (b[1] - a[1]) ** 2) ** 0.5 // laenge))
        for i in range(0, n, 2):
            p = (a[0] + (b[0] - a[0]) * i / n, a[1] + (b[1] - a[1]) * i / n)
            q = (a[0] + (b[0] - a[0]) * min(i + 1, n) / n, a[1] + (b[1] - a[1]) * min(i + 1, n) / n)
            d.line([p, q], fill=farbe, width=3)


def etikett(d, x, y, text, farbe, f, belegt):
    w = d.textlength(text, font=f) + 8
    h = f.size + 6
    x = min(max(2, x - w / 2), d.im.size[0] - w - 2)
    y = max(2, y - h - 4)
    for _ in range(30):
        if not any(not (x + w < a or x > c or y + h < b or y > e) for a, b, c, e in belegt):
            break
        y -= h + 2
        if y < 2:
            y = 2
            x += 20
    belegt.append((x, y, x + w, y + h))
    d.rectangle([x, y, x + w, y + h], fill=(255, 255, 255, 225), outline=farbe)
    d.text((x + 4, y + 2), text, fill=farbe, font=f)
    return x + w / 2, y + h


for js in sorted(ordner.glob("*_rohbau.json")):
    info = json.loads(js.read_text(encoding="utf-8"))
    im = Image.open(js.with_suffix(".png")).convert("RGBA")
    ov = Image.new("RGBA", im.size, (0, 0, 0, 0))
    d = ImageDraw.Draw(ov)
    belegt = []
    for t, x0, y0, x1, y1 in info["figuren"]:
        grau = t.startswith("Max")
        farbe = (110, 110, 110, 255) if grau else (150, 40, 170, 255)
        gestrichelt(d, (x0, y0, x1, y1), farbe)
        etikett(d, (x0 + x1) / 2, y0, t, farbe, font_k, belegt)
    for t, x, y in info["labels"]:
        ex, ey = etikett(d, x, y, t, (20, 60, 160, 255), font, belegt)
        d.line([(ex, ey), (x, y)], fill=(20, 60, 160, 200), width=1)
    leg = ("Rohbau / blockout for layout, scale and perspective only. Blue: paint into background. "
           "Purple dashed: character (own sprite), keep free. Grey: Max 1.75 m for scale.")
    d.rectangle([0, im.size[1] - 26, d.textlength(leg, font=font_k) + 12, im.size[1]], fill=(255, 255, 255, 230))
    d.text((6, im.size[1] - 22), leg, fill=(0, 0, 0, 255), font=font_k)
    Image.alpha_composite(im, ov).convert("RGB").save(js.with_name(js.stem + "_notiz.png"))
    print("ok", js.stem)
