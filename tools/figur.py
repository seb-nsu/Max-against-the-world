#!/usr/bin/env python3
"""Figuren aus Konzeptbildern (Gemini) zu Sprites umrechnen und per Code bewegen.

Vorgehen nach Codixel (github.com/mankidev/codixel, MIT): Figur freistellen, auf Zielgröße und Palette
bringen, in Knochen zerlegen, Posen per Code. Eigene Umsetzung, damit nichts Fremdes mitläuft.

1. Sprite aus einem Konzeptblatt:
     python3 tools/figur.py sprite blatt.png max.png --hoehe 189 [--ansicht 1] [--spiegeln]
         [--ausschnitt X,Y,B,H] [--palette endesga|datei.hex|keine] [--toleranz 40]
   --ansicht N nimmt die N-te Figur von links (Blätter mit Seiten-, Vorder- und Rückansicht),
   --spiegeln dreht die Figur nach rechts, wenn das Konzept nach links schaut.
   Ergebnis: transparentes PNG, genau --hoehe Pixel hoch, Farben aus Endesga 32 (Standard).

2. Bewegungen aus einem Rig:
     python3 tools/figur.py animieren max.png rig.json ausgabe_ordner [--vorschau 4]
   rig.json beschreibt Knochen und Bewegungen (Aufbau siehe RIG_BEISPIEL unten). Je Bewegung entstehen
   ein Sprite-Sheet (Bilder nebeneinander, gleiche Größe, Fußpunkt unten Mitte) und mit --vorschau ein
   vergrößertes GIF und ein Kontrollblatt zum Ansehen.

3. Kontrollblatt für Gelenke:
     python3 tools/figur.py raster max.png raster.png [--schritt 8] [--rig rig.json]
   vergrößert das Sprite mit nummerierten Linien, damit sich Gelenke ablesen lassen; mit --rig werden
   die Knochen eingezeichnet und die Pixel nach Knochen eingefärbt.
"""
import argparse
import json
import math
import sys
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw

sys.path.insert(0, str(Path(__file__).resolve().parent))
from pixelieren import GEWICHT, oklab, palette_finden, palette_lesen  # noqa: E402

ENDESGA = ["be4a2f", "d77643", "ead4aa", "e4a672", "b86f50", "733e39", "3e2731", "a22633", "e43b44",
           "f77622", "feae34", "fee761", "63c74d", "3e8948", "265c42", "193c3e", "124e89", "0099db",
           "2ce8f5", "ffffff", "c0cbdc", "8b9bb4", "5a6988", "3a4466", "262b44", "181425", "ff0044",
           "68386c", "b55088", "f6757a", "e8b796", "c28569"]
DETAIL = 0.14   # Helligkeitsabstand in OKLab, ab dem ein Pixel als Detail zählt
F = 4   # wie pixelieren.py: je Zielpixel ein 4×4-Block

RIG_BEISPIEL = {
    "knochen": [
        # name, eltern, Gelenk x,y, Spitze x,y (Sprite-Pixel), z (größer = weiter vorn)
        {"name": "koerper", "eltern": None, "gelenk": [40, 110], "spitze": [40, 50], "z": 1},
        {"name": "kopf", "eltern": "koerper", "gelenk": [42, 50], "spitze": [44, 5], "z": 2},
        {"name": "bein_hinten", "eltern": "koerper", "gelenk": [38, 110], "spitze": [36, 186], "z": 0},
        {"name": "bein_vorn", "eltern": "koerper", "gelenk": [44, 110], "spitze": [46, 186], "z": 3},
    ],
    "zuordnung": {"kopf": [[20, 0], [70, 0], [70, 50], [20, 50]]},   # Vielecke, die einem Knochen gehören
    "bewegungen": {
        "idle": {"bilder": 4, "ms": 250, "posen": [{}, {"koerper": {"dy": 1}}, {"koerper": {"dy": 1}}, {}]},
        "walk": {"bilder": 2, "ms": 120, "posen": [{"bein_vorn": 0.3, "bein_hinten": -0.3},
                                                    {"bein_vorn": -0.3, "bein_hinten": 0.3}]},
    },
}


