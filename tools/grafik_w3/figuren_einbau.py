"""Welt-3-Figuren ins Spiel: Sprite-Sheets aus Reden/Ruhe, Läufen und Gesten.

Quelle ist der Übergabeordner von Sebastians PC (Branch claude/welt3-transfer, transfer/welt3/):
  reden_ruhe/<figur>_idle.png, _talk.png (+ nicken, kopf_schuetteln)   Streifen aus tools/grafik_w3/reden_ruhe.py
  bewegungen/<figur>_<geste>.png + .json                                 Streifen, jedes Bild in Spielfolge
  stand/<figur>.png                                                      Standbild (Figuren ohne Reden/Ruhe)

1. Grundblatt je Welt-3-Figur: idle und talk aus reden_ruhe (sonst das Standbild als einziges Bild).
2. Gesten dazu wie in tools/gesten_einbau.py: gleiche Bilder nur einmal (Reihenfolge in „folge“), jede
   Geste so verschoben, dass ihr bestpassendes Bild auf dem ersten Idle-Bild liegt (Umriss-Überdeckung).
   „gehen“ wird walk, „reden“/„sprechen“ wird talk; hat die Figur schon eine Mund-Schleife aus reden_ruhe, bleibt
   die talk und die Armgeste heißt rede_geste (Review 20.11., W3-09; vorher wurde die Mund-Schleife zu talk_alt und
   jeder Satz bekam dieselbe Armbewegung). Max und Pixel behalten ihr Blatt, die Welt-3-Gesten kommen dazu.
Ausgabe: game/grafik/figuren/<id>.png und game/daten/figuren/<id>.json (Format wie tools/figur.py paket).

Aufruf: python3 tools/grafik_w3/figuren_einbau.py <transfer/welt3> [figur …]
"""
import json
import sys
from pathlib import Path

import numpy as np
from PIL import Image

WURZEL = Path(__file__).resolve().parents[2]
SPIEL = WURZEL / "game"
TEXTURGRENZE = 16384

# Figur im Spiel: (Name in reden_ruhe/stand, {Zusatzbewegung: (Bilder, ms, Schleife)}, idle (Bilder, ms))
GRUNDBLATT = {
    "deckert": ("deckert", {}, None),
    "frau_regenschirm": ("frau_regenschirm", {}, None),
    "hausmeister": ("hausmeister", {}, None),
    "herr_vier": ("herr_vier", {"kopf_schuetteln": (8, 100, False)}, None),
    "kalle": ("kalle", {}, None),
    "kalle_ohne_laptop": ("kalle_ohne_laptop", {}, None),
    "klon": ("klon", {}, None),
    "max_ente": ("max_ente", {}, None),
    "morphaeus": ("morphaeus", {"nicken": (8, 110, False)}, None),
    "opa_hologramm": ("opa_hologramm", {}, None),
    "orakel_oma": ("orakel_oma", {}, None),
    "rebell": ("rebell", {}, None),
    "rebellin": ("rebellin", {}, None),
    "schmidt": ("schmidt", {}, None),
    "schmidt_ohne_brille": ("schmidt_ohne_brille", {}, None),
    "strassenmusiker_w3": ("strassenmusiker", {}, None),
    "weinender_mann": ("weinender_mann", {}, None),
    "bernd": ("bernd", {}, None),
    "mutti": ("mutti", {}, (6, 260)),
    "mutti_aus": ("mutti_aus", {}, (2, 600)),
    "piepsi": ("piepsi", {}, None),
    "schwarze_katze": ("schwarze_katze", {}, None),
}
TALK_MS = {"bernd": 160, "frau_regenschirm": 150, "max_ente": 150, "strassenmusiker_w3": 150, "weinender_mann": 150}
# Präfix im Bewegungsordner → Figur im Spiel
UMLEITUNG = {"strassenmusiker": "strassenmusiker_w3"}
UMBENENNEN = {"gehen": "walk", "reden": "talk", "sprechen": "talk"}
AUSLASSEN_ENDUNG = ("_bogen", "_maxgang")
# Gangarten stehen auf der Fußlinie und mittig, statt nach Umriss ausgerichtet (Umriss passt beim Kriechen nicht)
GAENGE = {"walk", "kriechen", "hexenschuss_gehen", "watscheln"}
# Bilddauer, die von der Quelle abweicht: Max hinkt mit kürzeren Bildern und eigenem Tempo (walk_speed in
# welt_3.gd _max_gang), sonst rutschen die Füße (Review 20.11., W3-R08-04)
MS = {("max", "hexenschuss_gehen"): 85}
# Gänge in Originalgröße: Pixels Trab (pixel_trab.py) ist wegen des hochgestellten Schwanzes höher als der sitzende Stand
NICHT_SKALIEREN = {("pixel", "walk")}


