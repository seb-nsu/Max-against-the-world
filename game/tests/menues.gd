extends SceneTree
## Headless-Test der Menüs, Optionen und des Audio-Gerüsts:
## - Einstellungen: Rundreise über die Datei, Buslautstärken, große Schrift, Tastenbelegung,
##   Zurücksetzen
## - Klang: Raum-Musik aus der Welt-Tabelle, fehlende Dateien werden gemerkt, nichts stürzt ab
## - Hauptmenü: Epilepsie-Hinweis beim ersten Start, fünf Kanäle, Fortsetzen ohne Spielstand aus,
##   Optionen (fünf Reiter) und Laden (16 Plätze) öffnen und schließen, Neues Spiel startet im
##   Wohnzimmer und blendet HUD und Popochiu-Oberfläche wieder ein
## - Pausemenü: öffnet nur, wenn nichts läuft, hält das Spiel an, Speichern zeigt zwölf Plätze,
##   Speichern und Fortsetzen aus dem Hauptmenü über den neuesten Platz
## - Errungenschaften: Bedingungen aus Schaltern, Werten, Hilfe-Pfote und Nahansichten, Datei
##   über alle Spielstände, Liste im Hauptmenü
## - Controller: Tasten in der InputMap (auch nach dem Zurücksetzen), Zeiger springt zu
##   Hotspots, B sieht einen Hotspot an, Optionen-Reiter mit LB/RB
##
## Aufruf (aus dem Ordner game/):
##   godot --headless --path . -s res://tests/menues.gd
## Ende mit Code 0 (alles grün) oder 1 (Fehler, Liste am Ende).

const HAUPTMENUE := "res://oberflaeche/hauptmenue.tscn"

var fehler: Array[String] = []
var _pruefungen := 0
var _ordner := "user://test_menues/%d/" % OS.get_process_id()


func _initialize() -> void:
	_lauf.call_deferred()


func pruefe(ok: bool, was: String) -> void:
	_pruefungen += 1
	if not ok:
		fehler.append(was)
		print("  FEHLER: ", was)


func _warten(frames := 2) -> void:
	for i in frames:
		await process_frame


func _warten_bis(bedingung: Callable, sekunden := 10.0) -> bool:
	var ende := Time.get_ticks_msec() + int(sekunden * 1000.0)
	while not bedingung.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true


func _lauf() -> void:
	await process_frame
	var spiel = root.get_node("Spiel")
	spiel.testmodus = true
	DirAccess.make_dir_recursive_absolute(_ordner)
	CQSaveLoad.ordner = _ordner + "saves/"
	var einst = root.get_node("Einstellungen")
	einst.datei = _ordner + "settings.cfg"
	einst.laden()
	var erg = root.get_node("Errungenschaften")
	erg.datei = _ordner + "errungenschaften.cfg"
	erg.laden()

	_einstellungen(einst)
	_klang(root.get_node("Klang"))
	await _hauptmenue(spiel, einst)
	await _pausemenue(spiel)
	await _fortsetzen(spiel)
	await _controller(spiel)
	await _errungenschaften(erg)

	print("")
	print("Prüfungen: %d, Fehler: %d" % [_pruefungen, fehler.size()])
	for f in fehler:
		print("  FEHLER: ", f)
	quit(1 if fehler.size() > 0 else 0)