# ---------------------------------------------------------------- Sprite

def palette_holen(name):
    if name == "keine":
        return None
    if name == "endesga":
        return np.array([[int(h[i:i + 2], 16) for i in (0, 2, 4)] for h in ENDESGA], dtype=np.uint8)
    return palette_lesen(name)


def hintergrund_maske(rgb, tol):
    """Maske des einfarbigen Hintergrunds: von den Rändern her gefüllt, Lücken innen bleiben Figur."""
    h, w = rgb.shape[:2]
    rand = np.concatenate([rgb[0], rgb[-1], rgb[:, 0], rgb[:, -1]]).astype(np.float32)
    bg = np.median(rand, 0)
    nah = np.sqrt(((rgb.astype(np.float32) - bg) ** 2).sum(-1)) <= tol
    k = np.zeros((h + 2, w + 2), np.uint8); k[1:-1, 1:-1] = nah * 255; k[0, :] = k[-1, :] = k[:, 0] = k[:, -1] = 255
    bild = Image.fromarray(k, "L").copy()
    ImageDraw.floodfill(bild, (0, 0), 128, thresh=0)
    return (np.asarray(bild)[1:-1, 1:-1] == 128)


def abschnitte(belegt, min_luecke):
    """Zusammenhängende Bereiche entlang einer Achse (belegt: 1D bool), getrennt durch Lücken ≥ min_luecke."""
    teile, start, leer = [], None, 0
    for i, b in enumerate(belegt):
        if b:
            if start is None:
                start = i
            leer = 0; ende = i
        elif start is not None:
            leer += 1
            if leer >= min_luecke:
                teile.append((start, ende + 1)); start = None
    if start is not None:
        teile.append((start, ende + 1))
    return teile


