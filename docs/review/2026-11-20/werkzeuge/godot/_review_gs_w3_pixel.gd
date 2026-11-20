extends SceneTree
## Review 20.11. (GS, nicht committen): Pixel als Spielfigur in der Basis, während Max in der
## Simulation liegt (W3_EBENE = simulation). Klickt die Pixel-Rätselobjekte so an, wie es das Spiel tut
## (Hotspot.on_click()), und vergleicht mit dem direkten Regelaufruf S.regel("benutzen", id), den
## welt_3_anspiel.gd benutzt.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_gs_w3_pixel.gd -- AUSGABE

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_gs/"
var S
var Z
var log_zeilen: Array = []


func _initialize() -> void:
	_lauf.call_deferred()


func _p(t: String) -> void:
	print(t)
	log_zeilen.append(t)


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		aus = a.trim_suffix("/") + "/"
	S = root.get_node("Spiel")
	Z = root.get_node("Zustand")
	var C = root.get_node("C")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	S.welt_beginnen("welt-3")
	await _warte_raum("unterstadt_strasse")
	for weg in ["klick", "regel"]:
		_p("== Weg: " + weg)
		Z.loese("R7a")
		Z.setze_wert("W3_EBENE", "simulation")
		Z.setze_wert("W3_MAX_RAUM", "buero_50")
		C.player = C.get_character("Max")
		await _geh("widerstandsbasis")
		C.player = C.get_character("Pixel")
		_p("ist_pixel=%s getrennt=%s" % [S.ist_pixel(), S.regeln().getrennt()])
		for sn in ["Stromkasten", "Fenster", "PatchPanel", "Lueftungsschacht", "MaxKapsel"]:
			var raum = root.get_node("R").current
			if raum.raum_id() != "widerstandsbasis":
				Z.setze_wert("W3_EBENE", "simulation")
				C.player = C.get_character("Max")
				await _geh("widerstandsbasis")
				C.player = C.get_character("Pixel")
				raum = root.get_node("R").current
			var h = null
			for x in raum.get_hotspots():
				if str(x.script_name) == sn:
					h = x
			if h == null or not h.visible:
				_p("%s: nicht da/unsichtbar" % sn)
				continue
			S.protokoll.clear()
			S.vorgabe_auswahl = [0, 1, 2, 3]
			var vorher := "NACHT=%s SCHNEE=%s R7b=%s" % [Z.ist("W3_NACHT"), Z.ist("W3_SCHNEE"), Z.geloest("R7b")]
			var fertig := [false]
			var f := func():
				if weg == "klick":
					await h.on_click()
				else:
					await S.regel("benutzen", h.objekt_id())
				fertig[0] = true
			f.call()
			await _warte_bis(func(): return fertig[0], 8.0)
			await create_timer(0.5).timeout
			var nach := "NACHT=%s SCHNEE=%s R7b=%s" % [Z.ist("W3_NACHT"), Z.ist("W3_SCHNEE"), Z.geloest("R7b")]
			_p("%s (%s): Zeilen=%s | vorher %s | nachher %s | Raum jetzt %s | Ebene %s" % [sn, weg, ",".join(S.protokoll),
				vorher, nach, root.get_node("R").current.raum_id(), Z.wert("W3_EBENE")])
		# Kühlung: Eimer
		Z.setze_wert("W3_EBENE", "simulation")
		C.player = C.get_character("Max")
		await _geh("kuehlung")
		C.player = C.get_character("Pixel")
		var raum2 = root.get_node("R").current
		for x in raum2.get_hotspots():
			if str(x.script_name) == "Wassereimer":
				S.protokoll.clear()
				if weg == "klick":
					await x.on_click()
				else:
					await S.regel("benutzen", "wassereimer")
				_p("Wassereimer (%s): Zeilen=%s | W3_EIMER_GEKIPPT=%s" % [weg, ",".join(S.protokoll), Z.ist("W3_EIMER_GEKIPPT")])
		Z.setze("W3_EIMER_GEKIPPT", false)
		Z.setze("W3_NACHT", false)
		Z.setze("W3_SCHNEE", false)
		Z.setze("W3_SCHACHT", false)
		Z.setze("R7b", false)
		if Z.has_method("loese_nicht"):
			Z.loese_nicht("R7b")
	var fa := FileAccess.open(aus + "pixel_als_spielfigur_basis.txt", FileAccess.WRITE)
	fa.store_string("\n".join(log_zeilen))
	fa.close()
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
