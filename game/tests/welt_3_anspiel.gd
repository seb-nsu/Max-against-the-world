extends SceneTree
## Headless-Durchlauf von Welt 3 auf dem Normalweg, über den echten Klickweg: Jeder Rätselschritt
## geht über die Funktion, die Popochiu bei einem Klick aufruft (on_click(), on_right_click(),
## on_item_used() an Hotspot, Prop, Figur oder Gegenstand), mit der Spielfigur, die das im Spiel tut.
## Gespräche laufen über das Gesprächsmenü (nur sichtbare Optionen, Klick auf die Option im Menü),
## Auswahlmenüs (Test, Bestellung, Code-Sicht, Kabel) über das Inline-Menü, Raumwechsel über die
## Ausgänge, der Figurenwechsel über Pixels Porträt. Review 20.11. (W3-01, W3-R01-01, L-S01): Der
## alte Test rief die Regeln direkt auf und übersah so zwei harte Sackgassen.
##
## Was der Testmodus anders macht (bewusst, damit der Test in Minuten läuft): Zeilen warten nicht,
## Max läuft nicht hin (Spiel.hingehen), Nahansichten öffnen sich nicht. Der Radiowecker klingelt im
## Spiel nach 30 s; im Testmodus läuft keine Uhr, der Test lässt ihn klingeln (_wecker_klingelt).
## Mitgebrachte Gegenstände aus früheren Welten (Notizbuch, Thunfischdose, Kochlöffel, Olivenöl)
## legt der Test vorher ins Inventar.
##
## Aufruf: godot --headless --path game -s res://tests/welt_3_anspiel.gd

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"

