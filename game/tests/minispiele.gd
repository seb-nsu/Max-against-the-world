extends SceneTree
## Headless-Test der drei Minispiele (05-spielsysteme.md, Nachsicht bei Minispielen):
## - Regeln ohne Oberfläche (skripte/minispiele/): Rede-Ringen, Archimedes' Hebel, Zombie-Tanz
## - Spielflächen im Spiel (oberflaeche/minispiel_*.gd): Der Test drückt die echten Knöpfe
##   (Spiel.minispiel_von_hand), die Regeln der Welt führen den Ablauf. Geprüft werden Zeilen,
##   Fehlversuche, ausgegraute Konter, die großzügige Wertung nach zwei Fehlversuchen und dass
##   Speichern und Pausemenü warten, solange ein Minispiel offen ist.
##
## Aufruf: godot --headless --path game -s res://tests/minispiele.gd

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"

var fehler: Array[String] = []
var _pruefungen := 0


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	_spiel().testmodus = true
	CQSaveLoad.ordner = "user://test_saves/%d/" % OS.get_process_id()
	_regeln_ringen()
	_regeln_hebel()
	_regeln_tanz()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return _e().in_room, 15.0)
	_spiel().minispiel_von_hand = true
	await _hebel_im_spiel()
	await _ringen_im_spiel()
	await _tanz_im_spiel()
	print("")
	print("Prüfungen: %d, Fehler: %d" % [_pruefungen, fehler.size()])
	for f in fehler:
		print("  FEHLER: ", f)
	if is_instance_valid(current_scene):
		current_scene.queue_free()
	for i in 3:
		await process_frame
	quit(0 if fehler.is_empty() else 1)


#region Regeln ohne Oberfläche #####################################################################
const PASSEND := {1: [2, 7], 2: [4], 3: [3, 6], 4: [5], 5: [1]}


func _regeln_ringen() -> void:
	var klasse = load("res://skripte/minispiele/rede_ringen.gd")
	var r = klasse.new([1, 2, 3, 4, 5, 6, 7], PASSEND)
	for k in [2, 4, 3, 5, 1]:
		r.kontern(k)
	_pruefe(r.gewonnen() and r.fehler == 0 and r.treffer == 5, "Ringen: fünf passende Konter schieben Cicero über die Mauer")
	r = klasse.new([1, 2, 3, 4, 5, 6, 7], PASSEND)
	_pruefe(r.kontern(7) and r.kontern(4) and r.kontern(6), "Ringen: Ausweich-Konter aus der Tonne treffen (7 und 6)")
	_pruefe(r.linie == 4 and not r.kontern(1) and r.linie == 3 and r.fehler == 1, "Ringen: Fehlversuch kostet eine Linie")
	_pruefe(not r.ist_gesperrt(1), "Ringen: Der falsche Konter ist nur für seine Beleidigung gesperrt")
	r.kontern(3)
	_pruefe(r.linie == 4 and r.ist_gesperrt(1) and not 1 in r.angebot() and r.angebot().size() == 6,
		"Ringen: Zurück auf der Linie bleibt der falsche Konter ausgegraut")
	r = klasse.new([1, 2, 3], PASSEND)
	_pruefe(not r.kontern(1) and r.linie == 1, "Ringen: Cicero rückt nie hinter Linie 1")
	r.kontern(2)
	r.kontern(1)
	r.kontern(2)
	r.kontern(3)
	_pruefe(r.linie == 1 and r.angebot() == [2, 3], "Ringen: Auf Linie 1 sind zwei Konter frei, einer gesperrt")
	r.kontern(2)
	r.kontern(2)
	_pruefe(r.linie == 1 and r.fehler == 4, "Ringen: Linie 2 braucht Konter 4, ohne ihn geht es zurück")
	r.kontern(2)
	_pruefe(r.linie == 2 and r.angebot().size() == 3, "Ringen: Sind alle Konter einer Linie gesperrt, werden alle wieder frei")


const GEWICHT := {"thunfischdose": 0, "startpass": 1, "olivenoel": 6, "waage": 4, "tintenfass": 3,
	"traubensaft": 12, "pixel": 9}


