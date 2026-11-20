extends SceneTree
## Review 20.11. (Evidence Collector, nicht committen): kritische Funde und Sackgassen in Welt 3
## im laufenden Spiel nachstellen. Klicks gehen als echte Maus-Ereignisse durch das Fenster
## (push_input), Testmodus nur für den Aufbau, danach aus.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_ev_w3_belege.gd -- AUSGABE SZENARIO
## SZENARIO: nd01 | sackgasse | tuer | apo | mutti

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_ev3/"
var szenario := "nd01"
var log_zeilen: Array = []


func _initialize() -> void:
	_lauf.call_deferred()


func _p(t: String) -> void:
	print("EV ", t)
	log_zeilen.append(t)


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
	CQSaveLoad.ordner = "user://test_saves/review_ev3_%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return _e().in_room, 15.0)
	for sn in ["Notizbuch", "Thunfischdose", "Kochloeffel"]:
		await S.geben(sn)
	S.welt_beginnen("welt-3")
	await _warte_raum("unterstadt_strasse")
	await _warte_bis(func(): return "W3_ANK_PIX_0110" in S.protokoll, 15.0)
	await _warte_bis(func(): return S.in_szene == 0, 15.0)
	match szenario:
		"nd01":
			await _nd01()
		"sackgasse":
			await _sackgasse()
		"tuer":
			await _tuer()
		"apo":
			await _apo()
		"mutti":
			await _mutti()
	var fa := FileAccess.open(aus + "ev_" + szenario + "_log.txt", FileAccess.WRITE)
	fa.store_string("\n".join(log_zeilen) + "\n")
	fa.close()
	print("EV FERTIG ", szenario)
	quit(0)


func _echt() -> void:
	_s().testmodus = false
	_e().settings.auto_continue_text = true


## ND-01: Mensch-Test über das echte Gesprächsmenü, falsche Antwort, danach erneut ansprechen.
func _nd01() -> void:
	var S = _s()
	var Z = _z()
	_echt()
	var d = root.get_node("D").get_instance("Deckert")
	var deck = root.get_node("C").get_character("Deckert")
	_p("vorher: 0090 sichtbar=%s erschoepft=%s" % [d.option_sichtbar("0090"), d.erschoepft()])
	# Deckert per Linksklick ansprechen (echter Weg: Figur.on_click -> reden -> Menü)
	await _klick_welt(deck.global_position + Vector2(0, -40), false)
	await _warte_bis(func(): return root.get_node("D").current_dialog == d, 30.0)
	await _pause(1.0)
	await _bild("ND-01_deckert_menue_erstes_mal")
	_p("Menü 1: sichtbar=%s" % [_sichtbar(d)])
	# Option 0090 so wählen, wie das Menü es tut; im Test „logisch“ (Index 0) = falsch
	S.vorgabe_auswahl = [0]
	root.get_node("D").option_selected.emit(d.get_option("0090"))
	await _warte_bis(func(): return S.in_szene == 0 and not "W3_TEST_DEC_0110" in [] , 2.0)
	await _pause(25.0)
	_p("nach Durchfallen: R1b=%s 0090 sichtbar=%s Dialog aktiv=%s sichtbar=%s" % [Z.geloest("R1b"),
		d.option_sichtbar("0090"), root.get_node("D").current_dialog == d, _sichtbar(d)])
	await _bild("ND-01_deckert_menue_nach_durchfallen")
	# Gespräch verlassen, drei Beobachtungen per Rechtsklick, dann erneut ansprechen
	if root.get_node("D").current_dialog == d:
		d.stop()
	await _pause(2.0)
	for fn in ["FrauRegenschirm", "StrassenmusikerW3", "WeinenderMann"]:
		var f = root.get_node("C").get_character(fn)
		if f == null:
			_p("Figur %s fehlt" % fn)
			continue
		await _klick_welt(f.global_position + Vector2(0, -40), true)
		await _pause(6.0)
	_p("Beobachtungen: R1a=%s" % Z.geloest("R1a"))
	await _klick_welt(deck.global_position + Vector2(0, -40), false)
	await _pause(8.0)
	_p("zweites Ansprechen: Dialog aktiv=%s sichtbar=%s 0090 sichtbar=%s erschoepft=%s letzte Zeilen=%s" % [
		root.get_node("D").current_dialog == d, _sichtbar(d), d.option_sichtbar("0090"), d.erschoepft(),
		S.protokoll.slice(-4)])
	await _bild("ND-01_deckert_menue_mit_beobachtungen")
	# Plauderoptionen aufbrauchen
	for id in ["0040", "0060"]:
		if d.option_sichtbar(id):
			root.get_node("D").option_selected.emit(d.get_option(id))
			await _pause(12.0)
	if root.get_node("D").current_dialog == d:
		d.stop()
	await _pause(2.0)
	S.protokoll.clear()
	await _klick_welt(deck.global_position + Vector2(0, -40), false)
	await _pause(8.0)
	_p("drittes Ansprechen: Dialog aktiv=%s erschoepft=%s Zeilen=%s R1b=%s" % [
		root.get_node("D").current_dialog == d, d.erschoepft(), S.protokoll, Z.geloest("R1b")])
	await _bild("ND-01_deckert_nur_abschied")
	# Gibt es einen anderen Weg in die Apothekengasse?
	S.protokoll.clear()
	var r = _r()
	for h in r.get_hotspots():
		if str(h.script_name) == "AusgangApothekengasse":
			await _klick_welt(h.global_position, false)
	await _pause(8.0)
	_p("Ausgang Apothekengasse ohne R1b: Raum=%s Zeilen=%s" % [_r().raum_id(), S.protokoll])