var fehler: Array[String] = []
var _pruefungen := 0
## Vorgaben für die nächsten Inline-Menüs (Index der Option), in der Reihenfolge der Menüs
var _inline: Array = []
## Das Gesprächsmenü wurde angefordert (Popochiu: dialog_options_requested)
var _menue := false


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	_spiel().testmodus = true
	CQSaveLoad.ordner = "user://test_saves/%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return _e().in_room, 15.0)
	_d().dialog_options_requested.connect(func(_o): _menue = true)
	_d().inline_dialog_requested.connect(_inline_angefragt)
	await _durchlauf()
	print("")
	print("Prüfungen: %d, Fehler: %d (%d s)" % [_pruefungen, fehler.size(), Time.get_ticks_msec() / 1000])
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
	var H = root.get_node("Hinweise")
	for sn in ["Notizbuch", "Thunfischdose", "Kochloeffel"]:
		await S.geben(sn)
	await S.geben(_sn("olivenoel"))  # aus Welt 2 eingepackt: Modell 08/15 wird Freund
	S.welt_beginnen("welt-3")
	await _warte_auf_raum("unterstadt_strasse")
	await _warte_bis(func(): return _gesagt("W3_ANK_PIX_0110"), 10.0)
	_pruefe(Z.ist("W3_WECHSEL_FREI"), "Ankunft in der Unterstadt")
	_pruefe(_menue_knoten() != null, "Gesprächsmenü der Oberfläche da (Optionen werden darüber angeklickt)")
	await S.geben(_sn("olivenoel"))  # der Weltbeginn behält nur die gepackte Tasche

	# R1: erst ohne Beobachtungen in den Test (fällt durch), dann drei Beobachtungen, dann bestehen
	var deckert = _d().get_instance("Deckert")
	await _gespraech("Deckert", ["0040", "0090"], [0])
	_pruefe(not Z.geloest("R1b") and _gesagt("W3_TEST_DEC_0120"), "Mensch-Test ohne Beobachtungen: logisch fällt durch")
	_pruefe(deckert.option_sichtbar("0090"), "Nach dem Durchfallen bietet Deckert den Test wieder an (W3-R01-01)")
	for f in ["frau_regenschirm", "strassenmusiker_w3", "weinender_mann"]:
		await _ansehen(f)
	_pruefe(Z.geloest("R1a"), "R1a Beobachtungen (Rechtsklick auf die drei Leute)")
	await _gespraech("Deckert", ["0090"], [1, 1, 1])
	_pruefe(Z.geloest("R1b"), "R1b Mensch-Test im zweiten Anlauf")
	_leeren()
	await _gespraech("Deckert", ["0420"])
	_pruefe(_gesagt("W3_TEST_DEC_0430") and _d().current_dialog == null, "Deckert: Abschiedsoption beendet das Gespräch")

	# R2: „Vier“ bestellen (erst falsch, dann richtig)
	await _gespraech("HerrVier", ["0090"], [0, 2])
	_pruefe(Z.geloest("R2"), "R2 Nudelbude")

	# Pfote: nichts offen, die Gasse wurde nie betreten: Pixel nennt den Ort (W3-05)
	_leeren()
	await H.pfote_geklickt()
	_pruefe(_gesagt("W3_HINT_PIX_0020"), "Pfote nennt die Apothekengasse, solange sie nie betreten wurde")

	# R3: Symptom, Pixel zweimal (Max benutzt Pixel, wie Stufe 3 sagt), Pastillen, rote Pastille
	await _ausgang("apothekengasse")
	await _gespraech("Morphaeus", ["0450", "0480"])
	_pruefe(Z.ist("W3_SYMPTOM_BEKANNT"), "Morphäus nennt das Symptom")
	# Pixel allein am Automaten zählt nicht
	await _wechsel_zu("Pixel")
	await _klick("automat")
	await _wechsel_zu("Max")
	await _klick("automat")
	_pruefe(_gesagt("W3_APO_PIX_0180") and _gesagt("W3_APO_MAX_0220") and not Z.ist("W3_PIXEL_DOPPELT"),
		"Pixel allein am Automaten: Max sieht keinen Unterschied")
	await _c().get_character("Pixel").on_click()   # Max benutzt Pixel (Hinweis R3a, Stufe 3)
	await _ruhe()
	_pruefe(Z.ist("W3_PIXEL_DOPPELT"), "Max benutzt Pixel: zweimal gleich vorbei")
	_inline = [2]
	await _klick("automat")
	_pruefe(Z.geloest("R3a") and _hat("omas_kekse") and _hat("rote_pastille") and _hat("blaue_pastille"),
		"R3a Déjà-vu, Pastillen und Omas Kekse")
	await _inv_benutzen("rote_pastille")
	await _warte_auf_raum("stadtstrasse")
	_pruefe(Z.geloest("R3b") and Z.wert("W3_EBENE") == "simulation", "R3b in der Simulation")
	_pruefe(not _hat("blaue_pastille"), "Die blaue Pastille bleibt nach der Wahl zurück (W3-R02-03)")

	# R5: Code-Sicht an der Tür (zweimal ansehen), dann tauschen
	await _ansehen("tuer")
	await _ansehen("tuer")
	_pruefe(Z.ist("W3_CODE_SICHT"), "Code-Sicht frei")
	_inline = [0]
	await _klick("tuer")
	_pruefe(Z.geloest("R5"), "R5 gesprächige Tür")
	var klaenge: Array = root.get_node("Klang").protokoll
	_pruefe("geraeusch/code_sicht" in klaenge and "geraeusch/glitch" in klaenge, "Ton: Code-Sicht und Tausch")
	_pruefe("atmo/regen_strasse" in klaenge and "atmo/keine" in klaenge, "Ton: Regen in der Unterstadt, die Simulation ohne Atmosphäre")
	_pruefe("geraeusch/hologramm" in klaenge, "Ton: Opa spricht in Welt 3 als Hologramm")

	# Radiowecker: vor dem Klingeln 0215, beim ersten Aufstehen 0230, danach 0240.
	await _klick("radiowecker")
	_pruefe(_gesagt("W3_SIM_MAX_0215") and Z.wert("W3_EBENE") == "simulation", "Radiowecker vor dem Klingeln: Max bleibt")
	_wecker_klingelt()
	_klick_ohne_warten("klingelnder_radiowecker")
	await _warte_auf_raum("widerstandsbasis")
	_pruefe(_gesagt("W3_SIM_MAX_0230") and not _gesagt("W3_SIM_MAX_0240"), "Radiowecker, erstes Aufstehen: die erste Zeile")
	_inline = [0]
	_klick_ohne_warten("terminal")
	await _warte_auf_raum("stadtstrasse")
	_klick_ohne_warten("radiowecker")   # beide Klickflächen des Weckers gelten gleich
	await _warte_auf_raum("widerstandsbasis")
	_pruefe(_gesagt("W3_SIM_MAX_0240"), "Radiowecker, zweites Aufstehen: die zweite Zeile")
	_inline = [0]
	_klick_ohne_warten("terminal")
	await _warte_auf_raum("stadtstrasse")

	# R4: Orakel-Oma, Kochbuch (Regel 2)
	await _ausgang("kueche_orakel")
	await _gespraech("OrakelOma", ["0110", "0130", "0150"])
	await _ansehen("kochbuch")
	_pruefe(Z.geloest("R4") and _hat("rezeptkarte") and Z.ist("W3_REGEL_2"), "R4 Sparschwein, Regel 2")
	_pruefe(_objekt("sparschwein") != null and _objekt("eieruhr") != null and _objekt("vase") == null
		and _objekt("wandtelefon") == null, "Küche: Sparschwein und Eieruhr statt Vase und Wandtelefon")
	# Omas Eieruhr weckt auch: Max wacht in der Kapsel auf und kommt über das Terminal in die Küche zurück.
	_klick_ohne_warten("eieruhr")
	await _warte_auf_raum("widerstandsbasis")
	_pruefe(_gesagt("W3_KUCH_MAX_0680") and Z.wert("W3_LETZTE_ZELLE", "") == "kueche_orakel", "Eieruhr: Ausgang aus der Küche")
	_inline = [0]
	_klick_ohne_warten("terminal")
	await _warte_auf_raum("kueche_orakel")

	# R6: Büroturm
	await _ausgang("stadtstrasse")
	await _ausgang("buero_50")
	_pruefe(Z.ist("W3_HEXENSCHUSS"), "Büroturm: Hexenschuss")
	# Der Bürokopierer: zwei Zeilen beim Ansehen, eine beim Benutzen
	_pruefe(_objekt("kopierer") != null, "Büroturm: Kopierer steht im Flur")
	await _ansehen("kopierer")
	await _ansehen("kopierer")
	await _klick("kopierer")
	_pruefe(_gesagt("W3_TURM_MAX_0312") and _gesagt("W3_TURM_MAX_0314") and _gesagt("W3_TURM_MAX_0316"),
		"Kopierer: Ansehen zweimal, Benutzen")
	await _klick("kaffeetasse")
	_pruefe(_hat("kaffeetasse"), "Kaffeetasse genommen")
	_pruefe(H.schritt_waehlen() == "R6a", "Pfote im Büroturm: R6a (W3-04), gewählt: " + H.schritt_waehlen())
	_inline = [0]
	await _klick("klone")
	_pruefe(Z.geloest("R6a"), "R6a Original und Kopie")
	await _inv_benutzen("kaffeetasse")
	_pruefe(Z.geloest("R6b") and _hat("schmidts_akte") and not Z.ist("W3_REGEL_1"),
		"R6b Mittagspause, die Akte noch ungelesen")
	_leeren()
	await _ausgang_gesperrt("stadtstrasse")
	_pruefe(_gesagt("W3_TURM_MAX_0570") and _raum_id() == "buero_50", "Büroturm: Ausgang gesperrt bis Rätsel 7")
	await _klick("farbcode_an_der_wand")
	await _klick("terminal")
	_pruefe(_hat("farbcode_zettel") and not Z.geloest("R7a"), "Farbcode abgeschrieben, Kalle braucht die Tabelle")
	_pruefe(H.schritt_waehlen() == "R13", "Pfote im Büroturm ohne Tabelle: R13 für Pixel (W3-04), gewählt: " + H.schritt_waehlen())

	# Pixel in der Basis, solange Max im Turm festsitzt (W3-01, W3-R08-02)
	await _wechsel_zu("Pixel", "widerstandsbasis")
	_leeren()
	await _klick("max_kapsel")
	_pruefe(_gesagt("W3_BAS_PIX_0545") and Z.wert("W3_EBENE") == "simulation" and _raum_id() == "widerstandsbasis",
		"Pixel kann Max nicht aus dem Büroturm schütteln")
	await _klick("fenster")
	_pruefe(Z.ist("W3_SCHNEE") and _gesagt("W3_BAS_PIX_0600"), "Pixel öffnet das Fenster: Schnee")
	await _klick("fenster")
	_pruefe(not Z.ist("W3_SCHNEE") and _gesagt("W3_BAS_PIX_0610"), "Pixel schließt das Fenster")
	await _klick("stromkasten")
	_pruefe(Z.ist("W3_NACHT"), "Pixel am Stromkasten: drüben Nacht")
	_klick_ohne_warten("lueftungsschacht")
	await _warte_auf_raum("kuehlung")
	_pruefe(not _raum().has_character("Max"), "Kühlung: nur Pixel")
	await _klick("wassereimer")
	_pruefe(Z.ist("W3_EIMER_GEKIPPT"), "Pixel kippt den Eimer")
	await _ausgang("widerstandsbasis")
	await _klick("kalles_tasse")
	_pruefe(Z.geloest("R13") and _hat("morse_tabelle"), "R13 Pixel wirft Kalles Tasse, Morse-Tabelle bei Max")

	# R7: Farbcode ans Terminal, Pixel steckt um (erst falsch: Ente, dann richtig)
	await _wechsel_zu("Max", "buero_50")
	await _inv_ansehen("morse_tabelle")
	_pruefe("morse_tabelle" in Z.nahansichten, "Morse-Tabelle zeigt ihre Nahansicht (W3-N-01)")
	await _klick("terminal")
	_pruefe(Z.geloest("R7a"), "R7a Farbcode")
	await _wechsel_zu("Pixel", "widerstandsbasis")
	_inline = [1, 0, 1, 2]
	_klick_ohne_warten("patch_panel")
	await _warte_bis(func(): return Z.geloest("R7b") and not _spiel().ist_pixel(), 20.0)
	await _warte_auf_raum("widerstandsbasis")
	_pruefe(_gesagt("W3_TERM_MAX_0260") and Z.geloest("R7b") and Z.wert("W3_EBENE") == "realitaet",
		"R7b Pixel steckt die Kabel, Max wacht auf")

	# R12: Glückskeks für Herrn Vier (Omas Hundekuchen bekommt eine eigene Zeile, W3-R01-04)
	await _ausgang("unterstadt_strasse")
	await _geben_an("omas_kekse", "herr_vier")
	_pruefe(_gesagt("W3_SUPP_MAX_0170"), "Hundekuchen an Herrn Vier: eigene Zeile")
	await _geben_an("rezeptkarte", "herr_vier")
	_pruefe(Z.geloest("R12") and _hat("zugangskarte"), "R12 vierte Zutat")

	# R8 und R9a: Telefonbuchseite, Laboreingang
	await _ansehen("telefonbuch_in_der_zelle")
	await _klick("telefonbuchseite")
	_pruefe(_hat("telefonbuchseite"), "Seite aus dem Telefonbuch")
	await _ausgang("laboreingang")
	# Die Seite geben, obwohl das Öl noch in der Tasche ist: Pixel warnt einmal, nichts geht verloren
	await _geben_an("telefonbuchseite", "hausmeister")
	_pruefe(_gesagt("W3_EING_PIX_0185") and not Z.geloest("R8") and _hat("telefonbuchseite"),
		"Seite vor dem Ölen: Pixel warnt, die Seite bleibt bei Max")
	await _geben_an("olivenoel", "hausmeister")
	_pruefe(Z.ist("W3_FREUND_0815"), "Öl für Modell 08/15: Freund")
	await _geben_an("telefonbuchseite", "hausmeister")
	_pruefe(Z.geloest("R8"), "R8 Hausmeister")
	await _geben_an("zugangskarte", "kartenleser")
	await _klick("datenanschluss")
	_pruefe(Z.geloest("R9a"), "R9a Leitung")

	# R9b–d: Testkammern
	await _ausgang("unterstadt_strasse")
	await _ausgang("widerstandsbasis")
	_inline = [1]
	_klick_ohne_warten("terminal")
	await _warte_auf_raum("testkammer_1")
	await _klick("portalgeraet_in_der_halterung")
	await _inv_benutzen("portalgeraet")
	_pruefe(_hat("portalgeraet") and Z.ist("W3_PORTAL_BENUTZT"), "Portalgerät")
	_pruefe(H.schritt_waehlen() == "R9b", "Pfote in Kammer 1: R9b (W3-04), gewählt: " + H.schritt_waehlen())
	_inline = [0]
	await _klick("bernd")
	_pruefe(Z.geloest("R9b"), "R9b Kammer 1")
	# Pixel holt Max aus dem Labor: Fenster bleibt offen, solange die Zelle drüben glüht (W3-R03-06)
	await _wechsel_zu("Pixel", "widerstandsbasis")
	await _klick("fenster")
	_leeren()
	await _klick("fenster")
	_pruefe(Z.ist("W3_SCHNEE") and _gesagt("W3_BAS_PIX_0615"), "Fenster bleibt offen, solange Max im Labor ist")
	_klick_ohne_warten("max_kapsel")
	await _warte_bis(func(): return Z.wert("W3_EBENE") == "realitaet" and not _spiel().ist_pixel(), 15.0)
	await _warte_auf_raum("widerstandsbasis")
	_pruefe(_gesagt("W3_BAS_PIX_0540") and Z.wert("W3_EBENE") == "realitaet", "Pixel schüttelt die Kapsel: Max wacht auf")
	await _wechsel_zu("Pixel")
	await _klick("fenster")
	_pruefe(not Z.ist("W3_SCHNEE"), "Mit Max wach schließt Pixel das Fenster wieder")
	await _wechsel_zu("Max")
	_inline = [1]
	_klick_ohne_warten("terminal")
	await _warte_auf_raum("testkammer_1")
	await _ausgang("testkammer_2")
	await _ansehen("kritzelei")
	await _klick("gummihuhn")
	_pruefe(_hat("gummihuhn"), "Gummihuhn genommen")
	_inline = [0]
	await _klick("laser")
	_pruefe(Z.geloest("R9c") and Z.ist("W3_REGEL_3"), "R9c Kammer 2, Regel 3")
	await _ausgang("testkammer_3")
	_inline = [0]
	await _klick("tuer")
	_inline = [0]
	await _klick("bernd")
	_pruefe(Z.geloest("R9d"), "R9d Kammer 3")

	# R10 und R11: Kern. Erst mit ungelesener Akte (W3-R12-02), dann lesen und das Paradoxon
	await _ausgang("kern")
	_leeren()
	await _klick("mutti")
	_pruefe(_gesagt("W3_KERN_PIX_0355") and not _gesagt("W3_KERN_PIX_0350") and not Z.geloest("R10"),
		"Ungelesene Akte: Pixel schickt nicht aus dem Labor")
	_pruefe(H.schritt_waehlen() == "R10" and S.regel_wert("hinweis_vorher", "R10") == "W3_KERN_PIX_0355",
		"Pfote: dieselbe Andeutung vor den Stufen von R10")
	await _inv_ansehen("schmidts_akte")
	_pruefe(Z.ist("W3_REGEL_1"), "Regel 1 aus der Akte")
	_inline = [0, 1, 2]
	await _klick("mutti")
	_pruefe(Z.geloest("R10"), "R10 Paradoxon")
	# Code-Sicht an der Zelle: „heiß“ gegen „kalt“ (Kekse). Danach nimmt Max die kalte Zelle im selben
	# Klick, und der Abschluss wechselt den Raum: darum ohne Warten auf den Klick.
	_inline = [0]
	_klick_ohne_warten("energiezelle")
	await _warte_bis(func(): return Z.ist("W3_ZELLE_KALT"), 20.0)
	_pruefe(Z.ist("W3_ZELLE_KALT") and Z.ist("W3_KEKSE_WARM"), "Zelle kalt, Kekse ofenwarm")
	await _warte_bis(func(): return Z.geloest("R11") or (_raum_id() == "kern" and _spiel().in_szene == 0), 20.0)
	if not Z.geloest("R11") and _raum_id() == "kern":
		_klick_ohne_warten("energiezelle")   # kalte Zelle nehmen
	await _warte_bis(func(): return _raum_id() == "dachboden", 150.0)
	await _warte_auf_raum("dachboden")
	_pruefe(Z.geloest("R11", "welt-3") and Z.ist("ZS3_MITBRINGSEL_ABGEGEBEN"), "R11 Energiezelle, Welt 3 geschafft, Opa hat die Zelle")
	_pruefe(_gesagt("W3_ENDE_PIX_0022") and not _gesagt("W3_ENDE_PIX_0020"),
		"Lösung A über die Kekse: Pixel sagt nicht „ich habe das Fenster“")

	# Zwischenspiel 3: Ankunft, Packen, Kanal 999
	await _warte_bis(func(): return int(Z.wert("EINKAUFSLISTE", 0)) == 3, 60.0)
	await _warte_auf_raum("dachboden")
	_pruefe("atmo/w3_atmo" in klaenge and "atmo/laser" in klaenge, "Ton: Grundatmosphäre in Basis und Labor, Laser in Testkammer 2")
	_pruefe(int(Z.wert("ZWISCHENSPIEL", 0)) == 3, "Zwischenspiel 3")
	_pruefe(int(Z.wert("EINKAUFSLISTE", 0)) == 3, "Einkaufsliste: dritter Wunsch")
	_alter_spielstand()
	await _hotspot("drehknopf").on_click()
	_pruefe(Z.ist("ZS3_GEPACKT"), "Reisetasche gepackt")
	await _hotspot("drehknopf").on_click()
	await _warte_bis(func(): return Z.abschnitt == "welt-4", 15.0)
	_pruefe(Z.abschnitt == "welt-4", "Welt 4 beginnt")
	_pruefe(_inline.is_empty(), "Alle vorgegebenen Menüwahlen verbraucht (Rest: %s)" % [_inline])


