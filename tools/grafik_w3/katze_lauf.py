"""Schwarze Katze (W3-B01): Vierbeiner aus Grundkörpern, Bein-Rig per Gelenk-Empties, 8 Bilder Gang,
flach von der Seite gerendert (Workbench, keine Kantenglättung). Aufruf:
blender -b --python katze_lauf.py -- <ausgabeordner>"""
import bpy, math, sys
out = sys.argv[sys.argv.index("--") + 1]
bpy.ops.wm.read_factory_settings(use_empty=True)
sc = bpy.context.scene

def mat(name, rgb):
    m = bpy.data.materials.new(name); m.diffuse_color = (*rgb, 1); return m
NAH = mat("nah", (0.14, 0.13, 0.15)); FERN = mat("fern", (0.04, 0.03, 0.06)); AUGE = mat("auge", (0, 1, 0))

def kugel(name, loc, scale, m, parent=None):
    bpy.ops.mesh.primitive_uv_sphere_add(segments=24, ring_count=12, location=loc)
    o = bpy.context.object; o.name = name; o.scale = scale; o.data.materials.append(m)
    if parent: setp(o, parent)
    return o

def setp(o, p):
    bpy.context.view_layer.update()
    mw = o.matrix_world.copy(); o.parent = p; o.matrix_world = mw

def gelenk(name, loc, parent=None):
    e = bpy.data.objects.new(name, None); sc.collection.objects.link(e); e.location = loc
    if parent: setp(e, parent)
    return e

def stab(name, a, laenge, r0, r1, m, parent):
    """Zylinder von Gelenk a senkrecht nach unten."""
    bpy.ops.mesh.primitive_cone_add(vertices=16, radius1=r0, radius2=r1, depth=laenge,
                                    location=(a[0], a[1], a[2] - laenge / 2))
    o = bpy.context.object; o.name = name; o.data.materials.append(m); setp(o, parent); return o

wurzel = gelenk("wurzel", (0, 0, 0))
koerper = gelenk("koerper", (0, 0, 0), wurzel)
kugel("rumpf", (0, 0, 0.45), (0.45, 0.13, 0.125), NAH, koerper)
kugel("brust", (0.28, 0, 0.47), (0.18, 0.13, 0.145), NAH, koerper)
kugel("po", (-0.32, 0, 0.46), (0.15, 0.13, 0.135), NAH, koerper)
kopfg = gelenk("kopfg", (0.45, 0, 0.58), koerper)
kugel("hals", (0.47, 0, 0.6), (0.1, 0.09, 0.11), NAH, kopfg)
kugel("kopf", (0.57, 0, 0.68), (0.135, 0.12, 0.12), NAH, kopfg)
kugel("schnauze", (0.67, 0, 0.645), (0.06, 0.06, 0.05), NAH, kopfg)
for i, x in enumerate((0.52, 0.6)):
    bpy.ops.mesh.primitive_cone_add(vertices=4, radius1=0.05, radius2=0, depth=0.12, location=(x, 0, 0.81))
    o = bpy.context.object; o.name = f"ohr{i}"; o.data.materials.append(NAH); o.rotation_euler = (0, math.radians(8), 0); setp(o, kopfg)
kugel("auge", (0.63, -0.1, 0.695), (0.022, 0.01, 0.018), AUGE, kopfg)

# Schwanz: 7 Glieder, steil nach oben, Spitze leicht nach vorn
schwanz = []; p = koerper; pos = (-0.46, 0, 0.5)
for i in range(7):
    g = gelenk(f"s{i}", pos, p); L = 0.11
    bpy.ops.mesh.primitive_cylinder_add(vertices=12, radius=0.032 - i * 0.002, depth=L + 0.02, location=(pos[0], 0, pos[2] + L / 2))
    o = bpy.context.object; o.data.materials.append(NAH); setp(o, g)
    schwanz.append(g); p = g; pos = (pos[0], 0, pos[2] + L)
SCHWANZ_W = [-28, 6, 7, 6, 5, 6, 9]   # Grad um Y: negativ = nach hinten geneigt

# Beine: (name, hüfte x, y, material, phase, vorn?)
BEINE = [("hl", -0.33, -0.07, NAH, 0.0, False), ("vl", 0.3, -0.07, NAH, 0.25, True),
         ("hf", -0.33, 0.07, FERN, 0.5, False), ("vf", 0.3, 0.07, FERN, 0.75, True)]
beine = {}
for n, x, y, m, ph, vorn in BEINE:
    h = gelenk(f"{n}_huefte", (x, y, 0.42), koerper)
    lo = 0.27 if vorn else 0.26
    stab(f"{n}_ober", (x, y, 0.42), lo, 0.062 if vorn else 0.082, 0.046, m, h)
    k = gelenk(f"{n}_knie", (x, y, 0.42 - lo), h)
    lu = 0.27
    stab(f"{n}_unter", (x, y, 0.42 - lo), lu, 0.042, 0.034, m, k)
    kugel(f"{n}_pfote", (x + 0.02, y, 0.42 - lo - lu), (0.045, 0.035, 0.025), m, k)
    beine[n] = (h, k, ph, vorn)

N = 8
for f in range(N):
    t = f / N
    for n, (h, k, ph, vorn) in beine.items():
        w = 2 * math.pi * (t + ph)
        ober = 22 * math.sin(w)                 # positiv = nach vorn
        heben = max(0.0, math.cos(w))           # Schwungphase: Pfote anheben
        unter = (40 if vorn else -35) * heben   # vorn knickt nach hinten, hinten nach vorn
        if not vorn:
            unter += 12                          # Sprunggelenk leicht gewinkelt
        h.rotation_euler = (0, math.radians(-ober), 0); h.keyframe_insert("rotation_euler", frame=f + 1)
        k.rotation_euler = (0, math.radians(unter), 0); k.keyframe_insert("rotation_euler", frame=f + 1)
    koerper.location = (0, 0, 0.012 * math.cos(4 * math.pi * t)); koerper.keyframe_insert("location", frame=f + 1)
    for i, g in enumerate(schwanz):
        g.rotation_euler = (0, math.radians(SCHWANZ_W[i] + 2.5 * math.sin(2 * math.pi * t - i * 0.5)), 0)
        g.keyframe_insert("rotation_euler", frame=f + 1)

cam = bpy.data.objects.new("cam", bpy.data.cameras.new("cam")); sc.collection.objects.link(cam)
cam.data.type = "ORTHO"; cam.data.ortho_scale = 2.3
cam.location = (0.0, -5, 0.75); cam.rotation_euler = (math.radians(90), 0, 0); sc.camera = cam
sc.render.engine = "BLENDER_WORKBENCH"
sc.display.shading.light = "FLAT"; sc.display.shading.color_type = "MATERIAL"
try:
    sc.display.render_aa = "OFF"
except Exception as e:
    print("AA", e)
sc.render.film_transparent = True
sc.render.resolution_x = sc.render.resolution_y = 600
sc.view_settings.view_transform = "Standard"
sc.frame_start, sc.frame_end = 1, N
sc.render.filepath = out + "/f_"
sc.render.image_settings.file_format = "PNG"
bpy.ops.render.render(animation=True)
print("FERTIG")
