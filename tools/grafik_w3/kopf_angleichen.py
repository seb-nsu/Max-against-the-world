"""Kopfgröße in umgerechneten Posen an das Standbild angleichen (Gemini malt Köpfe in Posen oft 8–15 % größer).
Je Pose: Kopfbreite in Zeile 6–14 % der Figurenhöhe messen; ist sie mehr als 5 % größer als im Stand, wird der
Bereich oberhalb des Halses (Anteil hals der Höhe) um diesen Faktor verkleinert, unten mittig am Hals verankert.
Arbeitet auf Probe-Streifen von bew.py (<id>_<name>.png/.json, Bild „R“ = Stand) und überschreibt sie.
Aufruf: py -3 kopf_angleichen.py <streifen-ohne-endung> [hals=0.21] [stand.png]"""
import json, sys
import numpy as np
from PIL import Image

stamm = sys.argv[1]; HALS = float(sys.argv[2]) if len(sys.argv) > 2 else 0.21
m = json.load(open(stamm + ".json", encoding="utf-8")); w, h = m["bild"]
a = np.array(Image.open(stamm + ".png").convert("RGBA"))


def mass(f):
    al = f[..., 3] > 0; ys = np.nonzero(al.any(1))[0]; y0, y1 = ys[0], ys[-1]; H = y1 - y0 + 1
    z = al[y0 + int(H * 0.06):y0 + int(H * 0.14)].sum(1); return y0, H, float(np.median(z[z > 0]))


if len(sys.argv) > 3:
    ref = np.asarray(Image.open(sys.argv[3]).convert("RGBA"))
else:
    ref = a[:, [i for i, k in enumerate(m["folge"]) if k == "R"][0] * w:][:, :w]
_, Hr, kr = mass(ref)
for i, k in enumerate(m["folge"]):
    if k == "R":
        continue
    f = a[:, i * w:(i + 1) * w]
    y0, H, kp = mass(f)
    fak = kr / kp
    if fak > 0.95:
        continue
    if fak < 0.8 or abs(H / Hr - 1) > 0.08:   # Hocke, erhobene Arme: Messung unsicher, Pose bleibt
        print(f"Bild {i} ({k}): übersprungen (Faktor {fak:.2f}, Höhe {H / Hr:.2f})"); continue
    hy = y0 + int(H * HALS)
    kopf = f[:hy].copy()
    xs = np.nonzero(kopf[hy - 3:hy, :, 3].any(0))[0]; cx = xs.mean() if len(xs) else w / 2
    nh = max(1, round(hy * fak)); nw = max(1, round(w * fak))
    klein = np.asarray(Image.fromarray(kopf).resize((nw, nh), Image.NEAREST))
    f[:hy] = 0
    ox = int(round(cx - cx * fak)); oy = hy - nh
    sl = f[oy:hy, ox:ox + nw]; kk = klein[:, :sl.shape[1]]
    sel = kk[..., 3] > 0; sl[sel] = kk[sel]
    print(f"Bild {i} ({k}): Kopf {kp:.0f} statt {kr:.0f} px -> Faktor {fak:.2f}")
Image.fromarray(a).save(stamm + ".png")