func _einstellungen(einst) -> void:
	print("Einstellungen")
	pruefe(einst.erster_start(), "erster Start ohne Datei")
	pruefe(einst.wert("musik") == 70, "Standard Musik 70")
	einst.setze("musik", 40)
	var bus := AudioServer.get_bus_index("Musik")
	pruefe(bus >= 0, "Bus Musik vorhanden")
	pruefe(is_equal_approx(AudioServer.get_bus_volume_db(bus), linear_to_db(0.4)), "Musik-Bus auf 40 %")
	einst.setze("stimmen", 0)
	pruefe(AudioServer.is_bus_mute(AudioServer.get_bus_index("Stimmen")), "Stimmen 0 = stumm")
	pruefe(not einst.erster_start(), "nach dem Speichern kein erster Start mehr")
	var cfg := ConfigFile.new()
	pruefe(cfg.load(einst.datei) == OK and cfg.get_value("optionen", "musik") == 40, "Musik 40 in der Datei")
	einst.setze("grosse_schrift", true)
	pruefe(einst.schrift(10) == roundi(10 * einst._aufloesung * 1.25) and einst.schrift(12) == roundi(12 * einst._aufloesung * 1.25), "große Schrift: ein Viertel größer")
	einst.taste_belegen("cq_figur_wechseln", KEY_F)
	pruefe(einst.taste("cq_figur_wechseln") == KEY_F, "Figur wechseln auf F")
	einst.laden()
	pruefe(einst.wert("musik") == 40 and einst.wert("grosse_schrift") == true, "Werte nach erneutem Laden")
	einst.zuruecksetzen()
	pruefe(einst.wert("musik") == 70 and einst.schrift(10) == roundi(10 * einst._aufloesung), "Zurücksetzen")
	pruefe(einst.taste("cq_figur_wechseln") == KEY_TAB, "Zurücksetzen: Tab wieder Figur wechseln")
	pruefe(einst.taste("cq_pause") == KEY_ESCAPE, "Pause auf Esc")
	pruefe(InputMap.has_action("cq_reiter_vor") and _pad_taste("cq_pause", JOY_BUTTON_START)
		and _pad_taste("cq_figur_wechseln", JOY_BUTTON_LEFT_SHOULDER),
		"Controller-Tasten auch nach dem Zurücksetzen")


func _klang(klang) -> void:
	print("Klang")
	pruefe(klang.musik_fuer_raum("dorfplatz") == "w1_dorf", "Dorfplatz → w1_dorf")
	pruefe(klang.musik_fuer_raum("wohnzimmer") == "gegenwart", "Wohnzimmer → gegenwart")
	klang.musik("gibt_es_nicht")
	pruefe(klang.fehlend.has("musik/gibt_es_nicht"), "fehlende Musik gemerkt")
	klang.geraeusch("ui_klick")
	klang.jingle("geloest")
	pruefe(klang.protokoll.slice(-2) == ["geraeusch/ui_klick", "jingle/geloest"], "Protokoll der Klänge")
	klang.zeile("MAX", "P0_WOHN_MAX_0010", "Ein Balken. Ein einziger Balken.")
	pruefe(klang.fehlend.has("stimme/de/P0_WOHN_MAX_0010"), "fehlende Stimme gemerkt")
	pruefe(klang.silben("Ein Balken") == 3, "Silben zählen")


