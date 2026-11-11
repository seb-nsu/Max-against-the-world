extends SceneTree
## Headless-Test der Ton-Verdrahtung (04-audio.md, skripte/klang_einsatz.gd): Geräusche zu
## Skriptzeilen, Objekten und Gegenständen, Laute statt Stimme, Schritte, Atmosphäre je Raum,
## Tupfer und „kein Stück“. Geprüft wird das Protokoll des Autoloads „Klang“; headless spielt nichts.
##
## Aufruf: godot --headless --path game -s res://tests/ton.gd

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
const EINSATZ := "res://skripte/klang_einsatz.gd"

var fehler: Array[String] = []
var _pruefungen := 0


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	_spiel().testmodus = true
	CQSaveLoad.ordner = "user://test_saves/%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
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
	var K = root.get_node("Klang")
	var Z = root.get_node("Zustand")
	var E = load(EINSATZ)

	# Tabellen: jede Zeile gibt es, jeder Wert ist eine Kennung
	var ohne := []
	for tabelle in [E.ZEILE, E.MUSIK]:
		for zeile in tabelle:
			if TranslationServer.translate(zeile) == zeile:
				ohne.append(zeile)
	_pruefe(ohne.is_empty(), "Jede Zeile der Tabellen steht im Skript %s" % [ohne])
	_pruefe(E.fuer_ereignis("benutzen", "terminal", "") == "terminal", "Objekt: Terminal piept")
	_pruefe(E.fuer_ereignis("gegenstand", "laser", "gummihuhn") == "gummihuhn", "Gegenstand auf Objekt: das Huhn quietscht")
	_pruefe(E.fuer_ereignis("gegenstand", "badewanne", "krone") == "", "Gegenstand ohne Eintrag: das Objekt allein spielt nichts")
	_pruefe(E.fuer_ereignis("kombinieren", "kochloeffel", "portalgeraet") == "portalgeraet", "Kombinieren: Geräusch des Gegenstands")
	_pruefe(E.fuer_ereignis("ansehen", "terminal", "") == "", "Ansehen spielt nichts")
	_pruefe(E.schritt("wohnzimmer", false) == "schritt_teppich" and E.schritt("wohnzimmer", true) == "",
		"Schritte: Max auf Teppich, Pixel dort ohne")
	_pruefe(E.schritt("dachboden", true) == "pfoten_holz" and E.schritt("sphinx", false) == "sand_schritte"
		and E.schritt("agora", false) == "schritt_stein", "Schritte: Pfoten auf Holz, Sand, Stein")

	# Prolog: Atmosphäre, Fernseher, Schritte
	_pruefe(K.aktuelle_atmo == "uhr_ticken" and K.aktuelle_musik == "gegenwart", "Wohnzimmer: Uhr tickt unter dem Stück")
	K.protokoll.clear()
	await S.regel("benutzen", _hotspot("fernseher"))
	_pruefe("geraeusch/fernseher_an" in K.protokoll, "Fernseher benutzen: fernseher_an")
	var c = root.get_node("C")
	c.player.is_moving = true
	S._schritte(1.0)
	S._schritte(0.1)
	c.player.is_moving = false
	S._schritte(1.0)
	_pruefe(K.protokoll.count("geraeusch/schritt_teppich") == 1, "Max läuft: ein Schritt je Takt, im Stehen keiner")
	await S.sagen("MAX", "P0_DACH_MAX_0280")
	_pruefe(K.protokoll.back() == "geraeusch/dosenoeffner", "Zeile „Und … Zisch.“: Dosenöffner")
	await S.wechsel_regel("pixel_nehmen")
	_pruefe("geraeusch/pixel_miau" in K.protokoll, "Pixel kann etwas nicht: Miau")
	var in_szene: int = S.in_szene  # die Einstiegsszene des Prologs zählt noch
	S.in_szene = 0
	var gewechselt: bool = S.figur_wechseln()
	S.in_szene = in_szene
	_pruefe(not gewechselt and "geraeusch/fehler" in K.protokoll, "Wechsel im Prolog geht nicht: Fehler-Ton (in_szene %d, Schlange %s)" % [S.in_szene, root.get_node("E").playing_queue])

	# Welt 1: Laute statt Stimme, Atmosphäre je Raum, Tupfer, gesungenes Stück
	S.welt_beginnen("welt-1")
	await _warte_auf_raum("dorfplatz")
	await _warte_bis(func(): return not root.get_node("E").playing_queue and S.in_szene == 0, 20.0)
	_pruefe(K.aktuelle_atmo == "w1_atmo", "Dorfplatz: Grundatmosphäre Welt 1 (%s)" % K.aktuelle_atmo)
	K.protokoll.clear()
	await S.sagen("ZIE", "W1_SCHM_ZIE_0290")
	await S.sagen("XXL", "W1_DORF_XXL_0940")
	_pruefe(K.protokoll == ["geraeusch/ziege", "geraeusch/ziege"], "Ziegen meckern als Geräusch %s" % [K.protokoll])
	_pruefe(E.LAUT_TONHOEHE.get("XXL", 1.0) < 1.0 and E.hat_laut("XXL") and not E.hat_laut("MAX"), "XXL-Ziege tiefer; Max hat keinen Laut")
	K.protokoll.clear()
	await S.sagen("MIN", "W1_TAV_MIN_0910")
	await S.sagen("MIN", "W1_TAV_MIN_0960")
	await S.sagen("MAX", "W1_SCHM_MAX_0110")
	_pruefe(K.protokoll == ["geraeusch/pixel_fauchen", "geraeusch/pixel_schnurren", "geraeusch/amboss"],
		"Minka faucht und schnurrt, der Amboss klingt %s" % [K.protokoll])
	await _geh("taverne")
	_pruefe(K.aktuelle_atmo == "taverne_stimmen", "Taverne: eigene Atmosphäre")
	await _geh("schmiede")
	_pruefe(K.aktuelle_atmo == "" and "atmo/keine" in K.protokoll, "Schmiede: keine Atmosphäre, nur Musik")
	await _geh("wasserschloss")
	_pruefe(K.aktuelle_atmo == "w1_atmo" and K.aktueller_tupfer == "frosch", "Wasserschloss: Grundatmosphäre mit Frosch")
	K.protokoll.clear()
	K._tupfer_in = 0.0
	K._process(0.1)
	_pruefe(K.protokoll == ["geraeusch/frosch"] and K._tupfer_in >= K.TUPFER_ABSTAND[0], "Tupfer: der Frosch quakt, der nächste kommt später")
	await _geh("bergwerk")
	_pruefe(K.aktuelle_musik == "w1_bergwerk" and K.aktueller_tupfer == "", "Bergwerk: Raum-Stück, kein Tupfer mehr")
	await S.sagen("GO1", "W1_BERG_GO1_0620")
	_pruefe(K.aktuelle_musik == "lied_goblin", "Arbeitslied setzt mit seiner Zeile ein")
	await S.sagen("MAX", "W1_BERG_MAX_0640")
	_pruefe(K.aktuelle_musik == "w1_bergwerk", "Nach dem Lied wieder das Stück des Raums")

	# Welt 4: Jingle aus der Tabelle, Gegenstand, kein Stück
	K.protokoll.clear()
	await S.sagen("MAX", "W4_SIT_MAX_0030")
	_pruefe(K.protokoll == ["jingle/lachkonserve"], "„Jemand lacht“: Lachkonserve als Jingle %s" % [K.protokoll])
	K.einsatz(E.fuer_ereignis("benutzen_inventar", "taste_rueckspulen", ""))
	_pruefe(K.protokoll.back() == "geraeusch/rueckspulen", "Taste Zurückspulen")
	K.musik("titel")
	K.musik_aus()
	_pruefe(K.aktuelle_musik == "" and K.protokoll.back() == "musik/stille", "Kein Stück: Musik blendet aus")
	K.atmo("")
	_pruefe(K.aktuelle_atmo == "", "Atmosphäre aus")
	Z.abschnitt = "welt-3"
	K.protokoll.clear()
	K.zeilen_klang("OPA", "W3_KAM1_OPA_0100")
	_pruefe(K.protokoll == ["geraeusch/hologramm"], "Opa in Welt 3: Hologramm zur Stimme")
	K.protokoll.clear()
	K.zeilen_klang("PIE", "W3_PIEP_PIE_0060")
	_pruefe(K.protokoll == ["geraeusch/piepsi"], "Piepsi piept")


