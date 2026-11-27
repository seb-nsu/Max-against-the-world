"""Welt-4-Räume auf Spielgröße (27.11.): korrigierte Gemini-Bilder nach game/grafik/hintergruende.

Ablauf wie tools/grafik_w3/raeume_pixelieren.py (lessons-learned.md, Zustände und Varianten):
1. Verkleinern wie tools/pixelieren.py (k-Centroid je Zielpixel; Panoramen 1280 × 360, sonst 640 × 360).
2. Eine gemeinsame Palette je Raum aus Grundbild und Varianten.
3. Zustände nur an der geänderten Stelle: Unterschied innerhalb grober Rechtecke (BEREICHE), nach
   Umriss übernommen; „ganz“ nimmt das Rechteck vollständig. Kombinationen aus mehreren Masken.
4. Teile, die Max mitnimmt (Amboss, Archivband), als Props ausschneiden; die Stelle darunter kommt
   aus der Variante ohne das Teil (Amboss) oder wird mit Nachbarpixeln gefüllt (Archivband).
5. Effektstreifen: die Lichterkette in der Halle als zwei Bilder (aus, an) für „spricht: OPA“.

Ausgabe: game/grafik/hintergruende/w4_bg_<raum>[_<zustand>]_v01.png, Props nach game/grafik/props/,
Lichterkette nach game/grafik/ambiente/.

Aufruf: python3 tools/grafik_w4/raeume_pixelieren.py <ordner mit W4-R*.png> [raum …] [--masken <ordner>]
Quelle: E:/Game Engine/Grafiken/Welt 4/Hintergründe/korrigiert (nur lesen).
"""
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from pixelieren import farben_32, palette_finden, verkleinern  # noqa: E402

WURZEL = Path(__file__).resolve().parents[2]
ZIEL = WURZEL / "game/grafik/hintergruende"
PROPS = WURZEL / "game/grafik/props"
AMBIENTE = WURZEL / "game/grafik/ambiente"
VERSION = "v01"

# Raum: Breite, Grundbild, {Zustand: Quelle}, {Kombination: [Zustände]}, Farbanzahl
RAEUME = {
    "testbild": (640, "W4-R01_testbild_a_durcheinander", {"geordnet": "W4-R01_testbild_b_geordnet",
                                                          "graustufen": "W4-R01_testbild_c_graustufen"}, {}, 40),
    "rauschen": (640, "W4-R02_rauschen", {}, {}, 32),
    "gluecksrad": (640, "W4-R03_gluecksrad", {}, {}, 40),
    "sitcom_kueche": (1280, "W4-R04_sitcom_kueche_a", {"scherben": "W4-R04_sitcom_kueche_b_scherben",
                                                       "tuer_weg": "W4-R04_sitcom_kueche_c_tuer_weg"},
                      {"scherben_tuer_weg": ["scherben", "tuer_weg"]}, 40),
    "savanne": (1280, "W4-R05_savanne", {}, {}, 40),
    "friedhof": (640, "W4-R06_friedhof_a_haende", {"graeber_offen": "W4-R06_friedhof_b_graeber_offen",
                                                   "tor_offen": "W4-R06_friedhof_c_tor_offen"},
                 {}, 40),
    "spukhaus_keller": (640, "W4-R07_spukhaus_keller_a", {"sitcomtuer": "W4-R07_spukhaus_keller_b_sitcomtuer"}, {}, 40),
    "spukhaus_halle": (640, "W4-R08_spukhaus_halle_a", {"lichter": "W4-R08_spukhaus_halle_b_lichter"}, {}, 40),
    # Grundbild ohne Amboss; der Amboss wird ein Prop (Max nimmt ihn mit)
    "kapitolis": (640, "W4-R09_kapitolis_b_ohne_amboss", {"amboss": "W4-R09_kapitolis_a_amboss"}, {}, 40),
    "fondue_fabrik": (640, "W4-R10_fondue_fabrik_a", {"offen": "W4-R10_fondue_fabrik_b_offen"}, {}, 40),
    "werbespot_set": (1280, "W4-R11_werbespot_set_a_magnet", {"leer": "W4-R11_werbespot_set_b_leer"}, {}, 40),
    "empfang": (1280, "W4-R12_empfang", {}, {}, 40),
    "kellerarchiv": (640, "W4-R15_kellerarchiv", {}, {}, 40),
    "zappmanns_studio": (640, "W4-R13_zappmanns_studio_a", {"applaus_aus": "W4-R13_zappmanns_studio_b_applaus_aus",
                                                           "quote_rot": "W4-R13_zappmanns_studio_c_quote_rot"},
                         {"applaus_aus_quote_rot": ["applaus_aus", "quote_rot"]}, 40),
    "kindersendung": (640, "W4-R14_kindersendung", {}, {}, 32),   # nur fürs Bild-in-Bild im Finale
}
# Bereiche [x, y, b, h] in Spielpixeln, in denen der Zustand etwas ändert; außerhalb bleibt das Grundbild
BEREICHE = {
    ("testbild", "geordnet"): [[100, 0, 440, 270]],
    ("sitcom_kueche", "scherben"): [[240, 250, 330, 90]],
    ("sitcom_kueche", "tuer_weg"): [[1160, 95, 110, 255]],
    ("friedhof", "graeber_offen"): [[0, 200, 640, 150]],
    ("friedhof", "tor_offen"): [[250, 120, 160, 140], [0, 200, 640, 150]],   # Gräber auch offen
    ("spukhaus_keller", "sitcomtuer"): [[10, 20, 150, 300], [10, 280, 280, 80]],
    ("spukhaus_halle", "lichter"): [[125, 88, 450, 40]],
    ("kapitolis", "amboss"): [[335, 262, 125, 70]],
    ("fondue_fabrik", "offen"): [[170, 10, 270, 90], [220, 110, 110, 90]],
    ("werbespot_set", "leer"): [[555, 80, 170, 195, "ganz"]],
    ("zappmanns_studio", "applaus_aus"): [[400, 115, 100, 60]],
    ("zappmanns_studio", "quote_rot"): [[500, 85, 55, 290]],
}
GANZ = {("testbild", "graustufen")}     # ganzes Bild (Pixels Sicht)
SCHWELLE = 42
MIN_FLECK = 30


