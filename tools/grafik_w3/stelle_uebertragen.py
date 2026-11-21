"""Eine im Stand-Sprite korrigierte Stelle (Mund, Fußpartie, Mopp, Auge) in alle Bewegungsstreifen übertragen.

Die Gesten aus folgen_mit_zwischenbildern.py enthalten den Stand (R) und Halbposen, die Teile des Stands
unverändert übernehmen. Statt die Streifen neu zu bauen, sucht das Skript den alten Stand rund um die geänderten
Stellen (Umgebung: alle deckenden Pixel im Rechteck um die Änderungen, 12 Zeilen größer) in jedem Bild. Liegt er
dort zu mindestens <schwelle> (Standard 0,8) vor, werden an dieser Lage genau die Pixel ersetzt, die noch dem alten
Stand gleichen. Was eine Pose verändert hat (Arm vor dem Mopp, Bein gehoben), bleibt so stehen. Eine gemeinsame
Lage für alle Stellen verhindert, dass kleine Stellen zufällig woanders passen.

Aufruf: py -3 stelle_uebertragen.py <alter_stand.png> <neuer_stand.png> <bewegungen-quelle> <bewegungen-ziel> <präfix> [schwelle]
Schwelle 1 überträgt nur auf Bilder, die an der Stelle pixelgleich zum Stand sind (Hausmeister: der Mopp wird in
den Posen neu gebaut, siehe hausmeister_mopp.py). Zusatz „weit“: senkrecht über die ganze Bildhöhe suchen (Läufe,
Morphäus-Kopf 20.11.). Zusatz „form“: Bilder mit eigener Farbgebung, deren Umriss um die
Stelle aber dem Stand gleicht (IoU ab 0,9, Schmidts Reden-Pose mit den Beinen des Stands), bekommen die Stelle ganz.
Kopiert jede <präfix>_*.png (+ .json) aus der Quelle ins Ziel und meldet je Streifen, welche Bilder geändert wurden.
"""
import json
import shutil
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage

SCHWELLE = 0.8


def teile(alt, neu):
    diff = (alt != neu).any(axis=2)
    lab, n = ndimage.label(ndimage.binary_dilation(diff, iterations=2))
    return [(lab == i) & diff for i in range(1, n + 1)]