func _regeln_hebel() -> void:
	var klasse = load("res://skripte/minispiele/hebel.gd")
	var ok := true
	for w in 3:
		ok = ok and klasse.new(GEWICHT, ["pixel"], w).ergebnis() == "treffer"
	_pruefe(ok, "Hebel: Pixel allein trifft bei jedem Winkel")
	_pruefe(klasse.new(GEWICHT, []).ergebnis() == "leicht" and klasse.new(GEWICHT, ["thunfischdose"]).ergebnis() == "leicht",
		"Hebel: leerer Korb und leere Dose sind zu leicht")
	ok = true
	for w in 3:
		ok = ok and klasse.new(GEWICHT, ["traubensaft"], w).ergebnis() == "schwer"
	_pruefe(ok, "Hebel: Der volle Krug ist bei jedem Winkel zu schwer")
	_pruefe(klasse.new(GEWICHT, ["olivenoel", "waage"], 1).ergebnis() == "treffer"
		and klasse.new(GEWICHT, ["olivenoel", "waage"], 2).ergebnis() == "schwer",
		"Hebel: Öl und Waage treffen bei mittlerem Winkel, steil ist zu viel")
	_pruefe(klasse.new(GEWICHT, ["olivenoel", "startpass"], 1).ergebnis() == "leicht"
		and klasse.new(GEWICHT, ["olivenoel", "startpass"], 2).ergebnis() == "treffer",
		"Hebel: Der Winkel verschiebt die Kraft um eine Stufe")
	var h = klasse.new(GEWICHT, ["olivenoel", "tintenfass"], 0)
	_pruefe(h.gewicht() == 9 and h.kraft() == 8, "Hebel: Gewicht und Kraft")


func _regeln_tanz() -> void:
	var klasse = load("res://skripte/minispiele/zombie_tanz.gd")
	var t = klasse.new()
	var n := 0
	while not t.fertig() and n < 40:
		t.schritt((n + 0.5) * t.abstand)
		n += 1
	_pruefe(t.fertig() and n == klasse.ZIEL, "Tanz: acht Schritte genau zwischen den Schlägen gewinnen")
	t = klasse.new()
	for s in klasse.SCHLAEGE:
		t.schritt(s * t.abstand + 0.01)
	_pruefe(not t.fertig() and t.punkte == 0 and t.im_takt == klasse.SCHLAEGE, "Tanz: im Takt gewinnt nie")
	t = klasse.new()
	var zeit := 0.0
	while zeit < t.dauer():  # wildes Klicken, zehnmal je Sekunde
		t.schritt(zeit)
		zeit += 0.1
	_pruefe(not t.fertig(), "Tanz: wildes Klicken gewinnt nicht (Punkte %d)" % t.punkte)
	t = klasse.new()
	_pruefe(t.schritt(0.5 * t.abstand) == "gegen" and t.schritt(0.6 * t.abstand) == "doppelt" and t.punkte == 1,
		"Tanz: Je Schlagabstand zählt nur der erste Schritt")
	_pruefe(t.ist_gegen(0.26 * t.abstand) and t.ist_gegen(0.74 * t.abstand) and not t.ist_gegen(0.2 * t.abstand)
		and not t.ist_gegen(0.8 * t.abstand), "Tanz: Die mittlere Hälfte zwischen zwei Schlägen zählt")
	_pruefe(t.schritt(1.05 * t.abstand) == "takt" and t.punkte == 0 and t.schritt(2.05 * t.abstand) == "takt"
		and t.punkte == 0, "Tanz: Ein Schritt im Takt nimmt einen Punkt, nie unter null")
	_pruefe(t.schritt(t.dauer() + 0.1) == "vorbei" and t.vorbei(t.dauer()), "Tanz: Nach der Runde zählt nichts mehr")
	_pruefe(t.dauer() + klasse.EINZAEHLEN * t.abstand < 30.0, "Tanz: Eine Runde dauert unter 30 Sekunden")
#endregion


