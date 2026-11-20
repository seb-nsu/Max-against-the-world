"""Welt-3-Effekte aus Gemini-Vorlagen: Portal (B12), fliegendes Auto (B16), Ratte (B22), Vogelschwarm (B26);
dazu Hausmeister rollen (B30) aus dem Stand-Sprite. Aufruf:
py -3 effekte_bild.py <vorlagen-ordner (effekte/frei)> <ausgabe-ordner> <stand-ordner>"""
import json, sys, math
from pathlib import Path
import numpy as np
from PIL import Image
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
import figur

V, AUS, ST = Path(sys.argv[1]), Path(sys.argv[2]), Path(sys.argv[3])
figur.LINIEN = 0.4; figur.SAETTIGUNG = 1.2


def speichern(name, bilder, ms, schleife=True):
    h = max(b.shape[0] for b in bilder); w = max(b.shape[1] for b in bilder)
    out = []
    for b in bilder:
        f = np.zeros((h, w, 4), np.uint8); f[h - b.shape[0]:, :b.shape[1]] = b; out.append(f)
    Image.fromarray(np.concatenate(out, 1)).save(AUS / f"{name}.png")
    (AUS / f"{name}.json").write_text(json.dumps({"bild": [w, h], "bilder": len(out), "ms": ms, "schleife": schleife}, indent=1))
    print(name, len(out), "Bilder", w, "x", h)


def einzel(pfad, hoehe=None, breite=None):
    rgb, bg, rahmen = figur.blatt_lesen(str(pfad))
    r = max(rahmen, key=lambda q: (q[2] - q[0]) * (q[3] - q[1]))
    if breite:
        hoehe = round(breite * (r[3] - r[1]) / (r[2] - r[0]))
    k, a = figur.verkleinern(rgb, bg, r, hoehe)
    return figur.fertig(k, a, "keine", True, "262b44", False)


# Portal: Inhalt als Kreis, öffnet sich, bleibt, schließt sich
inhalt = einzel(V / "W3-B12_portal_inhalt.png", hoehe=92)
H, W = 128, 96
bilder = []
for rel in (0.15, 0.45, 0.8, 1.0, 1.0, 0.8, 0.45, 0.15):
    f = np.zeros((H, W, 4), np.uint8)
    ch, cw = inhalt.shape[:2]; oy, ox = (H - ch) // 2, (W - cw) // 2
    f[oy:oy + ch, ox:ox + cw] = inhalt
    yy, xx = np.mgrid[0:H, 0:W]; r = np.hypot(yy - H / 2, xx - W / 2); R = 46 * rel
    f[r > R] = 0
    ring = (r > R - 2) & (r <= R)
    f[ring] = (0xd8, 0xff, 0xe8, 255)
    f[(r > R) & (r <= R + 1.5)] = (0x63, 0xc7, 0x4d, 160)
    bilder.append(f)
speichern("W3-B12_portal", bilder, 110, schleife=False)

# Fliegendes Auto: Wackeln und Abgasflackern
auto = einzel(V / "W3-B16_auto.png", breite=48)
bilder = []
for f_, (dy, flamme) in enumerate([(0, 1.0), (1, 0.7), (1, 0.4), (0, 0.8), (-1, 0.5), (-1, 0.9)]):
    a = auto.copy()
    cyan = (a[..., 2] > 180) & (a[..., 1] > 150) & (a[..., 0] < 120) & (a[..., 3] > 0)
    xs = np.nonzero(cyan.any(0))[0]
    hinten = xs[xs < a.shape[1] // 3] if len(xs) else []
    if len(hinten):                           # Flamme hinten links je Bild verschieden lang
        grenze = hinten.max() - int((hinten.max() - hinten.min() + 1) * flamme)
        m = cyan.copy(); m[:, grenze + 1:] = False; m[:, :0] = False
        a[m & (np.arange(a.shape[1])[None, :] <= grenze)] = 0
    f = np.zeros((a.shape[0] + 2, a.shape[1], 4), np.uint8); f[1 + dy:1 + dy + a.shape[0]] = a
    bilder.append(f)
speichern("W3-B16_fliegendes_auto", bilder, 100)

# Ratte: drei Posen, letzte Bild leer
posen = figur.zyklus(str(V / "W3-B22_ratte.png"), 18, palette="keine", konturfarbe="262b44", farben=10, anzahl=3)
leer = np.zeros_like(posen[0])
speichern("W3-B22_ratte", [posen[0], posen[1], posen[0], posen[2], posen[1], leer], 90, schleife=False)

# Vogelschwarm: fünf gleiche Vögel in V-Formation, alle im gleichen Takt
voegel = figur.zyklus(str(V / "W3-B26_vogel.png"), 13, palette="keine", konturfarbe="262b44", farben=6, anzahl=3)
H, W = 38, 104
lage = [(2, 22), (22, 13), (42, 4), (62, 13), (82, 22)]
bilder = []
for i in (0, 1, 2, 2, 1, 0):
    f = np.zeros((H, W, 4), np.uint8); v = voegel[i]
    vh, vw = v.shape[:2]
    for x, y in lage:
        y2 = min(y, H - vh); x2 = min(x, W - vw)
        sl = f[y2:y2 + vh, x2:x2 + vw]; m = v[..., 3] > 0; sl[m] = v[m]
    bilder.append(f)
speichern("W3-B26_vogelschwarm", bilder, 100)

# Hausmeister rollen: Rumpf wippt, Räder bleiben, ein Pixel Rad-Glanz wandert
st = np.asarray(Image.open(ST / "hausmeister.png").convert("RGBA"))
h = st.shape[0]; rad_ab = h - 12
bilder = []
for i, dy in enumerate((0, -1, -1, 0, -1, -1)):
    f = np.zeros((h + 2, st.shape[1], 4), np.uint8)
    f[2 + dy:2 + dy + rad_ab] = np.where(st[:rad_ab, :, 3:4] > 0, st[:rad_ab], f[2 + dy:2 + dy + rad_ab])
    unten = st[rad_ab:].copy()
    ziel = f[2 + rad_ab:2 + h]; m = unten[..., 3] > 0; ziel[m] = unten[m]
    bilder.append(f)
speichern("W3-B30_hausmeister_rollen", bilder, 110)
