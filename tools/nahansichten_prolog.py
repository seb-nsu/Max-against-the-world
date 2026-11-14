"""Nahansichten des Prologs (Review Prolog und Welt 1, Fund 4): Kalender auf dem Dachboden und
Opas Zettel. Grundlage ist das leere Papier der Welt-1-Nahansicht „Hinweiszettel“ (Gemini, mit
tools/pixelieren.py umgerechnet); Linien und Kessel werden weggemalt, Schrift in Pixelify Sans
ohne Kantenglättung wie in tools/nahansichten_welt1_schrift.py."""
import math
import random
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent.parent
S = Path(r"E:/Game Engine/Grafiken/assets/welt-1/pixel/nah_hinweiszettel.png")
Z = ROOT / "game" / "grafik" / "nahansichten"
TTF = ROOT / "game" / "schriften" / "pixelify-sans.ttf"
TINTE = (52, 36, 60)
BLEI = (88, 76, 88)
ROT = (178, 36, 42)
ROT_D = (124, 22, 34)


def font(g):
    return ImageFont.truetype(str(TTF), g)


def leeres_papier():
    """Papier ohne Linien und ohne Kessel: Pixel dieser Stellen aus Papier darüber ersetzen."""
    im = Image.open(S).convert("RGB")
    px = im.load()
    w, h = im.size
    def dunkel(p):
        return sum(p) < 330
    # Linien: x 236–434, Zeilen um 96 … 273
    for y0 in (96, 130, 165, 201, 237, 273):
        for y in range(y0 - 3, y0 + 3):
            for x in range(230, 440):
                if dunkel(px[x, y]):
                    px[x, y] = px[x, y - 6]
    # Kessel unten rechts
    for y in range(255, 330):
        for x in range(490, 560):
            if dunkel(px[x, y]) or (px[x, y][2] > 200 and px[x, y][0] > 200 and sum(px[x, y]) > 690):
                px[x, y] = px[x - 80, y]
    return im


def zettel(sprache="de"):
    im = leeres_papier()
    d = ImageDraw.Draw(im)
    d.fontmode = "1"
    f = font(16)
    zeilen = (["Max,", "", "das Ei muss ganz bleiben.", "Alles hängt davon ab."] if sprache == "de"
              else ["Max,", "", "the egg must stay whole.", "Everything depends on it."])
    y = 104
    random.seed(3)
    for i, z in enumerate(zeilen):
        x = 214 + (i % 2) * 6
        d.text((x, y), z, font=f, fill=TINTE)
        if i >= 2:
            # zweimal unterstrichen, leicht wacklig wie mit der Hand
            bw = d.textlength(z, font=f)
            for k, dy in enumerate((20, 24)):
                pts = [(x - 2 + t, y + dy + round(math.sin((t + k * 9) / 23.0) * 1.2)) for t in range(0, int(bw) + 6, 3)]
                d.line(pts, fill=TINTE, width=1)
        y += 40 if z else 18
    d.text((402, 262), "Dein Opa" if sprache == "de" else "Grandpa", font=font(14), fill=TINTE)
    # kleiner Zapp-O-Mat als Kritzelei statt des Kessels
    k = (500, 270)
    d.rounded_rectangle((k[0], k[1], k[0] + 46, k[1] + 34), 4, outline=TINTE)
    d.rounded_rectangle((k[0] + 5, k[1] + 5, k[0] + 32, k[1] + 28), 3, outline=TINTE)
    d.ellipse((k[0] + 36, k[1] + 7, k[0] + 41, k[1] + 12), outline=TINTE)
    d.ellipse((k[0] + 36, k[1] + 17, k[0] + 41, k[1] + 22), outline=TINTE)
    d.line((k[0] + 14, k[1], k[0] + 6, k[1] - 12), fill=TINTE)
    d.line((k[0] + 22, k[1], k[0] + 30, k[1] - 12), fill=TINTE)
    d.line((k[0] + 6, k[1] + 34, k[0] + 4, k[1] + 40), fill=TINTE)
    d.line((k[0] + 40, k[1] + 34, k[0] + 42, k[1] + 40), fill=TINTE)
    # Zwinker-Gesicht auf dem Bildschirm
    d.point([(k[0] + 13, k[1] + 13), (k[0] + 14, k[1] + 13)], fill=TINTE)
    d.line((k[0] + 22, k[1] + 13, k[0] + 25, k[1] + 13), fill=TINTE)
    d.arc((k[0] + 12, k[1] + 14, k[0] + 26, k[1] + 23), 20, 160, fill=TINTE)
    im.save(Z / ("opas_zettel.png" if sprache == "de" else "opas_zettel_en.png"))
    print("Opas Zettel")


