#!/usr/bin/env python3

"""Lebendige Hintergründe und Effekte (P16): Bildbögen auf Magenta zu Sprite-Streifen fürs Spiel.

Je Eintrag in tools/ambiente.yaml (ID → Quelle, Ziel, Größe, Raum) entsteht
game/grafik/ambiente/<ziel>.png: alle Bilder gleich groß nebeneinander, freigestellt, auf die Größe im
Spiel verkleinert (k-Centroid wie tools/pixelieren.py) und auf die Farben des Raums gebracht (Palette
des Raum-Hintergrunds plus Endesga 32 für Farben, die der Raum nicht hat).

     python3 tools/ambiente.py                 # alle Einträge
     python3 tools/ambiente.py W1-B61 W1-B70   # nur diese
     python3 tools/ambiente.py --vorschau ORDNER W1-B61   # dazu vergrößerte Kontrollbilder
     python3 tools/ambiente.py --hg-zusatz ORDNER W2-B30  # Palette aus einem Raum, der noch nicht auf main ist

Felder je Eintrag:
  quelle     Bogen unter E:/Game Engine/Grafiken/assets (oder absoluter Pfad)
  ziel       Dateiname ohne .png
  raum       Hintergrund unter game/grafik/hintergruende (Palette), leer = nur Endesga 32
  raster     „SxZ“ (Spalten × Zeilen gleich großer Zellen) oder leer = Bilder an den Lücken trennen
  anker      Ausrichtung bei getrennten Bildern: unten (Mitte unten, Standard), unten_links, mitte;
             „zelle“ = gleiche Stelle in jeder Rasterzelle (Bewegung über das Blatt bleibt erhalten)
  hoehe      Höhe des Streifens im Spiel (Pixel); oder breite
  bilder     Auswahl und Reihenfolge der Bilder (1-basiert), z. B. [1, 2, 3, 5]
  toleranz   Abstand zur Hintergrundfarbe, ab dem ein Pixel zählt (Standard 60)
  magenta    ab wie viel „Magenta-Stich“ (min(R, B) − G) ein Pixel Hintergrund ist (Standard 90)
  oben, unten  so viele Zeilen (Quellpixel) je Bild oben/unten abschneiden (Fackelhalter, Pfahl …)
  spiegeln   true: nach links drehen
  nur_raum   true: nur die Farben des Raums, ohne Endesga 32 (Nachträume, damit Feuer nicht herausleuchtet)
  ausschnitt [x0, y0, x1, y1] nur diesen Teil des Bogens nehmen (eine Reihe, ohne Geisterköpfe …)
  radieren   Liste [x0, y0, x1, y1] im Bogen, die nicht zählen (Baumkante, Wasserlinie)
  farben_weg Liste [r, g, b, abstand]: Pixel dieser Farben fallen weg (Becher im Verwandlungs-Effekt)
  rosa       ab welchem Magenta-Stich ein verkleinerter Pixel als Rest wegfällt (Standard 30; 999 = aus,
             für rosa Wimpel, Pollen, lila Tintenfisch)
  art        vordergrund: statt eines Bogens ein Ausschnitt des Raums (raum, ausschnitt) ohne blaue
             Pixel, der im Layout vor Booten und Schiffen liegt
  ellipse    [mx, my, rx, ry] als Anteil des Bildes: nur was darin liegt, bleibt (Feuer im Ofenloch)
"""
import argparse
import sys
from pathlib import Path

import numpy as np
import yaml
from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parent))
from figur import ENDESGA, abschnitte, auf_palette, glaetten, k_centroid, F  # noqa: E402
from pixelieren import palette_finden  # noqa: E402

WURZEL = Path(__file__).resolve().parent.parent
ASSETS = Path("E:/Game Engine/Grafiken/assets")
ZIEL = WURZEL / "game" / "grafik" / "ambiente"
HG = WURZEL / "game" / "grafik" / "hintergruende"
HG_ZUSATZ = None


