extends SceneTree
## Review 20.11. (Game Designer): Welt 3 auf Hinweis-Lücken, Reihenfolge, Sackgassen und Laden.
## Nur Beobachtung: jede Zeile „BEFUND“ wird in der Notiz ausgewertet.
## Aufruf: godot --headless --path game -s res://tests/_review_gd_w3_szenarien.gd -- <szenario>
## Szenarien: haupt (Einstieg, Hinweise, Büroturm-Budget, R7 umgehen, Kammer 1, Regel 1, Fenster),
##            laden (Spielstand bei getrennten Figuren)

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var _ersatz: Array = []
var _mark := 0


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	_spiel().testmodus = true
	CQSaveLoad.ordner = "user://test_saves/%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return _e().in_room, 15.0)
	_spiel().ersatz_gesagt.connect(func(k, z): _ersatz.append(z))
	var args := OS.get_cmdline_user_args()
	var sz: String = args[0] if args.size() > 0 else "haupt"
	if sz == "laden":
		await _laden()
	else:
		await _haupt()
	print("ENDE")
	if is_instance_valid(current_scene):
		current_scene.queue_free()
	for i in 3:
		await process_frame
	quit(0)


func _b(text: String) -> void:
	print("BEFUND ", text)


func _tr(k: String) -> String:
	return TranslationServer.translate(k)


## Zeilen seit der letzten Marke (Spiel.protokoll), mit deutschem Text
func _neu() -> String:
	var p: Array = _spiel().protokoll
	var out := []
	for i in range(_mark, p.size()):
		out.append("%s „%s“" % [p[i], _tr(p[i]).left(90)])
	_mark = p.size()
	return " | ".join(out)


func _marke() -> void:
	_mark = _spiel().protokoll.size()


func _pfote_info(wo: String) -> void:
	var H = root.get_node("Hinweise")
	var Z = _zustand()
	var s: String = H.schritt_waehlen()
	var zeile := ""
	if not s.is_empty():
		zeile = H._zeile(H._schritt(s), maxi(1, H.stufe(s)))
	else:
		zeile = H._nichts_offen_zeile()
	_b("%s [Raum %s, Spieler %s]: offen=%s, Pfote-Schritt=%s, Zeile=%s „%s“" % [wo, _raum_id(),
		"Pixel" if _spiel().ist_pixel() else "Max", Z.offene_schritte(), s, zeile, _tr(zeile)])


func _regeln_obj():
	return _spiel().regeln()


func _budget() -> String:
	var t: Dictionary = _regeln_obj()._tausch
	return "raum=%s budget=%s geloest=%s" % [t.get("raum", ""), t.get("budget", "?"), t.get("geloest", [])]


func _tauschliste(rid: String) -> Array:
	var r = _regeln_obj()
	return r.TAUSCHE.get(rid, []).filter(func(t):
		return (not t.has("braucht") or _hat(t.braucht)) and not t.get("loesung", "") in r._tausch.get("geloest", [])).map(
		func(t): return _tr(t.text))


func _bis_simulation() -> void:
	var S = _spiel()
	var Z = _zustand()
	for sn in ["Notizbuch", "Thunfischdose", "Kochloeffel"]:
		await S.geben(sn)
	S.welt_beginnen("welt-3")
	await _warte_auf_raum("unterstadt_strasse")
	await _warte_bis(func(): return _gesagt("W3_ANK_PIX_0110"), 10.0)


