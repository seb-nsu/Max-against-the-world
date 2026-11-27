"""Ruhe (Atmen) und Reden (Mund und Kopf) für die Welt-4-Figuren aus dem Stand-Sprite, nach dem Muster von
tools/grafik_w3/reden_ruhe.py. Schreibt je Figur tools/figuren/<id>_rig.json, rechnet mit figur.py die Streifen
<id>_idle.png und <id>_talk.png und packt beide mit figur.py paket nach game/grafik/figuren/<id>.png und
game/daten/figuren/<id>.json (erzeugt, nicht von Hand bearbeiten).

Quelle sind die Stand-Sprites aus tools/grafik_w4/figuren_stand.py (ein Bild je Figur). Weil dieses Skript die
Spieldateien überschreibt, liest es aus einem eigenen Ordner: vorher die Stand-Sprites dorthin kopieren
(figuren_stand.py schreibt sie in game/grafik/figuren/, der Ordner hier ist eine Kopie davon).

Aufruf: python3 tools/grafik_w4/reden_ruhe.py <stand-ordner> <arbeitsordner> [figur …]   (ohne Figuren: alle)

Fable-Review 21.11.: jede sprechende Figur bekommt eine Mundbewegung (Tiere ohne gezeichneten Mund und
Schwebende bewegen Kopf oder Körper).
"""
import json
import subprocess
import sys
from collections import Counter
from pathlib import Path

import numpy as np
from PIL import Image

ST, ARB = Path(sys.argv[1]), Path(sys.argv[2])
NUR = set(sys.argv[3:])
WURZEL = Path(__file__).resolve().parents[2]
TOOLS = WURZEL / "tools"
MUND = "3e2731"; INNEN = "a22633"

# id: hals (Zeile unter dem Kopf), kx (Kopf x-Bereich), mund (x, y, Breite) oder Kasten (x, y, b, h) bei
# „schliessen“, huefte (Anteil der Höhe), art: mund | schliessen | kopf | schweben, gelenk (Drehpunkt Kopf, sonst
# Mitte des Kopfbereichs auf der Halszeile). Koordinaten im Stand-Sprite, mit tools/figur.py raster abgelesen.
F = {
    "gerd_glueck":      dict(hals=44, kx=(4, 40), mund=(22, 36, 5), huefte=0.55, art="mund"),   # Grinsen, Kiefer öffnet unter den Zähnen
    "sitcom_vater":     dict(hals=44, kx=(14, 54), mund=(41, 22, 5), huefte=0.58, art="mund"),
    "sitcom_vater_kiste": dict(hals=38, kx=(46, 74), mund=(63, 28, 3), huefte=0.62, art="mund"),
    "kommissar":        dict(hals=40, kx=(12, 48), mund=(32, 32, 4), huefte=0.56, art="mund"),
    "fbi_agent":        dict(hals=40, kx=(26, 56), mund=(44, 32, 4), huefte=0.56, art="mund"),
    "zappmann":         dict(hals=42, kx=(44, 80), mund=(70, 35, 5), huefte=0.58, art="mund"),
    "junger_zappmann":  dict(hals=44, kx=(4, 54), mund=(35, 37, 4), huefte=0.56, art="mund"),
    "wonder_wilma":     dict(hals=56, kx=(58, 84), mund=(74, 51, 3), huefte=0.58, art="mund"),
    "sitcom_mutter":    dict(hals=44, kx=(14, 44), mund=(35, 39, 4), huefte=0.56, art="mund"),
    "erzaehler":        dict(hals=36, kx=(14, 54), mund=(38, 30, 4), huefte=0.58, art="mund"),
    "super_siegfried":  dict(hals=48, kx=(22, 66), mund=(49, 35, 9, 8), huefte=0.56, art="schliessen"),  # gähnt
    "fledermann":       dict(hals=48, kx=(46, 82), mund=(70, 43, 5), huefte=0.56, art="mund"),
    "empfangsdame":     dict(hals=38, kx=(14, 56), mund=(38, 33, 4), huefte=0.58, art="mund"),
    "sitcom_sohn":      dict(hals=38, kx=(6, 44), mund=(33, 29, 4), huefte=0.56, art="mund"),
    "dr_werbepause":    dict(hals=44, kx=(50, 86), mund=(60, 34, 4), huefte=0.58, art="mund"),
    "troedel_experte":  dict(hals=34, kx=(4, 34), mund=(22, 28, 4), huefte=0.56, art="mund"),
    "sicherheitsmann":  dict(hals=38, kx=(20, 54), mund=(36, 33, 4), huefte=0.56, art="mund"),
    "wettkandidat":     dict(hals=44, kx=(10, 50), mund=(37, 38, 4), huefte=0.56, art="mund"),
    "zombie":           dict(hals=54, kx=(26, 60), mund=(43, 48, 4), huefte=0.58, art="mund"),
    "fabrikarbeiter":   dict(hals=44, kx=(10, 60), mund=None, huefte=0.58, art="kopf"),
    "hyaene":           dict(hals=36, kx=(22, 58), mund=(46, 32, 4), huefte=0.70, art="mund"),
    "loewe_krone":      dict(hals=76, kx=(33, 114), mund=(92, 62, 5), huefte=0.70, art="mund"),
    "loewe":            dict(hals=106, kx=(104, 202), mund=None, huefte=0.80, art="kopf", gelenk=(150, 104)),
    "gepard":           dict(hals=26, kx=(22, 52), mund=None, huefte=0.70, art="kopf"),
    "geier":            dict(hals=42, kx=(24, 52), mund=None, huefte=0.70, art="kopf"),
    "nashorn":          dict(hals=84, kx=(150, 198), mund=None, huefte=0.75, art="kopf", gelenk=(150, 50)),
    "flimmer":          dict(art="schweben"),
    "geist":            dict(art="schweben"),
    "flamingos":        dict(art="schweben"),
    "fledermann_kopfueber": dict(art="pendeln"),   # hängt am Laternenarm: schwingt um den oberen Rand
}


