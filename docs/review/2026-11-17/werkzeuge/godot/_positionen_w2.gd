extends SceneTree
## Aufnahme (nicht für CI): jeder Welt-2-Raum mit seinen Figuren, ganze Breite.

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://pos_w2/"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	var S = root.get_node("Spiel")
	var Z = root.get_node("Zustand")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	S.welt_beginnen("welt-2")
	await _warte_raum("nil_delta")
	await _bild("nil_delta")
	Z.setze("W2_HERMES_IM_BUERO")
	for rid in ["thronsaal_ramses", "palastkueche", "sphinx", "faehrsteg_olympia", "agora", "startbuero", "stadion", "hafen_syrakus", "werkstatt", "grabhuegel"]:
		await _geh(rid)
		await _bild(rid)
	Z.setze("W2_TAG1_LAEUFT")
	await _geh("agora")
	await _geh("stadion")
	await _bild("stadion_tag1")
	Z.setze("W2_TAG1_LAEUFT", false)
	Z.loese("R13")
	await _geh("agora")
	await _geh("stadion")
	await _bild("stadion_parade")
	quit(0)


func _bild(name: String) -> void:
	var raum = root.get_node("R").current
	var breite := int(raum.get("width")) if raum.get("width") else 640
	var mx = root.get_node("C").get_character("Max")
	var ges := Image.create(breite, 360, false, Image.FORMAT_RGBA8)
	var mpos: Vector2 = mx.position
	for px in range(0, breite, 640):
		mx.position = Vector2(px + 320, mpos.y)
		for i in 40:
			await process_frame
		mx.visible = false
		await process_frame
		await process_frame
		var img := root.get_texture().get_image()
		img.convert(Image.FORMAT_RGBA8)
		img.resize(640, 360, Image.INTERPOLATE_NEAREST)
		if px == 0:
			print(name, " roh ", img.get_size())
		ges.blit_rect(img, Rect2i(0, 0, 640, 360), Vector2i(px, 0))
		mx.visible = true
	mx.position = mpos
	ges.save_png(aus + name + ".png")


func _geh(rid: String) -> void:
	root.get_node("Spiel").herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_raum(rid)


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
