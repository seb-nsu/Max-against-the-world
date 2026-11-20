extends SceneTree
## Review 17.11. (Level Design): Max läuft in mehreren Räumen per walk von A nach B.
## Protokolliert Dauer, Endpunkt, Weglänge; macht Bilder an Prüfstellen. Wird nicht committet.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_ld_laufwege.gd -- AUSGABE

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_ld/"

# [welt, raum, start, ziel, bilder bei x-Werten (leer = nur Ende)]
const LAEUFE := [
	["prolog", "dachboden", Vector2(200, 335), Vector2(370, 300), [300, 340]],
	["prolog", "dachboden", Vector2(200, 335), Vector2(380, 262), []],
	["welt-1", "luftschloss", Vector2(175, 270), Vector2(395, 240), [300, 360]],
	["welt-1", "luftschloss", Vector2(175, 300), Vector2(700, 230), [330, 400]],
	["welt-1", "zauberwald", Vector2(620, 300), Vector2(996, 242), []],
	["welt-2", "werkstatt", Vector2(300, 335), Vector2(610, 300), [500, 520, 540]],
]


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	var S = root.get_node("Spiel")
	S.testmodus = true
	CQSaveLoad.ordner = "user://test_saves/review_ld_%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	var welt_jetzt := "prolog"
	var nr := 0
	for l in LAEUFE:
		nr += 1
		if l[0] != welt_jetzt:
			S.welt_beginnen(l[0])
			welt_jetzt = l[0]
			var erster: String = {"welt-1": "dorfplatz", "welt-2": "nil_delta"}[l[0]]
			await _warte_bis(func():
				var r = root.get_node("R").current
				return r != null and r.has_method("raum_id") and r.raum_id() == erster and root.get_node("E").in_room, 30.0)
			await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
			for i in 30:
				await process_frame
		await _geh(l[1])
		var mx = root.get_node("C").get_character("Max")
		mx.position = l[2]
		for i in 20:
			await process_frame
		var t0 := Time.get_ticks_msec()
		var weg := 0.0
		var letzte: Vector2 = mx.position
		var marken: Array = l[4].duplicate()
		var fertig := [false]
		var lauf := func():
			await mx.walk(l[3])
			fertig[0] = true
		lauf.call()
		var max_t := t0 + 30000
		while not fertig[0] and Time.get_ticks_msec() < max_t:
			await process_frame
			weg += mx.position.distance_to(letzte)
			letzte = mx.position
			if not marken.is_empty() and mx.position.x >= float(marken[0]):
				_bild("b%02d_%s_x%d" % [nr, l[1], int(marken[0])])
				marken.pop_front()
		var dauer := (Time.get_ticks_msec() - t0) / 1000.0
		for i in 5:
			await process_frame
		_bild("b%02d_%s_ende" % [nr, l[1]])
		print("LD b%02d %s start=%s ziel=%s ende=%s abweichung=%.1f dauer=%.2fs weg=%.0f luftlinie=%.0f skala=%.3f" % [
			nr, l[1], l[2], l[3], mx.position, mx.position.distance_to(l[3]), dauer, weg,
			l[2].distance_to(l[3]), mx.scale.y])
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
