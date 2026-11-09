extends SceneTree
## Headless-Test: spielt den Lösungspfad des Prologs (P1–P3), danach Welt 1 (R1–R13, Rätsel 10
## über Weg A und Weg B) bis zur Ankunft in Zwischenspiel 1 durch und prüft nach jedem Schritt
## Schalter, Rätselstatus, Hinweise und eine Speichern/Laden-Rundreise, auch mit Pixel als
## aktiver Figur.
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
		# Systemtexte (Sprecher ohne Figur: Brunnen, Spiegel, Geheimtür) warten ebenfalls auf einen Klick.
		root.get_node("G").system_text_shown.connect(_systemtext_schliessen)
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
	await _ansehen(luke, "P0_DACH_MAX_1010")

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
	await _ansehen_item("Thunfischdose", "P0_INV_MAX_0010")
	_pruefe(not _i().is_item_in_inventory("PixelFeld"), "kein Pixel-Feld, solange Pixel schläft")
	# Wiederholung: 1. Mal eigene Zeile, ab dann Pool SYS_WDH (fehlt der Pool, die eigene Zeile)
	await luke.on_right_click()
	_pruefe(Z.angesehen.values().any(func(n): return n >= 2), "Ansehen-Zähler zählt mit")
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

	# Pixel-Feld der Inventarleiste auf den Zapp-O-Mat (1120); das Porträt wechselt nur
	_pruefe(_i().is_item_in_inventory("PixelFeld"), "Pixel-Feld nach P1 in der Leiste")
	_spiel().pixel_portraet_geklickt()
	_pruefe(_c().player.script_name == "Max", "Porträt im Prolog ohne Wirkung")
	await _benutze("PixelFeld", _raum().get_prop("ZappOMat"), "P0_DACH_PIX_1120")

	# Zapp-O-Mat ansehen nach P1: 0410–0440 einmalig
	await _ansehen(_raum().get_prop("ZappOMat"), "P0_DACH_MAX_0410")
	_pruefe(_gesagt("P0_DACH_OPA_0440"), "Schnee-Szene 0420–0440")

	# --- P2: gerader Bügel auf den Zapp-O-Mat: wird von selbst zur Antenne (0470, 0480) ---
	await _benutze("Drahtkleiderbuegel", _raum().get_prop("ZappOMat"), "P0_DACH_MAX_0480")
	_pruefe(_gesagt("P0_DACH_MAX_0470"), "Bügel beim Anbringen gebogen (0470)")
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
	_pruefe(not opa_d.option_sichtbar("1362"), "Opa-Option 1362 vor der Nahansicht verborgen")
	await _ansehen(_hotspot("Kalender"), "P0_DACH_MAX_0630")
	_pruefe("kalender" in Z.nahansichten, "Nahansicht Kalender gesehen")
	_pruefe(opa_d.option_sichtbar("1362"), "Opa-Option 1362 nach der Nahansicht")
	await opa_d.waehlen("1362")
	_pruefe(_gesagt("P0_DACH_OPA_1364") and _gesagt("P0_DACH_PIX_1366"), "Kreis-Gespräch 1364/1366")
	_pruefe(opa_d.option_sichtbar("1362"), "Option 1362 (bleibt) nach Nutzung weiter da")
	await _rundreise("vor P3")

	var ende := [false]
	_spiel().prolog_beendet.connect(func(): ende[0] = true)
	await _hotspot("Drehknopf").on_click()
	_pruefe(Z.geloest("P3", "prolog"), "P3 gelöst")
	_pruefe(_gesagt("P0_DACH_PIX_0880"), "Reisetasche-Szene bis 0880")
	_pruefe(ende[0], "Prolog beendet (Signal)")
	_pruefe(Z.offene_schritte("prolog").is_empty(), "keine offenen Schritte mehr im Prolog")

	await _welt_1()
	_pruefe(_spiel().protokoll.all(func(b): return TranslationServer.translate(b) != b),
		"alle gesagten Blasen haben Text in texte.csv")


#endregion

