extends SceneTree
## Headless-Test der Ansehen-Zeilen mit Zustand, bedient wie im Spiel: Rechtsklick auf das Objekt.
## Das Skript nennt den Zustand in Worten („Ansehen: Nase, vor dem Finaltag“). Vor dem Finaltag
## darf Max die Zeile danach nicht sagen, sonst ist der Gag verraten (Sphinx-Nase, Venusstatue,
## Glockenturm). Dazu die „drittes Mal“-Zeile am Wandfries.
##
## Aufruf: godot --headless --path game -s res://tests/ansehen_zustand.gd

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
	for sn in ["Notizbuch", "Thunfischdose", "Kochloeffel"]:
		await S.geben(sn)
	S.welt_beginnen("welt-2")
	await _warte_auf_raum("nil_delta")
	await _warte_bis(func(): return _gesagt("W2_NIL_PIX_0120"), 10.0)

	# Vor dem Finaltag: Nase, Statue und Turm sind heil.
	await _geh("sphinx")
	await _ansehen("nase")
	_pruefe(_gesagt("W2_SPHX_MAX_0100"), "Sphinx vor dem Finaltag: „Die Nase ist noch dran.“")
	_pruefe(not _gesagt("W2_SPHX_MAX_0110"), "Sphinx vor dem Finaltag: nicht „Die Nase liegt im Sand.“")
	await _ansehen("nase")
	_pruefe(_gesagt("W2_SPHX_MAX_0105") and not _gesagt("W2_SPHX_MAX_0115"), "Sphinx vor dem Finaltag, zweites Mal")
	await _geh("agora")
	await _ansehen("venusstatue")
	_pruefe(_gesagt("W2_AGOR_MAX_0060") and not _gesagt("W2_AGOR_MAX_0070"), "Venusstatue vor dem Finaltag: beide Arme")
	await _geh("stadion")
	await _ansehen("glockenturm")
	_pruefe(_gesagt("W2_STAD_MAX_0070") and not _gesagt("W2_STAD_MAX_0080"), "Glockenturm vor dem Finaltag: kerzengerade")

	# „drittes Mal“: Die dritte Zeile kommt beim dritten Ansehen und nicht vorher.
	await _geh("thronsaal_ramses")
	await _ansehen("wandfries")
	_pruefe(_gesagt("W2_THRO_MAX_0230") and not _gesagt("W2_THRO_PIX_0250"), "Wandfries, erstes Mal: Max' Zeile")
	await _ansehen("wandfries")
	_pruefe(not _gesagt("W2_THRO_PIX_0250"), "Wandfries, zweites Mal: noch nicht die dritte Zeile")
	await _ansehen("wandfries")
	_pruefe(_gesagt("W2_THRO_PIX_0250"), "Wandfries, drittes Mal: Pixels Zeile")

	# Nach dem Finaltag: Jetzt gelten die anderen Zeilen.
	Z.loese("R13")
	await _geh("sphinx")
	await _ansehen("nase")
	_pruefe(_gesagt("W2_SPHX_MAX_0110"), "Sphinx nach dem Finaltag: „Die Nase liegt im Sand.“")
	await _geh("agora")
	await _ansehen("venusstatue")
	_pruefe(_gesagt("W2_AGOR_MAX_0070"), "Venusstatue nach dem Finaltag: keine Arme mehr")
	await _geh("stadion")
	await _ansehen("glockenturm")
	_pruefe(_gesagt("W2_STAD_MAX_0080"), "Glockenturm nach dem Finaltag: schief")


## Rechtsklick auf einen Hotspot; wartet davor und danach, bis niemand mehr redet.
func _ansehen(id: String) -> void:
	var S = _spiel()
	await _warte_bis(func(): return S.in_szene == 0 and not _e().playing_queue, 15.0)
	var h := _hotspot(id)
	_pruefe(is_instance_valid(h), "Hotspot %s vorhanden" % id)
	if not is_instance_valid(h):
		return
	await h.on_right_click()
	await _warte_bis(func(): return S.in_szene == 0 and not _e().playing_queue, 10.0)
	for i in 3:
		await process_frame


func _geh(rid: String) -> void:
	var S = _spiel()
	await _warte_bis(func(): return S.in_szene == 0 and not _e().playing_queue, 15.0)
	S.herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_auf_raum(rid)


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
