"""Jede Pose gegen das Standbild R: Rumpfbreite (25-55 % der Höhe, Median) und Kopfhöhe über der Fußlinie.
Aufruf: py groesse_pruefen.py <bewegungen-ordner>  -> Tabelle, Abweichungen über 5 % markiert."""
import sys, json, glob, os
import numpy as np
from PIL import Image
def mass(f):
    al = f[..., 3] > 0
    ys = np.nonzero(al.any(1))[0]; y0, y1 = ys[0], ys[-1]; h = y1 - y0 + 1
    def br(a_, b_):
        z = al[y0 + int(h * a_):y0 + int(h * b_)].sum(1); z = z[z > 0]
        return float(np.median(z)) if len(z) else 1.0
    return h, br(0.25, 0.55), br(0.04, 0.12), br(0.75, 0.9)
for js in sorted(glob.glob(os.path.join(sys.argv[1], "*.json"))):
    m = json.load(open(js, encoding="utf-8")); w, h = m["bild"]
    a = np.asarray(Image.open(js[:-5] + ".png").convert("RGBA"))
    folge = m["folge"]; gesehen = {}
    for i, k in enumerate(folge):
        gesehen.setdefault(k, a[:, i * w:(i + 1) * w])
    if "R" not in gesehen: continue
    hr, br, kr, lr = mass(gesehen["R"])
    teile = []
    for k, f in gesehen.items():
        if k == "R": continue
        hh, bb, kk, ll = mass(f)
        dh, db, dk, dl = hh / hr - 1, bb / br - 1, kk / kr - 1, ll / lr - 1
        warn = [n for n, d in (("Kopf", dk), ("Beine", dl)) if abs(d) > 0.05]
        teile.append(f"P{k}: H {dh:+.0%} Kopf {dk:+.0%} Beine {dl:+.0%} (Rumpf+Arme {db:+.0%})" + (" <-- " + ",".join(warn) if warn else ""))
    print(os.path.basename(js)[:-5], "|", "; ".join(teile))
