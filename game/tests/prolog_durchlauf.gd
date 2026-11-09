extends SceneTree
## Headless-Test: spielt den Lösungspfad des Prologs durch (P1–P3) und prüft nach jedem
## Schritt Schalter, Rätselstatus, Hinweise und eine Speichern/Laden-Rundreise.
##
## Aufruf (aus dem Ordner game/):
##   godot --headless --path . -s res://tests/prolog_durchlauf.gd
##   godot --headless --path . -s res://tests/prolog_durchlauf.gd -- --echt   (ohne Testmodus)
## Ende mit Code 0 (alles grün) oder 1 (Fehler, Liste am Ende).
##
## Läuft im Testmodus (Spiel.testmodus): Zeilen werden nur protokolliert, nicht als Sprechblase
## gezeigt, Wege werden nicht gelaufen, Nahansicht und Notizbuch öffnen sich nicht. Raumwechsel,
## Übergänge, Popochius Speichern/Laden und das Inventar laufen echt.

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
const SLOT := 1

var fehler: Array[String] = []
var _pruefungen := 0


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	# Autoloads sind da, sobald der erste Frame läuft
	await process_frame
	var spiel = root.get_node("Spiel")
	# --echt (nach "--"): ohne Testmodus, mit echten Sprechblasen und Zwischensequenzen
	spiel.testmodus = not "--echt" in OS.get_cmdline_user_args()
	print("Testmodus: ", spiel.testmodus)
	if not spiel.testmodus:
		# Sprechblasen laufen von selbst weiter (sonst warten sie headless ewig auf einen Klick),
		# und die Zeit läuft zehnfach, damit der Lauf keine zehn Minuten dauert.
		root.get_node("E").settings.auto_continue_text = true
		Engine.time_scale = float(OS.get_environment("CQ_ZEITFAKTOR")) if OS.has_environment("CQ_ZEITFAKTOR") else 10.0
		# Nahansicht und Notizbuch warten auf einen Klick: der Test schließt sie nach kurzer Zeit.
		node_added.connect(_ueberlagerung_schliessen)
	CQSaveLoad.ordner = "user://test_saves/"
	_ordner_leeren()
	change_scene_to_file(STARTRAUM)

	await _durchlauf()

	print("")
	print("Prüfungen: %d, Fehler: %d" % [_pruefungen, fehler.size()])
	for f in fehler:
		print("  FEHLER: ", f)
	print("Gesagte Blasen: %d" % _spiel().protokoll.size())
	_ordner_leeren()
	# Raum abräumen, damit beim Beenden weniger Ressourcen-Warnungen kommen
	if is_instance_valid(current_scene):
		current_scene.queue_free()
	for i in 3:
		await process_frame
	quit(0 if fehler.is_empty() else 1)


