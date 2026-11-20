"""Rohbau der Welt-3-Räume als Vorlage für den Gemini-Chat (Blender, headless).

Jeder Raum wird aus Grundkörpern in echtem Maßstab gebaut (Max = 1,75 m) und mit derselben
Kamera gerendert: Blick frontal, Augenhöhe 1,7 m, 8 m vor der Vorderkante, Horizont in der
Bildmitte. So stimmen Perspektive, Bodenband und Größen zueinander. Je Raum entstehen zwei Bilder:
  <raum>_rohbau.png         sauber, ohne Schrift (geht als Bild in den Gemini-Chat)
  <raum>_rohbau_notiz.png   mit englischen Beschriftungen, Figurenplätzen (lila gestrichelt,
                            Platz frei lassen) und Max als Größenmaßstab vorn und hinten (grau)
Aufruf: blender --background --python tools/grafik_w3/rohbau_raeume.py -- AUSGABEORDNER [raum ...]
"""
import json
import math
import os
import sys

import bpy
from bpy_extras.object_utils import world_to_camera_view
from mathutils import Vector

CAM_Y, CAM_Z = -8.0, 2.3
NEIGUNG = 4.9   # Grad nach unten
VFOV = 23.3     # Grad; Max vorn etwa halb so hoch wie das Bild, Füße am unteren Rand

# Farben (Workbench, Objektfarbe)
WAND = (0.78, 0.78, 0.80, 1)
BODEN = (0.52, 0.52, 0.55, 1)
DECKE = (0.65, 0.65, 0.68, 1)
HELL = (0.92, 0.92, 0.90, 1)
MITTEL = (0.62, 0.60, 0.58, 1)
DUNKEL = (0.32, 0.32, 0.36, 1)
HOLZ = (0.62, 0.48, 0.34, 1)
GLAS = (0.62, 0.80, 0.86, 1)
ROT = (0.80, 0.25, 0.22, 1)
GRUEN = (0.30, 0.65, 0.35, 1)
GELB = (0.88, 0.78, 0.25, 1)
BLAU = (0.30, 0.45, 0.80, 1)
ORANGE = (0.95, 0.55, 0.20, 1)
CYAN = (0.30, 0.85, 0.90, 1)
MAGENTA = (0.85, 0.30, 0.75, 1)
HIMMEL = (0.55, 0.75, 0.95, 1)
NACHT = (0.10, 0.12, 0.20, 1)
STRASSE = (0.30, 0.30, 0.33, 1)
RASEN = (0.40, 0.62, 0.35, 1)

ROOMS = {}
_lab = []   # (text, Vector) Beschriftungen
_fig = []   # (text, x, y, hoehe, breite)
_W = 6.0


def raum(name, breite_px, himmel=None):
    def deco(f):
        ROOMS[name] = (f, breite_px, himmel)
        return f
    return deco


def X(x):
    """x in Metern von der linken Bildkante (an der Vorderkante gemessen) -> Welt."""
    return x - _W / 2


def box(label, x, y, w, d, h, z=0.0, col=MITTEL, rot=0.0, beschriften=True):
    bpy.ops.mesh.primitive_cube_add(size=1, location=(X(x), y + d / 2, z + h / 2))
    o = bpy.context.object
    o.scale = (w, d, h)
    o.rotation_euler[2] = math.radians(rot)
    o.color = col
    o.name = label or "box"
    if label and beschriften:
        _lab.append((label, Vector((X(x), y, z + h))))
    return o


def zyl(label, x, y, r, h, z=0.0, col=MITTEL, liegend=False, beschriften=True, ecken=32):
    bpy.ops.mesh.primitive_cylinder_add(vertices=ecken, radius=r, depth=h,
                                        location=(X(x), y, z + (0 if liegend else h / 2)))
    o = bpy.context.object
    if liegend:
        o.rotation_euler[0] = math.radians(90)
    o.color = col
    if label and beschriften:
        _lab.append((label, Vector((X(x), y, z + (r if liegend else h)))))
    return o


def kugel(label, x, y, r, z, col=MITTEL):
    bpy.ops.mesh.primitive_uv_sphere_add(radius=r, location=(X(x), y, z))
    o = bpy.context.object
    o.color = col
    if label:
        _lab.append((label, Vector((X(x), y, z + r))))
    return o


