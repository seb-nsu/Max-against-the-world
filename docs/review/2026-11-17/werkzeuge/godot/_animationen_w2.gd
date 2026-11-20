extends SceneTree
## Aufnahme (nicht für CI): neue Welt-2-Läufe im echten Raum, je 8 Bilder.
## Aufruf: godot --path game --position 6000,3000 --resolution 640x360 -s res://tests/_animationen_w2.gd -- AUSGABE

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://anim_w2/"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	var S = root.get_node("Spiel")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	for sn in ["Notizbuch", "Thunfischdose", "Kochloeffel"]:
		await S.geben(sn)
	S.welt_beginnen("welt-2")
	await _warte_raum("nil_delta")
	var W = S.regeln()
	# Hermes joggt im Nil-Delta herein
	S.testmodus = false
	var raum = root.get_node("R").current
	var ziel: Vector2 = raum.get_marker_position("Hermes")
	S.figur_hier("Hermes", true, ziel)
	W._figur_laeuft("Hermes", Vector2(ziel.x + 380, ziel.y), ziel, 160.0, "joggen")
	var h = root.get_node("C").get_character("Hermes")
	print("DBG ", ziel, " hier=", raum.has_character("Hermes"), " tree=", h.is_inside_tree(), " vis=", h.visible, " pos=", h.position, " mod=", h.modulate, " tex=", h.get_node("Sprite2D").texture)
	await _bilder("hermes", 8, 0.4)
	print("DBG2 pos=", h.position, " vis=", h.visible, " hier=", raum.has_character("Hermes"))
	# Archimedes Heureka in der Werkstatt
	S.testmodus = true
	await _geh("werkstatt")
	S.testmodus = false
	var arc = root.get_node("C").get_character("Archimedes")
	arc.grafik_laden("archimedes_handtuch")
	var st: Vector2 = arc.position
	W._figur_laeuft("Archimedes", st, Vector2(st.x + 300, st.y), 170.0, "heureka")
	await _bilder("heureka", 8, 0.18)
	# Max barfuß im Stadion
	S.testmodus = true
	await _geh("stadion")
	S.testmodus = false
	var mx = root.get_node("C").get_character("Max")
	var p: Vector2 = mx.position
	mx.laufen_zu(Vector2(p.x - 400, p.y), 150.0, "barfuss")
	await _bilder("barfuss", 8, 0.15)
	quit(0)


func _aufnehmen(_n: String, _c) -> void:
	pass


func _bilder(name: String, n: int, abstand: float) -> void:
	for i in n:
		await create_timer(abstand).timeout
		await process_frame
		var img := root.get_texture().get_image()
		img.resize(640, 360, Image.INTERPOLATE_NEAREST)
		img.save_png(aus + "%s_%02d.png" % [name, i])


func _geh(rid: String) -> void:
	root.get_node("Spiel").herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_raum(rid)


func _warte_raum(rid: String) -> void:
	await _warte_bis(func():
		var r = root.get_node("R").current
		return r != null and r.has_method("raum_id") and r.raum_id() == rid and root.get_node("E").in_room and r.is_current, 15.0)
	await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
	for i in 5:
		await process_frame


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true
