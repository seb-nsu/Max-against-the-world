"""Roll-Streifen des Hausmeisters (W3-B30) aus dem korrigierten Stand (Mopp am Boden, gelbes Auge sichtbar).

Gleiche Bewegung wie bisher in effekte_bild.py (Rumpf wippt um ein Pixel, Räder bleiben stehen), aber aus Bild 0
des Spiel-Blatts game/grafik/figuren/hausmeister.png. So stimmen Mopp und Größe mit der Figur überein (die Szene
skaliert den Streifen mit der Figur; der alte Streifen war aus dem kleineren Erststand und hatte den Mopp oben).
Aufruf: py -3 tools/grafik_w3/hausmeister_rollen.py
"""
import json
from pathlib import Path

import numpy as np
from PIL import Image

W = Path(__file__).resolve().parents[2]
blatt = np.asarray(Image.open(W / "game/grafik/figuren/hausmeister.png").convert("RGBA"))
bw, bh = json.loads((W / "game/daten/figuren/hausmeister.json").read_text(encoding="utf-8"))["bild"]
st = blatt[:bh, :bw]
zeilen = np.nonzero(st[..., 3].any(1))[0]
unten = int(zeilen.max()) + 1
RAD = 14                                   # untere Zeilen (Räder) bleiben stehen
rad_ab = unten - RAD
bilder = []
for dy in (0, -1, -1, 0, -1, -1):
    f = np.zeros((bh, bw, 4), np.uint8)
    oben = st[:rad_ab]
    if dy < 0:
        f[:rad_ab + dy] = np.where(oben[-dy:, :, 3:4] > 0, oben[-dy:], f[:rad_ab + dy])
    else:
        f[:rad_ab] = oben
    rad = st[rad_ab:]
    m = rad[..., 3] > 0
    f[rad_ab:][m] = rad[m]
    bilder.append(f)
Image.fromarray(np.concatenate(bilder, 1)).save(W / "game/grafik/ambiente/w3_hausmeister_rollen.png")
print("w3_hausmeister_rollen", len(bilder), "Bilder", bw, "x", bh)
