"""Meshy-Text-zu-Bewegung im Swift-Modus liefert nur ein Skelett (BVH). Zwei Schritte:
1) Blender: Knochenlagen je Bild als JSON
   blender -b --python t2m_bvh_strich.py -- clip.bvh ziel.json schritt
2) Python: Strichmännchen in der Seitenansicht (naher Arm/naher Fuß dunkel, ferner hell), Übersicht und Einzelbilder
   py -3 t2m_bvh_strich.py zeichnen ziel.json ordner [spiegeln]
Die Bilder dienen als Haltungsvorlage für gemalte Zwischenposen (Gemini), das Aussehen bleibt gemalt."""
import sys, json

if sys.argv[1] != "zeichnen":
    import bpy
    argv = sys.argv[sys.argv.index("--") + 1:]
    bvh, ziel, schritt = argv[0], argv[1], int(argv[2])
    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.ops.import_anim.bvh(filepath=bvh, update_scene_fps=True, update_scene_duration=True)
    arm = next(o for o in bpy.data.objects if o.type == "ARMATURE")
    act = arm.animation_data.action
    f0, f1 = int(act.frame_range[0]), int(act.frame_range[1])
    sc = bpy.context.scene
    bilder = []
    for f in range(f0, f1 + 1, schritt):
        sc.frame_set(f)
        bilder.append({b.name: [list(arm.matrix_world @ b.head), list(arm.matrix_world @ b.tail)] for b in arm.pose.bones})
    json.dump({"knochen": [[b.name, b.parent.name if b.parent else None] for b in arm.pose.bones], "bilder": bilder}, open(ziel, "w"))
    print("FERTIG", len(bilder), f0, f1)
else:
    from pathlib import Path
    from PIL import Image, ImageDraw
    import numpy as np
    d = json.load(open(sys.argv[2])); aus = Path(sys.argv[3]); aus.mkdir(parents=True, exist_ok=True)
    spiegeln = len(sys.argv) > 4
    alle = np.array([p for b in d["bilder"] for k in b.values() for p in k])
    # Blickrichtung: Achse mit größter Bewegung der Zehen/Hände ist die Tiefe nicht; wir nehmen die Achse,
    # auf der Schulter links/rechts am weitesten auseinander liegen, als Tiefe und projizieren auf die andere.
    b0 = d["bilder"][0]
    def finde(*namen):
        for n in b0:
            if all(s.lower() in n.lower() for s in namen):
                return n
    ls, rs = finde("left", "arm") or finde("l", "shoulder"), finde("right", "arm") or finde("r", "shoulder")
    hoch = 2   # Blender importiert BVH mit Z nach oben
    quer = np.abs(np.array(b0[ls][0]) - np.array(b0[rs][0])); quer[hoch] = -1
    tiefe = int(np.argmax(quer)); seite = 3 - hoch - tiefe
    lo, hi = alle.min(0), alle.max(0); gr = max(hi[hoch] - lo[hoch], hi[seite] - lo[seite]) * 1.1
    S = 400
    def p(v):
        x = (v[seite] - (lo[seite] + hi[seite]) / 2) / gr * S + S / 2
        if spiegeln:
            x = S - x
        return (x, S - ((v[hoch] - lo[hoch]) / gr * S + 0.04 * S))
    nah = "left" if np.array(b0[ls][0])[tiefe] < np.array(b0[rs][0])[tiefe] else "right"
    bilder = []
    for i, b in enumerate(d["bilder"]):
        im = Image.new("RGB", (S, S), "white"); dr = ImageDraw.Draw(im)
        reihen = sorted(b.items(), key=lambda kv: (nah in kv[0].lower()))
        for n, (h, t) in reihen:
            if np.linalg.norm(np.array(h)) < 1e-4 or 'root' in n.lower():
                continue
            farbe = (60, 60, 60) if nah in n.lower() else (170, 170, 170)
            if "left" not in n.lower() and "right" not in n.lower():
                farbe = (100, 100, 100)
            dr.line([p(h), p(t)], fill=farbe, width=14)
            if "head" in n.lower():
                c = p(t); dr.ellipse([c[0] - 22, c[1] - 22, c[0] + 22, c[1] + 22], fill=(100, 100, 100))
        im.save(aus / f"b{i:03d}.png"); bilder.append(im.resize((160, 160)))
    o = Image.new("RGB", (160 * 10, 175 * ((len(bilder) + 9) // 10)), "white"); dr = ImageDraw.Draw(o)
    for i, im in enumerate(bilder):
        o.paste(im, ((i % 10) * 160, (i // 10) * 175)); dr.text(((i % 10) * 160 + 4, (i // 10) * 175 + 160), str(i), fill="black")
    o.save(aus / "uebersicht.png"); print(len(bilder), "Bilder, Achsen hoch/seite/tiefe", hoch, seite, tiefe, "nah", nah)
