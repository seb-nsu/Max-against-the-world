extends SceneTree
## Review 21.11.2026, Rolle Workflow (wf): Experiment zu den Zeiger-Werkzeugen. Kein CI-Test.
## Zeigt an einem Objekt im Wohnzimmer, was Popochiu als „hovered“ führt,
##   A  nach EINEM Bewegungsereignis (wie zeigerraster.gd), Runde für Runde,
##   B  wenn in jeder Physik-Runde ein Bewegungsereignis kommt (wie die Fernsteuerung),
##   C  in der Lesefolge von zeigerraster.gd (Ereignis, physics_frame, process_frame, lesen),
##   D  über einem Knopf der Oberfläche (Porträt): was meldet gui_get_hovered_control()?
## Modus „w3“: stellt den Start von zeigerraster.gd für Welt 3 nach (offener Punkt W3-4).
## Das Fenster bleibt außerhalb des Bildschirms, der echte Mauszeiger wird nie bewegt.
##
## Aufruf: godot --path game --position 6000,3000 --audio-driver Dummy -s res://tests/_r5_wf_zeiger.gd -- AUSGABE.txt [w3] [schnell]

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := ""
var modus := "prolog"
var schnell := false
var zeilen: PackedStringArray = []


func _initialize() -> void:
	_lauf.call_deferred()


func _fenster_weg() -> void:
	if DisplayServer.get_name() == "headless":
		return
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_NO_FOCUS, true)
	if DisplayServer.window_get_position() != Vector2i(6000, 3000):
		DisplayServer.window_set_position(Vector2i(6000, 3000))


func _process(_d: float) -> bool:
	_fenster_weg()
	return false


func _log(t: String) -> void:
	print(t)
	zeilen.append(t)


func _ende() -> void:
	if aus != "":
		var f := FileAccess.open(aus, FileAccess.WRITE)
		f.store_string("\n".join(zeilen) + "\n")
		f.close()
	quit(0)


func _lauf() -> void:
	_fenster_weg()
	await process_frame
	for a in OS.get_cmdline_user_args():
		if a == "w3":
			modus = "w3"
		elif a == "schnell":
			schnell = true
		else:
			aus = a
	var S = root.get_node("Spiel")
	var E = root.get_node("E")
	CQSaveLoad.ordner = "user://r5/wf/saves_%d/" % OS.get_process_id()
	if schnell:
		# Einstellungen wie in zeigerraster.gd Z. 61–64
		Engine.max_fps = 0
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		Engine.physics_ticks_per_second = 1000
		Engine.max_physics_steps_per_frame = 1
	S.testmodus = true
	_log("Modus %s, schnell=%s, Anzeige=%s, Godot %s" % [modus, schnell, DisplayServer.get_name(), Engine.get_version_info().string])
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return E.in_room, 15.0)
	_log("Wohnzimmer steht nach %d ms, in_szene=%d" % [Time.get_ticks_msec(), S.in_szene])
	if modus == "w3":
		await _w3_start()
		_ende()
		return
	var ok := await _warte_bis(func(): return S.in_szene == 0, 30.0)
	for i in 30:
		await process_frame
	_log("Einstieg fertig=%s, in_szene=%d, Fenster=%s, Fenstergröße=%s, mouse_in_window=%s" % [
		ok, S.in_szene, DisplayServer.window_get_position(), DisplayServer.window_get_size(),
		root.get("mouse_in_window") if "mouse_in_window" in root else "?"])
	_log("Echter Zeiger laut Betriebssystem: %s; root.get_mouse_position() (im Spielbild 640×360): %s" % [
		DisplayServer.mouse_get_position(), root.get_mouse_position()])
	# Ein Objekt mit Klickfläche im Bild suchen (unterhalb der Leiste)
	var raum = root.get_node("R").current
	var ziel: Node = null
	var punkt := Vector2.ZERO
	for o in raum.get_hotspots() + raum.get_props():
		if not o.visible or not o.clickable or o.interaction_polygon.is_empty():
			continue
		var m := Vector2.ZERO
		for p in o.interaction_polygon:
			m += o.global_transform * (p + o.interaction_polygon_position)
		m /= o.interaction_polygon.size()
		var b: Vector2 = root.get_canvas_transform() * m
		if b.x > 60 and b.x < 580 and b.y > 110 and b.y < 330 \
				and Geometry2D.is_point_in_polygon(o.to_local(m) - o.interaction_polygon_position, o.interaction_polygon):
			ziel = o
			punkt = b
			break
	if ziel == null:
		_log("FEHLER: kein Objekt gefunden")
		_ende()
		return
	_log("Objekt: %s, Bildpunkt %s" % [ziel.script_name, punkt])

	# A: ein Ereignis, dann zehn Physik-Runden ohne weiteres Ereignis
	_maus(Vector2(320, 345))
	for i in 3:
		await physics_frame
	_maus(punkt)
	var a: PackedStringArray = []
	for i in 10:
		await physics_frame
		await process_frame
		a.append(_h(E))
	_log("A ein Ereignis, danach je Physik-Runde: %s" % ", ".join(a))

	# B: in jeder Physik-Runde ein Ereignis
	var b_: PackedStringArray = []
	for i in 10:
		_maus(punkt)
		await physics_frame
		await process_frame
		b_.append(_h(E))
	_log("B Ereignis in jeder Runde: %s" % ", ".join(b_))

	# C: Lesefolge von zeigerraster.gd (Ereignis, physics_frame, process_frame, lesen), 20 Punkte
	# abwechselnd auf dem Objekt und auf einer freien Stelle
	var c_ok := 0
	var c_n := 0
	var frei := Vector2(punkt.x, 352)
	_maus(frei)
	await physics_frame
	await process_frame
	var frei_h := _h(E)
	for i in 20:
		var auf := i % 2 == 0
		_maus(punkt if auf else frei)
		await physics_frame
		await process_frame
		var h := _h(E)
		c_n += 1
		if (auf and h == str(ziel.script_name)) or (not auf and h == frei_h):
			c_ok += 1
	_log("C Lesefolge des Zeigerrasters: %d von %d Lesungen richtig (frei = „%s“)" % [c_ok, c_n, frei_h])

	# D: Knopf der Oberfläche (Porträt Max bei 4,4)
	var hud = S.hud
	var knopf: Control = null
	for n in hud.find_children("*", "BaseButton", true, false):
		if n.is_visible_in_tree():
			knopf = n
			break
	if knopf:
		var kp: Vector2 = knopf.get_global_rect().get_center()
		_maus(kp)
		await physics_frame
		await process_frame
		var c1 = root.gui_get_hovered_control()
		for i in 5:
			_maus(kp)
			await physics_frame
			await process_frame
		var c2 = root.gui_get_hovered_control()
		_log("D Knopf %s (Filter %d) Mitte %s: gui_get_hovered_control nach 1 Ereignis=%s, nach 6=%s, hovered=%s, Knopf.is_hovered()=%s" % [
			knopf.name, knopf.mouse_filter, kp, c1.name if c1 else "null", c2.name if c2 else "null", _h(E), knopf.is_hovered()])
	else:
		_log("D kein sichtbarer Knopf im HUD")
	# E: Klick ohne vorheriges Hinführen (Zeiger „verloren“, dann nur Tastenereignis an der Stelle)
	_maus(Vector2(320, 352))
	for i in 4:
		await physics_frame
	var vorher_klicks: int = ziel.times_clicked
	var vorher_prot: int = S.protokoll.size()
	var vor := _h(E)
	for gedrueckt in [true, false]:
		var k := InputEventMouseButton.new()
		k.button_index = MOUSE_BUTTON_LEFT
		k.pressed = gedrueckt
		var w: Vector2 = root.get_final_transform() * punkt
		k.position = w
		k.global_position = w
		k.button_mask = MOUSE_BUTTON_MASK_LEFT if gedrueckt else 0
		root.push_input(k)
		await physics_frame
		await process_frame
		if gedrueckt:
			_log("E nach dem Drücken: hovered=%s" % _h(E))
	await _warte_bis(func(): return S.in_szene == 0, 10.0)
	for i in 30:
		await process_frame
	var geklickt: PackedStringArray = []
	for o in raum.get_hotspots() + raum.get_props() + raum.get_characters():
		if o.times_clicked > 0:
			geklickt.append("%s×%d" % [o.script_name, o.times_clicked])
	_log("E Klick ohne Hinführen auf %s: hovered vorher=%s, times_clicked %d → %d, gesagte Zeilen %d → %d (letzte: %s), geklickt laut Zähler: %s" % [
		ziel.script_name, vor, vorher_klicks, ziel.times_clicked, vorher_prot, S.protokoll.size(),
		S.protokoll[-1] if not S.protokoll.is_empty() else "-", ", ".join(geklickt)])
	_log("Echter Zeiger am Ende: %s; root.get_mouse_position(): %s" % [DisplayServer.mouse_get_position(), root.get_mouse_position()])
	_ende()


