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

4. Gehen per Code aus dem Standbild (Seitenansicht nach rechts, Zeilen mit raster ablesen):
     python3 tools/figur.py gehen max.png gehen.png --bein-ab 150 --huefte 132 --knie 168 \\
         [--knoechel 186] [--schritt 24] [--beuge 30] [--vorschau 4]
     python3 tools/figur.py vierbeiner pixel.png gehen.png --bauch 53 --knie 57 \\
         --vorne 52,61 --hinten 22,31 [--versatz 3] [--vorschau 6]
   vierbeiner braucht ein Standbild mit allen vier Beinen gerade nach unten; nur die zwei Beine der
   sichtbaren Seite zählen (Spalten --vorne und --hinten), die andere Seite entsteht als dunkle Kopie.

5. Gegenstände aus einem Sammelbild (Raster aus gleich großen Zellen), je Zelle ein Sprite:
     python3 tools/figur.py gegenstaende sammelbild.png ordner --raster 7x1 --namen=a,b,- \\
         [--groesse 42] [--ausschnitt X,Y,B,H] [--kontur keine] [--linien 0]
   --groesse ist die längste Seite (Inventar 42, Szene kleiner), „-“ überspringt eine Zelle,
   --linien 0 für Draht und andere dünne helle Dinge.
"""
import argparse
import json
import math
import sys
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw, ImageFilter

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


FIGUR_GEWICHT = np.array([1.0, 2.0, 2.0])   # wie pixelieren.py


LINIEN = 0.0   # Linien verdicken: Anteil eines Zielpixels (0 = aus, 0.5 bis 1 üblich)
SAETTIGUNG = 1.0   # Konzeptbilder sind oft blasser als die Palette (Jeans fast so grau wie der Hoodie)


def auf_palette(rgb, pal):
    lab = oklab(rgb.reshape(-1, 3).astype(np.float32))
    lab[:, 1:] *= SAETTIGUNG
    lab = lab * FIGUR_GEWICHT
    ziel = oklab(pal.astype(np.float32)) * FIGUR_GEWICHT
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


def verkleinern(rgb, bg, rahmen, H, massstab=None, eigene=None):
    """Eine Figur aus dem Blatt auf H Pixel Höhe (oder mit festem Maßstab): k-Centroid für die Farben,
    Deckung ab halber Fläche."""
    x0, y0, x1, y1 = rahmen
    if massstab:
        H = max(1, round((y1 - y0) * massstab))
    vorn = eigene[y0:y1, x0:x1] if eigene is not None else ~bg[y0:y1, x0:x1]
    teil, maske = rgb[y0:y1, x0:x1], vorn.astype(np.uint8) * 255
    W = max(1, round((x1 - x0) * H / (y1 - y0)))
    if LINIEN:
        # Dünne dunkle Linien (Mund, Augen, Konturen) vor dem Verkleinern verdicken, damit sie einen ganzen
        # Zielpixel füllen; wie „Outline keep“ bei Retro Diffusion. Nur dunkle Pixel breiten sich aus.
        n = max(1, round((y1 - y0) / H * LINIEN / 2)) * 2 + 1
        dunkel = np.asarray(Image.fromarray(teil).filter(ImageFilter.MinFilter(n)))
        hell = dunkel.astype(np.float32).mean(-1)
        teil = np.where((hell < 55)[..., None] & vorn[..., None], dunkel, teil).astype(np.uint8)
    a = np.asarray(Image.fromarray(teil).resize((W * F, H * F), Image.LANCZOS), dtype=np.float32)
    m = np.asarray(Image.fromarray(maske).resize((W * F, H * F), Image.BOX)) / 255.0
    return k_centroid(a, H, W), m.reshape(H, F, W, F).mean((1, 3)) >= 0.5


def komponenten(maske, k=2):
    """Rahmen zusammenhängender Figuren von links nach rechts. Die Maske wird dafür um k verkleinert, damit
    lose Haarsträhnen und Schnürsenkel an ihrer Figur hängen; Teile unter 2 Prozent der größten Figur fallen
    an die Figur, deren Rahmen sie am nächsten liegen."""
    h, w = maske.shape
    hk, wk = h // k, w // k
    m = maske[:hk * k, :wk * k].reshape(hk, k, wk, k).any((1, 3))
    marke = np.zeros(m.shape, int); n = 0
    for y0, x0 in zip(*np.nonzero(m)):
        if marke[y0, x0]:
            continue
        n += 1; stapel = [(y0, x0)]; marke[y0, x0] = n
        while stapel:
            y, x = stapel.pop()
            for dy, dx in ((1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)):
                yy, xx = y + dy, x + dx
                if 0 <= yy < hk and 0 <= xx < wk and m[yy, xx] and not marke[yy, xx]:
                    marke[yy, xx] = n; stapel.append((yy, xx))
    teile = []
    for i in range(1, n + 1):
        ys, xs = np.nonzero(marke == i)
        teile.append([len(ys), xs.min() * k, ys.min() * k, (xs.max() + 1) * k, (ys.max() + 1) * k])
    gross = max(t[0] for t in teile)
    figuren = [t[1:] for t in teile if t[0] >= gross * 0.2]
    for t in teile:
        if t[0] < gross * 0.2:
            cx, cy = (t[1] + t[3]) / 2, (t[2] + t[4]) / 2
            f = min(figuren, key=lambda r: max(r[0] - cx, 0, cx - r[2]) + max(r[1] - cy, 0, cy - r[3]))
            f[0] = min(f[0], t[1]); f[1] = min(f[1], t[2]); f[2] = max(f[2], t[3]); f[3] = max(f[3], t[4])
    # Jede kleine Komponente gehört zur Figur, an die sie fällt; je Figur eine eigene Maske, damit Teile
    # der Nachbarfiguren im Rahmen nicht mitkommen
    zu = {}
    for i, t in enumerate(teile, 1):
        if t[0] >= gross * 0.2:
            zu[i] = next(j for j, f in enumerate(figuren) if f[0] <= t[1] and f[2] >= t[3] and f[1] <= t[2] and f[3] >= t[4])
    for i, t in enumerate(teile, 1):
        if i not in zu:
            cx, cy = (t[1] + t[3]) / 2, (t[2] + t[4]) / 2
            zu[i] = min(range(len(figuren)), key=lambda j: max(figuren[j][0] - cx, 0, cx - figuren[j][2]) + max(figuren[j][1] - cy, 0, cy - figuren[j][3]))
    voll = np.zeros((h, w), int)
    voll[:hk * k, :wk * k] = np.repeat(np.repeat(marke, k, 0), k, 1)
    nr = np.zeros(n + 1, int); nr[0] = -1
    for i, j in zu.items():
        nr[i] = j
    figur_von = nr[voll]
    aus = []
    for j in range(len(figuren)):
        m_j = maske & (figur_von == j)
        ys, xs = np.nonzero(m_j)
        aus.append(((xs.min(), ys.min(), xs.max() + 1, ys.max() + 1), m_j))
    return sorted(aus, key=lambda a: a[0][0])


def laengster_lauf(maske):
    """Je Zeile die längste zusammenhängende Strecke belegter Pixel (eine Bodenlinie läuft durch, Figuren nicht)."""
    lauf = np.zeros(maske.shape[0], int); jetzt = np.zeros(maske.shape[0], int)
    for x in range(maske.shape[1]):
        jetzt = np.where(maske[:, x], jetzt + 1, 0)
        lauf = np.maximum(lauf, jetzt)
    return lauf


def blatt_lesen(quelle, ausschnitt=None, tol=40):
    """Blatt laden, Hintergrund und waagrechte Bodenlinien (über die halbe Breite) entfernen, Figuren finden."""
    rgba = np.asarray(Image.open(quelle).convert("RGBA"))
    if ausschnitt:
        x, y, b, h = ausschnitt
        rgba = rgba[y:y + h, x:x + b]
    rgb = np.ascontiguousarray(rgba[..., :3])
    bg = hintergrund_maske(rgb, tol) | (rgba[..., 3] < 128)
    linie = laengster_lauf(~bg) > bg.shape[1] * 0.5
    if linie.any():
        # Bodenlinie samt Saum als Hintergrund übermalen und neu füllen: so fallen auch die Flächen zwischen
        # den Beinen weg, die die Linie unten abgeschlossen hat
        linie = np.convolve(linie, np.ones(5), "same") > 0
        rand = np.concatenate([rgb[0], rgb[-1], rgb[:, 0], rgb[:, -1]])
        rgb2 = rgb.copy(); rgb2[linie] = np.median(rand, 0).astype(np.uint8)
        bg = hintergrund_maske(rgb2, tol) | (rgba[..., 3] < 128)
    return rgb, bg, alle_figuren(~bg)


def blatt_zyklus(quelle, ausschnitt=None, tol=40, anzahl=0):
    """Figuren eines Bewegungsblatts als (Rahmen, Maske). Berühren sich zwei (Schuhe), sind es weniger als
    anzahl: dann die breiteste Figur an der dünnsten Spalte in ihrer mittleren Hälfte teilen, bis es passt."""
    rgb, bg, _ = blatt_lesen(quelle, ausschnitt, tol)
    figuren = komponenten(~bg)
    while anzahl and len(figuren) < anzahl:
        i = max(range(len(figuren)), key=lambda j: figuren[j][0][2] - figuren[j][0][0])
        (x0, y0, x1, y1), m = figuren[i]
        dichte = m[y0:y1, x0:x1].sum(0)
        a, b = (x1 - x0) // 4, 3 * (x1 - x0) // 4
        x = x0 + a + int(dichte[a:b].argmin())
        neu = []
        for u, v in ((0, x), (x, m.shape[1])):
            mm = m.copy(); mm[:, :u] = False; mm[:, v:] = False
            ys, xs = np.nonzero(mm)
            neu.append(((xs.min(), ys.min(), xs.max() + 1, ys.max() + 1), mm))
        figuren[i:i + 1] = neu
    return rgb, bg, figuren


def farben_vereinheitlichen(teile, farben):
    """Gemeinsame eigene Farben für mehrere verkleinerte Figuren (Liste aus (bild, deckung)); Stoffstruktur
    verschwindet. Feine Details (Augen, Linien) bleiben: wo das Original deutlich heller oder dunkler ist als
    seine Gruppe, gilt das Original."""
    probe = np.concatenate([k.reshape(-1, 3)[m.ravel()] for k, m in teile]).astype(np.float32)
    eigen, _ = palette_finden(probe, farben)
    ziel = oklab(eigen.astype(np.float32)) * GEWICHT
    aus = []
    for klein, alpha in teile:
        sel = alpha.ravel()
        px = klein.reshape(-1, 3).astype(np.float32)[sel]
        lab = oklab(px) * GEWICHT
        neu = eigen[((lab[:, None, :] - ziel[None]) ** 2).sum(-1).argmin(1)].astype(np.float32)
        dl = np.abs(oklab(px)[:, 0] - oklab(neu)[:, 0])
        flach = klein.reshape(-1, 3).copy()
        flach[sel] = np.where((dl > DETAIL)[:, None], px, neu).astype(np.uint8)
        aus.append(flach.reshape(klein.shape))
    return aus


def fertig(klein, alpha, palette, glatt, konturfarbe, spiegeln):
    pal = palette_holen(palette)
    if pal is not None:
        klein = auf_palette(klein, pal)
    out = np.zeros(klein.shape[:2] + (4,), np.uint8)
    out[..., :3] = klein; out[..., 3] = alpha * 255
    out = streupixel(out)
    if glatt:
        out = glaetten(out)
    out[out[..., 3] == 0] = 0
    if konturfarbe:
        out = kontur(out, konturfarbe)
    if spiegeln:
        out = out[:, ::-1]
    return out


def sprite(quelle, hoehe, ansicht=1, spiegeln=False, ausschnitt=None, palette="endesga", tol=40,
           konturfarbe=None, glatt=True, farben=0):
    rgb, bg, rahmen = blatt_lesen(quelle, ausschnitt, tol)
    if not 1 <= ansicht <= len(rahmen):
        sys.exit(f"Ansicht {ansicht} gibt es nicht, gefunden: {len(rahmen)} Figuren")
    klein, alpha = verkleinern(rgb, bg, rahmen[ansicht - 1], hoehe)
    if farben:   # gemeinsam für alle Ansichten des Blatts, damit Seite, Vorder- und Rückansicht gleich aussehen
        alle = [verkleinern(rgb, bg, r, hoehe) for r in rahmen]
        alle[ansicht - 1] = (klein, alpha)
        klein = farben_vereinheitlichen(alle, farben)[ansicht - 1]
    return Image.fromarray(fertig(klein, alpha, palette, glatt, konturfarbe, spiegeln), "RGBA")


def gegenstaende(quelle, ausschnitt, spalten, zeilen, groesse, palette="endesga", tol=40, loch_tol=20,
                 konturfarbe=None, glatt=True, gemeinsam=False):
    """Sammelbild (Raster aus gleich großen Zellen) zu einzelnen Sprites: je Zelle Hintergrund von den
    Rändern her und gleichfarbige Löcher (Bügel, Henkel) entfernen, auf die längste Seite = groesse
    bringen. Keine Bodenlinien-Suche wie bei Figuren (Untertassen und Bügel sind waagrecht).
    gemeinsam: alle Zellen mit demselben Rahmen und Maßstab (Zustandsreihe eines Objekts, etwa der
    Zapp-O-Mat mit und ohne Antenne), damit die Bilder als Einzelbilder eines Sheets zusammenpassen."""
    rgb = np.ascontiguousarray(np.asarray(Image.open(quelle).convert("RGB")))
    x, y, b, h = ausschnitt or (0, 0, rgb.shape[1], rgb.shape[0])
    zb, zh = b / spalten, h / zeilen
    rand = max(4, round(min(zb, zh) * 0.06))   # Rasterlinien zwischen den Zellen abschneiden
    cw, ch = int(zb) - 2 * rand - 1, int(zh) - 2 * rand - 1
    zellen = []
    for j in range(zeilen):
        for i in range(spalten):
            x0, y0 = round(x + i * zb) + rand, round(y + j * zh) + rand
            zelle = np.ascontiguousarray(rgb[y0:y0 + ch, x0:x0 + cw])
            bg = hintergrund_maske(zelle, tol)
            r = np.concatenate([zelle[0], zelle[-1], zelle[:, 0], zelle[:, -1]]).astype(np.float32)
            nah = np.sqrt(((zelle.astype(np.float32) - np.median(r, 0)) ** 2).sum(-1)) < loch_tol
            vorn = ~(bg | nah)
            vorn = np.asarray(Image.fromarray(vorn.astype(np.uint8) * 255).filter(ImageFilter.MinFilter(3))
                              .filter(ImageFilter.MaxFilter(3))) > 0
            zellen.append((zelle, vorn))

    def rahmen_von(m):
        ys, xs = np.nonzero(m)
        return (xs.min(), ys.min(), xs.max() + 1, ys.max() + 1) if len(ys) else None

    alle = rahmen_von(np.any([v for _, v in zellen], axis=0)) if gemeinsam else None
    out = []
    for zelle, vorn in zellen:
        rahmen = alle or rahmen_von(vorn)
        if rahmen is None:
            out.append(None); continue
        hoehe = max(1, round(groesse * (rahmen[3] - rahmen[1]) / max(rahmen[2] - rahmen[0], rahmen[3] - rahmen[1])))
        klein, alpha = verkleinern(zelle, ~vorn, rahmen, hoehe)
        out.append(Image.fromarray(fertig(klein, alpha, palette, glatt, konturfarbe, False), "RGBA"))
    return out


def gehen(sprite_rgba, bein_ab, huefte, knie, knoechel=None, bilder=8, schritt=24.0, beuge=30.0,
          dunkel=0.72, fuss=0.25):
    """Gehzyklus per Code aus einem Standbild in Seitenansicht (nach rechts): Oberkörper bleibt, das
    sichtbare Bein (alles ab Zeile bein_ab) wird in Oberschenkel, Unterschenkel und Fuß (ab knoechel)
    geteilt und schwingt um Hüfte, Knie und Knöchel; der Fuß bleibt fast waagrecht (fuss = Anteil der
    Unterschenkel-Neigung, die er mitmacht). Das hintere Bein ist eine abgedunkelte Kopie im Gegentakt.
    Die Füße bleiben am Boden, daraus ergibt sich das Wippen. So sieht der Gang bei jeder Figur gleich
    sauber aus, statt acht gezeichnete Bilder zusammenzusuchen."""
    a = np.asarray(sprite_rgba.convert("RGBA"))
    h, w = a.shape[:2]
    deckt = a[..., 3] > 0
    knoechel = knoechel or h

    def mitte(y):
        xs = np.nonzero(deckt[min(max(y, 0), h - 1)])[0]
        return float(xs.mean()) if len(xs) else w / 2
    gelenke = [np.array([mitte(bein_ab), huefte], float), np.array([mitte(knie), knie], float),
               np.array([mitte(knoechel - 1), knoechel], float)]
    teile = []
    for von, bis in ((bein_ab, knie), (knie, knoechel), (knoechel, h)):
        m = np.zeros_like(deckt); m[von:bis] = deckt[von:bis]; teile.append(m)
    # Oberschenkel unter dem Pulli nach oben verlängern, damit beim Schwingen keine Lücke an der Hüfte entsteht
    quelle = a.copy()
    for y in range(max(0, bein_ab - 8), bein_ab):
        quelle[y] = a[bein_ab]; teile[0][y] = deckt[bein_ab]
    rand = 12
    H, W = h + 2 * rand, w + 2 * rand
    ys, xs = np.mgrid[0:H, 0:W]
    px = xs - rand + 0.5; py = ys - rand + 0.5

    def vor(p, z, w_):     # R(w) dreht (0,1) auf (sin w, cos w): positiv = nach vorn (rechts)
        c, s_ = math.cos(w_), math.sin(w_); d = p - z
        return z + np.array([c * d[0] + s_ * d[1], -s_ * d[0] + c * d[1]])

    def bein(out, winkel, faktor):
        # Vorwärtskette: jedes Teil dreht absolut um sein Gelenk und wird an das bewegte Gelenk gehängt
        lage = [gelenke[0]]
        for k in range(1, 3):
            lage.append(vor(gelenke[k], gelenke[k - 1], winkel[k - 1]) - gelenke[k - 1] + lage[k - 1])
        for k in range(3):
            c, s_ = math.cos(winkel[k]), math.sin(winkel[k])
            dx, dy = px - lage[k][0], py - lage[k][1]
            sx = gelenke[k][0] + c * dx - s_ * dy
            sy = gelenke[k][1] + s_ * dx + c * dy
            ix, iy = np.floor(sx).astype(int), np.floor(sy).astype(int)
            ok = (ix >= 0) & (ix < w) & (iy >= 0) & (iy < h)
            t = np.zeros((H, W), bool); t[ok] = teile[k][iy[ok], ix[ok]]
            farbe = quelle[iy.clip(0, h - 1), ix.clip(0, w - 1)].astype(np.float32)
            farbe[..., :3] *= faktor
            out[t] = farbe[t].astype(np.uint8)

    frames = []
    boden = np.nonzero(deckt.any(1))[0].max()
    for i in range(bilder):
        t = 2 * math.pi * i / bilder
        out = np.zeros((H, W, 4), np.uint8)
        for phase, faktor in ((t + math.pi, dunkel), (t, 1.0)):
            ober = math.radians(schritt) * math.sin(phase)
            unter = ober - math.radians(beuge) * max(0.0, math.cos(phase))   # Knie beugt beim Vorschwingen
            bein(out, (ober, unter, unter * fuss), faktor)
        koerper = np.zeros((H, W, 4), np.uint8)
        koerper[rand:rand + bein_ab, rand:rand + w] = a[:bein_ab]
        sicht = koerper[..., 3] > 0
        out[sicht] = koerper[sicht]
        tief = np.nonzero(out[..., 3].any(1))[0].max()       # Füße auf den Boden (= Wippen)
        out = np.roll(out, (boden + rand) - tief, axis=0)
        frames.append(out)
    return frames


def vierbeiner(sprite_rgba, bauch, knie, vorne, hinten, schulter=None, bilder=8, schritt=22.0, beuge=35.0,
               dunkel=0.7, versatz=3):
    """Gehzyklus für Vierbeiner (Pixel) aus einem Standbild in Seitenansicht nach rechts, alle Beine
    gerade nach unten. Die zwei sichtbaren Beine (Spalten vorne=(x0, x1) und hinten=(x0, x1), ab Zeile
    bauch) werden in Ober- und Unterschenkel (Grenze knie) geteilt und schwingen um Schulter bzw. Hüfte
    (Zeile schulter, Standard bauch − 3). Die Beine der anderen Seite sind abgedunkelte Kopien, um versatz
    Pixel nach hinten verschoben. Schrittfolge wie beim Katzengang: hinten nah, vorne nah, hinten fern,
    vorne fern, je eine Vierteldrehung versetzt. Der Körper bleibt ruhig, die Pfoten bleiben am Boden."""
    a = np.asarray(sprite_rgba.convert("RGBA"))
    h, w = a.shape[:2]
    deckt = a[..., 3] > 0
    schulter = bauch - 3 if schulter is None else schulter
    rand = 12
    H, W = h + 2 * rand, w + 2 * rand
    ys, xs = np.mgrid[0:H, 0:W]
    px = xs - rand + 0.5; py = ys - rand + 0.5
    quelle = a.copy()
    beine = []
    koerper = a.copy()
    for x0, x1 in (hinten, vorne):
        spalte = np.zeros_like(deckt); spalte[:, x0:x1] = True
        ober = deckt & spalte; ober[:bauch - 4] = False; ober[knie:] = False
        unter = deckt & spalte; unter[:knie] = False
        koerper[bauch:, x0:x1] = 0

        def mitte(y, x0=x0, x1=x1):
            zs = np.nonzero(deckt[min(max(y, 0), h - 1), x0:x1])[0]
            return x0 + (float(zs.mean()) if len(zs) else (x1 - x0) / 2)
        gelenke = [np.array([mitte(bauch), schulter], float), np.array([mitte(knie), knie], float)]
        beine.append(([ober, unter], gelenke))

    def bein(out, teile, gelenke, ober_w, unter_w, faktor, dx):
        knie_neu = gelenke[0] + np.array([math.sin(ober_w), math.cos(ober_w)]) * (gelenke[1][1] - gelenke[0][1]) \
            + np.array([gelenke[1][0] - gelenke[0][0], 0.0])
        for teil, z, lage, wink in ((teile[0], gelenke[0], gelenke[0], ober_w), (teile[1], gelenke[1], knie_neu, unter_w)):
            c, s_ = math.cos(wink), math.sin(wink)
            ddx, ddy = px - lage[0] - dx, py - lage[1]
            sx = z[0] + c * ddx - s_ * ddy
            sy = z[1] + s_ * ddx + c * ddy
            ix, iy = np.floor(sx).astype(int), np.floor(sy).astype(int)
            ok = (ix >= 0) & (ix < w) & (iy >= 0) & (iy < h)
            t = np.zeros((H, W), bool); t[ok] = teil[iy[ok], ix[ok]]
            farbe = quelle[iy.clip(0, h - 1), ix.clip(0, w - 1)].astype(np.float32)
            farbe[..., :3] *= faktor
            out[t] = farbe[t].astype(np.uint8)

    boden = np.nonzero(deckt.any(1))[0].max()
    frames = []
    for i in range(bilder):
        t = 2 * math.pi * i / bilder
        out = np.zeros((H, W, 4), np.uint8)
        # fern zuerst (dunkel, versetzt), dann Körper, dann nah
        folge = [(1, math.pi, dunkel, -versatz), (0, 1.5 * math.pi, dunkel, -versatz)]
        for nr, ph, f, dx in folge:
            phase = t + ph
            ow = math.radians(schritt) * math.sin(phase)
            bein(out, *beine[nr], ow, ow - math.radians(beuge) * max(0.0, math.cos(phase)),
                 f, dx)
        k = np.zeros((H, W, 4), np.uint8); k[rand:rand + h, rand:rand + w] = koerper
        sicht = k[..., 3] > 0; out[sicht] = k[sicht]
        for nr, ph in ((0, 0.0), (1, 0.5 * math.pi)):
            phase = t + ph
            ow = math.radians(schritt) * math.sin(phase)
            bein(out, *beine[nr], ow, ow - math.radians(beuge) * max(0.0, math.cos(phase)),
                 1.0, 0)
        tief = np.nonzero(out[..., 3].any(1))[0].max()
        out = np.roll(out, (boden + rand) - tief, axis=0)
        frames.append(out)
    return frames


def zyklus(quelle, hoehe, spiegeln=False, ausschnitt=None, palette="endesga", tol=40, konturfarbe=None,
           glatt=True, farben=12, rand=4, anzahl=0, angleichen=False):
    """Alle Figuren eines Bewegungsblatts (etwa acht Gehschritte) im selben Maßstab: die höchste Figur wird
    hoehe Pixel hoch, alle stehen auf derselben Bodenlinie und werden am Oberkörper waagrecht ausgerichtet,
    damit die Figur auf der Stelle läuft. Liefert gleich große Einzelbilder."""
    rgb, bg, figuren = blatt_zyklus(quelle, ausschnitt, tol, anzahl)
    rahmen = [r for r, _ in figuren]
    s = hoehe / max(y1 - y0 for _, y0, _, y1 in rahmen)
    boden = max(y1 for *_, y1 in rahmen)
    faktoren = [1.0] * len(figuren)
    if angleichen:
        # Generator zeichnet manche Bilder kleiner: an der Rumpfbreite (25 bis 55 Prozent der Höhe)
        # auf den Median bringen, damit die Figur beim Gehen nicht schrumpft und wächst
        breiten = []
        for (x0, y0, x1, y1), m in figuren:
            zone = m[y0 + (y1 - y0) // 4:y0 + (y1 - y0) * 55 // 100, x0:x1]
            zeilen = zone.sum(1)
            breiten.append(float(np.median(zeilen[zeilen > 0])) if (zeilen > 0).any() else 1.0)
        ziel = float(np.median(breiten))
        faktoren = [ziel / b for b in breiten]
        s = hoehe / max((y1 - y0) * f for ((_, y0, _, y1), f) in zip(rahmen, faktoren))
    teile = [verkleinern(rgb, bg, r, 0, s * f, m) for (r, m), f in zip(figuren, faktoren)]
    farbig = farben_vereinheitlichen(teile, farben) if farben else [k for k, _ in teile]
    bilder, mitten = [], []
    for (klein, alpha), k, r in zip(teile, farbig, rahmen):
        b = fertig(k, alpha, palette, glatt, konturfarbe, spiegeln)
        h = b.shape[0]
        zone = (b[..., 3] > 0)[int(h * 0.25):int(h * 0.55)]
        xs = np.nonzero(zone)[1]
        mitten.append(xs.mean() if len(xs) else b.shape[1] / 2)
        bilder.append((b, 0 if angleichen else round((boden - r[3]) * s)))
    links = max(m for m in mitten); rechts = max(b.shape[1] - m for (b, _), m in zip(bilder, mitten))
    W = int(np.ceil(links + rechts)) + 2 * rand
    H = max(b.shape[0] + u for b, u in bilder) + rand
    aus = []
    for (b, unten), m in zip(bilder, mitten):
        f = np.zeros((H, W, 4), np.uint8)
        x = int(round(rand + links - m)); y = H - unten - b.shape[0]
        f[y:y + b.shape[0], x:x + b.shape[1]] = b
        aus.append(f)
    return aus


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


def paket(spez_pfad, bild_ziel, json_ziel):
    """Alle Bewegungen einer Figur in ein Sprite-Sheet für Godot (eine Zeile, gleich große Bilder).
    spez: {"animationen": {"idle": {"streifen": "pfad.png", "bilder": 4, "ms": 250, "schleife": true}, …}}
    Jeder Streifen wird als Ganzes ausgerichtet: Fußpunkt = unterste deckende Zeile, waagrecht die Mitte
    des Oberkörpers (so bleibt das Wippen innerhalb einer Bewegung erhalten). Ergebnis: Fußpunkt unten
    in der Bildmitte; die JSON-Datei nennt je Bewegung das erste Bild, die Zahl, die Dauer und ob sie
    sich wiederholt."""
    spez = json.loads(Path(spez_pfad).read_text(encoding="utf-8"))
    basis = Path(spez_pfad).parent
    teile = []
    for name, a in spez["animationen"].items():
        streifen = np.asarray(Image.open(basis / a["streifen"]).convert("RGBA"))
        n = a["bilder"]; w = streifen.shape[1] // n
        bilder = [streifen[:, i * w:(i + 1) * w] for i in range(n)]
        deckend = np.any([b[..., 3] > 0 for b in bilder], axis=0)
        ys = np.nonzero(deckend.any(1))[0]
        oben, boden = ys[0], ys[-1]
        hoch = boden - oben + 1
        zone = deckend[boden - int(hoch * 0.75):boden - int(hoch * 0.45)]
        mitte = np.nonzero(zone)[1].mean()
        xs = np.nonzero(deckend.any(0))[0]
        teile.append((name, a, bilder, oben, boden, mitte, xs[0], xs[-1]))
    H = int(max(boden - oben + 1 for _, _, _, oben, boden, *_ in teile)) + 2
    halb = max(max(mitte - links, rechts + 1 - mitte) for *_, mitte, links, rechts in teile)
    W = int(np.ceil(halb)) * 2 + 2
    blatt, info, nr = [], {}, 0
    for name, a, bilder, oben, boden, mitte, links, rechts in teile:
        for b in bilder:
            f = np.zeros((H, W, 4), np.uint8)
            dx = int(round(W / 2 - mitte)); dy = H - 1 - boden
            ys, xs = np.nonzero(b[..., 3] > 0)
            f[ys + dy, xs + dx] = b[ys, xs]
            blatt.append(f)
        info[name] = {"von": nr, "bilder": len(bilder), "ms": a.get("ms", 150), "schleife": a.get("schleife", True)}
        nr += len(bilder)
    Image.fromarray(np.concatenate(blatt, axis=1), "RGBA").save(bild_ziel)
    Path(json_ziel).write_text(json.dumps({"bild": [W, H], "animationen": info}, indent=1, ensure_ascii=False) + "\n",
                               encoding="utf-8")
    print(bild_ziel, nr, "Bilder je", W, "×", H)


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
    z = sub.add_parser("zyklus", help="Bewegungsblatt (etwa Gehschritte) zu einem Sprite-Sheet")
    z.add_argument("quelle"); z.add_argument("ziel")
    z.add_argument("--hoehe", type=int, required=True)
    z.add_argument("--spiegeln", action="store_true")
    z.add_argument("--kontur")
    z.add_argument("--farben", type=int, default=12)
    z.add_argument("--vorschau", type=int, default=0)
    z.add_argument("--ms", type=int, default=110)
    z.add_argument("--bilder", type=int, default=0, help="erwartete Zahl der Figuren auf dem Blatt")
    z.add_argument("--angleichen", action="store_true",
                   help="unterschiedlich groß gezeichnete Bilder an der Rumpfbreite angleichen, alle auf den Boden")
    g = sub.add_parser("gegenstaende", help="Sammelbild (Raster) zu einzelnen Gegenstands-Sprites")
    g.add_argument("quelle"); g.add_argument("ordner")
    g.add_argument("--raster", required=True, help="SPALTENxZEILEN, etwa 7x1")
    g.add_argument("--namen", required=True, help="Dateinamen in Lesereihenfolge, mit Komma; - = überspringen")
    g.add_argument("--groesse", type=int, default=42, help="längste Seite in Pixeln (Inventar 42, Szene kleiner)")
    g.add_argument("--ausschnitt", help="X,Y,B,H des Rasters im Bild (ohne Rand drumherum)")
    g.add_argument("--palette", default="endesga")
    g.add_argument("--kontur", default="262b44")
    g.add_argument("--streifen", action="store_true",
                   help="alle Zellen gleich gerahmt als ein Sheet <erster Name>.png (Zustände eines Objekts)")
    g.add_argument("--toleranz", type=float, default=40, help="Abstand zur Hintergrundfarbe der Zelle")
    g.add_argument("--loch-toleranz", type=float, default=20,
                   help="Löcher in Hintergrundfarbe durchsichtig machen; 0 = aus (dunkle Dinge auf dunklem Grund)")
    ge = sub.add_parser("gehen", help="Gehzyklus per Code aus dem Standbild (Seitenansicht)")
    ge.add_argument("sprite"); ge.add_argument("ziel")
    ge.add_argument("--bein-ab", type=int, required=True, help="erste Zeile, die nur noch Bein ist")
    ge.add_argument("--huefte", type=int, required=True, help="Zeile des Hüftgelenks (meist etwas höher)")
    ge.add_argument("--knie", type=int, required=True)
    ge.add_argument("--knoechel", type=int, help="Zeile, ab der der Fuß beginnt (bleibt fast waagrecht)")
    ge.add_argument("--bilder", type=int, default=8)
    ge.add_argument("--schritt", type=float, default=24, help="größter Beinwinkel in Grad")
    ge.add_argument("--beuge", type=float, default=30, help="Kniebeuge beim Vorschwingen in Grad")
    ge.add_argument("--ms", type=int, default=110)
    ge.add_argument("--vorschau", type=int, default=0)
    vb = sub.add_parser("vierbeiner", help="Gehzyklus per Code für Vierbeiner (Pixel) aus dem Standbild")
    vb.add_argument("sprite"); vb.add_argument("ziel")
    vb.add_argument("--bauch", type=int, required=True, help="erste Zeile unter dem Bauch (nur noch Beine)")
    vb.add_argument("--knie", type=int, required=True, help="Zeile zwischen Ober- und Unterschenkel")
    vb.add_argument("--vorne", required=True, help="X0,X1 der Spalten des sichtbaren Vorderbeins")
    vb.add_argument("--hinten", required=True, help="X0,X1 der Spalten des sichtbaren Hinterbeins")
    vb.add_argument("--schulter", type=int, help="Zeile von Schulter und Hüfte (Standard bauch − 3)")
    vb.add_argument("--bilder", type=int, default=8)
    vb.add_argument("--schritt", type=float, default=22)
    vb.add_argument("--beuge", type=float, default=35)
    vb.add_argument("--versatz", type=int, default=3, help="Beine der anderen Seite so weit nach hinten")
    vb.add_argument("--ms", type=int, default=110)
    vb.add_argument("--vorschau", type=int, default=0)
    pk = sub.add_parser("paket", help="Bewegungen einer Figur zu Sprite-Sheet und JSON für Godot")
    pk.add_argument("spez"); pk.add_argument("bild"); pk.add_argument("json")
    n = sub.add_parser("nacharbeit", help="Pixel aus einer JSON-Liste [[x, y, \"rrggbb\"], …] setzen")
    n.add_argument("sprite"); n.add_argument("pixel"); n.add_argument("ziel")
    r = sub.add_parser("raster")
    r.add_argument("sprite"); r.add_argument("ziel")
    r.add_argument("--schritt", type=int, default=8)
    r.add_argument("--skalierung", type=int, default=6)
    r.add_argument("--rig")
    for b in (s, z, g):
        b.add_argument("--saettigung", type=float, default=1.3,
                       help="Farbigkeit vor dem Umfärben verstärken (1.5 bei blassen Konzeptbildern)")
        b.add_argument("--linien", type=float, default=0.4,
                       help="dünne dunkle Linien vor dem Verkleinern verdicken, in Zielpixeln (etwa 0.6)")
    arg = ap.parse_args()
    global SAETTIGUNG, LINIEN
    SAETTIGUNG = getattr(arg, "saettigung", 1.0)
    LINIEN = getattr(arg, "linien", 0.0)
    if arg.befehl == "sprite":
        aus = [int(v) for v in arg.ausschnitt.split(",")] if arg.ausschnitt else None
        e = sprite(arg.quelle, arg.hoehe, arg.ansicht, arg.spiegeln, aus, arg.palette, arg.toleranz,
                   arg.kontur, not arg.nicht_glaetten, arg.farben)
        e.save(arg.ziel)
        print(arg.ziel, e.size, len([c for c in e.getcolors(4096) if c[1][3]]), "Farben")
    elif arg.befehl in ("gehen", "vierbeiner"):
        if arg.befehl == "gehen":
            bilder = gehen(Image.open(arg.sprite), arg.bein_ab, arg.huefte, arg.knie, arg.knoechel, arg.bilder,
                           arg.schritt, arg.beuge)
        else:
            paar = [tuple(int(v) for v in x.split(",")) for x in (arg.vorne, arg.hinten)]
            bilder = vierbeiner(Image.open(arg.sprite), arg.bauch, arg.knie, paar[0], paar[1], arg.schulter,
                                arg.bilder, arg.schritt, arg.beuge, versatz=arg.versatz)
        Image.fromarray(np.concatenate(bilder, axis=1), "RGBA").save(arg.ziel)
        h, w = bilder[0].shape[:2]
        if arg.vorschau:
            v = arg.vorschau
            gif = []
            for b in bilder:
                g = schachbrett(w * v, h * v, v * 2)
                gb = Image.fromarray(b, "RGBA").resize((w * v, h * v), Image.NEAREST)
                g.paste(gb, (0, 0), gb); gif.append(g)
            gif[0].save(str(Path(arg.ziel).with_suffix("")) + ".gif", save_all=True, append_images=gif[1:],
                        duration=arg.ms, loop=0)
        print(arg.ziel, len(bilder), "Bilder je", w, "×", h)
    elif arg.befehl == "zyklus":
        bilder = zyklus(arg.quelle, arg.hoehe, arg.spiegeln, konturfarbe=arg.kontur, farben=arg.farben,
                        anzahl=arg.bilder, angleichen=arg.angleichen)
        Image.fromarray(np.concatenate(bilder, axis=1), "RGBA").save(arg.ziel)
        h, w = bilder[0].shape[:2]
        if arg.vorschau:
            v = arg.vorschau
            gif = []
            for b in bilder:
                g = schachbrett(w * v, h * v, v * 2)
                gb = Image.fromarray(b, "RGBA").resize((w * v, h * v), Image.NEAREST)
                g.paste(gb, (0, 0), gb); gif.append(g)
            stamm = str(Path(arg.ziel).with_suffix(""))
            gif[0].save(stamm + ".gif", save_all=True, append_images=gif[1:], duration=arg.ms, loop=0)
            blatt = schachbrett(w * len(bilder) * v, h * v, v * 2)
            for i, g in enumerate(gif):
                blatt.paste(g, (i * w * v, 0))
            blatt.save(stamm + "_blatt.png")
        print(arg.ziel, len(bilder), "Bilder je", w, "×", h)
    elif arg.befehl == "gegenstaende":
        sp, ze = (int(v) for v in arg.raster.lower().split("x"))
        aus = [int(v) for v in arg.ausschnitt.split(",")] if arg.ausschnitt else None
        namen = arg.namen.split(",")
        Path(arg.ordner).mkdir(parents=True, exist_ok=True)
        if arg.streifen:
            bilder = gegenstaende(arg.quelle, aus, sp, ze, arg.groesse, arg.palette, tol=arg.toleranz,
                                  loch_tol=arg.loch_toleranz, konturfarbe=None if arg.kontur == "keine" else arg.kontur,
                                  gemeinsam=True)
            bilder = [np.asarray(bb) for bb, n in zip(bilder, namen) if n != "-"]
            Image.fromarray(np.concatenate(bilder, axis=1), "RGBA").save(Path(arg.ordner) / f"{namen[0]}.png")
            print(namen[0], len(bilder), "Bilder je", bilder[0].shape[1], "×", bilder[0].shape[0])
            return
        for name, bild in zip(namen, gegenstaende(arg.quelle, aus, sp, ze, arg.groesse, arg.palette,
                                                   tol=arg.toleranz, loch_tol=arg.loch_toleranz,
                                                   konturfarbe=None if arg.kontur == "keine" else arg.kontur)):
            if name != "-" and bild is not None:
                bild.save(Path(arg.ordner) / f"{name}.png")
                print(name, bild.size)
    elif arg.befehl == "paket":
        paket(arg.spez, arg.bild, arg.json)
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