def alle_figuren(maske):
    """Rahmen aller Figuren von links nach rechts: zuerst die höchste Zeile mit Figuren nehmen (Blätter haben
    unten oft eine Reihe Gesichter), dann Spalten nach Lücken trennen, je Spalte den höchsten Zeilenblock
    (Beschriftungen unter der Figur fallen so weg)."""
    h, w = maske.shape
    reihen = abschnitte(maske.sum(1) > 0, max(4, h // 60))
    r0, r1 = max(reihen, key=lambda z: z[1] - z[0])
    reihe = np.zeros_like(maske); reihe[r0:r1] = maske[r0:r1]
    spalten = abschnitte(reihe.sum(0) > 0, max(4, w // 100))
    spalten = [s for s in spalten if reihe[:, s[0]:s[1]].sum() > reihe.sum() * 0.02]
    rahmen = []
    for x0, x1 in spalten:
        zeilen = abschnitte(reihe[:, x0:x1].sum(1) > 0, max(4, h // 60))
        y0, y1 = max(zeilen, key=lambda z: z[1] - z[0])
        xs = np.where(reihe[y0:y1, x0:x1].any(0))[0]
        rahmen.append((x0 + xs[0], y0, x0 + xs[-1] + 1, y1))
    return rahmen


def k_centroid(a, H, W):
    """a: (H*F, W*F, 3) -> (H, W, 3), je Block die vorherrschende von zwei Farben (wie pixelieren.py)."""
    b = a.reshape(H, F, W, F, 3).transpose(0, 2, 1, 3, 4).reshape(H, W, F * F, 3)
    hell = b.mean(-1)
    c1 = np.take_along_axis(b, hell.argmin(-1)[..., None, None], 2)[:, :, 0]
    c2 = np.take_along_axis(b, hell.argmax(-1)[..., None, None], 2)[:, :, 0]
    for _ in range(6):
        d1 = ((b - c1[:, :, None]) ** 2).sum(-1); d2 = ((b - c2[:, :, None]) ** 2).sum(-1)
        m = (d1 <= d2)[..., None]
        n1 = m.sum(2); n2 = (~m).sum(2)
        c1 = np.where(n1 > 0, (b * m).sum(2) / np.maximum(n1, 1), c1)
        c2 = np.where(n2 > 0, (b * ~m).sum(2) / np.maximum(n2, 1), c2)
    return np.where(n1 >= n2, c1, c2).clip(0, 255).astype(np.uint8)


def auf_palette(rgb, pal):
    lab = oklab(rgb.reshape(-1, 3).astype(np.float32)) * GEWICHT
    ziel = oklab(pal.astype(np.float32)) * GEWICHT
    z = ((lab[:, None, :] - ziel[None]) ** 2).sum(-1).argmin(1)
    return pal[z].reshape(rgb.shape)


def streupixel(rgba):
    """Einzelne Pixel, deren vier Nachbarn alle dieselbe andere Farbe haben, angleichen (Augen bleiben:
    ihre Nachbarn sind selten alle gleich)."""
    a = rgba.copy()
    schluessel = (a[..., 0].astype(np.int64) << 24) | (a[..., 1].astype(np.int64) << 16) | (a[..., 2].astype(np.int64) << 8) | a[..., 3]
    for _ in range(2):
        p = np.pad(schluessel, 1, mode="edge")
        o, u, l, r = p[:-2, 1:-1], p[2:, 1:-1], p[1:-1, :-2], p[1:-1, 2:]
        s = (o == u) & (u == l) & (l == r) & (o != schluessel)
        pa = np.pad(a, ((1, 1), (1, 1), (0, 0)), mode="edge")[:-2, 1:-1]
        a[s] = pa[s]
        schluessel[s] = o[s]
    return a


def glaetten(rgba, runden=2):
    """Flecken glätten: Ein Pixel, dessen Farbe in seiner 3×3-Umgebung nur einmal vorkommt, übernimmt die
    Farbe, die dort mindestens fünfmal vorkommt (Jeans-Struktur und Rauschen aus dem Konzeptbild weg,
    Augen und Kanten bleiben, weil um sie herum keine Farbe so klar überwiegt)."""
    a = rgba.copy()
    h, w = a.shape[:2]
    for _ in range(runden):
        k = (a[..., 0].astype(np.int64) << 24) | (a[..., 1].astype(np.int64) << 16) | (a[..., 2].astype(np.int64) << 8) | a[..., 3]
        p = np.pad(k, 1, mode="edge")
        nb = np.stack([p[1 + dy:h + 1 + dy, 1 + dx:w + 1 + dx] for dy in (-1, 0, 1) for dx in (-1, 0, 1)])
        gleich_selbst = (nb == k).sum(0)
        best = np.zeros_like(k); best_n = np.zeros(k.shape, int)
        for i in range(9):
            n = (nb == nb[i]).sum(0)
            besser = n > best_n
            best[besser] = nb[i][besser]; best_n[besser] = n[besser]
        s = (gleich_selbst == 1) & (best_n >= 5) & (a[..., 3] > 0) & ((best & 0xff) > 0)
        pa = np.pad(a, ((1, 1), (1, 1), (0, 0)), mode="edge")
        for i in range(9):
            dy, dx = divmod(i, 3)
            t = s & (nb[i] == best)
            a[t] = pa[dy:h + dy, dx:w + dx][t]
            s &= ~t
    return a


def kontur(rgba, farbe):
    """Durchgehende Kontur von innen: jeder deckende Pixel am Rand der Silhouette bekommt die Konturfarbe;
    die Größe bleibt gleich."""
    a = rgba.copy()
    d = a[..., 3] > 0
    p = np.pad(d, 1)
    rand = d & ~(p[:-2, 1:-1] & p[2:, 1:-1] & p[1:-1, :-2] & p[1:-1, 2:])
    a[rand, :3] = [int(farbe.lstrip("#")[i:i + 2], 16) for i in (0, 2, 4)]
    return a


def verkleinern(rgb, bg, rahmen, H):
    """Eine Figur aus dem Blatt auf H Pixel Höhe: k-Centroid für die Farben, Deckung ab halber Fläche."""
    x0, y0, x1, y1 = rahmen
    teil, maske = rgb[y0:y1, x0:x1], (~bg[y0:y1, x0:x1]).astype(np.uint8) * 255
    W = max(1, round((x1 - x0) * H / (y1 - y0)))
    a = np.asarray(Image.fromarray(teil).resize((W * F, H * F), Image.LANCZOS), dtype=np.float32)
    m = np.asarray(Image.fromarray(maske).resize((W * F, H * F), Image.BOX)) / 255.0
    return k_centroid(a, H, W), m.reshape(H, F, W, F).mean((1, 3)) >= 0.5


def sprite(quelle, hoehe, ansicht=1, spiegeln=False, ausschnitt=None, palette="endesga", tol=40,
           konturfarbe=None, glatt=True, farben=0):
    rgba = np.asarray(Image.open(quelle).convert("RGBA"))
    if ausschnitt:
        x, y, b, h = ausschnitt
        rgba = rgba[y:y + h, x:x + b]
    rgb = np.ascontiguousarray(rgba[..., :3])
    bg = hintergrund_maske(rgb, tol) | (rgba[..., 3] < 128)
    rahmen = alle_figuren(~bg)
    if not 1 <= ansicht <= len(rahmen):
        sys.exit(f"Ansicht {ansicht} gibt es nicht, gefunden: {len(rahmen)} Figuren")
    H = hoehe
    klein, alpha = verkleinern(rgb, bg, rahmen[ansicht - 1], H)
    W = klein.shape[1]
    if farben:
        # Erst wenige eigene Farben, gemeinsam für alle Ansichten des Blatts (damit Seite, Vorder- und
        # Rückansicht dieselben Farben bekommen); Stoffstruktur verschwindet dabei. Feine Details (Augen,
        # Linien) bleiben: wo das Original deutlich heller oder dunkler ist als seine Gruppe, gilt das Original.
        alle = [verkleinern(rgb, bg, r, H) for r in rahmen]
        probe = np.concatenate([k.reshape(-1, 3)[m.ravel()] for k, m in alle]).astype(np.float32)
        eigen, _ = palette_finden(probe, farben)
        sel = alpha.ravel()
        px = klein.reshape(-1, 3).astype(np.float32)[sel]
        lab, ziel = oklab(px) * GEWICHT, oklab(eigen.astype(np.float32)) * GEWICHT
        neu = eigen[((lab[:, None, :] - ziel[None]) ** 2).sum(-1).argmin(1)].astype(np.float32)
        dl = np.abs(oklab(px)[:, 0] - oklab(neu)[:, 0])
        flach = klein.reshape(-1, 3).copy()
        flach[sel] = np.where((dl > DETAIL)[:, None], px, neu).astype(np.uint8)
        klein = flach.reshape(klein.shape)
    pal = palette_holen(palette)
    if pal is not None:
        klein = auf_palette(klein, pal)
    out = np.zeros((H, W, 4), np.uint8)
    out[..., :3] = klein; out[..., 3] = alpha * 255
    out = streupixel(out)
    if glatt:
        out = glaetten(out)
    out[out[..., 3] == 0] = 0
    if konturfarbe:
        out = kontur(out, konturfarbe)
    if spiegeln:
        out = out[:, ::-1]
    return Image.fromarray(out, "RGBA")


# ---------------------------------------------------------------- Nacharbeit

def auflage_anwenden(rgba, pixel):
    """Einzelne Pixel setzen: Liste aus [x, y, "rrggbb"] (oder "" für durchsichtig). Für Details, die beim
    Verkleinern verloren gehen (Mundlinie, Lautsprecher-Leuchte), und für Auflagen wie den offenen Mund."""
    a = np.array(rgba, copy=True)
    for x, y, f in pixel:
        a[y, x] = [int(f[i:i + 2], 16) for i in (0, 2, 4)] + [255] if f else [0, 0, 0, 0]
    return a


# ---------------------------------------------------------------- Rig

def _abstand_strecke(px, py, a, b):
    ax, ay = a; bx, by = b
    dx, dy = bx - ax, by - ay
    l2 = dx * dx + dy * dy or 1.0
    t = np.clip(((px - ax) * dx + (py - ay) * dy) / l2, 0, 1)
    return np.hypot(px - (ax + t * dx), py - (ay + t * dy))


def _im_vieleck(px, py, poly):
    innen = np.zeros(px.shape, bool)
    n = len(poly)
    for i in range(n):
        x1, y1 = poly[i]; x2, y2 = poly[(i + 1) % n]
        kreuzt = ((y1 > py) != (y2 > py)) & (px < (x2 - x1) * (py - y1) / ((y2 - y1) or 1e-9) + x1)
        innen ^= kreuzt
    return innen


class Rig:
    def __init__(self, sprite_rgba, daten):
        self.bild = np.asarray(sprite_rgba.convert("RGBA"))
        self.knochen = daten["knochen"]
        self.index = {k["name"]: i for i, k in enumerate(self.knochen)}
        for k in self.knochen:
            if k["eltern"] is not None and self.index[k["eltern"]] >= self.index[k["name"]]:
                sys.exit(f"Knochen {k['name']}: Eltern müssen vorher stehen")
        h, w = self.bild.shape[:2]
        ys, xs = np.mgrid[0:h, 0:w]
        d = np.stack([_abstand_strecke(xs + 0.5, ys + 0.5, k["gelenk"], k["spitze"]) for k in self.knochen])
        besitz = d.argmin(0)
        for name, poly in daten.get("zuordnung", {}).items():
            besitz[_im_vieleck(xs + 0.5, ys + 0.5, poly)] = self.index[name]
        besitz[self.bild[..., 3] == 0] = -1
        self.besitz = besitz
        self.bewegungen = daten.get("bewegungen", {})
        self.auflagen = daten.get("auflagen", {})

    def _matrizen(self, pose):
        """Je Knochen eine 2×3-Matrix Sprite -> Bild (Drehung um das Gelenk, Verschiebung, Kette über Eltern)."""
        m = []
        for k in self.knochen:
            p = pose.get(k["name"], 0)
            if not isinstance(p, dict):
                p = {"a": p}
            a, dx, dy = p.get("a", 0.0), p.get("dx", 0), p.get("dy", 0)
            gx, gy = k["gelenk"]
            c, s = math.cos(a), math.sin(a)
            eigen = np.array([[c, -s, gx - c * gx + s * gy + dx], [s, c, gy - s * gx - c * gy + dy], [0, 0, 1]])
            if k["eltern"] is not None:
                eigen = m[self.index[k["eltern"]]] @ eigen
            m.append(eigen)
        return m

    def zeichnen(self, pose, rand=8):
        """Pose als neues Bild; das Bild wächst um rand Pixel je Seite, damit Arme und Beine Platz haben.
        pose["auflage"] nennt eine Auflage aus dem Rig (etwa offener Mund), die vorher aufs Sprite kommt."""
        quelle = self.bild
        if pose.get("auflage"):
            quelle = auflage_anwenden(self.bild, self.auflagen[pose["auflage"]])
        h, w = self.bild.shape[:2]
        H, W = h + 2 * rand, w + 2 * rand
        out = np.zeros((H, W, 4), np.uint8)
        ys, xs = np.mgrid[0:H, 0:W]
        ziel = np.stack([xs.ravel() - rand + 0.5, ys.ravel() - rand + 0.5, np.ones(H * W)])
        reihenfolge = sorted(range(len(self.knochen)), key=lambda i: self.knochen[i].get("z", 0))
        mats = self._matrizen(pose)
        for i in reihenfolge:
            inv = np.linalg.inv(mats[i])
            q = inv @ ziel
            sx = np.floor(q[0]).astype(int); sy = np.floor(q[1]).astype(int)
            ok = (sx >= 0) & (sx < w) & (sy >= 0) & (sy < h)
            treffer = np.zeros(H * W, bool)
            treffer[ok] = self.besitz[sy[ok], sx[ok]] == i
            flach = out.reshape(-1, 4)
            flach[treffer] = quelle[sy[treffer], sx[treffer]]
        return out

    def bewegung(self, name, rand=8):
        b = self.bewegungen[name]
        posen = b["posen"]
        return [self.zeichnen(posen[i % len(posen)], rand) for i in range(b.get("bilder", len(posen)))], b.get("ms", 150)

    def besitzbild(self):
        farben = np.array([[230, 25, 75], [60, 180, 75], [255, 225, 25], [0, 130, 200], [245, 130, 48],
                           [145, 30, 180], [70, 240, 240], [240, 50, 230], [210, 245, 60], [250, 190, 212],
                           [0, 128, 128], [170, 110, 40]], np.float32)
        out = self.bild.copy().astype(np.float32)
        s = self.besitz >= 0
        out[s, :3] = out[s, :3] * 0.4 + farben[self.besitz[s] % len(farben)] * 0.6
        return Image.fromarray(out.astype(np.uint8), "RGBA")


# ---------------------------------------------------------------- Ausgabe

def schachbrett(w, h, z=4):
    ys, xs = np.mgrid[0:h, 0:w]
    hell = ((xs // z + ys // z) % 2 == 0)
    a = np.where(hell[..., None], [222, 222, 222], [190, 190, 190]).astype(np.uint8)
    return Image.fromarray(a, "RGB")


def raster(sprite_rgba, skal=6, schritt=8, rig=None):
    bild = rig.besitzbild() if rig else sprite_rgba
    w, h = bild.size
    gross = bild.resize((w * skal, h * skal), Image.NEAREST)
    rand = 24
    out = Image.new("RGB", (w * skal + rand, h * skal + rand), (255, 255, 255))
    out.paste(schachbrett(w * skal, h * skal, skal * 2), (rand, rand))
    out.paste(gross, (rand, rand), gross)
    d = ImageDraw.Draw(out)
    for x in range(0, w + 1, schritt):
        d.line([(rand + x * skal, rand), (rand + x * skal, rand + h * skal)], fill=(255, 0, 0) if x % (schritt * 4) == 0 else (255, 150, 150))
        d.text((rand + x * skal + 1, 2), str(x), fill=(200, 0, 0))
    for y in range(0, h + 1, schritt):
        d.line([(rand, rand + y * skal), (rand + w * skal, rand + y * skal)], fill=(255, 0, 0) if y % (schritt * 4) == 0 else (255, 150, 150))
        d.text((1, rand + y * skal + 1), str(y), fill=(200, 0, 0))
    if rig:
        for k in rig.knochen:
            g = [rand + v * skal for v in k["gelenk"]]; s = [rand + v * skal for v in k["spitze"]]
            d.line([tuple(g), tuple(s)], fill=(0, 0, 0), width=3)
            d.ellipse([g[0] - 5, g[1] - 5, g[0] + 5, g[1] + 5], outline=(0, 0, 0), width=2)
            d.text((s[0] + 4, s[1]), k["name"], fill=(0, 0, 0))
    return out


def animieren(sprite_pfad, rig_pfad, ordner, vorschau=0):
    sp = Image.open(sprite_pfad)
    rig = Rig(sp, json.loads(Path(rig_pfad).read_text(encoding="utf-8")))
    ordner = Path(ordner); ordner.mkdir(parents=True, exist_ok=True)
    stamm = Path(sprite_pfad).stem
    for name in rig.bewegungen:
        bilder, ms = rig.bewegung(name)
        h, w = bilder[0].shape[:2]
        sheet = np.concatenate(bilder, axis=1)
        Image.fromarray(sheet, "RGBA").save(ordner / f"{stamm}_{name}.png")
        if vorschau:
            gif = []
            for b in bilder:
                g = schachbrett(w * vorschau, h * vorschau, vorschau * 2)
                gb = Image.fromarray(b, "RGBA").resize((w * vorschau, h * vorschau), Image.NEAREST)
                g.paste(gb, (0, 0), gb); gif.append(g)
            gif[0].save(ordner / f"{stamm}_{name}.gif", save_all=True, append_images=gif[1:], duration=ms, loop=0)
            blatt = schachbrett(w * len(bilder) * vorschau, h * vorschau, vorschau * 2)
            for i, g in enumerate(gif):
                blatt.paste(g, (i * w * vorschau, 0))
            blatt.save(ordner / f"{stamm}_{name}_blatt.png")
        print(ordner / f"{stamm}_{name}.png", len(bilder), "Bilder je", w, "×", h)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="befehl", required=True)
    s = sub.add_parser("sprite")
    s.add_argument("quelle"); s.add_argument("ziel")
    s.add_argument("--hoehe", type=int, required=True)
    s.add_argument("--ansicht", type=int, default=1)
    s.add_argument("--spiegeln", action="store_true")
    s.add_argument("--ausschnitt")
    s.add_argument("--palette", default="endesga")
    s.add_argument("--toleranz", type=float, default=40)
    s.add_argument("--kontur", help="Konturfarbe #rrggbb, etwa #262b44 für Max, #3a4466 für Pixel")
    s.add_argument("--nicht-glaetten", action="store_true")
    s.add_argument("--farben", type=int, default=12, help="vorher auf so viele eigene Farben bringen, 0 = aus")
    a = sub.add_parser("animieren")
    a.add_argument("sprite"); a.add_argument("rig"); a.add_argument("ordner")
    a.add_argument("--vorschau", type=int, default=0)
    n = sub.add_parser("nacharbeit", help="Pixel aus einer JSON-Liste [[x, y, \"rrggbb\"], …] setzen")
    n.add_argument("sprite"); n.add_argument("pixel"); n.add_argument("ziel")
    r = sub.add_parser("raster")
    r.add_argument("sprite"); r.add_argument("ziel")
    r.add_argument("--schritt", type=int, default=8)
    r.add_argument("--skalierung", type=int, default=6)
    r.add_argument("--rig")
    arg = ap.parse_args()
    if arg.befehl == "sprite":
        aus = [int(v) for v in arg.ausschnitt.split(",")] if arg.ausschnitt else None
        e = sprite(arg.quelle, arg.hoehe, arg.ansicht, arg.spiegeln, aus, arg.palette, arg.toleranz,
                   arg.kontur, not arg.nicht_glaetten, arg.farben)
        e.save(arg.ziel)
        print(arg.ziel, e.size, len([c for c in e.getcolors(4096) if c[1][3]]), "Farben")
    elif arg.befehl == "nacharbeit":
        a = auflage_anwenden(np.asarray(Image.open(arg.sprite).convert("RGBA")),
                             json.loads(Path(arg.pixel).read_text(encoding="utf-8")))
        Image.fromarray(a, "RGBA").save(arg.ziel)
        print(arg.ziel)
    elif arg.befehl == "animieren":
        animieren(arg.sprite, arg.rig, arg.ordner, arg.vorschau)
    else:
        sp = Image.open(arg.sprite)
        rig = Rig(sp, json.loads(Path(arg.rig).read_text(encoding="utf-8"))) if arg.rig else None
        raster(sp, arg.skalierung, arg.schritt, rig).save(arg.ziel)
        print(arg.ziel)


if __name__ == "__main__":
    main()