#region Lösungspfad ################################################################################
func _durchlauf() -> void:
	var Z = _zustand()
	var H = _hinweise()

	# --- Wohnzimmer: Einstieg ---
	await _warte_auf_raum("Wohnzimmer")
	await _warte_bis(func(): return _gesagt("P0_WOHN_MAX_0070"), 10.0)
	_pruefe(_gesagt("P0_WOHN_OPA_0030"), "Intro Wohnzimmer mit Opa aus dem Off")
	_pruefe(Z.abschnitt == "prolog", "Abschnitt prolog")
	_pruefe(Z.status("P1") == "gesperrt", "P1 gesperrt vor dem Dachboden")
	_pruefe(not H.pfote_aktiv(), "Pfote im Prolog vor P1 aus")
	_pruefe(not _spiel().wechsel_moeglich(), "kein Figurenwechsel im Prolog")
	await _ansehen(_hotspot("Sofa"), "P0_WOHN_MAX_0150")
	await _rundreise("Wohnzimmer Anfang")

	# --- Treppenhaus, Dachboden ---
	await _hotspot("AusgangTreppenhaus").on_click()
	await _warte_auf_raum("Treppenhaus")
	await _warte_bis(func(): return _datei_da(14) or _datei_da(15), 5.0)
	_pruefe(_datei_da(14) or _datei_da(15), "Autospeicher beim Raumwechsel")
	await _ansehen(_hotspot("HutAmHaken"), "P0_TREP_MAX_0010")
	await _hotspot("AusgangDachboden").on_click()
	await _warte_auf_raum("Dachboden")
	await _warte_bis(func(): return _gesagt("P0_DACH_OPA_0160"), 10.0)
	_pruefe(_gesagt("P0_DACH_OPA_0010"), "Szene Opas Auftrag beim ersten Betreten")
	_pruefe(Z.status("P1") == "offen", "P1 offen nach Betreten des Dachbodens")
	_pruefe(Z.status("P2") == "gesperrt", "P2 gesperrt vor P1")
	_pruefe(Z.status("P3") == "gesperrt", "P3 gesperrt vor P2")
	_pruefe(_raum().get_prop("ZappOMat").current_frame == 0, "Zapp-O-Mat aus vor P1")

	# Bodenluke vor P3: Max will nicht runter
	var luke := _hotspot("Bodenluke")
	await luke.on_click()
	_pruefe(_gesagt("P0_DACH_MAX_1000"), "Bodenluke vor P3 sagt 1000")
	_pruefe(_raum_name() == "Dachboden", "Bodenluke vor P3 führt nicht hinaus")

	# Opa gibt die P1-Hinweise (Option 1322), ohne Wartezeile
	var opa_d = root.get_node("D").get_instance("Opa")
	_pruefe(opa_d.option_sichtbar("1322"), "Opa-Option 1322 vor P1 sichtbar")
	await opa_d.waehlen("1322")
	_pruefe(_gesagt("P0_DACH_OPA_1324") and _gesagt("P0_DACH_OPA_1324_2"), "Opa 1324 mit Kaskade")
	_pruefe(H.stufe("P1") == 1, "P1 Hinweisstufe 1")
	_protokoll_leeren()
	await opa_d.waehlen("1322")
	if _spiel().testmodus:
		# Im echten Lauf vergeht beim Sprechen genug Spielzeit für Stufe 2.
		_pruefe(_gesagt("P0_DACH_OPA_1324") and not _gesagt("P0_HINT_PIX_9995"),
			"Opa wiederholt Stufe 1 ohne Wartezeile")
	Z.spielzeit += 31.0
	await opa_d.waehlen("1322")
	_pruefe(_gesagt("P0_DACH_OPA_1326") and H.stufe("P1") == 2, "nach 30 s Stufe 2 (1326)")

	# Pixel schläft
	var pixel: PopochiuCharacter = _c().get_character("Pixel")
	await pixel.on_click()
	await pixel.on_click()
	_pruefe(_gesagt("P0_DACH_MAX_0220") and _gesagt("P0_DACH_OPA_0230"), "Pixel wecken 0220, Opa 0230")

	# Gegenstände nehmen
	await _nehmen("Thunfischdose", "P0_DACH_MAX_0250")
	await _nehmen("Dosenoeffner", "P0_DACH_MAX_0260")
	await _nehmen("Drahtkleiderbuegel", "P0_DACH_MAX_0460")
	_pruefe(_raum().get_prop("Thunfischdose").visible == false, "Prop Thunfischdose weg")
	await _rundreise("Dachboden, drei Gegenstände")
	_pruefe(not _raum().get_prop("Dosenoeffner").visible, "Prop Dosenöffner bleibt nach Laden weg")

	# Fehlversuche
	await _benutze("Drahtkleiderbuegel", _raum().get_prop("ZappOMat"), "P0_DACH_MAX_1150")
	await _benutze("Dosenoeffner", _raum().get_prop("ZappOMat"), "P0_DACH_MAX_1130")
	await _benutze("Thunfischdose", pixel, "P0_DACH_MAX_0270")
	await _benutze("Drahtkleiderbuegel", pixel, "P0_DACH_MAX_1110")
	await _ansehen(_raum().get_prop("ZappOMat"), "P0_DACH_MAX_0400")
	await _hotspot("Drehknopf").on_click()
	_pruefe(_gesagt("P0_DACH_OPA_1140"), "Drehknopf vor P2: Opa 1140")

	# --- P1: Dosenöffner mit Thunfischdose ---
	await _item("Thunfischdose").on_item_used(_item("Dosenoeffner"))
	_pruefe(Z.geloest("P1") and Z.ist("P0_P1_GELOEST"), "P1 gelöst (P0_P1_GELOEST)")
	_pruefe(_gesagt("P0_DACH_PIX_0380") and _gesagt("P0_DACH_MAX_0390"), "P1-Szene vollständig")
	_pruefe(_item("Thunfischdose").zustand() == "leer", "Thunfischdose leer nach P1")
	_pruefe(pixel.position == Vector2(70, 126), "Pixel auf der Werkbank")
	_pruefe(_raum().get_prop("ZappOMat").current_frame == 1, "Zapp-O-Mat rauscht nach P1")
	_pruefe(H.pfote_aktiv(), "Pfote ab P1 aktiv")
	_pruefe(Z.status("P2") == "offen", "P2 offen nach P1")
	_pruefe(H.schritt_waehlen() == "P2", "Pfote wählt P2")
	_pruefe(not opa_d.option_sichtbar("1322") and _dialog("Pixel").option_sichtbar("1390"),
		"Gesprächsoptionen nach P1 umgeschaltet")
	await _rundreise("nach P1")
	_pruefe(pixel.position == Vector2(70, 126), "Pixel bleibt nach Laden auf der Werkbank")

	# Hilfe-Pfote zu P2: Stufe 1, dann Wartezeile + Wiederholung, nach 30 s Stufe 2
	_protokoll_leeren()
	await H.pfote_geklickt()
	_pruefe(_gesagt("P0_HINT_PIX_0210"), "Pfote Stufe 1 (0210)")
	_protokoll_leeren()
	await H.pfote_geklickt()
	_pruefe(_gesagt("P0_HINT_PIX_9995") and _gesagt("P0_HINT_PIX_0210"), "Wartezeile 9995 und Wiederholung")
	Z.spielzeit += 30.0
	await H.pfote_geklickt()
	_pruefe(_gesagt("P0_HINT_PIX_0220") and H.stufe("P2") == 2, "Pfote Stufe 2 nach 30 s")

	# Pixel als Gegenstand auf den Zapp-O-Mat (1120)
	_spiel().pixel_portraet_geklickt()
	_pruefe(_spiel().pixel_als_gegenstand, "Pixel-Porträt nach P1 als Gegenstand")
	await _raum().get_prop("ZappOMat").on_click()
	_pruefe(_gesagt("P0_DACH_PIX_1120"), "Pixel auf Zapp-O-Mat 1120")

	# Zapp-O-Mat ansehen nach P1: 0410–0440 einmalig
	await _ansehen(_raum().get_prop("ZappOMat"), "P0_DACH_MAX_0410")
	_pruefe(_gesagt("P0_DACH_OPA_0440"), "Schnee-Szene 0420–0440")

	# --- P2: Bügel biegen, Antenne auf den Zapp-O-Mat ---
	var buegel = _item("Drahtkleiderbuegel")
	await buegel.on_item_used(buegel)
	_pruefe(_gesagt("P0_DACH_MAX_0470") and buegel.zustand() == "antenne", "Bügel zur Antenne gebogen")
	_pruefe(buegel.description == TranslationServer.translate("UI_OBJ_ANTENNE"), "Name wechselt zu Antenne")
	await _benutze("Drahtkleiderbuegel", _raum().get_prop("ZappOMat"), "P0_DACH_MAX_0480")
	_pruefe(Z.geloest("P2"), "P2 gelöst")
	_pruefe(_gesagt("P0_DACH_OPA_0610"), "Opa 0610 nach P2")
	_pruefe(not _i().is_item_in_inventory("Drahtkleiderbuegel"), "Antenne verbraucht")
	_pruefe(_raum().get_prop("ZappOMat").current_frame == 3, "Zapp-O-Mat bunt nach P2")
	_pruefe(Z.status("P3") == "offen" and H.schritt_waehlen() == "P3", "P3 offen, Pfote wählt P3")
	await _rundreise("nach P2")

	# --- P3: Kalender, Opa, Drehknopf ---
	await _hotspot("Drehknopf").on_click()
	_pruefe(_gesagt("P0_DACH_MAX_0680"), "Drehknopf ohne Nummer: Kanal 4 (0680)")
	await _ansehen(_hotspot("Kalender"), "P0_DACH_MAX_0620")
	_pruefe(not opa_d.option_sichtbar("0640"), "Opa-Option 0640 vor der Nahansicht verborgen")
	await _ansehen(_hotspot("Kalender"), "P0_DACH_MAX_0630")
	_pruefe("kalender" in Z.nahansichten, "Nahansicht Kalender gesehen")
	_pruefe(opa_d.option_sichtbar("0640"), "Opa-Option 0640 nach der Nahansicht")
	await opa_d.waehlen("0640")
	_pruefe(_gesagt("P0_DACH_OPA_0650") and _gesagt("P0_DACH_PIX_0660"), "Kreis-Gespräch 0650/0660")
	await _rundreise("vor P3")

	var ende := [false]
	_spiel().prolog_beendet.connect(func(): ende[0] = true)
	await _hotspot("Drehknopf").on_click()
	_pruefe(Z.geloest("P3"), "P3 gelöst")
	_pruefe(_gesagt("P0_DACH_PIX_0880"), "Reisetasche-Szene bis 0880")
	for sn in ["Reisetasche", "Notizbuch", "OpasZettel", "Thunfischdose", "Dosenoeffner"]:
		_pruefe(_i().is_item_in_inventory(sn), "Inventar am Ende: " + sn)
	_pruefe(ende[0], "Prolog beendet (Signal)")
	_pruefe(Z.offene_schritte().is_empty(), "keine offenen Schritte mehr")
	await _ansehen_item("OpasZettel", "P0_DACH_MAX_0840")
	await _rundreise("Ende")
	await _figurenwechsel_technik()
	_pruefe(_spiel().protokoll.all(func(b): return TranslationServer.translate(b) != b),
		"alle gesagten Blasen haben Text in texte.csv")


