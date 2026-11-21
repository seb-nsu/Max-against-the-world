"""Code-Sicht (Welt 3): der Hintergrund eines Raums als grüne Umrisse auf Schwarz.

Grafik-Konzept (grafik/welt-3.md, Code-Sicht): dieselbe Szene nur als leuchtend grüne Umrisse auf
schwarzem Grund, leichte Rasterzeilen. Die Wörter auf den Etiketten setzt das Spiel selbst
(welt_3.gd, CODE_ETIKETTEN), damit sie übersetzt werden können.

Umrisse: Helligkeitssprung zu einem Nachbarpixel über der Schwelle; starke Sprünge hell, schwache
dunkler. Ohne Bild-KI, nur aus dem fertigen Hintergrund.

Aufruf: python3 tools/grafik_w3/code_sicht.py <raum_id> [<raum_id> …]
        (liest game/grafik/hintergruende/w3_bg_<raum>_v02.png (zweite Fassung, AP-09), schreibt game/grafik/oberflaeche/code_sicht/<raum>.png)
"""
import sys
from pathlib import Path

import numpy as np
from PIL import Image

WURZEL = Path(__file__).resolve().parents[2]
HELL = np.array([0x63, 0xff, 0x7a])     # leuchtendes Grün
DUNKEL = np.array([0x1e, 0x8a, 0x3c])   # schwache Kanten
GRUND = np.array([0x05, 0x0d, 0x08])    # fast Schwarz, leicht grün
VERSION = "v02"                          # Fassung der Hintergründe (raeume_pixelieren.py)
# Vordergrundteile, die aus dem Hintergrund ausgeschnitten sind, für die Umrisse wieder einsetzen
EINSETZEN = {"stadtstrasse": [("game/grafik/props/w3_nachttisch_v02.png", 150, 262)]}


def umrisse(rgb):
    lum = rgb.astype(np.float32) @ np.array([0.299, 0.587, 0.114], np.float32)
    d = np.zeros_like(lum)
    d[:, 1:] = np.maximum(d[:, 1:], np.abs(lum[:, 1:] - lum[:, :-1]))
    d[1:, :] = np.maximum(d[1:, :], np.abs(lum[1:, :] - lum[:-1, :]))
    # dunkle Konturlinien der Vorlage (schwarze Outlines) zählen immer als Kante
    kontur = lum < 0.45 * np.median(lum)
    stark = (d > 60) | (kontur & (d > 20))
    schwach = (d > 28) & ~stark
    return stark, schwach


def main():
    for raum in sys.argv[1:]:
        quelle = WURZEL / f"game/grafik/hintergruende/w3_bg_{raum}_{VERSION}.png"
        bild = Image.open(quelle).convert("RGBA")
        for datei, x, y in EINSETZEN.get(raum, []):
            bild.alpha_composite(Image.open(WURZEL / datei).convert("RGBA"), (x, y))
        rgb = np.asarray(bild.convert("RGB"))
        stark, schwach = umrisse(rgb)
        out = np.empty_like(rgb)
        out[:] = GRUND
        out[schwach] = DUNKEL
        out[stark] = HELL
        # Rasterzeilen: jede dritte Zeile etwas dunkler
        out[::3] = (out[::3] * 0.7).astype(np.uint8)
        ziel = WURZEL / f"game/grafik/oberflaeche/code_sicht/{raum}.png"
        ziel.parent.mkdir(parents=True, exist_ok=True)
        Image.fromarray(out).save(ziel)
        print(ziel.relative_to(WURZEL), f"{stark.mean() * 100:.1f} % Umriss")


if __name__ == "__main__":
    main()
