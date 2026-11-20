"""Gesten mit Zwischenbildern neu zusammensetzen.

Liest je Zeile der Spezifikation (Datei als Argument): id|bewegung|ms|schleife(S/-)|anker(fuss/rumpf)|zw-streifen|folge
- Posen P1..Pn und R stammen aus dem vorhandenen Streifen <bewegungen>/v1/<id>_<bewegung>.png (+ .json, Feld folge),
- Zwischenbilder Z1..Zn aus <arbeit>/<id>/bewegungen/<id>_<zw-streifen>.png (bew.py --probe),
- folge etwa "R*3,Z1*2,P1*16,Z1*2,R*4".
Alle Bilder werden auf den Inhalt zugeschnitten und an Fußlinie und Fuß- bzw. Rumpfmitte ausgerichtet.
Aufruf: py -3 folgen_mit_zwischenbildern.py spez.txt <bewegungen-ordner> <arbeitsordner>"""
import json, sys
from pathlib import Path
import numpy as np
from PIL import Image

spez, B, A = Path(sys.argv[1]), Path(sys.argv[2]), Path(sys.argv[3])


def bilder_aus(png, js):
    m = json.loads(Path(js).read_text(encoding="utf-8")); w, h = m["bild"]
    a = np.asarray(Image.open(png).convert("RGBA"))
    return [a[:, i * w:(i + 1) * w] for i in range(a.shape[1] // w)], m


def zuschnitt(b):
    ys, xs = np.nonzero(b[..., 3] > 0)
    return b[ys.min():ys.max() + 1, xs.min():xs.max() + 1]


def anker(c, art):
    h = c.shape[0]; al = c[..., 3] > 0
    zone = al[int(h * 0.85):] if art == "fuss" else al[int(h * 0.25):int(h * 0.55)]
    xs = np.nonzero(zone)[1]
    return xs.mean() if len(xs) else c.shape[1] / 2


for zeile in spez.read_text(encoding="utf-8").splitlines():
    if not zeile.strip() or zeile.startswith("#"):
        continue
    fid, bew, ms, schl, art, zw, folge = zeile.split("|")
    alt, m = bilder_aus(B / "v1" / f"{fid}_{bew}.png", B / "v1" / f"{fid}_{bew}.json")
    teile = {}
    for i, k in enumerate(m["folge"]):
        key = "R" if k == "R" else "P" + k
        teile.setdefault(key, zuschnitt(alt[i]))
    if zw != "-":
        zb, _ = bilder_aus(A / fid / "bewegungen" / f"{fid}_{zw}.png", A / fid / "bewegungen" / f"{fid}_{zw}.json")
        for i, b in enumerate(zb, 1):
            teile[f"Z{i}"] = zuschnitt(b)
    folge_l = []
    for t in folge.split(","):
        k, n = (t.strip().split("*") + ["1"])[:2]; folge_l += [k] * int(n)
    benutzt = {k: teile[k] for k in dict.fromkeys(folge_l)}
    ax = {k: anker(c, art) for k, c in benutzt.items()}
    links = max(ax.values()); rechts = max(c.shape[1] - ax[k] for k, c in benutzt.items())
    W = int(np.ceil(links + rechts)) + 8; H = max(c.shape[0] for c in benutzt.values()) + 4
    fertig = {}
    for k, c in benutzt.items():
        f = np.zeros((H, W, 4), np.uint8)
        x = int(round(4 + links - ax[k])); y = H - 2 - c.shape[0]
        f[y:y + c.shape[0], x:x + c.shape[1]] = c; fertig[k] = f
    Image.fromarray(np.concatenate([fertig[k] for k in folge_l], 1)).save(B / f"{fid}_{bew}.png")
    (B / f"{fid}_{bew}.json").write_text(json.dumps({"bilder": len(folge_l), "ms": int(ms), "schleife": schl == "S",
        "bild": [W, H], "folge": folge_l, "hinweis": "R = Standbild, Z = Zwischenbild (Halbpose), P = Pose"},
        ensure_ascii=False, indent=1), encoding="utf-8")
    print(f"{fid}_{bew}: {len(folge_l)} Bilder, Zelle {W}x{H}")
