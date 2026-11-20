"""Gestenbewegung aus einem Posenbogen bauen.

py -3 -B bew.py <id> <bewegung> <bogen> --posen N --folge "R,1*3,2*5,R" --ms 120 [--schleife]
       [--hoehe H] [--ref-pose K] [--angleichen] [--anker fuss|rumpf] [--ausschnitt X,Y,B,H]
       [--nehmen 1,2,3]  (welche Figuren des Bogens, 1-basiert, nach Erkennung)
       [--auswahl 0,1,2] [--probe]

R = erstes Idle-Bild des Spiel-Sprites. Ohne --hoehe: Maßstab so, dass Pose --ref-pose (1-basiert,
Standard: Median-Höhe) so hoch ist wie die Figur im Idle-Bild.
"""
import argparse, json, sys
from pathlib import Path
sys.dont_write_bytecode = True
sys.path.insert(0, r"E:\Claude\cq-welt3-posen\tools")
import numpy as np
from PIL import Image, ImageDraw, ImageFont
import figur

SPIEL = Path(r"E:\Game Engine\Grafiken\3d\welt3\spiel")
AUS = Path(r"E:\Game Engine\Grafiken\assets\welt3\bewegungen")
ARBEIT = Path(r"E:\Game Engine\Grafiken\3d\welt3")
BRAUN = (120, 90, 60, 255)

ap = argparse.ArgumentParser()
ap.add_argument("id"); ap.add_argument("bewegung"); ap.add_argument("bogen")
ap.add_argument("--posen", type=int, required=True)
ap.add_argument("--folge", required=True)
ap.add_argument("--ms", type=int, default=120)
ap.add_argument("--schleife", action="store_true")
ap.add_argument("--hoehe", type=int)
ap.add_argument("--ref-pose", type=int)
ap.add_argument("--angleichen", action="store_true")
ap.add_argument("--anker", default="fuss")
ap.add_argument("--ausschnitt")
ap.add_argument("--nehmen")
ap.add_argument("--spiegeln", action="store_true")
ap.add_argument("--sprite", help="anderes Spiel-Sprite (etwa archimedes_handtuch)")
ap.add_argument("--probe", action="store_true", help="nur Arbeitsdateien, nichts nach assets")
ap.add_argument("--transfer", type=float, default=0.0, help="0..1 Farbangleich an das Sprite")
ap.add_argument("--hist", type=float, default=0.0, help="0..1 Helligkeit per Histogramm an das Sprite")
ap.add_argument("--strich", type=float, default=80)
ap.add_argument("--dick", type=int, default=3, help="dunkle Linien im Bogen so breit machen (ungerade, Pixel)")
ap.add_argument("--saett", type=float, default=1.4)
ap.add_argument("--hell", type=float, default=1.0)
ap.add_argument("--linien", type=float, default=0.0)
ap.add_argument("--farben", type=int, default=12)
ap.add_argument("--spiegel-pose", default="", help="Posen (Nummer nach --nehmen) einzeln spiegeln")
ap.add_argument("--dx", default="", help="Verschiebung je Pose, etwa 2:-3,3:1 (Pose:Pixel)")
ap.add_argument("--dy", default="", help="Senkung je Pose in Pixeln (positiv = tiefer), etwa 1:2 (Fußlinie angleichen)")
ap.add_argument("--xstreck", type=float, default=1.0, help="Bogen waagrecht strecken (Figur breiter/schmaler als gezeichnet)")
ap.add_argument("--haut", default="", help="Farbton-Bereich im Bogen auf eine Zielfarbe setzen, etwa 8-28.5:c28569 "
                "(HSV-Grad; Helligkeit bleibt relativ; trennt Haut von gleichfarbiger Kleidung)")
ap.add_argument("--farbtausch", default="", help="optional: Farben der Posen tauschen, etwa 5a6988:3a4466,b86f50:733e39 (Idle R bleibt)")
ap.add_argument("--bodenreste", action="store_true", help="optional: flache lose Reste einer gemalten Bodenlinie unter den Füßen entfernen")
ap.add_argument("--kragen", default="", help="optional: VON:NACH nur für flache, breite Flächen der Farbe VON (Halsband), etwa f6757a:ff0044")
ap.add_argument("--licht", default="", help="optional: POSEN:FARBE, Leuchtpunkt am Halsband-Lautsprecher (unter dem vorderen Ende des Halsbands), etwa 1,3:2ce8f5")
ap.add_argument("--neu-hoehe", type=int, help="optional: Figur ohne Spiel-Sprite (Platzhalter), Zielhöhe in Pixeln; Endesga-Palette, kein R")
a = ap.parse_args()