## Spielstand der Version 2 (Schalter aus Welt 3 und Finale noch ohne Präfix) als Datei schreiben,
## lesen und in den Zustand laden: Nach der Umwandlung muss alles stehen wie vorher.
func _alter_spielstand() -> void:
	var Z = _zustand()
	var vorher: Dictionary = Z.speichern()
	var alt: Dictionary = vorher.duplicate(true)
	alt.schalter = {"LUKE_ERKANNT": true}
	var umbenannt := 0
	for name in vorher.schalter:
		var kurz := str(name)
		for praefix in CQSaveLoad.SCHALTER_V3:
			if kurz.begins_with(praefix) and kurz.trim_prefix(praefix) in CQSaveLoad.SCHALTER_V3[praefix]:
				kurz = kurz.trim_prefix(praefix)
				umbenannt += 1
				break
		alt.schalter[kurz] = vorher.schalter[name]
	_pruefe(umbenannt == CQSaveLoad.SCHALTER_V3["W3_"].size(),
		"Alter Spielstand: alle %d Schalter von Welt 3 sind am Ende der Welt gesetzt (%d)"
		% [CQSaveLoad.SCHALTER_V3["W3_"].size(), umbenannt])
	const PLATZ := 12
	DirAccess.make_dir_recursive_absolute(CQSaveLoad.ordner)
	var f := FileAccess.open(CQSaveLoad.platz_pfad(PLATZ), FileAccess.WRITE)
	f.store_string(JSON.stringify({version = 2, aufloesung_hoehe = 360,
		popochiu = {globals = {custom_data = alt}}}))
	f.close()
	var datei: Dictionary = root.get_node("Spielstand").saveload.datei_lesen(PLATZ)
	_pruefe(int(datei.get("version", 0)) == CQSaveLoad.VERSION and CQSaveLoad.VERSION >= 3,
		"Alter Spielstand: Versionsnummer nach dem Lesen angehoben")
	Z.schalter = {}
	Z.laden(datei.popochiu.globals.custom_data)
	var erwartet: Dictionary = vorher.schalter.duplicate()
	erwartet["FI_LUKE_ERKANNT"] = true
	_pruefe(Z.schalter == erwartet, "Alter Spielstand: Schalter tragen nach dem Laden ihr Präfix\n      erwartet %s\n      geladen  %s"
		% [erwartet.keys(), Z.schalter.keys()])
	_pruefe(Z.ist("W3_CODE_SICHT") and Z.ist("W3_FREUND_0815") and not Z.schalter.has("CODE_SICHT")
		and Z.geloest("R9c", "welt-3") and Z.geloest("R10", "welt-3"),
		"Alter Spielstand: Code-Sicht, Freund 08/15 und die Testkammern bleiben erhalten")
	Z.laden(vorher)
	DirAccess.remove_absolute(CQSaveLoad.platz_pfad(PLATZ))