## Start wie zeigerraster.gd Z. 65–74 für Welt 3, mit Zeitmessung
func _w3_start() -> void:
	var S = root.get_node("Spiel")
	var t0 := Time.get_ticks_msec()
	S.welt_beginnen("welt-3")
	var ok := await _warte_bis(func(): return _raum_id() != "" and _raum_id() != "wohnzimmer", 15.0)
	_log("W3: Wohnzimmer verlassen=%s nach %d ms, Raum=%s, in_szene=%d" % [ok, Time.get_ticks_msec() - t0, _raum_id(), S.in_szene])
	var t1 := Time.get_ticks_msec()
	var ok2 := await _warte_bis(func(): return S.in_szene == 0, 30.0)
	_log("W3: in_szene == 0 erreicht=%s nach %d ms, in_szene=%d, Raum=%s" % [ok2, Time.get_ticks_msec() - t1, S.in_szene, _raum_id()])
	# ein Raumwechsel wie zeigerraster._geh (ein Versuch), mit Zeitmessung
	var t2 := Time.get_ticks_msec()
	var ok3 := await _warte_bis(func(): return S.in_szene == 0, 30.0)
	S.herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name("apothekengasse"))
	var ok4 := await _warte_bis(func(): return _raum_id() == "apothekengasse" and root.get_node("E").in_room, 15.0)
	_log("W3: _geh(apothekengasse): Warten auf in_szene=%s, Raum erreicht=%s, zusammen %d ms, in_szene=%d" % [ok3, ok4, Time.get_ticks_msec() - t2, S.in_szene])


func _h(E) -> String:
	var h = E.hovered
	return str(h.script_name) if is_instance_valid(h) else "-"


func _maus(p: Vector2) -> void:
	var ev := InputEventMouseMotion.new()
	var w: Vector2 = root.get_final_transform() * p
	ev.position = w
	ev.global_position = w
	root.push_input(ev)


func _raum_id() -> String:
	var r = root.get_node("R").current
	return r.raum_id() if is_instance_valid(r) and r.has_method("raum_id") else ""


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true