def figur(name, x, y, h, b=0.5):
    _fig.append((name, X(x), y, h, b))


def notiz(text, x, y, z):
    _lab.append((text, Vector((X(x), y, z))))


def innenraum(tiefe=4.0, hoehe=3.4, boden=BODEN, wand=WAND, decke=False):
    breite = _W * 2.2
    box(None, _W / 2, -1, breite, tiefe + 1, 0.02, z=-0.02, col=boden)
    box(None, _W / 2, tiefe, breite, 0.1, hoehe + 2, col=wand)
    if decke:
        box(None, _W / 2, -1, breite, tiefe + 1.1, 0.1, z=hoehe, col=DECKE)


def max_massstab():
    _fig.append(("Max 1.75 m (front)", X(0.5), 0.15, 1.75, 0.45))
    _fig.append(("Max (back of walk area)", X(_W - 0.8), 1.6, 1.75, 0.45))


# ------------------------------------------------------------------------------------------------
@raum("unterstadt_strasse", 1280, himmel=NACHT)
def unterstadt():
    box(None, 6, -1, 26, 5, 0.02, z=-0.02, col=STRASSE)                      # nasse Straße
    box(None, 6, 4.0, 26, 0.3, 0.12, col=DUNKEL)                              # Bordstein hinten
    for i, (x, h) in enumerate([(0.5, 14), (3.0, 10), (5.5, 16), (8.5, 12), (11.0, 15), (13.5, 11)]):
        box(None, x, 4.3 + (i % 2) * 0.5, 2.6, 2, h, col=(0.22, 0.24, 0.32, 1))
    # links: Nudelbude
    box("noodle stall counter (Mr Four behind it)", 1.2, 1.4, 2.2, 0.6, 1.05, col=HOLZ)
    box("stall roof", 1.2, 1.3, 2.6, 1.6, 0.12, z=2.4, col=ROT)
    zyl("steaming pot", 0.8, 1.7, 0.28, 0.4, z=1.05, col=DUNKEL)
    kugel("red paper lantern", 1.9, 1.5, 0.18, 2.1, col=ROT)
    for i in range(4):
        zyl(None, 0.4 + i * 0.55, 1.05, 0.17, 0.7, col=DUNKEL)
    notiz("4 stools", 1.2, 1.0, 0.75)
    zyl("concrete pillar", 2.75, 1.8, 0.25, 4.0, col=MITTEL)
    # Mitte: Telefonzelle
    box("glass phone booth (phone book inside)", 4.3, 2.4, 1.0, 1.0, 2.3, col=GLAS)
    box("hatch to resistance base (half open)", 6.2, 4.25, 1.4, 0.1, 1.2, col=DUNKEL)
    box("crashed hovercraft tail fin", 6.4, 4.4, 2.2, 0.4, 0.9, z=3.2, col=(0.5, 0.35, 0.25, 1), rot=-12)
    box("steam grate", 5.2, 0.8, 0.9, 0.6, 0.02, col=DUNKEL)
    box("origami unicorn (hand-sized)", 3.5, 0.2, 0.18, 0.08, 0.14, col=HELL)
    notiz("free spot: street musician", 7.2, 2.2, 0.1)
    # rechts: Vordach, Plakat, Gasse, Unterführung
    box("dripping awning (Deckert below)", 8.6, 2.6, 2.0, 1.4, 0.1, z=2.6, col=MAGENTA)
    box("pizza-slice neon billboard (blank)", 8.6, 4.3, 1.8, 0.1, 1.4, z=3.4, col=MAGENTA)
    box("alley entrance to pharmacy (green glow)", 10.2, 4.25, 1.1, 0.1, 2.6, col=(0.15, 0.35, 0.2, 1))
    box("underpass down to lab entrance", 11.6, 3.0, 1.2, 0.2, 2.2, col=(0.12, 0.12, 0.16, 1))
    figur("Mr Four", 1.2, 1.9, 1.7)
    figur("crying man", 2.0, 0.9, 1.75)
    figur("street musician", 7.2, 2.2, 1.75)
    figur("woman with umbrella", 6.9, 0.8, 1.7)
    figur("Deckert", 8.6, 2.4, 1.85)
    max_massstab()


