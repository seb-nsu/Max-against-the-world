"""Schrift auf die Nahansichten von Welt 1 (Pixelify Sans ohne Kantenglättung), deutsch und englisch.
Die englischen Bilder heißen <name>_en.png; oberflaeche/nahansicht.gd nimmt sie bei englischer Sprache."""
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

# Quelle: die mit tools/pixelieren.py umgerechneten Gemini-Bilder (nah_*.png, 640×360) in diesem Ordner
S = r"E:/Game Engine/Grafiken/assets/welt-1/pixel/"
ROOT = Path(__file__).resolve().parent.parent
Z = str(ROOT / "game" / "grafik" / "nahansichten") + "/"
TTF = str(ROOT / "game" / "schriften" / "pixelify-sans.ttf")
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



TEXTE = {
    "de": {
        "zettel": ("Sechs Flaschen im Regal, so lautet die Zahl: ein Trank, ein Öl, zweimal Gift, zweimal Saft. "
                   "Mehr hat mein Regal nie geschafft. ~ Das Fischöl, das stinkt, steht gleich rechts neben dem Trank. "
                   "Die zwei Riesen sind gleich bis zum Rand. Und am Rand des Regals steht nie, was du suchst. "
                   "Mehr reimt sich nicht, auch wenn du fluchst."),
        "zeugnis_titel": "Zeugnis  ·  Moderwort, 1. Jahr",
        "zeugnis_zeilen": [("Kräuterkunde", "6", "Besenflug", "5"), ("Zaubertränke", "6", "Verwandlung", "4"),
                           ("Bosheit", "3", "Pünktlichkeit", "1"), ("Niesen", "1", "Mitarbeit", "5"),
                           ("Flüche", "4", "Betragen", "1*")],
        "zeugnis_stern": "* herausragend böse",
        "zeugnis_notiz": "Für meinen Mo-Knuddel, stolz!",
        "kritzelei": "-Bärchen war hier.",
        "satzung_titel": "Märchen-Satzung",
        "satzung": [
            ("1", "Drei Ziegenböcke überqueren die Brücke: der kleine zuerst, dann der mittlere, dann der große."),
            ("2", "Jeder Bock spricht seinen Satz. Der Kleine: „Friss mich nicht, mein Bruder ist fetter.“ "
                  "Der Mittlere: „Friss mich nicht, mein Bruder ist noch fetter.“ Der Große: „Friss mich doch, wenn du dich traust.“"),
            ("3", "Der Troll geht ins Wasser."),
            ("12", "Trolle dürfen nicht nass werden, ohne vorher Bescheid zu sagen."),
            ("14b", "Leihgaben sind zurückzugeben."),
        ],
    },
    "en": {
        "zettel": ("Six bottles on my shelf, as anyone can see: one potion and one oil, two poisons, two juices, all plain as can be. "
                   "My shelf has never managed more, take it from me. ~ The fish oil that stinks stands just right of the potion, quite near. "
                   "The two giants are twins, filled up to the brim. And the ends of the shelf never hold what you're after, I fear. "
                   "That's all of my rhymes, so don't shed a tear."),
        "zeugnis_titel": "Report  ·  Moderwort, Year 1",
        "zeugnis_zeilen": [("Herbology", "6", "Broom flying", "5"), ("Potions", "6", "Transfiguration", "4"),
                           ("Malice", "3", "Punctuality", "1"), ("Sneezing", "1", "Participation", "5"),
                           ("Curses", "4", "Conduct", "1*")],
        "zeugnis_stern": "* outstandingly evil",
        "zeugnis_notiz": "For my Mo-Cuddles, proud!",
        "kritzelei": "-Teddy was here.",
        "satzung_titel": "Fairy Tale Statutes",
        "satzung": [
            ("1", "Three billy goats cross the bridge, the little one first, then the middle one, then the big one."),
            ("2", "Each goat says its line. The little one: \"Don't eat me, my brother is fatter.\" "
                  "The middle one: \"Don't eat me, my brother is even fatter.\" The big one: \"Eat me, then, if you dare.\""),
            ("3", "The troll goes into the water."),
            ("12", "Trolls may not get wet without giving prior notice."),
            ("14b", "Borrowed items are to be returned."),
        ],
    },
}


