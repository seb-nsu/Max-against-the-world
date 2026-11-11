extends SceneTree
## Headless-Test der drei Schalter aus den Optionen (05-spielsysteme.md, Optionen): Untertitel,
## Bildschirmwackeln aus und Farbenblind-Hilfe. Dazu die Symbolschrift, die Haken, Kreuz, Note,
## Formen und Tauschpfeil an beide Schriften hängt. Ein Teil läuft ohne Testmodus mit echten
## Sprechblasen, damit auch geprüft ist, was der Spieler sieht.
##
## Aufruf: godot --headless --path game -s res://tests/schalter.gd

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
const EFFEKTE := "res://skripte/effekte.gd"
const EINSATZ := "res://skripte/klang_einsatz.gd"
const PLATZHALTER := "res://skripte/platzhalter_klang.gd"
const ZEILE := "P0_WOHN_MAX_0010"
const LIED := "W1_WALD_WAL_0490"

var fehler: Array[String] = []
var _pruefungen := 0


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var ordner := "user://test_schalter/%d/" % OS.get_process_id()
	DirAccess.make_dir_recursive_absolute(ordner)
	CQSaveLoad.ordner = ordner + "saves/"
	var einst = root.get_node("Einstellungen")
	einst.datei = ordner + "settings.cfg"
	einst.laden()
	_spiel().testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	# Die Einstiegsszene des Prologs spricht noch: erst danach gehört die Sprechblase dem Test
	await _warte_bis(func(): return not root.get_node("E").playing_queue and _spiel().in_szene == 0, 20.0)
	await _durchlauf(einst)
	print("")
	print("Prüfungen: %d, Fehler: %d" % [_pruefungen, fehler.size()])
	for f in fehler:
		print("  FEHLER: ", f)
	if is_instance_valid(current_scene):
		current_scene.queue_free()
	for i in 3:
		await process_frame
	quit(0 if fehler.is_empty() else 1)