def maske(a, b):
    d = np.sqrt(((a.astype(np.float32) - b.astype(np.float32)) ** 2).sum(-1))
    m = d > SCHWELLE
    m = ndimage.binary_opening(m, iterations=1)
    m = ndimage.binary_closing(m, iterations=3)
    lab, n = ndimage.label(m)
    if n:
        groesse = ndimage.sum(m, lab, range(1, n + 1))
        m = np.isin(lab, 1 + np.nonzero(groesse >= MIN_FLECK)[0])
    m = ndimage.binary_fill_holes(m)
    return ndimage.binary_dilation(m, iterations=1)


def raum_bauen(quelle, raum, masken=None):
    W, grund, varianten, kombis, n_farben = RAEUME[raum]
    H = 360
    klein = {"": verkleinern(quelle / f"{grund}.png", W, H)}
    for name, datei in varianten.items():
        klein[name] = verkleinern(quelle / f"{datei}.png", W, H)
    rng = np.random.default_rng(1)
    px = np.concatenate([k.reshape(-1, 3)[rng.choice(W * H, 80000, replace=False)] for k in klein.values()])
    pal, _ = palette_finden(px.astype(np.float32), n_farben)
    bilder = {n: np.asarray(farben_32(k, palette=pal)).copy() for n, k in klein.items()}
    m = {}
    for name in varianten:
        if (raum, name) in GANZ:
            m[name] = np.ones((H, W), bool)
            continue
        mm = maske(klein[""], klein[name])
        if (raum, name) in BEREICHE:
            b = np.zeros_like(mm)
            ganz = np.zeros_like(mm)
            for x, y, w, h, *art in BEREICHE[(raum, name)]:
                (ganz if art == ["ganz"] else b)[y:y + h, x:x + w] = True
            mm = (mm & b) | ganz
        m[name] = mm
    grundbild = bilder[""]
    if raum in SONDER:
        SONDER[raum](bilder, m, pal)
        return bilder, m
    Image.fromarray(grundbild).save(ZIEL / f"w4_bg_{raum}_{VERSION}.png")
    print(raum, "Grundbild", W, "x", H, len(np.unique(grundbild.reshape(-1, 3), axis=0)), "Farben")
    for name in list(m) + list(kombis):
        out = grundbild.copy()
        for teil in kombis.get(name, [name]):
            out = np.where(m[teil][..., None], bilder[teil], out)
        m.setdefault(name, np.logical_or.reduce([m[t] for t in kombis.get(name, [name])]))
        Image.fromarray(out).save(ZIEL / f"w4_bg_{raum}_{name}_{VERSION}.png")
        print(" ", name, f"{m[name].mean() * 100:.1f} % geändert")
    if masken:
        masken.mkdir(parents=True, exist_ok=True)
        for name in m:
            vorschau = grundbild.copy()
            vorschau[m[name]] = (vorschau[m[name]] * 0.4 + np.array([255, 0, 255]) * 0.6).astype(np.uint8)
            Image.fromarray(vorschau).save(masken / f"{raum}_{name}.png")
    return bilder, m


