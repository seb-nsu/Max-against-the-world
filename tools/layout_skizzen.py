#!/usr/bin/env python3
"""Layout-Skizzen in der Raumansicht mit leichter Tiefe (Entscheidung 10. November 2026).

Aus den erzeugten Raumdaten (game/daten/raeume/<abschnitt>.json, also tools/layout/*.yaml)
entsteht pro Raum eine Skizze: frontale Rückwand, Boden mit Fluchtpunkt, Hotspots als
beschriftete Kästen an ihrem Platz. Die Skizze geht beim Konzeptbild (ChatGPT oder Gemini) als
Vorlage für die Anordnung mit, siehe docs/grafik/00-stil-und-werkzeuge.md.

Umrechnung aus dem flachen Platzhalter-Layout: Alles oberhalb des Laufbereichs ist Rückwand und
wird auf 75 Prozent verkleinert auf die Wand gesetzt (Fluchtpunkt auf 40 Prozent der Höhe, Rückwand 80 Prozent breit),
der Laufbereich wird zum Boden mit Tiefe im unteren Bildteil. Räume, deren Laufbereich kein
waagrechtes Band ist (Treppen, Kletterwege), bleiben flach und sind als Sonderfall beschriftet.

Beschriftung englisch (Spalte en aus docs/uebersetzung/ui.csv), weil auch die Prompts englisch sind.
Hotspots und Props, die erst in einem späteren Zustand des Raums dazukommen (Opas Maschine im
Finale), tragen im Layout „skizze: spaeter“ und fehlen in der Skizze, ebenso versteckte Hotspots.
Farben: blau = Hotspot im Hintergrund, orange gestrichelt = eigenes Sprite (Platz frei lassen),
grün = Ausgang, lila = Figur, grau = Max als Größenmaßstab (vorn 100, hinten 85 Prozent).

Aufruf:  python3 tools/layout_skizzen.py [ZIELORDNER]\n(Standard docs/grafik/skizzen/; dann stehen die Links auch in den Grafik-Dateien unter „Szenen“.)
"""
import csv
import json
import sys
from pathlib import Path

import yaml
from PIL import Image, ImageDraw, ImageFont

WURZEL = Path(__file__).resolve().parent.parent
DATEN = WURZEL / "game/daten/raeume"
LAYOUT = WURZEL / "tools/layout"
ABSCHNITTE = ["prolog", "welt-1", "welt-2", "welt-3", "welt-4", "finale"]
SK = 3                     # Zeichenmaßstab: 640×360 wird als 1920×1080 gezeichnet (lesbare Schrift)
FLUCHT_Y = 0.40            # Fluchtpunkt auf 40 Prozent der Bildhöhe
BODEN_OBEN = 213           # Hinterkante des Bodens in Spielpixeln (Boden 147 Pixel hoch)
WAND_RAND = 0.10           # Seitenstreifen je 10 Prozent der Breite
MAX_HOEHE = 140
WAND_MASS = 0.75         # Möbel an der Rückwand: Schrank etwa 100 bis 115 Pixel, Sessel etwa 50
TIEFE = 0.85

FARBEN = {
    "wand": (226, 214, 190), "seite": (196, 181, 155), "boden": (176, 150, 116), "linie": (120, 98, 72),
    "hotspot": (40, 90, 200), "sprite": (230, 120, 20), "ausgang": (20, 150, 60), "figur": (140, 60, 170),
    "max": (110, 110, 110), "text": (25, 25, 35), "decke": (210, 198, 172),
}


def ui_texte():
    with open(WURZEL / "docs/uebersetzung/ui.csv", encoding="utf-8") as f:
        return {z["keys"]: (z.get("en") or z.get("de") or "") for z in csv.DictReader(f)}


def font(groesse, fett=False):
    name = "DejaVuSans-Bold.ttf" if fett else "DejaVuSans.ttf"
    try:
        return ImageFont.truetype(f"/usr/share/fonts/truetype/dejavu/{name}", groesse)
    except OSError:
        return ImageFont.load_default()


