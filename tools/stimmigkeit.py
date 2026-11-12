#!/usr/bin/env python3
"""Stimmigkeit der Hintergründe messen: passen die Räume farblich zusammen?

Misst für jeden echten Hintergrund (Eintrag „hintergrund:“ in tools/layout/*.yaml) in OKLab:

  Helligkeit  mittleres L (0 = schwarz, 1 = weiß)
  Kontrast    Abstand der hellsten und dunkelsten 5 Prozent (L)
  Wärme       mittleres b (positiv = gelb/warm, negativ = blau/kalt)
  Rot         mittleres a (positiv = rötlich, negativ = grünlich)
  Sättigung   mittlere Buntheit (Chroma)

und meldet Ausreißer gegenüber dem Stilanker (Dachboden, w0_bg_dachboden_v03) und dem Median
aller Räume. Ausreißer sind Hinweise, keine Fehler: ein Kerker darf dunkler sein als die Taverne.
Für solche gewollten Abweichungen steht im Raum ein „stimmung:“-Eintrag (z. B. „dunkel“, „kalt“,
„nacht“), dann prüft das Werkzeug diese Größe nicht.

Dazu kommt ein Vergleichsbogen: alle Räume nebeneinander, Max (und Pixel) im richtigen Maßstab am
Startpunkt, darunter ein Farbstreifen mit den häufigsten Farben. Daran sieht man auf einen Blick,
ob ein Raum heller, bunter oder kälter ist als die anderen.

    python3 tools/stimmigkeit.py                       # Tabelle und Ausreißer
    python3 tools/stimmigkeit.py --bogen bogen.png     # zusätzlich der Vergleichsbogen
    python3 tools/stimmigkeit.py --kandidat neu.png    # ein neues Bild gegen den Bestand prüfen

Ein Kandidat wird wie in pixelieren.py auf 640×360 gebracht, aber nicht auf 32 Farben reduziert.
Das Werkzeug läuft nicht in der CI; es ist ein Hilfsmittel beim Einbauen neuer Grafik.
"""
import argparse
import json
import sys
from pathlib import Path

import numpy as np
import yaml
from PIL import Image, ImageDraw

sys.path.insert(0, str(Path(__file__).resolve().parent))
from pixelieren import oklab  # noqa: E402
from aufloesung import BREITE, HOEHE  # noqa: E402

WURZEL = Path(__file__).resolve().parent.parent
GAME = WURZEL / "game"
LAYOUT = WURZEL / "tools" / "layout"
ANKER = "dachboden"

# Grenzen, ab denen eine Abweichung gemeldet wird (OKLab-Einheiten, Erfahrungswerte aus dem Prolog).
GRENZEN = {"helligkeit": 0.07, "kontrast": 0.12, "waerme": 0.025, "rot": 0.02, "saettigung": 0.03}
NAMEN = {"helligkeit": "Helligkeit", "kontrast": "Kontrast", "waerme": "Wärme", "rot": "Rot",
         "saettigung": "Sättigung"}
# Welche Größe ein stimmung:-Eintrag freistellt.
FREI = {"dunkel": {"helligkeit", "kontrast"}, "hell": {"helligkeit", "kontrast"},
        "nacht": {"helligkeit", "kontrast", "waerme", "saettigung"}, "kalt": {"waerme", "rot"},
        "warm": {"waerme", "rot"}, "bunt": {"saettigung"}, "blass": {"saettigung"}}


def res_pfad(res):
    return GAME / res.replace("res://", "")


def raeume():
    """Alle Räume mit echtem Hintergrund: Name, Bildpfad, Layout-Eintrag."""
    for datei in sorted(LAYOUT.glob("*.yaml")):
        daten = yaml.safe_load(datei.read_text(encoding="utf-8")) or {}
        for name, raum in daten.items():
            if name.startswith("_") or not isinstance(raum, dict):
                continue
            bg = raum.get("hintergrund")
            if bg and res_pfad(bg).exists():
                yield name, res_pfad(bg), raum


