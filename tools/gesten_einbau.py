"""Gesten aus runde2/bewegungen in die Figuren-Sheets des Spiels packen.
Kopie aus E:/Game Engine/Grafiken/3d/skripte (läuft lokal; Pfade zeigen auf die Asset-Ordner auf Sebastians Rechner).

Je Figur bleiben alle bestehenden Animationen (sie sind im Sheet schon zueinander ausgerichtet: Fußpunkt unten
in der Bildmitte). Jede Bewegung <id>_<name>.png/.json kommt als Animation <name> dazu:
- Ausrichtung: jede Bewegung wird so verschoben, dass ihr bestpassendes Bild möglichst genau auf dem ersten
  Idle-Bild liegt (Überdeckung der Umrisse, Suche über waagrechte und senkrechte Verschiebung). So springt die
  Figur beim Wechsel zwischen Stehen und Geste nicht, auch wenn Gegenstände (Kessel, Ziege) dabei sind.
- Gleiche Bilder werden nur einmal gespeichert, die Abspielreihenfolge steht in "folge".
- "reden"/"reden_kelle" wird zur Sprech-Animation talk (die alte heißt danach talk_alt).
- Die Zelle wächst bei Bedarf links/rechts gleichmäßig und nach oben; der Fußpunkt bleibt unten in der Mitte.
Aufruf: py gesten_einbau.py [figur …]   (ohne Angabe: alle)"""
import json, sys
from pathlib import Path
import numpy as np
from PIL import Image

BEW = Path("E:/Game Engine/Grafiken/assets/runde2/bewegungen")
SPIEL = Path("E:/Claude/cq-einbau/game")
UMLEITUNG = {"archimedes_heureka": ("archimedes_handtuch", "heureka_posen"), "hermes_joggen": ("hermes", "joggen_posen")}
TALK = {"reden", "reden_kelle"}
IDLE_ERSATZ = {"sobek": "treiben"}   # Figur: Bewegung, die das alte Stand-Bild ersetzt (altes heißt idle_alt)
AUSLASSEN = {"zeldina_zauberstab_einsetzen"}   # anderes Kostüm (Finale), braucht eigenes Sprite
ids = sorted(p.stem for p in (SPIEL / "daten/figuren").glob("*.json"))


def figur_von(stamm):
    if stamm in UMLEITUNG:
        return UMLEITUNG[stamm]
    passend = [i for i in ids if stamm.startswith(i + "_")]
    if not passend:
        return None, None
    i = max(passend, key=len)
    return i, stamm[len(i) + 1:]


