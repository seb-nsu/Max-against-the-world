"""Welt-3-Effekte nach der Vollständigkeitsprüfung: Küchenradio spricht, Kuckucksuhr ruft, Kartenleser blinkt,
Lautsprecher der Testkammern sprechen, Tür in Kammer 3 redet; Max-Ente-Verwandlung (Figurengröße).
Ausschnitte in Hintergrundgröße mit Lage im Raum. Aufruf: py -3 effekte_raum3.py <pixel-ordner> <ausgabe-ordner>"""
import json, sys, math, random
from pathlib import Path
import numpy as np
from PIL import Image

P, AUS = Path(sys.argv[1]), Path(sys.argv[2])


def raum(n):
    return np.asarray(Image.open(P / f"{n}.png").convert("RGBA")).copy()


def speichern(name, bilder, ms, raumname, x, y, schleife=True):
    h, w = bilder[0].shape[:2]
    Image.fromarray(np.concatenate(bilder, 1)).save(AUS / f"{name}.png")
    meta = {"bild": [w, h], "bilder": len(bilder), "ms": ms, "schleife": schleife}
    if raumname:
        meta.update(raum=raumname, lage=[x, y], hinweis="Ausschnitt in Hintergrundgröße, links oben an lage legen")
    (AUS / f"{name}.json").write_text(json.dumps(meta, indent=1))
    print(name, len(bilder), "Bilder", w, "x", h, "bei", x, y)


# Küchenradio spricht (Pixel aus dem Küchenradio): Lautsprecherstreifen leuchten im Rhythmus, Skala glimmt grün
def radio():
    r = raum("W3-R07_kueche_orakel"); x0, y0, W, H = 512, 80, 56, 28
    g = r[y0:y0 + H, x0:x0 + W].copy()
    yy, xx = np.mgrid[0:H, 0:W]
    gitter = (xx >= 6) & (xx < 26) & (yy >= 6) & (yy < 23) & (g[..., :3].astype(int).sum(-1) < 300)
    licht = np.hypot(xx - 37, yy - 13) <= 2
    bilder = []
    for stufe in (0, 2, 1, 2):
        b = g.copy()
        if stufe:
            b[gitter, :3] = (0xb8, 0x6f, 0x50) if stufe == 1 else (0xe4, 0xa6, 0x72)
            b[licht, :3] = (0x63, 0xc7, 0x4d)
        bilder.append(b)
    speichern("W3-B38_kuechenradio", bilder, 120, "W3-R07_kueche_orakel", x0, y0)


# Kuckucksuhr ruft „Milch!“: Türchen auf, Vogel kommt heraus, Schnabel auf, zurück
def kuckucksuhr():
    r = raum("W3-R07_kueche_orakel"); x0, y0, W, H = 400, 64, 36, 30
    g = r[y0:y0 + H, x0:x0 + W].copy()
    tx, ty, tw, th = 412 - x0, 75 - y0, 10, 10

    def tuer_auf(b):
        b[ty:ty + th, tx:tx + tw, :3] = (0x3e, 0x27, 0x31)
        b[ty:ty + th, tx - 2:tx, :3] = (0xb8, 0x6f, 0x50)

    def vogel(b, raus, schnabel):
        # kleiner Vogel (5 x 4) mit Kopf, Auge und Schnabel, schiebt sich um raus Pixel aus dem Türchen
        form = [".##..", "####.", "####.", ".##.."]
        cx, cy = tx + 2 + raus, ty + 3
        for dy, zeile in enumerate(form):
            for dx, ch in enumerate(zeile):
                if ch == "#" and 0 <= cx + dx < W:
                    b[cy + dy, cx + dx, :3] = (0xfe, 0xe7, 0x61)
        b[cy + 1, cx + 2, :3] = (0x26, 0x2b, 0x44)
        b[cy + 1, cx + 4, :3] = (0xf7, 0x76, 0x22)
        if schnabel:
            b[cy + 2, cx + 4, :3] = (0xa2, 0x26, 0x33)

    bilder = []
    for zustand in ("zu", "auf", "v0", "v1s", "v1", "v1s", "v0", "zu"):
        b = g.copy()
        if zustand != "zu":
            tuer_auf(b)
        if zustand.startswith("v"):
            vogel(b, int(zustand[1]) * 3, zustand.endswith("s"))
        bilder.append(b)
    speichern("W3-B39_kuckucksuhr", bilder, 140, "W3-R07_kueche_orakel", x0, y0, schleife=False)


# Kartenleser am Laboreingang blinkt rot
def kartenleser():
    r = raum("W3-R05_laboreingang"); x0, y0, W, H = 404, 164, 28, 38
    g = r[y0:y0 + H, x0:x0 + W].copy(); lx, ly = 425 - x0, 172 - y0
    bilder = []
    for an in (1, 1, 0, 0):
        b = g.copy()
        b[ly - 1:ly + 2, lx - 1:lx + 2, :3] = (0xff, 0x00, 0x44) if an else (0x68, 0x38, 0x6c)
        if an:
            b[ly, lx, :3] = (0xff, 0x9a, 0xa8)
        bilder.append(b)
    speichern("W3-B40_kartenleser", bilder, 300, "W3-R05_laboreingang", x0, y0)


