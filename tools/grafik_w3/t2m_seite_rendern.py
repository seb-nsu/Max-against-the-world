"""Blender: Text-zu-Bewegung-Clip (FBX von Meshy) in der Seitenansicht als Silhouetten-Bildfolge rendern,
als Vorlage für gemalte Zwischenposen. Blick nach rechts (+x im Bild).
Aufruf: blender -b --python t2m_seite_rendern.py -- clip.fbx ziel_ordner schritt"""
import bpy, sys, math, os
from mathutils import Vector
argv = sys.argv[sys.argv.index("--") + 1:]
fbx, ziel, schritt = argv[0], argv[1], int(argv[2])
os.makedirs(ziel, exist_ok=True)
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=fbx)
sc = bpy.context.scene
arm = next(o for o in bpy.data.objects if o.type == "ARMATURE")
act = arm.animation_data.action
f0, f1 = int(act.frame_range[0]), int(act.frame_range[1])
meshes = [o for o in bpy.data.objects if o.type == "MESH"]
# Ausdehnung über alle Bilder bestimmen
lo = Vector((1e9, 1e9, 1e9)); hi = -lo
for f in range(f0, f1 + 1, 4):
    sc.frame_set(f)
    dg = bpy.context.evaluated_depsgraph_get()
    for m in meshes:
        e = m.evaluated_get(dg)
        for c in e.bound_box:
            w = e.matrix_world @ Vector(c)
            lo = Vector(map(min, lo, w)); hi = Vector(map(max, hi, w))
mitte = (lo + hi) / 2
gr = max(hi.y - lo.y, hi.z - lo.z, hi.x - lo.x) * 1.1
cam = bpy.data.objects.new("cam", bpy.data.cameras.new("cam"))
sc.collection.objects.link(cam)
cam.data.type = "ORTHO"; cam.data.ortho_scale = gr
# Figur blickt in -Y; Kamera von +X sieht -Y nach rechts? Kamera bei -X schaut +X: rechts im Bild = -Y
cam.location = (mitte.x - 20, mitte.y, mitte.z)
cam.rotation_euler = (math.pi / 2, 0, -math.pi / 2)
sc.camera = cam
licht = bpy.data.objects.new("sonne", bpy.data.lights.new("sonne", "SUN"))
sc.collection.objects.link(licht); licht.rotation_euler = (0.6, 0, -1.2)
mat = bpy.data.materials.new("grau")
for m in meshes:
    m.data.materials.clear(); m.data.materials.append(mat)
try:
    sc.render.engine = "BLENDER_WORKBENCH"
except TypeError:
    pass
sc.display.shading.light = "STUDIO"; sc.display.shading.color_type = "SINGLE"
sc.render.film_transparent = True
sc.render.resolution_x = sc.render.resolution_y = 512
n = 0
for f in range(f0, f1 + 1, schritt):
    sc.frame_set(f)
    sc.render.filepath = os.path.join(ziel, f"b{n:03d}.png")
    bpy.ops.render.render(write_still=True); n += 1
print("FERTIG", n, "Bilder", f0, f1)