## Figurenwechsel ist im Prolog gesperrt; die Technik wird hier mit „welt-1“ als Abschnitt
## geprüft (Pixel ist dort spielbar), danach wird alles zurückgestellt.
func _figurenwechsel_technik() -> void:
	var Z = _zustand()
	var max_c: PopochiuCharacter = _c().get_character("Max")
	var pixel: PopochiuCharacter = _c().get_character("Pixel")
	Z.abschnitt = "welt-1"
	_pruefe(_spiel().wechsel_moeglich(), "Figurenwechsel technisch möglich (Welt 1)")
	# Gegenstände nur bei der aktiven Figur hinzufügen oder entfernen: bei einer anderen Figur
	# wartet Popochiu 2.2.1 auf die Inventar-Leiste, die nur die aktive Figur zeigt.
	await _item("Dosenoeffner").remove()
	_pruefe(_spiel().figur_wechseln() and _c().player == pixel, "Wechsel zu Pixel")
	_pruefe(_spiel().kann_aufnehmen(pixel), "Pixel kann einen Gegenstand tragen")
	await _item("Dosenoeffner").add()
	_pruefe(_i().is_item_in_inventory("Dosenoeffner", pixel), "Pixel trägt den Dosenöffner")
	_pruefe(not _i().is_item_in_inventory("Dosenoeffner", max_c), "Max trägt ihn nicht mehr")
	_pruefe(not _spiel().kann_aufnehmen(pixel), "Pixel trägt höchstens einen Gegenstand")
	_pruefe(_spiel().kann_aufnehmen(max_c), "Max trägt beliebig viel")
	# Keine Rundreise hier: Laden setzt den Abschnitt aus dem Raum zurück auf „prolog“, und
	# Laden mit Pixel als aktiver Figur meldet Fehler in der SimpleClick-Leiste (siehe Bericht).
	await _item("Dosenoeffner").remove()
	_pruefe(_spiel().figur_wechseln() and _c().player == max_c, "Wechsel zurück zu Max")
	await _item("Dosenoeffner").add()
	Z.abschnitt = "prolog"