# Lautsprecher spricht (M.U.T.T.I.): Gitter vibriert und leuchtet orange im Takt
def lautsprecher(raumname, name, cx, cy, rx, ry):
    r = raum(raumname); x0, y0 = cx - rx - 3, cy - ry - 3; W, H = 2 * rx + 7, 2 * ry + 7
    g = r[y0:y0 + H, x0:x0 + W].copy()
    yy, xx = np.mgrid[0:H, 0:W]
    e = ((xx - rx - 3) / rx) ** 2 + ((yy - ry - 3) / ry) ** 2
    innen = (e <= 0.8) & (g[..., :3].astype(int).sum(-1) < 420)
    bilder = []
    for stufe, dx in ((0, 0), (1, 1), (2, 0), (1, -1)):
        b = g.copy()
        if dx:
            b[e <= 1] = np.roll(g, dx, axis=1)[e <= 1]
        if stufe:
            b[innen, :3] = (0xf7, 0x76, 0x22) if stufe == 2 else (0xb8, 0x6f, 0x50)
        bilder.append(b)
    speichern(name, bilder, 110, raumname, x0, y0)


# Tür in Kammer 3 redet (nach dem Tausch „gesprächig“): Lämpchen am Türleser blinken grün im Sprechtakt
def tuer_redet():
    r = raum("W3-R11_testkammer_3"); x0, y0, W, H = 582, 186, 20, 36
    g = r[y0:y0 + H, x0:x0 + W].copy()
    lichter = [(8, 6), (8, 10), (8, 26)]
    bilder = []
    for muster in ((1, 0, 1), (0, 1, 0), (1, 1, 0), (0, 0, 1)):
        b = g.copy()
        for an, (lx, ly) in zip(muster, lichter):
            b[ly:ly + 2, lx:lx + 2, :3] = (0x63, 0xc7, 0x4d) if an else (0x26, 0x5c, 0x42)
        bilder.append(b)
    speichern("W3-B44_tuer_kammer3_redet", bilder, 120, "W3-R11_testkammer_3", x0, y0)


# Max wird zur Ente und zurück: grüner Code-Glitch in Figurengröße (das Überblenden der Sprites macht Godot)
def ente():
    rnd = random.Random(7); W, H = 96, 200
    farben = [(0x63, 0xc7, 0x4d), (0x3e, 0x89, 0x48), (0xb6, 0xff, 0x9a), (0x26, 0x5c, 0x42)]
    bilder = []
    for dichte, gr in ((0.2, 6), (0.45, 6), (0.65, 4), (0.65, 4), (0.4, 3), (0.12, 2)):
        a = np.zeros((H, W, 4), np.uint8)
        for y in range(0, H, gr):
            for x in range(0, W, gr):
                rr = math.hypot((x - W / 2) / (W / 2), (y - H * 0.55) / (H / 2))
                if rr < 1 and rnd.random() < dichte * (1.15 - rr):
                    a[y:y + gr - 1, x:x + gr - 1] = (*rnd.choice(farben), 220)
        for _ in range(3):
            y = rnd.randrange(H); a[y, 8:W - 8] = (0xb6, 0xff, 0x9a, 140)
        bilder.append(a)
    speichern("W3-B45_verwandlung_figur", bilder, 70, None, 0, 0, schleife=False)


# Terminal im Büroturm zeigt Pixels Hinweise: grüne Zeilen laufen über den Bildschirm, Cursor blinkt
def terminal():
    r = raum("W3-R08_buero_50"); x0, y0, W, H = 307, 205, 30, 24
    g = r[y0:y0 + H, x0:x0 + W].copy()
    bs = (0x26, 0x3a, 0x2c); gruen = (0x63, 0xc7, 0x4d); hell = (0xb6, 0xff, 0x9a)
    rnd = random.Random(4)
    zeilen = [[rnd.randint(4, 15), rnd.randint(0, 3)] for _ in range(8)]
    bilder = []
    for f in range(4):
        b = g.copy(); b[3:20, 4:26, :3] = bs
        for i in range(4):
            laenge, ein = zeilen[(i + f) % len(zeilen)]
            y = 5 + i * 4
            b[y, 5 + ein:5 + ein + laenge, :3] = gruen
        cy = 5 + 3 * 4 + 2
        if f % 2 == 0:
            b[cy:cy + 2, 6:8, :3] = hell
        bilder.append(b)
    speichern("W3-B46_terminal_buero", bilder, 180, "W3-R08_buero_50", x0, y0)


radio(); kuckucksuhr(); kartenleser(); terminal()
lautsprecher("W3-R09_testkammer_1", "W3-B41_lautsprecher_kammer1", 463, 49, 16, 8)
lautsprecher("W3-R10_testkammer_2", "W3-B42_lautsprecher_kammer2", 463, 49, 16, 8)
lautsprecher("W3-R11_testkammer_3", "W3-B43_lautsprecher_kammer3", 551, 81, 11, 21)
tuer_redet(); ente()