@raum("apothekengasse", 1280, himmel=NACHT)
def apothekengasse():
    box(None, 6, -1, 26, 5, 0.02, z=-0.02, col=STRASSE)
    box(None, 6, 3.2, 26, 0.2, 6, col=(0.40, 0.28, 0.25, 1))                 # Ziegelwand
    box("exit back to street (left edge)", 0.4, 2.5, 0.8, 0.2, 2.6, col=(0.12, 0.12, 0.16, 1))
    for i in range(3):
        box(None, 1.6 + (i % 2) * 0.6, 2.5 - i * 0.05, 0.6, 0.6, 0.6, z=(0.6 if i == 2 else 0), col=HOLZ)
    notiz("stacked crates", 1.9, 2.4, 1.3)
    zyl("dripping pipe", 2.6, 3.1, 0.07, 4, col=DUNKEL)
    box("pharmacy vending machine", 6.0, 2.3, 1.6, 0.8, 2.3, col=(0.85, 0.88, 0.92, 1))
    box("green pharmacy cross", 6.0, 2.25, 0.4, 0.05, 0.4, z=2.35, col=GRUEN)
    zyl("scanner lens (head height)", 6.0, 2.25, 0.2, 0.05, z=1.6, col=CYAN, liegend=True)
    box("tray red", 5.65, 2.25, 0.4, 0.05, 0.25, z=0.95, col=ROT)
    box("tray blue", 6.35, 2.25, 0.4, 0.05, 0.25, z=0.95, col=BLAU)
    notiz("clear walkway in front of machine (Pixel walks past twice)", 6.0, 0.9, 0.05)
    box("flickering wall lamp", 9.3, 3.1, 0.3, 0.2, 0.3, z=2.4, col=GELB)
    box("dumpster", 10.6, 2.2, 1.8, 0.9, 1.2, col=(0.25, 0.35, 0.28, 1))
    box("rat hole", 11.6, 3.1, 0.25, 0.1, 0.18, col=(0.05, 0.05, 0.05, 1))
    figur("Morphaeus", 3.6, 1.6, 1.8)
    max_massstab()


@raum("widerstandsbasis", 1280)
def basis():
    innenraum(tiefe=4.0, hoehe=3.6, wand=(0.42, 0.44, 0.50, 1))
    box("open hull hatch, exit to street", 0.45, 3.5, 0.9, 0.3, 2.3, col=MAGENTA)
    for i in range(4):
        box("sleeping pod (Max's)" if i == 0 else None, 1.5 + i * 0.95, 2.6, 0.8, 1.3, 0.75, col=MITTEL)
        box(None, 1.5 + i * 0.95, 2.6, 0.75, 1.25, 0.08, z=0.75, col=GLAS)
    zyl("round window DIRECTLY above Max's pod", 1.5, 3.2, 0.35, 0.1, z=3.0, col=GLAS, liegend=True)
    notiz("pods 2-4", 3.4, 2.6, 0.9)
    box("patch panel: red circle / green triangle / yellow square", 5.3, 3.95, 0.8, 0.05, 0.5, z=1.2, col=DUNKEL)
    box("metal desk", 6.5, 3.0, 1.4, 0.7, 0.75, col=DUNKEL)
    box("old terminal (green screen)", 6.5, 3.1, 0.6, 0.5, 0.5, z=0.75, col=MITTEL)
    box("fuse box, 3 switches", 7.7, 3.95, 0.7, 0.05, 0.9, z=0.9, col=GELB)
    box("M.U.T.T.I. poster (blank area for text)", 7.7, 3.95, 0.9, 0.04, 1.1, z=2.0, col=HELL)
    box("cockpit console (switches)", 9.0, 3.2, 1.4, 0.8, 1.1, col=(0.35, 0.40, 0.45, 1))
    box("mainframe with tape reels", 10.2, 3.4, 0.9, 0.6, 2.2, col=MITTEL)
    box("table with Kalle's cup", 11.0, 2.4, 1.0, 0.7, 0.75, col=HOLZ)
    zyl(None, 11.1, 2.6, 0.06, 0.1, z=0.75, col=HELL)
    box("pizza boxes", 11.8, 3.5, 0.5, 0.5, 1.2, col=HOLZ)
    box("ventilation shaft (floor level)", 11.3, 3.95, 1.0, 0.05, 0.5, col=DUNKEL)
    notiz("empty corner for Piepsi", 11.8, 1.6, 0.05)
    figur("Rebel woman", 3.6, 1.2, 1.7)
    figur("Rebel man", 10.2, 1.3, 1.8)
    figur("Kalle", 9.0, 2.0, 1.75)
    max_massstab()


