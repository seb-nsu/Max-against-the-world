extends SceneTree
## Review GS (nicht committen): Nimmt das Spiel Klicks an, während eine Figur zwischen zwei Szenen
## läuft (Hermes bringt Opas Papyrus im Nil-Delta, welt_2.gd nach_uebergang_nil_delta)?
## Ohne Testmodus. Klickt während Hermes' Joggen auf den Boden und protokolliert, ob Max losgeht.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_gs_eingabe.gd

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"


func _initialize() -> void:
	_lauf.call_deferred()


func _klick(welt: Vector2) -> void:
	var cam = root.get_node("R").current.get_viewport().get_camera_2d()
	var off: Vector2 = (cam.get_screen_center_position() - Vector2(320, 180)) if cam else Vector2.ZERO
	var p: Vector2 = root.get_final_transform() * (welt - off)
	for gedrueckt in [true, false]:
		var ev := InputEventMouseButton.new()
		ev.button_index = MOUSE_BUTTON_LEFT
		ev.pressed = gedrueckt
		ev.position = p
		ev.global_position = p
		root.push_input(ev)
		await physics_frame
		await process_frame


func _maus(welt: Vector2) -> void:
	var cam = root.get_node("R").current.get_viewport().get_camera_2d()
	var off: Vector2 = (cam.get_screen_center_position() - Vector2(320, 180)) if cam else Vector2.ZERO
	var ev := InputEventMouseMotion.new()
	ev.position = root.get_final_transform() * (welt - off)
	ev.global_position = ev.position
	root.push_input(ev)
	await physics_frame
	await process_frame


func _lauf() -> void:
	await process_frame
	var S = root.get_node("Spiel")
	var Z = root.get_node("Zustand")
	var R = root.get_node("R")
	var C = root.get_node("C")
	var G = root.get_node("G")
	var E = root.get_node("E")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return E.in_room, 15.0)
	S.welt_beginnen("welt-2")
	await _warte_bis(func(): return R.current and R.current.raum_id() == "nil_delta" and S.in_szene == 0, 30.0)
	S.herkunft_raum = ""
	R.goto_room("ThronsaalRamses")
	await _warte_bis(func(): return R.current and R.current.raum_id() == "thronsaal_ramses" and E.in_room and S.in_szene == 0, 30.0)
	for i in 30:
		await process_frame
	Z.setze_wert("W2_FAHRTEN", 1)
	S.testmodus = false
	E.settings.auto_continue_text = true
	print("Wechsel ins Nil-Delta (ohne Testmodus)")
	S.herkunft_raum = "ThronsaalRamses"
	R.goto_room("NilDelta")
	await _warte_bis(func(): return R.current and R.current.raum_id() == "nil_delta" and E.in_room, 30.0)
	var hermes = C.get_character("Hermes")
	await _warte_bis(func(): return is_instance_valid(hermes) and hermes.is_inside_tree() and hermes.visible, 10.0)
	var t0 := Time.get_ticks_msec()
	var max_vorher: Vector2 = C.Max.position
	print("Hermes da bei ", hermes.position, "  Max bei ", max_vorher, "  in_szene=", S.in_szene, " G.blocked=", G.is_blocked, " cutscene=", E.playing_queue)
	await create_timer(0.4).timeout
	print("nach 0,4 s: Hermes bei ", hermes.position, "  in_szene=", S.in_szene, " G.blocked=", G.is_blocked)
	# Klick auf den Boden weit links von Max
	var ziel := Vector2(max_vorher.x - 200, max_vorher.y)
	await _maus(ziel)
	await _klick(ziel)
	await create_timer(0.5).timeout
	print("0,5 s nach Klick: Max bei ", C.Max.position, " (vorher ", max_vorher, ") is_moving=", C.Max.is_moving, "  Hermes bei ", hermes.position, " in_szene=", S.in_szene)
	await _warte_bis(func(): return S.in_szene > 0, 6.0)
	print("Szene beginnt nach ", Time.get_ticks_msec() - t0, " ms; Max bei ", C.Max.position)
	await _warte_bis(func(): return S.in_szene == 0, 60.0)
	print("ENDE Szene; Max bei ", C.Max.position, " Papyrus: ", root.get_node("I").is_item_in_inventory(root.get_node("Bauplan").gegenstand_script_name("opas_papyrus")))
	print("FERTIG")
	quit(0)


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true