def streifen(pfad, n):
    st = np.array(Image.open(pfad).convert("RGBA"))
    w = st.shape[1] // n
    return [st[:, i * w:(i + 1) * w] for i in range(n)]


# Gehaltene Zielposen in Gesten höchstens etwa 0,6 s (Review 20.11., W3-18: 47 „vor“-Gesten hielten die Szenen
# zusammen 138 s an). Nur Haltezeiten zwischen Anfang und Ende; Warte-Gesten (Kulisse) und Zeitlupe behalten ihre.
HALTEN_MS = 600
HALTEN_AUSNAHMEN = {"haende_falten", "tippen", "umsehen", "warten", "beleidigt", "vier_finger", "zeitlupe"}


def halten_kuerzen(name, folge, ms):
    if name in HALTEN_AUSNAHMEN or name.startswith("kapsel_") or len(folge) < 3:
        return folge
    hoechstens = max(1, round(HALTEN_MS / ms))
    laeufe = []
    for i in folge:
        if laeufe and laeufe[-1][0] == i:
            laeufe[-1][1] += 1
        else:
            laeufe.append([i, 1])
    aus = []
    for k, (i, n) in enumerate(laeufe):
        if 0 < k < len(laeufe) - 1:
            n = min(n, hoechstens)
        aus += [i] * n
    return aus


def einmalig(bilder):
    einzig, folge = [], []
    for b in bilder:
        for k, e in enumerate(einzig):
            if e.shape == b.shape and np.array_equal(e, b):
                folge.append(k)
                break
        else:
            einzig.append(b)
            folge.append(len(einzig) - 1)
    return einzig, folge


def zuschneiden(bilder):
    """Leere Ränder gemeinsam abschneiden; liefert Bilder und den Versatz (links, oben) der Unterkante."""
    alle = np.any([b[..., 3] > 0 for b in bilder], axis=0)
    ys, xs = np.nonzero(alle)
    return [b[ys.min():ys.max() + 1, xs.min():xs.max() + 1] for b in bilder]