#region Welt 1 (R1–R13) und Zwischenspiel 1 ######################################################
func _welt_1() -> void:
	var Z = _zustand()
	var H = _hinweise()
	var S = _spiel()

	# --- Ankunft auf dem Dorfplatz ---
	await _warte_auf_raum("Dorfplatz")
	await _warte_bis(func(): return _gesagt("W1_ANK_PIX_0240"), 15.0)
	_pruefe(_gesagt("W1_ANK_TOA_0100"), "Ankunft mit Toadi (W1_ANK 0010–0240)")
	_pruefe("opas_zettel" in Z.nahansichten, "Opas Zettel als Nahansicht in der Ankunft")
	_pruefe(Z.abschnitt == "welt-1", "Abschnitt welt-1")
	for sn in ["Reisetasche", "Notizbuch", "OpasZettel", "Thunfischdose", "PixelFeld"]:
		_pruefe(_i().is_item_in_inventory(sn, _c().Max), "reist mit: " + sn)
	for sn in ["Dosenoeffner", "Drahtkleiderbuegel"]:
		_pruefe(not _i().is_item_in_inventory(sn, _c().Max), "bleibt auf dem Dachboden: " + sn)
	_pruefe(not S.wechsel_moeglich(), "Wechsel erst ab der Taverne")
	_pruefe(Z.status("R1a") == "gesperrt", "R1a gesperrt vor der Taverne")
	_pruefe(Z.status("R5") == "gesperrt" and Z.status("R8") == "gesperrt", "R5 und R8 gesperrt (Voraussetzungen fehlen)")
	await _ansehen_item("Thunfischdose", "P0_INV_MAX_0020")
	await _rundreise("W1 Ankunft")

	# Eimer, Bestellzettel; Eimer am Brunnen füllen
	await _nehmen("Eimer", "W1_DORF_MAX_0350")
	await _nehmen("Bestellzettel", "W1_DORF_MAX_0170")
	await _benutze("Eimer", _hotspot("Brunnen"), "W1_DORF_MAX_0360")
	_pruefe(_gesagt("W1_DORF_PIX_0370") and _item("Eimer").zustand() == "mit_wasser", "Eimer mit Wasser")
	await _ansehen(_hotspot("Brunnen"), "W1_DORF_MAX_0110")
	await _ansehen(_hotspot("Brunnen"), "W1_DORF_MAX_0110")
	await _ansehen(_hotspot("Brunnen"), "W1_DORF_MAX_0110")
	_pruefe(Z.angesehen.keys().any(func(k): return "Brunnen" in k and Z.angesehen[k] == 3),
		"Ansehen-Zähler Brunnen = 3")

	# --- Taverne: R1 ---
	await _hotspot("TaverneVonAussen").on_click()
	await _warte_auf_raum("Taverne")
	await _warte_bis(func(): return _gesagt("W1_TAV_GOL_0070"), 10.0)
	_pruefe(Z.ist("W1_WECHSEL_FREI") and S.wechsel_moeglich(), "Wechsel in der Taverne freigeschaltet")
	_pruefe(Z.status("R1a") == "offen" and Z.status("R1b") == "offen", "R1a und R1b offen")
	_pruefe(Z.status("R1c") == "gesperrt", "R1c gesperrt vor R1a und R1b")
	_pruefe(H.pfote_aktiv(), "Pfote in Welt 1 aktiv")
	_protokoll_leeren()
	await H.pfote_geklickt()
	_pruefe(_gesagt("W1_HINT_PIX_0111") or _gesagt("W1_HINT_PIX_0112"), "Pfote gibt R1-Hinweis")
	await _nehmen("ZiegenfellVorleger", "W1_TAV_MAX_1410")
	var minka: PopochiuCharacter = _c().get_character("Minka")
	await minka.on_click()
	_pruefe(_gesagt("W1_TAV_MIN_0910") and _gesagt("W1_TAV_MAX_0920"), "Max an Minka: Fauchen")
	await _ansehen(_hotspot("Fischsuppe"), "W1_TAV_MAX_0310")

	# Wechsel zu Pixel (0080), Rundreise mit Pixel aktiv
	_pruefe(S.figur_wechseln() and _c().player.script_name == "Pixel", "Wechsel zu Pixel")
	await _warte_bis(func(): return _gesagt("W1_TAV_PIX_0080"), 5.0)
	_pruefe(_gesagt("W1_TAV_PIX_0080"), "erster Wechsel: 0080")
	await _rundreise("Taverne, Pixel aktiv")
	_pruefe(_c().player.script_name == "Pixel", "nach Laden ist Pixel aktiv")
	_pruefe(_i().is_item_in_inventory("PixelFeld", _c().Max), "Pixel-Feld nach Laden bei Max")
	await _hotspot("AusgangDorfplatz").on_click()
	_pruefe(_gesagt("W1_WECH_PIX_0080") and _raum_name() == "Taverne", "Pixel geht nicht durch Türen")
	await _ansehen(_hotspot("Fischsuppe"), "W1_TAV_PIX_0320")
	_pruefe(_gesagt("W1_TAV_PIX_0340"), "Fischsuppe: Pixels Nase interpretiert (0320–0340)")
	await _c().get_character("Minka").on_click()
	_pruefe(Z.geloest("R1a") and _gesagt("W1_TAV_PIX_1000"), "R1a gelöst (0940–1000)")
	_pruefe(not _raum().has_character("Minka"), "Minka ist weg")
	_pruefe(S.figur_wechseln() and _c().player.script_name == "Max", "Wechsel zurück zu Max")
	await _warte_bis(func(): return _gesagt("W1_TAV_MAX_0090"), 5.0)
	_pruefe(_gesagt("W1_TAV_MAX_0090"), "erster Wechsel zurück: 0090")
	await _rundreise("nach R1a")
	_pruefe(not _raum().has_character("Minka"), "Minka bleibt nach Laden weg")

	# R1b: Wein bestellen
	var hum_d = _dialog("Humbert")
	_pruefe(not hum_d.option_sichtbar("0590"), "Option 0590 erst nach 0580")
	await hum_d.waehlen("0510")
	await hum_d.waehlen("0570")
	_pruefe(hum_d.option_sichtbar("0570"), "Option 0570 (bleibt) weiter da")
	_pruefe(not hum_d.option_sichtbar("0510"), "Plauderoption 0510 verschwindet")
	_pruefe(hum_d.option_sichtbar("0590"), "Option 0590 nach 0580")
	var weiter: bool = await hum_d.waehlen("0590")
	_pruefe(not weiter and Z.geloest("R1b") and _gesagt("W1_TAV_HUM_0600"), "R1b gelöst, Gespräch endet")
	_pruefe(not _raum().has_character("Humbert"), "Humbert im Keller")
	_pruefe(Z.status("R1c") == "offen", "R1c offen")
	await _rundreise("nach R1b")

	# R1c: Thunfischdose auf Gollo
	var gollo: PopochiuCharacter = _c().get_character("Gollo")
	await _benutze("Thunfischdose", gollo, "W1_TAV_MAX_1120")
	_pruefe(Z.geloest("R1c") and Z.geloest("R1"), "R1 gelöst")
	_pruefe(_gesagt("W1_TAV_MAX_1330"), "R1c-Szene bis 1330")
	for sn in ["Goldmuenze", "Kaesefondue"]:
		_pruefe(_i().is_item_in_inventory(sn), "Belohnung R1: " + sn)
	_pruefe(_raum().has_character("Humbert"), "Humbert wieder da")
	await gollo.on_click()
	_pruefe(_gesagt("W1_TAV_GOL_1570"), "Gollo schläft (1570)")
	await _rundreise("nach R1")

	# --- Zauberstab-Laden: R2 ---
	await _gehe("AusgangDorfplatz", "Dorfplatz")
	await _gehe("ZauberstabLadenVonAussen", "Zauberstabladen")
	await _nehmen("Kochloeffel", "W1_STAB_MAX_0440")
	await _nehmen_ohne("Zahnstocher", "W1_STAB_MAX_0410")
	_pruefe(Z.status("R2") == "offen", "R2 offen")
	await _item("Kochloeffel").on_item_used(_item("Kaesefondue"))
	_pruefe(Z.geloest("R2") and _gesagt("W1_STAB_STA_0530"), "R2 gelöst (0500–0540)")
	_pruefe(_i().is_item_in_inventory("Socke") and not _i().is_item_in_inventory("Kaesefondue"),
		"Socke statt Käsefondue")
	_pruefe(_item("Kochloeffel").description in ["UI_OBJ_KOCHLOEFFEL_ZAUBERSTAB", TranslationServer.translate("UI_OBJ_KOCHLOEFFEL_ZAUBERSTAB")], "Name Kochlöffel-Zauberstab")
	await _ansehen_item("Kochloeffel", "W1_STAB_MAX_0550")
	await _rundreise("nach R2")

	# --- Schmiede: Ziege 1 ---
	await _gehe("AusgangDorfplatz", "Dorfplatz")
	await _gehe("SchmiedeVonAussen", "Schmiede")
	await _dialog("Schmied").waehlen("0270")
	_pruefe(Z.ist("W1_ZIEGE_FOLGT") and _gesagt("W1_SCHM_PIX_0300"), "Schmiede-Ziege folgt (0270–0300)")
	await _gehe("AusgangDorfplatz", "Dorfplatz")
	_pruefe(_raum().has_character("SchmiedeZiege"), "Ziege folgt auf den Dorfplatz")

	# --- Dorfplatz: Ziege 2 ---
	await _benutze("Bestellzettel", _hotspot("Dorfbrett"), "W1_DORF_MAX_0910")
	_pruefe(_gesagt("W1_DORF_ROT_0980") and _gesagt("W1_DORF_MAX_1010"), "Lieferung 0910–0980 und 1010")
	_pruefe(_raum().has_character("XxlZiege") and not _raum().has_character("Rotkaeppchen"),
		"XXL-Ziege da, Rotkäppchen wieder weg")
	_pruefe(not _i().is_item_in_inventory("Bestellzettel"), "Bestellzettel verbraucht")
	await _rundreise("zwei Ziegen")
	_pruefe(_raum().has_character("SchmiedeZiege") and _raum().has_character("XxlZiege"),
		"beide Ziegen nach Laden da")

	# --- Troll-Brücke: R3, R4 ---
	await _gehe("Waldweg", "Trollbruecke")
	_pruefe(_raum().has_character("SchmiedeZiege") and _raum().has_character("XxlZiege"), "Ziegen an der Brücke")
	await _hotspot("Waldweg").on_click()
	_pruefe(_gesagt("W1_BRUE_MAX_0190") and _raum_name() == "Trollbruecke", "Weg in den Wald gesperrt")
	await _c().get_character("SchmiedeZiege").on_click()
	_pruefe(_gesagt("W1_BRUE_MAX_0470"), "Ziege schicken vor R3: 0470")
	await _benutze("ZiegenfellVorleger", _c().get_character("Pixel"), "W1_BRUE_PIX_0410")
	_pruefe(Z.geloest("R3") and Z.ist("W1_PIXEL_IM_FELL"), "R3 gelöst, Pixel im Fell")
	await _rundreise("nach R3")
	await _ansehen(_hotspot("Schild"), "W1_BRUE_MAX_0030")
	_pruefe("maerchen_satzung" in Z.nahansichten and _gesagt("W1_BRUE_MAX_0070"), "Satzung als Nahansicht")

	# R4a: falsch, dann richtig
	await _c().get_character("XxlZiege").on_click()
	_pruefe(_gesagt("W1_BRUE_WAL_0480"), "Große zuerst: 0480")
	await _c().get_character("Pixel").on_click()
	_pruefe(_gesagt("W1_BRUE_WAL_0510"), "Pixel als Kleine: 0500/0510")
	await _c().get_character("XxlZiege").on_click()
	_pruefe(_gesagt("W1_BRUE_WAL_0490") and int(Z.wert("W1_R4A_REIHE", 0)) == 0, "Große als Zweite: 0490, zurück")
	await _c().get_character("Pixel").on_click()
	await _c().get_character("SchmiedeZiege").on_click()
	_pruefe(_gesagt("W1_BRUE_WAL_0520"), "Mittlere: 0520")
	await _rundreise("R4a halb")
	await _c().get_character("XxlZiege").on_click()
	_pruefe(Z.geloest("R4a") and _gesagt("W1_BRUE_PIX_0640"), "R4a gelöst (0530, 0610–0640)")

	# R4b: vorlesen, Pixel übersetzt
	await _hotspot("Schild").on_click()
	_pruefe(Z.ist("W1_SATZUNG_VORGELESEN") and _gesagt("W1_BRUE_WAL_0670"), "Satzung vorgelesen (0650–0670)")
	_pruefe(S.figur_wechseln() and S.ist_pixel(), "Wechsel zu Pixel an der Brücke")
	await _c().get_character("SchmiedeZiege").on_click()
	_pruefe(_gesagt("W1_BRUE_WAL_0700"), "Ziege, erster Versuch (0680–0710)")
	await _rundreise("R4b, Pixel aktiv")
	_pruefe(_c().player.script_name == "Pixel" and Z.ist("W1_PIXEL_IM_FELL"), "Pixel aktiv und im Fell nach Laden")
	await _c().get_character("SchmiedeZiege").on_click()
	_pruefe(_gesagt("W1_BRUE_WAL_0740"), "Ziege, zweiter Versuch (0720–0740)")
	await _c().get_character("XxlZiege").on_click()
	await _c().get_character("XxlZiege").on_click()
	_pruefe(Z.geloest("R4b") and _gesagt("W1_BRUE_WAL_0920"), "R4b gelöst (0750–0820, 0910/0920)")
	_pruefe(S.figur_wechseln() and not S.ist_pixel(), "Wechsel zurück zu Max")

	# R4c: Eimer mit Wasser auf Waldemar
	_pruefe(Z.status("R4c") == "offen" and H.schritt_waehlen() == "R4c", "R4c offen, Pfote wählt R4c")
	await _benutze("Eimer", _c().get_character("Waldemar"), "W1_BRUE_MAX_0950")
	_pruefe(Z.geloest("R4c") and Z.geloest("R4"), "R4 gelöst")
	_pruefe(_item("Eimer").zustand() == "leer" and _i().is_item_in_inventory("ZiegenfellVorleger"),
		"Eimer leer zurück, Vorleger zurück")
	_pruefe(not Z.ist("W1_PIXEL_IM_FELL") and not Z.ist("W1_ZIEGEN_FOLGEN"), "Fell ab, Begleiter-Schalter aus")
	_pruefe(not _raum().has_character("SchmiedeZiege") and _raum().has_character("XxlZiege"),
		"Schmiede-Ziege geht heim, XXL-Ziege bleibt an der Brücke")
	_pruefe(H.schritt_waehlen() == "R5", "nach R4: Pfote wählt R5 (Goldmünze, Dorfplatz)")
	await _rundreise("nach R4")

	# --- Was hinter der Brücke liegt ---
	await _gehe("WegZumWasserschloss", "Wasserschloss")
	await _warte_bis(func(): return _gesagt("W1_WASS_PIX_0050"), 10.0)
	_pruefe(_gesagt("W1_WASS_TOA_0020"), "Wasserschloss-Szene")
	await _gehe("AusgangTrollbruecke", "Trollbruecke")
	await _gehe("Waldweg", "Zauberwald")
	await _welt_1_r5_bis_r13()


