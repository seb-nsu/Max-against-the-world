extends SceneTree
## Werkzeug Zeigerraster (kein CI-Test): fährt in jedem Raum eines Abschnitts mit simulierten
## Mausbewegungen ein Raster ab und schreibt auf, welches Objekt Popochiu an jeder Stelle als
## „hovered“ führt (echte Physik-Auswahl, echte Reihenfolge-Regel von Popochiu und
## Spiel.zeiger_betritt) und ob die Oberfläche (Porträts, Pfote, Inventarleiste) die Maus schluckt.
## Fester Schritt vor jedem Grafik-Einbau-PR (Prüftor: Zeigerraster). Aus dem Review 20.11.
## (`_review_gs_w3_zeiger.gd`), jetzt mit Abschnitt als Parameter.
##
## Aufruf aus dem Checkout (mit Fenster, außerhalb des Bildschirms):
##   godot --path game --position 6000,3000 -s res://tests/werkzeuge/zeigerraster.gd -- \
##       ABSCHNITT [AUSGABE] [ende] [nur=raum,raum] [setze=SCHALTER+R..] [tag=name] [pixel]
## ABSCHNITT: prolog, welt-1 … welt-4, finale. AUSGABE: Standard user://zeigerraster/<abschnitt>/.
## „pixel“: Pixel statt Max ist die Spielfigur. Ausgabe je Raum: <raum>_<tag>_bild.png (Panorama)
## und <raum>_<tag>_zeiger.json (Raster: Index in „namen“ je SCHRITT Pixel, hin und zurück).

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
const SCHRITT := 6
var aus := ""
var modus := "anfang"
var welt := ""
var nur: Array = []
var setze: Array = []
var tag := ""
var als_pixel := false


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var B = root.get_node("Bauplan")
	for a in OS.get_cmdline_user_args():
		if a == "ende":
			modus = "ende"
		elif a.begins_with("nur="):
			nur = Array(a.trim_prefix("nur=").split(","))
		elif a.begins_with("setze="):
			setze = Array(a.trim_prefix("setze=").split("+"))
		elif a.begins_with("tag="):
			tag = a.trim_prefix("tag=")
		elif a == "pixel":
			als_pixel = true
		elif B.plaene.has(a):
			welt = a
		else:
			aus = a.trim_suffix("/") + "/"
	if welt == "":
		print("FEHLER: Abschnitt fehlt, z. B. -- welt-3 (bekannt: %s)" % ", ".join(B.plaene.keys()))
		quit(2)
		return
	if aus == "":
		aus = "user://zeigerraster/%s/" % welt
	aus = ProjectSettings.globalize_path(aus)
	DirAccess.make_dir_recursive_absolute(aus)
	var liste: Array = []
	for r in B.plaene[welt].get("raeume", []):
		if (nur.is_empty() or r.id in nur) and ResourceLoader.exists("res://game/rooms/%s/room_%s.tscn" % [r.id, r.id]):
			liste.append(r.id)
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
	if welt != "prolog":
		S.welt_beginnen(welt)
		await _warte_bis(func(): return _raum_id() != "" and _raum_id() != "wohnzimmer", 15.0)
		await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
	if modus == "ende":
		for r in _raetsel(welt):
			Z.loese(r)
	for s in setze:
		if s.contains("_"):
			Z.setze(s)
		else:
			Z.loese(s)
	if tag == "":
		tag = modus
	if als_pixel:
		var C = root.get_node("C")
		C.player = C.get_character("Pixel")
	for rid in liste:
		await _geh(rid)
		await _abtasten(welt, rid)
	print("Ausgabe: ", aus)
	print("FERTIG")
	quit(0)


func _raum_id() -> String:
	var r = root.get_node("R").current
	return r.raum_id() if is_instance_valid(r) and r.has_method("raum_id") else ""


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
	if _raum_id() != rid:
		return  # nicht erreicht (Meldung in _geh), kein falsches Bild unter diesem Namen
	var raum = root.get_node("R").current
	var E = root.get_node("E")
	var breite := int(raum.get("width")) if raum.get("width") else 640
	var mx = root.get_node("C").get_character("Max")
	var mpos: Vector2 = mx.position
	var namen: Array = ["", "#UI"]
	var info := {"raum": rid, "welt": welt, "modus": tag, "breite": breite, "schritt": SCHRITT,
		"schirme": [], "namen": namen}
	var xs := range(0, breite, 640)
	if breite > 640 and breite % 640 != 0:
		xs.append(breite - 640)
	var pano := Image.create(breite, 360, false, Image.FORMAT_RGBA8)
	for px in xs:
		mx.position = Vector2(px + 320, mpos.y)
		for i in 30:
			await process_frame
		mx.visible = false
		_maus(Vector2(-50, -50))
		for i in 3:
			await process_frame
		var im := root.get_texture().get_image()
		im.convert(Image.FORMAT_RGBA8)
		im.resize(640, 360, Image.INTERPOLATE_NEAREST)
		pano.blit_rect(im, Rect2i(0, 0, 640, 360), Vector2i(px, 0))
		mx.visible = true
		var cam = raum.get_viewport().get_camera_2d()
		var mitte: Vector2 = cam.get_screen_center_position() if cam else Vector2(320, 180)
		var off := mitte - Vector2(320, 180)
		var zeilen := []
		var zeilen_rl := []
		_maus(Vector2(320, 200))
		await physics_frame
		await physics_frame
		var y := SCHRITT / 2
		var rueck := false
		while y < 360:
			for richtung in 2:
				rueck = richtung == 1
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
					zeilen_rl.append(zeile)
				else:
					zeilen.append(zeile)
			y += SCHRITT
		info.schirme.append({"off": [off.x, off.y], "zeilen": zeilen, "zeilen_rl": zeilen_rl})
		_maus(Vector2(320, 200))
	mx.position = mpos
	pano.save_png(aus + "%s_%s_bild.png" % [rid, tag])
	var f := FileAccess.open(aus + "%s_%s_zeiger.json" % [rid, tag], FileAccess.WRITE)
	f.store_string(JSON.stringify(info))
	f.close()
	print("RAUM ", rid, " ", tag, " ok ", namen)


## Geht in den Raum; läuft beim ersten Versuch noch eine Szene (Ankunft, Welt-Intro), greift der
## Raumwechsel nicht, dann bis zu zwei weitere Versuche.
func _geh(rid: String) -> void:
	for versuch in 3:
		await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
		root.get_node("Spiel").herkunft_raum = ""
		root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
		await _warte_raum(rid)
		if _raum_id() == rid:
			return
	print("FEHLER: Raum %s nicht erreicht (aufgenommen wird %s)" % [rid, _raum_id()])


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
