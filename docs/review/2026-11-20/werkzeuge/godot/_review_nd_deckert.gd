extends SceneTree
## Review 20.11. (Narrative, nicht committen): Läuft der Mensch-Test über das Gespräch (waehlen,
## also mit opt.used), und ist er nach einer falschen Antwort noch einmal startbar?
## Aufruf: godot --headless --path game -s res://tests/_review_nd_deckert.gd

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var S = root.get_node("Spiel")
	var Z = root.get_node("Zustand")
	S.testmodus = true
	CQSaveLoad.ordner = "user://test_saves/review_nd_%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	var ende := Time.get_ticks_msec() + 15000
	while not root.get_node("E").in_room and Time.get_ticks_msec() < ende:
		await process_frame
	S.welt_beginnen("welt-3")
	ende = Time.get_ticks_msec() + 15000
	while Time.get_ticks_msec() < ende:
		await process_frame
		if root.get_node("R").current and str(root.get_node("R").current.script_name).to_lower().contains("unterstadt"):
			break
	for i in 60:
		await process_frame
	var d = root.get_node("D").get_instance("Deckert")
	print("ND DECKERT vor Beobachtungen: 0090 sichtbar=", d.option_sichtbar("0090"), " erschoepft=", d.erschoepft())
	# erster Versuch ohne Beobachtungen: logische Antwort (Index 0) fällt durch
	S.vorgabe_auswahl = [0]
	var weiter = await d.waehlen("0090")
	print("ND DECKERT nach Durchfallen: weiter=", weiter, " R1b=", Z.geloest("R1b"), " 0090 sichtbar=", d.option_sichtbar("0090"), " erschoepft=", d.erschoepft())
	for f in ["frau_regenschirm", "strassenmusiker_w3", "weinender_mann"]:
		await S.regel("ansehen", f)
	print("ND DECKERT mit Beobachtungen (R1a=", Z.geloest("R1a"), "): 0090 sichtbar=", d.option_sichtbar("0090"), " erschoepft=", d.erschoepft())
	# auch die Plauderoptionen nutzen, dann prüfen, ob noch etwas angeboten wird
	for id in ["0040", "0060"]:
		await d.waehlen(id)
	print("ND DECKERT nach 0040/0060: 0090 sichtbar=", d.option_sichtbar("0090"), " erschoepft=", d.erschoepft())
	quit(0)