#region Spielflächen im Spiel ######################################################################
func _hebel_im_spiel() -> void:
	var S = _spiel()
	var Z = _zustand()
	for sn in ["Notizbuch", "Thunfischdose", "Kochloeffel"]:
		await S.geben(sn)
	S.welt_beginnen("welt-2")
	await _warte_auf_raum("nil_delta")
	await _warte_bis(func(): return _gesagt("W2_NIL_PIX_0120"), 10.0)
	await _geh("stadion")
	await S.geben(_sn("olivenoel"))
	Z.setze("W2_TAG1_LAEUFT")
	Z.setze_wert("W2_KORB", [])

	S.regel("benutzen", "wurfhebel")
	_pruefe(await _warte_auf_zug(), "Hebel: Spielfläche offen und wartet")
	var feld = S.minispiel
	_pruefe(S.in_szene > 0 and not S.pause_moeglich() and not S.hud.visible,
		"Hebel: zählt wie eine Zwischensequenz (kein Pausemenü, HUD aus)")
	var da := true
	for id in ["pixel", "olivenoel", "thunfischdose", "notizbuch", "kochloeffel", "handy"]:
		da = da and feld.feld_knopf(id) != null
	_pruefe(da and feld.feld_knopf("reisetasche") == null, "Hebel: Taschen zeigen Pixel und alles mit Gewicht")
	var frei := true
	var felder: Array = feld.felder()
	for i in felder.size():
		frei = frei and Rect2(Vector2.ZERO, feld.FENSTER.size).encloses(felder[i])
		for j in range(i + 1, felder.size()):
			frei = frei and not felder[i].intersects(felder[j])
	_pruefe(frei and felder.size() >= 6, "Hebel: Felder liegen im Fenster und nicht übereinander")

	await _druecken(feld.feld_knopf("thunfischdose"))
	_pruefe(_gesagt("W2_HEBL_ARC_0020") and _gesagt("W2_HEBL_PIX_0030") and Z.wert("W2_KORB", []) == [],
		"Hebel: Die Dose holt Pixel sofort wieder heraus")
	await _druecken(feld.feld_knopf("olivenoel"))
	_pruefe(_gesagt("W2_HEBL_ARC_0100") and Z.wert("W2_KORB", []) == ["olivenoel"] and feld.hebel.gewicht() == 6,
		"Hebel: Öl liegt im Korb, Archimedes kommentiert")
	await _druecken(feld.knopf("winkel_2"))
	_pruefe(int(Z.wert("W2_WINKEL", 1)) == 2 and feld.hebel.winkel == 2 and feld.knopf("winkel_2").button_pressed
		and not feld.knopf("winkel_1").button_pressed, "Hebel: Winkel steil gewählt")
	await _druecken(feld.knopf("sprung"))
	_pruefe(_gesagt("W2_HEBL_NAR_0210") and _gesagt("W2_HEBL_MAX_0220") and int(Z.wert("W2_HEBEL_FEHLER", 0)) == 1
		and Z.wert("W2_KORB", []) == [] and is_instance_valid(S.minispiel),
		"Hebel: zu leicht, Fehlversuch 1, Korb leer, Spielfläche bleibt offen")
	await _druecken(feld.feld_knopf("olivenoel"))
	await _druecken(feld.feld_knopf("olivenoel"))
	_pruefe(Z.wert("W2_KORB", []) == [] and feld.knopf("leeren").disabled, "Hebel: Klick im Korb holt das Öl wieder heraus")
	await _druecken(feld.feld_knopf("pixel"))
	await _druecken(feld.feld_knopf("olivenoel"))
	_pruefe(_gesagt("W2_HEBL_ARC_0190") and _gesagt("W2_HEBL_PIX_0200") and feld.hebel.gewicht() == 15,
		"Hebel: Pixel und Öl im Korb")
	await _druecken(feld.knopf("zu"))
	_pruefe(not is_instance_valid(S.minispiel) and S.in_szene == 0 and S.hud.visible and not Z.geloest("R12")
		and Z.wert("W2_KORB", []).size() == 2, "Hebel: „Später“ schließt, der Korb bleibt gepackt")

	S.vorgabe_auswahl = [1]  # Ramses' Angebot ablehnen
	S.regel("benutzen", "wurfhebel")
	await _warte_auf_zug()
	feld = S.minispiel
	_pruefe(feld.hebel.korb.size() == 2 and feld.hebel.winkel == 2, "Hebel: Korb und Winkel sind nach dem Öffnen wieder da")
	await _druecken(feld.knopf("sprung"))
	_pruefe(_gesagt("W2_HEBL_NAR_0250") and _gesagt("W2_HEBL_CIC_0260") and _gesagt("W2_HEBL_RAM_0270") and _gesagt("W2_HEBL_MAX_0290")
		and is_instance_valid(S.minispiel) and not Z.geloest("R12"),
		"Hebel: zu schwer, nach zwei Fehlversuchen bietet Ramses die großzügige Wertung an, Max lehnt ab")
	await _druecken(feld.knopf("winkel_0"))
	await _druecken(feld.feld_knopf("pixel"))
	await _druecken(feld.knopf("sprung"))
	await _warte_bis(func(): return Z.geloest("R12") and S.in_szene == 0, 10.0)
	_pruefe(_gesagt("W2_HEBL_NAR_0300") and _gesagt("W2_HEBL_ARC_0310") and Z.geloest("R12")
		and Z.ist("W2_HEBEL_BESTLEISTUNG") and not is_instance_valid(S.minispiel) and S.hud.visible,
		"Hebel: Treffer mit Pixel bei flachem Winkel, Tag 1 endet mit Bestleistung")