func _haupt() -> void:
	var S = _spiel()
	var Z = _zustand()
	await _bis_simulation()
	await _pfote_info("A1 Ankunft")
	for f in ["frau_regenschirm", "strassenmusiker_w3", "weinender_mann"]:
		await S.regel("ansehen", f)
	await _pfote_info("A2 nach R1a")
	S.vorgabe_auswahl = [1, 1, 1]
	await S.regel("nach_option", "deckert", "0090")
	S.vorgabe_auswahl = [0, 2]
	await S.regel("nach_option", "herr_vier", "0090")
	_b("A3 R1b=%s R2=%s, Apothekengasse besucht=%s" % [Z.geloest("R1b"), Z.geloest("R2"), Z.war_in("apothekengasse")])
	await _pfote_info("A3 nach R1b und R2, Gasse noch nie betreten")

	# R3a so, wie Pfote Stufe 2/3 es sagt: zu Pixel wechseln, zweimal am Automaten vorbei, zurück, Automat
	await _geh("apothekengasse")
	await _pfote_info("A4 Gasse betreten, Symptom noch unbekannt")
	await S.regel("nach_option", "morphaeus", "0480")
	await _pfote_info("A5 Symptom bekannt")
	_b("B1 Wechsel in der Gasse möglich=%s" % S.wechsel_moeglich())
	S.figur_wechseln(false)
	await _warte_bis(func(): return S.ist_pixel(), 3.0)
	_marke()
	var r1 = await S.regel("benutzen", "automat")
	var r2 = await S.regel("benutzen", "automat")
	_b("B2 Pixel benutzt Automat zweimal (Hinweis-Weg): behandelt=%s/%s, Zeilen=%s, PIXEL_EINMAL=%s PIXEL_DOPPELT=%s" % [
		r1, r2, _neu(), Z.ist("W3_PIXEL_EINMAL"), Z.ist("W3_PIXEL_DOPPELT")])
	var gw = await S.regel("benutzen", "gehweg")
	_b("B3 Pixel benutzt „gehweg“ in der Gasse: behandelt=%s (Hotspot vorhanden=%s)" % [gw, _objekt("gehweg") != null])
	S.figur_wechseln(false)
	await _warte_bis(func(): return not S.ist_pixel(), 3.0)
	_marke()
	S.vorgabe_auswahl = [2, 2]
	await S.regel("benutzen", "automat")
	var z1 := _neu()
	await S.regel("benutzen", "automat")
	_b("B4 Max am Automaten nach dem Hinweis-Weg: 1. Klick=%s ; 2. Klick (Option 3 „Déjà-vu“)=%s ; R3a=%s" % [z1, _neu(), Z.geloest("R3a")])
	# richtiger Weg: Max benutzt Pixel
	await S.regel("benutzen", "pixel")
	S.vorgabe_auswahl = [2]
	await S.regel("benutzen", "automat")
	_b("B5 Weg über „Max benutzt Pixel“: R3a=%s" % Z.geloest("R3a"))
	S.regel("benutzen_inventar", "rote_pastille")
	await _warte_auf_raum("stadtstrasse")
	await _pfote_info("A6 erste Ankunft in der Simulation")
	await S.regel("ansehen", "tuer")
	await S.regel("ansehen", "tuer")
	S.vorgabe_auswahl = [0]
	_marke()
	await S.regel("benutzen", "tuer")
	_b("C0 R5 Tutorial-Zeilen: %s" % _neu())
	# Küche einmal betreten (R4 offen), nicht lösen
	await _geh("kueche_orakel")
	await _geh("stadtstrasse")

	# Büroturm ohne Tasse: Budget verbrauchen, dann raus?
	await _geh("buero_50")
	await _pfote_info("A7 Büroturm betreten, ohne Tasse, R4 offen")
	_b("C1 Tauschliste ohne Tasse: %s" % [_tauschliste("buero_50")])
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "klone")
	_marke()
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "klone")
	_b("C2 zwei Fehltausche ohne Tasse: %s, Zeilen=%s" % [_budget(), _neu()])
	var aus := _objekt("ausgang_stadtstrasse")
	var gesperrt = await S.regel("ausgang", aus if aus else "ausgang_stadtstrasse")
	_b("C3 Ausgang des Turms: gesperrt=%s, Zeile=%s" % [gesperrt, _neu()])
	await S.geben(_sn("kaffeetasse"))
	_b("C4 Tauschliste mit Tasse, Budget leer: %s / %s" % [_tauschliste("buero_50"), _budget()])
	await S.regel("benutzen", "klone")
	_b("C5 Code-Sicht mit leerem Budget: %s" % _neu())
	await _wechsel("widerstandsbasis")
	await _wechsel("buero_50")
	_b("C6 nach Figurenwechsel hin und zurück: %s, Zeilen=%s" % [_budget(), _neu()])
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "klone")
	await S.regel("benutzen_inventar", "kaffeetasse")
	_b("C7 R6a=%s R6b=%s Akte=%s REGEL_1=%s" % [Z.geloest("R6a"), Z.geloest("R6b"), _hat("schmidts_akte"), Z.ist("W3_REGEL_1")])
	await _pfote_info("A8 Büroturm nach R6b, R13 offen, R4 offen")

	# R7 umgehen: Pixel schüttelt die Kapsel
	await _wechsel("widerstandsbasis")
	_marke()
	S.regel("benutzen", "max_kapsel")
	await _warte_bis(func(): return not S.ist_pixel() and Z.wert("W3_EBENE") == "realitaet", 10.0)
	await _warte_auf_raum("widerstandsbasis")
	_b("D1 Kapsel geschüttelt im Büroturm-Zustand: Ebene=%s, Spieler=%s, R7a=%s R7b=%s, Zeilen=%s" % [
		Z.wert("W3_EBENE"), "Pixel" if S.ist_pixel() else "Max", Z.geloest("R7a"), Z.geloest("R7b"), _neu()])
	await _pfote_info("A9 wach in der Basis ohne R7")

	# R4 (mit Kochbuch), zurück über die Eieruhr
	S.vorgabe_auswahl = [0]
	S.regel("benutzen", "terminal")
	await _warte_auf_raum("stadtstrasse")
	await _geh("kueche_orakel")
	await S.regel("nach_option", "orakel_oma", "0150")
	await S.regel("ansehen", "kochbuch")
	S.regel("benutzen", "eieruhr")
	await _warte_auf_raum("widerstandsbasis")
	await _pfote_info("A10 nach R4, wach")
	# R12: erst die Kekse, dann der Glückskeks
	await _geh("unterstadt_strasse")
	_ersatz.clear()
	_marke()
	var rk = await S.regel("gegenstand", "herr_vier", "omas_kekse")
	_b("E1 Omas Kekse (Hundekuchen) an Herrn Vier: behandelt=%s, Zeilen=%s (W3_SUPP_MAX_0170 wäre die eigene Zeile)" % [rk, _neu()])
	await S.regel("gegenstand", "herr_vier", "rezeptkarte")
	await _geh("laboreingang")
	await _pfote_info("A11 Laboreingang betreten")
	await S.geben(_sn("telefonbuchseite"))
	await S.regel("gegenstand", "hausmeister", "telefonbuchseite")
	await S.regel("gegenstand", "kartenleser", "zugangskarte")
	await S.regel("benutzen", "datenanschluss")
	_b("E2 R12=%s R8=%s R9a=%s" % [Z.geloest("R12"), Z.geloest("R8"), Z.geloest("R9a")])
	await _pfote_info("A12 nach R9a")
	# Pixel öffnet das Fenster schon jetzt (als Gag, in der Realität)
	await _geh("widerstandsbasis")
	S.figur_wechseln(false)
	await _warte_bis(func(): return S.ist_pixel(), 3.0)
	await S.regel("benutzen", "fenster")
	S.figur_wechseln(false)
	await _warte_bis(func(): return not S.ist_pixel(), 3.0)
	_b("E3 Fenster vor dem Labor geöffnet: W3_SCHNEE=%s" % Z.ist("W3_SCHNEE"))

	# Kammer 1: Budget verbrauchen
	S.vorgabe_auswahl = [1]
	S.regel("benutzen", "terminal")
	await _warte_auf_raum("testkammer_1")
	_b("F1 Tauschliste Kammer 1: %s" % [_tauschliste("testkammer_1")])
	S.vorgabe_auswahl = [1]
	await S.regel("benutzen", "bernd")
	_marke()
	S.vorgabe_auswahl = [1]
	await S.regel("benutzen", "bernd")
	_b("F2 Kammer 1 zwei Fehltausche: %s, Zeilen=%s" % [_budget(), _neu()])
	var aus1 := _objekt("ausgang_testkammer_2")
	_b("F3 Ausgänge in Kammer 1: %s; Ausgang zu Kammer 2 offen=%s" % [
		_raum().get_hotspots().filter(func(h): return h.has_method("ziel")).map(func(h): return h.objekt_id()),
		aus1.call("offen") if aus1 else "kein Ausgang"])
	await _pfote_info("A13 Kammer 1, Budget leer")
	await _wechsel("widerstandsbasis")
	await _wechsel("testkammer_1")
	_b("F4 nach Figurenwechsel hin und zurück: %s" % _budget())
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "bernd")
	await _geh("testkammer_2")
	await S.regel("ansehen", "kritzelei")
	await S.geben(_sn("gummihuhn"))
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "laser")
	await _geh("testkammer_3")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "tuer")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "bernd")
	_b("F5 R9b=%s R9c=%s R9d=%s" % [Z.geloest("R9b"), Z.geloest("R9c"), Z.geloest("R9d")])

	# Kern: Akte nie angesehen
	await _geh("kern")
	_b("G0 Regeln: 1=%s 2=%s 3=%s, Akte im Inventar=%s" % [Z.ist("W3_REGEL_1"), Z.ist("W3_REGEL_2"), Z.ist("W3_REGEL_3"), _hat("schmidts_akte")])
	_marke()
	await S.regel("benutzen", "mutti")
	_b("G1 M.U.T.T.I. ansprechen ohne gelesene Akte: Zeilen=%s" % _neu())
	await _pfote_info("A14 Kern, Regel 1 fehlt")
	await S.regel("ansehen_inventar", "schmidts_akte")
	S.vorgabe_auswahl = [0, 1, 2]
	await S.regel("benutzen", "mutti")
	_b("G2 R10=%s, W3_SCHNEE=%s, ZELLE_KALT=%s (Fenster ist seit E3 offen)" % [Z.geloest("R10"), Z.ist("W3_SCHNEE"), Z.ist("W3_ZELLE_KALT")])
	await _pfote_info("A15 Kern nach R10")
	# Dem Hinweis folgen: zu Pixel wechseln, Fenster benutzen
	await _wechsel("widerstandsbasis")
	_marke()
	await S.regel("benutzen", "fenster")
	_b("G3 Pixel benutzt das Fenster (war offen): W3_SCHNEE=%s, Zeilen=%s" % [Z.ist("W3_SCHNEE"), _neu()])
	await _wechsel("kern")
	_b("G4 zurück im Kern: ZELLE_KALT=%s" % Z.ist("W3_ZELLE_KALT"))
	await _wechsel("widerstandsbasis")
	await S.regel("benutzen", "fenster")
	await _wechsel("kern")
	_b("G5 Fenster wieder auf, zurück im Kern: ZELLE_KALT=%s, Zeilen=%s" % [Z.ist("W3_ZELLE_KALT"), _neu()])
	var zelle := _objekt("energiezelle")
	if zelle:
		S.regel("benutzen", zelle)
	await _warte_bis(func(): return _raum_id() == "dachboden", 150.0)
	await _warte_auf_raum("dachboden")
	_b("H1 Welt 3 beendet ohne R7/R13: Raum=%s, ZWISCHENSPIEL=%s, R7a=%s R7b=%s R13=%s R11=%s" % [
		_raum_id(), Z.wert("ZWISCHENSPIEL", 0), Z.geloest("R7a", "welt-3"), Z.geloest("R7b", "welt-3"),
		Z.geloest("R13", "welt-3"), Z.geloest("R11", "welt-3")])


