"""Roboter-Hausmeister: Mopp in den Gesten richtig herum drehen (W3-R05-02), passend zum korrigierten Stand.

Die Posen (reden, verbeugen, arm_drehen, lesen) zeigen den Mopp wie der alte Stand mit dem Mopp-Kopf oben. Nach der
Korrektur des Stands (stand_korrektur.py) würde der Mopp bei jeder Geste umkippen. Das Skript baut den Mopp in
jedem Bild um, ohne die Figur neu zu malen:
  1. Stiel rechts der Figur von unten suchen, darüber die Faust, darüber den Stiel bis zum Mopp-Kopf.
  2. Alles, was oberhalb der Faust am Stiel hängt (Stiel und Mopp-Kopf als zusammenhängende Fläche), entfernen.
     Hängt die Fläche am Kopf des Roboters (Verbeugen), nur Mopp-Farben und ihre Kontur entfernen.
  3. Stiel 16 Zeilen über die Faust führen (wie im Stand) und mit Kontur abschließen.
  4. Den Mopp-Kopf aus dem neuen Stand unten an den Stiel setzen (nur auf leere Pixel und den Stiel).
  Beim Lesen lehnt der Mopp schräg am Körper: Kopf oben links entfernen, Stiel bis zum Boden verlängern, Mopp-Kopf
  an dessen Ende.
  5. Das runde Auge gelb färben, wo der Kopf so steht wie im Stand (Vorlage: Ring des alten Stands, verschoben).

Aufruf: py -3 hausmeister_mopp.py <alter_stand.png> <neuer_stand.png> <bewegungen-ordner>  (ändert hausmeister_*.png dort)
"""
import json
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage

HOLZ = {(0x9e, 0x89, 0x7a), (0x70, 0x59, 0x60)}
MOPP = {(0xd5, 0xcb, 0xbd), (0xbf, 0xba, 0xb3)} | HOLZ
KONTUR = (0x26, 0x2b, 0x44)
GELB, BERNSTEIN, WEISS = (0xfe, 0xe7, 0x61), (0xe4, 0xa6, 0x72), (0xff, 0xff, 0xff)
STIEL_UEBER_FAUST = 16


def farbe(p):
    return tuple(int(v) for v in p[:3])


def dunkel(p):
    return p[3] and int(p[0]) + int(p[1]) + int(p[2]) < 200


def boden(b):
    return int(np.nonzero(b[..., 3].any(axis=1))[0].max())


def stiel_spalten(b, y):
    """Stiel in Zeile y: rechte Gruppe aus Holzpixeln, erweitert um die Kontur (deckender Lauf drumherum)."""
    xs = [x for x in range(b.shape[1]) if b[y, x, 3] and farbe(b[y, x]) in HOLZ]
    if not xs:
        return None
    x = xs[-1]
    l = r = x
    while l > 0 and b[y, l - 1, 3]:
        l -= 1
    while r < b.shape[1] - 1 and b[y, r + 1, 3]:
        r += 1
    return l, r


def frei(b, y, l, r):
    """Stiel steht frei: links und rechts zwei Pixel daneben leer (der Stiel darf um 1 px wandern)."""
    return (l - 2 < 0 or not b[y, l - 2, 3]) and (r + 2 >= b.shape[1] or not b[y, r + 2, 3])


def mopp_kopf_vorlage(neu):
    """Mopp-Kopf am Boden aus dem neuen Stand: Pixel, Ankerspalte (linke Holzspalte) und unterste Zeile."""
    fy = boden(neu)
    sp = None
    for y in range(fy - 40, fy - 20):
        sp = stiel_spalten(neu, y) or sp
    wl, wr = sp
    # Mopp-Kopf: zusammenhängende Fläche unten am Stiel (Zeilen unter dem freien Stiel)
    y0 = fy - 40
    while frei(neu, y0, wl, wr):
        y0 += 1
    teil = neu[y0 - 2:fy].copy()           # samt zwei Zeilen Stiel als Übergang
    teil[:, :max(0, wl - 40)] = 0
    unten = int(np.nonzero(teil[..., 3].any(axis=1))[0].max())
    return teil, wl, unten


def stiel_zeile(b, y, wl, wr):
    return b[y, wl:wr + 1].copy()


def koerper(b):
    """Pixel des Roboters: größte Fläche ohne Mopp-Farben und ohne Mopp-Kontur (dunkle Pixel, die nur an Mopp,
    Leere oder andere dunkle Pixel grenzen)."""
    h, w = b.shape[:2]
    mf = np.zeros((h, w), bool)
    for y, x in zip(*np.nonzero(b[..., 3])):
        if farbe(b[y, x]) in MOPP:
            mf[y, x] = True
    hell = (b[..., 3] > 0) & ~mf & (b[..., :3].astype(int).sum(axis=2) >= 200)
    an_hell = ndimage.binary_dilation(hell, structure=np.ones((3, 3)))
    dk = (b[..., 3] > 0) & ~mf & ~hell
    kandidat = hell | (dk & an_hell)
    lab, n = ndimage.label(kandidat)          # 4er-Nachbarschaft: dünne Konturbrücken trennen
    if not n:
        return kandidat
    groesse = ndimage.sum(np.ones_like(lab), lab, range(1, n + 1))
    k = lab == (int(np.argmax(groesse)) + 1)
    # helle Mopp-Farben im Gesicht (Auge, leuchtendes Gitter) liegen als Löcher im Körper: dazurechnen
    return ndimage.binary_fill_holes(k) & (b[..., 3] > 0)


