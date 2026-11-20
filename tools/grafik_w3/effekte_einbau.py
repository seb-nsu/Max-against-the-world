"""Welt-3-Effektstreifen ins Spiel (game/grafik/ambiente/w3_*.png).

Die gemalten Streifen (W3-Bxx, Übergabeordner transfer/welt3/effekte/fertig) sind teils Ausschnitte
aus Sebastians Probe-Pixelfassung der Räume („lage“ = linke obere Ecke im Hintergrund). Damit am
Rand nichts absticht, bleibt nur sichtbar, was sich zwischen den Bildern ändert; diese Pixel kommen
auf die Farben des eingebauten Hintergrunds. Freie Effekte (Auto, Ratte, Regen …) bleiben, wie sie sind.

Aufruf: python3 tools/grafik_w3/effekte_einbau.py <transfer/welt3/effekte/fertig>
Gibt die Zeilen für tools/layout/welt-3.yaml (effekte) aus; pos ist der Fußpunkt unten in der Mitte.
"""
import json
import sys
from pathlib import Path

import numpy as np
from PIL import Image

WURZEL = Path(__file__).resolve().parents[2]
ZIEL = WURZEL / "game/grafik/ambiente"
RAUM = {"W3-R01_unterstadt": "unterstadt_strasse", "W3-R02_apothekengasse": "apothekengasse",
        "W3-R03_widerstandsbasis": "widerstandsbasis", "W3-R04_kuehlung": "kuehlung",
        "W3-R05_laboreingang": "laboreingang", "W3-R07_kueche_orakel": "kueche_orakel",
        "W3-R08_buero_50": "buero_50", "W3-R09_testkammer_1": "testkammer_1",
        "W3-R10_testkammer_2": "testkammer_2", "W3-R11_testkammer_3": "testkammer_3",
        "W3-R06_stadtstrasse": "stadtstrasse", "W3-R06b_stadtstrasse_nacht": "stadtstrasse_nacht",
        "W3-R12_kern": "kern"}
FREI = ["W3-B11_verwandlung", "W3-B12_portal", "W3-B13_regen", "W3-B14_schnee", "W3-B15_hologramm",
        "W3-B16_fliegendes_auto", "W3-B22_ratte", "W3-B26_vogelschwarm", "W3-B30_hausmeister_rollen",
        "W3-B45_verwandlung_figur", "W3-B54_auto_im_takt"]

# Läufe aus dem Bewegungsordner, die als Kulisse durchs Bild ziehen (Stadtstraße: Passanten im
# Gleichschritt, die schwarze Katze zweimal gleich)
KULISSE = {"passant_gehen": "w3_passant_gehen", "schwarze_katze_gehen": "w3_schwarze_katze_gehen"}


def name(stamm):
    return "w3_" + stamm.split("_", 1)[1]


def main():
    quelle = Path(sys.argv[1])
    for j in sorted(quelle.glob("*.json")):
        if not j.with_suffix(".png").exists():
            continue   # Platzierung (W3-R06_platzierung.json) ist kein Streifen
        info = json.load(open(j, encoding="utf-8"))
        st = np.array(Image.open(j.with_suffix(".png")).convert("RGBA"))
        w, h = info["bild"]
        n = int(info["bilder"])
        bilder = np.stack([st[:h, i * w:(i + 1) * w] for i in range(n)])
        raum = RAUM.get(info.get("raum", "")) if "lage" in info else None
        if raum:
            x, y = info["lage"]
            bg = np.asarray(Image.open(WURZEL / f"game/grafik/hintergruende/w3_bg_{raum}_v01.png").convert("RGB"))
            pal = np.unique(bg.reshape(-1, 3), axis=0).astype(np.int32)
            rgb = bilder[..., :3].astype(np.int32)
            diff = np.abs(rgb - rgb[:1]).sum(-1).max(0)
            # leise Änderungen (Ziffern des Radioweckers blinken) mit kleinerer Schwelle
            aendert = diff > min(24, max(4, int(diff.max()) // 2))
            # etwas Rand dazu, damit weiche Übergänge nicht abreißen
            p = np.pad(aendert, 1)
            aendert = aendert | p[:-2, 1:-1] | p[2:, 1:-1] | p[1:-1, :-2] | p[1:-1, 2:]
            flach = rgb.reshape(-1, 3)
            naechste = pal[np.argmin(((flach[:, None, :] - pal[None]) ** 2).sum(-1), axis=1)]
            rgb = naechste.reshape(rgb.shape)
            alpha = np.where(aendert[None] & (bilder[..., 3] > 0), 255, 0)
            bilder = np.concatenate([rgb, alpha[..., None]], -1).astype(np.uint8)
            anteil = aendert.mean() * 100
            pos = [x + w // 2, y + h]
            print(f"{raum}: - {{art: bild, bild: res://grafik/ambiente/{name(j.stem)}.png, bilder: {n}, "
                  f"pos: {pos}, fps: {round(1000 / info['ms'])}}}   # {j.stem.split('_')[0]} ({anteil:.0f} % bewegt)")
        elif j.stem in FREI:
            print(f"frei: {name(j.stem)}.png {w}x{h}, {n} Bilder, {info['ms']} ms, Schleife {info.get('schleife')}")
        else:
            continue
        Image.fromarray(np.concatenate(list(bilder), 1), "RGBA").save(ZIEL / f"{name(j.stem)}.png")
    bew = quelle.parent.parent / "bewegungen"
    for von, nach in KULISSE.items():
        info = json.load(open(bew / f"{von}.json", encoding="utf-8"))
        Image.open(bew / f"{von}.png").convert("RGBA").save(ZIEL / f"{nach}.png")
        print(f"Kulisse: {nach}.png {info['bild']}, {info['bilder']} Bilder, {info['ms']} ms")


if __name__ == "__main__":
    main()