def alle(sprache):
    T = TEXTE[sprache]
    ENDUNG = ".png" if sprache == "de" else "_en.png"
    # --- Alwins Hinweiszettel: zwei Strophen auf den sechs Linien, leicht schräg nach oben (Max: „wandert schräg nach oben“)
    im = Image.open(S + "nah_hinweiszettel.png").convert("RGB")
    # Die gemalten sechs Linien weg (Review P15: die Verse liefen über die Linien); die Zeilen bekommen
    # danach eigene, dünne Linien genau unter dem Text
    px = im.load()
    for y0 in (96, 130, 165, 201, 237, 273):
        for y in range(y0 - 3, y0 + 3):
            for x in range(230, 440):
                if sum(px[x, y]) < 330:
                    px[x, y] = px[x, y - 6]
    d = ImageDraw.Draw(im)
    d.fontmode = "1"
    f = font(10)
    text = T["zettel"]
    zeilen = []
    for teil in text.split(" ~ "):
        zeilen += umbrechen(d, teil, f, 300)
    abstand = min(30, 216 // max(1, len(zeilen) - 1))
    for i, z in enumerate(zeilen):
        y = 82 + i * abstand
        d.text((200, y), z, font=f, fill=TINTE)
        d.line((198, y + 14, 506, y + 14), fill=(190, 172, 140))
    d.text((420, 316), "– Alwin", font=font(10), fill=TINTE)
    im.save(Z + "hinweiszettel" + ENDUNG)
    print("Zettel", len(zeilen), "Zeilen")

    # --- Moderworts Zeugnis
    im = Image.open(S + "nah_zeugnis.png").convert("RGB")
    d = ImageDraw.Draw(im)
    d.fontmode = "1"
    ft = font(12)
    titel = T["zeugnis_titel"]
    w = d.textlength(titel, font=ft)
    d.text(((180 + 465 - w) / 2, 95), titel, font=ft, fill=TINTE)
    f = font(10)
    zeilen = T["zeugnis_zeilen"]
    ys = [156, 186, 216, 246, 276]
    for (a, b, c, e), y in zip(zeilen, ys):
        d.text((122, y), a, font=f, fill=TINTE)
        d.text((328, y), c, font=f, fill=TINTE)
        fn = font(11)
        for txt, x0, x1 in ((b, 274, 318), (e, 489, 534)):
            tw = d.textlength(txt, font=fn)
            d.text((x0 + (x1 - x0 - tw) / 2, y - 2), txt, font=fn, fill=TINTE)
    # Sternchen bei Betragen (W1_HOGG_MAX_0890, Review Fund 25)
    d.text((122, 305), T["zeugnis_stern"], font=font(9), fill=TINTE)
    notiz = T["zeugnis_notiz"]
    d.text((400, 305), notiz, font=font(9), fill=(150, 40, 60))
    im.save(Z + "zeugnis" + ENDUNG)

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
        d.text((334 + ox, 180 + oy), T["kritzelei"], font=f, fill=c)
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
    im.save(Z + "luftschloss_kritzelei" + ENDUNG)
    # --- Märchen-Satzung am Brückenschild (Review Fund P15): Text nur auf den Brettern, nie auf den
    # Fugen; das Paragrafenzeichen aus Nunito, weil es in Pixelify Sans wie eine 2 aussieht.
    # Quelle: nah_satzung_sebastian_v2.jpeg, mit tools/pixelieren.py auf 640×360 (nah_satzung.png).
    im = Image.open(S + "nah_satzung.png").convert("RGB")
    d = ImageDraw.Draw(im)
    d.fontmode = "1"
    HOLZTINTE = (54, 30, 22)
    NUNITO = str(ROOT / "game" / "schriften" / "nunito-extrabold.ttf")
    ft = font(22)
    titel = T["satzung_titel"]
    d.text(((640 - d.textlength(titel, font=ft)) / 2 + 1, 57), titel, font=ft, fill=(140, 96, 60))
    d.text(((640 - d.textlength(titel, font=ft)) / 2, 56), titel, font=ft, fill=HOLZTINTE)
    f = font(10)
    fp = ImageFont.truetype(NUNITO, 11)
    absaetze = T["satzung"]
    # Je Brett ein eigener Block, damit kein Absatz über eine Fuge läuft: § 1 auf dem zweiten Brett,
    # § 2 auf dem dritten, § 3, § 12 und § 14b auf dem vierten
    bretter = {"1": [132, 146, 160], "2": [189, 202, 215], "rest": [240, 253, 266, 279, 292]}
    plan = []
    reste = list(bretter["rest"])
    for nr, text in absaetze:
        teile = umbrechen(d, text, f, 430)
        ys = bretter["1"] if nr == "1" else bretter["2"] if nr == "2" else [reste.pop(0) for _ in teile]
        assert len(teile) <= len(ys), (nr, len(teile))
        for i, t in enumerate(teile):
            plan.append((nr if i == 0 else "", t, ys[i]))
    FARBE = (246, 232, 196)   # helle Farbe mit dunklem Schatten: auf dem gemaserten Holz lesbar
    def schrift(xy, text, fo):
        for dx, dy in ((1, 1), (1, 0), (0, 1)):
            d.text((xy[0] + dx, xy[1] + dy), text, font=fo, fill=HOLZTINTE)
        d.text(xy, text, font=fo, fill=FARBE)
    for nr, t, y in plan:
        if nr:
            schrift((92, y - 3), "§", ImageFont.truetype(NUNITO, 13))
            schrift((102, y), nr, f)
        schrift((128, y), t, f)
    im.save(Z + "maerchen_satzung" + ENDUNG)
    print("Satzung", len(plan), "Zeilen")


if __name__ == "__main__":
    for sprache in TEXTE:
        alle(sprache)
    print("fertig")
