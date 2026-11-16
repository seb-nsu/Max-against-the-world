"""Schrift und Zeichen auf die Nahansichten von Welt 2 (Pixelify Sans ohne Kantenglättung), deutsch und englisch.
Die englischen Bilder heißen <name>_en.png; oberflaeche/nahansicht.gd nimmt sie bei englischer Sprache.
Bilder ohne Schrift (Sandgrube, Konter-Auswahl, Paraden-Plan) werden nur kopiert.

Aufruf:  python3 tools/nahansichten_welt2_schrift.py"""
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

# Quelle: die mit tools/pixelieren.py umgerechneten Gemini-Bilder (nah_*.png, 640×360) und die Hieroglyphen,
# mit tools/figur.py gegenstaende aus dem 4×4-Bogen geschnitten (hiero48: längste Seite 46, hiero34: 32)
S = r"E:/Game Engine/Grafiken/assets/welt-2/pixel/"
ROOT = Path(__file__).resolve().parent.parent
Z = str(ROOT / "game" / "grafik" / "nahansichten") + "/"
TTF = str(ROOT / "game" / "schriften" / "pixelify-sans.ttf")
TINTE = (52, 36, 60)
KERBE = (58, 34, 20)       # eingeritzte Schrift auf Holz
KERBE_HELL = (196, 150, 96)

TEXTE = {
    "de": {
        "tafel": ["Was wächst, gärt oder verwittert, reist mit der Zeit.",
                  "Was du selbst pflückst, bleibt. Der Rest ist der Zeit egal.",
                  "Ägypten – Olympia: 112 Jahre | Olympia – Syrakus: 25 Jahre"],
        "tafel_oben": ["Bitte das Krokodil nicht füttern.", "Es frisst trotzdem."],
        "aushang_titel": "BEKANNTMACHUNG",
        "aushang": "Jedes neue Rundschreiben gilt sofort und über allen anderen Vorschriften.",
        "aushang_fuss": "Gezeichnet: Das Startbüro von Olympia",
    },
    "en": {
        "tafel": ["Whatever grows, ferments or weathers travels with time.",
                  "What you pick yourself stays as it is. Time doesn't care about the rest.",
                  "Egypt – Olympia: 112 years | Olympia – Syracuse: 25 years"],
        "tafel_oben": ["Please don't feed the crocodile.", "It eats anyway."],
        "aushang_titel": "NOTICE",
        "aushang": "Every new circular takes effect immediately and overrides all other regulations.",
        "aushang_fuss": "Signed: The Olympia Start Office",
    },
}


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


# Eigene Ziffern 5×8 (Höhe der Großbuchstaben in Pixelify 12): In Pixelify sehen 2 und 5 aus wie 8 und 9,
# und die Fährtafel braucht die Jahre eindeutig (Rätsel 10: 112 + 25 = 137).
ZIFFERN = {
    "0": [".###.", "#...#", "#..##", "#.#.#", "#.#.#", "##..#", "#...#", ".###."],
    "1": ["..#..", ".##..", "..#..", "..#..", "..#..", "..#..", "..#..", ".###."],
    "2": [".###.", "#...#", "....#", "...#.", "..#..", ".#...", "#....", "#####"],
    "3": [".###.", "#...#", "....#", "..##.", "....#", "....#", "#...#", ".###."],
    "4": ["...#.", "..##.", ".#.#.", "#..#.", "#####", "...#.", "...#.", "...#."],
    "5": ["#####", "#....", "####.", "....#", "....#", "....#", "#...#", ".###."],
    "6": [".###.", "#....", "#....", "####.", "#...#", "#...#", "#...#", ".###."],
    "7": ["#####", "....#", "...#.", "...#.", "..#..", "..#..", "..#..", "..#.."],
    "8": [".###.", "#...#", "#...#", ".###.", "#...#", "#...#", "#...#", ".###."],
    "9": [".###.", "#...#", "#...#", "#...#", ".####", "....#", "....#", ".###."],
}
ZIFFER_OBEN = 4   # Abstand von der Textposition zur Oberkante der Großbuchstaben bei Größe 12


def ziffer(d, z, x, y, farbe):
    for r, zeile in enumerate(ZIFFERN[z]):
        for c, ch in enumerate(zeile):
            if ch == "#":
                d.point((int(x) + c, int(y) + ZIFFER_OBEN + r), fill=farbe)