func _sichtbar(d) -> Array:
	var a := []
	for o in d.options:
		if o.visible:
			a.append(o.id)
	return a


## GS-01 / GD-04 / R13: Max sitzt im Büroturm fest (R5 gelöst, R6/R7/R13 offen); alles, was Pixel
## per Klick tun kann.
func _sackgasse() -> void:
	var S = _s()
	var Z = _z()
	var C = root.get_node("C")
	for r in ["R1a", "R1b", "R2", "R3a", "R3b", "R4", "R5"]:
		Z.loese(r)
	Z.setze("W3_CODE_SICHT")
	Z.setze_wert("W3_EBENE", "simulation")
	Z.setze_wert("W3_MAX_RAUM", "buero_50")
	Z.setze_wert("W3_PIXEL_RAUM", "widerstandsbasis")
	C.player = C.get_character("Max")
	await _geh("buero_50")
	_echt()
	await _pause(2.0)
	# Max versucht hinauszugehen
	S.protokoll.clear()
	for h in _r().get_hotspots():
		if str(h.script_name) == "AusgangStadtstrasse":
			await _klick_welt(Vector2(46, 200), false)
	await _pause(9.0)
	_p("Max Ausgang Büro: Raum=%s Zeilen=%s" % [_r().raum_id(), S.protokoll])
	await _bild("GS-01_buero_ausgang_gesperrt")
	# Figurenwechsel wie per Taste
	S.figur_wechseln()
	await _warte_raum("widerstandsbasis")
	await _pause(2.0)
	_p("nach Wechsel: Raum=%s Spieler=%s ist_pixel=%s" % [_r().raum_id(), C.player.script_name, S.ist_pixel()])
	var ziele := [["KallesTasse", Vector2(1054, 222), "R13"], ["PatchPanel", Vector2(478, 150), "R7b"],
		["Stromkasten", Vector2(690, 186), "W3_NACHT"], ["Fenster", Vector2(300, 40), "W3_SCHNEE"],
		["MaxKapsel", Vector2(168, 240), "Ebene"], ["Lueftungsschacht", Vector2(1182, 314), "Raum"]]
	for z in ziele:
		if _r().raum_id() != "widerstandsbasis":
			_p("nicht mehr in der Basis: %s" % _r().raum_id())
			break
		C.player.walk_to(Vector2(z[1].x, 330))
		await _pause(9.0)
		S.protokoll.clear()
		var hov := await _klick_welt(z[1], false)
		await _pause(10.0)
		_p("Pixel klickt %s (unter Maus: %s): Zeilen=%s | R13=%s R7b=%s NACHT=%s SCHNEE=%s Ebene=%s Raum=%s" % [z[0], hov,
			S.protokoll, Z.geloest("R13"), Z.geloest("R7b"), Z.ist("W3_NACHT"), Z.ist("W3_SCHNEE"),
			Z.wert("W3_EBENE"), _r().raum_id()])
		if z[0] in ["PatchPanel", "MaxKapsel"]:
			await _bild("GS-01_pixel_klickt_" + z[0])
		# Absicherung: derselbe Hotspot über seinen Klickweg (on_click), falls die Maus daneben lag
		if _r().raum_id() == "widerstandsbasis":
			for h in _r().get_hotspots():
				if str(h.script_name) == z[0]:
					S.protokoll.clear()
					await h.on_click()
					await _pause(3.0)
					_p("  %s per on_click(): Zeilen=%s | R13=%s R7b=%s NACHT=%s SCHNEE=%s Ebene=%s Raum=%s" % [z[0],
						S.protokoll, Z.geloest("R13"), Z.geloest("R7b"), Z.ist("W3_NACHT"), Z.ist("W3_SCHNEE"),
						Z.wert("W3_EBENE"), _r().raum_id()])
	# Gegenprobe: derselbe Schritt als direkter Regelaufruf (wie welt_3_anspiel.gd)
	S.protokoll.clear()
	S.testmodus = true
	await S.regel("benutzen", "max_kapsel")
	await _pause(2.0)
	_p("Gegenprobe Regelaufruf benutzen max_kapsel: Zeilen=%s Ebene=%s Raum=%s" % [S.protokoll.slice(0, 3),
		Z.wert("W3_EBENE"), _r().raum_id()])


