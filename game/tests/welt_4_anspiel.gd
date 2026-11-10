extends SceneTree
## Headless-Anspieltest für Welt 4 (Graubox): Start der Welt, R1 als Pixel, Quiz R2, Umschalten
## und die Programmzeitschrift. Prüft, dass die Regeln (skripte/welt_4.gd) mit den gebauten
## Räumen zusammenspielen; den ganzen Lösungspfad deckt der Test nicht ab.
##
## Aufruf: godot --headless --path game -s res://tests/welt_4_anspiel.gd

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
	S.welt_beginnen("welt-4")
	await _warte_auf_raum("testbild")
	await _warte_bis(func(): return _gesagt("W4_TEST_PIX_0140"), 10.0)
	_pruefe(_gesagt("W4_TEST_MAX_0010") and _gesagt("W4_TEST_PIX_0140"), "Ankunft im Testbild (0010–0140)")
	_pruefe(Z.ist("W4_WECHSEL_FREI"), "Figurenwechsel frei")

	# R1: Max sieht keine Ordnung, Pixel sortiert von hell nach dunkel
	await _hotspot("balken").on_click()
	_pruefe(not Z.geloest("R1"), "Balken als Max: noch nicht gelöst")
	_pruefe(S.figur_wechseln(false), "Wechsel zu Pixel")
	S.vorgabe_auswahl = [1]
	await _hotspot("balken").on_click()
	_pruefe(_gesagt("W4_TEST_PIX_0300") and not Z.geloest("R1"), "Falsche Reihenfolge (0300)")
	S.vorgabe_auswahl = [0, 1, 0, 1, 2]  # Balken; Quiz: erst falsch (B), dann A, B, C
	await _hotspot("balken").on_click()
	_pruefe(Z.geloest("R1"), "R1 gelöst")
	await _warte_auf_raum("gluecksrad")
	await _warte_bis(func(): return Z.geloest("R2"), 15.0)
	_pruefe(_gesagt("W4_GLUE_GER_0090") and _gesagt("W4_GLUE_MAX_0100"), "Falsche Quizantwort, Gerd fragt neu")
	_pruefe(Z.geloest("R2"), "R2 gelöst")
	for g in ["BilligFernbedienung", "TasteUmschalten", "Programmzeitschrift", "LichtroehreDeluxe"]:
		_pruefe(_i().is_item_in_inventory(g), "Preis im Inventar: %s" % g)
	_pruefe(S.vorgabe_auswahl.is_empty(), "alle Auswahlen verbraucht")

	# Umschalten: Liste ohne den aktuellen Sender, Mitternachts-TV nur um Mitternacht
	S.vorgabe_auswahl = [2]  # sitcom, savanne, friedhof …
	await S.regel("benutzen_inventar", _item("TasteUmschalten"))
	_pruefe(_gesagt("W4_FERN_MAX_0050") and _gesagt("W4_FRIE_MAX_0010") and _raum_id() == "gluecksrad",
		"Mitternachts-TV außerhalb von Mitternacht (0010), Max bleibt")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen_inventar", _item("TasteUmschalten"))
	await _warte_auf_raum("sitcom_kueche")
	await _warte_bis(func(): return _gesagt("W4_SIT_PIX_0090"), 10.0)
	_pruefe(_gesagt("W4_SIT_SMU_0010"), "Erstes Betreten der Sitcom-Küche")

	# Programmzeitschrift: 20:15-Folge, dann Mitternacht
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen_inventar", _item("Programmzeitschrift"))
	_pruefe(Z.ist("W4_FOLGE_2015_GELESEN"), "20:15-Folge gelesen (Fondue)")
	S.vorgabe_auswahl = [1]
	await S.regel("benutzen_inventar", _item("Programmzeitschrift"))
	await _warte_auf_raum("friedhof")
	_pruefe(Z.geloest("R5a"), "R5a: Mitternachts-TV über die Zeitschrift")

	# Genre-Logik: Käse aus der Sitcom wird auf dem Friedhof leuchtend
	Z.setze_wert("W4_KAESE", "normal")
	await S.geben("FondueKaese")
	S.regel("raum_betreten", _raum(), false)
	_pruefe(Z.wert("W4_KAESE") == "leuchtend", "Käse im Grusel-Sender leuchtend")


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


func _spiel():
	return root.get_node("Spiel")


func _zustand():
	return root.get_node("Zustand")


func _e():
	return root.get_node("E")


func _c():
	return root.get_node("C")


func _i():
	return root.get_node("I")


func _item(sn: String):
	return _i().get_item_instance(sn)


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
