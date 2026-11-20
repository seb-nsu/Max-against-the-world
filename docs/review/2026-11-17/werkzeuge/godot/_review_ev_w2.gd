extends SceneTree
## Review 17.11. (Evidence Collector): Bildbelege für Welt-2-Funde im echten Spiel (Testmodus aus,
## Oberfläche sichtbar). Wird nicht committet.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_ev_w2.gd -- AUSGABE SZENARIO
## SZENARIO: nd04 | nd12 | gd01 | nd01

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_ev/"
var szenario := "nd04"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var args := OS.get_cmdline_user_args()
	if args.size() > 0:
		aus = args[0].trim_suffix("/") + "/"
	if args.size() > 1:
		szenario = args[1]
	DirAccess.make_dir_recursive_absolute(aus)
	var S = _s()
	S.testmodus = true
	CQSaveLoad.ordner = "user://test_saves/review_ev_%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return _e().in_room, 15.0)
	for sn in ["Notizbuch", "Thunfischdose", "Kochloeffel", "Socke"]:
		await S.geben(sn)
	S.welt_beginnen("welt-2")
	await _warte_raum("nil_delta")
	await _warte_bis(func(): return "W2_NIL_PIX_0120" in S.protokoll, 15.0)
	await _warte_bis(func(): return S.in_szene == 0, 15.0)
	match szenario:
		"nd04":
			await _nd04()
		"nd12":
			await _nd12()
		"gd01":
			await _gd01()
		"nd01":
			await _nd01()
	print("EV FERTIG ", szenario)
	quit(0)


func _echt() -> void:
	_s().testmodus = false
	_e().settings.auto_continue_text = false


## ND-04: falsche Kachelfolge (Auge ×4) im Thronsaal, Schreiber liest „[Satz]“ vor.
func _nd04() -> void:
	await _geh("thronsaal_ramses")
	_echt()
	_s().vorgabe_auswahl = [6, 6, 6, 6]
	_s().regeln().botschaft_legen()
	await _warte_bis(func(): return "W2_HIER_SCH_0120" in _s().protokoll, 10.0)
	await _pause(7.0)
	await _bild("ND-04_satz_platzhalter")
	print("EV ND04 protokoll-ende=", _s().protokoll.slice(-3))


## ND-12: Hermes im Startbüro, einzige Option wählen, danach Menü ohne Optionen.
func _nd12() -> void:
	_z().setze("W2_HERMES_IM_BUERO")
	await _faehre("faehrsteg_olympia")
	await _geh("agora")
	await _geh("startbuero")
	print("EV ND12 Hermes im Raum=", _r().has_character("Hermes"))
	_s().testmodus = false
	_e().settings.auto_continue_text = true
	# Gegenprobe: Bodenklick vor dem Gespräch muss Max bewegen
	var k0: Vector2 = root.get_node("C").get_character("Max").position
	await _klick(Vector2(470, 300))
	await _pause(3.0)
	print("EV ND12 Gegenprobe Bodenklick vor Gespraech: Max vorher=", k0, " nachher=", root.get_node("C").get_character("Max").position)
	var d = root.get_node("D").get_instance("Hermes")
	d.start()
	await _pause(2.0)
	await _bild("ND-12_hermes_menue_vorher")
	var opt = d.get_option("0650")
	root.get_node("D").option_selected.emit(opt)
	await _warte_bis(func(): return "W2_BUER_HER_0650" in _s().protokoll, 15.0)
	await _pause(8.0)
	var sicht := []
	for o in d.options:
		if o.visible:
			sicht.append(o.id)
	print("EV ND12 nach 0650: sichtbar=", sicht, " dialog aktiv=", root.get_node("D").current_dialog == d)
	await _bild("ND-12_hermes_menue_leer")
	await _pause(3.0)
	await _bild("ND-12_hermes_menue_leer_3s_spaeter")
	# Bodenklick: läuft Max los, oder hängt das Spiel im leeren Menü?
	var vorher: Vector2 = root.get_node("C").get_character("Max").position
	await _klick(Vector2(250, 320))
	await _pause(3.0)
	print("EV ND12 Bodenklick: Max vorher=", vorher, " nachher=", root.get_node("C").get_character("Max").position,
		" dialog aktiv=", root.get_node("D").current_dialog == d)
	var esc := InputEventKey.new()
	esc.keycode = KEY_ESCAPE
	esc.pressed = true
	root.push_input(esc)
	await _pause(2.0)
	print("EV ND12 nach Esc: dialog aktiv=", root.get_node("D").current_dialog == d)
	await _bild("ND-12_hermes_nach_klick_und_esc")


