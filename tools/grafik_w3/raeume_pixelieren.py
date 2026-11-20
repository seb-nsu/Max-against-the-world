"""Welt-3-Räume: Sebastians Gemini-Bilder auf Spielgröße, Varianten nur an der geänderten Stelle.

Je Raum eine gemeinsame Palette (32 Farben) aus Grundbild und Varianten, damit sich beim Wechsel
nichts außer der geänderten Stelle verfärbt. Die Stelle selbst wird aus dem Unterschied der
verkleinerten Bilder gesucht (Farbabstand, Streupixel weg, kleine Flecken weg, Löcher zu) und nur
dort aus der Variante übernommen (lessons-learned.md, Zustände und Varianten). Kombinationen wie
„Schnee und Kaffee“ entstehen aus den Masken zweier Varianten.

Aufruf: python3 tools/grafik_w3/raeume_pixelieren.py <ordner mit W3-R*.jpg> <ziel: game/grafik/hintergruende>
        [--masken <ordner>]   schreibt die Masken als PNG zur Kontrolle
"""
import io
import sys
from pathlib import Path

import numpy as np
from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from pixelieren import farben_32, palette_finden, verkleinern  # noqa: E402

# Raum: (Breite, Grundbild, {Ausgabe: Quelle}, {Kombination: [Varianten, übereinandergelegt]})
RAEUME = {
    "unterstadt_strasse": (1280, "W3-R01_unterstadt", {}, {}),
    "stadtstrasse": (1280, "W3-R06_stadtstrasse_tag", {}, {}),
    "stadtstrasse_nacht": (1280, "W3-R06b_stadtstrasse_nacht", {}, {}),   # eigenes Bild, eigene Palette
    "apothekengasse": (1280, "W3-R02_apothekengasse", {"faecher_offen": "W3-R02b_apothekengasse_faecher_offen"}, {}),
    "widerstandsbasis": (1280, "W3-R03_basis", {"schnee": "W3-R03b_basis_schnee",
                                                "kaffee": "W3-R03c_basis_schnee_pfuetze_pixel"},
                         {"schnee_kaffee": ["schnee", "kaffee"]}),
    "kuehlung": (640, "W3-R04_kuehlung", {"taut": "W3-R04b_kuehlung_taut"}, {}),
    "laboreingang": (640, "W3-R05_laboreingang", {"offen": "W3-R05b_laboreingang_offen"}, {}),
    "kueche_orakel": (640, "W3-R07_kueche", {"scherben": "W3-R07b_kueche_sparschwein_kaputt"}, {}),
    "buero_50": (640, "W3-R08_bueroturm", {}, {}),
    "testkammer_1": (640, "W3-R09_testkammer1", {"offen": "W3-R09b_testkammer1_offen"}, {}),
    "testkammer_2": (640, "W3-R10_testkammer2", {"laser_gestoert": "W3-R10b_testkammer2_laser_gestoert"}, {}),
    "testkammer_3": (640, "W3-R11_testkammer3", {"offen": "W3-R11b_testkammer3_offen"}, {}),
}
# Bereiche [x, y, b, h], in denen die Variante etwas ändert; außerhalb bleibt das Grundbild
# (Gemini verschiebt bei Varianten Kleinigkeiten im ganzen Bild); mit „ganz“ zählt das ganze Rechteck
BEREICHE = {
    ("apothekengasse", "faecher_offen"): [[560, 180, 190, 75]],
    ("widerstandsbasis", "schnee"): [[205, 0, 150, 100], [105, 170, 250, 140]],
    ("widerstandsbasis", "kaffee"): [[740, 288, 500, 72], [1035, 205, 45, 35]],
    ("kuehlung", "taut"): [[230, 95, 240, 200], [455, 245, 110, 75, "ganz"]],
    ("laboreingang", "offen"): [[240, 100, 200, 160]],
    ("kueche_orakel", "scherben"): [[455, 70, 70, 40], [440, 280, 140, 60]],
    ("testkammer_1", "offen"): [[510, 100, 60, 200]],
    ("testkammer_2", "laser_gestoert"): [[135, 175, 375, 25]],
    ("testkammer_3", "offen"): [[510, 100, 70, 220]],
}
# Retusche im Original vor dem Verkleinern: Rechteck [x, y, b, h] mit dem Himmel der Zeile füllen
# (Stadtstraße: die vierte Wolke rechts muss weg, „dieselbe Wolke, dreimal“, W3_SIM_MAX_0040)
HIMMEL = {
    "W3-R06_stadtstrasse_tag": [[2700, 30, 294, 135]],
    "W3-R06b_stadtstrasse_nacht": [[2700, 30, 294, 135]],
}
SCHWELLE = 42      # Farbabstand (RGB), ab dem ein Pixel als geändert gilt
MIN_FLECK = 40     # kleinere zusammenhängende Flecken sind Rauschen (Gemini ändert Kleinigkeiten)


def _nachbarn(m, r=1):
    p = np.pad(m, r)
    out = np.zeros_like(m)
    for dy in range(-r, r + 1):
        for dx in range(-r, r + 1):
            out |= p[r + dy:r + dy + m.shape[0], r + dx:r + dx + m.shape[1]]
    return out