## Welt 1 ab Rätsel 5: Zauberwald, Brunnen, Bohne, Hoggelwarz, Luftschloss, Bergwerk (Weg A und
## Weg B über einen Zwischenstand), Turm, Smaugi, Moderwort, dann Zwischenspiel 1.
func _welt_1_r5_bis_r13() -> void:
	var Z = _zustand()
	var H = _hinweise()
	var S = _spiel()

	# --- Zauberwald: Ketchup, Leuchtpilz, Rosen zu ---
	await _ansehen(_raum().get_prop("Ketchup"), "W1_WALD_MAX_0090")
	await _raum().get_prop("Ketchup").on_click()
	_pruefe(not _i().is_item_in_inventory("Ketchup"), "Ketchup erst nach Rotkäppchens Erlaubnis")
	var rot_d = _dialog("Rotkaeppchen")
	await rot_d.waehlen("0230")
	_pruefe(Z.ist("W1_KETCHUP_FREI") and _gesagt("W1_WALD_ROT_0240"), "Rotkäppchen erlaubt den Ketchup (0230/0240)")
	await _nehmen("Ketchup", "W1_WALD_MAX_0110")
	await _nehmen("Leuchtpilz", "W1_WALD_MAX_0030")
	await _benutze("Socke", _hotspot("Niesrosen"), "W1_WALD_MAX_0410")
	await _hotspot("Niesrosen").on_click()
	_pruefe(_gesagt("W1_WALD_MAX_0420") and _gesagt("W1_WALD_PIX_0430"), "Max singt, Rosen bleiben zu")
	_pruefe(Z.status("R7") == "offen", "R7 offen")
	await _rundreise("Zauberwald")

	# --- Bergwerk vor Rätsel 10 ---
	await _gehe("Stolleneingang", "Bergwerk")
	await _warte_bis(func(): return _gesagt("W1_BERG_GRI_0010"), 10.0)
	_pruefe(_gesagt("W1_BERG_GRI_0010"), "Bergwerk: Streik")
	await _hotspot("RuneTuer").on_click()
	_pruefe(_gesagt("W1_BERG_MAX_0170") and _raum_name() == "Bergwerk", "Rune-Tür zu vor R10")
	await _benutze("Ketchup", _c().get_character("Grimmzahn"), "W1_BERG_GRI_0560")
	_pruefe(not _dialog("Grimmzahn").option_sichtbar("0390"), "Weg B (0390) erst mit Zeldina")

	# --- Rätsel 7: Waldemar singt im Zauberwald ---
	await _gehe("AusgangZauberwald", "Zauberwald")
	await _gehe("AusgangTrollbruecke", "Trollbruecke")
	var wal_d = _dialog("Waldemar")
	_pruefe(wal_d.option_sichtbar("0290"), "Waldemar-Option 0290 (nach R4, mit Socke, Wald betreten)")
	var weiter: bool = await wal_d.waehlen("0290")
	_pruefe(not weiter and Z.ist("W1_WALDEMAR_SINGT") and _gesagt("W1_BRUE_WAL_0300"), "Waldemar geht in den Wald")
	await _gehe("Waldweg", "Zauberwald")
	await _warte_bis(func(): return _gesagt("W1_WALD_PIX_0590"), 15.0)
	_pruefe(Z.geloest("R7") and Z.ist("W1_WALDEMAR_ABSPANN"), "R7 gelöst (0460–0590), Abspann versprochen")
	_pruefe(_item("Socke").zustand() == "voller_pollen", "Socke voller Pollen")
	await _warte_bis(func(): return not _raum().has_character("Waldemar"), 5.0)
	_pruefe(not _raum().has_character("Waldemar"), "Waldemar wieder an der Brücke")
	await _ansehen_item("Socke", "W1_WALD_MAX_0600")
	await _rundreise("nach R7")

	# --- Dorfplatz: Rätsel 5, Brunnen ---
	await _gehe("AusgangTrollbruecke", "Trollbruecke")
	await _gehe("AusgangDorfplatz", "Dorfplatz")
	await _nehmen("Steckbrief", "W1_DORF_MAX_0210")
	await _hotspot("Brunnen").on_click()
	_pruefe(_gesagt("W1_DORF_BRU_0710"), "Brunnen ohne Münze: 0710")
	S.vorgabe_auswahl = [0]
	await _benutze("Goldmuenze", _hotspot("Brunnen"), "W1_DORF_BRU_0780")
	_pruefe(_i().is_item_in_inventory("Goldmuenze") and not Z.geloest("R5"), "Wunsch Pizza: Münze zurück")
	S.vorgabe_auswahl = [1]
	await _benutze("Goldmuenze", _hotspot("Brunnen"), "W1_DORF_BRU_0830")
	await _rundreise("R5 halb")
	S.vorgabe_auswahl = [2]
	await _benutze("Goldmuenze", _hotspot("Brunnen"), "W1_DORF_BRU_0850")
	_pruefe(Z.geloest("R5") and _i().is_item_in_inventory("Zauberbohne")
		and not _i().is_item_in_inventory("Goldmuenze"), "R5 gelöst: Zauberbohne statt Münze")
	await _benutze("Zauberbohne", _hotspot("Brunnen"), "W1_DORF_MAX_1130")
	await _rundreise("nach R5")

	# --- Rätsel 8: Bohnenranke ---
	_pruefe(not _hotspot("Bohnenranke").visible, "Bohnenranke unsichtbar vor R8")
	await _benutze("Zauberbohne", _hotspot("Erdfleck"), "W1_DORF_MAX_1110")
	_pruefe(Z.ist("W1_BOHNE_GEPFLANZT") and not _i().is_item_in_inventory("Zauberbohne"), "Bohne gepflanzt")
	await _hotspot("Erdfleck").on_click()
	_pruefe(_gesagt("W1_DORF_PIX_1120"), "gepflanzte Bohne ohne Wasser: 1120")
	await _benutze("Eimer", _hotspot("Erdfleck"), "W1_DORF_MAX_1210")
	await _benutze("Eimer", _hotspot("Brunnen"), "W1_DORF_MAX_0360")
	await _benutze("Eimer", _hotspot("Erdfleck"), "W1_DORF_MAX_1140")
	_pruefe(Z.geloest("R8") and _gesagt("W1_DORF_TOA_1200"), "R8 gelöst (1140–1200)")
	_pruefe(_hotspot("Bohnenranke").visible and _item("Eimer").zustand() == "leer", "Ranke sichtbar, Eimer leer")
	await _rundreise("nach R8")
	_pruefe(_hotspot("Bohnenranke").visible, "Ranke nach Laden sichtbar")

	# --- Rätsel 6a: Ei, Krug, Rezept ---
	await _gehe("TaverneVonAussen", "Taverne")
	await _nehmen("Ei", "W1_TAV_MAX_1430")
	await _gehe("AusgangDorfplatz", "Dorfplatz")
	await _gehe("SchmiedeVonAussen", "Schmiede")
	await _nehmen("Krug", "W1_SCHM_MAX_0090")
	_pruefe(_raum().has_character("SchmiedeZiege"), "Schmiede-Ziege wieder in der Schmiede")
	await _benutze("Krug", _c().get_character("SchmiedeZiege"), "W1_SCHM_MAX_0430")
	_pruefe(_item("Krug").zustand() == "leer", "kein Melken ohne Rezept")
	await _gehe("AusgangDorfplatz", "Dorfplatz")
	await _gehe("WegNachHoggelwarz", "Klassenzimmer")
	await _warte_bis(func(): return _gesagt("W1_HOGG_ALW_0070"), 10.0)
	_pruefe(_gesagt("W1_HOGG_ALW_0070") and not _gesagt("UI_WELT_1_ENDE"), "Alwin: Kochlöffel (0070), kein Graubox-Ende")
	_pruefe(Z.status("R6a") == "offen", "R6a offen")
	var alw_d = _dialog("Alwin")
	_pruefe(not alw_d.option_sichtbar("0350"), "Milch-Frage erst nach dem Rezept")
	await alw_d.waehlen("0310")
	_pruefe(Z.ist("W1_REZEPT_BEKANNT") and alw_d.option_sichtbar("0350"), "Rezept bekannt (0320)")
	await alw_d.waehlen("0370")
	_pruefe(_i().is_item_in_inventory("Hinweiszettel"), "Alwins Hinweiszettel (0380)")
	await _ansehen_item("Hinweiszettel", "W1_HOGG_ALW_0610")
	_pruefe("hinweiszettel" in Z.nahansichten and _gesagt("W1_HOGG_MAX_0630"), "Hinweiszettel als Nahansicht")
	await _hotspot("Flasche4").on_click()
	_pruefe(_i().is_item_in_inventory("Flasche") and int(Z.wert("W1_FLASCHE", 0)) == 4, "Flasche 4 genommen")
	await _benutze("Flasche", _hotspot("Kessel"), "W1_HOGG_MAX_0590")
	await _benutze("Ei", _hotspot("Kessel"), "W1_HOGG_MAX_0510")
	await _benutze("Leuchtpilz", _hotspot("Kessel"), "W1_HOGG_MAX_0540")
	await _benutze("Thunfischdose", _hotspot("Kessel"), "W1_HOGG_ALW_0550")
	_pruefe(Z.ist("W1_KESSEL_EI") and Z.ist("W1_KESSEL_PILZ") and not Z.geloest("R6a"), "zwei Zutaten im Kessel")
	await _rundreise("R6a halb")

	# Melken in der Schmiede
	await _gehe("AusgangDorfplatz", "Dorfplatz")
	await _gehe("SchmiedeVonAussen", "Schmiede")
	await _benutze("Krug", _c().get_character("SchmiedeZiege"), "W1_SCHM_MAX_0460")
	_pruefe(Z.ist("W1_MELK_SCHWUR") and _gesagt("W1_SCHM_SCH_0480") and _item("Krug").zustand() == "mit_ziegenmilch",
		"Ziege gemolken (0440–0480), Krug mit Ziegenmilch")
	await _benutze("Krug", _c().get_character("SchmiedeZiege"), "W1_SCHM_MAX_0490")
	await _ansehen_item("Krug", "W1_INV_MAX_0090")
	await _gehe("AusgangDorfplatz", "Dorfplatz")
	await _gehe("WegNachHoggelwarz", "Klassenzimmer")
	await _benutze("Krug", _hotspot("Kessel"), "W1_HOGG_MAX_0520")
	_pruefe(Z.geloest("R6a") and _gesagt("W1_HOGG_ALW_0580"), "R6a gelöst (0580)")
	_pruefe(Z.status("R6b") == "offen", "R6b offen")

	# Rätsel 6b: Pixel schnuppert, falsche Flasche, richtige Flasche
	_pruefe(S.figur_wechseln() and S.ist_pixel(), "Wechsel zu Pixel im Klassenzimmer")
	await _ansehen(_hotspot("Flasche3"), "W1_HOGG_PIX_0660")
	await _hotspot("Flasche5").on_click()
	_pruefe(_gesagt("W1_HOGG_PIX_0680"), "Pixel schnuppert Flasche 5 (0680)")
	await _ansehen(_hotspot("Flasche1"), "W1_HOGG_PIX_0700")
	_pruefe(int(Z.wert("W1_SCHNUPPER", 0)) == 2, "zwei Schnupperversuche")
	await _rundreise("R6b, Pixel aktiv")
	_pruefe(S.figur_wechseln() and not S.ist_pixel(), "Wechsel zurück zu Max")
	await _benutze("Flasche", _hotspot("Kessel"), "W1_HOGG_PIX_0760")
	_pruefe(_gesagt("W1_HOGG_TOA_0730") and not _i().is_item_in_inventory("Flasche")
		and int(Z.wert("W1_FLASCHE", 0)) == 0, "falsche Flasche 4: Pilz (0710–0760), Flasche zurück")
	await _hotspot("Flasche3").on_click()
	await _benutze("Flasche", _hotspot("Kessel"), "W1_HOGG_MAX_0770")
	_pruefe(Z.geloest("R6b") and Z.geloest("R6") and _gesagt("W1_HOGG_ALW_0850"), "R6 gelöst (0770–0850)")
	for sn in ["Leuchttrank", "Zeugnis"]:
		_pruefe(_i().is_item_in_inventory(sn), "Belohnung R6: " + sn)
	_pruefe("zeugnis" in Z.nahansichten, "Zeugnis als Nahansicht (Mo-Knuddel)")
	_pruefe(not _i().is_item_in_inventory("Flasche"), "Flasche im Trank aufgegangen")
	await _ansehen_item("Leuchttrank", "W1_HOGG_MAX_0870")
	await _rundreise("nach R6")

	# --- Rätsel 9: Luftschloss ---
	await _gehe("AusgangDorfplatz", "Dorfplatz")
	await _gehe("Bohnenranke", "Luftschloss")
	await _warte_bis(func(): return _gesagt("W1_LUFT_MAK_0030"), 10.0)
	_pruefe(_gesagt("W1_LUFT_MAX_0010"), "Luftschloss: Ankunft (0010–0030)")
	await _ansehen(_hotspot("Kritzelei"), "W1_LUFT_MAX_0060")
	_pruefe("luftschloss_kritzelei" in Z.nahansichten, "Kritzelei als Nahansicht (…-Bärchen)")
	var mak: PopochiuCharacter = _c().get_character("Maklerin")
	_protokoll_leeren()
	await mak.on_click()
	_pruefe(_gesagt("W1_LUFT_MAK_0030") and not Z.ist("W1_MAKLERIN_FREI"), "Maklerin vor dem Entwicklungsmoment")
	var zel_d = _dialog("Zeldina")
	_pruefe(not zel_d.option_sichtbar("0710"), "Team-Fragen erst nach R9")
	await zel_d.waehlen("0280")
	_pruefe(Z.ist("W1_MAKLERIN_FREI") and _gesagt("W1_LUFT_MAX_0310"), "Entwicklungsmoment (0310)")
	var mak_d = _dialog("Maklerin")
	weiter = await mak_d.waehlen("0410")
	_pruefe(not weiter and _gesagt("W1_LUFT_ZEL_0430"), "Feilschen: falsch, Gespräch endet")
	await _rundreise("R9 halb")
	_pruefe(mak_d.option_sichtbar("0470"), "Exposé-Option mit Steckbrief")
	await mak_d.waehlen("0470")
	_pruefe(Z.geloest("R9") and Z.ist("W1_ZELDINA_FOLGT") and _gesagt("W1_LUFT_TOA_0640"), "R9 gelöst (0480–0640)")
	_pruefe(not _raum().has_character("Maklerin"), "Maklerin weg")
	_pruefe(zel_d.option_sichtbar("0710") and not zel_d.option_sichtbar("0210"), "Zeldina: Team-Fragen")
	await zel_d.waehlen("0710")
	_pruefe(Z.ist("W1_PASSWORT_MO"), "Passwort-Anfang Mo (0720)")
	await _rundreise("nach R9")
	await _gehe("Rankenende", "Dorfplatz")
	_pruefe(_raum().has_character("Zeldina"), "Zeldina folgt auf den Dorfplatz")

	# --- Rätsel 10: Bergwerk, Weg A und Weg B ---
	await _gehe("Waldweg", "Trollbruecke")
	await _gehe("Waldweg", "Zauberwald")
	await _gehe("Stolleneingang", "Bergwerk")
	_pruefe(_raum().has_character("Zeldina"), "Zeldina folgt ins Bergwerk")
	_pruefe(Z.status("R10a") == "offen" and Z.status("R10b") == "offen", "R10a und R10b offen")
	_pruefe(Z.status("R10") != "geloest", "R10 noch nicht gelöst")
	var st = root.get_node("Spielstand")
	await _warte_bis(func(): return not st.beschaeftigt(), 10.0)
	_pruefe(st.speichern(2, "Test vor R10"), "Zwischenstand vor R10 gespeichert")

	# Weg A: Leuchttrank, Tarifvertrag, Ketchup
	await _benutze("Leuchttrank", _hotspot("Fackeln"), "W1_BERG_MAX_0510")
	_pruefe(_i().is_item_in_inventory("Tarifvertrag") and not _i().is_item_in_inventory("Leuchttrank"),
		"Weg A: Tarifvertrag statt Leuchttrank (0510–0550)")
	await _ansehen_item("Tarifvertrag", "W1_INV_MAX_0160")
	await _item("Tarifvertrag").on_item_used(_item("Ketchup"))
	_pruefe(Z.geloest("R10a") and Z.geloest("R10") and not Z.geloest("R10b"), "R10 über Weg A gelöst")
	_pruefe(_gesagt("W1_BERG_GO1_0620") and _gesagt("W1_BERG_PIX_0660") and _gesagt("W1_BERG_ZEL_0700"),
		"Arbeitslied mit Mo-Knuddel (0660) und Zeldina (0700)")
	_pruefe(_item("Tarifvertrag").zustand() == "unterschrieben", "Tarifvertrag unterschrieben")
	_pruefe(not Z.ist("W1_GRIMMZAHN_FOLGT"), "Weg A: Grimmzahn folgt nicht")
	await _rundreise("nach R10, Weg A")

	# Zurück zum Zwischenstand, Weg B: Zeldina bietet Grimmzahn den Hausmeister-Posten an
	await st.laden(2)
	await _warte_bis(func(): return not _e().in_room, 3.0)
	await _warte_bis(func(): return _e().in_room and _e().loaded_game.is_empty(), 10.0)
	for i in 5:
		await process_frame
	_pruefe(not Z.geloest("R10") and _i().is_item_in_inventory("Leuchttrank"), "Zwischenstand geladen: vor R10")
	var gri_d = _dialog("Grimmzahn")
	_pruefe(gri_d.option_sichtbar("0390"), "Weg B (0390) mit Zeldina im Team")
	_protokoll_leeren()
	weiter = await gri_d.waehlen("0390")
	_pruefe(not weiter and Z.geloest("R10b") and Z.geloest("R10") and not Z.geloest("R10a"), "R10 über Weg B gelöst")
	_pruefe(Z.ist("W1_GRIMMZAHN_FOLGT") and _gesagt("W1_BERG_GRI_0680"), "Grimmzahn folgt, Lied, Rune-Tür offen")
	await _rundreise("nach R10, Weg B")

	# --- Rätsel 11b: Turmkeller ---
	await _gehe("RuneTuer", "Turmkeller")
	await _warte_bis(func(): return _gesagt("W1_TURM_GRI_0040"), 10.0)
	_pruefe(_gesagt("W1_TURM_ZEL_0030") and _gesagt("W1_TURM_GRI_0040"), "Turm: Ankunft mit Zeldina und Grimmzahn")
	_pruefe(_raum().has_character("Grimmzahn") and _raum().has_character("Zeldina"), "beide folgen in den Turm")
	await _hotspot("TreppeNachOben").on_click()
	_pruefe(_gesagt("W1_TURM_MAX_0110") and _raum_name() == "Turmkeller", "Treppe gesperrt vor R11b")
	await _hotspot("Kammertuer").on_click()
	_pruefe(_gesagt("W1_TURM_MAX_0270"), "Kammertür vor den Besen: 0270")
	await _hotspot("Kreuzung1").on_click()
	_pruefe(_gesagt("W1_TURM_MAX_0140"), "Max auf der Kreuzung: 0140")
	await _hotspot("Besen").on_click()
	_pruefe(_gesagt("W1_TURM_NAR_0160") and _gesagt("W1_TURM_PIX_0170"), "Besen fegt Max (0160/0170)")
	_pruefe(S.figur_wechseln() and S.ist_pixel(), "Wechsel zu Pixel im Turm")
	await _hotspot("GeradeRoute").on_click()
	_pruefe(_gesagt("W1_TURM_PIX_0190"), "Pixel außerhalb der Kreuzungen: 0190")
	await _hotspot("Kreuzung1").on_click()
	_pruefe(_gesagt("W1_TURM_PIX_0200") and Z.ist("W1_KREUZUNG_1"), "erste Spur (0200)")
	await _rundreise("R11b halb, Pixel aktiv")
	await _hotspot("Kreuzung3").on_click()
	await _hotspot("Kreuzung2").on_click()
	_pruefe(_gesagt("W1_TURM_PIX_0210") and _gesagt("W1_TURM_PIX_0220"), "zweite und dritte Spur")
	await _hotspot("Kammertuer").on_click()
	_pruefe(_gesagt("W1_TURM_PIX_0230") and not Z.geloest("R11b"), "Pixel an der Kammertür: 0230")
	_pruefe(S.figur_wechseln() and not S.ist_pixel(), "Wechsel zurück zu Max")
	await _hotspot("Kammertuer").on_click()
	_pruefe(Z.geloest("R11b") and _gesagt("W1_TURM_ZEL_0260") and not _hotspot("Besen").visible,
		"R11b gelöst (0240–0260), Besen weg")
	await _rundreise("nach R11b")
	await _gehe("Kammertuer", "Abstellkammer1")
	await _warte_bis(func(): return _gesagt("W1_TURM_MAX_0300"), 10.0)
	_pruefe(_gesagt("W1_TURM_MAX_0300"), "Abstellkammer 1 (0300)")
	await _ansehen(_hotspot("Besen"), "W1_TURM_MAX_0310")
	await _ansehen(_hotspot("Kram"), "W1_TURM_MAX_0330")
	await _gehe("AusgangTurmkeller", "Turmkeller")

	# --- Rätsel 11a und 12: Smaugis Abstellkammern ---
	await _gehe("TreppeNachOben", "Abstellkammern")
	await _warte_bis(func(): return _gesagt("W1_SMAU_GRI_0060"), 10.0)
	_pruefe(_gesagt("W1_SMAU_HUM_0040") and _gesagt("W1_SMAU_GRI_0060"), "Smaugi: Ankunft (0010–0060, Weg B)")
	for sn in ["Humbert", "Grimmzahn", "Zeldina", "Smaugi"]:
		_pruefe(_raum().has_character(sn), "in den Abstellkammern: " + sn)
	_pruefe(_raum().call("passwort_teile") == 4, "vier Passwort-Teile (Mo, Zeugnis, Lied, Kritzelei)")
	S.vorgabe_auswahl = [0]
	await _hotspot("Geheimtuer").on_click()
	_pruefe(_gesagt("W1_SMAU_TUE_0710"), "Geheimtür fragt (0710)")
	_pruefe(_gesagt("W1_SMAU_TUE_0730") and _gesagt("W1_SMAU_MAX_0740"), "falsche Reihenfolge (0730/0740)")
	S.vorgabe_auswahl = [1]
	await _hotspot("Geheimtuer").on_click()
	_pruefe(_gesagt("W1_SMAU_TUE_0750") and not Z.geloest("R11a"), "zweite falsche Reihenfolge (0750)")
	S.vorgabe_auswahl = [2]
	await _hotspot("Geheimtuer").on_click()
	_pruefe(Z.geloest("R11a") and Z.geloest("R11") and _gesagt("W1_SMAU_TUE_0770"), "R11a gelöst (0760–0790)")
	await _hotspot("Geheimtuer").on_click()
	_pruefe(_gesagt("W1_SMAU_MAX_0820") and _raum_name() == "Abstellkammern", "Erst das Ei (0820)")
	await _rundreise("nach R11a")
	_protokoll_leeren()
	await _raum().get_prop("SchwerterBuendel").on_click()
	_pruefe(_gesagt("W1_SMAU_SMA_0510") and _i().is_item_in_inventory("SchwerterBuendel"), "Schwerter genommen (0510/0520)")
	await _raum().get_prop("FackelBuendel").on_click()
	await _raum().get_prop("Kronleuchter").on_click()
	await _benutze("SchwerterBuendel", _c().get_character("Grimmzahn"), "W1_SMAU_GRI_0650")
	_pruefe(_i().is_item_in_inventory("SchwerterBuendel"), "falscher Abnehmer: Schwerter bleiben")
	await _benutze("SchwerterBuendel", _c().get_character("Humbert"), "W1_SMAU_HUM_0530")
	await _benutze("FackelBuendel", _c().get_character("Grimmzahn"), "W1_SMAU_GRI_0550")
	await _rundreise("R12 halb")
	_pruefe(not _raum().get_prop("SchwerterBuendel").visible, "verschenkter Kram bleibt weg")
	await _benutze("Kronleuchter", _c().get_character("Zeldina"), "W1_SMAU_ZEL_0580")
	_pruefe(Z.geloest("R12") and _i().is_item_in_inventory("Drachenei") and _gesagt("W1_SMAU_PIX_0640"),
		"R12 gelöst: Drachenei (0610–0640)")
	await _ansehen_item("Drachenei", "W1_INV_MAX_0170")
	await _rundreise("nach R12")

	# --- Rätsel 13: Thronsaal ---
	await _gehe("Geheimtuer", "Thronsaal")
	await _warte_bis(func(): return _gesagt("W1_THRO_MAX_0060"), 10.0)
	_pruefe(_gesagt("W1_THRO_ZEL_0040"), "Thronsaal: Ankunft (0010–0060)")
	var mod: PopochiuCharacter = _c().get_character("Moderwort")
	await _benutze("Kochloeffel", mod, "W1_THRO_MOD_0210")
	await _benutze("Socke", mod, "W1_THRO_MOD_0250")
	_pruefe(Z.ist("W1_MOD_GENIEST"), "Moderwort niest (0240–0270)")
	await _rundreise("R13 halb")
	await _benutze("Kochloeffel", mod, "W1_THRO_MOD_0290")
	_pruefe(Z.ist("W1_MOD_KAESE") and not _i().is_item_in_inventory("Kochloeffel"), "Käse-Flüche (0280–0340)")
	_protokoll_leeren()
	await mod.on_click()
	_pruefe(Z.geloest("R13") and _gesagt("W1_THRO_MOD_0410") and _i().is_item_in_inventory("Kochloeffel"),
		"R13 gelöst (0350–0420), Kochlöffel zurück")
	var ohne_pfote: bool = int(Z.stufe3_zaehler.get("welt-1", 0)) == 0
	_pruefe(_gesagt("W1_THRO_PIX_0560" if ohne_pfote else "W1_THRO_PIX_0570") and _gesagt("W1_THRO_PIX_0610"),
		"Abschluss (0510–0610, Stufe-3-Zähler entscheidet 0560/0570)")

	# --- Zwischenspiel 1: Dachboden ---
	await _warte_auf_raum("Dachboden")
	await _warte_bis(func(): return _gesagt("ZS1_DACH_PIX_0240"), 15.0)
	_pruefe(Z.abschnitt == "finale" and int(Z.wert("ZWISCHENSPIEL", 0)) == 1, "Abschnitt finale, Zwischenspiel 1")
	_pruefe(_gesagt("ZS1_DACH_OPA_0070") and Z.ist("ZS1_EI_ABGEGEBEN")
		and not _i().is_item_in_inventory("Drachenei"), "ZS1: Opa nimmt das Ei (0010–0240)")
	_pruefe(_i().is_item_in_inventory("Kochloeffel") and _i().is_item_in_inventory("Thunfischdose"),
		"Inventar bleibt im Zwischenspiel")
	_pruefe(_c().player.script_name == "Max", "Max ist aktiv")
	await _ansehen(_hotspot("Dachfenster"), "ZS1_DACH_MAX_0330")
	await _ansehen(_hotspot("Dachfenster"), "ZS1_DACH_MAX_0335")
	_protokoll_leeren()
	await H.pfote_geklickt()
	_pruefe(_gesagt("ZS1_HINT_PIX_0010"), "Pfote im Zwischenspiel: ZS1_HINT_PIX_0010")
	await _rundreise("Zwischenspiel 1")
	_pruefe(Z.abschnitt == "finale" and not _gesagt("ZS1_DACH_NAR_0010"), "nach Laden: Zwischenspiel, keine zweite Ankunft")
	await _hotspot("Drehknopf").on_click()
	_pruefe(_gesagt("UI_WELT_1_ENDE"), "Drehknopf: Ende der Graubox (Packen und Welt 2 folgen)")


func _gehe(ausgang: String, raum: String) -> void:
	await _hotspot(ausgang).on_click()
	await _warte_auf_raum(raum)


func _nehmen_ohne(prop_name: String, zeile: String) -> void:
	await _raum().get_prop(prop_name).on_click()
	_pruefe(_gesagt(zeile), "Nehmen ohne Gegenstand %s (%s)" % [prop_name, zeile])


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
func _systemtext_schliessen(_text: String) -> void:
	await create_timer(0.5).timeout
	var st := root.find_child("SystemText", true, false)
	if st and st.has_method("close") and st.visible:
		st.close()
	else:
		root.get_node("G").system_text_hidden.emit()


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
