extends SceneTree
## Review 20.11. (GS, nicht committen): Apothekengasse – Raumbreite 640, Hintergrund 1280. Max nach
## x 1000 laufen lassen (echtes walk_to) und Kamera und Bild festhalten.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_gs_w3_kamera.gd -- AUSGABE

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_gs/"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		aus = a.trim_suffix("/") + "/"
	var S = root.get_node("Spiel")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	S.welt_beginnen("welt-3")
	await _warte_raum("unterstadt_strasse")
	S.herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name("apothekengasse"))
	var ok = await _warte_raum("apothekengasse")
	print("KAMERA im Raum ", ok, " ", root.get_node("R").current.raum_id())
	for i in 30:
		await process_frame
	var raum = root.get_node("R").current
	var mx = root.get_node("C").player
	print("KAMERA raum.width=", raum.get("width"), " Hintergrund=", raum.get_node("Props/Background").texture.get_size(), " Max=", mx.position)
	mx.walk_to(Vector2(1000, 320))
	await _warte_bis(func(): return mx.position.distance_to(Vector2(1000, 320)) < 4.0, 20.0)
	for i in 30:
		await process_frame
	var cam = raum.get_viewport().get_camera_2d()
	print("KAMERA nach Laufen: Max=", mx.position, " Kameramitte=", cam.get_screen_center_position() if cam else "keine")
	var img := root.get_texture().get_image()
	img.convert(Image.FORMAT_RGBA8)
	img.resize(640, 360, Image.INTERPOLATE_NEAREST)
	img.save_png(aus + "apothekengasse_max_bei_x1000.png")
	print("FERTIG")
	quit(0)


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true


func _warte_raum(rid: String) -> bool:
	var ok := await _warte_bis(func():
		var r = root.get_node("R").current
		return r != null and r.has_method("raum_id") and r.raum_id() == rid and root.get_node("E").in_room and r.is_current, 20.0)
	await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
	for i in 10:
		await process_frame
	return ok