@raum("kuehlung", 640)
def kuehlung():
    innenraum(tiefe=3.0, hoehe=2.4, wand=(0.40, 0.45, 0.55, 1), decke=True)
    box("vent opening (where the shaft ends)", 0.9, 2.9, 0.7, 0.1, 0.5, col=(0.08, 0.08, 0.1, 1))
    box("cooling unit with frosted pipes", 3.0, 2.0, 1.8, 1.0, 1.8, col=MITTEL)
    zyl(None, 2.4, 2.0, 0.08, 2.4, col=HELL)
    zyl(None, 3.6, 2.0, 0.08, 2.4, col=HELL)
    zyl("bucket of water", 4.8, 1.8, 0.2, 0.35, col=DUNKEL)
    box("mop leaning on wall", 5.3, 2.8, 0.06, 0.06, 1.4, col=HOLZ, rot=10)
    notiz("low ceiling, floor clear for a cat", 2.5, 0.5, 0.05)
    _fig.append(("Pixel (cat)", X(1.5), 0.8, 0.45, 0.6))


@raum("laboreingang", 640)
def laboreingang():
    innenraum(tiefe=3.5, hoehe=3.0)
    box("exit back up to street (left edge)", 0.35, 2.5, 0.7, 0.2, 2.3, col=(0.12, 0.12, 0.16, 1))
    zyl("round steel blast door (closed)", 3.1, 3.45, 1.1, 0.15, z=1.1, col=DUNKEL, liegend=True)
    box("card reader", 4.5, 3.45, 0.2, 0.05, 0.3, z=1.2, col=ROT)
    box("corkboard with charts", 1.5, 3.45, 1.0, 0.05, 0.7, z=1.3, col=HOLZ)
    zyl("mop bucket", 1.5, 2.3, 0.22, 0.4, col=BLAU)
    box("warning stripes (back of floor)", 3, 3.0, 6, 0.4, 0.01, col=GELB)
    box("ceiling lamp", 3, 2.0, 0.6, 0.3, 0.1, z=2.85, col=HELL)
    notiz("no passage on the right side", 5.6, 2.5, 1.5)
    figur("Janitor robot", 2.1, 1.6, 1.75)
    max_massstab()