def _flecken(m):
    """Zusammenhängende Flecken (4er-Nachbarschaft) als Liste von Indexlisten."""
    h, w = m.shape
    seen = np.zeros_like(m)
    out = []
    for y0, x0 in zip(*np.nonzero(m)):
        if seen[y0, x0]:
            continue
        stapel = [(y0, x0)]; seen[y0, x0] = True; teil = []
        while stapel:
            y, x = stapel.pop(); teil.append((y, x))
            for ny, nx in ((y + 1, x), (y - 1, x), (y, x + 1), (y, x - 1)):
                if 0 <= ny < h and 0 <= nx < w and m[ny, nx] and not seen[ny, nx]:
                    seen[ny, nx] = True; stapel.append((ny, nx))
        out.append(teil)
    return out


def laden(datei):
    """Original laden; Rechtecke aus HIMMEL mit der Himmelsfarbe links daneben füllen."""
    if datei.stem not in HIMMEL:
        return datei
    a = np.asarray(Image.open(datei).convert("RGB")).copy()
    for x, y, w, h in HIMMEL[datei.stem]:
        probe = a[y:y + h, x - 24:x - 4].astype(np.float32).mean(1)        # Himmel je Zeile
        a[y:y + h, x:x + w] = probe[:, None, :].astype(np.uint8)
    puffer = io.BytesIO()
    Image.fromarray(a).save(puffer, "PNG")
    puffer.seek(0)
    return puffer


def maske(a, b):
    d = np.sqrt(((a.astype(np.float32) - b.astype(np.float32)) ** 2).sum(-1))
    m = d > SCHWELLE
    m = ~_nachbarn(~m, 1)          # öffnen: einzelne Pixel weg
    m = _nachbarn(m, 1)
    m = _nachbarn(m, 3)            # schließen: Lücken in der Stelle zu
    m = ~_nachbarn(~m, 3)
    keep = np.zeros_like(m)
    for teil in _flecken(m):
        if len(teil) >= MIN_FLECK:
            ys, xs = zip(*teil); keep[ys, xs] = True
    # Löcher füllen: alles, was vom Rand aus nicht erreichbar ist
    frei = ~keep
    rand = np.zeros_like(frei)
    rand[0, :] = frei[0, :]; rand[-1, :] = frei[-1, :]; rand[:, 0] = frei[:, 0]; rand[:, -1] = frei[:, -1]
    for teil in _flecken(frei):
        if not any(rand[y, x] for y, x in teil[:1] + teil[-1:]) and not any(
                y in (0, m.shape[0] - 1) or x in (0, m.shape[1] - 1) for y, x in teil):
            ys, xs = zip(*teil); keep[ys, xs] = True
    return _nachbarn(keep, 1)


def main():
    quelle, ziel = Path(sys.argv[1]), Path(sys.argv[2])
    masken = Path(sys.argv[sys.argv.index("--masken") + 1]) if "--masken" in sys.argv else None
    nur = [a for a in sys.argv[3:] if a in RAEUME]
    for raum, (W, grund, varianten, kombis) in RAEUME.items():
        if nur and raum not in nur:
            continue
        H = 360
        klein = {"": verkleinern(laden(quelle / f"{grund}.jpg"), W, H)}
        for name, datei in varianten.items():
            klein[name] = verkleinern(laden(quelle / f"{datei}.jpg"), W, H)
        rng = np.random.default_rng(1)
        px = np.concatenate([k.reshape(-1, 3)[rng.choice(W * H, 60000, replace=False)] for k in klein.values()])
        pal, _ = palette_finden(px.astype(np.float32), 32)
        quant = {n: np.asarray(farben_32(k, palette=pal)) for n, k in klein.items()}
        grundbild = quant[""]
        Image.fromarray(grundbild).save(ziel / f"w3_bg_{raum}_v01.png")
        print(raum, "Grundbild", W, "x", H)
        m = {}
        for name in varianten:
            m[name] = maske(klein[""], klein[name])
        for name in m:
            if (raum, name) in BEREICHE:
                b = np.zeros_like(m[name])
                ganz = np.zeros_like(m[name])
                for x, y, w, h, *art in BEREICHE[(raum, name)]:
                    (ganz if art == ["ganz"] else b)[y:y + h, x:x + w] = True
                m[name] = (m[name] & b) | ganz   # „ganz“: das Rechteck vollständig aus der Variante
        for name in list(varianten) + list(kombis):
            out = grundbild.copy()
            for teil in kombis.get(name, [name]):
                out = np.where(m[teil][..., None], quant[teil], out)
            m.setdefault(name, np.logical_or.reduce([m[t] for t in kombis.get(name, [name])]))
            Image.fromarray(out).save(ziel / f"w3_bg_{raum}_{name}_v01.png")
            print(" ", name, f"{m[name].mean() * 100:.1f} % geändert")
            if masken:
                masken.mkdir(parents=True, exist_ok=True)
                vorschau = grundbild.copy()
                vorschau[m[name]] = (vorschau[m[name]] * 0.4 + np.array([255, 0, 255]) * 0.6).astype(np.uint8)
                Image.fromarray(vorschau).save(masken / f"{raum}_{name}.png")


if __name__ == "__main__":
    main()
