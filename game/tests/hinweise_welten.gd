extends SceneTree
## Headless-Test der Hilfe-Pfote über zwei Welten, bedient wie im Spiel: Klick auf die Pfote in
## der Leiste. Die Rätselnummern wiederholen sich von Welt zu Welt (R1 gibt es in Welt 2 und in
## Welt 4). Wer in einer Welt alle drei Stufen geholt hat, muss in der nächsten wieder bei
## Stufe 1 anfangen und darf nicht sofort die Komplettlösung hören.
##
## Aufruf: godot --headless --path game -s res://tests/hinweise_welten.gd

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"

var fehler: Array[String] = []
var _pruefungen := 0


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	_spiel().testmodus = true
	CQSaveLoad.ordner = "user://test_saves/%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return _e().in_room, 15.0)
	await _durchlauf()
	print("")
	print("Prüfungen: %d, Fehler: %d" % [_pruefungen, fehler.size()])
	for f in fehler:
		print("  FEHLER: ", f)
	if is_instance_valid(current_scene):
		current_scene.queue_free()
	for i in 3:
		await process_frame
	quit(0 if fehler.is_empty() else 1)


func _durchlauf() -> void:
	var S = _spiel()
	var Z = _zustand()
	var H = root.get_node("Hinweise")
	for sn in ["Notizbuch", "Thunfischdose", "Kochloeffel"]:
		await S.geben(sn)

	# Welt 2, Ankunft: R1 (Fähre) ist offen. Drei Klicks auf die Pfote, dazwischen vergeht Zeit.
	S.welt_beginnen("welt-2")
	await _warte_auf_raum("nil_delta")
	await _warte_bis(func(): return _gesagt("W2_NIL_PIX_0120"), 10.0)
	_pruefe(H.schritt_waehlen() == "R1", "Welt 2: R1 ist der offene Schritt")
	await _pfote()
	_pruefe(_gesagt("W2_HINT_PIX_0110") and H.stufe("R1") == 1, "Welt 2, erster Klick: Stufe 1")
	Z.spielzeit += 100.0
	await _pfote()
	Z.spielzeit += 100.0
	await _pfote()
	_pruefe(_gesagt("W2_HINT_PIX_0130") and H.stufe("R1") == 3, "Welt 2, dritter Klick: Stufe 3")
	_pruefe(int(Z.stufe3_zaehler.get("welt-2", 0)) == 1, "Welt 2: eine Stufe 3 gezählt")

	# Welt 4, Ankunft: wieder ein R1 (Testbild). Der erste Klick gibt Stufe 1, nicht die Lösung.
	S.welt_beginnen("welt-4")
	await _warte_auf_raum("testbild")
	await _warte_bis(func(): return _gesagt("W4_TEST_PIX_0140"), 10.0)
	_pruefe(H.schritt_waehlen() == "R1", "Welt 4: R1 ist der offene Schritt")
	_pruefe(H.stufe("R1") == 0 and H.naechste_stufe_bereit("R1"), "Welt 4: R1 beginnt bei Stufe 0, die Pfote leuchtet")
	await _pfote()
	_pruefe(_gesagt("W4_HINT_PIX_0010"), "Welt 4, erster Klick: Stufe 1 (W4_HINT_PIX_0010)")
	_pruefe(not _gesagt("W4_HINT_PIX_0030"), "Welt 4, erster Klick: nicht die Komplettlösung")
	_pruefe(H.stufe("R1") == 1 and H.stufe("R1", "welt-2") == 3, "Stufen je Welt getrennt")
	_pruefe(int(Z.stufe3_zaehler.get("welt-4", 0)) == 0, "Welt 4: keine Stufe 3 gezählt")

	# Speichern und Laden behalten die Stufen je Welt; alte Schlüssel ohne Abschnitt verfallen.
	var stand: Dictionary = Z.speichern()
	stand.hinweis_stufe["R1"] = 3
	Z.laden(stand)
	_pruefe(H.stufe("R1") == 1 and H.stufe("R1", "welt-2") == 3 and not Z.hinweis_stufe.has("R1"),
		"Laden: Stufen je Welt bleiben, alter Schlüssel „R1“ verfällt")


## Klick auf die Hilfe-Pfote in der Leiste; wartet, bis Pixel ausgeredet hat.
func _pfote() -> void:
	var S = _spiel()
	await _warte_bis(func(): return S.in_szene == 0 and not _e().playing_queue, 10.0)
	var vorher: int = S.protokoll.size()
	S.hud._pfote.pressed.emit()
	await _warte_bis(func(): return S.protokoll.size() > vorher and S.in_szene == 0 and not _e().playing_queue, 5.0)
	for i in 3:
		await process_frame


#region Hilfen #####################################################################################
func _pruefe(bedingung: bool, text: String) -> void:
	_pruefungen += 1
	if bedingung:
		print("  ok    ", text)
	else:
		print("  FEHLT ", text)
		fehler.append(text)


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true


func _warte_auf_raum(rid: String) -> void:
	var ok := await _warte_bis(func(): return _raum_id() == rid and _e().in_room and _raum().is_current, 15.0)
	_pruefe(ok, "Raum %s erreicht" % rid)
	for i in 3:
		await process_frame


func _gesagt(b: String) -> bool:
	return b in _spiel().protokoll


func _sn(id: String) -> String:
	return root.get_node("Bauplan").gegenstand_script_name(id)


func _hat(id: String) -> bool:
	return _i().is_item_in_inventory(_sn(id))


func _spiel():
	return root.get_node("Spiel")


func _zustand():
	return root.get_node("Zustand")


func _e():
	return root.get_node("E")


func C():
	return root.get_node("C")


func _i():
	return root.get_node("I")


func _raum() -> PopochiuRoom:
	return root.get_node("R").current


func _raum_id() -> String:
	var r := _raum()
	return r.raum_id() if is_instance_valid(r) and r.has_method("raum_id") else ""


func _hotspot(id: String) -> PopochiuHotspot:
	for h in _raum().get_hotspots():
		if h.has_method("objekt_id") and h.objekt_id() == id:
			return h
	return _raum().get_hotspot(id.to_pascal_case())
#endregion