## GS-02: Glastür ansehen (zweimal) auf der Glasfläche gegen den 14×33-Streifen der Figur „Tür“.
func _tuer() -> void:
	var S = _s()
	var Z = _z()
	for r in ["R1a", "R1b", "R2", "R3a", "R3b"]:
		Z.loese(r)
	Z.setze_wert("W3_EBENE", "simulation")
	Z.setze_wert("W3_MAX_RAUM", "stadtstrasse")
	root.get_node("C").player = root.get_node("C").get_character("Max")
	await _geh("stadtstrasse")
	_echt()
	root.get_node("C").player.walk_to(Vector2(1100, 330))
	await _pause(10.0)
	for punkt in [Vector2(1125, 230), Vector2(1170, 230), Vector2(1148, 210), Vector2(1148, 283), Vector2(1197, 250)]:
		_p("unter der Maus bei %s: %s" % [punkt, await _zeige(punkt)])
	for i in 2:
		S.protokoll.clear()
		var h := await _klick_welt(Vector2(1125, 230), true)
		await _pause(9.0)
		_p("Rechtsklick Glasfläche %d (%s): Zeilen=%s CODE_SICHT=%s" % [i + 1, h, S.protokoll, Z.ist("W3_CODE_SICHT")])
	await _zeige(Vector2(1125, 230))
	await _bild("GS-02_glastuer_hover_ausgang")
	await _zeige(Vector2(1148, 283))
	await _bild("GS-02_glastuer_hover_tuer_streifen")
	for i in 2:
		S.protokoll.clear()
		var h := await _klick_welt(Vector2(1148, 283), true)
		await _pause(12.0)
		_p("Rechtsklick Streifen %d (%s): Zeilen=%s CODE_SICHT=%s" % [i + 1, h, S.protokoll, Z.ist("W3_CODE_SICHT")])


## LD-01/TA-01/GS-04 und GD-01: Apothekengasse, Max am Automaten; Pfote-Weg „als Pixel vorbeigehen“.
func _apo() -> void:
	var S = _s()
	var Z = _z()
	var C = root.get_node("C")
	for r in ["R1a", "R1b", "R2"]:
		Z.loese(r)
	Z.setze("W3_SYMPTOM_BEKANNT")
	await _geh("apothekengasse")
	_echt()
	_p("Raumbreite=%s Kamera-Grenze rechts=%s" % [_r().width, _r().get("width")])
	await _klick_welt(Vector2(600, 150), false)  # Automat benutzen (sichtbarer Teil)
	await _pause(4.0)
	await _bild("LD-01_max_am_automaten")
	_p("Max am Automaten: pos=%s Kamera=%s" % [C.player.global_position, root.get_camera_2d().get_screen_center_position() if root.get_camera_2d() else "?"])
	S.vorgabe_auswahl = [3]  # „Doch nicht“ / letzte Option, Menü schließen
	await _pause(10.0)
	# Pfote fragen
	var H = root.get_node("Hinweise")
	_p("Pfote: Schritt=%s" % [H.schritt_waehlen() if H.has_method("schritt_waehlen") else "?"])
	# Weg laut Stufe 2/3: zu Pixel wechseln, zweimal am Automaten vorbei/benutzen
	S.protokoll.clear()
	S.figur_wechseln()
	await _pause(4.0)
	_p("Spieler=%s" % C.player.script_name)
	for i in 2:
		C.player.walk_to(Vector2(200, 322))
		await _pause(4.0)
		C.player.walk_to(Vector2(600, 322))
		await _pause(4.0)
		var h := await _klick_welt(Vector2(600, 150), false)
		await _pause(8.0)
		_p("Pixel benutzt Automat %d (%s): PIXEL_EINMAL=%s PIXEL_DOPPELT=%s" % [i + 1, h, Z.ist("W3_PIXEL_EINMAL"), Z.ist("W3_PIXEL_DOPPELT")])
	_p("Pixel-Zeilen: %s" % [S.protokoll])
	S.figur_wechseln()
	await _pause(4.0)
	S.protokoll.clear()
	# Max benutzt Automat und wählt „Déjà-vu“ (Index 2 bei bekanntem Symptom)
	S.vorgabe_auswahl = [2]
	await _klick_welt(Vector2(600, 150), false)
	await _pause(14.0)
	_p("Max wählt Déjà-vu: Zeilen=%s R3a=%s" % [S.protokoll, Z.geloest("R3a")])
	await _bild("GD-01_dejavu_ohne_befund")