func _klick(bild: Vector2) -> void:
	var p: Vector2 = root.get_final_transform() * bild
	var mv := InputEventMouseMotion.new()
	mv.position = p
	mv.global_position = p
	root.push_input(mv)
	await physics_frame
	await process_frame
	for gedrueckt in [true, false]:
		var ev := InputEventMouseButton.new()
		ev.button_index = MOUSE_BUTTON_LEFT
		ev.pressed = gedrueckt
		ev.position = p
		ev.global_position = p
		root.push_input(ev)
		await physics_frame
		await process_frame


## GD-01: nach R1 (Fähre bezahlt), nur Nil-Delta besucht, Klick auf die Pfote.
func _gd01() -> void:
	var S = _s()
	S.vorgabe_auswahl = [2]
	await S.regel("pixel", "faehre")
	await _warte_bis(func(): return S.in_szene == 0, 15.0)
	print("EV GD01 R1=", _z().geloest("R1"), " offen=", _z().offene_schritte())
	_echt()
	root.get_node("Hinweise").pfote_geklickt()
	await _warte_bis(func(): return "P0_HINT_PIX_0010" in S.protokoll, 10.0)
	await _pause(6.0)
	await _bild("GD-01_pfote_fernseher")


## ND-01/ND-02: längste Sprecherblase (203 Zeichen) und längste NAR-Zeile (211 Zeichen) im Stadion.
func _nd01() -> void:
	await _faehre("faehrsteg_olympia")
	await _geh("agora")
	await _geh("stadion")
	_echt()
	_s().sagen("MAX", "W2_RING_MAX_0030")
	await _pause(10.0)
	await _bild("ND-01_blase_203_zeichen")
	# Blase wegklicken
	await _klick(Vector2(320, 300))
	await _pause(3.0)
	_s().sagen("PIX", "W2_HINT_PIX_0331")
	await _pause(9.0)
	await _bild("ND-01_blase_pixel_172_zeichen")
	await _klick(Vector2(320, 300))
	await _pause(2.0)
	_s().sagen("NAR", "W2_FINA_NAR_0120")
	await _pause(2.5)
	await _bild("ND-02_nar_211_zeichen")


func _bild(name: String) -> void:
	for i in 3:
		await process_frame
	var img := root.get_texture().get_image()
	img.convert(Image.FORMAT_RGBA8)
	img.resize(640, 360, Image.INTERPOLATE_NEAREST)
	img.save_png(aus + name + ".png")
	print("EV BILD ", name)


func _pause(s: float) -> void:
	await create_timer(s).timeout


func _geh(rid: String) -> void:
	_s().herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_raum(rid)


func _faehre(ziel: String) -> void:
	_s().regeln().fahren(ziel)
	await _warte_raum(ziel)


func _warte_raum(rid: String) -> void:
	var ok := await _warte_bis(func():
		var r = _r()
		return r != null and r.has_method("raum_id") and r.raum_id() == rid and _e().in_room and r.is_current, 20.0)
	if not ok:
		print("EV WARNUNG Raum ", rid, " nicht erreicht")
	await _warte_bis(func(): return _s().in_szene == 0, 30.0)
	for i in 10:
		await process_frame


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true


func _s():
	return root.get_node("Spiel")


func _z():
	return root.get_node("Zustand")


func _e():
	return root.get_node("E")


func _r():
	return root.get_node("R").current