def mund_auflage(x, y, w, offen):
    px = [[x + i, y, MUND] for i in range(w)]
    if offen:
        px += [[x + i, y + 1, INNEN if 0 < i < w - 1 else MUND] for i in range(w)]
        if offen > 1:
            px += [[x + i, y + 2, MUND] for i in range(1, max(2, w - 1))]
    return px


def schliessen_auflage(sp, x, y, b, h, stufe):
    """Offen gezeichneten Mund schließen: dunkle Pixel im Kasten (ab der Mitte bei stufe 1, ganz bei stufe 2)
    bekommen die häufigste Hautfarbe aus dem Rand des Kastens, darüber eine Mundlinie."""
    rand = Counter()
    for xx in range(x - 1, x + b + 1):
        for yy in (y - 1, y + h):
            r, g, bl, a = sp.getpixel((xx, yy))
            if a and r + g + bl > 380:
                rand["%02x%02x%02x" % (r, g, bl)] += 1
    haut = rand.most_common(1)[0][0]
    ab = y + (h // 2 if stufe == 1 else 0)
    px = []
    for yy in range(ab, y + h):
        for xx in range(x, x + b):
            r, g, bl, a = sp.getpixel((xx, yy))
            if a and r + g + bl < 380:
                px.append([xx, yy, haut])
    linie = ab if stufe == 1 else y + h // 2
    px += [[xx, linie, MUND] for xx in range(x + 1, x + b - 1)]
    return px


def rig_bauen(fid, sp, d):
    w, h = sp.size
    art = d["art"]
    if art == "schweben":
        return {"knochen": [{"name": "koerper", "eltern": None, "gelenk": [w // 2, h], "spitze": [w // 2, 0], "z": 1}],
                "bewegungen": {
                    "idle": {"bilder": 4, "ms": 300, "posen": [{}, {"koerper": {"dy": -1}}, {"koerper": {"dy": -2}}, {"koerper": {"dy": -1}}]},
                    "talk": {"bilder": 4, "ms": 160, "posen": [{}, {"koerper": {"a": 0.04}}, {}, {"koerper": {"a": -0.04}}]}}}
    if art == "pendeln":
        return {"knochen": [{"name": "koerper", "eltern": None, "gelenk": [w // 2, 0], "spitze": [w // 2, h], "z": 1}],
                "bewegungen": {
                    "idle": {"bilder": 4, "ms": 340, "posen": [{}, {"koerper": 0.012}, {}, {"koerper": -0.012}]},
                    "talk": {"bilder": 4, "ms": 160, "posen": [{}, {"koerper": 0.025}, {}, {"koerper": -0.025}]}}}
    hals, kx = d["hals"], d["kx"]
    hy = int(h * d["huefte"])
    gx, gy = d.get("gelenk", ((kx[0] + kx[1]) // 2, hals))
    cx = (kx[0] + kx[1]) // 2
    rig = {"knochen": [
        {"name": "beine", "eltern": None, "gelenk": [cx, hy], "spitze": [cx, h], "z": 0},
        {"name": "koerper", "eltern": None, "gelenk": [cx, hy], "spitze": [cx, hals], "z": 1},
        {"name": "kopf", "eltern": "koerper", "gelenk": [gx, gy], "spitze": [cx, 0], "z": 2}],
        # Besitz nur über Flächen: sonst gehören Pixel nahe der Kopfknochen-Linie zum Kopf, und beim Drehen
        # reißt quer durch den Körper eine Lücke (Löwe, Nashorn).
        "zuordnung": {"koerper": [[0, 0], [w, 0], [w, hy], [0, hy]], "beine": [[0, hy], [w, hy], [w, h], [0, h]],
                      "kopf": [[kx[0], 0], [kx[1], 0], [kx[1], hals], [kx[0], hals]]},
        "auflagen": {}, "bewegungen": {}}
    a = min(0.035 if h > 120 else 0.05, 1.6 / max(gy, 1))   # Kopfspitze wandert höchstens 1,6 Pixel
    rig["bewegungen"]["idle"] = {"bilder": 4, "ms": 320, "posen": [{}, {"koerper": {"dy": 1}}, {"koerper": {"dy": 1}}, {}]}
    if art == "mund":
        rig["auflagen"] = {"halb": mund_auflage(*d["mund"], 1), "offen": mund_auflage(*d["mund"], 2)}
        rig["bewegungen"]["talk"] = {"bilder": 4, "ms": 140, "posen": [
            {}, {"kopf": a, "auflage": "offen"}, {"auflage": "halb"}, {"kopf": -a * 0.6, "auflage": "offen"}]}
    elif art == "schliessen":
        rig["auflagen"] = {"halb": schliessen_auflage(sp, *d["mund"], 1), "zu": schliessen_auflage(sp, *d["mund"], 2)}
        # Ruhe-Schleife mit Gähnen (docs/grafik/welt-4.md: „Siegfried gähnt“): erst geschlossen atmen, dann gähnen
        zu = {"auflage": "zu"}; tief = {"koerper": {"dy": 1}, "auflage": "zu"}
        rig["bewegungen"]["idle"] = {"bilder": 10, "ms": 320, "posen": [
            zu, tief, tief, zu, zu, tief, {"auflage": "halb"}, {"kopf": -a}, {"kopf": -a}, {"auflage": "halb"}]}
        rig["bewegungen"]["talk"] = {"bilder": 4, "ms": 140, "posen": [
            {"auflage": "zu"}, {"kopf": a}, {"auflage": "halb"}, {"kopf": -a * 0.6}]}
    else:
        rig["bewegungen"]["talk"] = {"bilder": 4, "ms": 150, "posen": [{}, {"kopf": a}, {}, {"kopf": -a}]}
    return rig


def luecken_fuellen(streifen, sp, n, rand=8):
    """Lücken an den Kanten bewegter Teile (durchsichtig, im Stand deckend, ringsum fast alles deckend) mit dem
    Stand-Pixel füllen."""
    a = np.array(Image.open(streifen).convert("RGBA"))
    st = np.zeros((a.shape[0], a.shape[1] // n, 4), np.uint8)
    s = np.asarray(sp); st[rand:rand + s.shape[0], rand:rand + s.shape[1]] = s
    w = st.shape[1]
    for i in range(n):
        f = a[:, i * w:(i + 1) * w]
        for _ in range(3):
            deck = f[..., 3] > 0
            p = np.pad(deck, 1)
            nachbarn = sum(p[1 + dy:p.shape[0] - 1 + dy, 1 + dx:p.shape[1] - 1 + dx]
                           for dy in (-1, 0, 1) for dx in (-1, 0, 1) if dy or dx)
            loch = ~deck & (st[..., 3] > 0) & (nachbarn >= 5)
            f[loch] = st[loch]
    Image.fromarray(a, "RGBA").save(streifen)


def main():
    ARB.mkdir(parents=True, exist_ok=True)
    for fid, d in F.items():
        if NUR and fid not in NUR:
            continue
        sp = Image.open(ST / f"{fid}.png").convert("RGBA")
        rig = rig_bauen(fid, sp, d)
        rp = TOOLS / "figuren" / f"{fid}_rig.json"
        rp.write_text(json.dumps(rig, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
        subprocess.run([sys.executable, str(TOOLS / "figur.py"), "animieren", str(ST / f"{fid}.png"), str(rp), str(ARB),
                        "--vorschau", "4"], check=True, capture_output=True)
        for name, b in rig["bewegungen"].items():
            luecken_fuellen(ARB / f"{fid}_{name}.png", sp, b["bilder"])
        spez = {"animationen": {name: {"streifen": f"{fid}_{name}.png", "bilder": b["bilder"], "ms": b["ms"], "schleife": True}
                                for name, b in rig["bewegungen"].items()}}
        sp_pfad = ARB / f"{fid}_spez.json"
        sp_pfad.write_text(json.dumps(spez, ensure_ascii=False), encoding="utf-8")
        bild = WURZEL / "game" / "grafik" / "figuren" / f"{fid}.png"
        js = WURZEL / "game" / "daten" / "figuren" / f"{fid}.json"
        subprocess.run([sys.executable, str(TOOLS / "figur.py"), "paket", str(sp_pfad), str(bild), str(js)],
                       check=True, capture_output=True)
        neu = json.loads(js.read_text(encoding="utf-8"))
        neu["quelle"] = f"tools/grafik_w4/reden_ruhe.py ({fid}) aus dem Stand von tools/grafik_w4/figuren_stand.py"
        js.write_text(json.dumps(neu, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
        print(fid, neu["bild"], list(neu["animationen"]))


if __name__ == "__main__":
    main()