## AN-01: Paradoxon im Kern, Bild während W3_KERN_NAR_0210 und im Endzustand.
func _mutti() -> void:
	var S = _s()
	var Z = _z()
	for r in ["R1a", "R1b", "R2", "R3a", "R3b", "R4", "R5", "R6a", "R6b", "R7a", "R7b", "R13", "R12", "R8", "R9a", "R9b", "R9c", "R9d"]:
		Z.loese(r)
	for s in ["W3_REGEL_1", "W3_REGEL_2", "W3_REGEL_3", "W3_CODE_SICHT"]:
		Z.setze(s)
	Z.setze_wert("W3_EBENE", "labor")
	Z.setze_wert("W3_MAX_RAUM", "kern")
	root.get_node("C").player = root.get_node("C").get_character("Max")
	await _geh("kern")
	_echt()
	_e().settings.auto_continue_text = true
	S.vorgabe_auswahl = [0, 1, 2]
	var m = root.get_node("C").get_character("Mutti")
	S.regel("benutzen", "mutti")
	var gesehen := {}
	var ende := Time.get_ticks_msec() + 120000
	while Time.get_ticks_msec() < ende and not Z.geloest("R10"):
		await process_frame
		var letzte: String = S.protokoll[-1] if S.protokoll.size() > 0 else ""
		if letzte in ["W3_KERN_MUT_0200", "W3_KERN_NAR_0210", "W3_KERN_PIX_0220"] and not gesehen.has(letzte):
			gesehen[letzte] = true
			await _pause(0.8)
			_p("%s: Mutti anim=%s" % [letzte, _anim(m)])
			await _bild("AN-01_kern_" + letzte)
	await _pause(6.0)
	_p("R10=%s, Mutti sichtbar=%s anim=%s" % [Z.geloest("R10"), m.visible if m else "?", _anim(m)])
	await _bild("AN-01_kern_nach_R10")


func _anim(m) -> String:
	if m == null:
		return "?"
	for n in m.find_children("*", "AnimationPlayer", true, false):
		return str(n.current_animation)
	for n in m.find_children("*", "AnimatedSprite2D", true, false):
		return str(n.animation)
	return "?"


## Maus an Weltpunkt bewegen; liefert, was Popochiu als hovered führt.
func _zeige(welt: Vector2) -> String:
	var p: Vector2 = root.get_final_transform() * (root.get_canvas_transform() * welt)
	var mv := InputEventMouseMotion.new()
	mv.position = p
	mv.global_position = p
	root.push_input(mv)
	for i in 4:
		await physics_frame
		await process_frame
	var h = _e().hovered if "hovered" in _e() else null
	return str(h.script_name) if is_instance_valid(h) else "-"


func _klick_welt(welt: Vector2, rechts: bool) -> String:
	var vp: Vector2 = root.get_canvas_transform() * welt
	if vp.x < 20 or vp.x > 620:
		var pl = root.get_node("C").player
		pl.walk_to(Vector2(welt.x + (60 if welt.x < 640 else -60), pl.global_position.y))
		await _pause(9.0)
	var hov := await _zeige(welt)
	var p: Vector2 = root.get_final_transform() * (root.get_canvas_transform() * welt)
	for gedrueckt in [true, false]:
		var ev := InputEventMouseButton.new()
		ev.button_index = MOUSE_BUTTON_RIGHT if rechts else MOUSE_BUTTON_LEFT
		ev.pressed = gedrueckt
		ev.position = p
		ev.global_position = p
		root.push_input(ev)
		await physics_frame
		await process_frame
	return hov


func _bild(name: String) -> void:
	for i in 3:
		await process_frame
	var img := root.get_texture().get_image()
	img.convert(Image.FORMAT_RGBA8)
	img.resize(640, 360, Image.INTERPOLATE_NEAREST)
	img.save_png(aus + name + ".png")
	_p("BILD " + name)


func _pause(s: float) -> void:
	await create_timer(s).timeout


func _geh(rid: String) -> void:
	_s().herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_raum(rid)


func _warte_raum(rid: String) -> void:
	var ok := await _warte_bis(func():
		var r = _r()
		return r != null and r.has_method("raum_id") and r.raum_id() == rid and _e().in_room and r.is_current, 20.0)
	if not ok:
		_p("WARNUNG Raum " + rid + " nicht erreicht")
	await _warte_bis(func(): return _s().in_szene == 0, 60.0)
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