@raum("stadtstrasse", 1280, himmel=HIMMEL)
def stadtstrasse():
    box(None, 6, -1, 30, 3.2, 0.02, z=-0.02, col=(0.80, 0.80, 0.78, 1))     # Gehweg vorn (Laufband)
    box("curb", 6, 2.2, 30, 0.2, 0.12, col=HELL)
    box("ROAD for the cars in time (keep clear, cars are animated)", 6, 2.4, 30, 3.2, 0.01, col=STRASSE)
    box(None, 6, 5.6, 30, 1.0, 0.12, col=(0.80, 0.80, 0.78, 1))              # Gehweg hinten
    box(None, 6, 6.6, 30, 1.6, 0.02, col=RASEN)                              # Vorgärten
    for i in range(7):
        x = -1.5 + i * 2.6
        box("identical white house" if i == 1 else None, x, 8.2, 2.2, 2, 3.2, col=HELL)
        box(None, x, 8.1, 2.4, 2.2, 0.4, z=3.2, col=ROT)
    box("Oracle Granny's house: door, lace curtains, door sign", 6.2, 8.15, 0.6, 0.05, 1.3, col=HOLZ)
    for i in range(6):
        x = 0.6 + i * 2.0
        zyl("identical round tree + lamp" if i == 0 else None, x, 5.9, 0.07, 1.6, col=HOLZ)
        kugel(None, x, 5.9, 0.6, 2.1, col=GRUEN)
    for x in (2.0, 6.0, 10.0):
        kugel("same cloud x3" if x == 2.0 else None, x, 30, 1.6, 12, col=(1, 1, 1, 1))
    kugel("sun", 9.5, 30, 1.2, 15, col=GELB)
    # vorn links: Nachttisch als eigenes Vordergrundteil, Gasse
    box("narrow too-clean alley (arrival, left edge)", 0.25, 1.9, 0.5, 0.2, 2.6, col=MITTEL)
    box("bedside table + clock radio (own front piece)", 1.5, 0.5, 0.5, 0.4, 0.6, col=HOLZ)
    box(None, 1.5, 0.55, 0.3, 0.2, 0.12, z=0.6, col=DUNKEL)
    # rechts: Büroturm auf unserer Seite
    box("glass office tower (our side, cut off at top)", 11.6, 1.8, 1.6, 3, 9, col=GLAS)
    box("glass entrance door + intercom", 11.4, 1.75, 0.9, 0.05, 2.3, col=(0.40, 0.60, 0.70, 1))
    figur("Agent Schmidt", 9.6, 1.2, 1.85)
    figur("black cat", 6.5, 0.6, 0.35, 0.5)
    max_massstab()


@raum("kueche_orakel", 640)
def kueche():
    innenraum(tiefe=3.2, hoehe=2.6, wand=(0.85, 0.78, 0.62, 1))
    box("enamel oven with cookies", 0.8, 2.5, 0.75, 0.6, 0.9, col=(0.92, 0.88, 0.75, 1))
    box("dustpan + broom", 1.4, 2.8, 0.2, 0.1, 1.1, col=HOLZ)
    box("table (hip height of an adult)", 2.9, 1.6, 1.3, 0.8, 0.76, col=HOLZ)
    box(None, 2.9, 1.6, 1.3, 0.8, 0.05, z=0.76, col=HOLZ)
    zyl(None, 2.7, 2.0, 0.12, 0.2, z=0.81, col=BLAU)
    notiz("plate, teapot, fork, manual", 2.9, 1.6, 0.95)
    box("chair", 2.0, 1.4, 0.45, 0.45, 0.95, col=HOLZ)
    box("high shelf: piggy bank, radio, 3 jars", 4.5, 3.0, 1.2, 0.3, 0.05, z=1.8, col=HOLZ)
    kugel(None, 4.2, 3.1, 0.13, 1.98, col=BLAU)
    box("small shelf: hen kitchen timer", 4.5, 3.0, 0.6, 0.3, 0.05, z=1.0, col=HOLZ)
    box("front door (right edge)", 5.6, 3.1, 0.9, 0.1, 2.05, col=HOLZ)
    box("window with lace curtains", 2.9, 3.15, 1.2, 0.05, 0.9, z=1.2, col=GLAS)
    box("cuckoo clock", 1.6, 3.15, 0.3, 0.1, 0.45, z=1.7, col=HOLZ)
    figur("Oracle Granny", 1.5, 1.8, 1.6)
    max_massstab()


@raum("buero_50", 640)
def buero():
    innenraum(tiefe=3.5, hoehe=2.8, wand=(0.85, 0.88, 0.82, 1))
    for i in range(7):
        x = -1.2 + i * 1.4
        box("ROW OF IDENTICAL GREY DOORS" if i == 3 else None, x, 3.45, 0.85, 0.05, 2.05, col=MITTEL)
        if i < 6:
            zyl(None, x + 0.7, 3.2, 0.15, 0.6, col=GRUEN)
    notiz("identical potted plant between each door", 3.1, 3.2, 0.7)
    box("elevator door (exit) + window to same corridor", 0.6, 3.4, 0.9, 0.1, 2.1, col=DUNKEL)
    for i, (c, s) in enumerate([(ROT, "circle"), (GRUEN, "triangle"), (GELB, "square")]):
        box(f"{s} on {['red', 'green', 'yellow'][i]} (own field)", 2.4 + i * 0.75, 3.38, 0.6, 0.05, 0.6, z=1.6, col=c)
    box("terminal on side table", 3.15, 2.9, 0.6, 0.4, 0.9, col=DUNKEL)
    box("photocopier", 4.6, 2.6, 0.9, 0.7, 1.1, col=MITTEL)
    box("water cooler (room for a cup)", 5.3, 2.8, 0.35, 0.35, 1.3, col=GLAS)
    box("staircase ending in the ceiling", 5.9, 3.0, 0.6, 1.0, 2.8, col=HELL, rot=0)
    notiz("long clear floor for many clones in depth", 3.0, 1.0, 0.05)
    figur("Agent Schmidt", 3.6, 1.2, 1.85)
    figur("clone", 2.0, 2.0, 1.85)
    figur("clone", 4.4, 2.4, 1.85)
    max_massstab()