def beste_lage(idle, bilder, such=40):
    """Verschiebung (dx, dy) eines Bilds der Bewegung gegenüber dem Idle-Bild (beides auf gemeinsamer Fläche),
    die die Umrisse am besten überdeckt (IoU); dy nur klein, da die Füße meist auf der Linie stehen."""
    im = idle[..., 3] > 0
    ih, iw = im.shape
    best = (-1, 0, 0)
    for b in bilder:
        bm = b[..., 3] > 0
        bh, bw = bm.shape
        for dy in range(-6, 7):
            for dx in range(-such - abs(bw - iw) // 2, such + abs(iw - bw) // 2 + 1):
                # b liegt so, dass seine Unterkante bei ih - 1 + dy und seine Mitte bei iw/2 + dx sitzt
                x0 = iw // 2 - bw // 2 + dx; y0 = ih - bh + dy
                ax0, ay0 = max(0, x0), max(0, y0); ax1, ay1 = min(iw, x0 + bw), min(ih, y0 + bh)
                if ax1 <= ax0 or ay1 <= ay0:
                    continue
                a = im[ay0:ay1, ax0:ax1]; c = bm[ay0 - y0:ay1 - y0, ax0 - x0:ax1 - x0]
                schnitt = (a & c).sum(); verein = im.sum() + bm.sum() - schnitt
                s = schnitt / max(verein, 1)
                if s > best[0]:
                    best = (s, x0, y0)
    return best


FREIGABE = None
for arg in list(sys.argv[1:]):
    if arg.startswith("--freigabe="):
        FREIGABE = set(Path(arg.split("=", 1)[1]).read_text(encoding="utf-8").split())
        sys.argv.remove(arg)
gruppen = {}
for j in sorted(BEW.glob("*.json")):
    if FREIGABE is not None and j.stem not in FREIGABE:
        continue
    if j.stem in AUSLASSEN:
        print("ausgelassen:", j.stem); continue
    fig, name = figur_von(j.stem)
    if fig is None or not (BEW / f"{j.stem}.png").exists():
        print("übersprungen:", j.stem); continue
    gruppen.setdefault(fig, []).append((name, j))

bericht = []
for fig in (sys.argv[1:] or sorted(gruppen)):
    d = json.load(open(SPIEL / f"daten/figuren/{fig}.json", encoding="utf-8"))
    W, H = d["bild"]; sheet = np.array(Image.open(SPIEL / f"grafik/figuren/{fig}.png").convert("RGBA"))
    SP = int(d.get("spalten", 10 ** 9))
    zelle = lambda k: sheet[(k // SP) * H:(k // SP + 1) * H, (k % SP) * W:(k % SP + 1) * W]
    neu_namen = {n for n, _ in gruppen.get(fig, [])}
    anims = []          # (name, [bilder in Zell-Koordinaten (x0, y0, bild)], ms, schleife, folge)
    for name, a in d["animationen"].items():
        if (name in neu_namen and name not in ("talk", "idle")) or (name == "talk_alt" and neu_namen & TALK) or (name == "idle_alt" and IDLE_ERSATZ.get(fig) in neu_namen):
            continue
        ziel = "talk_alt" if (name == "talk" and neu_namen & TALK) else name
        if name == "idle" and IDLE_ERSATZ.get(fig) in neu_namen:
            ziel = "idle_alt"
        anims.append((ziel, [(0, 0, zelle(a["von"] + i)) for i in range(a["bilder"])], a["ms"], a.get("schleife", True), a.get("folge")))
    idle = zelle(d["animationen"]["idle"]["von"])
    for name, j in gruppen.get(fig, []):
        info = json.load(open(j, encoding="utf-8"))
        st = np.array(Image.open(BEW / f"{j.stem}.png").convert("RGBA"))
        n = int(info["bilder"]); w = st.shape[1] // n
        einzig, folge = [], []
        for i in range(n):
            b = st[:, i * w:(i + 1) * w]
            for k, e in enumerate(einzig):
                if np.array_equal(e, b):
                    folge.append(k); break
            else:
                einzig.append(b); folge.append(len(einzig) - 1)
        # leere Ränder der Streifenzellen abschneiden (gemeinsam für alle Bilder dieser Bewegung)
        alle = np.any([e[..., 3] > 0 for e in einzig], axis=0)
        ys, xs = np.nonzero(alle)
        einzig = [e[ys.min():ys.max() + 1, xs.min():xs.max() + 1] for e in einzig]
        s, x0, y0 = beste_lage(idle, einzig)
        bericht.append(f"{fig}/{name}: Überdeckung mit Idle {s:.2f}")
        ziel = "talk" if name in TALK else ("idle" if IDLE_ERSATZ.get(fig) == name else name)
        anims.append((ziel, [(x0, y0, e) for e in einzig], int(info["ms"]), bool(info.get("schleife", False)),
                      folge if folge != list(range(len(einzig))) else None))
    # neue Zellgröße: Fußpunkt (unten, Mitte von W) bleibt; links/rechts gleich viel Rand
    links = max([0] + [-x0 for _, bs, *_ in anims for x0, y0, b in bs])
    rechts = max([0] + [x0 + b.shape[1] - W for _, bs, *_ in anims for x0, y0, b in bs])
    oben = max([0] + [-y0 for _, bs, *_ in anims for x0, y0, b in bs])
    rand = max(links, rechts)
    NW, NH = W + 2 * rand, H + oben
    blatt, info, nr = [], {}, 0
    for name, bs, ms, schleife, folge in anims:
        for x0, y0, b in bs:
            f = np.zeros((NH, NW, 4), np.uint8)
            X, Y = x0 + rand, y0 + oben
            bh, bw = b.shape[:2]
            ya, xa = max(0, Y), max(0, X); yb, xb = min(NH, Y + bh), min(NW, X + bw)
            f[ya:yb, xa:xb] = b[ya - Y:yb - Y, xa - X:xb - X]
            blatt.append(f)
        e = {"von": nr, "bilder": len(bs), "ms": ms, "schleife": schleife}
        if folge:
            e["folge"] = folge
        info[name] = e
        nr += len(bs)
    daten_neu = {"bild": [NW, NH], "animationen": info}
    if NW * len(blatt) > 16384:      # Texturgrenze: in Reihen zu je „spalten“ Bildern legen
        spalten = 16384 // NW
        reihen = -(-len(blatt) // spalten)
        bild = np.zeros((NH * reihen, NW * spalten, 4), np.uint8)
        for k, f in enumerate(blatt):
            bild[(k // spalten) * NH:(k // spalten + 1) * NH, (k % spalten) * NW:(k % spalten + 1) * NW] = f
        daten_neu["spalten"] = spalten
    else:
        bild = np.concatenate(blatt, axis=1)
    Image.fromarray(bild, "RGBA").save(SPIEL / f"grafik/figuren/{fig}.png")
    Path(SPIEL / f"daten/figuren/{fig}.json").write_text(
        json.dumps(daten_neu, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    print(fig, nr, "Bilder je", NW, "x", NH, "Sheet", bild.shape[1], "x", bild.shape[0],
          "ZU GROSS" if max(bild.shape[:2]) > 16384 else "")
Path("E:/Game Engine/Grafiken/3d/gesten_einbau_bericht.txt").write_text("\n".join(bericht) + "\n", encoding="utf-8")
