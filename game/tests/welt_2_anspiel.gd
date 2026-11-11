extends SceneTree
## Headless-Durchlauf von Welt 2 (Graubox) auf dem Normalweg: Fähre, Hieroglyphen, Götter-Duell,
## Passierschein, Olivenöl, Krone, Tag 1, Diskus, Sphinx, Konter, Grabstein über die Zeitfähre,
## Finaltag mit Rede-Ringen, Parade mit Wein, dann Zwischenspiel 2 mit Packen und Kanal 42 bis
## zum Start von Welt 3. Die Regeln (skripte/welt_2.gd) werden direkt mit Objekt-IDs angesprochen;
## geprüft wird, dass jedes Rätsel lösbar ist und die Welt bis zum Übergang durchläuft.
##
## Aufruf: godot --headless --path game -s res://tests/welt_2_anspiel.gd

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
	_pruefe(_hat("handy") and _hat("kaugummi") and _hat("kugelschreiber"), "Ankunft: Wunderdinge in den Taschen")

	# R1: Pixel als Fahrkarte; Sobek folgt Pixel
	S.vorgabe_auswahl = [2]  # Flusskarte: „Doch nicht“
	await S.regel("pixel", "faehre")
	_pruefe(Z.geloest("R1"), "R1 Fähre")
	await S.regel("pixel", "sobek")
	_pruefe(Z.ist("W2_SOBEK_FOLGT"), "Sobek folgt Pixel")

	# R2b und R2a im Thronsaal
	await _geh("thronsaal_ramses")
	_pruefe(_gesagt("W2_THRO_MAX_0060"), "Thronsaal: erstes Betreten")
	S.figur_wechseln(false)
	await S.regel("pixel", "hofkater")
	S.figur_wechseln(false)
	_pruefe(Z.ist("W2_DUELL") and Z.ist("W2_DUELL_GEFOLGE"), "Duell gefordert, Gefolge da")
	await S.regel("gegenstand", "hofkater", "thunfischdose")
	await S.regel("benutzen_inventar", "kaugummi")
	_pruefe(Z.geloest("R2b") and _hat("thunfischdose"), "R2b Götter-Duell, Dose zurück")
	await S.geben(_sn("bildtafel"))
	S.vorgabe_auswahl = [0, 1, 2, 4]  # erst falsch: Mann, Katze, Pharao, Mund
	await S.regel("benutzen_inventar", "bildtafel")
	_pruefe(_gesagt("W2_HIER_SCH_0240") and not Z.geloest("R2a"), "Falsche Botschaft wird vorgelesen")
	S.vorgabe_auswahl = [0, 1, 2, 3]
	await S.regel("benutzen_inventar", "bildtafel")
	_pruefe(Z.geloest("R2a") and Z.ist("W2_AUDIENZ"), "R2a und Audienz")

	# R4: Fladen statt Kaugummi
	await _geh("palastkueche")
	for g in ["brot", "datteln", "zwiebel"]:
		await S.geben(_sn(g))
	await S.regel("kombinieren", "brot", "datteln")
	await S.regel("kombinieren", "fladen", "zwiebel")
	await S.regel("gegenstand", "lehmoefen", "fladen")
	await S.regel("gegenstand", "nebet", "fladen")
	_pruefe(Z.geloest("R4") and _hat("olivenoel"), "R4 Olivenöl")

	# R3: Rundschreiben mit dem Kugelschreiber, Startpass, Sandalen
	await _faehre("faehrsteg_olympia")
	await _geh("agora")
	await _geh("startbuero")
	await S.geben(_sn("leeres_formular"))
	await S.regel("kombinieren", "kugelschreiber", "leeres_formular")
	_pruefe(Z.geloest("R3a") and _hat("rundschreiben"), "R3a Rundschreiben")
	await S.regel("gegenstand", "beamter_1", "rundschreiben")
	_pruefe(Z.geloest("R3b") and _hat("startpass") and _hat("sandalen"), "R3b Startpass, Sandalen von Hermes")
	await S.regel("kombinieren", "olivenoel", "sandalen")
	_pruefe(Z.ist("W2_SANDALEN_GEOELT"), "Sandalen geölt")

	# R5: Krone in der Werkstatt
	await _faehre("hafen_syrakus")
	await _geh("werkstatt")
	await S.regel("nach_option", "hieron", "0470")
	for g in ["waage", "messbecher"]:
		await S.geben(_sn(g))
	await S.regel("kombinieren", "krone", "waage")
	await S.regel("kombinieren", "goldbarren", "waage")
	for g in ["krone", "goldbarren"]:
		await S.regel("gegenstand", "badewanne", g)
		await S.regel("gegenstand", "badewanne", "messbecher")
	_pruefe(Z.geloest("R5") and _gesagt("W2_TRAI_PIX_0180"), "R5 Krone und Training")

	# Tag 1: Lauf und Hebel mit Pixel im Korb
	await _faehre("faehrsteg_olympia")
	await _geh("agora")
	await _geh("stadion")
	await S.regel("benutzen", "startlinie")
	_pruefe(Z.ist("W2_TAG1_LAEUFT") and _gesagt("W2_TAG1_NAR_0080"), "Tag 1: Lauf mit geölten Sandalen")
	await S.regel("gegenstand", "wurfhebel", "pixel")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "wurfhebel")
	_pruefe(Z.geloest("R12") and _hat("schallplatte") and _hat("wurfscheibe"), "R12 Tag 1, Diskus weg")

	# R7: Tiro verhören. Anklagen geht erst, wenn alle vier verhört sind und alle acht Aussagen
	# im Notizbuch stehen.
	await S.regel("benutzen", "tiro")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "tiro")
	_pruefe(not Z.geloest("R7"), "R7: keine Anklage, bevor alle vier verhört sind")
	S.vorgabe_auswahl = []
	for v in ["leonidas", "hermes", "sphinx_figur"]:
		await S.regel("benutzen", v)
	_pruefe(_gesagt("W2_DISK_LEO_0060") and _gesagt("W2_DISK_HER_0100") and _gesagt("W2_DISK_SPH_0190"),
		"R7: alle vier verhört")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "tiro")
	_pruefe(Z.geloest("R7") and _hat("diskus"), "R7 Diskus zurück")

	# R8: Sphinx mit drei Handy-Bausteinen
	Z.setze_wert("W2_BAUSTEINE", ["klingelt", "leuchtet", "stirbt"])
	S.vorgabe_auswahl = [0, 0, 0, 0]
	await S.regel("nach_option", "sphinx_figur", "0250")
	_pruefe(Z.geloest("R8") and _hat("schriftrolle"), "R8 Sphinx")

	# R9: Konter von der Menge und aus der Tonne
	await S.regel("nach_einstieg", "grieche")
	await S.regel("nach_option", "grieche", "0420")
	S.figur_wechseln(false)
	await S.regel("pixel", "tonne")
	S.figur_wechseln(false)
	_pruefe(Z.geloest("R9"), "R9 alle Konter")

	# R10: Grabstein meißeln, in Syrakus verwittert auf den Sockel
	await S.regel("nach_option", "cicero", "0250")
	await S.regel("nach_option", "archimedes", "0410")
	_pruefe(_hat("entwurf"), "Entwurf von Archimedes")
	await _geh("agora")
	await _geh("faehrsteg_olympia")
	await _faehre("nil_delta")
	await S.regel("gegenstand", "steinmetz", "entwurf")
	_pruefe(Z.geloest("R10a") and _hat("grabstein"), "R10a Grabstein")
	await _faehre("hafen_syrakus")
	await _geh("grabhuegel")
	await S.regel("gegenstand", "sockel", "grabstein")
	_pruefe(Z.geloest("R10b"), "R10b Grab für Archimedes")

	# Finaltag
	await _geh("hafen_syrakus")
	await _faehre("faehrsteg_olympia")
	await _geh("agora")
	await _geh("stadion")
	await S.regel("benutzen", "startlinie")  # Erinnerung an die Fächerwedler (6b offen)
	S.vorgabe_auswahl = [0, 1, 3, 2, 4, 0]  # Diskus; Konter je Linie
	await S.regel("benutzen", "startlinie")
	_pruefe(Z.geloest("R13") and _hat("olivenkranz") and _hat("paraden_plan"), "R13 Finaltag")

	# R11: Parade und Wein
	await S.geben(_sn("brennspiegel"))
	S.vorgabe_auswahl = [0, 0, 0, 0]
	await S.regel("benutzen_inventar", "paraden_plan")
	_pruefe(Z.geloest("R11a"), "R11a Paraden-Plan")
	await S.geben(_sn("essigkrug"))
	S.regel("gegenstand", "ramses", "essigkrug")
	await _warte_auf_raum("dachboden")
	_pruefe(Z.geloest("R11b", "welt-2") and Z.ist("W2_GESCHAFFT"), "R11b Wein, Welt 2 geschafft")

	# Zwischenspiel 2: Ankunft, Packen, Kanal 42
	await _warte_bis(func(): return int(Z.wert("EINKAUFSLISTE", 0)) == 2, 60.0)
	await _warte_auf_raum("dachboden")
	_pruefe(int(Z.wert("ZWISCHENSPIEL", 0)) == 2 and not _hat("goldener_sack"), "Zwischenspiel 2: Opa nimmt den Sack")
	_pruefe(int(Z.wert("EINKAUFSLISTE", 0)) == 2, "Einkaufsliste: zweiter Wunsch")
	S.vorgabe_tasche = []
	await _hotspot("drehknopf").on_click()
	_pruefe(Z.ist("ZS2_GEPACKT"), "Reisetasche gepackt")
	await _hotspot("drehknopf").on_click()
	await _warte_bis(func(): return Z.abschnitt == "welt-3", 15.0)
	_pruefe(Z.abschnitt == "welt-3", "Welt 3 beginnt")


#region Hilfen #####################################################################################
func _geh(rid: String) -> void:
	_spiel().herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_auf_raum(rid)


func _faehre(ziel: String) -> void:
	_spiel().regeln().fahren(ziel)
	await _warte_auf_raum(ziel)


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
	await _warte_bis(func(): return _spiel().in_szene == 0, 30.0)
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
