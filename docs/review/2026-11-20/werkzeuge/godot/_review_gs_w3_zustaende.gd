extends SceneTree
## Review 20.11. (GS, nicht committen): Zustände der Stadtstraße im laufenden Spiel OHNE Testmodus
## (Effekte laufen nur dann): Radiowecker 5:59 -> klingelt nach 30 s, Nacht, redende Glastür (Tag
## und Nacht), Code-Sicht-Lage, Speichern/Laden mit Nacht+Wecker, Pixels Stromkasten.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_gs_w3_zustaende.gd -- AUSGABE

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_gs_zust/"
var S
var Z
var raum


func _initialize() -> void:
	_lauf.call_deferred()


func _p(t: String) -> void:
	print("ZUST ", t)


func _bild(name: String) -> void:
	var img := root.get_texture().get_image()
	img.convert(Image.FORMAT_RGBA8)
	img.resize(640, 360, Image.INTERPOLATE_NEAREST)
	img.save_png(aus + name + ".png")


func _bilder(name: String, n: int, abstand: float) -> void:
	for i in n:
		_bild("%s_%02d" % [name, i])
		await create_timer(abstand).timeout


func _effekte(tag: String) -> void:
	raum = root.get_node("R").current
	for e in raum._effekte:
		var d: Dictionary = e[0]
		var b := String(d.get("bild", d.get("art", ""))).get_file()
		if b.begins_with("w3_radiowecker") or b.begins_with("w3_glastuer"):
			var sp = e[1]
			_p("%s effekt %s sichtbar=%s frame=%s" % [tag, b, sp.visible, sp.frame])
	for h in raum.get_hotspots():
		if "adiowecker" in str(h.script_name):
			_p("%s hotspot %s sichtbar=%s" % [tag, h.script_name, h.visible])
	var bg = raum.get_node("Props/Background")
	_p("%s hintergrund %s" % [tag, bg.texture.resource_path.get_file()])
	_p("%s W3_NACHT=%s W3_WECKER_KLINGELT=%s spricht=%s" % [tag, Z.ist("W3_NACHT"), Z.ist("W3_WECKER_KLINGELT"), S.spricht])


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	S = root.get_node("Spiel")
	Z = root.get_node("Zustand")
	var C = root.get_node("C")
	var R = root.get_node("R")
	CQSaveLoad.ordner = "user://review_gs_saves/"
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	S.welt_beginnen("welt-3")
	await _warte_raum("unterstadt_strasse")
	# Simulation wie nach der roten Pastille, ohne Begrüßungsszene
	Z.setze("W3_SIM_GESEHEN")
	Z.setze_wert("W3_EBENE", "simulation")
	S.testmodus = false
	var t0 := Time.get_ticks_msec()
	await _geh("stadtstrasse")
	await create_timer(1.5).timeout
	_effekte("1_tag_start")
	await _bilder("st_tag_0559", 4, 0.25)
	# Wecker: 30 s nach dem Betreten
	await _warte_bis(func(): return Z.ist("W3_WECKER_KLINGELT"), 40.0)
	_p("wecker klingelt nach %.1f s" % ((Time.get_ticks_msec() - t0) / 1000.0))
	await create_timer(0.5).timeout
	_effekte("2_tag_klingelt")
	await _bilder("st_tag_klingelt", 6, 0.09)
	# Nacht (Pixels Stromkasten) während der Wecker klingelt
	Z.setze("W3_NACHT")
	await create_timer(0.5).timeout
	_effekte("3_nacht_klingelt")
	await _bilder("st_nacht_klingelt", 6, 0.09)
	Z.setze("W3_WECKER_KLINGELT", false)
	await create_timer(0.5).timeout
	_effekte("4_nacht_0559")
	await _bilder("st_nacht_0559", 2, 0.25)
	# Glastür spricht (Tag und Nacht), Kamera nach rechts
	var mx = C.get_character("Max")
	mx.position = Vector2(1000, 344)
	for nacht in [false, true]:
		Z.setze("W3_NACHT", nacht)
		await create_timer(1.0).timeout
		S.sagen("TUR", "W3_TUER_TUR_0200")
		await create_timer(0.6).timeout
		_effekte("5_tuer_spricht_" + ("nacht" if nacht else "tag"))
		await _bilder("st_tuer_spricht_" + ("nacht" if nacht else "tag"), 4, 0.12)
		await _warte_bis(func(): return S.spricht == "", 15.0)
		await create_timer(0.3).timeout
		_effekte("6_tuer_still_" + ("nacht" if nacht else "tag"))
	# Code-Sicht: Lage des Bilds gegen den Hintergrund
	Z.setze("W3_NACHT", false)
	var W = S.regeln()
	W._code_sicht_zeigen("stadtstrasse")
	await create_timer(0.3).timeout
	raum = R.current
	var bg = raum.get_node("Props/Background")
	var cs = raum.get_node_or_null("Props/Background/CodeSicht")
	if cs:
		var r: Rect2 = cs.get_rect()
		_p("codesicht bild global %s, Rechteck oben-links %s, Hintergrund-Sprite global %s, Background-Knoten %s" % [
			cs.global_position, cs.global_position + r.position, bg.get_node("Sprite2D").global_position, bg.global_position])
	_bild("st_codesicht_rechts")
	W._code_sicht_weg()
	# Speichern/Laden mit Nacht + Wecker
	Z.setze("W3_NACHT")
	Z.setze("W3_WECKER_KLINGELT")
	W._wecker_anzeigen()
	await create_timer(0.5).timeout
	var sp = root.get_node("Spielstand")
	var ok = sp.speichern(7)
	_p("gespeichert %s" % ok)
	Z.setze("W3_NACHT", false)
	Z.setze("W3_WECKER_KLINGELT", false)
	await _geh("kueche_orakel")
	await create_timer(1.0).timeout
	var geladen = await sp.laden(7)
	_p("laden gestartet %s" % geladen)
	await _warte_raum("stadtstrasse")
	await create_timer(2.0).timeout
	mx = C.get_character("Max")
	_effekte("7_nach_laden")
	_bild("st_nach_laden")
	# Pixels Stromkasten in der Basis: wird es drüben Nacht?
	Z.setze("W3_NACHT", false)
	S.testmodus = true
	Z.setze_wert("W3_EBENE", "simulation")
	await _geh("widerstandsbasis")
	C.player = C.get_character("Pixel")
	await S.regel("benutzen", "stromkasten")
	_p("stromkasten als Pixel (getrennt) -> W3_NACHT=%s" % Z.ist("W3_NACHT"))
	print("FERTIG")
	quit(0)


func _geh(rid: String) -> void:
	S.herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_raum(rid)


func _warte_raum(rid: String) -> void:
	await _warte_bis(func():
		var r = root.get_node("R").current
		return r != null and r.has_method("raum_id") and r.raum_id() == rid and root.get_node("E").in_room and r.is_current, 20.0)
	await _warte_bis(func(): return S.in_szene == 0, 30.0)
	for i in 10:
		await process_frame


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true