func _hauptmenue(spiel, einst) -> void:
	print("Hauptmenü")
	# Wie beim allerersten Start: keine Optionen-Datei
	DirAccess.remove_absolute(einst.datei)
	einst.laden()
	change_scene_to_file(HAUPTMENUE)
	await _warten(3)
	var menue = current_scene
	pruefe(menue != null and menue.scene_file_path == HAUPTMENUE, "Hauptmenü ist die Szene")
	pruefe(menue.hinweis_offen(), "Epilepsie-Hinweis beim ersten Start")
	pruefe(not spiel.hud.visible, "HUD im Menü aus")
	menue._hinweis_schliessen()
	pruefe(not menue.hinweis_offen() and not einst.erster_start(), "Hinweis bestätigt")
	pruefe(menue._knoepfe.size() == 6, "sechs Kanäle")
	var titel: Label = menue._haupt.get_node("Titel")
	pruefe(titel.get_theme_font("font").resource_path.ends_with("pixelify-sans.ttf")
		and menue._knoepfe[1].get_theme_font("font").resource_path.ends_with("nunito-extrabold.ttf"),
		"Schriften im Hauptmenü: Titel in Pixelify Sans, Menüpunkte in Nunito (%s, %s)"
		% [titel.get_theme_font("font").resource_path.get_file(), menue._knoepfe[1].get_theme_font("font").resource_path.get_file()])
	pruefe(menue._knoepfe[0].disabled, "Fortsetzen ohne Spielstand aus")
	pruefe(menue._kanal == 1, "ohne Spielstand steht Kanal 2 (Neues Spiel)")
	menue._ausloesen(3)
	await _warten()
	var opt = menue.unter_offen()
	pruefe(opt != null and opt._reiter.get_tab_count() == 5, "Optionen mit fünf Reitern")
	pruefe(opt._schalter_aus.is_empty() and not opt._schalter_an["untertitel"].disabled
		and not opt._schalter_an["farbenblind"].disabled and not opt._schalter_an["wackeln_aus"].disabled,
		"Optionen: kein Schalter ist mehr ausgegraut, Untertitel, Wackeln und Farbenblind-Hilfe sind bedienbar")
	opt._schalter_an["wackeln_aus"].button_pressed = true
	pruefe(einst.wert("wackeln_aus"), "Optionen: Schalter „Bildschirmwackeln aus“ stellt die Einstellung um")
	opt._schalter_an["wackeln_aus"].button_pressed = false
	var rb := InputEventAction.new()
	rb.action = "cq_reiter_vor"
	rb.pressed = true
	opt._unhandled_input(rb)
	pruefe(opt._reiter.current_tab == 1, "RB: nächster Reiter")
	rb.action = "cq_reiter_zurueck"
	opt._unhandled_input(rb)
	opt._unhandled_input(rb)
	pruefe(opt._reiter.current_tab == 4, "LB: zurück, vom ersten zum letzten Reiter")
	opt.zurueck.emit()
	await _warten()
	pruefe(menue.unter_offen() == null and menue._haupt.visible, "Optionen geschlossen")
	menue._ausloesen(4)
	await _warten()
	var liste = menue.unter_offen()
	pruefe(liste != null and liste.zeilen().size() == 13, "Errungenschaften: 13 Zeilen")
	liste.zurueck.emit()
	await _warten()
	pruefe(menue.unter_offen() == null and menue._haupt.visible, "Errungenschaften geschlossen")
	menue._ausloesen(2)
	await _warten()
	var plaetze = menue.unter_offen()
	pruefe(plaetze != null and _kacheln(plaetze) == 16, "Laden: 12 Plätze, Schnell, 3 Auto")
	pruefe(_kacheln(plaetze, true) == 16, "Laden: leere Plätze nicht wählbar")
	plaetze.zurueck.emit()
	await _warten()
	menue._ausloesen(1)
	var da := await _warten_bis(func(): return _im_raum("Wohnzimmer"), 20.0)
	pruefe(da, "Neues Spiel: im Wohnzimmer")
	# Der erste Raum kommt aus dem Hauptmenü ohne Raumwechsel. Popochius Kamera muss trotzdem die
	# Grenzen der Spielauflösung haben, sonst sitzt der Raum um 160×90 Pixel verschoben.
	await _warten(5)
	var kamera: Camera2D = root.get_node("E").camera
	pruefe(kamera.limit_right == 640 and kamera.limit_bottom == 360
		and root.canvas_transform.origin.is_equal_approx(Vector2.ZERO),
		"Neues Spiel aus dem Hauptmenü: Raum sitzt richtig im Bild (Grenzen %d×%d, Versatz %s)"
		% [kamera.limit_right, kamera.limit_bottom, root.canvas_transform.origin])
	pruefe(spiel.hud.visible, "HUD im Spiel wieder an")
	var gui_ebene = root.get_node("E").get_node("GraphicInterfaceLayer")
	pruefe(gui_ebene.visible, "Popochiu-Oberfläche wieder an")


func _pausemenue(spiel) -> void:
	print("Pausemenü")
	var spielstand = root.get_node("Spielstand")
	pruefe(await _warten_bis(func(): return not spielstand.beschaeftigt(), 30.0), "Intro durch")
	pruefe(spiel.pause_moeglich(), "Pause möglich")
	var esc := InputEventAction.new()
	esc.action = "cq_pause"
	esc.pressed = true
	Input.parse_input_event(esc)
	await _warten(3)
	pruefe(spiel.pause_offen() and paused, "Esc öffnet das Pausemenü und hält das Spiel an")
	pruefe(not spiel.pause_moeglich(), "kein zweites Pausemenü")
	var p = spiel._pause
	p._unter_zeigen("speichern")
	await _warten()
	pruefe(_kacheln(p._unter) == 12, "Speichern: zwölf Plätze")
	p._unter._gewaehlt_von(2, false)
	await _warten()
	pruefe(not root.get_node("Spielstand").saveload.kopf_lesen(2).is_empty(), "auf Platz 2 gespeichert")
	p._unter_schliessen()
	await _warten()
	p._zum_hauptmenue()
	pruefe(not spiel.hauptmenue_angefragt, "Hauptmenü erst beim zweiten Klick")
	p.schliessen()
	await _warten()
	pruefe(not spiel.pause_offen() and not paused, "Weiterspielen: Spiel läuft wieder")
	spiel.pause_oeffnen()
	spiel._pause._zum_hauptmenue()
	spiel._pause._zum_hauptmenue()
	pruefe(spiel.hauptmenue_angefragt and not paused, "Hauptmenü nach Bestätigung")


