extends SceneTree
## Review 20.11. (Narrative, nicht committen): zeigt Welt-3-Erzählzeilen (NAR) wie im Spiel über
## Spiel._erzaehlen und nimmt sie nach 1 s auf. Prüft Zeichen (↔), Umbruch und Länge.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_nd_nar.gd -- AUSGABE [en]

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
const ZEILEN := ["W3_TUER_NAR_0190", "W3_TURM_NAR_0080", "W3_SOFA_NAR_0480", "W3_KAM3_NAR_0100"]
var aus := "user://review_nd/"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var sprache := "de"
	for a in OS.get_cmdline_user_args():
		if a == "en":
			sprache = "en"
		else:
			aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	TranslationServer.set_locale(sprache)
	var S = root.get_node("Spiel")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	var ende := Time.get_ticks_msec() + 15000
	while not root.get_node("E").in_room and Time.get_ticks_msec() < ende:
		await process_frame
	for i in 30:
		await process_frame
	for z in ZEILEN:
		var t: String = TranslationServer.translate(z)
		print("ND NAR ", z, " ", sprache, " Zeichen=", t.length(), " Dauer=", clampf(t.length() / 13.0, 1.6, 8.0))
		S._erzaehlen(t)
		await create_timer(1.0).timeout
		var img := root.get_texture().get_image()
		img.resize(640, 360, Image.INTERPOLATE_NEAREST)
		img.save_png(aus + "nar_%s_%s.png" % [z, sprache])
		await create_timer(8.0).timeout
	quit(0)
