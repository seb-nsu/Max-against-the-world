# Review 20.11. (GS): Zeigerkarte aus _review_gs_w3_zeiger.gd zeichnen und auswerten.
# Aufruf: py -3 zeigerkarte.py <zeiger.json> <raum.json> <panorama.png> <ausgabe.png> [csv]
# Farbe = Objekt, das an der Stelle als „hovered“ gilt (Mausbewegung von links nach rechts);
# rote Punkte = anderes Ergebnis von rechts nach links; weiß = Oberfläche (#UI) schluckt die Maus.
# Je Objekt: Anteil der eigenen Klickfläche, an dem es gewinnt (beide Richtungen bzw. mindestens eine).
import json, sys, colorsys, hashlib
from PIL import Image, ImageDraw, ImageFont

zj, rj, pano, aus = sys.argv[1:5]
z = json.load(open(zj, encoding="utf8"))
r = json.load(open(rj, encoding="utf8"))
namen = z["namen"]
S = z["schritt"]


def farbe(n):
    if n == "#UI":
        return (255, 255, 255)
    h = int(hashlib.md5(n.encode()).hexdigest()[:6], 16)
    rr, gg, bb = colorsys.hsv_to_rgb((h % 360) / 360.0, 0.85, 1.0)
    return (int(rr * 255), int(gg * 255), int(bb * 255))


def innen(px, py, poly):
    c = False
    j = len(poly) - 1
    for i in range(len(poly)):
        xi, yi = poly[i]; xj, yj = poly[j]
        if (yi > py) != (yj > py) and px < (xj - xi) * (py - yi) / ((yj - yi) or 1e-9) + xi:
            c = not c
        j = i
    return c


# Rasterpunkte in Weltkoordinaten (bei Überlappung der Schirme gilt der erste)
punkte = {}
for s in z["schirme"]:
    ox, oy = s["off"]
    for yi, (zl, zr) in enumerate(zip(s["zeilen"], s["zeilen_rl"])):
        y = S // 2 + yi * S
        for xi, (a, b) in enumerate(zip(zl, zr)):
            x = S // 2 + xi * S
            w = (round(x + ox), round(y + oy))
            if w not in punkte:
                punkte[w] = (namen[a], namen[b])

bild = Image.open(pano).convert("RGBA")
breite = bild.width
lay = Image.new("RGBA", bild.size, (0, 0, 0, 0))
d = ImageDraw.Draw(lay)
for (x, y), (a, b) in punkte.items():
    if a:
        c = farbe(a)
        d.rectangle([x - S // 2, y - S // 2, x + S // 2 - 1, y + S // 2 - 1], fill=c + ((150 if a == "#UI" else 110),))
    if a != b:
        d.rectangle([x - 1, y - 1, x + 1, y + 1], fill=(255, 0, 0, 255))
bild = Image.alpha_composite(bild, lay)

# Objekte und ihre Polygone
objs = []
for h in r["hotspots"]:
    if h["sichtbar"] and h["klickbar"] and h["poly"]:
        objs.append(("H", h["name"], h["poly"]))
for p in r["props"]:
    if p["sichtbar"] and p["klickbar"] and p["poly"]:
        objs.append(("P", p["name"], p["poly"]))
for f in r["figuren"]:
    if f["sichtbar"] and f["poly"] and f["name"] != "Max":
        objs.append(("F", f["name"], f["poly"]))

zeilen = []
d2 = ImageDraw.Draw(bild)
for art, n, poly in objs:
    d2.line([tuple(p) for p in poly] + [tuple(poly[0])], fill=farbe(n) + (255,), width=1)
    drin = [(w, v) for w, v in punkte.items() if innen(w[0] + 0.01, w[1] + 0.01, poly)]
    if not drin:
        zeilen.append((art, n, 0, None, None, None, None))
        continue
    beide = sum(1 for _, (a, b) in drin if a == n and b == n)
    eine = sum(1 for _, (a, b) in drin if a == n or b == n)
    ui = sum(1 for _, (a, b) in drin if a == "#UI")
    xs = [p[0] for p in poly]; ys = [p[1] for p in poly]
    groesse = (max(xs) - min(xs), max(ys) - min(ys))
    zeilen.append((art, n, len(drin), 100 * beide / len(drin), 100 * eine / len(drin), 100 * ui / len(drin), groesse))

# Legende
fh = 11
leg = Image.new("RGBA", (breite, 14 + fh * ((len(zeilen) + 2) // 3 + 1)), (20, 20, 24, 255))
dl = ImageDraw.Draw(leg)
dl.text((4, 2), "%s %s  Farbe=gewinnt (L->R), rote Punkte=richtungsabhaengig, weiss=#UI.  %% = Anteil eigener Flaeche, an dem es gewinnt (beide Richtungen)" % (r["raum"], z["modus"]), fill=(255, 255, 255, 255))
spalte = breite // 3
for i, (art, n, k, beide, eine, ui, g) in enumerate(zeilen):
    x = 4 + (i % 3) * spalte; y = 14 + (i // 3) * fh
    dl.rectangle([x, y + 2, x + 7, y + 9], fill=farbe(n) + (255,))
    t = "%s %s: %s" % (art, n, "kein Rasterpunkt" if beide is None else "%d%%%s%s" % (beide, "" if eine == beide else " (%d%% eine Ri.)" % eine, " UI %d%%" % ui if ui else ""))
    dl.text((x + 11, y), t, fill=(255, 255, 255, 255))
ges = Image.new("RGBA", (breite, bild.height + leg.height))
ges.paste(bild, (0, 0)); ges.paste(leg, (0, bild.height))
ges.convert("RGB").save(aus, optimize=True)

# Text für die Notiz
for art, n, k, beide, eine, ui, g in zeilen:
    print("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s" % (r["raum"], z["modus"], art, n, k,
          "-" if beide is None else round(beide), "-" if eine is None else round(eine), "-" if ui is None else round(ui)) + "\t%s" % (g,))
