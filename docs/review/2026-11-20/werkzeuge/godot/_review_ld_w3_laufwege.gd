extends SceneTree
## Review 20.11. (Level Design, Welt 3): Figur läuft per walk (echte Wegfindung) von A nach B.
## Protokolliert Dauer, Endpunkt, Weglänge, Tempo und Skala; macht Bilder an Prüfstellen.
## Wird nicht committet. Aufruf:
## godot --path game --position 6000,3000 -s res://tests/_review_ld_w3_laufwege.gd -- AUSGABE [nur=raum]

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_ld_w3/"
var nur := ""

# [kürzel, raum, figur, start, ziel, bilder bei x-Werten (leer = nur Ende)]
const LAEUFE := [
	# Tempo vorn / hinten (waagerecht, 200 px)
	["t_vorn", "unterstadt_strasse", "Max", Vector2(300, 350), Vector2(500, 350), []],
	["t_hinten", "unterstadt_strasse", "Max", Vector2(300, 292), Vector2(500, 292), []],
	["t_vorn", "apothekengasse", "Max", Vector2(200, 350), Vector2(400, 350), []],
	["t_hinten", "apothekengasse", "Max", Vector2(200, 304), Vector2(400, 304), []],
	["t_vorn", "widerstandsbasis", "Max", Vector2(300, 350), Vector2(500, 350), []],
	["t_hinten", "widerstandsbasis", "Max", Vector2(300, 306), Vector2(500, 306), []],
	["t_vorn", "kuehlung", "Pixel", Vector2(150, 350), Vector2(350, 350), []],
	["t_hinten", "kuehlung", "Pixel", Vector2(150, 290), Vector2(350, 290), []],
	["t_vorn", "laboreingang", "Max", Vector2(200, 350), Vector2(400, 350), []],
	["t_hinten", "laboreingang", "Max", Vector2(200, 276), Vector2(400, 276), []],
	["t_vorn", "stadtstrasse", "Max", Vector2(300, 350), Vector2(500, 350), []],
	["t_hinten", "stadtstrasse", "Max", Vector2(300, 328), Vector2(500, 328), []],
	["t_vorn", "kueche_orakel", "Max", Vector2(250, 353), Vector2(450, 353), []],
	["t_hinten", "kueche_orakel", "Max", Vector2(470, 292), Vector2(550, 292), []],
	["t_vorn", "buero_50", "Max", Vector2(150, 350), Vector2(350, 350), []],
	["t_hinten", "buero_50", "Max", Vector2(200, 274), Vector2(400, 274), []],
	["t_vorn", "testkammer_1", "Max", Vector2(100, 350), Vector2(300, 350), []],
	["t_hinten", "testkammer_1", "Max", Vector2(170, 272), Vector2(370, 272), []],
	["t_vorn", "kern", "Max", Vector2(150, 350), Vector2(350, 350), []],
	["t_hinten", "kern", "Max", Vector2(320, 312), Vector2(500, 314), []],
	# Wege zwischen Rätselstellen
	["w_basis_luke_laborgang", "unterstadt_strasse", "Max", Vector2(612, 298), Vector2(1258, 322), []],
	["w_nudel_laborgang", "unterstadt_strasse", "Max", Vector2(120, 302), Vector2(1258, 322), []],
	["w_gasse_zelle", "unterstadt_strasse", "Max", Vector2(1008, 300), Vector2(398, 300), []],
	["w_zum_vordach", "unterstadt_strasse", "Max", Vector2(640, 330), Vector2(850, 302), []],
	["w_eingang_automat", "apothekengasse", "Max", Vector2(140, 322), Vector2(645, 316), []],
	["w_gasse_rechts", "apothekengasse", "Max", Vector2(140, 322), Vector2(1100, 330), [500, 700, 900]],
	["w_luke_kapsel", "widerstandsbasis", "Max", Vector2(95, 336), Vector2(170, 326), []],
	["w_kapsel_schacht", "widerstandsbasis", "Pixel", Vector2(170, 326), Vector2(1180, 340), []],
	["w_kapsel_tasse", "widerstandsbasis", "Pixel", Vector2(170, 326), Vector2(1050, 322), []],
	["w_zum_stromkasten", "widerstandsbasis", "Max", Vector2(565, 322), Vector2(690, 322), []],
	["w_zum_steuerpult", "widerstandsbasis", "Max", Vector2(170, 326), Vector2(800, 322), []],
	["w_schacht_eimer", "kuehlung", "Pixel", Vector2(120, 322), Vector2(462, 304), []],
	["w_eingang_kartenleser", "laboreingang", "Max", Vector2(150, 300), Vector2(415, 290), []],
	["w_zum_hausmeisterplatz", "laboreingang", "Max", Vector2(150, 300), Vector2(455, 295), []],
	["w_wecker_buero", "stadtstrasse", "Max", Vector2(200, 344), Vector2(1148, 306), [640, 1000]],
	["w_buero_wecker", "stadtstrasse", "Max", Vector2(1148, 312), Vector2(150, 334), []],
	["w_wecker_kueche", "stadtstrasse", "Max", Vector2(200, 344), Vector2(520, 330), []],
	["w_durch_nachttisch", "stadtstrasse", "Max", Vector2(260, 327), Vector2(60, 327), [140]],
	["w_zum_auto", "stadtstrasse", "Max", Vector2(200, 344), Vector2(380, 326), []],
	["w_tuer_ofen", "kueche_orakel", "Max", Vector2(560, 336), Vector2(180, 322), []],
	["w_tuer_eieruhr", "kueche_orakel", "Max", Vector2(560, 336), Vector2(540, 300), []],
	["w_lift_wasserspender", "buero_50", "Max", Vector2(105, 330), Vector2(525, 338), []],
	["w_lift_klone", "buero_50", "Max", Vector2(105, 330), Vector2(250, 312), []],
	["w_eingang_ausgang", "testkammer_1", "Max", Vector2(95, 322), Vector2(522, 298), []],
	["w_tuer_tuer", "testkammer_2", "Max", Vector2(70, 330), Vector2(522, 298), [320]],
	["w_tuer_kern", "testkammer_3", "Max", Vector2(70, 330), Vector2(535, 300), [380, 470]],
	["w_tuer_sockel", "kern", "Max", Vector2(90, 340), Vector2(280, 336), []],
	["w_hinter_sockel", "kern", "Max", Vector2(150, 316), Vector2(520, 318), [300, 330]],
]


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		if a.begins_with("nur="):
			nur = a.trim_prefix("nur=")
		else:
			aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	var S = root.get_node("Spiel")
	S.testmodus = true
	CQSaveLoad.ordner = "user://test_saves/review_ld_w3_%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	S.welt_beginnen("welt-3")
	await _warte_bis(func():
		var r = root.get_node("R").current
		return r != null and r.has_method("raum_id") and r.raum_id() == "unterstadt_strasse" and root.get_node("E").in_room, 30.0)
	await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
	for i in 30:
		await process_frame
	var raum_jetzt := ""
	for l in LAEUFE:
		if nur != "" and l[1] != nur:
			continue
		if l[1] != raum_jetzt:
			await _geh(l[1])
			raum_jetzt = l[1]
		var fig = root.get_node("C").get_character(l[2])
		var andere = root.get_node("C").get_character("Pixel" if l[2] == "Max" else "Max")
		# Popochiu merkt sich die Position zusätzlich gepuffert (_buffered_position); ohne Abgleich
		# springt die Figur beim nächsten Bild an das Ende des vorigen Laufs zurück.
		fig.position = l[3]
		fig.sync_buffered_position()
		if is_instance_valid(andere):
			andere.position = Vector2(-200, 340)   # aus dem Weg, damit nur eine Figur im Bild ist
			andere.sync_buffered_position()
		for i in 20:
			await process_frame
		print("  vor dem Lauf: ", fig.position, " soll ", l[3])
		var t0 := Time.get_ticks_msec()
		var weg := 0.0
		var letzte: Vector2 = fig.position
		var marken: Array = l[5].duplicate()
		var smin := 9.0
		var smax := 0.0
		var fertig := [false]
		var lauf := func():
			await fig.walk(l[4])
			fertig[0] = true
		lauf.call()
		var max_t := t0 + 40000
		var rueckwaerts: bool = l[4].x < l[3].x
		while not fertig[0] and Time.get_ticks_msec() < max_t:
			await process_frame
			weg += fig.position.distance_to(letzte)
			letzte = fig.position
			smin = minf(smin, fig.scale.y)
			smax = maxf(smax, fig.scale.y)
			if not marken.is_empty():
				var m := float(marken[0])
				if (not rueckwaerts and fig.position.x >= m) or (rueckwaerts and fig.position.x <= m):
					_bild("%s_%s_x%d" % [l[1], l[0], int(m)])
					marken.pop_front()
		var dauer := (Time.get_ticks_msec() - t0) / 1000.0
		for i in 5:
			await process_frame
		_bild("%s_%s_ende" % [l[1], l[0]])
		print("LD %s %s %s start=%s ziel=%s ende=%s abw=%.1f dauer=%.2fs weg=%.0f luft=%.0f tempo=%.0fpx/s skala=%.3f-%.3f speed=%.0f override=%.0f cam=%s" % [
			l[1], l[0], l[2], l[3], l[4], fig.position, fig.position.distance_to(l[4]), dauer, weg,
			l[3].distance_to(l[4]), weg / maxf(dauer, 0.01), smin, smax, fig.walk_speed, fig.walk_speed_override,
			root.get_node("E").camera.get_screen_center_position()])
	print("FERTIG")
	quit(0)


func _bild(name: String) -> void:
	var img := root.get_texture().get_image()
	img.convert(Image.FORMAT_RGBA8)
	img.resize(640, 360, Image.INTERPOLATE_NEAREST)
	img.save_png(aus + name + ".png")


func _geh(rid: String) -> void:
	root.get_node("Spiel").herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_bis(func():
		var r = root.get_node("R").current
		return r != null and r.has_method("raum_id") and r.raum_id() == rid and root.get_node("E").in_room and r.is_current, 15.0)
	await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
	for i in 10:
		await process_frame


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true