sid = a.sprite or a.id
if a.neu_hoehe:   # noch kein Spiel-Sprite: Ersatz-Referenz (nur Höhe), Endesga-Palette
    ref = np.zeros((a.neu_hoehe, 4, 4), np.uint8); ref[:, 1:3] = [38, 43, 68, 255]
else:
    daten = json.loads((SPIEL / "daten" / "figuren" / f"{sid}.json").read_text(encoding="utf-8"))
    cw, ch = daten["bild"]
    sp = np.asarray(Image.open(SPIEL / "grafik" / "figuren" / f"{sid}.png").convert("RGBA"))
    ref = sp[:ch, :cw].copy()
ys, xs = np.nonzero(ref[..., 3] > 0)
ref_h = ys.max() - ys.min() + 1

aus = tuple(int(v) for v in a.ausschnitt.split(",")) if a.ausschnitt else None

# Spielpalette und Kontur aus dem Idle-Bild
arbeit = ARBEIT / a.id / "bewegungen"; arbeit.mkdir(parents=True, exist_ok=True)
pal = np.unique(ref[ref[..., 3] > 0][:, :3], axis=0)
palpfad = arbeit / f"_{sid}_palette.hex"
palpfad.write_text(chr(10).join("#%02x%02x%02x" % tuple(c) for c in pal), encoding="utf-8")
al = ref[..., 3] > 0
pp = np.pad(al, 1)
rand = al & ~(pp[:-2, 1:-1] & pp[2:, 1:-1] & pp[1:-1, :-2] & pp[1:-1, 2:])
from collections import Counter
kontur = "%02x%02x%02x" % Counter(map(tuple, ref[rand][:, :3])).most_common(1)[0][0]
if a.neu_hoehe:
    palpfad = "endesga"

# Bogen säubern: Magenta auch in eingeschlossenen Löchern durchsichtig, Farben an das Sprite angleichen
src = np.asarray(Image.open(a.bogen).convert("RGBA")).copy()
r_, g_, b_ = (src[..., i].astype(int) for i in range(3))
kern = (r_ > 170) & (b_ > 170) & (g_ < 120)
src[kern, 3] = 0
if a.haut:
    bereich, ziel_hex = a.haut.split(":")[:2]
    h0, h1 = (float(v) for v in bereich.split("-"))
    x = src[..., :3].astype(np.float32) / 255.0
    mx, mn = x.max(-1), x.min(-1); dd = mx - mn + 1e-6
    rr, gg, bb = x[..., 0], x[..., 1], x[..., 2]
    hue = np.where(mx == rr, ((gg - bb) / dd) % 6, np.where(mx == gg, (bb - rr) / dd + 2, (rr - gg) / dd + 4)) * 60
    sat = dd / (mx + 1e-6)
    hm = (hue > h0) & (hue < h1) & (sat > 0.25) & (mx > 0.3) & (mx < 0.95) & (src[..., 3] > 0)
    zf = np.array([int(ziel_hex[i:i + 2], 16) for i in (0, 2, 4)], np.float32)
    zf = zf.mean() + (zf - zf.mean()) / a.saett   # die spätere Sättigungsanhebung vorwegnehmen
    vref = float(np.median(mx[hm])) if hm.any() else 1.0
    neu = np.clip(zf[None, :] * (mx[hm] / vref)[:, None], 0, 255)
    src[hm, :3] = neu.astype(np.uint8)
    print("Haut umgefaerbt:", int(hm.sum()), "Pixel")
if a.transfer:
    rgb0 = src[..., :3].astype(np.float32)
    bgm = figur.hintergrund_maske(np.ascontiguousarray(src[..., :3]), 40) | (src[..., 3] < 128)
    fig = rgb0[~bgm]; spx = ref[al][:, :3].astype(np.float32)
    m1, s1 = fig.mean(0), fig.std(0) + 1e-3; m2, s2 = spx.mean(0), spx.std(0)
    neu = (rgb0 - m1) * (1 - a.transfer + a.transfer * s2 / s1) + m1 + a.transfer * (m2 - m1)
    src[..., :3] = np.where(bgm[..., None], src[..., :3], np.clip(neu, 0, 255)).astype(np.uint8)
if a.hell != 1.0:
    bgm = figur.hintergrund_maske(np.ascontiguousarray(src[..., :3]), 40) | (src[..., 3] < 128)
    x = src[..., :3].astype(np.float32) / 255.0
    neu = 1 - (1 - x) / a.hell   # hellt helle Töne auf, Linien bleiben dunkel
    src[..., :3] = np.where(bgm[..., None], src[..., :3], np.clip(neu * 255, 0, 255)).astype(np.uint8)