#region Klickweg ###################################################################################
## Linksklick auf ein Objekt im Raum (Hotspot, Prop oder Figur) mit der aktiven Spielfigur.
func _klick(id: String) -> void:
	var o := _objekt(id)
	if o == null:
		_fehler("Klick: %s fehlt in %s" % [id, _raum_id()])
		return
	await o.on_click()
	await _ruhe()


## Linksklick, dessen Folge den Raum wechselt (das Objekt verschwindet mit dem alten Raum).
func _klick_ohne_warten(id: String) -> void:
	var o := _objekt(id)
	if o == null:
		_fehler("Klick: %s fehlt in %s" % [id, _raum_id()])
		return
	o.on_click()


## Rechtsklick (Ansehen).
func _ansehen(id: String) -> void:
	var o := _objekt(id)
	if o == null:
		_fehler("Ansehen: %s fehlt in %s" % [id, _raum_id()])
		return
	await o.on_right_click()
	await _ruhe()


## Gegenstand aus dem Inventar auf ein Objekt im Raum.
func _geben_an(item_id: String, ziel: String) -> void:
	var o := _objekt(ziel)
	var it = _inv(item_id)
	if o == null or it == null:
		_fehler("%s auf %s: fehlt (%s)" % [item_id, ziel, _raum_id()])
		return
	_i().active = it
	await o.on_item_used(it)
	_i().active = null
	await _ruhe()