func _fortsetzen(spiel) -> void:
	print("Fortsetzen")
	# Im echten Spiel führt der Weg zurück über einen Neustart; hier liegt das Menü über dem Raum.
	var menue = load(HAUPTMENUE).instantiate()
	root.add_child(menue)
	await _warten(2)
	pruefe(not spiel.hud.visible, "HUD im Menü wieder aus")
	pruefe(not menue._knoepfe[0].disabled and menue._neuester == 2, "Fortsetzen: neuester Platz 2")
	pruefe(menue._kanal == 0, "mit Spielstand steht Kanal 1 (Fortsetzen)")
	pruefe(menue._kanal_info.text.contains("Wohnzimmer"), "Fortsetzen zeigt den Ort")
	# „Neues Spiel“ fragt nach, wenn es schon einen Spielstand gibt
	spiel.start_platz = 7
	menue._kanal_waehlen(1, true)
	menue._ausloesen(1)
	pruefe(menue._neu_sicher and spiel.start_platz == 7
		and menue._kanal_info.text == tr("UI_MENUE_NEUES_SPIEL_SICHER"), "Neues Spiel mit Spielstand: erst die Nachfrage")
	menue._kanal_waehlen(0, true)
	pruefe(not menue._neu_sicher, "Kanalwechsel nimmt die Nachfrage zurück")
	spiel.start_platz = -1
	menue.queue_free()
	await _warten(2)
	pruefe(spiel.hud.visible, "HUD nach dem Menü wieder an")
	# Der Startraum lädt den gewählten Platz, sobald er betreten ist
	var spielstand = root.get_node("Spielstand")
	var geladen := [-1]
	spielstand.geladen.connect(func(s): geladen[0] = s)
	spiel.start_platz = 2
	root.get_node("R").current._on_room_transition_finished()
	pruefe(await _warten_bis(func(): return geladen[0] == 2, 20.0), "Startraum lädt Platz 2")
	pruefe(spiel.start_platz == -1, "Startplatz verbraucht")
	pruefe(await _warten_bis(func(): return _im_raum("Wohnzimmer"), 20.0), "nach dem Laden im Wohnzimmer")


func _controller(spiel) -> void:
	print("Controller")
	var pad = root.get_node("Controller")
	var a := InputEventJoypadButton.new()
	a.button_index = JOY_BUTTON_DPAD_LEFT
	a.pressed = true
	Input.parse_input_event(a)
	await _warten(3)
	pruefe(pad.aktiv, "Controller-Taste schaltet auf Controller")
	var punkte: Array = pad.hotspot_punkte()
	pruefe(punkte.size() > 0, "Hotspots im Wohnzimmer als Ziele")
	pad.zeiger_setzen(Vector2(0, 213))
	await _warten()
	pad.springen(Vector2.RIGHT)
	pruefe(pad.zeiger.x > 0 and pad.zeiger in pad.ziele_sammeln(), "Steuerkreuz springt zum nächsten Ziel")
	# B auf einem Hotspot: ansehen wie mit Rechtsklick
	await _warten_bis(func(): return not root.get_node("Spielstand").beschaeftigt() \
		and not root.get_node("G").is_blocked, 20.0)
	var vorher: int = spiel.protokoll.size()
	var mitte := punkte.filter(func(q): return q.y > 80 and q.y < 307)
	var ziel: Vector2 = mitte[0] if not mitte.is_empty() else punkte[0]
	pad.zeiger_setzen(ziel)
	await _warten(4)
	await physics_frame
	await physics_frame
	pad._klick(MOUSE_BUTTON_RIGHT, true)
	pad._klick(MOUSE_BUTTON_RIGHT, false)
	pruefe(await _warten_bis(func(): return spiel.protokoll.size() > vorher, 10.0),
		"B sieht den Hotspot unter dem Zeiger an")
	await _warten_bis(func(): return not root.get_node("E").playing_queue, 10.0)
	var maus := InputEventMouseMotion.new()
	maus.position = ziel + Vector2(53, 0)
	Input.parse_input_event(maus)
	await _warten(3)
	pruefe(not pad.aktiv, "Mausbewegung schaltet zurück auf Maus")


