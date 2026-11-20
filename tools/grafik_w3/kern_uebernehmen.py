"""Kern von M.U.T.T.I. (W3-R12): Sebastians fertige Pixelfassungen übernehmen.

Die Zustände „vereist“ und „Sockel leer“ sind dort schon als Bearbeitung des Grundbilds mit nur
eingesetzter Zelle gebaut (zustand_einsetzen.py, gleiche Palette), die Code-Sicht ist gemalt
(W3-R12_kern_code, Etiketten leer; die Wörter setzt welt_3.gd).

Aufruf: python3 tools/grafik_w3/kern_uebernehmen.py <transfer/welt3/raeume/pixel>
"""
import sys
from pathlib import Path

from PIL import Image

WURZEL = Path(__file__).resolve().parents[2]
DATEIEN = {
    "W3-R12_kern.png": "game/grafik/hintergruende/w3_bg_kern_v01.png",
    "W3-R12b_kern_vereist.png": "game/grafik/hintergruende/w3_bg_kern_vereist_v01.png",
    "W3-R12c_kern_sockel_leer.png": "game/grafik/hintergruende/w3_bg_kern_sockel_leer_v01.png",
    "W3-R12_kern_code.png": "game/grafik/oberflaeche/code_sicht/kern.png",
}


def main():
    quelle = Path(sys.argv[1])
    for von, nach in DATEIEN.items():
        im = Image.open(quelle / von).convert("RGB")
        assert im.size == (640, 360), (von, im.size)
        im.save(WURZEL / nach)
        print(nach)


if __name__ == "__main__":
    main()