## Gegenstand im Inventar benutzen (auf sich selbst).
func _inv_benutzen(item_id: String) -> void:
	var it = _inv(item_id)
	if it == null:
		_fehler("Inventar: %s fehlt" % item_id)
		return
	_i().active = it
	await it.on_item_used(it)
	_i().active = null
	await _ruhe()


## Gegenstand im Inventar ansehen (Rechtsklick).
func _inv_ansehen(item_id: String) -> void:
	var it = _inv(item_id)
	if it == null:
		_fehler("Inventar: %s fehlt" % item_id)
		return
	await it.on_right_click()
	await _ruhe()


## Ausgang im Raum anklicken und warten, bis der Zielraum steht.
func _ausgang(ziel: String) -> void:
	var o := _objekt("ausgang_" + ziel)
	if o == null:
		_fehler("Ausgang nach %s fehlt in %s" % [ziel, _raum_id()])
		return
	o.on_click()
	await _warte_auf_raum(ziel)


## Ausgang anklicken, der gesperrt sein soll (der Raum bleibt).
func _ausgang_gesperrt(ziel: String) -> void:
	var o := _objekt("ausgang_" + ziel)
	if o == null:
		_fehler("Ausgang nach %s fehlt in %s" % [ziel, _raum_id()])
		return
	await o.on_click()
	await _ruhe()


