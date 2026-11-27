"""Rohbau der Welt-4-Räume als Vorlage für den Gemini-Chat (Blender, headless).

Gleiche Kamera und gleicher Maßstab wie Welt 3 (`tools/grafik_w3/rohbau_raeume.py`): Max = 1,75 m,
Kamera 2,3 m hoch, 8 m vor der Vorderkante, leicht nach unten geneigt. Breite Räume 2560 × 720
(32:9, wird 1280 × 360), die übrigen 1280 × 720. Je Raum entstehen:
  <raum>_rohbau.png         sauber, ohne Schrift (geht als Bild in den Gemini-Chat)
  <raum>_rohbau.json        Beschriftungen und Figurenplätze für tools/grafik_w3/rohbau_notiz.py
Lage der Dinge nach Skript, Rätseln und Review vom 25.11. (Türen an der Naht für Bild-in-Bild,
Breitbild für Küche, Werbespot-Set und Empfang, Studio mit Platz für die Kampfzustände).

Aufruf: blender --background --python tools/grafik_w4/rohbau_raeume.py -- AUSGABEORDNER [raum ...]
   oder mit dem Python-Paket bpy: python tools/grafik_w4/rohbau_raeume.py -- AUSGABEORDNER [raum ...]
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

WAND = (0.78, 0.78, 0.80, 1)
BODEN = (0.52, 0.52, 0.55, 1)
DECKE = (0.65, 0.65, 0.68, 1)
HELL = (0.92, 0.92, 0.90, 1)
MITTEL = (0.62, 0.60, 0.58, 1)
DUNKEL = (0.32, 0.32, 0.36, 1)
SCHWARZ = (0.08, 0.08, 0.10, 1)
HOLZ = (0.62, 0.48, 0.34, 1)
GLAS = (0.62, 0.80, 0.86, 1)
ROT = (0.80, 0.25, 0.22, 1)
GRUEN = (0.30, 0.65, 0.35, 1)
GELB = (0.88, 0.78, 0.25, 1)
GOLD = (0.85, 0.68, 0.25, 1)
BLAU = (0.30, 0.45, 0.80, 1)
ORANGE = (0.95, 0.55, 0.20, 1)
CYAN = (0.30, 0.85, 0.90, 1)
MAGENTA = (0.85, 0.30, 0.75, 1)
LILA = (0.45, 0.25, 0.60, 1)
GIFTGRUEN = (0.45, 0.90, 0.30, 1)
PASTELL = (0.95, 0.90, 0.65, 1)
MINZE = (0.70, 0.90, 0.80, 1)
OCKER = (0.80, 0.62, 0.32, 1)
HIMMEL_ABEND = (0.95, 0.60, 0.35, 1)
NACHT = (0.12, 0.08, 0.20, 1)
STUDIO = (0.10, 0.10, 0.12, 1)
RAUSCH = (0.55, 0.55, 0.55, 1)

ROOMS = {}
_lab = []   # (text, Vector)
_fig = []   # (text, x, y, hoehe, breite, z)
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
    if label and beschriften:
        _lab.append((label, Vector((X(x), y, z + h))))
    return o


def zyl(label, x, y, r, h, z=0.0, col=MITTEL, liegend=False, ecken=32):
    bpy.ops.mesh.primitive_cylinder_add(vertices=ecken, radius=r, depth=h,
                                        location=(X(x), y, z + (0 if liegend else h / 2)))
    o = bpy.context.object
    if liegend:
        o.rotation_euler[0] = math.radians(90)
    o.color = col
    if label:
        _lab.append((label, Vector((X(x), y, z + (r if liegend else h)))))
    return o


def kugel(label, x, y, r, z, col=MITTEL):
    bpy.ops.mesh.primitive_uv_sphere_add(radius=r, location=(X(x), y, z))
    o = bpy.context.object
    o.color = col
    if label:
        _lab.append((label, Vector((X(x), y, z + r))))
    return o


def figur(name, x, y, h, b=0.5, z=0.0):
    _fig.append((name, X(x), y, h, b, z))


def notiz(text, x, y, z):
    _lab.append((text, Vector((X(x), y, z))))


def innenraum(tiefe=4.0, hoehe=3.4, boden=BODEN, wand=WAND, decke=False):
    breite = _W * 2.2
    box(None, _W / 2, -1, breite, tiefe + 1, 0.02, z=-0.02, col=boden)
    box(None, _W / 2, tiefe, breite, 0.1, hoehe + 2, col=wand)
    if decke:
        box(None, _W / 2, -1, breite, tiefe + 1.1, 0.1, z=hoehe, col=DECKE)


def aussen(boden, tiefe=40):
    box(None, _W / 2, -1, _W * 4, tiefe, 0.02, z=-0.02, col=boden)


def max_massstab():
    _fig.append(("Max 1.75 m (front)", X(0.5), 0.15, 1.75, 0.45, 0.0))
    _fig.append(("Max (back of walk area)", X(_W - 0.8), 1.6, 1.75, 0.45, 0.0))


def pixel(x, y=0.6, z=0.0, text="tomcat 0.56 m"):
    _fig.append((text, X(x), y, 0.56, 0.6, z))


def publikum_vorn(farbe=SCHWARZ, n=None):
    """Silhouetten von Zuschauersitzen unter der Vorderkante (nur angedeutet)."""
    n = n or int(_W / 0.7)
    for i in range(n):
        kugel(None, 0.35 + i * 0.7, -0.9, 0.22, 0.35, col=farbe)
    notiz("dark audience silhouettes below the floor edge", _W * 0.25, -0.9, 0.6)


# ------------------------------------------------------------------------------------------------
@raum("testbild", 640, himmel=(0.25, 0.25, 0.25, 1))
def testbild():
    innenraum(tiefe=5.0, hoehe=4.5, boden=(0.30, 0.30, 0.32, 1), wand=(0.40, 0.40, 0.42, 1))
    zyl("big test circle with crosshair (behind the bars)", 3.0, 4.9, 1.9, 0.05, z=2.2, col=HELL, liegend=True)
    box(None, 3.0, 4.85, 3.8, 0.03, 0.05, z=2.2, col=SCHWARZ)
    box(None, 3.0, 4.85, 0.05, 0.03, 3.8, z=0.3, col=SCHWARZ)
    farben = [("magenta", MAGENTA, 0.3), ("white", HELL, -0.2), ("blue", BLAU, 0.0), ("yellow", GELB, 0.4),
              ("red", ROT, -0.3), ("cyan", CYAN, 0.2), ("green", GRUEN, 0.0)]
    for i, (n, c, dz) in enumerate(farben):
        box(f"bar {i + 1}: {n}" if i in (0, 3, 6) else None, 0.75 + i * 0.75, 2.6 + (i % 2) * 0.25,
            0.62, 0.3, 3.4, z=dz, col=c)
    notiz("seven huge colour bars like walls, shuffled, some shifted up/down", 3.0, 2.6, 4.2)
    box("grey static at the left edge (exit to the game show)", 0.15, 0.2, 0.3, 4.5, 4.0, col=RAUSCH)
    box("grey static at the right edge (Flimmer comes out here)", 5.85, 0.2, 0.3, 4.5, 4.0, col=RAUSCH)
    notiz("flat dark floor band, clear for walking", 3.0, 0.8, 0.05)
    figur("Flimmer 0.5 m (floats)", 4.6, 1.2, 0.5, 0.5, z=0.4)
    pixel(2.2)
    max_massstab()


@raum("rauschen", 640, himmel=(0.35, 0.35, 0.35, 1))
def rauschen():
    innenraum(tiefe=3.2, hoehe=3.0, boden=(0.48, 0.48, 0.48, 1), wand=RAUSCH, decke=True)
    box("lighter crawl path for the cat, left to right", 3.0, 0.3, 6.0, 0.9, 0.03, col=(0.80, 0.80, 0.80, 1))
    for x, t in [(1.0, "ghost image: prize wheel"), (2.3, "ghost image: lion"),
                 (3.6, "ghost image: gravestone"), (4.9, "ghost image: skyscraper")]:
        box(t, x, 3.1, 0.9, 0.05, 0.8, z=1.2, col=(0.70, 0.70, 0.72, 1))
    box("bright screen glow: exit left", 0.1, 0.0, 0.2, 3.2, 2.0, col=HELL)
    box("bright screen glow: exit right", 5.9, 0.0, 0.2, 3.2, 2.0, col=HELL)
    figur("Flimmer (floats)", 2.0, 1.0, 0.5, 0.5, z=0.3)
    pixel(3.6, 0.5)
    notiz("only the tomcat goes here: low tunnel, no Max", 3.0, 1.6, 2.4)


@raum("gluecksrad", 640, himmel=STUDIO)
def gluecksrad():
    innenraum(tiefe=4.0, hoehe=3.8, boden=(0.35, 0.18, 0.35, 1), wand=(0.45, 0.20, 0.40, 1))
    for z in (2.6, 3.0, 3.4):
        for i in range(14):
            kugel(None, 0.3 + i * 0.42, 3.9, 0.07, z, col=GELB)
    notiz("rows of light bulbs", 3.0, 3.9, 3.5)
    box("blank glowing phone-number sign", 3.0, 3.9, 1.8, 0.05, 0.45, z=2.0, col=MAGENTA)
    zyl("huge upright prize wheel (12 segments, pointer on top)", 1.15, 3.0, 0.85, 0.2, z=1.1, col=MAGENTA,
        liegend=True)
    box(None, 1.15, 3.05, 0.15, 0.3, 0.3, z=1.95, col=GOLD)
    box("contestant podium (Max stands here in the quiz)", 2.2, 1.6, 0.8, 0.6, 0.25, col=GOLD)
    box("host podium with big button and coffee stains", 3.6, 2.2, 0.9, 0.6, 1.1, col=GOLD)
    zyl(None, 3.6, 2.5, 0.12, 0.08, z=1.1, col=ROT)
    zyl("rotating prize platform: 2 toasters, cruise ship model, tube in blister", 5.1, 2.6, 0.75, 0.3,
        col=(0.95, 0.85, 0.9, 1))
    box(None, 4.85, 2.6, 0.25, 0.2, 0.2, z=0.3, col=HELL)
    box(None, 5.35, 2.6, 0.25, 0.2, 0.2, z=0.3, col=HELL)
    box(None, 5.1, 2.8, 0.45, 0.15, 0.2, z=0.3, col=BLAU)
    box("exit on foot back to the test pattern (left edge)", 0.05, 1.2, 0.1, 1.2, 2.2, col=RAUSCH)
    publikum_vorn(n=9)
    figur("Gerd Glueck 1.86 m", 3.0, 1.9, 1.86)
    figur("antiques appraiser 1.81 m", 4.4, 1.2, 1.81)
    pixel(1.4, 0.7)
    max_massstab()


@raum("sitcom_kueche", 1280, himmel=STUDIO)
def sitcom_kueche():
    innenraum(tiefe=3.8, hoehe=3.0, boden=(0.70, 0.62, 0.50, 1), wand=PASTELL)
    box("set wall ENDS here, black studio above", 6.0, 3.75, 13.0, 0.1, 0.05, z=3.0, col=SCHWARZ)
    box("studio light rig", 6.0, 2.0, 11.0, 0.15, 0.15, z=3.7, col=DUNKEL)
    for i in range(6):
        zyl(None, 1.2 + i * 1.9, 2.0, 0.15, 0.3, z=3.4, col=DUNKEL)
    box("pass-through window to an empty living room", 1.6, 3.7, 1.6, 0.1, 0.9, z=1.0, col=(0.35, 0.35, 0.4, 1))
    box("blank APPLAUSE light box above the set", 6.0, 3.7, 1.4, 0.1, 0.35, z=2.55, col=ROT)
    box("fridge", 3.3, 3.1, 0.8, 0.6, 1.9, col=MINZE)
    box("kitchen counter", 6.4, 2.5, 3.6, 0.7, 0.95, col=MINZE)
    zyl("fondue pot on a burner (cheese comes from here)", 5.6, 2.8, 0.22, 0.3, z=0.95, col=GELB)
    box("laugh track machine, big red button, at counter end", 8.5, 2.4, 0.6, 0.5, 1.0, col=DUNKEL)
    zyl(None, 8.5, 2.5, 0.1, 0.06, z=1.0, col=ROT)
    box("skateboard leaning on the counter", 4.4, 2.3, 0.2, 0.1, 0.8, col=ORANGE, rot=10)
    box("wooden kitchen door with round window, RIGHT EDGE (it slides over the seam in R6)", 11.0, 3.65,
        1.0, 0.15, 2.1, col=HOLZ)
    zyl(None, 11.0, 3.6, 0.18, 0.05, z=1.5, col=GLAS, liegend=True)
    box("small dining table", 9.8, 1.9, 1.0, 0.7, 0.75, col=HOLZ)
    notiz("banana peel on the floor in front of the counter (own sprite)", 7.2, 0.8, 0.05)
    notiz("state 2: cookie-jar shards + cookies here", 3.6, 1.0, 0.05)
    publikum_vorn(farbe=(0.25, 0.22, 0.20, 1))
    figur("Dad + cookie jar 1.81 m", 3.6, 1.6, 1.81)
    figur("Mum 1.81 m", 6.6, 1.9, 1.81)
    figur("Son 1.75 m", 8.0, 1.3, 1.75)
    figur("Inspector (guest, R3) 1.81 m", 10.3, 1.5, 1.81)
    pixel(1.3)
    max_massstab()


@raum("savanne", 1280, himmel=HIMMEL_ABEND)
def savanne():
    aussen(OCKER)
    zyl("watering hole", 1.6, 2.6, 1.4, 0.03, col=BLAU)
    for x in (0.5, 2.8):
        zyl(None, x, 3.6, 0.1, 2.4, col=HOLZ)
        zyl(None, x, 3.6, 0.9, 0.15, z=2.4, col=GRUEN)
    notiz("flat-topped acacias", 1.6, 3.6, 2.6)
    box("rock throne (empty hollow on top)", 4.6, 2.6, 1.8, 1.2, 1.5, col=(0.55, 0.45, 0.35, 1))
    box(None, 4.6, 2.9, 1.0, 0.8, 0.5, z=1.5, col=(0.55, 0.45, 0.35, 1))
    box("boom microphone from the top edge, above the throne", 4.9, 2.2, 0.08, 0.08, 1.4, z=2.6,
        col=DUNKEL, rot=0)
    box("sun spot at the rock (Max lies down here)", 3.4, 1.3, 1.0, 0.5, 0.01, col=GELB)
    kugel("bush wrapped in yellow crime-scene tape", 6.3, 2.5, 0.6, 0.55, col=GRUEN)
    box(None, 6.3, 2.1, 1.4, 0.02, 0.06, z=0.8, col=GELB)
    kugel("dense hiding bush (narrator crouches behind it)", 7.4, 2.8, 0.55, 0.5, col=GRUEN)
    zyl("dead branch for the vulture", 8.5, 3.0, 0.05, 1.6, col=HOLZ)
    box("small rain cloud over a drum kit, rain only on the drums", 9.8, 3.2, 1.0, 0.6, 0.35, z=2.4, col=HELL)
    zyl(None, 9.8, 3.2, 0.3, 0.5, col=ROT)
    box("crate of creepy crawlies, blank star sign", 11.1, 2.6, 0.7, 0.5, 0.45, col=HOLZ)
    notiz("tall grass at the right edge", 11.8, 3.4, 0.6)
    notiz("open grass kept free for the big animals", 6.0, 0.8, 0.05)
    figur("3 flamingos 0.75 m", 1.4, 2.6, 0.75, 1.2)
    figur("cheetah 0.94 m", 2.3, 1.3, 0.94, 0.9)
    figur("lion lies ON the throne", 4.6, 2.9, 0.9, 1.6, z=2.0)
    figur("hyena 1.06 m (sits upright)", 3.6, 1.6, 1.06, 0.6)
    figur("Inspector 1.81 m", 5.6, 1.4, 1.81)
    figur("narrator, crouching", 7.7, 2.9, 1.1, 0.8)
    figur("vulture on branch", 8.5, 3.0, 0.94, 0.7, z=1.3)
    figur("rhino 1.3 m, asleep standing", 10.6, 2.0, 1.3, 2.0)
    pixel(3.0, 0.5)
    max_massstab()


@raum("friedhof", 640, himmel=NACHT)
def friedhof():
    aussen((0.25, 0.22, 0.30, 1))
    for i in range(4):
        for j in range(3):
            c = [MAGENTA, CYAN, GIFTGRUEN, GELB][(i + j) % 4]
            box(None, 1.8 + i * 0.75, 0.25 + j * 0.55, 0.7, 0.5, 0.03, col=c)
    notiz("square of glowing dance-floor tiles (rhythm game)", 3.0, 0.6, 0.1)
    for x in (0.4, 1.2, 4.8, 5.6):
        box(None, x, 2.4, 0.5, 0.15, 0.8, col=MITTEL)
        box(None, x, 1.9, 0.6, 0.45, 0.12, col=(0.35, 0.28, 0.22, 1))
    for x in (2.0, 4.0):
        box(None, x, 2.6, 0.5, 0.15, 0.8, col=MITTEL)
        box(None, x, 2.1, 0.6, 0.45, 0.12, col=(0.35, 0.28, 0.22, 1))
    notiz("six graves with mounds (state 1: a green hand sticks out)", 1.2, 2.4, 1.0)
    box("rusty iron gate, CENTER BACK (zombies block the way)", 3.0, 3.4, 1.2, 0.1, 1.9, col=DUNKEL)
    box("path down to a dark mansion far behind", 3.0, 3.6, 0.9, 6, 0.02, col=(0.35, 0.30, 0.25, 1))
    box("dark mansion far behind", 4.2, 30, 5, 3, 6, col=SCHWARZ)
    zyl("dead tree with a disco ball", 0.3, 3.2, 0.12, 3.0, col=SCHWARZ)
    kugel(None, 0.8, 3.1, 0.2, 2.6, col=HELL)
    kugel("full moon", 1.5, 60, 2.5, 13, col=HELL)
    figur("6 zombies 1.81 m (2 rows of 3) on the tiles", 3.0, 1.0, 1.81, 2.2)
    pixel(1.2, 0.5)
    max_massstab()


@raum("spukhaus_keller", 640, himmel=None)
def keller():
    innenraum(tiefe=3.6, hoehe=2.8, boden=(0.30, 0.27, 0.30, 1), wand=(0.38, 0.32, 0.40, 1), decke=True)
    for i in range(3):
        box(None, 0.9, 2.9 - i * 0.3, 1.4, 0.3, 0.2 * (i + 1), col=MITTEL)
    box("LEFT EDGE: stone steps up to a heavy door in chains (R6: becomes the sitcom door)", 0.8, 3.45,
        1.0, 0.1, 2.0, z=0.6, col=HOLZ)
    notiz("door stays at the LEFT edge: in picture-in-picture it meets the kitchen door at the seam",
          1.2, 2.2, 2.6)
    box("old tube TV on a crate, grey static", 3.0, 2.7, 0.7, 0.6, 0.6, z=0.5, col=DUNKEL)
    box(None, 3.0, 2.7, 0.8, 0.7, 0.5, col=HOLZ)
    box("shoebox of cassette tapes", 3.7, 2.6, 0.4, 0.3, 0.2, z=0.0, col=ROT)
    for x in (2.0, 4.2):
        kugel(None, x, 3.2, 0.5, 0.45, col=HELL)
    notiz("junk under white sheets", 4.2, 3.2, 0.9)
    box("broken grave slab in the floor: tunnel up from the graveyard", 5.2, 1.4, 1.0, 0.8, 0.03, col=MITTEL)
    kugel("single bare bulb", 3.0, 1.8, 0.08, 2.5, col=GELB)
    box("tiny cobwebbed window high up", 4.9, 3.55, 0.5, 0.05, 0.3, z=2.2, col=GLAS)
    figur("3 bedsheet ghosts 0.75 m (float)", 3.2, 2.2, 0.75, 1.8, z=0.4)
    figur("sitcom dad on a crate (after R6)", 2.0, 1.8, 1.3, 0.6)
    pixel(4.4, 0.5)
    max_massstab()


@raum("spukhaus_halle", 640, himmel=None)
def halle():
    innenraum(tiefe=3.8, hoehe=3.6, boden=(0.30, 0.25, 0.28, 1), wand=(0.55, 0.45, 0.45, 1))
    box("LEFT: open sitcom kitchen door to the cellar steps (warm light)", 0.75, 3.7, 1.0, 0.1, 2.1, col=HOLZ)
    for i in range(26):
        kugel(None, 1.5 + i * 0.12, 3.7, 0.045, 1.95, col=GELB)
    notiz("26 bulbs in ONE even row at head height, blank space below each", 3.0, 3.7, 2.1)
    for i in range(10):
        box(None, 4.7 + i * 0.12, 3.0 + i * 0.07, 0.6 * 2, 0.25, 0.18, z=i * 0.18, col=HOLZ)
    notiz("grand staircase up out of frame, cobwebs", 5.4, 3.3, 2.2)
    notiz("green fog on the floor", 3.0, 0.8, 0.05)
    figur("FBI agent 1.86 m", 3.8, 1.6, 1.86)
    pixel(1.8)
    max_massstab()


@raum("kapitolis", 640, himmel=(0.55, 0.75, 0.95, 1))
def kapitolis():
    aussen((0.55, 0.55, 0.60, 1))
    box(None, 3.0, 3.0, 20, 0.2, 0.15, col=HELL)
    for i, (x, h) in enumerate([(-1.5, 14), (1.0, 18), (3.5, 12), (6.0, 20), (8.5, 15)]):
        box("skyscrapers with blank speech-bubble signs" if i == 1 else None, x * 2, 26, 4.0, 2, h * 1.4,
            col=[BLAU, GELB, ROT, BLAU, GELB][i])
    zyl("water tower with a big spider web", 7.0, 24, 1.4, 2.4, z=16.8, col=ROT)
    box("newspaper kiosk, blank front page", 0.9, 2.6, 1.2, 0.8, 2.0, col=ROT)
    zyl("iron street lamp, sturdy arm to hang from", 2.8, 2.7, 0.07, 3.3, col=SCHWARZ)
    box(None, 3.2, 2.7, 0.8, 0.08, 0.08, z=3.2, col=SCHWARZ)
    box("anvil in a small crater on the sidewalk", 3.9, 1.0, 0.5, 0.3, 0.35, col=SCHWARZ)
    zyl(None, 3.9, 1.1, 0.5, 0.02, col=DUNKEL)
    box("street on toward a factory chimney (exit to the cheese factory)", 5.8, 3.4, 0.6, 6, 0.02, col=STUDIO)
    zyl(None, 9.0, 22, 0.7, 12, col=ROT)
    figur("Super-Siegfried 2.0 m (floats)", 1.8, 1.8, 2.0, 0.6, z=0.3)
    figur("Fledermann hangs upside down from the lamp", 3.4, 2.7, 1.81, 0.5, z=1.35)
    figur("Wonder-Wilma 1.81 m", 4.8, 1.6, 1.81)
    pixel(1.0, 0.5)
    max_massstab()


@raum("fondue_fabrik", 640, himmel=None)
def fabrik():
    innenraum(tiefe=4.0, hoehe=4.4, boden=(0.55, 0.55, 0.58, 1), wand=(0.85, 0.80, 0.55, 1))
    for i, x in enumerate((0.6, 1.5)):
        zyl("cheese vats" if i == 0 else None, x, 3.3, 0.42, 1.5, col=GELB)
    zyl("FRONT VAT with hinged lid (Max falls in here)", 2.4, 2.8, 0.45, 1.3, col=GELB)
    box(None, 2.4, 2.35, 0.9, 0.9, 0.06, z=1.3, col=DUNKEL)
    box("narrow catwalk WITHOUT railing above the vats", 1.6, 2.6, 3.2, 0.45, 0.08, z=1.9, col=DUNKEL)
    for i in range(7):
        box(None, 3.3, 2.6, 0.5, 0.06, 0.04, z=i * 0.27, col=DUNKEL)
    notiz("ladder up to the catwalk", 3.3, 2.6, 1.9)
    box("conveyor belt carrying cheese blocks", 4.3, 3.2, 1.6, 0.6, 0.8, col=DUNKEL)
    for i in range(3):
        box(None, 3.8 + i * 0.5, 3.3, 0.25, 0.25, 0.2, z=0.8, col=GELB)
    box("big red lever on a control post", 5.3, 2.5, 0.3, 0.3, 1.1, col=MITTEL)
    box(None, 5.3, 2.5, 0.06, 0.06, 0.5, z=1.1, col=ROT, rot=0)
    box("3 warning signs (icons only, one cheese face)", 4.6, 3.95, 1.2, 0.05, 0.4, z=2.0, col=GELB)
    box("high window: night sky, cheese searchlight on the roof", 1.6, 3.95, 1.4, 0.05, 0.8, z=3.3,
        col=(0.15, 0.15, 0.35, 1))
    box("exit back to the comic city (right edge)", 5.95, 1.0, 0.1, 1.0, 2.3, col=HELL)
    figur("factory worker at the lever", 5.0, 2.0, 1.81)
    figur("3 heroes (stand back right)", 4.2, 2.1, 2.0, 1.4)
    pixel(0.8, 0.5)
    max_massstab()


@raum("werbespot_set", 1280, himmel=STUDIO)
def werbespot():
    innenraum(tiefe=4.0, hoehe=3.8, boden=(0.45, 0.42, 0.48, 1), wand=(0.9, 0.5, 0.6, 1))
    for i, c in enumerate([ROT, ORANGE, GELB, GRUEN, BLAU, LILA]):
        box(None, 6.0, 3.95, 9.0, 0.02, 0.3, z=0.4 + i * 0.45, col=c)
    notiz("backdrop: loud rainbow stripes", 6.0, 3.95, 3.2)
    zyl("glowing round PRODUCT PODIUM (Couch-Magnet 3000 on it)", 6.0, 2.4, 0.9, 0.4, col=HELL)
    box("fat purple armchair gadget with red horseshoe magnet", 6.0, 2.4, 0.9, 0.6, 0.8, z=0.4, col=LILA)
    box("film camera on tripod, red light", 2.2, 1.8, 0.5, 0.6, 1.5, col=DUNKEL)
    box("director's chair, blank backrest", 3.4, 2.2, 0.6, 0.5, 1.0, col=HOLZ)
    box("clapperboard on the floor", 4.4, 0.7, 0.4, 0.3, 0.05, col=SCHWARZ)
    box("second spotlight", 9.4, 2.8, 0.5, 0.4, 1.9, col=DUNKEL)
    zyl("plastic palm tree in a pot", 10.6, 3.1, 0.3, 2.0, col=GRUEN)
    for i in range(4):
        box(None, 7.3 + i * 0.55, 0.5, 0.45, 0.35, 0.02, col=HELL)
    notiz("4 comic panels on the floor (R11), remote button below", 8.1, 0.5, 0.1)
    figur("Dr. Werbepause on the podium", 6.0, 2.4, 1.86, 0.6, z=0.4)
    figur("Super-Siegfried", 9.3, 1.4, 2.0)
    figur("Fledermann", 10.2, 1.2, 1.81)
    figur("Wonder-Wilma", 11.1, 1.5, 1.81)
    pixel(1.2, 0.6)
    max_massstab()


@raum("empfang", 1280, himmel=None)
def empfang():
    innenraum(tiefe=4.2, hoehe=4.0, boden=(0.10, 0.10, 0.12, 1), wand=(0.18, 0.18, 0.20, 1))
    box("black marble reception desk", 2.0, 2.4, 2.2, 0.8, 1.05, col=SCHWARZ)
    box("monitor", 1.5, 2.6, 0.5, 0.15, 0.35, z=1.05, col=CYAN)
    box("small broken old radio", 2.6, 2.5, 0.35, 0.2, 0.2, z=1.05, col=HOLZ)
    for i in range(5):
        zyl(None, 0.6 + i * 0.7, 4.15, 0.2, 0.03, z=2.6, col=GOLD, liegend=True)
    notiz("row of framed gold records", 2.0, 4.15, 2.9)
    for x in (4.6, 6.6):
        zyl(None, x, 1.8, 0.05, 0.95, col=GOLD)
    box("two velvet ropes on golden posts", 5.6, 1.8, 2.0, 0.04, 0.05, z=0.8, col=ROT)
    box("big gold-framed portrait of Zappmann", 5.6, 4.15, 1.3, 0.05, 1.6, z=1.5, col=GOLD)
    box("blank brass plate", 5.6, 4.1, 0.5, 0.05, 0.15, z=1.25, col=GOLD)
    box("blank golden logo", 5.6, 4.15, 1.0, 0.05, 0.35, z=3.3, col=GOLD)
    box("blank ON-AIR lamp", 9.0, 4.1, 0.7, 0.05, 0.25, z=3.2, col=ROT)
    box("golden elevator door", 9.0, 4.1, 1.3, 0.1, 2.4, col=GOLD)
    box("number pad", 9.9, 4.05, 0.2, 0.05, 0.3, z=1.2, col=DUNKEL)
    box("plain grey service door down to the archive", 11.3, 4.1, 0.9, 0.1, 2.1, col=MITTEL)
    figur("receptionist (sits behind the desk)", 2.0, 3.0, 1.3, 0.6, z=0.0)
    figur("guard 2.0 m", 8.5, 2.3, 2.0, 0.7)
    figur("guard 2.0 m", 9.6, 2.3, 2.0, 0.7)
    pixel(3.4)
    max_massstab()


@raum("kellerarchiv", 640, himmel=None)
def kellerarchiv():
    innenraum(tiefe=3.8, hoehe=3.0, boden=(0.40, 0.40, 0.42, 1), wand=(0.50, 0.50, 0.52, 1), decke=True)
    for i in range(3):
        box("dusty shelves, tape boxes with blank labels" if i == 0 else None, 0.7, 3.2, 1.0, 0.5, 0.05,
            z=0.6 + i * 0.6, col=HOLZ)
    box(None, 0.7, 3.2, 1.0, 0.5, 2.0, col=(0.45, 0.35, 0.25, 1))
    box("huge rusty TRASH COMPACTOR PIT full of tapes", 3.0, 1.8, 2.4, 1.6, 0.9, col=(0.55, 0.35, 0.25, 1))
    box(None, 1.85, 1.8, 0.1, 1.6, 1.6, col=(0.45, 0.30, 0.22, 1))
    box(None, 4.15, 1.8, 0.1, 1.6, 1.6, col=(0.45, 0.30, 0.22, 1))
    box("ONE black VHS tape sticks out at the front", 3.2, 1.7, 0.25, 0.12, 0.05, z=0.9, col=SCHWARZ)
    zyl("small eye on a stalk", 2.4, 2.4, 0.03, 0.5, z=0.9, col=HELL)
    kugel(None, 2.4, 2.4, 0.07, 1.45, col=HELL)
    for i in range(3):
        box(None, 5.4 - i * 0.25, 2.6, 0.6, 0.6, 0.2 * (i + 1), col=MITTEL)
    box("grey service door at the top of the steps, back to the lobby", 5.5, 3.6, 0.9, 0.1, 2.0, z=0.6,
        col=MITTEL)
    box("flickering neon tube", 3.0, 2.0, 1.2, 0.1, 0.05, z=2.9, col=CYAN)
    pixel(1.6, 0.5)
    max_massstab()


@raum("zappmanns_studio", 640, himmel=STUDIO)
def studio():
    innenraum(tiefe=4.2, hoehe=4.2, boden=(0.12, 0.10, 0.08, 1), wand=(0.08, 0.08, 0.10, 1))
    farben = [CYAN, MAGENTA, PASTELL, OCKER, LILA, BLAU, GELB, GRUEN]
    for r in range(3):
        for c in range(8):
            box(None, 1.0 + c * 0.6, 4.1, 0.55, 0.05, 0.42, z=1.6 + r * 0.48, col=farben[(r + c) % 8])
    notiz("WALL OF MONITORS, each a different show (bars, wheel, kitchen, savanna, graveyard, comic)", 3.0, 4.1,
          3.1)
    box("open elevator door (back to the lobby)", 0.45, 3.0, 0.8, 0.1, 2.3, col=GOLD)
    box("host desk with a coffee mug", 1.5, 2.6, 1.1, 0.6, 0.85, col=GOLD)
    box("SHINY GOLDEN SOFA (center)", 3.0, 2.3, 2.0, 0.8, 0.9, col=GOLD)
    box(None, 3.0, 2.9, 2.0, 0.2, 0.6, z=0.9, col=GOLD)
    box("applause sign on a stand (lit / off)", 4.6, 2.6, 0.9, 0.1, 0.35, z=2.0, col=ROT)
    zyl(None, 4.6, 2.65, 0.04, 2.0, col=DUNKEL)
    box("tall RATINGS METER (bar almost full / dropped, red)", 5.6, 2.8, 0.35, 0.2, 2.6, col=DUNKEL)
    box(None, 5.6, 2.75, 0.22, 0.05, 2.2, z=0.2, col=GIFTGRUEN)
    box("studio camera on a pedestal (front right, cut by the edge)", 5.9, 0.9, 0.6, 0.6, 1.6, col=DUNKEL)
    notiz("small band riser in the dark back right (silhouettes only, part of the background)", 4.6, 3.6, 1.0)
    figur("Zappmann 1.94 m", 3.4, 1.5, 1.94)
    figur("contestant (crayons)", 1.6, 2.0, 1.75)
    pixel(2.4, 0.5)
    max_massstab()


@raum("kindersendung", 640, himmel=None)
def kindersendung():
    innenraum(tiefe=3.2, hoehe=2.8, boden=(0.55, 0.42, 0.28, 1), wand=(0.85, 0.65, 0.40, 1))
    box("small wooden puppet theatre, red curtain", 3.0, 2.4, 1.6, 0.5, 1.8, col=HOLZ)
    box(None, 3.0, 2.38, 1.1, 0.03, 0.7, z=0.9, col=ROT)
    zyl("cardboard sun on a stick", 1.0, 2.8, 0.45, 0.03, z=1.6, col=GELB, liegend=True)
    zyl(None, 1.0, 2.8, 0.03, 1.6, col=HOLZ)
    box("felt rainbow pinned to the back wall", 1.6, 3.15, 1.4, 0.03, 0.6, z=1.9, col=ORANGE)
    zyl("wooden stool", 4.8, 1.8, 0.22, 0.5, col=HOLZ)
    figur("young Zappmann 1.75 m, hand puppet", 3.9, 1.4, 1.75)
    notiz("worn studio floor, kept clear", 3.0, 0.6, 0.05)


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
        for t, x, y, h, b, z in _fig:
            fx0, fy0 = projiziert(cam, Vector((x - b / 2, y, z)))
            fx1, fy1 = projiziert(cam, Vector((x + b / 2, y, z + h)))
            info["figuren"].append([t, fx0, fy1, fx1, fy0])
        with open(os.path.join(aus, f"{name}_rohbau.json"), "w", encoding="utf-8") as fh:
            json.dump(info, fh, indent=1)
        print("RAUM", name, "ok")


main()
