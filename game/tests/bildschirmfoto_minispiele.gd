extends SceneTree
## Bildschirmfotos der drei Minispiele (nicht headless): Archimedes' Hebel und Rede-Ringen im
## Stadion (Welt 2), Zombie-Tanz auf dem Musikvideo-Friedhof (Welt 4). Die Spielflächen werden
## direkt geöffnet und in typische Lagen gebracht; je eine Sprechblase zeigt, wo der Text steht.
##
## Aufruf (aus dem Ordner game/, unter Linux ohne Bildschirm mit xvfb-run):
##   xvfb-run -s "-screen 0 1280x720x24" godot --path . --rendering-driver opengl3 \
##       --resolution 1280x720 -s res://tests/bildschirmfoto_minispiele.gd -- ZIELORDNER [--sprache=en]

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
## Erst zur Laufzeit laden: Die Spielflächen brauchen die Autoloads
const HEBEL := "res://oberflaeche/minispiel_hebel.gd"
const RINGEN := "res://oberflaeche/minispiel_ringen.gd"
const TANZ := "res://oberflaeche/minispiel_tanz.gd"
var ziel := "user://fotos/"
var spiel: Node


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var sprache := ""
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--sprache="):
			sprache = a.trim_prefix("--sprache=")
		else:
			ziel = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(ziel)
	var ordner := "user://foto_minispiele/"
	DirAccess.make_dir_recursive_absolute(ordner)
	CQSaveLoad.ordner = ordner + "saves/"
	var einst = root.get_node("Einstellungen")
	einst.datei = ordner + "settings.cfg"
	DirAccess.remove_absolute(einst.datei)
	einst.laden()
	if sprache:
		einst.setze("sprache", sprache)
	spiel = root.get_node("Spiel")
	spiel.testmodus = true  # Intro und Wege nur protokolliert
	root.get_node("E").settings.auto_continue_text = false
	change_scene_to_file(STARTRAUM)
	await _warte(3.0)
	var zustand = root.get_node("Zustand")
	var inv = root.get_node("I")
	var raeume = root.get_node("R")

	# Welt 2, Stadion: Hebel mit ein paar Dingen in den Taschen
	await spiel.welt_beginnen("welt-2")
	await _warte(1.5)
	await spiel.raum_wechseln_und_warten("Stadion")
	await _warte(1.0)
	for id in ["olivenoel", "waage", "tintenfass", "startpass", "pharaonenteller", "messbecher"]:
		await spiel.geben(root.get_node("Bauplan").gegenstand_script_name(id))
	zustand.setze("W2_TAG1_LAEUFT")
	var regeln = spiel.regeln()
	for sn in ["Archimedes", "Cicero"]:
		spiel.figur_hier(sn, true, raeume.current.get_marker_position(sn))
	var hebel = load("res://skripte/minispiele/hebel.gd").new(regeln.GEWICHT, ["olivenoel", "tintenfass"], 1)
	var feld = spiel.minispiel_oeffnen(load(HEBEL))
	feld.zeigen(hebel, regeln._hebel_taschen())
	await _warte(0.5)
	await _foto("minispiel_1_hebel")
	await _blase("ARC", "W2_HEBL_ARC_0100", "minispiel_2_hebel_kommentar")
	hebel.winkel = 2
	feld.aktualisieren()
	feld._flug_ziel = 0.72
	feld._flug = 0.55
	await _warte(0.3)
	await _foto("minispiel_3_hebel_flug")
	spiel.minispiel_schliessen()
	await _warte(0.3)

	# Rede-Ringen: Start, Blasen, zwei Treffer und ein ausgegrauter Konter, Zeitraffer
	var ringen = load("res://skripte/minispiele/rede_ringen.gd").new([1, 2, 3, 4, 5, 6, 7], regeln.PASSEND)
	feld = spiel.minispiel_oeffnen(load(RINGEN))
	feld.zeigen(ringen, regeln.KONTER_ZEILE)
	await _warte(0.5)
	await _foto("minispiel_4_ringen")
	await _blase("CIC", "W2_RING_CIC_0040", "minispiel_5_ringen_cicero")
	await _blase("MAX", "W2_RING_MAX_0100", "minispiel_6_ringen_max")
	ringen.kontern(2)
	ringen.kontern(4)
	ringen.kontern(1)   # daneben: Linie 3 → 2, Konter 1 für Linie 3 gesperrt
	ringen.kontern(4)   # wieder auf Linie 3
	feld._cicero_x = feld._x_der_linie(ringen.linie)
	feld._gold[ringen.linie] = 1.0
	feld._jubel = 1.0
	feld._knoepfe_setzen()
	feld.blasen_setzen()
	await _warte(0.15)
	await _foto("minispiel_7_ringen_treffer")
	feld._schlaf = true
	feld._sonne = 0.6
	await _warte(0.2)
	await _foto("minispiel_8_ringen_zeitraffer")
	spiel.minispiel_schliessen()
	await _warte(0.3)

	# Welt 4, Friedhof: Zombie-Tanz mitten in der Runde und als Haufen
	await spiel.welt_beginnen("welt-4")
	await _warte(1.5)
	await spiel.raum_wechseln_und_warten("Friedhof")
	await _warte(1.0)
	var tanz = load("res://skripte/minispiele/zombie_tanz.gd").new()
	feld = spiel.minispiel_oeffnen(load(TANZ))
	feld.zeigen(tanz)
	for s in 5:
		tanz.schritt((s + 0.5) * tanz.abstand)
	feld._laeuft = true
	feld._t = 5.62 * tanz.abstand
	feld.auftreten()
	feld._laeuft = false
	await _warte(0.1)
	await _foto("minispiel_9_tanz")
	feld._haufen = 1.0
	await _warte(0.2)
	await _foto("minispiel_10_tanz_haufen")
	spiel.minispiel_schliessen()
	inv.is_restoring = false
	quit(0)


## Eine Zeile mit echter Sprechblase zeigen, fotografieren und wegklicken.
func _blase(kuerzel: String, zeile: String, name: String) -> void:
	spiel.testmodus = false
	spiel.sagen(kuerzel, zeile)
	await _warte(2.5)
	await _foto(name)
	for i in 6:
		if not root.get_node("G").gui.is_showing_dialog_line:
			break
		var k := InputEventMouseButton.new()
		k.button_index = MOUSE_BUTTON_LEFT
		k.pressed = true
		Input.parse_input_event(k)
		await _warte(0.4)
	spiel.testmodus = true


func _warte(s: float) -> void:
	await create_timer(s, true).timeout


func _foto(name: String) -> void:
	await process_frame
	await process_frame
	var bild := root.get_texture().get_image()
	var pfad := ziel + name + ".png"
	bild.save_png(pfad)
	print("Foto: ", pfad, " ", bild.get_size())
