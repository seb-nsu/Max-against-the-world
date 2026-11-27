"""Welt 4, erste Hintergründe: Korrekturen und Benennung mit Shot-Nummern (27.11.2026).
Aufruf: python3 korrigieren.py QUELLORDNER FRIEDHOF_FIX ZIELORDNER"""
import sys, os
import numpy as np
from PIL import Image, ImageFilter
Q, FIX, Z = sys.argv[1], sys.argv[2], sys.argv[3]
os.makedirs(Z, exist_ok=True)
def lade(k): return Image.open(os.path.join(Q, f"Gemini_Generated_Image_{k}.jpeg")).convert("RGB")
def box_px(im, b): W, H = im.size; return int(b[0]*W), int(b[1]*H), int(b[2]*W), int(b[3]*H)

def rahmen_umfaerben(im, b, farbe):
    a = np.asarray(im).astype(int).copy()
    x0, y0, x1, y1 = box_px(im, b)
    t = a[y0:y1, x0:x1]
    r, g, bl = t[..., 0], t[..., 1], t[..., 2]
    m = (g - r > 35) & (g - bl > 15)
    # Kanten mitnehmen
    mi = Image.fromarray((m*255).astype(np.uint8)).filter(ImageFilter.MaxFilter(5))
    m = np.asarray(mi) > 0
    hell = (r*0.3 + g*0.59 + bl*0.11) / 150.0
    neu = np.clip(np.array(farbe)[None, None, :] * np.clip(hell, 0.5, 1.3)[..., None], 0, 255)
    t[m] = neu[m]
    a[y0:y1, x0:x1] = t
    return Image.fromarray(a.astype(np.uint8))

def einsetzen(ziel, quelle, b, weich=25):
    if quelle.size != ziel.size: quelle = quelle.resize(ziel.size, Image.LANCZOS)
    x0, y0, x1, y1 = box_px(ziel, b)
    maske = Image.new("L", ziel.size, 0)
    maske.paste(255, (x0+weich, y0+weich, x1-weich, y1-weich))
    maske = maske.filter(ImageFilter.GaussianBlur(weich/2))
    return Image.composite(quelle, ziel, maske)

def graustufen_testbild(im):
    """Jeder Balken bekommt einen eigenen Grauton, hell nach dunkel in der Testbild-Reihenfolge."""
    a = np.asarray(im).astype(float)
    ref = {  # Farbe im Bild -> Grauwert
        (255, 255, 255): 245, (254, 231, 97): 210, (44, 232, 245): 178, (62, 180, 70): 146,
        (181, 80, 136): 114, (228, 59, 68): 82, (18, 78, 137): 48}
    grau = a @ np.array([0.299, 0.587, 0.114])
    out = grau.copy()
    sat = a.max(-1) - a.min(-1)
    best = np.full(grau.shape, 1e9); wert = np.zeros(grau.shape); refl = np.zeros(grau.shape)
    for c, g in ref.items():
        d = np.sqrt(((a - np.array(c))**2).sum(-1))
        k = d < best; best[k] = d[k]; wert[k] = g; refl[k] = np.dot(c, [0.299, 0.587, 0.114])
    bal = (best < 70) & ((sat > 60) | (grau > 235))
    out[bal] = np.clip(wert[bal] + (grau[bal] - refl[bal]) * 0.5, 0, 255)
    return Image.fromarray(out.astype(np.uint8)).convert("RGB")

PLAN = []
def speichere(im, name): im.save(os.path.join(Z, name)); PLAN.append(name)

# R01 Testbild: grüner Rahmen grau, Graustufen aus dem bunten Bild
GRAU = (150, 158, 175)
tb = {k: rahmen_umfaerben(lade(k), (0.03, 0.1, 0.22, 0.95), GRAU) for k in ["4wpug24wpug24wpu", "3gr7nc3gr7nc3gr7"]}
speichere(tb["4wpug24wpug24wpu"], "W4-R01_testbild_a_durcheinander.png")
speichere(tb["3gr7nc3gr7nc3gr7"], "W4-R01_testbild_b_geordnet.png")
speichere(graustufen_testbild(tb["4wpug24wpug24wpu"]), "W4-R01_testbild_c_graustufen.png")
speichere(lade("xl0rp2xl0rp2xl0r"), "W4-R02_rauschen.png")
# R03 Glücksrad: Rahmen gold wie die Bühne
speichere(rahmen_umfaerben(lade("7ti2ct7ti2ct7ti2"), (0.03, 0.1, 0.162, 0.95), (200, 150, 60)), "W4-R03_gluecksrad.png")
speichere(lade("psefwypsefwypsef"), "W4-R04_sitcom_kueche_a.png")
speichere(lade("ud55vfud55vfud55"), "W4-R04_sitcom_kueche_b_scherben.png")
speichere(lade("za7xraza7xraza7x"), "W4-R04_sitcom_kueche_c_tuer_weg.png")
speichere(lade("atze8eatze8eatze"), "W4-R05_savanne.png")
# R06 Friedhof: linker Rand aus der Gemini-Korrektur in alle drei Fassungen
fix = Image.open(FIX).convert("RGB")
for k, n in [("ttdas9ttdas9ttda", "a_haende"), ("z9icebz9icebz9ic", "b_graeber_offen"), ("6lb2hz6lb2hz6lb2", "c_tor_offen")]:
    speichere(einsetzen(lade(k), fix, (0.0, 0.08, 0.115, 0.8)), f"W4-R06_friedhof_{n}.png")
speichere(lade("2zqrvw2zqrvw2zqr"), "W4-R07_spukhaus_keller_a.png")
speichere(lade("tr92rytr92rytr92"), "W4-R07_spukhaus_keller_b_sitcomtuer.png")
speichere(lade("hh6sm2hh6sm2hh6s"), "W4-R08_spukhaus_halle_a.png")
speichere(lade("txsmk3txsmk3txsm"), "W4-R08_spukhaus_halle_b_lichter.png")
# R09 Kapitolis / R10 Fabrik: Türrahmen in dunklem Rot, damit es eine gewöhnliche Haustür ist
ROT = (150, 35, 45)
speichere(rahmen_umfaerben(lade("twnyl5twnyl5twny"), (0.0, 0.1, 0.14, 1.0), ROT), "W4-R09_kapitolis_a_amboss.png")
speichere(rahmen_umfaerben(lade("c57m6fc57m6fc57m"), (0.0, 0.1, 0.14, 1.0), ROT), "W4-R09_kapitolis_b_ohne_amboss.png")
speichere(rahmen_umfaerben(lade("19u7ri19u7ri19u7"), (0.0, 0.2, 0.09, 0.75), ROT), "W4-R10_fondue_fabrik_a.png")
speichere(rahmen_umfaerben(lade("5roi595roi595roi"), (0.0, 0.2, 0.09, 0.75), ROT), "W4-R10_fondue_fabrik_b_offen.png")
# R11 Werbespot: Regiestuhl aus der leeren Fassung einsetzen
leer = lade("ac9o6jac9o6jac9o")
speichere(einsetzen(lade("njzn1vnjzn1vnjzn"), leer, (0.17, 0.36, 0.4, 0.97)), "W4-R11_werbespot_set_a_magnet.png")
speichere(leer, "W4-R11_werbespot_set_b_leer.png")
print(len(PLAN), "Dateien nach", Z)
