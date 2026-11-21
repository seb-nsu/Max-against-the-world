extends SceneTree
## Review 20.11. (TA, nicht committen): sichtbare Größe (Alpha-Rahmen x Skala) und Tönung jeder Figur
## je Welt-3-Raum, dazu Max vorn/hinten im Laufbereich. Aufruf: -s res://tests/_review_ta_groessen.gd -- AUSGABE [ende]

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
const RAEUME := ["unterstadt_strasse", "apothekengasse", "widerstandsbasis", "kuehlung", "laboreingang",
	"stadtstrasse", "kueche_orakel", "buero_50", "testkammer_1", "testkammer_2", "testkammer_3", "kern"]
var aus := "user://review/"
var modus := "anfang"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		if a == "ende":
			modus = a
		else:
			aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	var S = root.get_node("Spiel")
	var Z = root.get_node("Zustand")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	S.welt_beginnen("welt-3")
	await _warte_raum(RAEUME[0])
	if modus == "ende":
		var d: Variant = JSON.parse_string(FileAccess.get_file_as_string("res://daten/welten/welt-3.json"))
		var r = d.raetsel
		for e in (r.keys() if typeof(r) == TYPE_DICTIONARY else r.map(func(x): return x.id)):
			Z.loese(e)
	var alles := {}
	for rid in RAEUME:
		root.get_node("Spiel").herkunft_raum = ""
		root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
		await _warte_raum(rid)
		for i in 20:
			await process_frame
		alles[rid] = await _messen(rid)
	var f := FileAccess.open(aus + "groessen_%s.json" % modus, FileAccess.WRITE)
	f.store_string(JSON.stringify(alles, "  "))
	f.close()
	print("FERTIG")
	quit(0)


func _sichtbar(c: Node) -> Dictionary:
	var spr: Sprite2D = c.get_node_or_null("Sprite2D") as Sprite2D
	if spr == null or spr.texture == null:
		return {}
	var img: Image = spr.texture.get_image()
	if img == null:
		return {}
	if img.is_compressed():
		img.decompress()
	var fw: int = img.get_width() / maxi(spr.hframes, 1)
	var fh: int = img.get_height() / maxi(spr.vframes, 1)
	var fx: int = (spr.frame % maxi(spr.hframes, 1)) * fw
	var fy: int = (spr.frame / maxi(spr.hframes, 1)) * fh
	if spr.region_enabled:
		fx = int(spr.region_rect.position.x); fy = int(spr.region_rect.position.y)
		fw = int(spr.region_rect.size.x); fh = int(spr.region_rect.size.y)
	var sub: Image = img.get_region(Rect2i(fx, fy, fw, fh))
	var used: Rect2i = sub.get_used_rect()
	var gs: Vector2 = spr.global_transform.get_scale()
	var r: Rect2 = spr.get_rect()
	var oben: Vector2 = spr.global_transform * (r.position + Vector2(used.position))
	var unten: Vector2 = spr.global_transform * (r.position + Vector2(used.end))
	var mod: Color = c.modulate * spr.modulate * spr.self_modulate
	return {"h": roundf(used.size.y * absf(gs.y) * 10) / 10, "b": roundf(used.size.x * absf(gs.x) * 10) / 10,
		"oben": [roundi(minf(oben.x, unten.x)), roundi(oben.y)], "unten_y": roundi(unten.y),
		"fuss_y": roundi(c.global_position.y), "skala": roundf(c.scale.y * 1000) / 1000,
		"modulate": [roundf(mod.r * 100) / 100, roundf(mod.g * 100) / 100, roundf(mod.b * 100) / 100],
		"textur": spr.texture.resource_path, "frames": [spr.hframes, spr.vframes, spr.frame], "z": c.z_index}


func _messen(rid: String) -> Dictionary:
	var raum = root.get_node("R").current
	var out := {"figuren": {}, "max_vorn": {}, "max_hinten": {}, "canvas_modulate": []}
	for n in raum.find_children("*", "CanvasModulate", true, false):
		out.canvas_modulate.append(str(n.color))
	for c in raum.get_characters():
		if c.visible:
			out.figuren[str(c.script_name)] = _sichtbar(c)
	# Max vorn und hinten im Laufbereich
	var mx = root.get_node("C").get_character("Max")
	var ys := []
	for w in raum.get_walkable_areas():
		for pg in w.interaction_polygon:
			for p in pg:
				ys.append((w.global_transform * (p + w.interaction_polygon_position)).y)
	if ys.size() > 0 and mx:
		var alt: Vector2 = mx.position
		for wo in [["max_hinten", ys.min() + 1.0], ["max_vorn", ys.max() - 1.0]]:
			mx.position = Vector2(alt.x, wo[1])
			if mx.has_method("update_scale"):
				mx.update_scale()
			for i in 6:
				await process_frame
			out[wo[0]] = _sichtbar(mx)
		mx.position = alt
	return out


func _warte_raum(rid: String) -> void:
	await _warte_bis(func():
		var r = root.get_node("R").current
		return r != null and r.has_method("raum_id") and r.raum_id() == rid and root.get_node("E").in_room and r.is_current, 15.0)
	await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
	for i in 10:
		await process_frame


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true