def schreiben(d, xy, text, f, farbe):
    """Wie d.text, aber Ziffern aus ZIFFERN (nur bei Größe 12, sonst die Schrift selbst)."""
    x, y = xy
    if f.size != 12 or not any(ch.isdigit() for ch in text):
        d.text((x, y), text, font=f, fill=farbe)
        return
    i = 0
    while i < len(text):   # Läufe ohne Ziffern am Stück, damit sie genau wie bisher aussehen
        j = i + 1
        while j < len(text) and text[j].isdigit() == text[i].isdigit():
            j += 1
        px = x + d.textlength(text[:i], font=f)
        if text[i].isdigit():
            for k in range(i, j):
                ziffer(d, text[k], x + d.textlength(text[:k], font=f), y, farbe)
        else:
            d.text((px, y), text[i:j], font=f, fill=farbe)
        i = j


def mittig(d, text, f, x0, x1, y, farbe, kerbe=None):
    w = d.textlength(text, font=f)
    x = (x0 + x1 - w) / 2
    if kerbe:   # heller Rand unten rechts: wirkt eingeschnitten
        schreiben(d, (x + 1, y + 1), text, f, kerbe)
    schreiben(d, (x, y), text, f, farbe)


def glyphe(im, name, groesse, x0, y0, x1, y1):
    g = Image.open(S + f"hiero{groesse}/{name}.png").convert("RGBA")
    im.alpha_composite(g, (int((x0 + x1 - g.width) / 2), int((y0 + y1 - g.height) / 2)))


def oben_einritzen(d, zeilen):
    """Hausordnung auf dem freien oberen Brett der Fährtafel, über den drei Feldern (W2_NIL_PIX_0660)."""
    for i, z in enumerate(zeilen):
        mittig(d, z, font(12), 166, 422, 99 + i * 15, KERBE, KERBE_HELL)


def ziffern_flicken(pfad, text, feld=(166, 230, 422, 265)):
    """Nur für die Cloud ohne Quellbilder: die alte Zeile (Pixel in KERBE/KERBE_HELL) mit dem Holz daneben
    übermalen und neu ritzen. Ein voller Lauf mit den Quellbildern ergibt dasselbe."""
    im = Image.open(pfad).convert("RGB")
    d = ImageDraw.Draw(im)
    d.fontmode = "1"
    f = font(12)
    x0, y0, x1, y1 = feld
    zeilen = [t.strip() for t in text.split("|")]
    h = 14 * len(zeilen)
    a = im.load()
    for zi, z in enumerate(zeilen):
        y = (y0 + y1 - h) / 2 + zi * 14 - 1
        x = (x0 + x1 - d.textlength(z, font=f)) / 2
        # Die Tafel wurde mit einer anderen Pillow-Version gesetzt (andere Laufweiten): Lage der alten Zeile
        # suchen, indem die Zeile probeweise verschoben wird, bis ihre Pixel am besten passen
        def treffer(dx, dy):
            probe = Image.new("1", im.size, 0)
            ImageDraw.Draw(probe).text((x + dx, y + dy), z, font=f, fill=1)
            pp = probe.load()
            return sum(1 for qy in range(int(y) - 2, int(y) + 18) for qx in range(x0, x1)
                       if pp[qx, qy] and a[qx, qy] == KERBE)
        dx, dy = max(((i, j) for i in range(-8, 9) for j in (-1, 0, 1)), key=lambda t: treffer(*t))
        x, y = x + dx, y + dy
        # ganze alte Zeile mit dem Holz daneben übermalen (Holzmaserung läuft waagrecht) und neu ritzen
        for py in range(int(y) + 2, int(y) + 16):
            for qx in range(x0 + 2, x1 - 2):
                if a[qx, py] in (KERBE, KERBE_HELL):
                    for ddx in (-1, 1, -2, 2, -3, 3, -4, 4, -5, 5, -6, 6, -8, 8, -10, 10, -12, 12):
                        q = a[qx + ddx, py]
                        if q not in (KERBE, KERBE_HELL):
                            a[qx, py] = q
                            break
        x = (x0 + x1 - d.textlength(z, font=f)) / 2   # neu mittig, wie bei einem vollen Lauf
        schreiben(d, (x + 1, y + 1), z, f, KERBE_HELL)
        schreiben(d, (x, y), z, f, KERBE)
    im.save(pfad)


