extends SceneTree
## Bildschirmfotos aus dem echten Spiel (nicht headless), um die Oberfläche zu prüfen.
##
## Aufruf (aus dem Ordner game/, unter Linux ohne Bildschirm mit xvfb-run):
##   xvfb-run -s "-screen 0 1920x1080x24" godot --path . --rendering-driver opengl3 \
##       --resolution 1920x1080 -s res://tests/bildschirmfoto.gd -- ZIELORDNER
## Schreibt foto_1_sprechblase.png, foto_2_leiste.png und foto_3_gespraech.png.

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var ziel := "user://fotos/"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var args := OS.get_cmdline_user_args()
	if not args.is_empty():
		ziel = args[0].trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(ziel)
	root.get_node("E").settings.auto_continue_text = false
	CQSaveLoad.ordner = "user://foto_saves/"
	change_scene_to_file(STARTRAUM)
	# Intro: Opa ruft aus dem Off, Max antwortet; die erste Blase abwarten
	await _warte(5.0)
	await _foto("foto_1_sprechblase")
	# Text weiterklicken, bis das Intro durch ist
	for i in 40:
		var g = root.get_node("G")
		if not g.gui.is_showing_dialog_line and root.get_node("Spiel").in_szene == 0:
			break
		var k := InputEventMouseButton.new()
		k.button_index = MOUSE_BUTTON_LEFT
		k.pressed = true
		Input.parse_input_event(k)
		await _warte(0.4)
	# Leiste aufklappen: Maus an den oberen Rand, Objektname unter dem Zeiger
	Input.warp_mouse(Vector2(960, 20))
	var bewegung := InputEventMouseMotion.new()
	bewegung.position = Vector2(240, 5)
	bewegung.global_position = bewegung.position
	Input.parse_input_event(bewegung)
	await _warte(1.0)
	root.get_node("G").show_hover_text("Sofa")
	await _foto("foto_2_leiste")
	# Gespräch mit Opa: Auswahl unten
	root.get_node("G").show_hover_text()
	var dialog = root.get_node("D").get_instance("Opa")
	if dialog:
		dialog.start()
	await _warte(2.0)
	await _foto("foto_3_gespraech")
	quit(0)


func _warte(s: float) -> void:
	await create_timer(s).timeout


func _foto(name: String) -> void:
	await process_frame
	await process_frame
	var bild := root.get_texture().get_image()
	var pfad := ziel + name + ".png"
	bild.save_png(pfad)
	print("Foto: ", pfad, " ", bild.get_size())
