"""Welt-4-Figuren: Stand-Sprites aus Sebastians Konzeptblättern (Gemini, 27.11.) und Einbau ins Spiel.

Ablauf je Figur wie in Welt 3 (tools/grafik_w3/liesmich.md): Magenta freistellen (magenta_frei.py, rand 1000),
dann tools/figur.py sprite --palette keine --kontur 262b44 auf die Zielgröße aus docs/grafik/welt-4.md.
„breite“ statt Höhe gilt für liegende Tiere (Löwe, Nashorn: „201 pixels long“); die Höhe wird dann aus dem
freigestellten Umriss gerechnet. Sitzende und hockende Figuren haben einen eigenen Wert (Standgröße mal Haltung).

Ausgabe:
  <arbeit>/stand/<name>.png                  alle Stand-Sprites, auch zweite Posen (loewe_krone, zombie_grab …)
  game/grafik/figuren/<id>.png               Spielfiguren (nur EINBAU), ein Bild als idle
  game/daten/figuren/<id>.json               dazu (Format wie tools/figur.py paket)

Aufruf: python3 tools/grafik_w4/figuren_stand.py <ordner mit den Gemini-JPEGs> <arbeitsordner> [name …]
"""
import json
import subprocess
import sys
from pathlib import Path

import numpy as np
from PIL import Image

WURZEL = Path(__file__).resolve().parents[2]
SPIEL = WURZEL / "game"
MAGENTA = WURZEL / "tools" / "grafik_w3" / "magenta_frei.py"
FIGUR = WURZEL / "tools" / "figur.py"

# Name: (Gemini-Datei ohne „Gemini_Generated_Image_“, Maß, Wert)
# Maß „hoehe“ oder „breite“ in Spielpixeln
BLAETTER = {
    "max_kaesemann": ("hjc0ikhjc0ikhjc0", "hoehe", 189),        # F30
    "wettkandidat": ("gonjv8gonjv8gonj", "hoehe", 189),         # F29
    "junger_zappmann": ("x4bejyx4bejyx4be", "hoehe", 189),      # F28
    "zappmann_sofa": ("g8ugp4g8ugp4g8ug", "hoehe", 160),        # F27, sitzend samt Sofa
    "zappmann": ("g8ugp4g8ugp4g8ug2", "hoehe", 209),            # F27
    "sicherheitsmann": ("i5ecmai5ecmai5ec", "hoehe", 216),      # F26
    "empfangsdame": ("dwn0tfdwn0tfdwn0", "hoehe", 150),         # F25, sitzt auf dem Bürostuhl (196 stehend)
    "fabrikarbeiter_hebel": ("37nz6f37nz6f37nz", "hoehe", 196),  # F24, zweite Pose
    "fabrikarbeiter": ("37nz6f37nz6f37nz2", "hoehe", 196),      # F24, winkt
    "dr_werbepause": ("sqlrasqlrasqlras", "hoehe", 201),        # F23
    "wonder_wilma": ("u64dcxu64dcxu64d", "hoehe", 196),         # F22
    "fledermann_kopfueber": ("3cmz1c3cmz1c3cmz", "hoehe", 196),  # F21, hängt am Laternenarm
    "fledermann": ("3cmz1c3cmz1c3cmz2", "hoehe", 196),          # F21
    "super_siegfried": ("7u3cis7u3cis7u3c", "hoehe", 216),      # F20
    "fbi_agent": ("7d2z4l7d2z4l7d2z", "hoehe", 201),            # F19
    "geist": ("vjarpmvjarpmvjar", "hoehe", 81),                 # F18
    "geist_2": ("vjarpmvjarpmvjar2", "hoehe", 81),
    "geist_3": ("vjarpmvjarpmvjar3", "hoehe", 81),
    "zombie_grab": ("8jf7yv8jf7yv8jf7", "hoehe", 140),          # F17, halb im Erdhaufen
    "zombie": ("odjoe1odjoe1odjo", "hoehe", 196),               # F16
    "nashorn": ("6bvhao6bvhao6bvh", "breite", 201),             # F14
    "flamingo": ("lszvlhlszvlhlszv", "hoehe", 81),              # F15
    "geier": ("wrm1frwrm1frwrm1", "hoehe", 101),                # F13, samt Ast
    "gepard_liegt": ("rds7nards7nards7", "breite", 120),        # F12, zweite Pose
    "gepard": ("rds7nards7nards72", "hoehe", 101),              # F12, sitzt
    "hyaene": ("2sek2k2sek2k2sek", "hoehe", 115),               # F11
    "loewe_krone": ("nxgn2anxgn2anxgn", "hoehe", 175),          # F10, steht mit Krone (Maßstab wie liegend)
    "loewe": ("nxgn2anxgn2anxgn2", "breite", 201),              # F10, liegt und schmollt
    "erzaehler_ohne_drehbuch": ("hz946vhz946vhz94", "hoehe", 150),  # F09, hockend (196 stehend)
    "erzaehler": ("hz946vhz946vhz942", "hoehe", 150),
    "kommissar": ("3pqzkl3pqzkl3pqz", "hoehe", 196),            # F08
    "sitcom_sohn": ("majyfqmajyfqmajy", "hoehe", 189),          # F07
    "sitcom_vater": ("f4v6gmf4v6gmf4v6", "hoehe", 196),         # F05, mit der Hühner-Keksdose
    "sitcom_vater_kiste": ("f4v6gmf4v6gmf4v62", "hoehe", 150),  # F05, sitzt auf der Kiste
    "sitcom_mutter": ("i3x1kei3x1kei3x1", "hoehe", 196),        # F06
    "max_testbild": ("hyag5lhyag5lhyag", "breite", 189),        # F04, liegt
    "flimmer": ("cvfvj4cvfvj4cvfv", "hoehe", 54),               # F03
    "troedel_experte": ("ecyiqsecyiqsecyi", "hoehe", 196),      # F02
    "gerd_glueck": ("uy10ltuy10ltuy10", "hoehe", 201),          # F01
}

