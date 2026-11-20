"""Pixels Trab mit echtem Schritt (Review 20.11., W3-NS-02), ohne neue Posen: aus einem Bild des alten Gangs.

Der alte `walk` (5 Bilder, seit Welt 1) trippelte auf der Stelle: die aufgesetzten Pfoten wanderten nur 11 Sheet-px je
Zyklus nach hinten, der Körper aber 80, also rund 86 % Rutschen. Hier bleibt der Körper aus Bild 4 des alten Gangs
(Kopf, Rumpf, Schwanz unverändert), nur die vier Beine werden je Bild geschert: oben fest am Rumpf, die Pfote um
`versatz` Pixel verschoben, in der Schwungphase um `hub` Zeilen angehoben. Diagonale Paare (Hinterbein vorn mit
Vorderbein hinten und umgekehrt) wie beim Trab, jede Pfote 5 von 8 Bildern am Boden, so stehen immer zwei bis vier
Pfoten. Am Boden wandert jede Pfote je Bild genau SCHRITT Sheet-px nach hinten.

Ohne Rutschen gilt (die Raum-„skala“ wird in CQRaum ausgeglichen, Bilddauer und Tempo skalieren gleich):
    SCHRITT = walk_speed × Bilddauer[s]          → Rutschen = 1 − SCHRITT / (walk_speed × Bilddauer)
Mit SCHRITT 3, walk_speed 110 und 30 ms: 1 − 3 / 3,3 = 9 %.

Aufruf: py -3 pixel_trab.py <ausgabe-ordner> [git-stand]
Liest Bild 4 des alten `walk` aus game/grafik/figuren/pixel.png im git-Stand (Standard a65f55e0, vor dieser Änderung)
und schreibt pixel_gehen.png und .json in den Ausgabeordner (Bewegungsordner für figuren_einbau.py, „gehen“ wird walk).
"""
import io
import json
import subprocess
import sys
from pathlib import Path

import numpy as np
from PIL import Image

WURZEL = Path(__file__).resolve().parents[2]
ZELLE, SPALTEN, ALT_BILD = (126, 103), 130, 6 + 4   # alter walk: von 6, Bild 4 hat vier getrennte Beine
SCHRITT = 3            # Sheet-px je Bild, die eine aufgesetzte Pfote nach hinten wandert
MS = 30
OBEN = 93              # erste Zeile der Beine (darüber Rumpf)
# Bein: (Spalten von, bis), vorn = Seite zum Betrachter (hell, wird zuletzt gezeichnet), Phase im Zyklus
BEINE = {
    "hinten_nah": ((38, 51), True, 0),
    "vorn_fern": ((82, 95), False, 0),
    "hinten_fern": ((52, 63), False, 4),
    "vorn_nah": ((64, 81), True, 4),
}
# je Phase: (Versatz der Pfote, Hub); 0–4 am Boden (5 Bilder, je SCHRITT nach hinten), 5–7 Schwung nach vorn
STANCE = [2 * SCHRITT - i * SCHRITT for i in range(5)]          # +6, +3, 0, −3, −6
SCHWUNG = [(-3, 2), (0, 3), (3, 2)]
ABLAUF = [(v, 0) for v in STANCE] + SCHWUNG
# Rumpf hebt sich um 1 px, wenn beide Paare unter dem Körper stehen (Versatz 0 bei einem Paar am Boden)
WIPPEN = [0, 0, -1, 0, 0, 0, -1, 0]


def altes_bild(stand):
    roh = subprocess.run(["git", "show", f"{stand}:game/grafik/figuren/pixel.png"], cwd=WURZEL,
                         capture_output=True, check=True).stdout
    sheet = np.array(Image.open(io.BytesIO(roh)).convert("RGBA"))
    w, h = ZELLE
    k = ALT_BILD
    return sheet[(k // SPALTEN) * h:(k // SPALTEN + 1) * h, (k % SPALTEN) * w:(k % SPALTEN + 1) * w].copy()


def bein_zeichnen(ziel, bein, x0, unten, versatz, hub, wippen):
    """Bein (Pixel ab Zeile OBEN) geschert einsetzen: Zeile y rückt um versatz·t nach rechts und um hub·t + wippen·(1−t)
    nach oben (t = 0 an der Hüfte, 1 an der Pfote). Wird das Bein dabei länger (Rumpf wippt hoch), füllt die Zeile
    darüber die frei gewordene Zielzeile, damit kein Streifen durchs Bein läuft."""
    h = unten - OBEN
    lage = {}
    for y in range(OBEN, unten + 1):
        t = (y - OBEN) / h if h else 1.0
        lage[y] = (int(np.floor(versatz * t + 0.5)), y - int(np.floor(hub * t + 0.5)) + int(np.floor(wippen * (1 - t) + 0.5)))
    for y in range(OBEN, unten + 1):
        dx, Y0 = lage[y]
        Y1 = lage[y + 1][1] - 1 if y < unten else Y0
        zeile = bein[y]
        for Y in range(Y0, max(Y0, Y1) + 1):
            for x in np.nonzero(zeile[:, 3])[0]:
                X = x + x0 + dx
                if 0 <= X < ziel.shape[1] and 0 <= Y < ziel.shape[0]:
                    ziel[Y, X] = zeile[x]


def main():
    aus = Path(sys.argv[1])
    stand = sys.argv[2] if len(sys.argv) > 2 else "a65f55e0"
    alt = altes_bild(stand)
    alt[alt[..., 3] == 0] = 0
    rumpf = alt.copy()
    rumpf[OBEN:] = 0
    beine = {}
    for name, ((a, b), nah, phase) in BEINE.items():
        teil = np.zeros_like(alt)
        teil[OBEN:, a:b + 1] = alt[OBEN:, a:b + 1]
        unten = int(np.nonzero(teil[..., 3].any(axis=1))[0].max())
        beine[name] = (teil, unten, nah, phase)
    n = len(ABLAUF)
    bilder = []
    for f in range(n):
        b = np.zeros_like(alt)
        w = WIPPEN[f]
        # Rumpf (mit Wippen), dann ferne Beine, dann nahe Beine
        if w:
            b[:w] = rumpf[-w:]
        else:
            b[:] = rumpf
        for nah in (False, True):
            for name, (teil, unten, n_, phase) in beine.items():
                if n_ != nah:
                    continue
                versatz, hub = ABLAUF[(f - phase) % n]
                bein_zeichnen(b, teil, 0, unten, versatz, hub, w)
        bilder.append(b)
    aus.mkdir(parents=True, exist_ok=True)
    Image.fromarray(np.concatenate(bilder, axis=1), "RGBA").save(aus / "pixel_gehen.png")
    (aus / "pixel_gehen.json").write_text(json.dumps({
        "bild": list(ZELLE), "bilder": n, "ms": MS, "schleife": True, "folge": [str(i + 1) for i in range(n)],
        "hinweis": f"Trab aus Bild 4 des alten walk ({stand}), Beine geschert, {SCHRITT} px je Bild am Boden; "
                   f"walk_speed 110 (character_pixel.tscn), Rutschen 1 - {SCHRITT}/(110*{MS / 1000:g})"},
        indent=1, ensure_ascii=False), encoding="utf-8")
    print("pixel_gehen", n, "Bilder", ZELLE, "Schritt", SCHRITT, "ms", MS)


if __name__ == "__main__":
    main()
