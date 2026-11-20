"""Bewegungen aus mehreren umgerechneten Bögen zusammensetzen (Welt 3, Phase 2).

Spezifikation je Zeile: id|bewegung|ms|S/-|anker(fuss/rumpf)|quellen|folge|R-datei
- quellen: „P=q10,Z=z10,W=qb09“: Buchstabe = Präfix, Name = Probe-Streifen <arbeit>/<id>/bewegungen/<id>_<name>.png
  (bew.py --probe); Bild k des Streifens (ohne R) heißt dann P1, P2 …
- folge: etwa „R*3,Z1*2,P1*16,Z1*2,R*4“; R ist das Standbild (aus R-datei, sonst Bild R des ersten Streifens)
- R-datei: optional, Pfad relativ zu <arbeit>/spiel/grafik/figuren (etwa mutti.png)
Aufruf: py -3 folgen_aus_quellen.py spez.txt <ausgabe-ordner> <arbeitsordner>"""
import json, sys
from pathlib import Path
import numpy as np
from PIL import Image

spez, B, A = Path(sys.argv[1]), Path(sys.argv[2]), Path(sys.argv[3])


def zuschnitt(b):
    ys, xs = np.nonzero(b[..., 3] > 0)
    return b[ys.min():ys.max() + 1, xs.min():xs.max() + 1]


def anker(c, art):
    h = c.shape[0]; al = c[..., 3] > 0
    zone = al[int(h * 0.85):] if art == "fuss" else al[int(h * 0.25):int(h * 0.55)] if art == "rumpf" else al[:int(h * 0.15)]
    xs = np.nonzero(zone)[1]
    return xs.mean() if len(xs) else c.shape[1] / 2


for zeile in spez.read_text(encoding="utf-8").splitlines():
    if not zeile.strip() or zeile.startswith("#"):
        continue
    teile_ = zeile.split("|") + [""]
    fid, bew, ms, schl, art, quellen, folge, rdatei = teile_[:8]
    teile = {}
    for q in quellen.split(","):
        pre, name = q.split("=")
        stamm = A / fid / "bewegungen" / f"{fid}_{name}"
        m = json.loads(Path(str(stamm) + ".json").read_text(encoding="utf-8")); w, h = m["bild"]
        a = np.asarray(Image.open(str(stamm) + ".png").convert("RGBA"))
        k = 0
        for i, key in enumerate(m["folge"]):
            if key == "R":
                teile.setdefault("R", zuschnitt(a[:, i * w:(i + 1) * w]))
            else:
                k += 1; teile[f"{pre}{k}"] = zuschnitt(a[:, i * w:(i + 1) * w])
    if rdatei.strip():
        teile["R"] = zuschnitt(np.asarray(Image.open(A / "spiel" / "grafik" / "figuren" / rdatei.strip()).convert("RGBA")))
    folge_l = []
    for t in folge.split(","):
        k, n = (t.strip().split("*") + ["1"])[:2]; folge_l += [k] * int(n)
    benutzt = {k: teile[k] for k in dict.fromkeys(folge_l)}
    ax = {k: anker(c, art) for k, c in benutzt.items()}
    links = max(ax.values()); rechts = max(c.shape[1] - ax[k] for k, c in benutzt.items())
    W = int(np.ceil(links + rechts)) + 8; H = max(c.shape[0] for c in benutzt.values()) + 4
    oben = art == "oben"   # hängende Figuren (M.U.T.T.I.): an der Oberkante ausrichten
    fertig = {}
    for k, c in benutzt.items():
        f = np.zeros((H, W, 4), np.uint8)
        x = int(round(4 + links - ax[k])); y = 2 if oben else H - 2 - c.shape[0]
        f[y:y + c.shape[0], x:x + c.shape[1]] = c; fertig[k] = f
    Image.fromarray(np.concatenate([fertig[k] for k in folge_l], 1)).save(B / f"{fid}_{bew}.png")
    (B / f"{fid}_{bew}.json").write_text(json.dumps({"bilder": len(folge_l), "ms": int(ms), "schleife": schl == "S",
        "bild": [W, H], "folge": folge_l, "hinweis": "R = Standbild, P = Pose, Z = Halbpose"}, ensure_ascii=False, indent=1),
        encoding="utf-8")
    print(f"{fid}_{bew}: {len(folge_l)} Bilder, Zelle {W}x{H}")
