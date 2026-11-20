extends SceneTree
## Review 20.11., Nachtrag Sebastian (nicht für CI, nicht committen): Pixel als Spielfigur läuft in
## Welt-3-Räumen (und zum Vergleich auf dem Dorfplatz, Welt 1) je einmal nach rechts und links.
## Je Prozessbild: Position, Skala, Sheet-Bild, speed_scale; Bilder für GIFs alle ~40 ms.
## Variante: Pixel in der Simulation sichtbar?
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_nachtrag_pixel_gang.gd -- AUSGABE

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_nachtrag/"
var S
var C
var Z


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	S = root.get_node("Spiel")
	C = root.get_node("C")
	Z = root.get_node("Zustand")
	S.testmodus = true
	root.get_node("E").settings.auto_continue_text = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	S.welt_beginnen("welt-3")
	await _warte_raum("unterstadt_strasse")
	for f in ["W3_ANKUNFT", "W3_SIM_GESEHEN", "W3_TURM_GESEHEN", "W3_ERSTES_AUFWACHEN", "W3_LABOR_GESEHEN"]:
		Z.setze(f)
	for eb in ["realitaet", "simulation"]:
		Z.setze_wert("W3_EBENE", eb)
		C.player = C.get_character("Max")
		S.testmodus = false
		S.herkunft_raum = ""
		root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name("stadtstrasse"))
		await _warte_raum("stadtstrasse")
		await create_timer(1.0).timeout
		var r = root.get_node("R").current
		var px = C.get_character("Pixel")
		print("EBENE ", eb, " Pixel im Raum: ", r.has_character("Pixel"), " sichtbar: ", px != null and px.is_inside_tree() and px.visible and px.get_parent() != null and r.is_ancestor_of(px))
		S.testmodus = true
		await _geh("unterstadt_strasse")
	print("FERTIG")
	quit(0)


func _gang(rid: String, y: float, x0: float, x1: float) -> void:
	var px = C.get_character("Pixel")
	var mx = C.get_character("Max")
	if px == null:
		print("FEHLT Pixel in ", rid)
		return
	S.testmodus = true
	px.position = Vector2(x0, y)
	if mx:
		mx.position = Vector2(x0 - 60.0, y)
	C.player = px
	await create_timer(0.6).timeout
	S.testmodus = false
	for richtung in [["rechts", x1], ["links", x0]]:
		var name: String = "n4_%s_%s" % [rid, richtung[0]]
		px.walk_to(Vector2(richtung[1], px.position.y))
		var t0 := Time.get_ticks_msec()
		var daten := []
		var bild_nr := 0
		var naechstes := 0
		while Time.get_ticks_msec() - t0 < 6000:
			await process_frame
			var ms := Time.get_ticks_msec() - t0
			var sp = px.get_node_or_null("Sprite2D")
			var ap = px.get_node_or_null("AnimationPlayer")
			daten.append([ms, px.position.x, px.position.y, px.scale.x, sp.frame if sp else -1,
				ap.speed_scale if ap else 0.0, ap.current_animation if ap else "", sp.flip_h if sp else false,
				px.get_global_transform_with_canvas().origin.x, px.get_global_transform_with_canvas().origin.y])
			if ms >= naechstes and bild_nr < 160:
				var img := root.get_texture().get_image()
				img.resize(640, 360, Image.INTERPOLATE_NEAREST)
				img.save_png(aus + "%s_%03d.png" % [name, bild_nr])
				bild_nr += 1
				naechstes = ms + 40
			if not px.is_moving and ms > 800:
				break
		var f := FileAccess.open(aus + "%s.json" % name, FileAccess.WRITE)
		f.store_string(JSON.stringify({"raum": rid, "walk_speed": px.walk_speed,
			"override": px.get("walk_speed_override"), "daten": daten}))
		f.close()
		print("AUFNAHME ", name, " ", daten.size())
		await create_timer(0.5).timeout
	S.testmodus = true


func _geh(rid: String) -> void:
	S.testmodus = true
	S.herkunft_raum = ""
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