func _ringen_im_spiel() -> void:
	var S = _spiel()
	var Z = _zustand()
	Z.setze_wert("W2_KONTER", [1, 2, 3, 4, 5, 6, 7])
	var ergebnis := []
	S.vorgabe_auswahl = [1]  # Ramses' Angebot ablehnen
	(func(): ergebnis.append(await S.regeln()._rede_ringen())).call()
	_pruefe(await _warte_auf_zug(), "Ringen: Spielfläche offen und wartet auf den Konter")
	var feld = S.minispiel
	_pruefe(_gesagt("W2_RING_CIC_0010") and _gesagt("W2_RING_CIC_0040") and feld._knoepfe.size() == 7,
		"Ringen: erste Beleidigung, sieben Konter im Panel")
	var unten := 0.0
	for k in feld._knoepfe.values():
		unten = maxf(unten, k.position.y + k.size.y)
	_pruefe(unten <= feld.PANEL.size.y, "Ringen: Alle sieben Konter passen ins Panel (%s von %s)" % [unten, feld.PANEL.size.y])
	await _druecken(feld._knoepfe[1])
	_pruefe(_gesagt("W2_RING_MAX_0170") and _gesagt("W2_RING_CIC_0180") and _gesagt("W2_RING_NAR_0190")
		and _gesagt("W2_RING_MAX_0210") and feld.ringen.linie == 1 and feld._knoepfe[1].disabled
		and not feld._knoepfe[2].disabled, "Ringen: falscher Konter, Zeitraffer, Konter 1 für Linie 1 ausgegraut")
	feld._knoepfe[1].pressed.emit()
	await _warten(5)
	_pruefe(feld.wartet and feld.ringen.fehler == 1, "Ringen: Der ausgegraute Konter zählt nicht noch einmal")
	await _druecken(feld._knoepfe[2])
	_pruefe(_gesagt("W2_RING_MAX_0100") and feld.ringen.linie == 2 and _gesagt("W2_RING_CIC_0050")
		and not feld._knoepfe[1].disabled and "geraeusch/stadion_jubel" in root.get_node("Klang").protokoll,
		"Ringen: Treffer, Cicero auf Linie 2, Jubel, Konter 1 wieder frei")
	await _druecken(feld._knoepfe[3])
	_pruefe(feld.ringen.linie == 1 and feld.ringen.fehler == 2 and _gesagt("W2_RING_RAM_0220")
		and _gesagt("W2_HEBL_MAX_0290") and is_instance_valid(S.minispiel),
		"Ringen: zweiter Fehlversuch, Ramses bietet die großzügige Wertung an, Max lehnt ab")
	_pruefe(feld._knoepfe[1].disabled, "Ringen: Zurück auf Linie 1 ist Konter 1 wieder ausgegraut")
	for k in [7, 4, 6, 5]:
		await _druecken(feld._knoepfe[k])
	_pruefe(feld.ringen.linie == 5 and _gesagt("W2_RING_CIC_0120") and _gesagt("W2_RING_CIC_0160")
		and _gesagt("W2_RING_CIC_0080"), "Ringen: vier Treffer in Folge, Cicero auf Linie 5")
	feld._knoepfe[1].pressed.emit()
	await _warte_bis(func(): return ergebnis.size() == 1, 10.0)
	_pruefe(ergebnis == [false] and _gesagt("W2_RING_NAR_0230") and _gesagt("W2_RING_RAM_0270")
		and _hat("olivenkranz") and not is_instance_valid(S.minispiel) and S.in_szene == 0,
		"Ringen: fünfter Treffer, Cicero über die Mauer, Olivenkranz, ohne großzügige Wertung")

	# Zweiter Durchgang: zwei Fehlversuche, Max nimmt Ramses' Angebot an
	ergebnis.clear()
	S.protokoll.clear()
	S.vorgabe_auswahl = [0]
	(func(): ergebnis.append(await S.regeln()._rede_ringen())).call()
	await _warte_auf_zug()
	feld = S.minispiel
	await _druecken(feld._knoepfe[3])
	feld._knoepfe[4].pressed.emit()
	await _warte_bis(func(): return ergebnis.size() == 1, 10.0)
	_pruefe(ergebnis == [true] and _gesagt("W2_HEBL_MAX_0280") and _gesagt("W2_RING_RAM_0270")
		and not is_instance_valid(S.minispiel), "Ringen: großzügige Wertung angenommen, das Ringen zählt als gewonnen")