def kalender(sprache="de"):
    papier = leeres_papier()
    # Wand: die Bretter hinter dem Kalender im Dachboden-Hintergrund, vergrößert, weich und dunkler
    from PIL import ImageFilter, ImageEnhance
    wand = Image.open(ROOT / "game/grafik/hintergruende/w0_bg_dachboden_v03.png").convert("RGB")
    wand = wand.crop((420, 60, 580, 150)).resize((640, 360), Image.BICUBIC).filter(ImageFilter.GaussianBlur(3))
    im = ImageEnhance.Brightness(wand).enhance(0.45)
    d = ImageDraw.Draw(im)
    blatt = papier.crop((128, 26, 560, 334)).resize((340, 300), Image.NEAREST)
    x0, y0 = 150, 42
    d.rectangle((x0 + 7, y0 + 9, x0 + 347, y0 + 319), fill=(26, 16, 14))
    im.paste(blatt, (x0, y0 + 12))
    # Nagel, Aufhängung, Spiralbindung
    d.line((x0 + 170, y0 - 22, x0 + 136, y0 + 3), fill=(52, 44, 40))
    d.line((x0 + 170, y0 - 22, x0 + 204, y0 + 3), fill=(52, 44, 40))
    d.ellipse((x0 + 167, y0 - 25, x0 + 173, y0 - 19), fill=(150, 140, 120), outline=(40, 30, 30))
    d.rectangle((x0 + 8, y0, x0 + 332, y0 + 10), fill=(70, 58, 54))
    for i in range(21):
        cx = x0 + 20 + i * 15
        d.ellipse((cx - 3, y0 - 2, cx + 3, y0 + 18), outline=(170, 170, 176), width=2)
    d.fontmode = "1"
    titel = "NOVEMBER"
    ft = font(22)
    tw = d.textlength(titel, font=ft)
    d.text((x0 + 170 - tw / 2, y0 + 24), titel, font=ft, fill=TINTE)
    tage = ["Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"] if sprache == "de" else ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
    gx, gy, cw, ch = x0 + 16, y0 + 74, 36, 37
    linie = (150, 128, 100)
    for i, t in enumerate(tage):
        d.text((gx + i * cw + 9, gy - 18), t, font=font(12), fill=ROT_D if i == 6 else TINTE)
    for r in range(7):
        d.line((gx, gy + r * ch, gx + 7 * cw, gy + r * ch), fill=linie)
    for c in range(8):
        d.line((gx + c * cw, gy, gx + c * cw, gy + 6 * ch), fill=linie)
    start = 6   # der 1. November 2026 ist ein Sonntag
    kreis = None
    for n in range(1, 31):
        r, c = divmod(start + n - 1, 7)
        d.text((gx + c * cw + 4, gy + r * ch + 3), str(n), font=font(12), fill=ROT_D if c == 6 else TINTE)
        if n == 14:
            kreis = (gx + c * cw + cw / 2, gy + r * ch + ch / 2)
    # dicker roter Kreis, mehrmals nachgezogen
    for k, (rx, ry, dw) in enumerate(((19, 17, 0.0), (21, 18, 0.5), (18, 19, 1.0))):
        pts = [(kreis[0] + rx * math.cos(math.radians(t + dw * 30)), kreis[1] + ry * math.sin(math.radians(t + dw * 30)))
               for t in range(0, 380, 8)]
        d.line(pts, fill=ROT, width=3 if k == 0 else 2)
    # Bleistiftnotiz im rechten Rand, mit kleinem Pfeil zum Kreis
    nx = gx + 7 * cw + 6
    for i, z in enumerate(("K3 –", "Schwur-", "belstein") if sprache == "de" else ("Ch3 –", "Waffle-", "ton")):
        d.text((nx, kreis[1] - 26 + i * 11), z, font=font(10), fill=BLEI)
    d.line((nx - 2, kreis[1] + 10, kreis[0] + 22, kreis[1] + 4), fill=BLEI)
    im.save(Z / ("kalender.png" if sprache == "de" else "kalender_en.png"))
    print("Kalender")


def notizbuch():
    """Hintergrund des Notizbuchs (Review Fund 29): Seite aus dem leeren Papier mit Spiralbindung
    oben, blassen Linien und Eselsohr unten rechts. 520 × 296 wie das Fenster in oberflaeche/notizbuch.gd."""
    papier = leeres_papier()
    seite = papier.crop((120, 22, 566, 338)).resize((520, 296), Image.NEAREST)
    d = ImageDraw.Draw(seite)
    d.rectangle((0, 0, 519, 295), outline=(92, 70, 58), width=2)
    for i in range(24):
        cx = 22 + i * 21
        d.ellipse((cx - 3, -4, cx + 3, 10), outline=(150, 150, 160), width=2)
    # blasse Linien und roter Rand links
    for y in range(66, 250, 20):
        d.line((18, y, 502, y), fill=(206, 190, 160))
    d.line((16, 30, 16, 280), fill=(214, 140, 130))
    # Eselsohr unten rechts
    d.polygon([(500, 295), (519, 276), (519, 295)], fill=(60, 44, 40))
    d.polygon([(500, 295), (519, 276), (500, 276)], fill=(214, 198, 160), outline=(150, 128, 100))
    ziel = ROOT / "game" / "grafik" / "oberflaeche" / "notizbuch_seite.png"
    seite.save(ziel)
    print("Notizbuch")


if __name__ == "__main__":
    for sprache in ("de", "en"):
        zettel(sprache)
        kalender(sprache)
    notizbuch()
