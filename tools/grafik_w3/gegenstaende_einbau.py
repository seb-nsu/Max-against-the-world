"""Welt-3-Gegenstände ins Spiel: Inventar-Icons nach game/grafik/gegenstaende/<id>[_<zustand>].png
(Namen wie in tools/godot_raeume.py, erster Zustand mit Endung) und verkleinerte Fassungen als Props
nach game/grafik/props/<id>.png in der Größe des Platzhalters.

Aufruf: python3 tools/grafik_w3/gegenstaende_einbau.py <transfer/welt3/gegenstaende/sprites/inventar>
"""
import sys
from pathlib import Path

import numpy as np
from PIL import Image

WURZEL = Path(__file__).resolve().parents[2]
ICONS = {   # Quelle → Ziel (ohne .png)
    "telefonbuchseite": "telefonbuchseite_normal", "rote_pastille": "rote_pastille_normal",
    "blaue_pastille": "blaue_pastille_normal", "omas_kekse": "omas_kekse_kalt",
    "omas_kekse_ofenwarm": "omas_kekse_ofenwarm", "rezeptkarte": "rezeptkarte_rezeptkarte",
    "rezeptkarte_glueckskeks": "rezeptkarte_glueckskeks", "kaffeetasse": "kaffeetasse_normal",
    "schmidts_akte": "schmidts_akte_datei", "schmidts_akte_ordner": "schmidts_akte_ordner",
    "farbcode_zettel": "farbcode_zettel_normal", "morse_tabelle": "morse_tabelle_normal",
    "zugangskarte": "zugangskarte_plastikkarte", "zugangskarte_code_schluessel": "zugangskarte_code_schluessel",
    "portalgeraet": "portalgeraet_leer", "gummihuhn": "gummihuhn_harmlos", "gummihuhn_toedlich": "gummihuhn_toedlich",
    "energiezelle": "energiezelle_gluehend", "energiezelle_vereist": "energiezelle_vereist",
}
# omas_kekse_hundekuchen.png gibt es schon (Nacht-Bilder, PR #25) und bleibt
PROPS = ["gummihuhn", "kaffeetasse", "schmidts_akte", "telefonbuchseite", "sonnenbrille"]
# die Sonnenbrille ist weltenübergreifend und hat ihr Icon schon (game/grafik/gegenstaende/sonnenbrille.png)
# im Hintergrund schon gemalt (Kern: Zelle auf dem Sockel, glühend oder vereist): Prop bleibt durchsichtig
GEMALT = ["energiezelle"]


def verkleinern(bild, groesse):
    w, h = groesse
    f = min(w / bild.width, h / bild.height)
    neu = bild.resize((max(1, round(bild.width * f)), max(1, round(bild.height * f))), Image.LANCZOS)
    a = np.array(neu)
    a[..., 3] = np.where(a[..., 3] > 110, 255, 0)
    out = Image.new("RGBA", (w, h))
    out.alpha_composite(Image.fromarray(a), ((w - neu.width) // 2, h - neu.height))
    return out


def main():
    quelle = Path(sys.argv[1])
    for von, nach in ICONS.items():
        Image.open(quelle / f"{von}.png").convert("RGBA").save(WURZEL / f"game/grafik/gegenstaende/{nach}.png")
    for p in PROPS:
        platz = Image.open(WURZEL / f"game/grafik/platzhalter/prop_{p}.png")
        datei = quelle / f"{p}.png"
        if not datei.exists():
            datei = WURZEL / f"game/grafik/gegenstaende/{p}.png"
        verkleinern(Image.open(datei).convert("RGBA"), platz.size).save(WURZEL / f"game/grafik/props/{p}.png")
    for p in GEMALT:
        platz = Image.open(WURZEL / f"game/grafik/platzhalter/prop_{p}.png")
        Image.new("RGBA", platz.size).save(WURZEL / f"game/grafik/props/{p}.png")
    print(len(ICONS), "Icons,", len(PROPS) + len(GEMALT), "Props")


if __name__ == "__main__":
    main()