# Figuren mit echtem Rosa oder Lila: strenger freistellen und nicht entfärben (sonst verschwindet Wilmas
# Trikot, und Flamingos werden grau-lila)
OHNE_ENTFAERBEN = {"flamingo", "wonder_wilma", "geier", "empfangsdame", "gerd_glueck", "dr_werbepause"}

# Spielfiguren (id in game/daten/raeume/welt-4.json) und ihr Stand-Sprite
EINBAU = {
    "gerd_glueck": "gerd_glueck", "troedel_experte": "troedel_experte", "flimmer": "flimmer",
    "sitcom_vater": "sitcom_vater", "sitcom_mutter": "sitcom_mutter", "sitcom_sohn": "sitcom_sohn", "kommissar": "kommissar",
    "erzaehler": "erzaehler", "loewe": "loewe", "hyaene": "hyaene", "gepard": "gepard", "geier": "geier",
    "nashorn": "nashorn", "flamingos": "flamingos", "zombie": "zombie", "geist": "geist",
    "fbi_agent": "fbi_agent", "super_siegfried": "super_siegfried", "fledermann": "fledermann",
    "wonder_wilma": "wonder_wilma", "fabrikarbeiter": "fabrikarbeiter", "dr_werbepause": "dr_werbepause",
    "empfangsdame": "empfangsdame", "sicherheitsmann": "sicherheitsmann", "zappmann": "zappmann",
    "junger_zappmann": "junger_zappmann", "wettkandidat": "wettkandidat",
    # Bildvarianten derselben Figur (welt_4.gd setzt sie je Raum mit grafik_laden)
    "fledermann_kopfueber": "fledermann_kopfueber", "sitcom_vater_kiste": "sitcom_vater_kiste",
    "loewe_krone": "loewe_krone", "gepard_liegt": "gepard_liegt",
}


def umriss_seiten(png):
    a = np.asarray(Image.open(png))[..., 3] > 0
    ys, xs = np.nonzero(a)
    return xs.max() - xs.min() + 1, ys.max() - ys.min() + 1


def frei_streng(src, ziel, rand=1000):
    """Wie magenta_frei.py, aber nur reines Magenta (Grün unter 70) ist Hintergrund: Rosa Trikot, Flamingo und
    lila Jackett bleiben stehen. Kein Entfärben."""
    from scipy import ndimage
    a = np.asarray(Image.open(src).convert("RGB")).astype(int)
    r, g, b = a[..., 0], a[..., 1], a[..., 2]
    mag = (r > 190) & (b > 180) & (g < 70)
    lab, n = ndimage.label(~mag)
    groesse = ndimage.sum(np.ones_like(lab), lab, range(1, n + 1))
    behalten = np.zeros(n + 1, bool); behalten[1:] = groesse > 400
    fg = ndimage.binary_fill_holes(behalten[lab]) & ~mag      # eingeschlossenes Magenta (Lasso, Stuhl) bleibt frei
    out = np.dstack([a.astype(np.uint8), (fg * 255).astype(np.uint8)])
    Image.fromarray(np.pad(out, ((0, 0), (rand, rand), (0, 0))), "RGBA").save(ziel)