## Figurenwechsel über Pixels Porträt; bei getrennten Figuren springt er in den Raum der anderen.
func _wechsel_zu(figur: String, raum := "") -> void:
	if _c().player.script_name != figur:
		_spiel().pixel_portraet_geklickt()
	if not raum.is_empty():
		await _warte_auf_raum(raum)
	await _ruhe()
	_pruefe(_c().player.script_name == figur, "Wechsel zu %s%s" % [figur, (" in " + raum) if raum else ""])


## Der Radiowecker klingelt im Spiel eine halbe Minute nach dem Einschlafen (welt_3.gd
## _wecker_warten); im Testmodus läuft keine Uhr, darum hier von Hand.
func _wecker_klingelt() -> void:
	_zustand().setze("W3_WECKER_KLINGELT")
	_spiel().regeln()._wecker_anzeigen()


## Gespräch per Klick auf die Figur; wählt die Optionen nacheinander im Menü (nur sichtbare) und geht
## am Ende über die Abschiedsoption, wenn das Gespräch noch offen ist. inline: Vorgaben für Menüs
## innerhalb einer Option (Test, Bestellung).
func _gespraech(sn: String, ids: Array, inline: Array = []) -> void:
	var c = _c().get_character(sn)
	var d = _d().get_instance(sn)
	if c == null or d == null or not c.is_inside_tree():
		_fehler("Gespräch: %s nicht im Raum %s" % [sn, _raum_id()])
		return
	_inline.append_array(inline)
	_menue = false
	var fertig := [false]
	var lauf := func():
		await c.on_click()   # start() kehrt erst am Ende des Gesprächs zurück
		fertig[0] = true
	lauf.call()
	await _warte_bis(func(): return _menue or fertig[0], 15.0)
	for id in ids:
		var opt = d.get_option(id)
		if not _menue or fertig[0]:
			_fehler("Gespräch %s: kein Menü vor Option %s" % [sn, id])
			return
		if opt == null or not opt.visible:
			_fehler("Gespräch %s: Option %s nicht im Menü (sichtbar: %s)" % [sn, id, _sichtbar(d)])
			return
		_menue = false
		_option_klicken(opt)
		await _warte_bis(func(): return _menue or fertig[0], 60.0)
	if not fertig[0] and _menue:
		var ende := ""
		for o in d.bauplan().get("optionen", []):
			if o.get("beendet", false) and d.option_sichtbar(o.id):
				ende = o.id
		if ende.is_empty():
			_fehler("Gespräch %s: keine Abschiedsoption sichtbar" % sn)
			d.stop()
		else:
			_menue = false
			_option_klicken(d.get_option(ende))
		await _warte_bis(func(): return fertig[0], 30.0)
	await _ruhe()


