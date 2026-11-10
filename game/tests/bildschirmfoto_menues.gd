extends SceneTree
## Bildschirmfotos der Menüs (nicht headless): Epilepsie-Hinweis, Hauptmenü, Optionen (Audio,
## Anzeige, Steuerung, Barrierefreiheit), Pausemenü über dem Wohnzimmer, Speichern-Bildschirm.
##
## Aufruf (aus dem Ordner game/, unter Linux ohne Bildschirm mit xvfb-run):
##   xvfb-run -s "-screen 0 1920x1080x24" godot --path . --rendering-driver opengl3 \
##       --resolution 1920x1080 -s res://tests/bildschirmfoto_menues.gd -- ZIELORDNER

const HAUPTMENUE := "res://oberflaeche/hauptmenue.tscn"
var ziel := "user://fotos/"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var args := OS.get_cmdline_user_args()
	if not args.is_empty():
		ziel = args[0].trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(ziel)
	var ordner := "user://foto_menues/"
	DirAccess.make_dir_recursive_absolute(ordner)
	CQSaveLoad.ordner = ordner + "saves/"
	var einst = root.get_node("Einstellungen")
	einst.datei = ordner + "settings.cfg"
	DirAccess.remove_absolute(einst.datei)
	einst.laden()
	var spiel = root.get_node("Spiel")
	spiel.testmodus = true

	change_scene_to_file(HAUPTMENUE)
	await _warte(1.0)
	await _foto("menue_1_epilepsie")
	var menue = current_scene
	menue._hinweis_schliessen()
	await _warte(0.5)
	await _foto("menue_2_hauptmenue")
	menue._ausloesen(3)
	await _warte(0.5)
	var opt = menue.unter_offen()
	await _foto("menue_3_optionen_audio")
	for i in [1, 3, 4]:
		opt._reiter.current_tab = i
		await _warte(0.3)
		await _foto("menue_%d_optionen_%s" % [3 + i, ["audio", "anzeige", "spiel", "steuerung", "barrierefrei"][i]])
	opt.zurueck.emit()
	await _warte(0.3)

	menue._ausloesen(1)
	await _warte(4.0)
	# Intro im Testmodus nur protokolliert; dann Pause
	spiel.pause_oeffnen()
	await _warte(0.5)
	await _foto("menue_8_pause")
	spiel._pause._unter_zeigen("speichern")
	await _warte(0.3)
	spiel._pause._unter._gewaehlt_von(1, false)
	await _warte(0.5)
	await _foto("menue_9_speichern")
	spiel.pause_schliessen()
	quit(0)


func _warte(s: float) -> void:
	await create_timer(s, true).timeout


func _foto(name: String) -> void:
	await process_frame
	await process_frame
	var bild := root.get_texture().get_image()
	var pfad := ziel + name + ".png"
	bild.save_png(pfad)
	print("Foto: ", pfad, " ", bild.get_size())
