"""Ruhe (Atmen) und Reden (Kopf und Mund) für die Welt-3-Figuren aus dem Stand-Sprite, dazu Kopfgesten
(Morphäus nickt, Herr Vier schüttelt den Kopf). Schreibt je Figur tools/figuren/<id>_rig.json und rechnet mit
figur.py die Streifen <id>_idle.png, <id>_talk.png (und Gesten) in den Ausgabeordner.
Aufruf: py -3 reden_ruhe.py <stand-ordner> <ausgabe-ordner> [figur …]   (ohne Figuren: alle)"""
import json, sys, subprocess
from pathlib import Path
from PIL import Image

ST, AUS = Path(sys.argv[1]), Path(sys.argv[2])
NUR = set(sys.argv[3:])
TOOLS = Path(__file__).resolve().parent.parent
MUND = "3e2731"; INNEN = "a22633"

# id: Hals-Zeile, Kopf x-Bereich, Mund (x, y, Breite) oder None, Hüft-Anteil, Art des Redens
F = {
    "morphaeus":           (35, (14, 46), (37, 29, 3), 0.58, "mund"),
    "deckert":             (44, (15, 70), (50, 37, 3), 0.60, "mund"),
    "herr_vier":           (52, (8, 49), (42, 46, 3), 0.58, "mund"),
    "orakel_oma":          (54, (5, 66), (56, 44, 3), 0.58, "mund"),
    "schmidt":             (34, (12, 43), (36, 29, 3), 0.56, "mund"),
    "schmidt_ohne_brille": (34, (12, 43), (36, 29, 3), 0.56, "mund"),
    "klon":                (35, (8, 37), (29, 30, 3), 0.56, "mund"),
    "kalle":               (40, (12, 53), (39, 34, 3), 0.58, "mund"),
    "kalle_ohne_laptop":   (40, (6, 47), (33, 34, 3), 0.58, "mund"),
    "rebellin":            (38, (4, 39), (31, 33, 2), 0.56, "mund"),
    "rebell":              (38, (15, 46), (37, 33, 3), 0.56, "mund"),
    "strassenmusiker":     (40, (28, 61), (55, 36, 2), 0.58, "mund"),
    "frau_regenschirm":    (45, (10, 52), (40, 39, 4), 0.62, "mund"),   # Stand mit geschlossenem Mund (20.11.)
    "weinender_mann":      (50, (40, 82), None, 0.70, "kopf"),
    "hausmeister":         (48, (45, 88), (67, 35, 11), 0.62, "lautsprecher"),
    "opa_hologramm":       (14, (8, 25), (20, 12, 2), 0.60, "mund"),
    "bernd":               (None, None, None, None, "schweben"),
    "max_ente":            (40, (0, 47), None, 0.62, "kopf"),
}


def mund_auflage(sp, x, y, w, offen):
    px = [[x + i, y, MUND] for i in range(w)]
    if offen:
        px += [[x + i, y + 1, INNEN if 0 < i < w - 1 else MUND] for i in range(w)]
        if offen > 1:
            px += [[x + i, y + 2, MUND] for i in range(1, max(2, w - 1))]
    return px


def lautsprecher(sp, x, y, w, stufe):
    """Sprechgitter des Hausmeisters aufleuchten lassen: dunkle Pixel im Gitter werden hell (stufe 1 oder 2)."""
    px = []
    for yy in range(y, y + w):
        for xx in range(x, x + w):
            r, g, b, a = sp.getpixel((xx, yy))
            if a and r + g + b < 260:
                px.append([xx, yy, "fee761" if stufe == 2 else "e4a672"])
    return px


for fid, (hals, kx, mund, huefte, art) in F.items():
    if NUR and fid not in NUR:
        continue
    sp = Image.open(ST / f"{fid}.png").convert("RGBA"); w, h = sp.size
    if art == "schweben":
        rig = {"knochen": [{"name": "koerper", "eltern": None, "gelenk": [w // 2, h], "spitze": [w // 2, 0], "z": 1}],
               "bewegungen": {"idle": {"bilder": 4, "ms": 300, "posen": [{}, {"koerper": {"dy": -1}}, {"koerper": {"dy": -2}}, {"koerper": {"dy": -1}}]},
                              "talk": {"bilder": 4, "ms": 160, "posen": [{}, {"koerper": {"a": 0.04}}, {}, {"koerper": {"a": -0.04}}]}}}
    else:
        hy = int(h * huefte); cx = (kx[0] + kx[1]) // 2
        rig = {"knochen": [
            {"name": "beine", "eltern": None, "gelenk": [cx, hy], "spitze": [cx, h], "z": 0},
            {"name": "koerper", "eltern": None, "gelenk": [cx, hy], "spitze": [cx, hals], "z": 1},
            {"name": "kopf", "eltern": "koerper", "gelenk": [cx, hals], "spitze": [cx, 0], "z": 2}],
            "zuordnung": {"kopf": [[kx[0], 0], [kx[1], 0], [kx[1], hals], [kx[0], hals]]},
            "auflagen": {}, "bewegungen": {}}
        if art == "mund":
            rig["auflagen"] = {"halb": mund_auflage(sp, *mund, 1), "offen": mund_auflage(sp, *mund, 2)}
        elif art == "lautsprecher":
            rig["auflagen"] = {"halb": lautsprecher(sp, *mund, 1), "offen": lautsprecher(sp, *mund, 2)}
        a = 0.035 if h > 120 else 0.05
        rig["bewegungen"]["idle"] = {"bilder": 4, "ms": 320, "posen": [{}, {"koerper": {"dy": 1}}, {"koerper": {"dy": 1}}, {}]}
        if art in ("mund", "lautsprecher"):
            rig["bewegungen"]["talk"] = {"bilder": 4, "ms": 140, "posen": [
                {}, {"kopf": a, "auflage": "offen"}, {"auflage": "halb"}, {"kopf": -a * 0.6, "auflage": "offen"}]}
        else:
            rig["bewegungen"]["talk"] = {"bilder": 4, "ms": 150, "posen": [{}, {"kopf": a}, {}, {"kopf": -a}]}
        if fid == "morphaeus":   # nickt zur Straße
            rig["bewegungen"]["nicken"] = {"bilder": 8, "ms": 110, "posen": [{}, {"kopf": 0.06}, {"kopf": 0.13}, {"kopf": 0.16},
                                                                            {"kopf": 0.13}, {"kopf": 0.06}, {}, {}]}
        if fid == "herr_vier":   # schüttelt den Kopf
            rig["bewegungen"]["kopf_schuetteln"] = {"bilder": 8, "ms": 100, "posen": [
                {}, {"kopf": {"a": -0.05, "dx": -1}}, {"kopf": {"a": 0.05, "dx": 1}}, {"kopf": {"a": -0.05, "dx": -1}},
                {"kopf": {"a": 0.05, "dx": 1}}, {"kopf": {"a": -0.03}}, {}, {}]}
    # Welt 2 hat eine Figur mit derselben Kennung (strassenmusiker): deren Rig nie überschreiben
    rp = TOOLS / "figuren" / (f"{fid}_w3_rig.json" if fid == "strassenmusiker" else f"{fid}_rig.json")
    rp.write_text(json.dumps(rig, ensure_ascii=False, indent=1), encoding="utf-8")
    out = subprocess.run(["py", "-3", str(TOOLS / "figur.py"), "animieren", str(ST / f"{fid}.png"), str(rp), str(AUS)],
                         capture_output=True, text=True)
    print(fid, out.stdout.count("Bilder"), out.stderr.strip()[-200:])