#endregion

#region Speichern und Laden ########################################################################
## Speichert, verändert den Zustand, lädt und vergleicht mit dem gespeicherten Stand.
func _rundreise(wo: String) -> void:
	var st = root.get_node("Spielstand")
	await _warte_bis(func(): return not st.beschaeftigt(), 10.0)
	var vorher := _schnappschuss()
	var ok: bool = st.speichern(SLOT, "Test " + wo)
	_pruefe(ok and _datei_da(SLOT), "Speichern (%s)" % wo)
	var kopf: Dictionary = st.saveload.kopf_lesen(SLOT)
	_pruefe(int(kopf.get("version", 0)) == CQSaveLoad.VERSION, "Versionsnummer im Spielstand (%s)" % wo)
	# absichtlich verfälschen
	_zustand().setze("TEST_SCHMUTZ")
	_zustand().hinweis_stufe["P9"] = 3
	await st.laden(SLOT)
	await _warte_bis(func(): return not _e().in_room, 3.0)
	await _warte_bis(func(): return _e().in_room and _e().loaded_game.is_empty(), 10.0)
	for i in 5:
		await process_frame
	var nachher := _schnappschuss()
	for k in vorher:
		_pruefe(vorher[k] == nachher[k], "Rundreise %s: %s gleich\n      vorher  %s\n      nachher %s"
			% [wo, k, vorher[k], nachher[k]])