#region Hilfen #####################################################################################
func _geh(rid: String) -> void:
	var sn: String = root.get_node("Bauplan").raum_script_name(rid)
	await _spiel().raum_wechseln_und_warten(sn)
	await _warte_bis(func(): return not root.get_node("E").playing_queue and _spiel().in_szene == 0, 20.0)


func _pruefe(bedingung: bool, text: String) -> void:
	_pruefungen += 1
	if bedingung:
		print("ok      ", text)
	else:
		fehler.append(text)
		print("FEHLER  ", text)


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var start := Time.get_ticks_msec()
	while not bed.call():
		if Time.get_ticks_msec() - start > max_s * 1000.0:
			return false
		await process_frame
	return true


func _warte_auf_raum(rid: String) -> void:
	var ok := await _warte_bis(func():
		var r = root.get_node("R").current
		return root.get_node("E").in_room and is_instance_valid(r) and r.has_method("raum_id") and r.raum_id() == rid, 20.0)
	_pruefe(ok, "Raum %s erreicht" % rid)


func _spiel():
	return root.get_node("Spiel")


func _hotspot(id: String) -> PopochiuHotspot:
	var raum = root.get_node("R").current
	for h in raum.get_hotspots():
		if h.has_method("objekt_id") and h.objekt_id() == id:
			return h
	return raum.get_hotspot(id.to_pascal_case())
#endregion