def messen(rgb):
    lab = oklab(rgb.reshape(-1, 3).astype(np.float64))
    L, a, b = lab[:, 0], lab[:, 1], lab[:, 2]
    p5, p95 = np.percentile(L, [5, 95])
    return {"helligkeit": float(L.mean()), "kontrast": float(p95 - p5), "waerme": float(b.mean()),
            "rot": float(a.mean()), "saettigung": float(np.hypot(a, b).mean())}


def bild_laden(pfad):
    im = Image.open(pfad).convert("RGB")
    if im.height != HOEHE:   # fertige Hintergründe (auch Breitwand 1280×360) unverändert
        w, h = im.size
        if w / h > 16 / 9:
            nw = round(h * 16 / 9); im = im.crop(((w - nw) // 2, 0, (w - nw) // 2 + nw, h))
        else:
            nh = round(w * 9 / 16); im = im.crop((0, (h - nh) // 2, w, (h - nh) // 2 + nh))
        im = im.resize((BREITE, HOEHE), Image.LANCZOS)
    return im


def ausreisser(werte, bezuege, frei=()):
    """Größen, die von allen Bezügen um mehr als die Grenze abweichen (Abstand zum ersten Bezug)."""
    meld = []
    for k, g in GRENZEN.items():
        if k in frei or not all(abs(werte[k] - b[k]) > g for b in bezuege):
            continue
        d = werte[k] - bezuege[0][k]
        meld.append(f"{NAMEN[k]} {'+' if d > 0 else '−'}{abs(d):.3f}")
    return meld


def figur_bild(fid, anim="idle"):
    png = GAME / "grafik" / "figuren" / f"{fid}.png"
    js = GAME / "daten" / "figuren" / f"{fid}.json"
    if not png.exists() or not js.exists():
        return None
    d = json.loads(js.read_text(encoding="utf-8"))
    w, h = d["bild"]
    von = d["animationen"].get(anim, {"von": 0})["von"]
    return Image.open(png).convert("RGBA").crop((von * w, 0, von * w + w, h))


def massstab(raum, y):
    """Figurengröße an der Stelle y wie in cq_raum.gd: 1.0 unten im Laufbereich, „tiefe“ oben."""
    oben = raum.get("tiefe")
    ys = [p[1] for p in raum.get("laufbereich", [])]
    if not oben or not ys or max(ys) == min(ys):
        return 1.0
    t = (y - min(ys)) / (max(ys) - min(ys))
    return float(oben + (1.0 - oben) * min(max(t, 0.0), 1.0))


def figur_setzen(bild, fig, fuss, s, links=False):
    if fig is None:
        return
    f = fig.resize((max(1, round(fig.width * s)), max(1, round(fig.height * s))), Image.NEAREST)
    if links:
        f = f.transpose(Image.FLIP_LEFT_RIGHT)
    bild.alpha_composite(f, (int(fuss[0] - f.width / 2), int(fuss[1] - f.height)))


def haeufigste(rgb, n=12):
    farben, zahl = np.unique(rgb.reshape(-1, 3), axis=0, return_counts=True)
    reihe = farben[np.argsort(-zahl)[:n]]
    return sorted(map(tuple, reihe), key=lambda c: oklab(np.array(c, float))[0])


def bogen(eintraege, ziel):
    max_bild, pixel_bild = figur_bild("max"), figur_bild("pixel")
    spalten = 2 if len(eintraege) > 1 else 1
    zeilen = (len(eintraege) + spalten - 1) // spalten
    kopf, streifen, rand = 14, 10, 6
    zw, zh = BREITE, HOEHE + kopf + streifen
    blatt = Image.new("RGBA", (spalten * zw + (spalten + 1) * rand, zeilen * zh + (zeilen + 1) * rand),
                      (24, 20, 28, 255))
    zeichnen = ImageDraw.Draw(blatt)
    for i, (name, im, raum, werte, meld) in enumerate(eintraege):
        im = im.crop((0, 0, BREITE, HOEHE)) if im.width > BREITE else im   # Bogen zeigt die linke Hälfte
        x0 = rand + (i % spalten) * (zw + rand)
        y0 = rand + (i // spalten) * (zh + rand)
        bild = im.convert("RGBA")
        start = (raum.get("marker") or {}).get("start")
        if start:
            figur_setzen(bild, max_bild, start, massstab(raum, start[1]))
            p = raum.get("pixel") or [start[0] + 60, start[1]]
            figur_setzen(bild, pixel_bild, p, massstab(raum, p[1]), links=True)
        blatt.alpha_composite(bild, (x0, y0 + kopf))
        text = (f"{name}  L {werte['helligkeit']:.2f}  K {werte['kontrast']:.2f}  "
                f"W {werte['waerme']:+.3f}  S {werte['saettigung']:.3f}")
        farbe = (255, 170, 120) if meld else (220, 220, 210)
        zeichnen.text((x0 + 2, y0 + 2), text + ("  ! " + ", ".join(meld) if meld else ""), fill=farbe)
        fs = haeufigste(np.asarray(im))
        bw = BREITE / len(fs)
        for j, c in enumerate(fs):
            zeichnen.rectangle((x0 + j * bw, y0 + kopf + HOEHE, x0 + (j + 1) * bw - 1,
                                y0 + kopf + HOEHE + streifen - 1), fill=c)
    blatt = blatt.resize((blatt.width * 2, blatt.height * 2), Image.NEAREST)
    blatt.convert("RGB").save(ziel)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--bogen", help="Vergleichsbogen als PNG schreiben")
    ap.add_argument("--kandidat", action="append", default=[],
                    help="zusätzliches Bild (z. B. neuer Gemini-Entwurf) mitmessen")
    ap.add_argument("--anker", default=ANKER, help=f"Raum, an dem gemessen wird (Standard {ANKER})")
    args = ap.parse_args()

    eintraege = []
    for name, pfad, raum in raeume():
        im = bild_laden(pfad)
        eintraege.append([name, im, raum, messen(np.asarray(im)), []])
    for k in args.kandidat:
        im = bild_laden(k)
        eintraege.append([f"neu:{Path(k).stem}", im, {}, messen(np.asarray(im)), []])
    if not eintraege:
        print("Keine echten Hintergründe gefunden."); return 0

    anker = next((e[3] for e in eintraege if e[0] == args.anker), eintraege[0][3])
    median = {k: float(np.median([e[3][k] for e in eintraege])) for k in GRENZEN}

    print(f"{'Raum':28} {'Hell':>6} {'Kontr':>6} {'Wärme':>7} {'Rot':>7} {'Sätt':>6}")
    for e in eintraege:
        w = e[3]
        print(f"{e[0]:28} {w['helligkeit']:6.3f} {w['kontrast']:6.3f} {w['waerme']:+7.3f} "
              f"{w['rot']:+7.3f} {w['saettigung']:6.3f}")
    print(f"{'(Median)':28} {median['helligkeit']:6.3f} {median['kontrast']:6.3f} "
          f"{median['waerme']:+7.3f} {median['rot']:+7.3f} {median['saettigung']:6.3f}")

    print(f"\nAbweichungen gegenüber dem Anker ({args.anker}) und dem Median:")
    gefunden = False
    for e in eintraege:
        if e[0] == args.anker:
            continue
        frei = set()
        for s in str(e[2].get("stimmung", "")).split():
            frei |= FREI.get(s, set())
        m = ausreisser(e[3], [anker, median] if len(eintraege) > 2 else [anker], frei)
        e[4] = m
        if m:
            gefunden = True
            print(f"  {e[0]}: " + ", ".join(m))
    if not gefunden:
        print("  keine")

    if args.bogen:
        bogen(eintraege, args.bogen)
        print(f"\nVergleichsbogen: {args.bogen}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