func _schnappschuss() -> Dictionary:
	var z: Dictionary = _zustand().speichern()
	z.erase("spielzeit")
	var inv := {}
	for c in ["Max", "Pixel"]:
		var ch: PopochiuCharacter = _c().get_character(c)
		var namen: Array = ch.inventory.keys()
		namen.sort()
		inv[c] = namen
	return {
		zustand = JSON.stringify(z, "", true),
		inventar = inv,
		raum = _raum_name(),
		aktive_figur = _c().player.script_name,
		pixel_pos = _c().get_character("Pixel").position if _raum_name() == "Dachboden" else Vector2.ZERO,
		zapp = _raum().get_prop("ZappOMat").current_frame if _raum_name() == "Dachboden" else -1,
	}


func _datei_da(slot: int) -> bool:
	return FileAccess.file_exists(CQSaveLoad.platz_pfad(slot))


func _ordner_leeren() -> void:
	var d := DirAccess.open(CQSaveLoad.ordner)
	if d:
		for f in d.get_files():
			d.remove(f)


#endregion

#region Hilfen
func _ueberlagerung_schliessen(n: Node) -> void:
	if n.has_signal("geschlossen") and n.has_method("schliessen"):
		await create_timer(0.5).timeout
		if is_instance_valid(n):
			print("  (Test schließt %s)" % n.name)
			n.schliessen()


 #####################################################################################
func _pruefe(bedingung: bool, text: String) -> void:
	_pruefungen += 1
	if bedingung:
		print("  ok    ", text.get_slice("\n", 0))
	else:
		print("  FEHLT ", text)
		fehler.append(text.get_slice("\n", 0))


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true


func _warte_auf_raum(sn: String) -> void:
	var ok := await _warte_bis(
		func(): return _raum_name() == sn and _e().in_room and _raum().is_current, 15.0
	)
	_pruefe(ok, "Raum %s erreicht" % sn)
	for i in 3:
		await process_frame


func _ansehen(obj: Node, zeile: String) -> void:
	await obj.on_right_click()
	_pruefe(_gesagt(zeile), "Ansehen %s: %s" % [obj.name, zeile])


func _ansehen_item(sn: String, zeile: String) -> void:
	await _item(sn).on_right_click()
	_pruefe(_gesagt(zeile), "Ansehen %s: %s" % [sn, zeile])


func _nehmen(prop_name: String, zeile: String) -> void:
	await _raum().get_prop(prop_name).on_click()
	_pruefe(_gesagt(zeile) and _i().is_item_in_inventory(prop_name), "Nehmen %s (%s)" % [prop_name, zeile])


func _benutze(item_sn: String, ziel: Node, zeile: String) -> void:
	_i().active = _item(item_sn)
	await ziel.on_item_used(_item(item_sn))
	_i().active = null
	_pruefe(_gesagt(zeile), "%s auf %s: %s" % [item_sn, ziel.name, zeile])


func _gesagt(b: String) -> bool:
	return b in _spiel().protokoll


func _protokoll_leeren() -> void:
	_spiel().protokoll.clear()


func _spiel():
	return root.get_node("Spiel")


func _zustand():
	return root.get_node("Zustand")


func _hinweise():
	return root.get_node("Hinweise")


func _e():
	return root.get_node("E")


func _c():
	return root.get_node("C")


func _i():
	return root.get_node("I")


func _raum() -> PopochiuRoom:
	return root.get_node("R").current


func _raum_name() -> String:
	var r := _raum()
	return r.script_name if is_instance_valid(r) else ""


func _hotspot(n: String) -> PopochiuHotspot:
	return _raum().get_hotspot(n)


func _item(sn: String):
	return _i().get_item_instance(sn)


func _dialog(sn: String):
	return root.get_node("D").get_instance(sn)


#endregion
