extends SceneTree
## Review 17.11. (Game Designer): Welt 2 gezielt auf Hinweis-Lücken, Reihenfolge und Wunderdinge.
## Nur Beobachtung, keine Prüfung auf „richtig“: jede Zeile „BEFUND“ wird im Bericht ausgewertet.

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var _ersatz: Array = []


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	_spiel().testmodus = true
	CQSaveLoad.ordner = "user://test_saves/%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return _e().in_room, 15.0)
	_spiel().ersatz_gesagt.connect(func(k, z): _ersatz.append(z))
	await _durchlauf()
	print("ENDE")
	if is_instance_valid(current_scene):
		current_scene.queue_free()
	for i in 3:
		await process_frame
	quit(0)


func _b(text: String) -> void:
	print("BEFUND ", text)


func _pfote_info(wo: String) -> void:
	var H = root.get_node("Hinweise")
	var Z = _zustand()
	var s: String = H.schritt_waehlen()
	var zeile := ""
	if not s.is_empty():
		zeile = H._zeile(H._schritt(s), maxi(1, H.stufe(s)))
	else:
		zeile = H._nichts_offen_zeile()
	_b("%s: offen=%s, Pfote-Schritt=%s, Zeile=%s (%s)" % [wo, Z.offene_schritte(), s, zeile, TranslationServer.translate(zeile)])


