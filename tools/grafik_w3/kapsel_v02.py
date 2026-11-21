"""Max und seine Kapsel auf den Hintergründen der zweiten Fassung (Kasten von vorn, W3-R03 v02).

Quelle: Gemini-Posenbogen `welt3/korrektur_21-11/kapsel_posen_v1.png` (vier Spalten: liegt, sitzt, sitzt auf der
Kante, leer; Deckel offen). Je Spalte am linken Kastenrand ausrichten, auf die Kastenbreite im Spiel verkleinern
(k-Centroid wie pixelieren.py), Magenta wird durchsichtig, Farben auf Hintergrund und Max-Sprite.
Gemalt wird nur, was sich gegenüber dem Hintergrund ändert: aufgeklappter Deckel, Öffnung oben und Max. Die
Vorderseite des Kastens bleibt die aus dem Hintergrund (der Gemini-Kasten ist höher); Max-Pixel unterhalb der
Oberkante (Beine über der Kante) kommen aus dem Unterschied zum leeren Kasten (Spalte 4).
Ausgabe: game/grafik/ambiente/w3_kapsel_max_v02.png (4 Bilder) und die Lage im Raum (oben links).
Aufruf: py -3 tools/grafik_w3/kapsel_v02.py "E:/Game Engine/Grafiken/assets/welt3/korrektur_21-11/kapsel_posen_v1.png"
"""
import io
import json
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from pixelieren import farben_32, verkleinern  # noqa: E402

W0 = Path(__file__).resolve().parents[2]
KASTEN_SPIEL = 74          # Breite des Kastens im Spiel (Vorderseite samt Rand), Hintergrund x 240 bis 313
KASTEN_LINKS = 240         # linke Kante der Vorderseite im Hintergrund
OBERKANTE_SPIEL = 234      # Oberkante der Vorderseite im Hintergrund (unter dem Deckelrand)

quelle = np.asarray(Image.open(sys.argv[1]).convert("RGB"))
mag = (quelle[..., 0] > 200) & (quelle[..., 1] < 80) & (quelle[..., 2] > 200)
spalten = (~mag).any(0)
laeufe, s = [], None
for x, v in enumerate(spalten):
    if v and s is None:
        s = x
    if not v and s is not None:
        laeufe.append((s, x)); s = None
if s is not None:
    laeufe.append((s, len(spalten)))
# Kastenbreite im Bogen: Zeile weit unten (nur Kasten), erste Spalte
y_mess = int(quelle.shape[0] * 0.8)
zeile = np.nonzero(~mag[y_mess, laeufe[0][0]:laeufe[0][1]])[0]
kasten_q = int(zeile.max() - zeile.min() + 1)
skala = KASTEN_SPIEL / kasten_q
links = [(a + int(np.nonzero(~mag[y_mess, a:b])[0].min()), b) for a, b in laeufe]
ys = np.nonzero((~mag).any(1))[0]
y0, y1 = int(ys.min()) - 4, int(ys.max()) + 1
breite_q = round(kasten_q * 1.18)
fw, fh = round(breite_q * skala), round((y1 - y0) * skala)

bg = np.asarray(Image.open(W0 / "game/grafik/hintergruende/w3_bg_widerstandsbasis_v02.png").convert("RGB"))
mx = np.asarray(Image.open(W0 / "game/grafik/figuren/max.png").convert("RGBA").crop((0, 0, 280, 193)))
pal = np.unique(np.concatenate([bg.reshape(-1, 3), mx[mx[..., 3] > 0][:, :3]]), axis=0)

bilder = []
for l, ende in links:
    stueck = np.full((y1 - y0, breite_q, 3), (255, 0, 255), np.uint8)
    teil = quelle[y0:y1, l - 2:min(ende, l - 2 + breite_q)]   # nur diese Spalte, nichts vom Nachbarn
    stueck[:, :teil.shape[1]] = teil
    puffer = io.BytesIO(); Image.fromarray(stueck).save(puffer, "PNG"); puffer.seek(0)
    klein = np.asarray(verkleinern(puffer, fw, fh)).astype(int)
    durch = (klein[..., 0] > 170) & (klein[..., 1] < 110) & (klein[..., 2] > 170)
    rgb = np.asarray(farben_32(klein.astype(np.uint8), palette=pal))
    f = np.dstack([rgb, np.where(durch, 0, 255).astype(np.uint8)])
    bilder.append(f)