def testkammer_basis():
    innenraum(tiefe=3.5, hoehe=3.2, wand=(0.95, 0.95, 0.95, 1), boden=(0.85, 0.85, 0.85, 1))
    for i in range(9):
        box(None, -1 + i * 1.0, 3.48, 0.03, 0.02, 3.2, col=(0.75, 0.75, 0.75, 1))


@raum("testkammer_1", 640)
def tk1():
    testkammer_basis()
    box("entrance (open, from the capsule)", 0.4, 3.0, 0.9, 0.1, 2.2, col=(0.3, 0.3, 0.3, 1))
    box("empty wall mount for portal device", 1.6, 3.45, 0.4, 0.05, 0.5, z=1.3, col=MITTEL)
    zyl("big red floor button", 3.0, 1.6, 0.45, 0.06, col=ROT)
    box("sliding exit door (closed)", 5.4, 3.4, 1.0, 0.1, 2.3, col=MITTEL)
    zyl("small ceiling speaker", 3.0, 2.0, 0.15, 0.05, z=3.15, col=DUNKEL)
    box("cardboard cake", 5.7, 2.0, 0.4, 0.4, 0.3, col=HOLZ)
    figur("Bernd (cube)", 4.2, 1.8, 0.55, 0.55)
    max_massstab()


@raum("testkammer_2", 640)
def tk2():
    testkammer_basis()
    box("entrance", 0.4, 3.0, 0.9, 0.1, 2.2, col=(0.3, 0.3, 0.3, 1))
    box("small empty pedestal (rubber chicken)", 1.6, 2.6, 0.4, 0.4, 0.8, col=HELL)
    box("exit door (closed)", 5.4, 3.4, 1.0, 0.1, 2.3, col=MITTEL)
    box("emitter", 4.7, 2.8, 0.15, 0.15, 2.0, col=DUNKEL)
    box("emitter", 6.1, 2.8, 0.15, 0.15, 2.0, col=DUNKEL)
    box("LASER ACROSS THE EXIT DOOR (blocks the way)", 5.4, 2.85, 1.4, 0.03, 0.04, z=1.2, col=ROT)
    box(None, 5.4, 2.85, 1.4, 0.03, 0.04, z=0.6, col=ROT)
    box("scribbles + small neat print (rule 3), low on panel", 3.8, 3.44, 0.7, 0.02, 0.4, z=0.2, col=DUNKEL)
    zyl("loudspeaker", 3.0, 3.4, 0.25, 0.08, z=2.5, col=DUNKEL, liegend=True)
    notiz("walk area ends before the laser", 5.4, 1.6, 0.05)
    max_massstab()


@raum("testkammer_3", 640)
def tk3():
    testkammer_basis()
    box("entrance", 0.4, 3.0, 0.9, 0.1, 2.2, col=(0.3, 0.3, 0.3, 1))
    notiz("spot for the rubber chicken", 1.5, 2.0, 0.05)
    box("exit door with big padlock symbol", 5.0, 3.4, 1.1, 0.1, 2.4, col=MITTEL)
    box("NARROW FLOOR SLOT directly in front of door, one cube wide", 5.0, 2.6, 0.6, 0.6, 0.01, col=(0.1, 0.1, 0.1, 1))
    zyl("BIG round wall speaker (window-sized)", 3.3, 3.4, 0.6, 0.08, z=1.5, col=DUNKEL, liegend=True)
    _fig.append(("Bernd in the slot, blocking the door", X(5.0), 2.9, 0.55, 0.55))
    max_massstab()