func _tanz_im_spiel() -> void:
	var S = _spiel()
	var Z = _zustand()
	S.welt_beginnen("welt-4")
	await _warte_auf_raum("testbild")
	await _warte_bis(func(): return _gesagt("W4_TEST_PIX_0140"), 10.0)
	await _geh("friedhof")
	await _warte_bis(func(): return S.in_szene == 0, 20.0)
	S.protokoll.clear()
	S.regel("benutzen", "zombies")
	await _warte_bis(func(): return _gesagt("W4_FRIE_MAX_0090"), 5.0)
	_pruefe(_gesagt("W4_FRIE_ZOM_0080") and not is_instance_valid(S.minispiel),
		"Tanz: Ohne Zurückspulen beginnt das Minispiel nicht")
	await _warte_bis(func(): return S.in_szene == 0, 5.0)
	Z.setze("W4_ZOMBIES_START")

	# Runde 1: gar nicht getanzt, die Runde läuft ab
	S.regel("benutzen", "zombies")
	_pruefe(await _warte_auf_runde(), "Tanz: Spielfläche offen, die Runde läuft")
	var feld = S.minispiel
	_pruefe(_gesagt("W4_FRIE_MAX_0240") and S.in_szene > 0 and not S.pause_moeglich(),
		"Tanz: Max kündigt den Tanz an, das Minispiel zählt wie eine Zwischensequenz")
	_pruefe(feld._t < 0.0, "Tanz: Die Runde beginnt mit dem Einzählen")
	feld.auftreten()
	_pruefe(feld.tanz.punkte == 0 and feld.tanz.im_takt == 0, "Tanz: Beim Einzählen zählt kein Schritt")
	feld._t = feld.tanz.dauer() + 0.1
	await _warte_bis(func(): return not is_instance_valid(S.minispiel) and S.in_szene == 0, 5.0)
	_pruefe(_gesagt("W4_FRIE_MAX_0280") and not Z.geloest("R5"), "Tanz: erster Fehlversuch (0280)")

	# Runde 2: im Takt getanzt, Flimmers Angebot abgelehnt
	S.vorgabe_auswahl = [1]
	S.regel("benutzen", "leuchtfliesen")
	await _warte_auf_runde()
	feld = S.minispiel
	for s in 4:
		feld._t = s * feld.tanz.abstand + 0.02
		feld.auftreten()
	_pruefe(feld.tanz.im_takt == 4 and feld.tanz.punkte == 0 and feld._rueckmeldung.text.begins_with("✗"),
		"Tanz: Schritte im Takt zählen als Fehler, mit Zeichen und Text")
	feld._t = feld.tanz.dauer() + 0.1
	await _warte_bis(func(): return not is_instance_valid(S.minispiel) and S.in_szene == 0, 5.0)
	_pruefe(_gesagt("W4_FRIE_MAX_0290") and _gesagt("W4_FRIE_FLI_0300") and _gesagt("W4_FRIE_MAX_0320")
		and not Z.geloest("R5"), "Tanz: zweiter Fehlversuch, Flimmer bietet an, Max lehnt ab")

	# Runde 3: gegen den Takt, mit Leertaste und Klick
	S.regel("benutzen", "zombie")
	await _warte_auf_runde()
	feld = S.minispiel
	for s in 8:
		feld._t = (s + 0.5) * feld.tanz.abstand
		var e: InputEvent
		if s % 2 == 0:
			e = InputEventAction.new()
			e.action = "ui_accept"
			e.pressed = true
		else:
			e = InputEventMouseButton.new()
			e.button_index = MOUSE_BUTTON_LEFT
			e.pressed = true
		feld._input(e)
		if s == 3:
			_pruefe(feld.tanz.punkte == 4 and feld._rueckmeldung.text.begins_with("✓"),
				"Tanz: Gegenschritte mit Leertaste und Klick zählen")
	await _warte_bis(func(): return Z.geloest("R5") and S.in_szene == 0, 10.0)
	_pruefe(Z.geloest("R5") and _gesagt("W4_FRIE_ZOM_0250") and _gesagt("W4_FRIE_MAX_0260")
		and _gesagt("W4_FRIE_PIX_0270") and _gesagt("W4_FRIE_NAR_0340") and not is_instance_valid(S.minispiel)
		and S.hud.visible, "Tanz: acht Gegenschritte, Zombies übereinander, R5 gelöst")
	var klang = root.get_node("Klang")
	_pruefe("geraeusch/takt" in klang.protokoll and "geraeusch/zombie" in klang.protokoll,
		"Tanz: Taktschlag und Zombie-Geräusch werden aufgerufen")