def teil_ausschneiden(bild, maske_, datei):
    """Teil nach Umriss als RGBA-Prop; liefert Rechteck [x, y, b, h] und Grundlinie."""
    ys, xs = np.nonzero(maske_)
    x0, y0, x1, y1 = xs.min(), ys.min(), xs.max() + 1, ys.max() + 1
    teil = np.zeros((y1 - y0, x1 - x0, 4), np.uint8)
    teil[..., :3] = bild[y0:y1, x0:x1]
    teil[..., 3] = maske_[y0:y1, x0:x1] * 255
    Image.fromarray(teil).save(datei)
    print("  Prop", datei.name, "rect", [int(x0), int(y0), int(x1 - x0), int(y1 - y0)], "baseline", int(y1))


def nach_kapitolis(bilder, m, pal):
    """Grundbild ohne Amboss; Amboss nach Umriss aus der Variante als Prop."""
    Image.fromarray(bilder[""]).save(ZIEL / f"w4_bg_kapitolis_{VERSION}.png")
    print("kapitolis Grundbild ohne Amboss")
    lab, n = ndimage.label(m["amboss"])
    gr = ndimage.sum(m["amboss"], lab, range(1, n + 1))
    teil = lab == (int(np.argmax(gr)) + 1)          # größter Fleck: der Amboss
    teil_ausschneiden(bilder["amboss"], teil, PROPS / "amboss.png")


def nach_halle(bilder, m, pal):
    """Grundbild mit Lichterkette aus; Streifen aus zwei Bildern (aus, an) im Rechteck der Änderung."""
    Image.fromarray(bilder[""]).save(ZIEL / f"w4_bg_spukhaus_halle_{VERSION}.png")
    ys, xs = np.nonzero(m["lichter"])
    x0, y0, x1, y1 = xs.min(), ys.min(), xs.max() + 1, ys.max() + 1
    aus = np.zeros((y1 - y0, x1 - x0, 4), np.uint8)
    an = aus.copy()
    feld = m["lichter"][y0:y1, x0:x1]
    aus[..., :3] = bilder[""][y0:y1, x0:x1]
    an[..., :3] = bilder["lichter"][y0:y1, x0:x1]
    aus[..., 3] = an[..., 3] = feld * 255
    Image.fromarray(np.concatenate([aus, an], 1)).save(AMBIENTE / f"w4_lichterkette_{VERSION}.png")
    print("spukhaus_halle Lichterkette", [int(x0), int(y0), int(x1 - x0), int(y1 - y0)],
          "Mitte", [int((x0 + x1) // 2), int((y0 + y1) // 2)])


# Archivband in der Müllpresse: Umriss von Hand (Ecken im 640er-Bild), darunter Bandsalat aus
# denselben Zeilen 100 px weiter links
ARCHIVBAND = [(331, 207), (369, 221), (353, 249), (313, 234)]


def nach_kellerarchiv(bilder, m, pal):
    from PIL import ImageDraw
    a = bilder[""]
    maske_bild = Image.new("L", (a.shape[1], a.shape[0]), 0)
    ImageDraw.Draw(maske_bild).polygon(ARCHIVBAND, fill=255, outline=255)
    band = np.asarray(maske_bild) > 0
    teil_ausschneiden(a, band, PROPS / "archivband.png")
    ys, xs = np.nonzero(band)
    a[ys, xs] = a[ys, xs - 100]
    Image.fromarray(a).save(ZIEL / f"w4_bg_kellerarchiv_{VERSION}.png")
    print("kellerarchiv Grundbild ohne Archivband")


SONDER = {"kapitolis": nach_kapitolis, "spukhaus_halle": nach_halle, "kellerarchiv": nach_kellerarchiv}


def main():
    quelle = Path(sys.argv[1])
    masken = Path(sys.argv[sys.argv.index("--masken") + 1]) if "--masken" in sys.argv else None
    nur = [a for a in sys.argv[2:] if a in RAEUME]
    for raum in RAEUME:
        if nur and raum not in nur:
            continue
        raum_bauen(quelle, raum, masken)


if __name__ == "__main__":
    main()