## Speichern, während Pixel in der Kühlung ist und Max im Büroturm liegt; danach laden.
func _laden() -> void:
	var S = _spiel()
	var Z = _zustand()
	await _bis_simulation()
	for f in ["frau_regenschirm", "strassenmusiker_w3", "weinender_mann"]:
		await S.regel("ansehen", f)
	S.vorgabe_auswahl = [1, 1, 1]
	await S.regel("nach_option", "deckert", "0090")
	S.vorgabe_auswahl = [0, 2]
	await S.regel("nach_option", "herr_vier", "0090")
	await _geh("apothekengasse")
	await S.regel("nach_option", "morphaeus", "0480")
	await S.regel("benutzen", "pixel")
	S.vorgabe_auswahl = [2]
	await S.regel("benutzen", "automat")
	S.regel("benutzen_inventar", "rote_pastille")
	await _warte_auf_raum("stadtstrasse")
	await S.regel("ansehen", "tuer")
	await S.regel("ansehen", "tuer")
	S.vorgabe_auswahl = [0]
	await S.regel("benutzen", "tuer")
	await _geh("buero_50")
	await _wechsel("widerstandsbasis")
	S.regel("benutzen", "lueftungsschacht")
	await _warte_auf_raum("kuehlung")
	_b("L1 vor dem Speichern: Raum=%s Spieler=%s MAX_RAUM=%s PIXEL_RAUM=%s Ebene=%s" % [_raum_id(),
		"Pixel" if S.ist_pixel() else "Max", Z.wert("W3_MAX_RAUM"), Z.wert("W3_PIXEL_RAUM"), Z.wert("W3_EBENE")])
	var SP = root.get_node("Spielstand")
	var ok = SP.speichern(5)
	_b("L2 gespeichert=%s" % ok)
	await _wechsel("buero_50")
	_b("L3 vor dem Laden: Raum=%s Spieler=%s" % [_raum_id(), "Pixel" if S.ist_pixel() else "Max"])
	await SP.laden(5)
	await _warte_bis(func(): return _e().in_room and _raum_id() != "", 15.0)
	for i in 30:
		await process_frame
	_b("L4 nach dem Laden: Raum=%s Spieler=%s MAX_RAUM=%s PIXEL_RAUM=%s Ebene=%s Wechsel möglich=%s" % [_raum_id(),
		"Pixel" if S.ist_pixel() else "Max", Z.wert("W3_MAX_RAUM"), Z.wert("W3_PIXEL_RAUM"), Z.wert("W3_EBENE"), S.wechsel_moeglich()])
	S.figur_wechseln(false)
	await _warte_bis(func(): return _raum_id() == "buero_50", 10.0)
	for i in 10:
		await process_frame
	_b("L5 Figurenwechsel nach dem Laden: Raum=%s Spieler=%s" % [_raum_id(), "Pixel" if S.ist_pixel() else "Max"])


func _geh(rid: String) -> void:
	_spiel().herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_auf_raum(rid)


func _wechsel(ziel: String) -> void:
	_spiel().figur_wechseln(false)
	await _warte_auf_raum(ziel)


func _objekt(id: String) -> Node:
	for o in _raum().get_hotspots() + _raum().get_props():
		if o.has_method("objekt_id") and o.objekt_id() == id:
			return o
	return null


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
		_b("WARNUNG Raum %s nicht erreicht (jetzt %s)" % [rid, _raum_id()])
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