def ohne_mopp(b, bereich):
    """Im Bereich alles entfernen, was nicht zum Roboter gehört; liefert Anzahl entfernter Pixel."""
    k = koerper(b)
    weg = bereich & (b[..., 3] > 0) & ~k
    b[weg] = 0
    # offene Schnittkanten (Arm, der hinter dem Mopp lag; Kopfkante) mit Kontur schließen
    kante = ndimage.binary_dilation(weg) & (b[..., 3] > 0) & (b[..., :3].astype(int).sum(axis=2) >= 200)
    b[kante, :3] = KONTUR
    return int(weg.sum())


def kopf_entfernen(b, wl, wr, y_oben):
    """Stiel über der Faust und Mopp-Kopf entfernen; liefert Anzahl entfernter Pixel."""
    bereich = np.zeros(b.shape[:2], bool)
    bereich[:y_oben + 1, max(0, wl - 15):] = True
    return ohne_mopp(b, bereich)


def kopf_setzen(b, vorlage, wl_v, unten_v, wl, y_boden):
    teil = vorlage
    dx, dy = wl - wl_v, y_boden - unten_v
    for y, x in zip(*np.nonzero(teil[..., 3])):
        Y, X = y + dy, x + dx
        if 0 <= Y < b.shape[0] and 0 <= X < b.shape[1]:
            if not b[Y, X, 3] or farbe(b[Y, X]) in HOLZ or farbe(b[Y, X]) == KONTUR:
                b[Y, X] = teil[y, x]