def maske(rgb, tol, magenta):
    """Vordergrund: weit genug von der Randfarbe weg und ohne starken Magenta-Stich."""
    rand = np.concatenate([rgb[0], rgb[-1], rgb[:, 0], rgb[:, -1]]).astype(np.float32)
    bg = np.median(rand, 0)
    f = rgb.astype(np.float32)
    weit = np.sqrt(((f - bg) ** 2).sum(-1)) > tol
    stich = np.minimum(f[..., 0], f[..., 2]) - f[..., 1]
    return weit & (stich < magenta)


def rahmen_getrennt(m, min_luecke):
    """Bilder an den Lücken trennen: Zeilenblöcke, darin Spalten; Krümel unter 1 Prozent fallen weg."""
    h, w = m.shape
    rahmen = []
    for y0, y1 in abschnitte(m.sum(1) > 0, min_luecke):
        reihe = m[y0:y1]
        for x0, x1 in abschnitte(reihe.sum(0) > 0, min_luecke):
            teil = reihe[:, x0:x1]
            ys = np.where(teil.any(1))[0]
            rahmen.append([x0, y0 + ys[0], x1, y0 + ys[-1] + 1, int(teil.sum())])
    groesste = max(r[4] for r in rahmen)
    return [r[:4] for r in rahmen if r[4] > groesste * 0.01]