func _sichtbar(d) -> Array:
	return d.options.filter(func(o): return o.visible).map(func(o): return o.id)


## Klick auf eine Option im Gesprächsmenü (wie GUIDialogMenu._on_option_clicked).
func _option_klicken(opt: PopochiuDialogOption) -> void:
	var m = _menue_knoten()
	if m:
		m._on_option_clicked(opt)
	else:
		_d().option_selected.emit(opt)


## Inline-Menü (Spiel.auswahl): die nächste Vorgabe wählen, wie ein Klick im Menü.
func _inline_angefragt(opts: Array) -> void:
	_inline_waehlen.call_deferred(opts)


func _inline_waehlen(opts: Array) -> void:
	var i: int = opts.size() - 1
	if _inline.is_empty():
		_fehler("Auswahlmenü ohne Vorgabe: %s (letzte Option gewählt)" % [opts])
	else:
		i = int(_inline.pop_front())
	var m = _menue_knoten()
	if m and i < m.current_options.size():
		m._on_option_clicked(m.current_options[i])
	else:
		var o := PopochiuDialogOption.new()
		o.id = str(i)
		o.text = str(opts[i])
		_d().option_selected.emit(o)


func _menue_knoten() -> Node:
	for n in root.find_children("*", "Control", true, false):
		if n is GUIDialogMenu:
			return n
	return null