func _durchlauf(einst) -> void:
	var S = _spiel()
	var K = root.get_node("Klang")
	var E = root.get_node("E")
	var F = load(EFFEKTE)
	var L = load(EINSATZ)

	print("Schriften")
	var symbole: Font = load(F.SYMBOLSCHRIFT)
	var fehlt := []
	for z in F.SYMBOL_ZEICHEN:
		if not symbole.has_char(z.unicode_at(0)):
			fehlt.append(z)
	_pruefe(fehlt.is_empty(), "Symbolschrift hat alle acht Zeichen %s" % [fehlt])
	var angehaengt := true
	for pfad in F.SCHRIFTEN:
		var schrift: FontFile = load(pfad)
		angehaengt = angehaengt and symbole in schrift.fallbacks
	_pruefe(angehaengt, "Symbolschrift hängt an Nunito und Pixelify Sans")
	var thema: Theme = load(F.THEMA)
	_pruefe(thema.get_font("italics_font", "RichTextLabel") is FontVariation,
		"Thema hat eine kursive Schrift für Liedzeilen")

	print("Untertitel")
	var probe: AudioStreamWAV = load(PLATZHALTER).klang("ui_klick")
	_pruefe(einst.wert("untertitel") and S.blase_zeigen(ZEILE, ZEILE), "Standard: Untertitel an, Text erscheint")
	einst.setze("untertitel", false)
	_pruefe(S.blase_zeigen(ZEILE, ZEILE), "Untertitel aus, Zeile ohne Aufnahme: Text bleibt")
	K.probe_stimmen[ZEILE] = probe
	K.probe_stimmen[LIED] = probe
	_pruefe(K.hat_stimme(ZEILE) and not S.blase_zeigen(ZEILE, ZEILE),
		"Untertitel aus, Zeile mit Aufnahme: kein Text")
	_pruefe(S.blase_zeigen(LIED, LIED), "Untertitel aus, gesungene Zeile mit Aufnahme: Text bleibt")
	var lied: String = S.blasen_text(LIED, LIED)
	_pruefe(lied == "[i]♪ %s[/i]" % tr(LIED), "Liedzeile: kursiv mit einer Note davor")
	_pruefe(S.blasen_text(ZEILE, ZEILE) == ZEILE, "Gesprochene Zeile: unverändert")
	var ohne := []
	for z in L.LIED:
		if tr(z) == z:
			ohne.append(z)
	_pruefe(ohne.is_empty() and L.LIED.size() == 8, "Die acht gesungenen Zeilen stehen im Skript %s" % [ohne])
	# Echte Sprechblasen: ohne Text nur die Aufnahme, mit Untertiteln der Text
	S.testmodus = false
	E.settings.auto_continue_text = false
	S.ohne_text.clear()
	var blase := _blase()
	var gezeigt := [false]
	var merker := func(): gezeigt[0] = gezeigt[0] or blase.modulate.a > 0.0
	process_frame.connect(merker)
	await S.sagen("MAX", ZEILE)
	process_frame.disconnect(merker)
	_pruefe(S.ohne_text == [ZEILE] and not gezeigt[0], "Untertitel aus: Die Zeile läuft ohne Sprechblase")
	_pruefe(not K._stimme.playing, "Danach ist die Aufnahme zu Ende")
	einst.setze("untertitel", true)
	var text: String = await _echte_blase(S, "MAX", ZEILE)
	_pruefe(text == tr(ZEILE) and S.ohne_text == [ZEILE], "Untertitel an: Der Text steht in der Sprechblase")

	print("Farbenblind-Hilfe")
	_pruefe(F.mit_sprecher("Opa", "Hallo.") == "Hallo." and F.farbsymbol("rot") == ""
		and F.mit_farbsymbol("rot", "UI_W3_BUCHSE_ROT") == "UI_W3_BUCHSE_ROT",
		"Hilfe aus: kein Name, kein Zeichen")
	einst.setze("farbenblind", true)
	_pruefe(F.mit_sprecher("Opa", "Hallo.") == "Opa: Hallo.", "Hilfe an: Name vor der Sprechblase")
	_pruefe(F.farbsymbol("rot") == "●" and F.farbsymbol("gruen") == "▲" and F.farbsymbol("gelb") == "■",
		"Hilfe an: Kreis auf Rot, Dreieck auf Grün, Quadrat auf Gelb wie im Kabelrätsel")
	_pruefe(F.mit_farbsymbol("gelb", "UI_W3_BUCHSE_GELB") == "■ " + tr("UI_W3_BUCHSE_GELB"),
		"Hilfe an: Buchse mit Zeichen davor")
	E.history.clear()
	text = await _echte_blase(S, "MAX", ZEILE)
	_pruefe(text == "%s: %s" % [tr("UI_OBJ_MAX"), tr(ZEILE)], "Hilfe an: „Max: …“ steht in der Sprechblase")
	_pruefe(not E.history.is_empty() and str(E.history[0].text) == tr(ZEILE),
		"Der Verlauf bekommt den Text ohne doppelten Namen")
	text = await _echte_blase(S, "OPA", "P0_WOHN_OPA_0030")
	_pruefe(text.begins_with(tr("UI_OBJ_OPA") + ": "), "Hilfe an: auch die Stimme von oben trägt ihren Namen")
	einst.setze("farbenblind", false)
	text = await _echte_blase(S, "MAX", ZEILE)
	_pruefe(text == tr(ZEILE), "Hilfe aus: Sprechblase ohne Namen")
	S.testmodus = true
	K.probe_stimmen.clear()

	print("Bildschirmwackeln")
	var fremd := []
	for z in F.WACKELN:
		if tr(z) == z:
			fremd.append(z)
	_pruefe(fremd.is_empty(), "Jede Zeile der Wackel-Tabelle steht im Skript %s" % [fremd])
	F.gewackelt.clear()
	await S.sagen("NAR", "W4_KAPI_NAR_0050")
	_pruefe(F.gewackelt == ["W4_KAPI_NAR_0050"] and E.camera.is_shaking, "Der Amboss fällt: Das Bild wackelt")
	await S.sagen("MAX", ZEILE)
	_pruefe(F.gewackelt.size() == 1, "Eine Zeile ohne Eintrag wackelt nicht")
	await _warte_bis(func(): return not E.camera.is_shaking, 3.0)
	einst.setze("wackeln_aus", true)
	await S.sagen("NAR", "W4_KAPI_NAR_0050")
	_pruefe(F.gewackelt.size() == 1 and not E.camera.is_shaking, "Bildschirmwackeln aus: Das Bild bleibt ruhig")
	var ebene := CanvasLayer.new()
	root.add_child(ebene)
	_pruefe(not F.wackeln_ebene(ebene), "Bildschirmwackeln aus: auch die Minispiele bleiben ruhig")
	einst.setze("wackeln_aus", false)
	_pruefe(F.wackeln_ebene(ebene), "Bildschirmwackeln an: Die Ebene der Minispiele wackelt")
	ebene.queue_free()


## Sagt die Zeile mit echter Sprechblase, liefert ihren Text ohne Auszeichnung und klickt sie weg.
func _echte_blase(S, kuerzel: String, zeile: String) -> String:
	var blase := _blase()
	var fertig := [false]
	var lauf := func():
		await S.sagen(kuerzel, zeile)
		fertig[0] = true
	lauf.call()
	await _warte_bis(func(): return blase.modulate.a > 0.0 and blase.rich_text_label.get_parsed_text() != "", 5.0)
	var text: String = blase.rich_text_label.get_parsed_text()
	blase.stop()  # Text ganz zeigen, dann wie ein Klick weiter
	await create_timer(0.3).timeout  # Popochiu blendet das Weiter-Zeichen erst nach 0,2 s ein
	blase.disappear()
	await _warte_bis(func(): return fertig[0], 5.0)
	_pruefe(fertig[0], "Sprechblase „%s“ lässt sich wegklicken" % zeile)
	return text


## Popochius Sprechblase über der Figur
func _blase() -> Control:
	return root.get_node("G").gui.find_child("DialogOverhead", true, false)


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


func _spiel():
	return root.get_node("Spiel")
