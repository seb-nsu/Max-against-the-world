#!/usr/bin/env python3
"""Grundauflösung des Spiels an einer Stelle (05-spielsysteme.md, Bildschirmaufbau).

Vorläufig 480×270 (Sebastian, 9. November 2026; nach den ersten Testszenen noch einmal prüfen).
Die übrigen Werkzeuge lesen BREITE, HOEHE und die UI-Maße von hier; Godot liest die Auflösung aus
project.godot (display/window/size/viewport_*).

Ein späterer Wechsel, etwa auf 640×360:

    python3 tools/aufloesung.py --umrechnen 480x270 640x360

rechnet alle Koordinaten um (Welt-Tabellen, Platzhalter-Layouts, Popochiu-Szenen, Positionen in
handgeschriebenen Skripten), trägt die neue Auflösung hier und in project.godot ein und listet die
Stellen, die von Hand nachgesehen werden müssen. Danach: tools/godot_raeume.py (Platzhalter neu),
tools/pruefen.py und beide Testläufe.
"""
import argparse
import re
import sys
from fractions import Fraction
from pathlib import Path

BREITE, HOEHE = 640, 360
UI_LEISTE = 64          # Höhe der Inventarleiste oben
UI_ICON = 48            # Inventar-Icons, Porträts, Hilfe-Pfote (quadratisch)
UI_ZEIGER = 32          # Mauszeiger (quadratisch)

WURZEL = Path(__file__).resolve().parent.parent
GAME = WURZEL / "game"

# Popochiu-Szenen: Eigenschaften mit Spielpixeln
TSCN_VEKTOR = ("position", "walk_to_point", "dialog_pos", "offset")
TSCN_ZAHL = ("baseline", "walk_speed")
TSCN_POLYGON = ("polygon", "interaction_polygon")
TSCN_RAUM = ("width", "height")

# Handgeschriebene Skripte: Vector2-Literale mit Zahlen werden umgerechnet; diese Dateien nicht
SKRIPT_AUSNAHMEN = {"cq_save_load.gd", "simple_click_bar.gd"}


def faktor(alt, neu):
    ab, ah = (int(x) for x in alt.split("x"))
    nb, nh = (int(x) for x in neu.split("x"))
    f = Fraction(nb, ab)
    if Fraction(nh, ah) != f:
        sys.exit("Seitenverhältnis muss gleich bleiben")
    return f


def zahl(s, f):
    v = Fraction(s) * f
    if "." in s:
        return f"{float(v):.1f}" if v.denominator == 1 else f"{float(v):g}"
    if v.denominator == 1:
        return str(int(v))
    return str(int(v + Fraction(1, 2)) if v > 0 else -int(-v + Fraction(1, 2)))


def zahlen(text, f):
    return re.sub(r"(?<![\w.])-?\d+(?:\.\d+)?(?![\w.])", lambda m: zahl(m.group(), f), text)


def tscn(pfad, f):
    zeilen = pfad.read_text(encoding="utf-8").split("\n")
    raum = False
    for i, z in enumerate(zeilen):
        if z.startswith("[node"):
            raum = 'type="Node2D"' in z and "parent=" not in z
        m = re.match(r"^(\w+) = (.*)$", z)
        if not m:
            continue
        k, v = m.groups()
        if k in TSCN_VEKTOR and v.startswith("Vector2("):
            zeilen[i] = f"{k} = Vector2{zahlen(v[7:], f)}"
        elif k in TSCN_POLYGON:
            zeilen[i] = f"{k} = " + re.sub(r"PackedVector2Array\(([^)]*)\)",
                                          lambda m: f"PackedVector2Array({zahlen(m.group(1), f)})", v)
        elif k in TSCN_ZAHL or (raum and k in TSCN_RAUM):
            zeilen[i] = f"{k} = {zahl(v, f)}"
    pfad.write_text("\n".join(zeilen), encoding="utf-8")


def layout_yaml(pfad, f):
    """Platzhalter-Layout: jede Zahl in eckigen Klammern ist eine Koordinate."""
    aus = []
    for z in pfad.read_text(encoding="utf-8").split("\n"):
        if "farbe:" in z:
            aus.append(z)
            continue
        code, hash_, kommentar = z.partition("#")
        code = re.sub(r"\[[^\]\[]*(?:\[[^\]]*\][^\]\[]*)*\]", lambda m: zahlen(m.group(), f), code)
        aus.append(code + hash_ + kommentar)
    pfad.write_text("\n".join(aus), encoding="utf-8")


def welt_yaml(pfad, f):
    s = pfad.read_text(encoding="utf-8")
    s = re.sub(r"(groesse:\s*)(\d+)x(\d+)", lambda m: f"{m.group(1)}{zahl(m.group(2), f)}x{zahl(m.group(3), f)}", s)
    s = re.sub(r"(groesse_px:\s*)(\d+)", lambda m: m.group(1) + zahl(m.group(2), f), s)
    pfad.write_text(s, encoding="utf-8")


def skript(pfad, f):
    s = pfad.read_text(encoding="utf-8")
    neu = re.sub(r"Vector2i?\((\s*-?\d+(?:\.\d+)?\s*,\s*-?\d+(?:\.\d+)?\s*)\)",
                 lambda m: m.group().split("(")[0] + "(" + zahlen(m.group(1), f) + ")", s)
    if neu != s:
        pfad.write_text(neu, encoding="utf-8")
        return True
    return False


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--umrechnen", nargs=2, metavar=("ALT", "NEU"))
    a = ap.parse_args()
    if not a.umrechnen:
        print(f"{BREITE}x{HOEHE}")
        return
    alt, neu = a.umrechnen
    f = faktor(alt, neu)
    nb, nh = (int(x) for x in neu.split("x"))
    for p in sorted((WURZEL / "docs" / "welten").glob("*.yaml")):
        welt_yaml(p, f)
    for p in sorted((WURZEL / "tools" / "layout").glob("*.yaml")):
        layout_yaml(p, f)
    for p in sorted((GAME / "game").rglob("*.tscn")):
        if "/gui/" not in str(p):
            tscn(p, f)
    geaendert = []
    for ordner in ("game", "skripte", "oberflaeche"):
        for p in sorted((GAME / ordner).rglob("*.gd")):
            if p.name not in SKRIPT_AUSNAHMEN and "/gui/" not in str(p) and skript(p, f):
                geaendert.append(p.relative_to(WURZEL))
    pg = GAME / "project.godot"
    s = pg.read_text(encoding="utf-8")
    s = re.sub(r"viewport_width=\d+", f"viewport_width={nb}", s)
    s = re.sub(r"viewport_height=\d+", f"viewport_height={nh}", s)
    pg.write_text(s, encoding="utf-8")
    me = Path(__file__)
    s = me.read_text(encoding="utf-8")
    s = re.sub(r"^BREITE, HOEHE = \d+, \d+", f"BREITE, HOEHE = {nb}, {nh}", s, flags=re.M)
    for k in ("UI_LEISTE", "UI_ICON", "UI_ZEIGER"):
        s = re.sub(rf"^({k} = )(\d+)", lambda m: m.group(1) + zahl(m.group(2), f), s, flags=re.M)
    me.write_text(s, encoding="utf-8")
    print(f"Faktor {f}. Skripte mit umgerechneten Vector2-Literalen (Ausdrücke von Hand prüfen):")
    for p in geaendert:
        print("  ", p)
    print("Von Hand: Zahlen außerhalb von Vector2 in Skripten und Tests, game/game/gui/, Grafik-Dateien.")


if __name__ == "__main__":
    main()