class Umrechnung:
    """Flaches Layout (Wand oben, Bodenband unten) → Ansicht mit leichter Tiefe."""

    def __init__(self, raum):
        self.w, self.h = raum["groesse"]
        ys = [p[1] for p in raum["laufbereich"]]
        self.y0, self.y1 = min(ys), max(ys)
        self.band = len(raum["laufbereich"]) == 4 and self.y1 - self.y0 <= 80
        self.wx0 = self.w * WAND_RAND
        self.wx1 = self.w * (1 - WAND_RAND)

    def y(self, y, wand):
        if not self.band:
            return y
        if wand or y <= self.y0:
            # Rückwand: Unterkante bleibt auf der Wandlinie, Höhen auf WAND_MASS verkleinert
            return BODEN_OBEN - (self.y0 - min(y, self.y0)) * WAND_MASS
        return BODEN_OBEN + (y - self.y0) * (self.h - BODEN_OBEN) / (self.h - self.y0)

    def x(self, x, wand):
        if not self.band or not wand:
            return x
        return self.wx0 + x * (self.wx1 - self.wx0) / self.w

    def rect(self, r):
        x, y, b, h = r
        wand = self.band and y + h <= self.y0 + 3
        x0, x1 = self.x(x, wand), self.x(x + b, wand)
        y0, y1 = self.y(y, wand), self.y(y + h, wand)
        return [x0, y0, x1, max(y1, y0 + 4)]

    def punkt(self, p):
        return self.x(p[0], False), self.y(p[1], False)

    def massstab(self, y):
        """Skalierung einer Figur an Bild-y (vorn 1.0, Hinterkante des Bodens TIEFE)."""
        if not self.band:
            return 1.0
        t = (y - BODEN_OBEN) / (self.h - BODEN_OBEN)
        return TIEFE + (1 - TIEFE) * max(0.0, min(1.0, t))