def beste_lage(idle, bilder, such=40):
    """Lage (x0, y0) der Bewegungsbilder auf der Idle-Fläche mit der besten Umriss-Überdeckung (IoU)."""
    im = idle[..., 3] > 0
    ih, iw = im.shape
    # Suche um die Fußlinie des Stands, nicht um die Zellunterkante: die Idle-Zelle hat unten bis zu 8 leere
    # Zeilen (reden_ruhe.py), bei ±6 landeten die Gesten sonst 2 px zu tief (Review 20.11., W3-16)
    boden = int(np.nonzero(im.any(axis=1))[0].max()) + 1
    best = (-1, 0, 0)
    for b in bilder:
        bm = b[..., 3] > 0
        bh, bw = bm.shape
        for dy in range(-6, 7):
            for dx in range(-such - abs(bw - iw) // 2, such + abs(iw - bw) // 2 + 1):
                x0 = iw // 2 - bw // 2 + dx
                y0 = boden - bh + dy
                ax0, ay0 = max(0, x0), max(0, y0)
                ax1, ay1 = min(iw, x0 + bw), min(ih, y0 + bh)
                if ax1 <= ax0 or ay1 <= ay0:
                    continue
                a = im[ay0:ay1, ax0:ax1]
                c = bm[ay0 - y0:ay1 - y0, ax0 - x0:ax1 - x0]
                schnitt = (a & c).sum()
                s = schnitt / max(im.sum() + bm.sum() - schnitt, 1)
                if s > best[0]:
                    best = (s, x0, y0)
    return best


def bestehendes_blatt(fig):
    d = json.load(open(SPIEL / f"daten/figuren/{fig}.json", encoding="utf-8"))
    W, H = d["bild"]
    sheet = np.array(Image.open(SPIEL / f"grafik/figuren/{fig}.png").convert("RGBA"))
    sp = int(d.get("spalten", 10 ** 9))

    def zelle(k):
        return sheet[(k // sp) * H:(k // sp + 1) * H, (k % sp) * W:(k % sp + 1) * W]
    anims = []
    for name, a in d["animationen"].items():
        anims.append([name, [(0, 0, zelle(a["von"] + i)) for i in range(a["bilder"])], a["ms"],
                      a.get("schleife", True), a.get("folge")])
    return W, H, anims


def grundblatt(quelle, fig):
    name, zusatz, idle_art = GRUNDBLATT[fig]
    rr = quelle / "reden_ruhe"
    anims = []
    if (rr / f"{name}_idle.png").exists():
        n, ms = idle_art or (4, 320)
        idle = streifen(rr / f"{name}_idle.png", n)
        anims.append(["idle", idle, ms, True])
        if (rr / f"{name}_talk.png").exists():
            anims.append(["talk", streifen(rr / f"{name}_talk.png", 4), TALK_MS.get(fig, 140), True])
        for z, (n, ms, schleife) in zusatz.items():
            anims.append([z, streifen(rr / f"{name}_{z}.png", n), ms, schleife])
    else:
        anims.append(["idle", [np.array(Image.open(quelle / "stand" / f"{name}.png").convert("RGBA"))], 320, True])
    # alle Streifen eines Grundblatts haben dieselbe Zellgröße (reden_ruhe.py) bis auf das Standbild
    H = max(b.shape[0] for _, bs, *_ in anims for b in bs)
    W = max(b.shape[1] for _, bs, *_ in anims for b in bs)
    aus = []
    for name, bs, ms, schleife in anims:
        einzig, folge = einmalig(bs)
        lagen = [((W - b.shape[1]) // 2, H - b.shape[0], b) for b in einzig]
        aus.append([name, lagen, ms, schleife, folge if folge != list(range(len(einzig))) else None])
    return W, H, aus


def gesten(quelle, ids):
    gruppen = {}
    for j in sorted((quelle / "bewegungen").glob("*.json")):
        stamm = j.stem
        if stamm.endswith(AUSLASSEN_ENDUNG) or not (j.with_suffix(".png")).exists():
            continue
        kandidaten = [i for i in list(ids) + list(UMLEITUNG) if stamm.startswith(i + "_")]
        if not kandidaten:
            print("übersprungen:", stamm)
            continue
        praefix = max(kandidaten, key=len)
        fig = UMLEITUNG.get(praefix, praefix)
        name = stamm[len(praefix) + 1:]
        gruppen.setdefault(fig, []).append((UMBENENNEN.get(name, name), j))
    return gruppen


def erstes_bild_pruefen(fig, blatt, info, namen):
    """Erstes Bild jeder neu eingebauten Geste (namen) gegen den Stand (erstes Idle-Bild): gleiche Fußlinie; ist es
    der Stand selbst (nur verschoben), muss es pixelgleich liegen. Gänge sind ausgenommen (eigene Fußlinie, mittig),
    ebenso die älteren Bewegungen von Max und Pixel (Liegen, Aufwachen, Fallen beginnen zu Recht anders)."""
    stand = blatt[info["idle"]["von"]]
    zeilen = lambda b: np.nonzero(b[..., 3].any(axis=1))[0]
    fuss = int(zeilen(stand).max())
    fehler = []
    for name, e in info.items():
        if name == "idle" or name in GAENGE or name not in namen or name.startswith("kapsel_"):
            continue   # Kapsel-Bewegungen beginnen liegend in der Kapsel
        b = blatt[e["von"] + (e.get("folge") or [0])[0]]
        if np.array_equal(b, stand):
            continue
        z = zeilen(b)
        if len(z) and int(z.max()) != fuss:
            fehler.append(f"{name}: Fußlinie {int(z.max())} statt {fuss}")
            continue
        for dy in range(-8, 9):
            for dx in range(-8, 9):
                if (dx or dy) and np.array_equal(np.roll(b, (dy, dx), axis=(0, 1)), stand):
                    fehler.append(f"{name}: erstes Bild ist der Stand, um ({-dx}, {-dy}) versetzt")
    if fehler:
        sys.exit(f"{fig}: erstes Bild einer Geste passt nicht zum Stand:\n  " + "\n  ".join(fehler))


def zusammensetzen(fig, W, H, anims, neue, bericht):
    if fig in GRUNDBLATT and any(a[0] == "talk" for a in anims):
        # Mund-Schleife aus reden_ruhe behalten, die Armgeste aus dem Posenbogen wird rede_geste (W3-09)
        neue = [("rede_geste" if n == "talk" else n, j) for n, j in neue]
    namen = {n for n, _ in neue}
    if "talk" in namen:
        for a in anims:
            if a[0] == "talk":
                a[0] = "talk_alt"
    anims = [a for a in anims if a[0] not in namen or a[0] in ("idle",)]
    idle_anim = next(a for a in anims if a[0] == "idle")
    x0, y0, b0 = idle_anim[1][0]
    idle = np.zeros((H, W, 4), np.uint8)
    idle[y0:y0 + b0.shape[0], x0:x0 + b0.shape[1]] = b0
    for name, j in neue:
        info = json.load(open(j, encoding="utf-8"))
        n = int(info["bilder"])
        bilder = streifen(j.with_suffix(".png"), n)
        einzig, folge = einmalig(bilder)
        einzig = zuschneiden(einzig)
        if name in GAENGE:
            # Läufe aus dem Teile-Rig sind teils größer als das Standbild (Max hinkend 8 %): auf die Idle-Höhe
            hoehe = lambda b: int(np.ptp(np.nonzero(b[..., 3].any(axis=1))[0])) + 1
            faktor = hoehe(idle) / float(np.median([hoehe(e) for e in einzig]))
            if faktor < 0.97 and (fig, name) not in NICHT_SKALIEREN:   # nur verkleinern: Kriechen und Tiergänge sind zu Recht flacher
                bericht.append(f"{fig}/{name}: auf {faktor:.2f} skaliert")
                einzig = [np.array(Image.fromarray(e).resize((max(1, round(e.shape[1] * faktor)),
                                                              max(1, round(e.shape[0] * faktor))), Image.NEAREST))
                          for e in einzig]
            breite = max(e.shape[1] for e in einzig)
            einzig = [np.pad(e, ((0, 0), ((breite - e.shape[1]) // 2, breite - e.shape[1] - (breite - e.shape[1]) // 2), (0, 0)))
                      for e in einzig]
            boden = np.nonzero(idle[..., 3].any(axis=1))[0].max()
            s, bx, by = 0.0, W // 2 - breite // 2, int(boden) + 1 - max(e.shape[0] for e in einzig)
        else:
            s, bx, by = beste_lage(idle, einzig)
        bericht.append(f"{fig}/{name}: Überdeckung mit Idle {s:.2f}")
        schleife = bool(info.get("schleife", name == "walk"))
        if not schleife and name not in GAENGE:
            folge = halten_kuerzen(name, folge, MS.get((fig, name), int(info["ms"])))
        anims.append([name, [(bx, by, e) for e in einzig], MS.get((fig, name), int(info["ms"])), schleife,
                      folge if folge != list(range(len(einzig))) else None])
    # neue Zellgröße: Fußpunkt (unten, Mitte von W) bleibt; links und rechts gleich viel Rand
    links = max([0] + [-x for _, bs, *_ in anims for x, y, b in bs])
    rechts = max([0] + [x + b.shape[1] - W for _, bs, *_ in anims for x, y, b in bs])
    oben = max([0] + [-y for _, bs, *_ in anims for x, y, b in bs])
    unten = max([0] + [y + b.shape[0] - H for _, bs, *_ in anims for x, y, b in bs])
    rand = max(links, rechts)
    NW, NH = W + 2 * rand, H + oben
    blatt, info, nr = [], {}, 0
    for name, bs, ms, schleife, folge in anims:
        for x, y, b in bs:
            f = np.zeros((NH, NW, 4), np.uint8)
            X, Y = x + rand, y + oben
            bh, bw = b.shape[:2]
            ya, xa = max(0, Y), max(0, X)
            yb, xb = min(NH, Y + bh), min(NW, X + bw)
            f[ya:yb, xa:xb] = b[ya - Y:yb - Y, xa - X:xb - X]
            blatt.append(f)
        e = {"von": nr, "bilder": len(bs), "ms": ms, "schleife": schleife}
        if folge:
            e["folge"] = folge
        info[name] = e
        nr += len(bs)
    if unten:
        bericht.append(f"{fig}: {unten} px unter der Fußlinie abgeschnitten")
    erstes_bild_pruefen(fig, blatt, info, namen)
    daten = {"bild": [NW, NH], "animationen": info}
    if NW * len(blatt) > TEXTURGRENZE:
        spalten = TEXTURGRENZE // NW
        reihen = -(-len(blatt) // spalten)
        bild = np.zeros((NH * reihen, NW * spalten, 4), np.uint8)
        for k, f in enumerate(blatt):
            bild[(k // spalten) * NH:(k // spalten + 1) * NH, (k % spalten) * NW:(k % spalten + 1) * NW] = f
        daten["spalten"] = spalten
    else:
        bild = np.concatenate(blatt, axis=1)
    Image.fromarray(bild, "RGBA").save(SPIEL / f"grafik/figuren/{fig}.png")
    (SPIEL / f"daten/figuren/{fig}.json").write_text(json.dumps(daten, indent=1, ensure_ascii=False) + "\n",
                                                      encoding="utf-8")
    print(fig, nr, "Bilder je", NW, "x", NH, "Blatt", bild.shape[1], "x", bild.shape[0],
          "ZU GROSS" if max(bild.shape[:2]) > TEXTURGRENZE else "")


def main():
    quelle = Path(sys.argv[1])
    nur = sys.argv[2:]
    ids = set(GRUNDBLATT) | {"max", "pixel"}
    gruppen = gesten(quelle, ids)
    bericht = []
    for fig in sorted(ids):
        if nur and fig not in nur:
            continue
        if fig in GRUNDBLATT:
            W, H, anims = grundblatt(quelle, fig)
        else:
            W, H, anims = bestehendes_blatt(fig)
        zusammensetzen(fig, W, H, anims, gruppen.get(fig, []), bericht)
    print("\n".join(bericht))


if __name__ == "__main__":
    main()