def alle(sprache):
    T = TEXTE[sprache]
    ENDUNG = ".png" if sprache == "de" else "_en.png"

    # --- Fährtafel (Nil-Delta): je Zeile ein geschnitztes Feld
    im = Image.open(S + "nah_faehrtafel.png").convert("RGB")
    d = ImageDraw.Draw(im)
    d.fontmode = "1"
    felder = [(166, 140, 422, 176), (166, 186, 422, 220), (166, 230, 422, 265)]
    for (x0, y0, x1, y1), text in zip(felder, T["tafel"]):
        f = font(12)
        zeilen = [t.strip() for t in text.split("|")] if "|" in text else umbrechen(d, text, f, x1 - x0 - 12)
        h = 14 * len(zeilen)
        for i, z in enumerate(zeilen):
            mittig(d, z, f, x0, x1, (y0 + y1 - h) / 2 + i * 14 - 1, KERBE, KERBE_HELL)
    oben_einritzen(d, T["tafel_oben"])
    im.save(Z + "faehrtafel" + ENDUNG)

    # --- Aushang im Startbüro: auf die gemalten Linien geschrieben
    im = Image.open(S + "nah_aushang.png").convert("RGB")
    d = ImageDraw.Draw(im)
    d.fontmode = "1"
    mittig(d, T["aushang_titel"], font(16), 148, 496, 74, TINTE)
    f = font(12)
    linien = [108, 136, 164, 192, 220]
    for z, y in zip(umbrechen(d, T["aushang"], f, 320), linien[1:]):
        mittig(d, z, f, 148, 496, y - 13, TINTE)
    d.text((160, 240), T["aushang_fuss"], font=font(10), fill=TINTE)
    im.save(Z + "aushang" + ENDUNG)

    if sprache != "de":
        return
    # --- Hieroglyphen-Grammatik (ohne Schrift, nur Zeichen): oben ein Beispielsatz nach der Regel
    # „wer handelt, wem er dient, wen er bittet, worum (Körperteil)“, der nicht die Lösung ist;
    # darunter die drei Paare Ohr → Gehör, Mund → Brot, Hand → Gold (Rätsel 2a)
    im = Image.open(S + "nah_hieroglyphen_grammatik.png").convert("RGBA")
    for name, x0, x1 in (("vogel", 162, 222), ("sonne", 246, 308), ("pharao", 330, 392), ("hand", 416, 478)):
        glyphe(im, name, 48, x0, 58, x1, 120)
    zeilen = [(156, 198), (214, 256), (272, 314)]
    for (links, rechts), (y0, y1) in zip((("ohr", "wasser"), ("mund", "brot"), ("hand", "sonne")), zeilen):
        glyphe(im, links, 34, 240, y0, 282, y1)
        glyphe(im, rechts, 34, 358, y0, 400, y1)
    im.convert("RGB").save(Z + "hieroglyphen_grammatik.png")

    # --- Ohne Schrift: Hintergründe für die Minispiele (noch nicht angeschlossen)
    for n in ("sandgrube", "konter_auswahl", "paraden_plan"):
        Image.open(S + f"nah_{n}.png").convert("RGB").save(Z + n + ".png")


if __name__ == "__main__":
    import sys
    if "--nur-oben" in sys.argv:   # ohne die Quellbilder auf E:: nur das obere Brett in die fertigen Tafeln ritzen
        for s, endung in (("de", ".png"), ("en", "_en.png")):
            im = Image.open(Z + "faehrtafel" + endung).convert("RGB")
            d = ImageDraw.Draw(im)
            d.fontmode = "1"
            oben_einritzen(d, TEXTE[s]["tafel_oben"])
            im.save(Z + "faehrtafel" + endung)
        sys.exit()
    if "--nur-ziffern" in sys.argv:   # ohne Quellbilder: alte Pixelify-Ziffern im dritten Feld durch ZIFFERN ersetzen
        for s, endung in (("de", ".png"), ("en", "_en.png")):
            ziffern_flicken(Z + "faehrtafel" + endung, TEXTE[s]["tafel"][2])
        sys.exit()
    for s in ("de", "en"):
        alle(s)
    print("fertig")