func _errungenschaften(erg) -> void:
	print("Errungenschaften")
	var zustand = root.get_node("Zustand")
	var gesichert: Dictionary = zustand.speichern()
	erg.zuruecksetzen()
	pruefe(erg.anzahl_frei() == 0, "keine Errungenschaft am Anfang")
	var gemeldet := []
	erg.freigeschaltet.connect(func(id): gemeldet.append(id))
	zustand.setze("P0_P3_GELOEST")
	await _warten()
	pruefe(erg.ist_frei("EMPFANG") and gemeldet == ["EMPFANG"], "Empfang nach P3")
	zustand.stufe3_zaehler["welt-1"] = 1
	zustand.setze_wert("ZWISCHENSPIEL", 1)
	await _warten()
	pruefe(not erg.ist_frei("OHNE_PFOTE_1"), "Ohne Pfote nicht mit Stufe 3")
	zustand.stufe3_zaehler.clear()
	zustand.setze_wert("ZWISCHENSPIEL", 2)
	await _warten()
	pruefe(erg.ist_frei("OHNE_PFOTE_1") and erg.ist_frei("OHNE_PFOTE_2")
		and not erg.ist_frei("OHNE_PFOTE_3"), "Ohne Pfote für Welt 1 und 2")
	for s in ["W2_LAUF_BESTLEISTUNG", "W2_HEBEL_BESTLEISTUNG", "W2_SPEER_BESTLEISTUNG", "W2_DISKUS_BESTLEISTUNG"]:
		zustand.setze(s)
	await _warten()
	pruefe(not erg.ist_frei("FUENFKAMPF"), "Fünfkampf nicht mit vier Bestleistungen")
	zustand.setze("W2_RINGEN_BESTLEISTUNG")
	zustand.setze_wert("W3_SIMULATION_BESUCHE", 3)
	await _warten()
	pruefe(erg.ist_frei("FUENFKAMPF") and erg.ist_frei("DEJA_VU"), "Fünfkampf und Déjà-vu")
	var alle: Array = erg.alle_nahansichten()
	pruefe(alle.size() == 14, "14 Nahansichten im Spiel")
	for n in alle.slice(1):
		zustand.nahansicht_gesehen(n)
	await _warten()
	pruefe(not erg.ist_frei("NEUGIER"), "Neugier fehlt mit 13 von 14")
	zustand.nahansicht_gesehen(alle[0])
	await _warten()
	pruefe(erg.ist_frei("NEUGIER"), "Neugier mit allen Nahansichten")
	# Freigeschaltet bleibt, auch mit einem anderen Spielstand
	zustand.laden(gesichert)
	await _warten()
	erg.laden()
	pruefe(erg.ist_frei("EMPFANG") and erg.ist_frei("NEUGIER") and erg.anzahl_frei() == 6,
		"Errungenschaften bleiben über Spielstände (Datei)")
	erg.freischalten("GIBT_ES_NICHT")
	pruefe(erg.anzahl_frei() == 6, "unbekannte ID wird ignoriert")


func _pad_taste(aktion: String, knopf: JoyButton) -> bool:
	for e in InputMap.action_get_events(aktion):
		if e is InputEventJoypadButton and e.button_index == knopf:
			return true
	return false


func _im_raum(sn: String) -> bool:
	var r = root.get_node("R")
	return root.get_node("E").in_room and is_instance_valid(r.current) and r.current.script_name == sn


func _kacheln(seite: Control, nur_gesperrt := false) -> int:
	var n := 0
	for k in seite.get_child(seite.get_child_count() - 1).get_children():
		if k is Button and k.size.y > 30 and (not nur_gesperrt or k.disabled):
			n += 1
	return n
