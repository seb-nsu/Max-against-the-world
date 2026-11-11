extends SceneTree
## Headless-Durchlauf von Welt 3 (Graubox) auf dem Normalweg: Mensch-Test, Nudelbude, Pastillen,
## Code-Sicht, Orakel, Büroturm, Morse-Tabelle, Kabel, vierte Zutat, Hausmeister (mit Olivenöl als
## Freund), Testkammern, Paradoxon und Kern, dann Zwischenspiel 3 mit Packen bis zum Start von
## Welt 4. Die Regeln (skripte/welt_3.gd) werden direkt mit Objekt-IDs angesprochen.
##
## Aufruf: godot --headless --path game -s res://tests/welt_3_anspiel.gd

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
	await S.geben(_sn("olivenoel"))  # aus Welt 2 eingepackt: Modell 08/15 wird Freund
	S.welt_beginnen("welt-3")
	await _warte_auf_raum("unterstadt_strasse")
	await _warte_bis(func(): return _gesagt("W3_ANK_PIX_0110"), 10.0)
	_pruefe(Z.ist("W3_WECHSEL_FREI"), "Ankunft in der Unterstadt")

	# R1: drei Beobachtungen, dann Deckerts Test menschlich beantworten
	for f in ["frau_regenschirm", "strassenmusiker", "weinender_mann"]:
		await S.regel("ansehen", f)
	_pruefe(Z.geloest("R1a"), "R1a Beobachtungen")
	# Das Gespräch muss die Option auch anbieten, sonst ist der Test im Spiel nicht zu starten.
	_pruefe(root.get_node("D").get_instance("Deckert").option_sichtbar("0090"), "Deckert bietet den Mensch-Test im Gespräch an")
	S.vorgabe_auswahl = [0]
	await S.regel("nach_option", "deckert", "0090")
	_pruefe(not Z.geloest("R1b"), "Logische Antwort fällt durch")
	S.vorgabe_auswahl = [1, 1, 1]
	await S.regel("nach_option", "deckert", "0090")
	_pruefe(Z.geloest("R1b"), "R1b Mensch-Test")
	# R2: „Vier“ bestellen
	S.vorgabe_auswahl = [0, 2]
	await S.regel("nach_option", "herr_vier", "0090")
	_pruefe(Z.geloest("R2"), "R2 Nudelbude")

	# R3: Symptom, Pixel zweimal, Pastillen, rote Pastille
	await _geh("apothekengasse")
	await S.regel("nach_option", "morphaeus", "0480")
	await S.regel("benutzen", "pixel")
	S.vorgabe_auswahl = [2]
	await S.regel("benutzen", "automat")
	_pruefe(Z.geloest("R3a") and _hat("omas_kekse") and _hat("rote_pastille"), "R3a Pastillen und Omas Kekse")
	S.regel("benutzen_inventar", "rote_pastille")
	await _warte_auf_raum("stadtstrasse")
	_pruefe(Z.geloest("R3b") and Z.wert("W3_EBENE") == "simulation", "R3b in der Simulation")

	# R5: Code-Sicht an der Tür
	await S.regel("ansehen", "tuer")
	await S.regel("ansehen", "tuer")
	_pruefe(Z.ist("CODE_SICHT"), "Code-Sicht frei")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "tuer")
	_pruefe(Z.geloest("R5"), "R5 gesprächige Tür")

	# Radiowecker auf der Stadtstraße: beim ersten Aufstehen 0230, danach 0240.
	# Beide Hotspots des Weckers gelten gleich.
	await S.regel("benutzen", "klingelnder_radiowecker")
	await _warte_auf_raum("widerstandsbasis")
	_pruefe(_gesagt("W3_SIM_MAX_0230") and not _gesagt("W3_SIM_MAX_0240"), "Radiowecker, erstes Aufstehen: die erste Zeile")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "terminal")
	await _warte_auf_raum("stadtstrasse")
	await S.regel("benutzen", "radiowecker")
	await _warte_auf_raum("widerstandsbasis")
	_pruefe(_gesagt("W3_SIM_MAX_0240"), "Radiowecker, zweites Aufstehen: die zweite Zeile")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "terminal")
	await _warte_auf_raum("stadtstrasse")

	# R4: Orakel-Oma, Kochbuch (Regel 2)
	await _geh("kueche_orakel")
	_pruefe(root.get_node("D").get_instance("OrakelOma").option_sichtbar("0130"), "Orakel-Oma bietet die Frage nach dem Sparschwein an")
	await S.regel("nach_option", "orakel_oma", "0150")
	await S.regel("ansehen", "kochbuch")
	_pruefe(Z.geloest("R4") and _hat("rezeptkarte") and Z.ist("REGEL_2"), "R4 Sparschwein, Regel 2")
	_pruefe(_objekt("sparschwein") != null and _objekt("eieruhr") != null and _objekt("vase") == null
		and _objekt("wandtelefon") == null, "Küche: Sparschwein und Eieruhr statt Vase und Wandtelefon")
	# Omas Eieruhr weckt auch: Max wacht in der Kapsel auf und kommt über das Terminal in die Küche zurück.
	await S.regel("benutzen", "eieruhr")
	await _warte_auf_raum("widerstandsbasis")
	_pruefe(_gesagt("W3_KUCH_MAX_0680") and Z.wert("W3_LETZTE_ZELLE", "") == "kueche_orakel", "Eieruhr: Ausgang aus der Küche")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "terminal")
	await _warte_auf_raum("kueche_orakel")

	# R6: Büroturm
	await _geh("buero_50")
	_pruefe(Z.ist("HEXENSCHUSS"), "Büroturm: Hexenschuss")
	# Der Bürokopierer, aus dem die Kopien kommen: zwei Zeilen beim Ansehen, eine beim Benutzen
	var kopierer := _objekt("kopierer")
	_pruefe(kopierer != null, "Büroturm: Kopierer steht im Flur")
	if kopierer != null:
		await kopierer.ansehen()
		await kopierer.ansehen()
		await kopierer.benutzen_standard()
		_pruefe(_gesagt("W3_TURM_MAX_0312") and _gesagt("W3_TURM_MAX_0314") and _gesagt("W3_TURM_MAX_0316"),
			"Kopierer: Ansehen zweimal, Benutzen")
	await S.geben(_sn("kaffeetasse"))
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "klone")
	_pruefe(Z.geloest("R6a"), "R6a Original und Kopie")
	await S.regel("benutzen_inventar", "kaffeetasse")
	await S.regel("ansehen_inventar", "schmidts_akte")
	_pruefe(Z.geloest("R6b") and _hat("schmidts_akte") and Z.ist("REGEL_1"), "R6b Mittagspause, Regel 1")

	# R13: Pixel in der Basis wirft Kalles Tasse
	await _wechsel("widerstandsbasis")
	await S.regel("benutzen", "kalles_tasse")
	await _wechsel("buero_50")
	_pruefe(Z.geloest("R13") and _hat("morse_tabelle"), "R13 Morse-Tabelle (in Max' Inventar)")

	# R7: Farbcode ans Terminal, Pixel steckt um
	await S.regel("benutzen", "farbcode_an_der_wand")
	await S.regel("benutzen", "terminal")
	await S.regel("benutzen", "terminal")
	_pruefe(Z.geloest("R7a"), "R7a Farbcode")
	await _wechsel("widerstandsbasis")
	S.vorgabe_auswahl = [1, 0, 1, 2]  # erst falsch (Ente), dann richtig
	S.regel("benutzen", "patch_panel")
	await _warte_bis(func(): return Z.geloest("R7b") and _spiel().ist_pixel() == false, 20.0)
	await _warte_auf_raum("widerstandsbasis")
	_pruefe(Z.geloest("R7b") and Z.wert("W3_EBENE") == "realitaet", "R7b Max wacht auf")

	# R12: Glückskeks für Herrn Vier
	await _geh("unterstadt_strasse")
	await S.regel("gegenstand", "herr_vier", "rezeptkarte")
	_pruefe(Z.geloest("R12") and _hat("zugangskarte"), "R12 vierte Zutat")

	# R8 und R9a: Laboreingang
	await _geh("laboreingang")
	# Die Seite geben, obwohl das Öl noch in der Tasche ist: Pixel warnt einmal, nichts geht verloren
	await S.geben(_sn("telefonbuchseite"))
	await S.geben(_sn("olivenoel"))  # der Weltbeginn behält nur die gepackte Tasche
	await S.regel("gegenstand", "hausmeister", "telefonbuchseite")
	_pruefe(_gesagt("W3_EING_PIX_0185") and not Z.geloest("R8") and _hat("telefonbuchseite"),
		"Seite vor dem Ölen: Pixel warnt, die Seite bleibt bei Max")
	await S.regel("gegenstand", "hausmeister", "olivenoel")
	_pruefe(Z.ist("FREUND_0815"), "Öl für Modell 08/15: Freund")
	await S.regel("gegenstand", "hausmeister", "telefonbuchseite")
	_pruefe(Z.geloest("R8"), "R8 Hausmeister")
	await S.regel("gegenstand", "kartenleser", "zugangskarte")
	await S.regel("benutzen", "datenanschluss")
	_pruefe(Z.geloest("R9a"), "R9a Leitung")

	# R9b–d: Testkammern
	await _geh("widerstandsbasis")
	S.vorgabe_auswahl = [1]
	S.regel("benutzen", "terminal")
	await _warte_auf_raum("testkammer_1")
	await S.regel("benutzen", "portalgeraet_in_der_halterung")
	await S.regel("benutzen_inventar", "portalgeraet")
	_pruefe(_hat("portalgeraet") and Z.ist("W3_PORTAL_BENUTZT"), "Portalgerät")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "bernd")
	_pruefe(Z.geloest("R9b"), "R9b Kammer 1")
	await _geh("testkammer_2")
	await S.regel("ansehen", "kritzelei")
	await S.geben(_sn("gummihuhn"))
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "laser")
	_pruefe(Z.geloest("R9c") and Z.ist("REGEL_3"), "R9c Kammer 2, Regel 3")
	await _geh("testkammer_3")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "tuer")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "bernd")
	_pruefe(Z.geloest("R9d"), "R9d Kammer 3")

	# R10 und R11: Kern
	await _geh("kern")
	S.vorgabe_auswahl = [0, 1, 2]
	await S.regel("benutzen", "mutti")
	_pruefe(Z.geloest("R10"), "R10 Paradoxon")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", _objekt("energiezelle"))
	_pruefe(Z.ist("W3_ZELLE_KALT") and Z.ist("W3_KEKSE_WARM"), "Zelle kalt, Kekse ofenwarm")
	# Kalte Zelle nehmen; ist der Abschluss schon unterwegs, gibt es keinen Raum zum Suchen
	if _raum_id() == "kern" and root.get_node("E").in_room:
		var zelle := _objekt("energiezelle")
		if zelle:
			S.regel("benutzen", zelle)
	await _warte_bis(func(): return _raum_id() == "dachboden", 150.0)
	await _warte_auf_raum("dachboden")
	_pruefe(Z.geloest("R11", "welt-3") and Z.ist("ZS3_MITBRINGSEL_ABGEGEBEN"), "R11 Energiezelle, Welt 3 geschafft, Opa hat die Zelle")

	# Zwischenspiel 3: Ankunft, Packen, Kanal 999
	await _warte_bis(func(): return int(Z.wert("EINKAUFSLISTE", 0)) == 3, 60.0)
	await _warte_auf_raum("dachboden")
	_pruefe(int(Z.wert("ZWISCHENSPIEL", 0)) == 3, "Zwischenspiel 3")
	_pruefe(int(Z.wert("EINKAUFSLISTE", 0)) == 3, "Einkaufsliste: dritter Wunsch")
	await _hotspot("drehknopf").on_click()
	_pruefe(Z.ist("ZS3_GEPACKT"), "Reisetasche gepackt")
	await _hotspot("drehknopf").on_click()
	await _warte_bis(func(): return Z.abschnitt == "welt-4", 15.0)
	_pruefe(Z.abschnitt == "welt-4", "Welt 4 beginnt")


#region Hilfen #####################################################################################
func _geh(rid: String) -> void:
	_spiel().herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_auf_raum(rid)


## Figurenwechsel bei getrennten Figuren: springt in den Raum der anderen Figur.
func _wechsel(ziel: String) -> void:
	_spiel().figur_wechseln(false)
	await _warte_auf_raum(ziel)


func _objekt(id: String) -> Node:
	for o in _raum().get_hotspots() + _raum().get_props():
		if o.has_method("objekt_id") and o.objekt_id() == id:
			return o
	return null


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
