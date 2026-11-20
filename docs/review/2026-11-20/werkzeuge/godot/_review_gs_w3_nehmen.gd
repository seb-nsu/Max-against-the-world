extends SceneTree
## Review 20.11. (GS, nicht committen): Gegenstände, die im Raum liegen, wirklich anklicken (on_click)
## und prüfen, ob sie vor ihrem Rätsel im Inventar landen (Büro 50: Sonnenbrille, Akte; Kern: Zelle).
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_gs_w3_nehmen.gd -- AUSGABE

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_gs/"
var S
var Z
var zeilen: Array = []


func _initialize() -> void:
	_lauf.call_deferred()


func _p(t: String) -> void:
	print(t)
	zeilen.append(t)


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		aus = a.trim_suffix("/") + "/"
	S = root.get_node("Spiel")
	Z = root.get_node("Zustand")
	var I = root.get_node("I")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	S.welt_beginnen("welt-3")
	await _warte_raum("unterstadt_strasse")
	for r in ["R1a", "R1b", "R2", "R3a", "R3b", "R4", "R5"]:
		Z.loese(r)
	Z.setze_wert("W3_EBENE", "simulation")
	await _geh("buero_50")
	for sn in ["Sonnenbrille", "SchmidtsAkte"]:
		var p = _prop(sn)
		if p == null:
			_p("%s: kein Prop" % sn)
			continue
		_p("%s vorher: sichtbar=%s klickbar=%s, R6a=%s R6b=%s" % [sn, p.visible, p.clickable, Z.geloest("R6a"), Z.geloest("R6b")])
		S.protokoll.clear()
		await p.on_click()
		await create_timer(0.5).timeout
		var iid: String = root.get_node("Bauplan").gegenstand_script_name({"Sonnenbrille": "sonnenbrille", "SchmidtsAkte": "schmidts_akte"}[sn])
		_p("%s nach Klick: Zeilen=%s, im Inventar=%s, Prop noch sichtbar=%s, R6b=%s" % [sn, ",".join(S.protokoll),
			I.is_item_in_inventory(iid), is_instance_valid(p) and p.visible, Z.geloest("R6b")])
	# Kern: Zelle vor dem Abkühlen
	for r in ["R6a", "R6b", "R7a", "R7b", "R8", "R9a", "R9b", "R9c", "R9d", "R10"]:
		Z.loese(r)
	await _geh("kern")
	var z = _prop("Energiezelle")
	if z:
		S.protokoll.clear()
		S.vorgabe_auswahl = [1]
		await z.on_click()
		await create_timer(0.5).timeout
		_p("Energiezelle (heiß, R10 gelöst) Klick: Zeilen=%s, im Inventar=%s, W3_ZELLE_KALT=%s" % [",".join(S.protokoll),
			I.is_item_in_inventory(root.get_node("Bauplan").gegenstand_script_name("energiezelle")), Z.ist("W3_ZELLE_KALT")])
	var f := FileAccess.open(aus + "nehmen_vor_dem_raetsel.txt", FileAccess.WRITE)
	f.store_string("\n".join(zeilen))
	f.close()
	print("FERTIG")
	quit(0)


func _prop(sn: String):
	for p in root.get_node("R").current.get_props():
		if str(p.script_name) == sn:
			return p
	return null


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