bgm = figur.hintergrund_maske(np.ascontiguousarray(src[..., :3]), 40) | (src[..., 3] < 128)
if a.hist:
    x = src[..., :3].astype(np.float32)
    Y = x @ np.array([0.299, 0.587, 0.114], np.float32)
    sel = (~bgm) & (Y > a.strich)
    spx = ref[al & ~rand][:, :3].astype(np.float32)
    Ys = spx @ np.array([0.299, 0.587, 0.114], np.float32); Ys = np.sort(Ys[Ys > 60])
    q = np.sort(Y[sel])
    rang = np.searchsorted(q, Y[sel]) / max(1, len(q) - 1)
    Yn = Ys[np.clip((rang * (len(Ys) - 1)).astype(int), 0, len(Ys) - 1)]
    f = (1 - a.hist) + a.hist * Yn / np.maximum(Y[sel], 1)
    x[sel] = np.clip(x[sel] * f[:, None], 0, 255)
    src[..., :3] = x.astype(np.uint8)
if a.dick < 0:
    ys_, xs_ = np.nonzero(~bgm)
    hh = [r[3] - r[1] for r in figur.alle_figuren(~bgm)]
    a.dick = max(3, int(round(max(hh) / max(ref_h, 1) * 0.55)) | 1)
    print("Linienbreite", a.dick)
if a.dick:
    x = src[..., :3].astype(np.float32)
    Y = x @ np.array([0.299, 0.587, 0.114], np.float32)
    linie = (x.max(-1) < a.strich + 15) & ~bgm
    from PIL import ImageFilter
    # nur dünne Linien: große dunkle Flächen (Haare, Gürtel) bleiben, wie sie sind
    kk = a.dick * 2 + 1
    lim = Image.fromarray(linie.astype(np.uint8) * 255)
    gross = np.asarray(lim.filter(ImageFilter.MinFilter(kk)).filter(ImageFilter.MaxFilter(kk))) > 0
    linie &= ~gross
    lm = np.asarray(Image.fromarray(linie.astype(np.uint8) * 255).filter(ImageFilter.MaxFilter(a.dick))) > 0
    lm &= ~gross
    lm &= ~bgm
    src[lm, :3] = [int(kontur[i:i + 2], 16) for i in (0, 2, 4)]
figur.LINIEN = a.linien
figur.SAETTIGUNG = a.saett
if a.xstreck != 1.0:
    hh_, ww_ = src.shape[:2]
    nw_ = int(round(ww_ * a.xstreck))
    src = np.asarray(Image.fromarray(src, "RGBA").resize((nw_, hh_), Image.LANCZOS)).copy()
    if aus:
        aus = (int(round(aus[0] * a.xstreck)), aus[1], int(round(aus[2] * a.xstreck)), aus[3])
sauber = arbeit / f"_{a.bewegung}_bogen_sauber.png"
Image.fromarray(src, "RGBA").save(sauber)
a.bogen_orig = a.bogen; a.bogen = str(sauber)

# Figuren und Höhen auf dem Bogen
rgb, bg, figs = figur.blatt_zyklus(a.bogen, aus, 40, a.posen)
hoehen = [r[3] - r[1] for r, _ in figs]
print("Figuren auf dem Bogen:", len(figs), "Rahmen:", [tuple(int(v) for v in r) for r, _ in figs])
nehmen = [int(v) - 1 for v in a.nehmen.split(",")] if a.nehmen else list(range(len(figs)))
if a.hoehe:
    H = a.hoehe