def stand(quelle, arbeit, name):
    datei, mass, wert = BLAETTER[name]
    src = quelle / f"Gemini_Generated_Image_{datei}.jpeg"
    frei = arbeit / "frei" / f"{name}.png"
    ziel = arbeit / "stand" / f"{name}.png"
    frei.parent.mkdir(parents=True, exist_ok=True)
    ziel.parent.mkdir(parents=True, exist_ok=True)
    if name in OHNE_ENTFAERBEN:
        frei_streng(src, frei)
    else:
        subprocess.run([sys.executable, str(MAGENTA), str(src), str(frei), "1000"], check=True)
    hoehe = wert
    if mass == "breite":
        b, h = umriss_seiten(frei)
        hoehe = max(8, round(wert * h / b))
    subprocess.run([sys.executable, str(FIGUR), "sprite", str(frei), str(ziel), "--hoehe", str(hoehe),
                    "--palette", "keine", "--kontur", "262b44"], check=True, capture_output=True)
    if name == "fledermann_kopfueber":
        ohne_laternenarm(ziel)
    return ziel


def ohne_laternenarm(png):
    """Fledermann hängt im Bild an seinem eigenen Laternenarm; im Spiel hängt er am Arm des Hintergrunds
    (Kapitolis). Oben alles außer den Beinen entfernen (Beinbreite aus den Zeilen unter dem Arm)."""
    bild = np.asarray(Image.open(png)).copy()
    a = bild[..., 3] > 0
    breit = [y for y in range(min(60, a.shape[0])) if a[y].sum() > a.shape[1] * 0.5]
    if not breit:
        return
    unter = max(breit) + 4
    # Beine = längster zusammenhängender Lauf in der Zeile unter dem Arm (rechts hängt noch der Zierbügel)
    zeile = a[unter]
    laeufe, start = [], None
    for x, v in enumerate(list(zeile) + [False]):
        if v and start is None:
            start = x
        elif not v and start is not None:
            laeufe.append((x - start, start, x)); start = None
    zusammen = []                        # Läufe mit höchstens 4 px Lücke gehören zusammen (zwei Beine)
    for _, s0, s1 in laeufe:
        if zusammen and s0 - zusammen[-1][1] <= 4:
            zusammen[-1][1] = s1
        else:
            zusammen.append([s0, s1])
    x0, x1 = max(zusammen, key=lambda z: z[1] - z[0])
    bis = unter + 30                     # Zierbügel reicht bis etwa 30 Zeilen unter den Arm
    bild[:bis, :x0 - 1, 3] = 0
    bild[:bis, x1 + 1:, 3] = 0
    Image.fromarray(bild).save(png)


def flamingos(einzel, ziel):
    """Drei Flamingos nebeneinander (docs/grafik/welt-4.md: dreimal verwenden), der mittlere etwas höher."""
    f = Image.open(einzel)
    w, h = f.size
    abstand = round(w * 0.75)
    bild = Image.new("RGBA", (w + 2 * abstand, h + 3), (0, 0, 0, 0))
    for i, dy in enumerate((3, 0, 2)):
        bild.alpha_composite(f, (i * abstand, dy))
    bild.save(ziel)
    return ziel


def einbauen(arbeit, fid, name):
    src = arbeit / "stand" / f"{name}.png"
    if fid == "flamingos":
        src = flamingos(src, arbeit / "stand" / "flamingos.png")
    bild = Image.open(src).convert("RGBA")
    # Fußpunkt unten Mitte: gerade Breite, unterste Zeile mit Pixeln ist die Bildkante
    a = np.asarray(bild)[..., 3] > 0
    ys, xs = np.nonzero(a)
    bild = bild.crop((xs.min(), ys.min(), xs.max() + 1, ys.max() + 1))
    w, h = bild.size
    if w % 2:
        pad = Image.new("RGBA", (w + 1, h), (0, 0, 0, 0)); pad.paste(bild, (0, 0)); bild = pad; w += 1
    (SPIEL / "grafik" / "figuren").mkdir(parents=True, exist_ok=True)
    bild.save(SPIEL / "grafik" / "figuren" / f"{fid}.png")
    daten = {"bild": [w, h], "animationen": {"idle": {"von": 0, "bilder": 1, "ms": 500, "schleife": True}},
             "quelle": f"tools/grafik_w4/figuren_stand.py ({name})"}
    (SPIEL / "daten" / "figuren" / f"{fid}.json").write_text(json.dumps(daten, indent=1, ensure_ascii=False) + "\n")
    return w, h


def main():
    quelle, arbeit = Path(sys.argv[1]), Path(sys.argv[2])
    namen = sys.argv[3:] or list(BLAETTER)
    for name in namen:
        z = stand(quelle, arbeit, name)
        print(f"{name:26s} {Image.open(z).size}")
    for fid, name in EINBAU.items():
        if name in namen or (fid == "flamingos" and "flamingo" in namen):
            print("eingebaut", fid, einbauen(arbeit, fid, "flamingo" if fid == "flamingos" else name))


if __name__ == "__main__":
    main()