func _durchlauf() -> void:
	var S = _spiel()
	var Z = _zustand()
	for sn in ["Notizbuch", "Thunfischdose", "Kochloeffel", "Socke"]:
		await S.geben(sn)
	S.welt_beginnen("welt-2")
	await _warte_auf_raum("nil_delta")
	await _warte_bis(func(): return _gesagt("W2_NIL_PIX_0120"), 10.0)
	await _pfote_info("A1 Ankunft")

	# R1, dann „Doch nicht“ auf der Flusskarte
	S.vorgabe_auswahl = [2]
	await S.regel("pixel", "faehre")
	await _pfote_info("A2 nach R1, nur Nil-Delta besucht")

	# Sphinx mit zu wenigen Bausteinen (nur „stirbt“ vom Fährmann)
	await S.regel("nach_einstieg", "faehrmann")
	await _geh("sphinx")
	await _pfote_info("A3 Sphinx besucht")
	_ersatz.clear()
	S.vorgabe_auswahl = [0]
	await S.regel("nach_option", "sphinx_figur", "0250")
	_b("B1 Sphinx-Rätsel mit 1 Baustein: Ersatzzeile=%s, Bausteine=%s" % [_ersatz, Z.wert("W2_BAUSTEINE", [])])

	# Olympia, ohne Thronsaal besucht zu haben
	await _faehre("faehrsteg_olympia")
	await _geh("agora")
	await _geh("stadion")
	await _pfote_info("A4 Olympia, Agora und Stadion besucht, Palast nie")
	await _geh("agora")
	await _geh("faehrsteg_olympia")
	await _faehre("nil_delta")

	# Götter-Duell: Kaugummi noch da, Brennspiegel als Wunder versuchen
	await S.regel("pixel", "sobek")
	await _geh("thronsaal_ramses")
	S.figur_wechseln(false)
	await S.regel("pixel", "hofkater")
	S.figur_wechseln(false)
	await S.regel("gegenstand", "hofkater", "thunfischdose")
	await S.geben(_sn("brennspiegel"))
	_ersatz.clear()
	var vorher: bool = Z.ist("W2_DUELL_WUNDER")
	var r = await S.regel("benutzen_inventar", "brennspiegel")
	_b("C1 Brennspiegel als Wunder, Kaugummi in der Tasche: behandelt=%s, Wunder vorher=%s nachher=%s" % [r, vorher, Z.ist("W2_DUELL_WUNDER")])
	r = await S.regel("gegenstand", "hofkater", "brennspiegel")
	_b("C2 Brennspiegel auf Hofkater: behandelt=%s, Wunder=%s" % [r, Z.ist("W2_DUELL_WUNDER")])
	await S.regel("benutzen_inventar", "kaugummi")
	_b("C3 Kaugummi: R2b=%s, Kaugummi noch da=%s" % [Z.geloest("R2b"), _hat("kaugummi")])

	# R2a
	await S.regel("nach_einstieg", "schreiber")
	S.vorgabe_auswahl = [0, 1, 2, 3]
	await S.regel("benutzen_inventar", "bildtafel")
	_b("C4 Audienz=%s" % Z.ist("W2_AUDIENZ"))
	await _pfote_info("A5 nach Audienz, Startbüro nie besucht")

	# Sphinx: Bausteine echt sammeln (Handy zweimal ansehen)
	await S.regel("ansehen_inventar", _i().get_item_instance("Handy"))
	await S.regel("ansehen_inventar", _i().get_item_instance("Handy"))
	_b("D1 Bausteine nach zweimal Handy ansehen + Fährmann: %s" % [Z.wert("W2_BAUSTEINE", [])])
	await _geh("nil_delta")
	await _geh("sphinx")
	S.vorgabe_auswahl = [0, 0, 1, 1]
	await S.regel("nach_option", "sphinx_figur", "0250")
	_b("D2 R8=%s" % Z.geloest("R8"))
	await S.regel("nach_option", "sphinx_figur", "0210")
	_b("D3 Empfehlungsschreiben=%s" % _hat("empfehlungsschreiben"))

	# Startbüro: Weg C, danach Kugelschreiber mit Formular kombinieren
	await _geh("nil_delta")
	await _faehre("faehrsteg_olympia")
	await _geh("agora")
	await _geh("startbuero")
	await S.geben(_sn("leeres_formular"))
	await S.regel("gegenstand", "beamter_1", "empfehlungsschreiben")
	_b("E1 Weg C: R3b=%s Startpass=%s Sandalen=%s" % [Z.geloest("R3b"), _hat("startpass"), _hat("sandalen")])
	await S.regel("kombinieren", "kugelschreiber", "leeres_formular")
	_b("E2 Nach R3b: Kugelschreiber+Formular -> Kugelschreiber noch da=%s, Rundschreiben=%s" % [_hat("kugelschreiber"), _hat("rundschreiben")])
	S.protokoll.clear()
	await S.regel("gegenstand", "beamter_1", "rundschreiben")
	_b("E3 Zweites Rundschreiben am Schalter: Stempel-Szene erneut=%s, Startpass=%s" % [_gesagt("W2_BUER_NAR_0500"), _hat("startpass")])
	await S.regel("gegenstand", "formularberg", "socke")
	_b("E4 Socke auf Formularberg nach R3b: Rundschreiben=%s" % _hat("rundschreiben"))

	# R5 und Tag 1 ohne Öl
	await _geh("agora")
	await _geh("faehrsteg_olympia")
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
	_b("F1 R5=%s" % Z.geloest("R5"))
	await _geh("hafen_syrakus")
	await _faehre("faehrsteg_olympia")
	await _geh("agora")
	await _geh("stadion")
	await S.regel("benutzen", "startlinie")
	await S.regel("gegenstand", "wurfhebel", "pixel")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "wurfhebel")
	_b("F2 R12=%s Lauf-Bestleistung=%s" % [Z.geloest("R12"), Z.ist("W2_LAUF_BESTLEISTUNG")])
	await _pfote_info("A6 nach Tag 1 (R4 Öl nie gemacht, Küche nie besucht)")

	# Küche besuchen (R4 wird offen), dann Pfote ohne Kontext
	await _geh("agora")
	await _geh("faehrsteg_olympia")
	await _faehre("nil_delta")
	await _geh("thronsaal_ramses")
	await _geh("palastkueche")
	Z.letzter_schritt = ""
	await _pfote_info("A7 nach Tag 1, Küche besucht")

	# R7: alle verhören, dann Ersatz bei Leonidas
	await _geh("thronsaal_ramses")
	await _geh("nil_delta")
	await _geh("sphinx")
	await S.regel("benutzen", "sphinx_figur")
	await _geh("nil_delta")
	await _faehre("faehrsteg_olympia")
	await _geh("agora")
	await S.regel("benutzen", "tiro")
	await _geh("stadion")
	await S.regel("benutzen", "leonidas")
	await S.regel("benutzen", "hermes")
	S.protokoll.clear()
	S.vorgabe_auswahl = [1]  # „Reden“: kommen die Aussagen noch einmal?
	await S.regel("benutzen", "leonidas")
	_b("G1 Leonidas erneut ansprechen, Reden: Aussagen wiederholt=%s, Protokoll=%s" % [_gesagt("W2_DISK_LEO_0050"), S.protokoll])
	S.vorgabe_auswahl = [2]
	await S.regel("benutzen", "leonidas")
	_b("G2 Ersatz bei Leonidas: R7=%s, Wurfscheibe=%s" % [Z.geloest("R7"), _hat("wurfscheibe")])

	# R9, R10 wie im Anspieltest; Grabhügel vorher nie besucht
	Z.setze_wert("W2_BAUSTEINE", Z.wert("W2_BAUSTEINE", []))
	await _geh("agora")
	await S.regel("nach_einstieg", "grieche")
	await S.regel("nach_option", "grieche", "0420")
	_b("H1 R9 (ohne Tonne)=%s Konter=%s" % [Z.geloest("R9"), Z.wert("W2_KONTER", [])])
	await S.regel("nach_option", "cicero", "0250")
	await _geh("faehrsteg_olympia")
	await _faehre("hafen_syrakus")
	await _geh("werkstatt")
	await S.regel("nach_option", "archimedes", "0410")
	await _geh("hafen_syrakus")
	await _faehre("nil_delta")
	await S.regel("gegenstand", "steinmetz", "entwurf")
	_b("H2 R10a=%s Grabstein=%s" % [Z.geloest("R10a"), _hat("grabstein")])
	Z.letzter_schritt = ""
	await _pfote_info("A8 Grabstein da, Grabhügel nie besucht")
	await _faehre("faehrsteg_olympia")
	_b("H3 Grabstein-Zustand in Olympia=%s" % S.regel_wert("zustand", "grabstein"))
	await _faehre("hafen_syrakus")
	await _geh("grabhuegel")
	await S.regel("gegenstand", "sockel", "grabstein")
	_b("H4 R10b=%s" % Z.geloest("R10b"))

	# Finaltag mit Wurfscheibe
	await _geh("hafen_syrakus")
	await _faehre("faehrsteg_olympia")
	await _geh("agora")
	await _geh("stadion")
	await S.regel("benutzen", "startlinie")
	S.vorgabe_auswahl = [0, 1, 3, 2, 4, 0]
	await S.regel("benutzen", "startlinie")
	_b("I1 Finaltag=%s Diskus-Bestleistung mit Wurfscheibe=%s Kranz=%s" % [Z.geloest("R13"), Z.ist("W2_DISKUS_BESTLEISTUNG"), _hat("olivenkranz")])
	_b("I2 Wunderdinge zum Schluss: Handy=%s Kaugummi=%s Kugelschreiber=%s" % [_hat("handy"), _hat("kaugummi"), _hat("kugelschreiber")])
	# Parade ohne Brennspiegel? (Brennspiegel ist noch da, Gegenprobe: abgeben)
	await S.abgeben(_sn("brennspiegel"))
	S.protokoll.clear()
	S.vorgabe_auswahl = [0, 0, 0, 0]
	await S.regel("benutzen_inventar", "paraden_plan")
	_b("I3 Paraden-Plan richtig, ohne Brennspiegel: R11a=%s Protokoll=%s" % [Z.geloest("R11a"), S.protokoll])
	Z.letzter_schritt = ""
	await _pfote_info("A9 Parade offen, Brennspiegel fehlt")


#region Hilfen #####################################################################################
func _geh(rid: String) -> void:
	_spiel().herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_auf_raum(rid)


func _faehre(ziel: String) -> void:
	_spiel().regeln().fahren(ziel)
	await _warte_auf_raum(ziel)


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true


func _warte_auf_raum(rid: String) -> void:
	var ok := await _warte_bis(func(): return _raum_id() == rid and _e().in_room and _raum().is_current, 15.0)
	if not ok:
		print("WARNUNG Raum %s nicht erreicht" % rid)
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
#endregion