def suchen(bild, alt, maske, such=12, weit=False):
    """Beste Lage (dx, dy) des alten Stands im Bild, gemessen nur auf der Stelle; liefert (Anteil, dx, dy).
    weit: senkrecht über die ganze Bildhöhe suchen (Läufe aus dem Teile-Rig haben oben viel Rand)."""
    ys, xs = np.nonzero(maske)
    fh, fw = bild.shape[:2]
    sh, sw = alt.shape[:2]
    best = (0.0, 0, 0)
    for dy in (range(-such, fh - sh + such + 1) if weit else range(fh - sh - such, fh - sh + such + 1)):
        for dx in range((fw - sw) // 2 - such * 4, (fw - sw) // 2 + such * 4 + 1):
            yy, xx = ys + dy, xs + dx
            ok = (yy >= 0) & (yy < fh) & (xx >= 0) & (xx < fw)
            if ok.mean() < 0.95:
                continue
            gleich = (bild[yy[ok], xx[ok]] == alt[ys[ok], xs[ok]]).all(axis=1).sum()
            # nur Pixel zählen, die im alten Stand etwas zeigen (sonst passen leere Flächen überall)
            sichtbar = alt[ys[ok], xs[ok], 3] > 0
            if sichtbar.sum() < 3:
                continue
            anteil = ((bild[yy[ok], xx[ok]] == alt[ys[ok], xs[ok]]).all(axis=1) & sichtbar).sum() / sichtbar.sum()
            if anteil > best[0]:
                best = (anteil, dx, dy)
    return best


def umgebung(alt, stellen):
    alle = np.any(stellen, axis=0)
    ys, xs = np.nonzero(alle)
    m = np.zeros(alle.shape, bool)
    m[max(0, ys.min() - 12):ys.max() + 13, max(0, xs.min() - 12):xs.max() + 13] = True
    return m & (alt[..., 3] > 0)


def umriss_gleich(bild, alt, stellen, dx, dy):
    """Überdeckung (IoU) der Umrisse im Rechteck um die Stellen bei Lage (dx, dy)."""
    alle = np.any(stellen, axis=0)
    ys, xs = np.nonzero(alle)
    y0, y1 = max(0, ys.min() - 12), ys.max() + 1
    a = alt[y0:y1, :, 3] > 0
    f = np.zeros_like(a)
    for y in range(y0, y1):
        for x in range(alt.shape[1]):
            Y, X = y + dy, x + dx
            if 0 <= Y < bild.shape[0] and 0 <= X < bild.shape[1]:
                f[y - y0, x] = bild[Y, X, 3] > 0
    return (a & f).sum() / max((a | f).sum(), 1)


def uebertragen(bild, alt, neu, stellen, schwelle=SCHWELLE, form=False, weit=False):
    anteil, dx, dy = suchen(bild, alt, umgebung(alt, stellen), weit=weit)
    voll = False
    if anteil < schwelle:
        # Posen mit eigener Farbgebung, aber den Beinen des Stands (gleicher Umriss): Stelle ganz ersetzen
        if not (form and anteil >= 0.3 and umriss_gleich(bild, alt, stellen, dx, dy) >= 0.9):
            return []
        voll = True
    geaendert = 0
    if voll:   # ganze Zeilen ab der obersten Stelle über die Standbreite, damit keine Konturreste der Pose bleiben
        y0 = int(np.nonzero(np.any(stellen, axis=0))[0].min())
        streifen = np.zeros(alt.shape[:2], bool)
        streifen[y0:] = True
        stellen = [streifen]
        # Reste der Pose links und rechts neben der Standbreite (Zipfel, der über den Rand ragte) entfernen
        for X in list(range(max(0, dx - 12), max(0, dx))) + list(range(dx + alt.shape[1], min(bild.shape[1], dx + alt.shape[1] + 12))):
            bild[y0 + dy:, X] = 0
    for m in stellen:
        ys, xs = np.nonzero(m)
        for y, x in zip(ys, xs):
            Y, X = y + dy, x + dx
            if 0 <= Y < bild.shape[0] and 0 <= X < bild.shape[1] and (voll or (bild[Y, X] == alt[y, x]).all()):
                bild[Y, X] = neu[y, x]
                geaendert += 1
    art = "Umriss, ganz ersetzt" if voll else "Umgebung"
    return [f"{geaendert} px ({art} {anteil:.2f}, Lage {dx},{dy})"] if geaendert else []


def main():
    alt = np.array(Image.open(sys.argv[1]).convert("RGBA"))
    neu = np.array(Image.open(sys.argv[2]).convert("RGBA"))
    quelle, ziel, praefix = Path(sys.argv[3]), Path(sys.argv[4]), sys.argv[5]
    schwelle = float(sys.argv[6]) if len(sys.argv) > 6 and sys.argv[6] not in ("form", "weit") else SCHWELLE
    form = "form" in sys.argv[6:]
    weit = "weit" in sys.argv[6:]
    ziel.mkdir(parents=True, exist_ok=True)
    alt[alt[..., 3] == 0] = 0
    neu[neu[..., 3] == 0] = 0
    stellen = teile(alt, neu)
    print(praefix, len(stellen), "Stellen")
    for j in sorted(quelle.glob(f"{praefix}_*.json")):
        p = j.with_suffix(".png")
        if not p.exists():
            continue
        if j.resolve() != (ziel / j.name).resolve():
            shutil.copy(j, ziel / j.name)
        n = int(json.load(open(j, encoding="utf-8"))["bilder"])
        st = np.array(Image.open(p).convert("RGBA"))
        st[st[..., 3] == 0] = 0
        w = st.shape[1] // n
        meldung = []
        for i in range(n):
            b = st[:, i * w:(i + 1) * w].copy()
            g = uebertragen(b, alt, neu, stellen, schwelle, form, weit)
            st[:, i * w:(i + 1) * w] = b
            if g:
                meldung.append(f"{i}: {', '.join(g)}")
        Image.fromarray(st, "RGBA").save(ziel / p.name)
        print(" ", p.stem, "|", "; ".join(meldung) or "nichts")


if __name__ == "__main__":
    main()