@raum("kern", 640)
def kern():
    innenraum(tiefe=4.0, hoehe=5.0, wand=(0.95, 0.95, 0.95, 1), boden=(0.85, 0.85, 0.85, 1), decke=False)
    box("orange warning stripe (curved wall)", 3, 3.95, 12, 0.05, 0.25, z=1.0, col=ORANGE)
    box("entrance door (left)", 0.4, 3.4, 0.9, 0.1, 2.2, col=MITTEL)
    box("white pedestal (keep walk area around it)", 2.6, 2.2, 0.8, 0.8, 0.9, col=HELL)
    zyl("glowing energy cell", 2.6, 2.6, 0.18, 0.7, z=0.9, col=ORANGE)
    box("thick cables to pedestal", 2.6, 2.8, 0.2, 1.2, 0.08, col=DUNKEL)
    notiz("upper right kept EMPTY: M.U.T.T.I. hangs from the ceiling", 4.6, 3.5, 4.6)
    figur("M.U.T.T.I. (hangs, own sprite)", 4.6, 2.5, 2.4, 1.3)
    max_massstab()


# ------------------------------------------------------------------------------------------------
def szene_leeren():
    bpy.ops.wm.read_factory_settings(use_empty=True)


def kamera_und_render(breite_px, himmel):
    sc = bpy.context.scene
    cam_data = bpy.data.cameras.new("cam")
    cam_data.sensor_fit = "VERTICAL"
    cam_data.angle_y = math.radians(VFOV)
    cam = bpy.data.objects.new("cam", cam_data)
    cam.location = (0, CAM_Y, CAM_Z)
    cam.rotation_euler = (math.radians(90 - NEIGUNG), 0, 0)
    sc.collection.objects.link(cam)
    sc.camera = cam
    sc.render.engine = "BLENDER_WORKBENCH"
    sh = sc.display.shading
    sh.light = "STUDIO"
    sh.color_type = "OBJECT"
    sh.show_cavity = True
    sh.show_object_outline = True
    sh.object_outline_color = (0.1, 0.1, 0.1)
    sh.show_shadows = True
    sh.shadow_intensity = 0.25
    sc.render.resolution_x = 2560 if breite_px > 640 else 1280
    sc.render.resolution_y = 720
    w = bpy.data.worlds.new("w")
    sc.world = w
    w.color = (himmel or (0.2, 0.2, 0.2, 1))[:3]
    sh.background_type = "WORLD"
    return cam


def projiziert(cam, v):
    sc = bpy.context.scene
    p = world_to_camera_view(sc, cam, v)
    return p.x * sc.render.resolution_x, (1 - p.y) * sc.render.resolution_y


def main():
    argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
    aus = os.path.abspath(argv[0] if argv else "rohbau")
    nur = argv[1:]
    os.makedirs(aus, exist_ok=True)
    global _W
    for name, (f, breite_px, himmel) in ROOMS.items():
        if nur and name not in nur:
            continue
        szene_leeren()
        _lab.clear()
        _fig.clear()
        _W = 12.0 if breite_px > 640 else 6.0
        f()
        cam = kamera_und_render(breite_px, himmel)
        pfad = os.path.join(aus, f"{name}_rohbau.png")
        bpy.context.scene.render.filepath = pfad
        bpy.ops.render.render(write_still=True)
        info = {"raum": name, "breite": bpy.context.scene.render.resolution_x, "hoehe": 720,
                "labels": [[t, *projiziert(cam, v)] for t, v in _lab],
                "figuren": []}
        for t, x, y, h, b in _fig:
            fx0, fy0 = projiziert(cam, Vector((x - b / 2, y, 0)))
            fx1, fy1 = projiziert(cam, Vector((x + b / 2, y, h)))
            info["figuren"].append([t, fx0, fy1, fx1, fy0])
        with open(os.path.join(aus, f"{name}_rohbau.json"), "w", encoding="utf-8") as fh:
            json.dump(info, fh, indent=1)
        print("RAUM", name, "ok")


main()