def auge(b, alt):
    """Augenring des alten Stands im Bild suchen (Umriss dunkel/hell) und wie im Stand gelb färben."""
    ring = alt[16:31, 70:83]
    dm = np.array([[dunkel(p) for p in r] for r in ring])
    am = ring[..., 3] > 0
    bd = (b[..., 3] > 0) & (b[..., :3].astype(int).sum(axis=2) < 200)
    ba = b[..., 3] > 0
    best = (0, 0, 0)
    for oy in range(0, b.shape[0] // 3 - 15):
        for ox in range(b.shape[1] - 13):
            if not ba[oy:oy + 15, ox:ox + 13][am].all():
                continue
            s = (bd[oy:oy + 15, ox:ox + 13] == dm)[am].mean()
            if s > best[0]:
                best = (s, ox, oy)
    s, ox, oy = best
    if s < 0.82:
        return linse(b, s)
    cx, cy, rx, ry = 76.3 - 70 + ox, 23.6 - 16 + oy, 3.6, 4.9
    for y in range(oy, oy + 15):
        for x in range(ox, ox + 13):
            if not b[y, x, 3]:
                continue
            d = np.hypot((x - cx) / rx, (y - cy) / ry)
            if d < 0.55:
                b[y, x, :3] = GELB
            elif d < 0.85:
                b[y, x, :3] = BERNSTEIN
    b[oy + 5, ox + 5, :3] = WEISS
    return s


def linse(b, s):
    """Ersatz, wenn der Ring nicht passt (Kopf gedreht): helle Linse (kleine eingeschlossene helle Fläche im oberen
    Drittel) gelb, ihre helle Umgebung bis zum dunklen Ring bernstein."""
    h = b.shape[0] // 3
    hell = np.zeros((h, b.shape[1]), bool)
    for y, x in zip(*np.nonzero(b[:h, :, 3])):
        if farbe(b[y, x]) in {(0xd5, 0xcb, 0xbd), (0xbf, 0xba, 0xb3)}:
            hell[y, x] = True
    lab, n = ndimage.label(hell)
    for i in range(1, n + 1):
        m = lab == i
        if not 3 <= m.sum() <= 30:
            continue
        rand = ndimage.binary_dilation(m) & ~m
        ys, xs = np.nonzero(rand)
        if not all(b[y, x, 3] for y, x in zip(ys, xs)):
            continue
        b[:h][m] = (*GELB, 255)
        return -1.0
    return s


def gerade(b, alt_neu):
    """Senkrechter Stiel rechts: Mopp-Kopf oben gegen unten tauschen. Liefert Meldung oder None."""
    vorlage, wl_v, unten_v = alt_neu
    fy = boden(b)
    sp = stiel_spalten(b, fy - 6)
    if not sp:
        return None
    wl, wr = sp
    y = fy - 6
    while y > 0 and frei(b, y, wl, wr):          # freier Stiel unten
        y -= 1
    while y > 0 and not frei(b, y, wl, wr):      # Faust
        y -= 1
    faust_oben = y + 1
    y_oben = faust_oben - 1
    # Fläche über der Faust: groß = Mopp-Kopf oben
    mopp_oben = sum(1 for y, x in zip(*np.nonzero(b[:y_oben + 1, max(0, wl - 12):, 3]))
                    if farbe(b[y, x + max(0, wl - 12)]) in MOPP - HOLZ)
    if mopp_oben < 60:
        return None     # kein Mopp-Kopf oben (schon richtig herum)
    zeile = stiel_zeile(b, fy - 10, wl, wr)
    weg = kopf_entfernen(b, wl, wr, y_oben)
    for yy in range(faust_oben - STIEL_UEBER_FAUST, faust_oben):
        for i, p in enumerate(zeile):
            if p[3] and not b[yy, wl + i, 3]:
                b[yy, wl + i] = p
    kappe = faust_oben - STIEL_UEBER_FAUST - 1
    for x in range(wl, wr + 1):
        if not b[kappe, x, 3]:
            b[kappe, x, :3], b[kappe, x, 3] = KONTUR, 255
    kopf_setzen(b, vorlage, wl_v, unten_v, wl, fy - 1)
    return f"gerade, Faust ab Zeile {faust_oben}, {weg} px Mopp oben entfernt"


def schraeg(b, alt_neu):
    """Lesen: Mopp lehnt schräg, Kopf oben links hinter dem Roboter."""
    vorlage, wl_v, unten_v = alt_neu
    fy = boden(b)
    h, w = b.shape[:2]
    # Mopp-Kopf oben links: Mopp-Farben in der oberen Hälfte, links der Bildmitte
    m = np.zeros((h, w), bool)
    for y in range(0, h // 2):
        for x in range(0, w // 2):
            if b[y, x, 3] and farbe(b[y, x]) in MOPP - HOLZ:
                m[y, x] = True
    if m.sum() < 40:
        return None
    ys, xs = np.nonzero(m)
    bereich = np.zeros((h, w), bool)
    bereich[:min(h // 2, ys.max() + 6), :min(w // 2, xs.max() + 6)] = True
    weg = ohne_mopp(b, bereich)
    # Stiel unten rechts: Holzpixel rechts der Bildmitte unter der Faust, Gerade durch sie
    pts = [(y, x) for y in range(h // 2, fy) for x in range(w // 2, w) if b[y, x, 3] and farbe(b[y, x]) in HOLZ]
    if len(pts) < 10:
        return f"schräg: {weg} px Mopp oben entfernt, Stiel unten nicht gefunden"
    ys, xs = np.array(pts).T
    a, c = np.polyfit(ys, xs, 1)               # x = a*y + c
    y_end = int(ys.max())
    zeile = [farbe(b[y_end - 2, x]) for x in range(int(a * (y_end - 2) + c) - 2, int(a * (y_end - 2) + c) + 3)]
    holz_hell, holz_dunkel = (0x9e, 0x89, 0x7a), (0x70, 0x59, 0x60)
    for y in range(y_end - 1, fy - 6):
        x = a * y + c
        xi = int(round(x))
        for X, f in ((xi - 1, KONTUR), (xi, holz_dunkel), (xi + 1, holz_hell), (xi + 2, KONTUR)):
            if 0 <= X < w and not b[y, X, 3]:
                b[y, X, :3], b[y, X, 3] = f, 255
    kopf_setzen(b, vorlage, wl_v, unten_v, int(round(a * (fy - 6) + c)), fy - 1)
    return f"schräg, {weg} px Mopp oben entfernt, Stiel bis Zeile {fy - 6} verlängert"


def lose_teile_weg(b, mindest=60):
    lab, n = ndimage.label(b[..., 3] > 0, structure=np.ones((3, 3)))
    for i in range(1, n + 1):
        if (lab == i).sum() < mindest:
            b[lab == i] = 0


def main():
    alt = np.array(Image.open(sys.argv[1]).convert("RGBA"))
    neu = np.array(Image.open(sys.argv[2]).convert("RGBA"))
    ordner = Path(sys.argv[3])
    vorlage = mopp_kopf_vorlage(neu)
    for j in sorted(ordner.glob("hausmeister_*.json")):
        name = j.stem[len("hausmeister_"):]
        n = int(json.load(open(j, encoding="utf-8"))["bilder"])
        st = np.array(Image.open(j.with_suffix(".png")).convert("RGBA"))
        w = st.shape[1] // n
        for i in range(n):
            b = st[:, i * w:(i + 1) * w].copy()
            meld = None if name == "wischen" else (schraeg if name == "lesen" else gerade)(b, vorlage)
            if name == "lesen" and meld is None:
                meld = gerade(b, vorlage)
            if meld:
                lose_teile_weg(b)
            s = auge(b, alt)
            st[:, i * w:(i + 1) * w] = b
            print(f"{name} {i}: {meld or '-'}; Auge {s:.2f}")
        Image.fromarray(st, "RGBA").save(j.with_suffix(".png"))


if __name__ == "__main__":
    main()
