extends SceneTree
## Headless-Anspieltest für das Finale (Graubox): Heimkehr, verriegelte Luke, Hilferuf, die vier
## Schritte des letzten Rätsels (ohne Modell 08/15: Kochlöffel in die Ofentür), Auflösung,
## Wohnzimmer, Supermarkt und Abspann. Prüft, dass skripte/finale.gd mit den gebauten Räumen
## zusammenspielt.
##
## Aufruf: godot --headless --path game -s res://tests/finale_anspiel.gd

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
	# Aus Welt 4 bringt Max die Goldene Fernbedienung mit, aus Welt 1 den Kochlöffel
	await _warte_bis(func(): return not _e().in_room or _raum().is_current, 5.0)
	for g in ["goldene_fernbedienung", "kochloeffel"]:
		await S.geben(_sn(g))
	await S.finale_beginnen()
	await _warte_auf_raum("dachboden")
	await _warte_bis(func(): return _gesagt("FI_RIEG_OPA_0010"), 15.0)
	_pruefe(Z.ist("FINALE") and Z.abschnitt == "finale", "Finale läuft im Abschnitt finale")
	_pruefe(_gesagt("FI_DACH_NAR_0010") and _gesagt("FI_DACH_MAX_0280"), "Heimkehr-Szene (FI_DACH 0010–0280)")
	_pruefe(not _hat("goldene_fernbedienung") and Z.wert("FI_FERNBEDIENUNG") == "grau_ohne_zelle",
		"Fernbedienung bei Opa, ohne Zelle")
	_pruefe(_hotspot("maschine").visible and _hotspot("fundkiste").visible, "Maschine und Fundkiste sichtbar")
	var klang = root.get_node("Klang")
	_pruefe(klang.aktuelle_musik == "finale_maschine", "Ton: Mit der Maschine setzt finale_maschine ein (%s)" % klang.aktuelle_musik)
	_pruefe(klang.musik_fuer_raum("dachboden") == "gegenwart" and S.regel_wert("musik", "dachboden") == "finale_maschine",
		"Ton: Dachboden im Finale spielt nach dem Laden wieder finale_maschine")
	_pruefe(klang.aktuelle_atmo == "uhr_ticken", "Ton: Gegenwart tickt (%s)" % klang.aktuelle_atmo)

	_pruefe(not S.wechsel_moeglich(), "Vor dem Hilferuf kein Figurenwechsel")

	# Schritt 0: Luke verriegelt, dann der Hilferuf über alle vier Kanäle
	S.vorgabe_auswahl = [0, 0, 0, 0]
	await S.regel("ausgang", _hotspot("bodenluke"))
	_pruefe(Z.ist("FI_LUKE_ERKANNT") and Z.ist("FI_HILFERUF"), "F1: Luke erkannt, Hilferuf abgeschlossen")
	_pruefe(_gesagt("FI_RUF_ZEL_0040") and _gesagt("FI_RUF_KAL_0200") and _gesagt("FI_RUF_FLI_0250"),
		"Alle vier Kanäle (ohne Modell 08/15: Kalle)")
	_pruefe(_raum().has_character("Zeldina") and not _raum().has_character("Modell0815"), "Zeldina ist da")

	# A: Zeldina erklärt den Riegel
	S.vorgabe_auswahl = [2]
	await S.regel("benutzen", C().get_character("Zeldina"))
	_pruefe(Z.geloest("F1a"), "F1a: Riegel")
	# Noch einmal fragen: Ohne Modell 08/15 zählt Max den Roboter nicht mit (0095 statt 0090)
	S.vorgabe_auswahl = [2]
	await S.regel("benutzen", C().get_character("Zeldina"))
	_pruefe(_gesagt("FI_RAET_MAX_0095") and not _gesagt("FI_RAET_MAX_0090"),
		"Zeldina nach Schritt A: Fassung ohne Roboter")
	# B: Kochlöffel in die Ofentür
	await S.regel("gegenstand", _hotspot("ofentuer"), _i().get_item_instance(_sn("kochloeffel")))
	_pruefe(Z.geloest("F1b"), "F1b: Ofentür mit dem Kochlöffel")
	# C: Fernbedienung unter dem Sessel, die Zelle holt Pixel. Über die echte Bedienung, so wie
	# Skript und Hinweise es verlangen (FI_RAET_PIX_0200, FI_HINT_PIX_0130): Klick auf den Sessel,
	# Klick auf Pixels Porträt, als Pixel Klick auf den Sessel, Klick auf Max' Porträt.
	await _hotspot("ohrensessel").on_click()
	_pruefe(_hat("goldene_fernbedienung"), "Fernbedienung zurück")
	await _hotspot("ohrensessel").on_click()
	_pruefe(_gesagt("FI_RAET_PIX_0200"), "Pixel fordert den Figurenwechsel")
	S.hud._pixel.pressed.emit()
	await _warte_bis(func(): return C().player.script_name == "Pixel" and S.in_szene == 0 and not _e().playing_queue, 5.0)
	_pruefe(C().player.script_name == "Pixel", "Klick auf Pixels Porträt wechselt zu Pixel")
	await _hotspot("ohrensessel").on_click()
	_pruefe(Z.ist("FI_ZELLE_IM_MAUL"), "Pixel hat die Zelle im Maul")
	S.hud._max.pressed.emit()
	await _warte_bis(func(): return _hat("energiezelle"), 5.0)
	_pruefe(C().player.script_name == "Max" and _hat("energiezelle"), "Klick auf Max' Porträt: Zelle in Max' Inventar")
	await S.regel("kombinieren", _i().get_item_instance(_sn("energiezelle")),
		_i().get_item_instance(_sn("goldene_fernbedienung")))
	_pruefe(Z.geloest("F1c") and Z.wert("FI_FERNBEDIENUNG") == "zuendkapsel", "F1c: Zündkapsel")
	# D: erst eine falsche Taste, dann die rote
	S.vorgabe_auswahl = [0]
	await S.regel("gegenstand", _hotspot("empfaenger"), _i().get_item_instance(_sn("goldene_fernbedienung")))
	_pruefe(_gesagt("FI_RAET_NAR_0290") and not Z.geloest("F1d"), "Lauter: falsche Taste")
	# rote Taste; danach fragt der Spieler die vier Dinge selbst ab: Zelle, Ei, Korn, zuletzt die Fernbedienung
	S.vorgabe_auswahl = [3, 2, 0, 0, 0]
	S.regel("gegenstand", _hotspot("empfaenger"), _i().get_item_instance(_sn("goldene_fernbedienung")))
	await _warte_auf_raum("wohnzimmer")
	_pruefe(Z.geloest("F1d") and _gesagt("FI_AUFL_PIX_0560"), "F1d und Auflösung")
	var reihe := ["FI_AUFL_OPA_0160", "FI_AUFL_OPA_0120", "FI_AUFL_OPA_0140", "FI_AUFL_OPA_0180", "FI_AUFL_NAR_0190"]
	var stellen := reihe.map(func(z): return S.protokoll.find(z))
	var sortiert := stellen.duplicate()
	sortiert.sort()
	_pruefe(not stellen.has(-1) and stellen == sortiert and S.vorgabe_auswahl.is_empty(),
		"Auflösung: vier Dinge in gewählter Reihenfolge, Fernbedienung zuletzt")
	await _warte_bis(func(): return _gesagt("FI_WOHN_PIX_0060"), 10.0)
	_pruefe(_raum().has_character("Oma") and _hotspot("kuchen").visible, "Geburtstag im Wohnzimmer")
	_pruefe(klang.aktuelle_musik == "finale_geburtstag" and S.regel_wert("musik", "dachboden") == "finale_geburtstag",
		"Ton: ab der Auflösung finale_geburtstag (%s)" % klang.aktuelle_musik)

	# Mutter, Abspann-Szene, Supermarkt, Abspann
	S.regel("benutzen", C().get_character("Oma"))
	await _warte_auf_raum("supermarkt")
	_pruefe(_gesagt("FI_WOHN_MUT_0230") and _gesagt("FI_ABSP_MAX_0030"), "Mutter und Abspann-Szene")
	_pruefe(klang.aktuelle_musik == "" and "musik/stille" in klang.protokoll and klang.aktuelle_atmo == "kuehlregal",
		"Ton: Supermarkt ohne Stück, mit Kühlregal (%s, %s)" % [klang.aktuelle_musik, klang.aktuelle_atmo])
	_pruefe("geraeusch/tuergong" in klang.protokoll, "Ton: Türgong am Supermarkt")
	await S.regel("benutzen", _hotspot("automatische_tuer"))
	_pruefe(Z.ist("FI_ENDE_GESEHEN") and S.hauptmenue_angefragt, "Abspann gesehen, zurück ins Hauptmenü")
	var folge := ["musik/titel", "musik/abspann", "musik/lied_waldemar"].map(func(m): return klang.protokoll.find(m))
	_pruefe(not folge.has(-1) and folge[0] < folge[1] and folge[1] < folge[2],
		"Ton: Titelthema mit der Schwarzblende, dann Abspann, dann Waldemars Nummer %s" % [folge])


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