else:
    k = (a.ref_pose - 1) if a.ref_pose else int(np.argsort(hoehen)[len(hoehen) // 2])
    H = round(max(hoehen) * ref_h / hoehen[k])
print("Spielfigur hoch", ref_h, "-> --hoehe", H)

# figur.zyklus nutzt dieselbe Erkennung; anzahl erzwingt die Teilung
bilder = figur.zyklus(a.bogen, H, a.spiegeln, aus, palette=str(palpfad), konturfarbe=kontur,
                      farben=a.farben, anzahl=a.posen, angleichen=a.angleichen)
bilder = [bilder[i] for i in nehmen]
if a.bodenreste:
    from scipy import ndimage
    for b in bilder:
        lab, nn = ndimage.label(b[..., 3] > 0, np.ones((3, 3)))
        for j, sl in enumerate(ndimage.find_objects(lab), 1):
            hoch = sl[0].stop - sl[0].start; breit = sl[1].stop - sl[1].start
            unten_ = np.nonzero((b[..., 3] > 0).any(1))[0].max()
            if ((hoch <= 4 and breit >= 2 * hoch and (lab == j).sum() < 200) or (lab == j).sum() <= 4) and sl[0].stop > unten_ - 6:
                b[lab == j] = 0
if a.kragen:
    from scipy import ndimage
    v, n = a.kragen.split(":")
    for b in bilder:
        m = (b[..., :3] == [int(v[i:i + 2], 16) for i in (0, 2, 4)]).all(-1) & (b[..., 3] > 0)
        lab, nn = ndimage.label(m, np.ones((3, 3)))
        ys_ = np.nonzero((b[..., 3] > 0).any(1))[0]; oben_ = ys_[0] + 0.2 * (ys_[-1] - ys_[0])
        for j, sl in enumerate(ndimage.find_objects(lab), 1):
            hoch = sl[0].stop - sl[0].start; breit = sl[1].stop - sl[1].start
            if breit >= 2 * hoch and (lab == j).sum() >= 6 and sl[0].start > oben_:
                b[lab == j, :3] = [int(n[i:i + 2], 16) for i in (0, 2, 4)]
        # kleine runde NACH-Flecken (Augen, die beim Verkleinern rot wurden) -> Bernstein
        m2 = (b[..., :3] == [int(n[i:i + 2], 16) for i in (0, 2, 4)]).all(-1) & (b[..., 3] > 0)
        lab2, _ = ndimage.label(m2, np.ones((3, 3)))
        for j, sl in enumerate(ndimage.find_objects(lab2), 1):
            if (lab2 == j).sum() <= 5 and (sl[1].stop - sl[1].start) < 2 * (sl[0].stop - sl[0].start) + 1:
                b[lab2 == j, :3] = [0xfe, 0xae, 0x34]
        # Gegenrichtung oben (Ohren): NACH-Farbe im obersten Fünftel zurück auf VON
        oben_m = (b[..., :3] == [int(n[i:i + 2], 16) for i in (0, 2, 4)]).all(-1) & (b[..., 3] > 0)
        oben_m[int(np.ceil(oben_)):] = False
        b[oben_m, :3] = [int(v[i:i + 2], 16) for i in (0, 2, 4)]
if a.licht:
    posen_, farbe_ = a.licht.split(":")
    for pn in posen_.split(","):
        b = bilder[int(pn) - 1]
        rot = (b[..., :3] == [0xff, 0x00, 0x44]).all(-1) & (b[..., 3] > 0)
        ys_, xs_ = np.nonzero(rot)
        gesp = pn in a.spiegel_pose.split(",")   # wird erst später gespiegelt: vorderes Ende liegt dann links
        xc = xs_.min() if gesp else xs_.max()
        yc = ys_[(xs_ <= xc + 1) if gesp else (xs_ >= xc - 1)].max()
        for yy in (yc + 2, yc + 3):
            for xx in ((xc + 1, xc + 2) if gesp else (xc - 2, xc - 1)):
                if b[yy, xx, 3] > 0:
                    b[yy, xx, :3] = [int(farbe_[i:i + 2], 16) for i in (0, 2, 4)]
if a.farbtausch:
    for b in bilder:
        alt = b[..., :3].copy()
        for t in a.farbtausch.split(","):
            v, n = t.split(":")[:2]
            sel = (alt == [int(v[i:i + 2], 16) for i in (0, 2, 4)]).all(-1) & (b[..., 3] > 0)
            if len(t.split(":")) > 2:   # N: nur oberhalb der untersten N Zeilen; -N: nur in den untersten N Zeilen (Welt 3)
                ys_ = np.nonzero((b[..., 3] > 0).any(1))[0]; nz = int(t.split(":")[2])
                if nz >= 0:
                    sel[ys_.max() + 1 - nz:] = False
                else:
                    sel[:ys_.max() + 1 + nz] = False
            b[sel, :3] = [int(n[i:i + 2], 16) for i in (0, 2, 4)]
# Magenta-Säume weg: Pixel nahe Magenta durchsichtig
def entmagenta(b):
    b = b.copy(); r, g, bl = (b[..., i].astype(int) for i in range(3))
    m = (r > 150) & (bl > 150) & (g < 110) & (b[..., 3] > 0)
    b[m] = 0
    return b, int(m.sum())

def zuschnitt(b):
    ys, xs = np.nonzero(b[..., 3] > 0)
    return b[ys.min():ys.max() + 1, xs.min():xs.max() + 1], b.shape[0] - 1 - ys.max()

def ankerx(b):
    h = b.shape[0]; al = b[..., 3] > 0
    zone = al[int(h * 0.85):] if a.anker == "fuss" else al[int(h * 0.25):int(h * 0.55)]
    xs = np.nonzero(zone)[1]
    return xs.mean() if len(xs) else b.shape[1] / 2

dx = {}
for t in filter(None, a.dx.split(",")):
    k, v = t.split(":"); dx[int(k)] = int(v)
dy = {}
for t in filter(None, a.dy.split(",")):
    k, v = t.split(":"); dy[int(k)] = int(v)

teile = {}
magenta = 0
for i, b in enumerate(bilder, 1):
    b, n = entmagenta(b); magenta += n
    c, unten = zuschnitt(b)
    if str(i) in a.spiegel_pose.split(","):
        c = c[:, ::-1].copy()
    teile[str(i)] = (c, max(0, unten - dy.get(i, 0)), ankerx(c) - dx.get(i, 0))
if not a.neu_hoehe:
    rc, ru = zuschnitt(ref)
    teile["R"] = (rc, ru, ankerx(rc))

links = max(t[2] for t in teile.values()); rechts = max(t[0].shape[1] - t[2] for t in teile.values())
W = int(np.ceil(links + rechts)) + 8
H2 = max(t[0].shape[0] + t[1] for t in teile.values()) + 4
fertig = {}
for k, (c, unten, ax) in teile.items():
    f = np.zeros((H2, W, 4), np.uint8)
    x = int(round(4 + links - ax)); y = H2 - 2 - unten - c.shape[0]
    f[y:y + c.shape[0], x:x + c.shape[1]] = c
    fertig[k] = f

folge = []
for t in a.folge.split(","):
    t = t.strip()
    k, n = (t.split("*") + ["1"])[:2]
    folge += [k] * int(n)
strip = np.concatenate([fertig[k] for k in folge], 1)

name = f"{a.id}_{a.bewegung}"
ziel = arbeit if a.probe else AUS
ziel.mkdir(parents=True, exist_ok=True)
Image.fromarray(strip, "RGBA").save(ziel / f"{name}.png")

def auf_braun(f, s=3):
    im = Image.fromarray(f, "RGBA").resize((f.shape[1] * s, f.shape[0] * s), Image.NEAREST)
    g = Image.new("RGBA", im.size, BRAUN); g.alpha_composite(im); return g

gif = [auf_braun(fertig[k]).convert("P", palette=Image.ADAPTIVE, colors=255) for k in folge]
gif[0].save(ziel / f"{name}.gif", save_all=True, append_images=gif[1:], duration=a.ms, loop=0)

# Kontaktbogen: Läufe gleicher Bilder zusammengefasst
laeufe = []
for i, k in enumerate(folge):
    if laeufe and laeufe[-1][0] == k:
        laeufe[-1][2] = i
    else:
        laeufe.append([k, i, i])
s = 3; pad = 30
try:
    font = ImageFont.truetype("arial.ttf", 22)
except OSError:
    font = ImageFont.load_default()
B = Image.new("RGBA", (len(laeufe) * (W * s + 10) + 10, H2 * s + pad + 10), (60, 45, 30, 255))
d = ImageDraw.Draw(B)
for j, (k, i0, i1) in enumerate(laeufe):
    x = 10 + j * (W * s + 10)
    B.paste(auf_braun(fertig[k]), (x, pad))
    lab = f"{i0 + 1}" if i0 == i1 else f"{i0 + 1}-{i1 + 1}"
    lab += "  (Idle)" if k == "R" else f"  (Pose {k})"
    d.text((x + 4, 4), lab, fill=(255, 255, 255, 255), font=font)
B.convert("RGB").save(ziel / f"{name}_bogen.png")

meta = {"bilder": len(folge), "ms": a.ms, "schleife": bool(a.schleife),
        "quelle": Path(a.bogen_orig).name, "bild": [int(W), int(H2)], "folge": folge,
        "hinweis": "R = erstes Idle-Bild des Spiel-Sprites"}
(ziel / f"{name}.json").write_text(json.dumps(meta, ensure_ascii=False, indent=1), encoding="utf-8")

# Prüfbild groß: Posen + Idle nebeneinander, 4x
s = 4
P = Image.new("RGBA", (len(fertig) * (W * s + 8), H2 * s), (120, 90, 60, 255))
for j, k in enumerate(([] if a.neu_hoehe else ["R"]) + [str(i) for i in range(1, len(bilder) + 1)]):
    P.paste(auf_braun(fertig[k], s), (j * (W * s + 8), 0))
P.convert("RGB").save(arbeit / f"{name}_pruef.png")
print("fertig", ziel / name, "Bilder", len(folge), "Zelle", W, "x", H2, "Magenta-Pixel entfernt", magenta)
