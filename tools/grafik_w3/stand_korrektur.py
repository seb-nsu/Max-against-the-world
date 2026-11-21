"""Korrekturen an Welt-3-Stand-Sprites aus Gemini-Varianten (Review 20.11.2026: W3-NS-03, W3-NS-04, W3-R05-02).

Die Variante ist eine Bearbeitung des Konzeptblatts („Edit this image. Change only …“). Sie geht durch denselben Weg
wie der Stand (magenta_frei.py, tools/figur.py sprite --palette keine --kontur 262b44, gleiche Höhe), dann wird
**nur die geänderte Stelle** in das bestehende Stand-Sprite gesetzt, Farben auf die Palette des Stands gezogen.
Innerhalb der Stelle bleiben Pixel, die sich kaum unterscheiden, beim alten Wert (Stoffrauschen bleibt gleich).

  frau_regenschirm      Mund geschlossen (x 36–49, y 31–47)
  schmidt (+ _ohne_brille)  Fußpartie ab Zeile 166: beide Hausschuhe nach vorn, kein Zipfel und keine Ferse hinten
  hausmeister           Mopp richtig herum (rechts der Figur außer der Faust, dazu der Boden ab Zeile 170),
                        rundes Auge gelb mit Bernsteinrand und Glanzpunkt

Aufruf: py -3 stand_korrektur.py <welt3-asset-ordner> <ziel-stand-ordner> <arbeitsordner>
Varianten liegen in <welt3>/korrektur_20-11/, die alten Stände in <welt3>/stand/.
"""
import subprocess
import sys
from pathlib import Path

import numpy as np
from PIL import Image

TOOLS = Path(__file__).resolve().parent.parent
W3, ZIEL, ARB = (Path(a) for a in sys.argv[1:4])
ZIEL.mkdir(parents=True, exist_ok=True)
ARB.mkdir(parents=True, exist_ok=True)
NAH = 60   # Summe der Farbabstände, unter der ein Pixel als unverändert gilt

VARIANTEN = {  # Figur: (Variante, Höhe, magenta_frei ohne Entfärben)
    "frau_regenschirm": ("W3-F16_frau_regenschirm_mund_zu.png", 199, False),
    "schmidt": ("W3-F04_agent_schmidt_fuesse.png", 201, True),   # rosa Hausschuhe nicht entfärben
    "hausmeister": ("W3-F06_roboter_hausmeister_mopp.png", 196, False),
}


def variante_als_sprite(fig):
    datei, hoehe, ohne = VARIANTEN[fig]
    frei, sprite = ARB / f"{fig}_variante_frei.png", ARB / f"{fig}_variante.png"
    args = ["py", "-3", str(TOOLS / "grafik_w3" / "magenta_frei.py"), str(W3 / "korrektur_20-11" / datei), str(frei), "1000"]
    subprocess.run(args + (["ohne"] if ohne else []), check=True, capture_output=True)
    subprocess.run(["py", "-3", str(TOOLS / "figur.py"), "sprite", str(frei), str(sprite), "--hoehe", str(hoehe),
                    "--palette", "keine", "--kontur", "262b44"], check=True, capture_output=True)
    return np.array(Image.open(sprite).convert("RGBA"))


def einsetzen(alt, var, maske):
    pal = np.unique(alt[alt[..., 3] > 0][:, :3], axis=0).astype(int)
    neu = alt.copy()
    v = np.zeros_like(alt)
    v[:, :min(var.shape[1], alt.shape[1])] = var[:alt.shape[0], :alt.shape[1]]
    for y, x in zip(*np.nonzero(maske)):
        p = v[y, x]
        if p[3] == 0:
            neu[y, x] = 0
            continue
        farbe = pal[((pal - p[:3].astype(int)) ** 2).sum(1).argmin()]
        if alt[y, x, 3] and np.abs(alt[y, x, :3].astype(int) - farbe).sum() < NAH:
            continue
        neu[y, x, :3] = farbe
        neu[y, x, 3] = 255
    return neu


def lade(fig):
    return np.array(Image.open(W3 / "stand" / f"{fig}.png").convert("RGBA"))


def speichern(fig, bild):
    Image.fromarray(bild, "RGBA").save(ZIEL / f"{fig}.png")
    print(fig, "geändert:", int((bild != lade(fig)).any(axis=2).sum()), "Pixel")


# Frau mit Regenschirm: Mund
alt = lade("frau_regenschirm")
m = np.zeros(alt.shape[:2], bool)
m[31:48, 36:50] = True
speichern("frau_regenschirm", einsetzen(alt, variante_als_sprite("frau_regenschirm"), m))

# Schmidt und Schmidt ohne Brille: dieselbe Fußpartie
var = variante_als_sprite("schmidt")
for fig in ("schmidt", "schmidt_ohne_brille"):
    alt = lade(fig)
    m = np.zeros(alt.shape[:2], bool)
    m[166:, :] = True
    speichern(fig, einsetzen(alt, var, m))

# Hausmeister: Mopp und Auge
alt = lade("hausmeister")
H, W = alt.shape[:2]
yy, xx = np.mgrid[0:H, 0:W]
faust = (xx >= 88) & (xx <= 108) & (yy >= 81) & (yy <= 102)
m = (((xx >= 88) & ~faust) | ((yy >= 170) & (xx >= 62))) & (yy < 195)
neu = einsetzen(alt, variante_als_sprite("hausmeister"), m)
cx, cy, rx, ry = 76.3, 23.6, 3.6, 4.9      # Auge innerhalb des dunklen Rings
d = np.hypot((xx - cx) / rx, (yy - cy) / ry)
neu[d < 0.55, :3] = (0xfe, 0xe7, 0x61)
neu[(d >= 0.55) & (d < 0.85), :3] = (0xe4, 0xa6, 0x72)
neu[21, 75, :3] = (0xff, 0xff, 0xff)
speichern("hausmeister", neu)
