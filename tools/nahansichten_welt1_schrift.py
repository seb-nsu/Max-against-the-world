"""Schrift auf die drei Nahansichten von Welt 1 (Pixelify Sans ohne Kantenglättung)."""
from PIL import Image, ImageDraw, ImageFont

# Quelle: die mit tools/pixelieren.py umgerechneten Gemini-Bilder (nah_*.png, 640×360) in diesem Ordner
S = r"E:/Game Engine/Grafiken/assets/welt-1/pixel/"
Z = r"E:/Claude/Couch Quest/game/grafik/nahansichten/"
TTF = r"E:/Claude/Couch Quest/game/schriften/pixelify-sans.ttf"
TINTE = (52, 36, 60)


def font(g):
    return ImageFont.truetype(TTF, g)


def umbrechen(d, text, f, breite):
    zeilen, z = [], ""
    for w in text.split():
        p = (z + " " + w).strip()
        if d.textlength(p, font=f) > breite and z:
            zeilen.append(z)
            z = w
        else:
            z = p
    zeilen.append(z)
    return zeilen


# --- Alwins Hinweiszettel: zwei Strophen auf den sechs Linien, leicht schräg nach oben (Max: „wandert schräg nach oben“)
im = Image.open(S + "nah_hinweiszettel.png").convert("RGB")
d = ImageDraw.Draw(im)
d.fontmode = "1"
f = font(10)
text = ("Sechs Flaschen im Regal, so lautet die Zahl: ein Trank, ein Öl, zweimal Gift, zweimal Saft. "
        "Mehr hat mein Regal nie geschafft. ~ Das Fischöl, das stinkt, steht gleich rechts neben dem Trank. "
        "Die zwei Riesen sind gleich bis zum Rand. Und am Rand des Regals steht nie, was du suchst. "
        "Mehr reimt sich nicht, auch wenn du fluchst.")
zeilen = []
for teil in text.split(" ~ "):
    zeilen += umbrechen(d, teil, f, 300)
linien = [96, 130, 165, 201, 237, 273]
abstand = (linien[-1] - linien[0]) / max(1, len(zeilen) - 1)
for i, z in enumerate(zeilen):
    y = linien[0] - 11 + i * abstand
    d.text((200, y), z, font=f, fill=TINTE)
    d.text((201, y - 1), "", font=f, fill=TINTE)
d.text((420, 300), "– Alwin", font=font(10), fill=TINTE)
im.save(Z + "hinweiszettel.png")
print("Zettel", len(zeilen), "Zeilen")

# --- Moderworts Zeugnis
im = Image.open(S + "nah_zeugnis.png").convert("RGB")
d = ImageDraw.Draw(im)
d.fontmode = "1"
ft = font(12)
titel = "Zeugnis  ·  Moderwort, 1. Jahr"
w = d.textlength(titel, font=ft)
d.text(((180 + 465 - w) / 2, 95), titel, font=ft, fill=TINTE)
f = font(10)
zeilen = [("Kräuterkunde", "6", "Besenflug", "5"),
          ("Zaubertränke", "6", "Verwandlung", "4"),
          ("Bosheit", "3", "Pünktlichkeit", "1"),
          ("Niesen", "1", "Mitarbeit", "5"),
          ("Flüche", "4", "Betragen", "1")]
ys = [156, 186, 216, 246, 276]
for (a, b, c, e), y in zip(zeilen, ys):
    d.text((122, y), a, font=f, fill=TINTE)
    d.text((328, y), c, font=f, fill=TINTE)
    fn = font(11)
    for txt, x0, x1 in ((b, 274, 318), (e, 489, 534)):
        tw = d.textlength(txt, font=fn)
        d.text((x0 + (x1 - x0 - tw) / 2, y - 2), txt, font=fn, fill=TINTE)
notiz = "Für meinen Mo-Knuddel, stolz!"
d.text((400, 305), notiz, font=font(9), fill=(150, 40, 60))
im.save(Z + "zeugnis.png")

# --- Kritzelei am Luftschloss: Kreide, Anfang weggewischt, Strichmännchen ohne Nase
im = Image.open(S + "nah_kritzelei.png").convert("RGB")
d = ImageDraw.Draw(im)
d.fontmode = "1"
KREIDE = (255, 255, 255)
SCHATTEN = (150, 136, 170)
KREIDE2 = (196, 186, 214)
f = font(18)
for dx in range(0, 46, 4):                                   # weggewischter Anfang: Kreideschlieren
    d.line((282 + dx, 196 - (dx % 8) // 4, 286 + dx, 192), fill=KREIDE2)
for (ox, oy, c) in ((1, 1, SCHATTEN), (0, 0, KREIDE)):
    d.text((334 + ox, 180 + oy), "-Bärchen war hier.", font=f, fill=c)
# Strichmännchen ohne Nase rechts unter dem Text
x, y = 492, 224
d.ellipse((x - 6, y - 6, x + 6, y + 6), outline=KREIDE, width=1)
d.line((x, y + 6, x, y + 26), fill=KREIDE, width=1)
d.line((x - 9, y + 13, x + 9, y + 13), fill=KREIDE, width=1)
d.line((x, y + 26, x - 7, y + 38), fill=KREIDE, width=1)
d.line((x, y + 26, x + 7, y + 38), fill=KREIDE, width=1)
d.point((x - 2, y - 1), fill=KREIDE)
d.point((x + 2, y - 1), fill=KREIDE)
d.line((x - 2, y + 3, x + 2, y + 3), fill=KREIDE)
im.save(Z + "luftschloss_kritzelei.png")
print("fertig")