#endregion


#region Hilfen #####################################################################################
## Wartet, bis die offene Spielfläche auf einen Zug wartet.
func _warte_auf_zug() -> bool:
	return await _warte_bis(func():
		var m = _spiel().minispiel
		return is_instance_valid(m) and m.wartet, 10.0)


func _warte_auf_runde() -> bool:
	return await _warte_bis(func():
		var m = _spiel().minispiel
		return is_instance_valid(m) and m._laeuft, 10.0)


## Knopf drücken und warten, bis das Spiel den nächsten Zug erwartet (oder die Spielfläche zu ist).
func _druecken(k: Button) -> void:
	if not is_instance_valid(k):
		_pruefe(false, "Knopf fehlt")
		return
	k.pressed.emit()
	await _warten(2)
	await _warte_bis(func():
		var m = _spiel().minispiel
		return not is_instance_valid(m) or m.wartet, 10.0)


func _warten(frames := 2) -> void:
	for i in frames:
		await process_frame


func _geh(rid: String) -> void:
	_spiel().herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_auf_raum(rid)


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
	return root.get_node("I").is_item_in_inventory(_sn(id))


func _spiel():
	return root.get_node("Spiel")


func _zustand():
	return root.get_node("Zustand")


func _e():
	return root.get_node("E")


func _raum() -> PopochiuRoom:
	return root.get_node("R").current


func _raum_id() -> String:
	var r := _raum()
	return r.raum_id() if is_instance_valid(r) and r.has_method("raum_id") else ""
#endregion