# Oberkante der Vorderseite im leeren Kasten: erste Zeile, in der die Öffnung (dunkel) aufhört und der Kasten
# die volle Breite hat
leer = bilder[3]
breit = (leer[..., 3] > 0).sum(1)
voll = int(np.nonzero(breit >= breit.max() - 1)[0].min())
links_px = int(np.nonzero(leer[voll + 4, :, 3])[0].min())
for nr, f in enumerate(bilder[:3]):
    if nr < 2:                       # liegt / sitzt im Kasten: unter der Kante nichts von Max
        f[voll:, :, 3] = 0
        continue
    anders = (f[..., 3] != leer[..., 3]) | (np.abs(f[..., :3].astype(int) - leer[..., :3].astype(int)).sum(-1) > 30)
    # nur Teile, die oberhalb der Kante anfangen (Max, der über die Kante ragt), kein Rauschen im Kasten;
    # zum Zusammenhang leicht verbreitert, damit Unterschenkel und Schuhe am Knie hängen bleiben
    lab, n = ndimage.label(ndimage.binary_dilation(anders, iterations=2))
    anders &= np.isin(lab, [k for k in np.unique(lab[:voll]) if k])
    anders = ndimage.binary_fill_holes(anders)
    # unter der Kante hängen nur die Beine an der rechten Kastenseite (ab gut der Hälfte der Breite); Hände und
    # Kastenkante links bleiben aus dem Hintergrund, sonst kommen Farbabweichungen des Gemini-Kastens mit
    anders[voll + 3:, :int(KASTEN_SPIEL * 0.6)] = False
    lab, n = ndimage.label(ndimage.binary_opening(anders[voll:], iterations=1))   # größtes Stück: die Beine
    if n:
        gr = ndimage.sum(lab > 0, lab, range(1, n + 1))
        anders[voll:] &= ndimage.binary_dilation(lab == 1 + int(np.argmax(gr)), iterations=1)
    unten = np.zeros(anders.shape, bool); unten[voll:] = True
    f[unten & ~anders, 3] = 0
bilder[3][voll:, :, 3] = 0

# Der Kasten im Hintergrund ist schräg von oben gemalt: Deckelfläche vorn y 226 von x 240 bis 301, hinten y 211,5
# von x 275 bis 331. Gemini malt ihn gerade von vorn. Darum Öffnung und Deckel zeilenweise auf diese Fläche
# umrechnen (Deckel steht senkrecht auf der Hinterkante) und Max um die halbe Verschiebung mitnehmen.
VORN_Y, HINTEN_Y = 226.0, 211.5
VORN, HINTEN = (240, 301), (275, 331)
MAX_VERSATZ = 8
ox, oy = KASTEN_LINKS - links_px, OBERKANTE_SPIEL - voll
B2 = HINTEN[1] - ox + 2


def ziel_spanne(y):
    if y >= VORN_Y:
        return VORN
    if y <= HINTEN_Y:
        return HINTEN
    t = (VORN_Y - y) / (VORN_Y - HINTEN_Y)
    return (round(VORN[0] + (HINTEN[0] - VORN[0]) * t), round(VORN[1] + (HINTEN[1] - VORN[1]) * t))


kasten = np.zeros((fh, B2, 4), np.uint8)
for r in range(voll):
    xs = np.nonzero(leer[r, :, 3])[0]
    if not len(xs):
        continue
    sl, sr = int(xs.min()), int(xs.max())
    tl, tr = ziel_spanne(r + oy)
    for x in range(tl, tr + 1):
        q = sl + round((x - tl) * (sr - sl) / max(1, tr - tl))
        kasten[r, x - ox] = leer[r, q]
neu_bilder = []
for nr, f in enumerate(bilder):
    g = kasten.copy()
    if nr < 3:
        m = (f[..., 3] > 0) & ((leer[..., 3] == 0) | (np.abs(f[..., :3].astype(int) - leer[..., :3].astype(int)).sum(-1) > 30))
        m[voll:] = f[voll:, :, 3] > 0
        m[:voll] &= ndimage.binary_dilation(ndimage.binary_opening(m[:voll], iterations=2), iterations=2)   # angehängte Linien
        lab, n = ndimage.label(m)    # nur große Stücke: Max; schmale Reste vom Gemini-Deckel fallen weg
        if n:
            gr = ndimage.sum(m, lab, range(1, n + 1))
            dick = [min(sl[0].stop - sl[0].start, sl[1].stop - sl[1].start) >= 5 for sl in ndimage.find_objects(lab)]
            boxen = ndimage.find_objects(lab)
            gross = boxen[int(np.argmax(gr))]
            neben = [boxen[k][1].stop > gross[1].start - 2 and boxen[k][1].start < gross[1].stop + 2 for k in range(n)]
            # Deckelkanten sind dünne Linien oder liegen neben Max (Gemini-Deckel steht in jeder Spalte etwas anders)
            m = np.isin(lab, [k + 1 for k in range(n) if gr[k] >= 40 and dick[k] and neben[k]])
        ys, xs = np.nonzero(m)
        ok = xs + MAX_VERSATZ < B2
        g[ys[ok], xs[ok] + MAX_VERSATZ] = f[ys[ok], xs[ok]]
    neu_bilder.append(g)
bilder, fw = neu_bilder, B2
Image.fromarray(np.concatenate(bilder, 1)).save(W0 / "game/grafik/ambiente/w3_kapsel_max_v02.png")
lage = {"bild": [fw, fh], "bilder": 4, "oben_links": [ox, oy]}
print("w3_kapsel_max_v02", json.dumps(lage))