def bilder_schneiden(rgb, m, e):
    """Liefert je Bild (Ausschnitt RGB, Maske) in gemeinsamer Größe."""
    h, w = m.shape
    oben, unten = int(e.get("oben", 0)), int(e.get("unten", 0))
    if e.get("raster"):
        sp, ze = (int(v) for v in str(e["raster"]).split("x"))
        cw, ch = w / sp, h / ze
        zellen = [(round(c * cw), round(r * ch), round((c + 1) * cw), round((r + 1) * ch)) for r in range(ze) for c in range(sp)]
        if e.get("anker", "zelle") == "zelle":
            # gleiche Stelle in jeder Zelle: Vereinigung aller Inhalte relativ zur Zelle
            bx0, by0, bx1, by1 = 10 ** 9, 10 ** 9, 0, 0
            for x0, y0, x1, y1 in zellen:
                t = m[y0:y1, x0:x1]
                if t.any():
                    ys, xs = np.where(t)
                    bx0, by0 = min(bx0, xs.min()), min(by0, ys.min())
                    bx1, by1 = max(bx1, xs.max() + 1), max(by1, ys.max() + 1)
            by0 += oben; by1 -= unten
            return [(rgb[y0 + by0:y0 + by1, x0 + bx0:x0 + bx1], m[y0 + by0:y0 + by1, x0 + bx0:x0 + bx1]) for x0, y0, x1, y1 in zellen]
        rahmen = []
        for x0, y0, x1, y1 in zellen:
            t = m[y0:y1, x0:x1]
            if not t.any():
                rahmen.append(None); continue
            ys, xs = np.where(t)
            rahmen.append([x0 + xs.min(), y0 + ys.min(), x0 + xs.max() + 1, y0 + ys.max() + 1])
    else:
        rahmen = rahmen_getrennt(m, int(e.get("luecke", max(6, w // 200))))
    for r in rahmen:
        if r:
            r[1] += oben; r[3] -= unten
    da = [r for r in rahmen if r]
    bw = max(r[2] - r[0] for r in da); bh = max(r[3] - r[1] for r in da)
    anker = e.get("anker", "unten")
    teile = []
    for r in rahmen:
        tr = np.zeros((bh, bw, 3), np.uint8); tm = np.zeros((bh, bw), bool)
        if r:
            x0, y0, x1, y1 = r
            rw, rh = x1 - x0, y1 - y0
            dx = 0 if anker == "unten_links" else (bw - rw) // 2
            dy = (bh - rh) // 2 if anker == "mitte" else bh - rh
            tr[dy:dy + rh, dx:dx + rw] = rgb[y0:y1, x0:x1]
            tm[dy:dy + rh, dx:dx + rw] = m[y0:y1, x0:x1]
        teile.append((tr, tm))
    return teile


def raum_palette(name, nur_raum=False):
    endesga = np.array([[int(h[i:i + 2], 16) for i in (0, 2, 4)] for h in ENDESGA], np.uint8)
    if not name:
        return endesga
    p = Path(name) if Path(name).is_absolute() else HG / name
    if not p.exists() and HG_ZUSATZ and (HG_ZUSATZ / name).exists():
        p = HG_ZUSATZ / name   # Raum noch nicht auf main (--hg-zusatz)
    px = np.asarray(Image.open(p).convert("RGB")).reshape(-1, 3)
    farben = np.unique(px, axis=0)
    if len(farben) > 64:
        rng = np.random.default_rng(1)
        farben, _ = palette_finden(px[rng.choice(len(px), 40000, replace=False)].astype(np.float32), 40)
    return farben if nur_raum else np.unique(np.concatenate([farben, endesga]), axis=0)


def verkleinern(rgb, m, W, H):
    a = np.asarray(Image.fromarray(rgb).resize((W * F, H * F), Image.LANCZOS), dtype=np.float32)
    al = np.asarray(Image.fromarray(m.astype(np.uint8) * 255).resize((W * F, H * F), Image.BOX)) / 255.0
    deck = al.reshape(H, F, W, F).mean((1, 3))
    # Farben nur aus deckenden Teilpixeln, damit kein Magenta an den Rändern hineinblutet
    fl = a.copy()
    leer = al < 0.5
    if leer.any() and (~leer).any():
        from scipy import ndimage
        idx = ndimage.distance_transform_edt(leer, return_distances=False, return_indices=True)
        fl = a[idx[0], idx[1]]
    return k_centroid(fl, H, W), deck >= 0.5


def vordergrund(id_, e):
    """Ausschnitt des Hintergrunds ohne Wasser und Himmel (blaue Pixel durchsichtig): liegt im Layout
    als „vordergrund“ über Booten und Schiffen, damit sie hinter Steg, Pfählen und Sanduhr fahren."""
    p = Path(e["raum"]) if Path(e["raum"]).is_absolute() else HG / e["raum"]
    x0, y0, x1, y1 = e["ausschnitt"]
    rgb = np.asarray(Image.open(p).convert("RGB"))[y0:y1, x0:x1].astype(np.int32)
    r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
    blau = (b > r + 30) & (b >= g)
    rgba = np.dstack([rgb.astype(np.uint8), np.where(blau, 0, 255).astype(np.uint8)])
    ZIEL.mkdir(parents=True, exist_ok=True)
    Image.fromarray(rgba, "RGBA").save(ZIEL / f"{e['ziel']}.png")
    print(f"{id_}: {e['ziel']}.png  Vordergrund {x1 - x0}x{y1 - y0}")


def verarbeiten(id_, e, vorschau=None):
    if e.get("art") == "vordergrund":
        return vordergrund(id_, e)
    q = Path(e["quelle"]); q = q if q.is_absolute() else ASSETS / q
    rgb = np.asarray(Image.open(q).convert("RGB"))
    m = maske(rgb, float(e.get("toleranz", 60)), float(e.get("magenta", 90)))
    for x0, y0, x1, y1 in e.get("radieren", []):
        m[y0:y1, x0:x1] = False
    for r, g, b, d in e.get("farben_weg", []):
        m &= np.sqrt(((rgb.astype(np.float32) - [r, g, b]) ** 2).sum(-1)) > d
    if e.get("ausschnitt"):
        x0, y0, x1, y1 = e["ausschnitt"]
        rgb, m = rgb[y0:y1, x0:x1], m[y0:y1, x0:x1]
    teile = bilder_schneiden(rgb, m, e)
    if e.get("bilder"):
        teile = [teile[i - 1] for i in e["bilder"]]
    if e.get("ellipse"):
        mx, my, rx, ry = e["ellipse"]
        h, w = teile[0][1].shape
        yy, xx = np.mgrid[0:h, 0:w]
        drin = ((xx / w - mx) / rx) ** 2 + ((yy / h - my) / ry) ** 2 <= 1
        teile = [(tr, tm & drin) for tr, tm in teile]
    sh, sw = teile[0][1].shape
    if "hoehe" in e:
        H = int(e["hoehe"]); W = max(1, round(sw * H / sh))
    else:
        W = int(e["breite"]); H = max(1, round(sh * W / sw))
    pal = raum_palette(e.get("raum", ""), e.get("nur_raum", False))
    bilder = []
    for tr, tm in teile:
        klein, deck = verkleinern(tr, tm, W, H)
        # Rosa Reste (mit dem Magenta gemischte Funken, Dampf, Kanten) fallen weg
        k = klein.astype(np.int32)
        deck &= ~((np.minimum(k[..., 0], k[..., 2]) - k[..., 1] > float(e.get("rosa", 30))) & (k[..., 0] > 100) & (k[..., 2] > 80))
        farbig = auf_palette(klein, pal)
        rgba = np.dstack([farbig, deck.astype(np.uint8) * 255])
        rgba = glaetten(rgba, 1)
        rgba[rgba[..., 3] == 0] = 0
        if e.get("spiegeln"):
            rgba = rgba[:, ::-1]
        bilder.append(rgba)
    streifen = np.concatenate(bilder, 1)
    ZIEL.mkdir(parents=True, exist_ok=True)
    Image.fromarray(streifen, "RGBA").save(ZIEL / f"{e['ziel']}.png")
    print(f"{id_}: {e['ziel']}.png  {len(bilder)} Bilder zu {W}x{H}")
    if vorschau:
        kontrolle(streifen, len(bilder), Path(vorschau) / f"{id_}.png")
    return W, H, len(bilder)


def kontrolle(streifen, n, pfad, s=6):
    """Vergrößert auf Karo (Magenta-Reste und Halos fallen auf) und auf Schwarz."""
    h, w = streifen.shape[:2]
    karo = ((np.add.outer(np.arange(h * s) // 8, np.arange(w * s) // 8) % 2) * 40 + 180).astype(np.uint8)
    gross = np.asarray(Image.fromarray(streifen).resize((w * s, h * s), Image.NEAREST)).astype(np.float32)
    a = gross[..., 3:4] / 255.0
    oben = gross[..., :3] * a + np.dstack([karo] * 3) * (1 - a)
    unten = gross[..., :3] * a + 20 * (1 - a)
    bild = np.concatenate([oben, np.full((4, w * s, 3), 255.0), unten]).astype(np.uint8)
    for i in range(1, n):
        bild[:, i * w * s // n] = [0, 255, 255]
    pfad.parent.mkdir(parents=True, exist_ok=True)
    Image.fromarray(bild).save(pfad)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("ids", nargs="*")
    ap.add_argument("--vorschau")
    ap.add_argument("--hg-zusatz", help="weiterer Ordner mit Hintergründen (Räume, die noch nicht auf main sind)")
    ap.add_argument("--liste", default=str(Path(__file__).resolve().parent / "ambiente.yaml"))
    arg = ap.parse_args()
    global HG_ZUSATZ
    HG_ZUSATZ = Path(arg.hg_zusatz) if arg.hg_zusatz else None
    liste = yaml.safe_load(Path(arg.liste).read_text(encoding="utf-8"))
    for id_, e in liste.items():
        if arg.ids and id_ not in arg.ids:
            continue
        verarbeiten(id_, e, arg.vorschau)


if __name__ == "__main__":
    main()
