"""Zeichnet Klickflächen, Props, Figuren und Laufbereiche auf die Raum-Panoramen.

Aufruf: py -3 overlay.py ORDNER   (liest *_anfang.json/*_ende.json, schreibt *_klick.png, 2-fach)
Farben: Gelb = Hotspot, Cyan = Prop (Klickfläche), Magenta = Figur, Grün = Laufbereich, Weiß = walk_to.
"""
import json
import sys
from pathlib import Path

from PIL import Image, ImageDraw

ordner = Path(sys.argv[1])
for js in sorted(ordner.glob("*.json")):
    d = json.loads(js.read_text(encoding="utf-8"))
    png = js.with_suffix(".png")
    if not png.exists():
        continue
    k = 2
    im = Image.open(png).convert("RGBA")
    im = im.resize((im.width * k, im.height * k), Image.NEAREST)
    ov = Image.new("RGBA", im.size, (0, 0, 0, 0))
    dr = ImageDraw.Draw(ov)

    def poly(pts, farbe, fuell):
        if len(pts) >= 3:
            dr.polygon([(x * k, y * k) for x, y in pts], outline=farbe, fill=fuell, width=2)

    for w in d["laufbereiche"]:
        for p in w["polys"]:
            poly(p, (0, 255, 0, 255), (0, 255, 0, 40))
    for h in d["hotspots"]:
        if not h["sichtbar"]:
            continue
        poly(h["poly"], (255, 230, 0, 255), (255, 230, 0, 45))
        if h["poly"]:
            x, y = h["poly"][0]
            dr.text((x * k + 2, y * k + 2), h["name"], fill=(255, 255, 120, 255))
    for p in d["props"]:
        if not p["sichtbar"]:
            continue
        poly(p["poly"], (0, 220, 255, 255), (0, 220, 255, 45))
        if p["poly"]:
            x, y = p["poly"][0]
            dr.text((x * k + 2, y * k + 2), p["name"], fill=(150, 240, 255, 255))
    for c in d["figuren"]:
        if not c["sichtbar"] or c["name"] == "Max":
            continue
        poly(c["poly"], (255, 0, 255, 255), (255, 0, 255, 40))
        x, y = c["pos"]
        dr.text((x * k - 10, y * k + 4), c["name"], fill=(255, 140, 255, 255))
        dr.line([(x * k - 6, y * k), (x * k + 6, y * k)], fill=(255, 0, 255, 255), width=2)
    out = Image.alpha_composite(im, ov)
    out.save(js.with_name(js.stem + "_klick.png"))
    print("ok", js.stem)
