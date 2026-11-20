extends SceneTree
## Review 20.11. (TA, nicht committen): Bildschirmfoto eines Welt-3-Raums mit Max an einer Stelle.
## -- AUSGABE raum=<rid> x=<max_x> y=<max_y> [loese=R3a,R2] [setze=W3_NACHT] [ende]

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review/"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var arg := {}
	for a in OS.get_cmdline_user_args():
		if "=" in a:
			arg[a.get_slice("=", 0)] = a.get_slice("=", 1)
		elif a == "ende":
			arg.ende = true
		else:
			aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	var S = root.get_node("Spiel")
	var Z = root.get_node("Zustand")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	S.welt_beginnen("welt-3")
	await _warte_bis(func(): return root.get_node("R").current != null and root.get_node("E").in_room, 15.0)
	for i in 30:
		await process_frame
	if arg.has("ende"):
		var d: Variant = JSON.parse_string(FileAccess.get_file_as_string("res://daten/welten/welt-3.json"))
		var r = d.raetsel
		for e in (r.keys() if typeof(r) == TYPE_DICTIONARY else r.map(func(x): return x.id)):
			Z.loese(e)
	for l in str(arg.get("loese", "")).split(",", false):
		Z.loese(l)
	for s in str(arg.get("setze", "")).split(",", false):
		Z.setze(s)
	var rid: String = arg.get("raum", "apothekengasse")
	S.herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_bis(func():
		var r = root.get_node("R").current
		return r != null and r.has_method("raum_id") and r.raum_id() == rid and root.get_node("E").in_room and r.is_current, 15.0)
	await _warte_bis(func(): return S.in_szene == 0, 30.0)
	var mx = root.get_node("C").get_character("Max")
	if arg.has("x"):
		mx.position = Vector2(float(arg.x), float(arg.get("y", mx.position.y)))
	if arg.has("effekte"):
		S.testmodus = false
		root.get_node("R").current._effekte_setzen()
		var bis := Time.get_ticks_msec() + int(float(arg.effekte) * 1000)
		while Time.get_ticks_msec() < bis:
			await process_frame
	for i in 60:
		await process_frame
	var name: String = arg.get("name", rid)
	for k in int(arg.get("serie", 1)):
		var img := root.get_texture().get_image()
		img.convert(Image.FORMAT_RGBA8)
		img.resize(640, 360, Image.INTERPOLATE_NEAREST)
		img.save_png(aus + name + ("" if k == 0 else "_%02d" % k) + ".png")
		var bis2 := Time.get_ticks_msec() + int(float(arg.get("takt", 0.5)) * 1000)
		while Time.get_ticks_msec() < bis2:
			await process_frame
	var cam = root.get_node("R").current.get_viewport().get_camera_2d()
	print("KAMERA ", cam.get_screen_center_position() if cam else "-", " RAUMBREITE ", root.get_node("R").current.get("width"))
	print("FERTIG")
	quit(0)


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true
