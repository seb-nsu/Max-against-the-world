extends SceneTree
## Review GS (nicht committen): fährt in jedem Raum mit simulierten Mausbewegungen ein Raster ab
## und schreibt auf, welches Objekt Popochiu an jeder Stelle als „hovered“ führt (echte
## Physik-Auswahl, echte Reihenfolge-Regel von Popochiu und Spiel.zeiger_betritt) und ob die
## Oberfläche (Porträts, Pfote, Inventarleiste) die Maus schluckt.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_gs_zeiger.gd -- AUSGABE [ende] [raum,raum]

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
const SCHRITT := 6
var aus := "user://review_gs/"
var modus := "anfang"
var nur: Array = []

const WELTEN := {
	"prolog": ["wohnzimmer", "treppenhaus", "dachboden"],
	"welt-1": ["dorfplatz", "taverne", "schmiede", "zauberstabladen", "klassenzimmer", "trollbruecke",
		"wasserschloss", "zauberwald", "luftschloss", "bergwerk", "turmkeller", "abstellkammer_1",
		"abstellkammern", "thronsaal"],
	"welt-2": ["nil_delta", "thronsaal_ramses", "palastkueche", "sphinx", "faehrsteg_olympia", "agora",
		"startbuero", "stadion", "hafen_syrakus", "werkstatt", "grabhuegel"],
}


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		if a == "ende":
			modus = "ende"
		elif "," in a or a in WELTEN["prolog"] + WELTEN["welt-1"] + WELTEN["welt-2"]:
			nur = Array(a.split(","))
		else:
			aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	Engine.max_fps = 0
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	Engine.physics_ticks_per_second = 1000
	Engine.max_physics_steps_per_frame = 1
	var S = root.get_node("Spiel")
	var Z = root.get_node("Zustand")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	print("final_transform ", root.get_final_transform(), " size ", root.size)
	for welt in WELTEN:
		var liste: Array = WELTEN[welt].filter(func(r): return nur.is_empty() or r in nur)
		if liste.is_empty():
			continue
		if welt != "prolog":
			S.welt_beginnen(welt)
			await _warte_raum(WELTEN[welt][0])
		if modus == "ende":
			for r in _raetsel(welt):
				Z.loese(r)
		for rid in liste:
			await _geh(rid)
			await _abtasten(welt, rid)
	print("FERTIG")
	quit(0)


func _raetsel(welt: String) -> Array:
	var ids := []
	var pfad := "res://daten/welten/%s.json" % welt
	if not FileAccess.file_exists(pfad):
		return ids
	var d: Variant = JSON.parse_string(FileAccess.get_file_as_string(pfad))
	if typeof(d) == TYPE_DICTIONARY and d.has("raetsel"):
		var r = d.raetsel
		if typeof(r) == TYPE_DICTIONARY:
			ids = r.keys()
		else:
			for e in r:
				ids.append(e.id)
	return ids


func _maus(p: Vector2) -> void:
	var ev := InputEventMouseMotion.new()
	var w: Vector2 = root.get_final_transform() * p
	ev.position = w
	ev.global_position = w
	root.push_input(ev)


func _abtasten(welt: String, rid: String) -> void:
	var raum = root.get_node("R").current
	var E = root.get_node("E")
	var breite := int(raum.get("width")) if raum.get("width") else 640
	var mx = root.get_node("C").get_character("Max")
	var mpos: Vector2 = mx.position
	var namen: Array = ["", "#UI"]
	var info := {"raum": rid, "welt": welt, "modus": modus, "breite": breite, "schritt": SCHRITT,
		"schirme": [], "namen": namen}
	var xs := range(0, breite, 640)
	if breite > 640 and breite % 640 != 0:
		xs.append(breite - 640)
	for px in xs:
		mx.position = Vector2(px + 320, mpos.y)
		for i in 30:
			await process_frame
		var cam = raum.get_viewport().get_camera_2d()
		var mitte: Vector2 = cam.get_screen_center_position() if cam else Vector2(320, 180)
		var off := mitte - Vector2(320, 180)
		var zeilen := []
		_maus(Vector2(320, 200))
		await physics_frame
		await physics_frame
		var y := SCHRITT / 2
		var rueck := false
		while y < 360:
			var zeile := []
			var xr := range(SCHRITT / 2, 640, SCHRITT)
			if rueck:
				xr.reverse()
			for x in xr:
				_maus(Vector2(x, y))
				await physics_frame
				await process_frame
				var n := ""
				var ctrl = root.gui_get_hovered_control() if root.has_method("gui_get_hovered_control") else null
				if ctrl != null and ctrl.mouse_filter == Control.MOUSE_FILTER_STOP:
					n = "#UI"
				else:
					var h = E.hovered
					if is_instance_valid(h):
						n = str(h.script_name)
				var idx := namen.find(n)
				if idx < 0:
					namen.append(n)
					idx = namen.size() - 1
				zeile.append(idx)
			if rueck:
				zeile.reverse()
			zeilen.append(zeile)
			rueck = not rueck
			y += SCHRITT
		info.schirme.append({"off": [off.x, off.y], "zeilen": zeilen})
		_maus(Vector2(320, 200))
	mx.position = mpos
	var f := FileAccess.open(aus + "%s_%s_zeiger.json" % [rid, modus], FileAccess.WRITE)
	f.store_string(JSON.stringify(info))
	f.close()
	print("RAUM ", rid, " ", modus, " ok ", namen)


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