## Bis keine Szene mehr läuft (Testmodus: Szenen laufen ohne Wartezeit durch).
func _ruhe() -> void:
	await _warte_bis(func(): return _spiel().in_szene == 0 and _e().in_room, 30.0)
	for i in 2:
		await process_frame
#endregion


func _objekt(id: String) -> Node:
	var r := _raum()
	if r == null:
		return null
	var treffer: Node = null
	for o in r.get_hotspots() + r.get_props() + r.get_characters():
		if o.has_method("objekt_id") and o.objekt_id() == id:
			if o.visible:
				return o
			treffer = o
	return treffer


func _inv(id: String) -> PopochiuInventoryItem:
	var sn := _sn(id)
	if sn.is_empty() or not _i().is_item_in_inventory(sn, _c().Max):
		return null
	return _i().get_item_instance(sn)


func _leeren() -> void:
	_spiel().protokoll.clear()


func _pruefe(bedingung: bool, text: String) -> void:
	_pruefungen += 1
	if bedingung:
		print("  ok    ", text)
	else:
		print("  FEHLT ", text)
		fehler.append(text)


func _fehler(text: String) -> void:
	_pruefe(false, text)


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true


func _warte_auf_raum(rid: String) -> void:
	var ok := await _warte_bis(func(): return _raum_id() == rid and _e().in_room and _raum().is_current, 15.0)
	_pruefe(ok, "Raum %s erreicht (jetzt %s)" % [rid, _raum_id()])
	await _warte_bis(func(): return _spiel().in_szene == 0, 30.0)
	for i in 3:
		await process_frame


func _gesagt(b: String) -> bool:
	return b in _spiel().protokoll


func _sn(id: String) -> String:
	return root.get_node("Bauplan").gegenstand_script_name(id)


## In Max' Inventar (Pixel trägt nichts; Spiel.geben legt immer zu Max)
func _hat(id: String) -> bool:
	return _i().is_item_in_inventory(_sn(id), _c().Max)


func _spiel():
	return root.get_node("Spiel")


func _zustand():
	return root.get_node("Zustand")


func _e():
	return root.get_node("E")


func _i():
	return root.get_node("I")


func _c():
	return root.get_node("C")


func _d():
	return root.get_node("D")


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
