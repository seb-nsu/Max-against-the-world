"""Stadtstraße: rotes Auto in Seitenansicht, fährt im Takt (W3-B54). Vorlage von Gemini im Stil der parkenden Autos
(effekte/frei/W3-B54_auto_seite.png), auf Spielgröße gebracht; Radkappen drehen sich, die Karosserie federt um einen Pixel.
Godot schickt drei Kopien im gleichen Abstand und gleichen Tempo von links nach rechts (Lage in der Platzierung der
Stadtstraße). Aufruf: py -3 effekte_auto_takt.py <vorlage.png> <ausgabe-ordner>"""
import json, sys, math
from pathlib import Path
import numpy as np
from PIL import Image
from scipy import ndimage
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import figur

figur.LINIEN = 0.4; figur.SAETTIGUNG = 1.2
rgb, bg, rahmen = figur.blatt_lesen(sys.argv[1])
r = max(rahmen, key=lambda q: (q[2] - q[0]) * (q[3] - q[1]))
BREITE = 160
k, a = figur.verkleinern(rgb, bg, r, round(BREITE * (r[3] - r[1]) / (r[2] - r[0])))
auto = figur.fertig(k, a, "keine", True, "262b44", False)
H, W = auto.shape[:2]

# Radkappen: helle, graue Flecken im unteren Drittel
c = auto[..., :3].astype(int); hell = c.sum(-1) > 450; grau = (c.max(-1) - c.min(-1)) < 40
kappe = hell & grau & (auto[..., 3] > 0); kappe[:int(H * 0.6)] = False
lab, n = ndimage.label(kappe); gr = ndimage.sum(kappe, lab, range(1, n + 1))
mitten = [ndimage.center_of_mass(kappe, lab, i + 1) for i in np.argsort(gr)[-2:]]
rad_unten = int(H * 0.62)

bilder = []
for f in range(4):
    b = np.zeros((H + 1, W, 4), np.uint8)
    feder = 1 if f % 2 else 0
    b[1 - feder:1 - feder + rad_unten] = auto[:rad_unten]        # Karosserie federt
    b[1 + rad_unten:1 + H] = auto[rad_unten:]                     # Räder bleiben am Boden
    if feder:                                                     # frei gewordene Zeile füllen (Review W3-NS-01)
        b[rad_unten] = auto[rad_unten - 1]
    for cy, cx in mitten:                                         # Speiche dreht sich
        w = f * math.pi / 2
        for t in (1, 2):
            yy, xx = int(round(cy + 1 + math.sin(w) * t)), int(round(cx + math.cos(w) * t))
            if 0 <= yy < H + 1 and 0 <= xx < W and b[yy, xx, 3]:
                b[yy, xx, :3] = (0x26, 0x2b, 0x44)
    bilder.append(b)
AUS = Path(sys.argv[2])
Image.fromarray(np.concatenate(bilder, 1)).save(AUS / "W3-B54_auto_im_takt.png")
(AUS / "W3-B54_auto_im_takt.json").write_text(json.dumps({
    "bild": [W, H + 1], "bilder": 4, "ms": 90, "schleife": True, "raum": "W3-R06_stadtstrasse",
    "hinweis": "drei Kopien, gleicher Abstand (440 px), gleiches Tempo (60 px/s), links nach rechts; Unterkante auf y 304, "
               "hinter den Figuren; nachts dieselben Autos mit dunkelblauem Farbfilter"}, indent=1, ensure_ascii=False), encoding="utf-8")
print("W3-B54_auto_im_takt", W, "x", H + 1, "Radkappen", [tuple(round(v) for v in m) for m in mitten])
