"""Raumzustand nur an der geänderten Stelle einsetzen (Regel: Varianten aus dem Grundbild, beim Einbau nur die
geänderte Stelle). Beide Bilder sind schon gepixelt (tools/pixelieren.py), jedes mit eigener Palette; deshalb nicht
Pixel für Pixel vergleichen, sondern in 8×8-Feldern den mittleren Farbabstand messen. Felder mit großem Abstand
(größte zusammenhängende Gruppe, plus Rand) werden aus der Variante übernommen, alles andere bleibt Grundbild.
Aufruf: py -3 zustand_einsetzen.py grund.png variante.png ziel.png [schwelle=40] [rand=1]
Gibt den Rahmen der übernommenen Stelle aus (für die Code-Ausschnitte)."""
import sys
import numpy as np
from PIL import Image
from scipy import ndimage

g = np.asarray(Image.open(sys.argv[1]).convert("RGB")).astype(int)
v = np.asarray(Image.open(sys.argv[2]).convert("RGB")).astype(int)
schwelle = float(sys.argv[4]) if len(sys.argv) > 4 else 40
rand = int(sys.argv[5]) if len(sys.argv) > 5 else 1
F = 8
H, W = g.shape[:2]
d = np.abs(g - v).sum(-1)
feld = d[:H // F * F, :W // F * F].reshape(H // F, F, W // F, F).mean((1, 3)) > schwelle
lab, n = ndimage.label(ndimage.binary_closing(feld, iterations=1))
if n == 0:
    sys.exit("keine Änderung gefunden")
gr = ndimage.sum(feld, lab, range(1, n + 1))
m = lab == (int(np.argmax(gr)) + 1)
m = ndimage.binary_fill_holes(ndimage.binary_dilation(m, iterations=rand))
maske = np.kron(m, np.ones((F, F), bool))
voll = np.zeros((H, W), bool); voll[:maske.shape[0], :maske.shape[1]] = maske
aus = g.copy(); aus[voll] = v[voll]
Image.fromarray(aus.astype(np.uint8)).save(sys.argv[3])
ys, xs = np.nonzero(voll)
print(sys.argv[3], "übernommen", int(voll.sum()), "Pixel, Rahmen", xs.min(), ys.min(), xs.max() + 1, ys.max() + 1)
