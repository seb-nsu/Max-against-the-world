extends SceneTree
## Review 17.11. (Narrative): Gespräch ohne Abschiedsoption. Wählt im Hermes-Gespräch die einzige
## Option und zählt danach die sichtbaren Optionen. Wird nicht committet.

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	root.get_node("Spiel").testmodus = true
	CQSaveLoad.ordner = "user://test_saves/review_nd_%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	var ende := Time.get_ticks_msec() + 15000
	while not root.get_node("E").in_room and Time.get_ticks_msec() < ende:
		await process_frame
	var D = root.get_node("D")
	for name in ["Hermes", "Grieche", "Faehrmann", "Cicero"]:
		var d = D.get_instance(name)
		if d == null:
			print("ND ", name, ": kein Dialog")
			continue
		d.sichtbarkeit_anpassen()
		var vorher := []
		for o in d.options:
			if o.visible:
				vorher.append(o.id)
		print("ND ", name, " sichtbar vorher: ", vorher)
		# alle Plauderoptionen (nicht beendend) der Reihe nach wählen
		for o in d.bauplan().get("optionen", []):
			if o.get("beendet", false):
				continue
			if not d.option_sichtbar(o.id):
				continue
			var weiter = await d.waehlen(o.id)
			d.sichtbarkeit_anpassen()
			var sicht := []
			for x in d.options:
				if x.visible:
					sicht.append(x.id)
			print("ND ", name, " nach ", o.id, ": weiter=", weiter, " sichtbar=", sicht, " erschoepft=", d.erschoepft())
	quit(0)
