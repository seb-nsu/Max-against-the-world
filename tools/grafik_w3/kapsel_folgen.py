"""Max und die Kapsel (Rätsel 9 und Aufwachen): Kapsel-Bildfolgen aus den Kapselbildern (alle auf derselben Kapsel,
nur Max eingesetzt) und der Hinweis, wo die freie Max-Figur (max_kapsel_aussteigen/-einsteigen) übernimmt.
Haltung und Timing nach Meshy Text zu Bewegung (Swift-Clips max_kapsel_aufstehen_t2m / max_kapsel_hinlegen_t2m).
Aufruf: py -3 kapsel_folgen.py <stand-ordner> <bewegungen-ordner>"""
import json, sys
from pathlib import Path
import numpy as np
from PIL import Image

ST, B = Path(sys.argv[1]), Path(sys.argv[2])
W, H = 237, 128
bild = {}
for n in ("max_kapsel", "max_kapsel_liegt_offen", "max_kapsel_halb", "max_kapsel_offen", "max_kapsel_beine_raus", "kapsel_leer_offen"):
    a = np.asarray(Image.open(ST / f"{n}.png").convert("RGBA"))
    f = np.zeros((H, W, 4), np.uint8); h, w = a.shape[:2]
    f[H - h:, (W - w) // 2:(W - w) // 2 + w] = a          # unten bündig, mittig (geschlossene Kapsel ist niedriger)
    bild[n] = f

# Fußpunkt in beine_raus: unterste Schuhpixel (rot) im Kapselbild, Übergabe an die freie Figur
b = bild["max_kapsel_beine_raus"]
rot = (b[..., 0] > 150) & (b[..., 1] < 90) & (b[..., 2] < 90) & (b[..., 3] > 0)
ys, xs = np.nonzero(rot)
fuss = [int(xs.mean()), int(ys.max())]

folgen = {
    "max_kapsel_aufstehen": ("liegt: Deckel offen, aufsetzen, Beine über den Rand; danach Kapsel leer + max_kapsel_aussteigen",
                             [("max_kapsel_liegt_offen", 3), ("max_kapsel_halb", 4), ("max_kapsel_offen", 5),
                              ("max_kapsel_beine_raus", 6), ("kapsel_leer_offen", 1)]),
    "max_kapsel_hinlegen": ("nach max_kapsel_einsteigen: auf den Rand setzen, Beine hinein, zurücklegen, Deckel zu",
                            [("max_kapsel_beine_raus", 5), ("max_kapsel_offen", 4), ("max_kapsel_halb", 4),
                             ("max_kapsel_liegt_offen", 5), ("max_kapsel", 1)]),
}
for name, (hinweis, folge) in folgen.items():
    liste = [n for n, k in folge for _ in range(k)]
    Image.fromarray(np.concatenate([bild[n] for n in liste], 1)).save(B / f"{name}.png")
    (B / f"{name}.json").write_text(json.dumps({
        "bild": [W, H], "bilder": len(liste), "ms": 120, "schleife": False, "folge": liste,
        "hinweis": hinweis, "fuss_max_frei": fuss,
        "fuss_hinweis": "Fußpunkt (Mitte unten) der freien Max-Figur in Kapselkoordinaten beim Wechsel zu/von max_kapsel_aus-/einsteigen"},
        ensure_ascii=False, indent=1), encoding="utf-8")
    print(name, len(liste), "Bilder, Fuß", fuss)