def gestrichelt(d, box, farbe, breite):
    x0, y0, x1, y1 = box
    schritt = 6 * SK
    for a, b, c, e in ((x0, y0, x1, y0), (x0, y1, x1, y1), (x0, y0, x0, y1), (x1, y0, x1, y1)):
        laenge = max(abs(c - a), abs(e - b))
        n = max(1, int(laenge // schritt))
        for i in range(0, n, 2):
            t0, t1 = i / n, min(1, (i + 1) / n)
            d.line([(a + (c - a) * t0, b + (e - b) * t0), (a + (c - a) * t1, b + (e - b) * t1)], fill=farbe, width=breite)


def beschriften(d, box, text, farbe, f):
    x0, y0, x1, y1 = box
    tb = d.textbbox((0, 0), text, font=f)
    tw, th = tb[2] - tb[0], tb[3] - tb[1]
    tx = max(2, min((x0 + x1) / 2 - tw / 2, d.im.size[0] - tw - 2))
    ty = (y0 + y1) / 2 - th / 2 if y1 - y0 > th + 6 else y0 - th - 6
    ty = max(2, ty)
    d.rectangle([tx - 3, ty - 2, tx + tw + 3, ty + th + 4], fill=(255, 255, 255))
    d.text((tx, ty - tb[1] + 1), text, font=f, fill=farbe)


def zeichne(raum, texte, layout):
    u = Umrechnung(raum)
    lay = layout.get(raum["id"], {})

    def spaeter(obj):
        """Im Layout mit „skizze: spaeter“ markiert: gehört zu einem späteren Zustand des Raums."""
        for gruppe in ("hotspots", "props", "ausgaenge"):
            eintrag = (lay.get(gruppe) or {}).get(obj["id"]) or {}
            if isinstance(eintrag, dict) and eintrag.get("skizze") == "spaeter":
                return True
        return False

    W, H = u.w * SK, u.h * SK
    img = Image.new("RGB", (W, H), FARBEN["wand"])
    d = ImageDraw.Draw(img)
    s = lambda pts: [(a * SK, b * SK) for a, b in pts]  # noqa: E731
    fx, fy = u.w / 2, u.h * FLUCHT_Y

    if u.band:
        bo = BODEN_OBEN
        # Seitenstreifen und Boden: Kanten laufen zum Fluchtpunkt
        def kante(x_wand, y_ziel):
            return fx + (x_wand - fx) * (y_ziel - fy) / (bo - fy)
        d.polygon(s([(0, 0), (u.wx0, kante(u.wx0, 0)), (u.wx0, bo), (kante(u.wx0, u.h), u.h), (0, u.h)]), fill=FARBEN["seite"])
        d.polygon(s([(u.w, 0), (u.wx1, kante(u.wx1, 0)), (u.wx1, bo), (kante(u.wx1, u.h), u.h), (u.w, u.h)]), fill=FARBEN["seite"])
        d.polygon(s([(u.wx0, bo), (u.wx1, bo), (kante(u.wx1, u.h), u.h), (kante(u.wx0, u.h), u.h)]), fill=FARBEN["boden"])
        for i in range(-12, 13):
            xb = fx + i * u.w / 10
            xw = fx + (xb - fx) * (bo - fy) / (u.h - fy)
            d.line(s([(xw, bo), (xb, u.h)]), fill=FARBEN["linie"], width=1)
        for t in (0.15, 0.35, 0.6):
            yy = bo + (u.h - bo) * t
            d.line(s([(kante(u.wx0, yy), yy), (kante(u.wx1, yy), yy)]), fill=FARBEN["linie"], width=1)
        d.line(s([(u.wx0, bo), (u.wx1, bo)]), fill=FARBEN["text"], width=2)
        d.line(s([(u.wx0, kante(u.wx0, 0)), (u.wx0, bo)]), fill=FARBEN["linie"], width=2)
        d.line(s([(u.wx1, kante(u.wx1, 0)), (u.wx1, bo)]), fill=FARBEN["linie"], width=2)
        r = 3
        d.ellipse(s([(fx - r, fy - r), (fx + r, fy + r)]), outline=FARBEN["text"], width=2)
    else:
        d.polygon(s([tuple(p) for p in raum["laufbereich"]]), fill=FARBEN["boden"], outline=FARBEN["linie"])

    f_klein, f_titel = font(11 * SK // 2 + 4), font(6 * SK, True)

    def box(r):
        return [v * SK for v in u.rect(r)]

    # Max als Größenmaßstab: vorn links und an der Hinterkante des Bodens
    if u.band:
        for x, y in ((u.w * 0.06 + 10, u.h - 4), (u.w * 0.5, BODEN_OBEN + 2)):
            m = u.massstab(y)
            hh, bb = MAX_HOEHE * m, 47 * m
            gestrichelt(d, [(x - bb / 2) * SK, (y - hh) * SK, (x + bb / 2) * SK, y * SK], FARBEN["max"], 2)
        beschriften(d, [(u.w * 0.06 + 10) * SK, (u.h - MAX_HOEHE - 4) * SK, (u.w * 0.06 + 10) * SK, (u.h - MAX_HOEHE - 4) * SK],
                    f"Max {MAX_HOEHE} px", FARBEN["max"], f_klein)

    for hs in raum["hotspots"]:
        b = box(hs["rect"])
        if hs.get("versteckt") or spaeter(hs):
            continue
        d.rectangle(b, outline=FARBEN["hotspot"], width=3)
        beschriften(d, b, texte.get(hs["name_key"], hs["id"]), FARBEN["hotspot"], f_klein)
    for p in raum["props"]:
        if spaeter(p):
            continue
        b = box(p["rect"])
        gestrichelt(d, b, FARBEN["sprite"], 3)
        beschriften(d, b, texte.get(p["name_key"], p["id"]) + " (sprite)", FARBEN["sprite"], f_klein)
    for a in raum["ausgaenge"]:
        b = box(a["rect"])
        d.rectangle(b, outline=FARBEN["ausgang"], width=4)
        beschriften(d, b, "EXIT " + texte.get(a["name_key"], a["ziel"]), FARBEN["ausgang"], f_klein)
    for fg in raum.get("figuren", []):
        x, y = u.punkt(fg["pos"])
        hh = (45 if fg["id"] == "pixel" else MAX_HOEHE) * u.massstab(y)
        bb = (49 if fg["id"] == "pixel" else 37) * u.massstab(y)
        b = [(x - bb / 2) * SK, (y - hh) * SK, (x + bb / 2) * SK, y * SK]
        gestrichelt(d, b, FARBEN["figur"], 2)
        beschriften(d, b, fg["script_name"] + " (character)", FARBEN["figur"], f_klein)

    titel = (f"{texte.get(raum['name_key'], raum['id'])} · layout sketch {u.w}x{u.h} · blue: paint into background"
             " · orange: own sprite, keep space free · green: exit · grey: Max for scale")
    if not u.band:
        titel += "  ·  special case: walkway is not a flat floor"
    tb = d.textbbox((0, 0), titel, font=f_titel)
    d.rectangle([0, H - (tb[3] - tb[1]) - 14, tb[2] + 16, H], fill=(255, 255, 255))
    d.text((8, H - (tb[3] - tb[1]) - 10 - tb[1]), titel, font=f_titel, fill=FARBEN["text"])
    return img


GRAFIK_DATEI = {"prolog": "02-prolog-und-finale.md", "finale": "02-prolog-und-finale.md",
                "welt-1": "welt-1.md", "welt-2": "welt-2.md", "welt-3": "welt-3.md", "welt-4": "welt-4.md"}
ANFANG, ENDE = "<!-- skizzen: erzeugt von tools/layout_skizzen.py -->", "<!-- /skizzen -->"


def verweise_eintragen(liste):
    """Schreibt unter „### Szenen“ jeder Grafik-Datei die Links auf die Skizzen ihrer Räume."""
    with open(WURZEL / "docs/uebersetzung/ui.csv", encoding="utf-8") as f:
        de = {z["keys"]: z["de"] for z in csv.DictReader(f)}
    for datei in sorted(set(GRAFIK_DATEI.values())):
        links = [f"[{de.get(k, rid)}](skizzen/{ab}/{rid}.png)" for ab, rid, k in liste if GRAFIK_DATEI[ab] == datei]
        block = (f"{ANFANG}\n**Layout-Skizzen** (beim Konzeptbild mitgeben, Ablauf in `00-stil-und-werkzeuge.md`): "
                 + ", ".join(links) + f".\n{ENDE}\n\n")
        pfad = WURZEL / "docs/grafik" / datei
        text = pfad.read_text(encoding="utf-8")
        if ANFANG in text:
            a, e = text.index(ANFANG), text.index(ENDE) + len(ENDE) + 2
            text = text[:a] + block + text[e:]
        else:
            kopf = "### Szenen\n\n"
            i = text.index(kopf) + len(kopf)
            text = text[:i] + block + text[i:]
        pfad.write_text(text, encoding="utf-8")


def main():
    eigenes_ziel = len(sys.argv) > 1
    ziel = Path(sys.argv[1]) if eigenes_ziel else WURZEL / "docs/grafik/skizzen"
    texte = ui_texte()
    gesehen = set()
    anzahl = 0
    liste = []
    for ab in ABSCHNITTE:
        daten = json.loads((DATEN / f"{ab}.json").read_text(encoding="utf-8"))
        layout = yaml.safe_load((LAYOUT / f"{ab}.yaml").read_text(encoding="utf-8")) or {}
        for raum in daten["raeume"]:
            if raum["id"] in gesehen:
                continue
            gesehen.add(raum["id"])
            (ziel / ab).mkdir(parents=True, exist_ok=True)
            zeichne(raum, texte, layout).save(ziel / ab / f"{raum['id']}.png", optimize=True)
            anzahl += 1
            liste.append((ab, raum["id"], raum["name_key"]))
    if not eigenes_ziel:
        verweise_eintragen(liste)
    print(f"{anzahl} Skizzen → {ziel}")


if __name__ == "__main__":
    main()
