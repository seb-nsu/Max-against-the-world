extends SceneTree
## Bildfolgen aus dem echten Spiel (nur lokal, nicht committen).
## godot --path . --position 6000,3000 --resolution 1920x1080 -s res://tests/_film.gd -- ZIEL SZENE
const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var ziel := ""
var szene := ""
var csv := []

func _initialize() -> void:
	_lauf.call_deferred()

func _n(n: String) -> Node:
	return root.get_node(n)

func _lauf() -> void:
	await process_frame
	var args := OS.get_cmdline_user_args()
	ziel = args[0].trim_suffix("/") + "/"
	szene = args[1]
	DirAccess.make_dir_recursive_absolute(ziel)
	var spiel = _n("Spiel")
	spiel.testmodus = true
	_n("E").settings.auto_continue_text = true
	CQSaveLoad.ordner = "user://film_saves/%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte(2.0)
	await call("_s_" + szene)
	quit(0)

func _raum(name: String) -> void:
	_n("Spiel").testmodus = true
	_n("R").goto_room(name)
	for i in 100:
		await _warte(0.1)
		if is_instance_valid(_n("R").current) and _n("R").current.script_name == name and _n("E").in_room:
			break
	await _warte(1.0)

func _echt() -> void:
	_n("Spiel").testmodus = false

func _figur(sn: String) -> Node:
	return _n("C").get_character(sn) if _n("C").has_method("get_character") else _n("C").get(sn)

func _film(name: String, sekunden: float, fps := 20.0, fig: Array = []) -> void:
	var n := int(sekunden * fps)
	for i in n:
		await process_frame
		var bild := root.get_texture().get_image()
		bild.resize(640, 360, Image.INTERPOLATE_NEAREST)
		bild.save_png(ziel + "%s_%04d.png" % [name, i])
		var z := str(i)
		for f in fig:
			if is_instance_valid(f):
				z += ";%s;%.1f;%.1f;%d" % [f.script_name, f.position.x, f.position.y, f.get_node("Sprite2D").frame]
		csv.append(z)
		await _warte(1.0 / fps)
	var d := FileAccess.open(ziel + name + ".csv", FileAccess.WRITE)
	d.store_string("\n".join(csv)); csv.clear()

func _foto(name: String) -> void:
	await process_frame
	await process_frame
	var bild := root.get_texture().get_image()
	bild.resize(640, 360, Image.INTERPOLATE_NEAREST)
	bild.save_png(ziel + name + ".png")
	print("Foto ", name)

func _warte(s: float) -> void:
	await create_timer(s).timeout

# --- Szenen ---
func _s_max_gang() -> void:
	var m = _n("C").player
	_echt()
	m.position = Vector2(200, 320); m.sync_buffered_position() if m.has_method("sync_buffered_position") else null
	await _warte(0.5)
	m.walk_to(Vector2(560, 320))
	await _film("max_gang", 3.2, 20.0, [m])

func _s_opa() -> void:
	await _raum("Dachboden")
	await _warte(1.0)
	var opa = _figur("Opa")
	var m = _n("C").player
	_echt()
	await _foto("opa_stand")
	opa.walk_to(opa.position + Vector2(-110, 0))
	await _film("opa_geht", 3.0, 20.0, [opa, m])
	_n("Spiel").sagen("OPA", "P0_DACH_OPA_0060")
	await _film("opa_redet", 2.0, 10.0, [opa])

func _welt1() -> void:
	_n("Spiel").testmodus = true
	_n("Spiel").welt_beginnen("welt-1")
	await _warte(4.0)

func _raumfoto(raum: String, name: String, max_x := -1.0) -> void:
	await _raum(raum)
	var m = _n("C").player
	if max_x >= 0.0 and is_instance_valid(m):
		m.position.x = max_x
		if m.has_method("sync_buffered_position"):
			m.sync_buffered_position()
	await _warte(1.5)
	await _foto(name)

func _s_raeume() -> void:
	await _raumfoto("Dachboden", "r_dachboden")
	await _welt1()
	await _raumfoto("Trollbruecke", "r_trollbruecke")
	await _raumfoto("Taverne", "r_taverne")
	await _raumfoto("Luftschloss", "r_luftschloss", 820.0)
	await _raumfoto("Bergwerk", "r_bergwerk")
	await _raumfoto("Turmkeller", "r_turmkeller")
	await _raumfoto("Abstellkammern", "r_abstellkammern")
	await _raumfoto("Dorfplatz", "r_dorfplatz")

func _s_nah() -> void:
	_echt()
	_n("Spiel").nahansicht_zeigen("kalender")
	await _warte(1.0)
	await _foto("nah_kalender")

func _s_notizbuch() -> void:
	await _welt1()
	_echt()
	_n("Spiel").notizbuch_oeffnen()
	await _warte(1.0)
	await _foto("notizbuch")

func _s_turm() -> void:
	await _welt1()
	await _raum("Turmkeller")
	_echt()
	await _film("turm_besen", 3.0, 8.0)

func _s_raeume2() -> void:
	await _welt1()
	await _raumfoto("Taverne", "r2_taverne")
	await _raumfoto("Wasserschloss", "r2_wasserschloss", 324.0)
	await _raumfoto("Zauberwald", "r2_zauberwald_rechts", 760.0)
	await _raumfoto("Zauberstabladen", "r2_zauberstabladen")
	await _raumfoto("Klassenzimmer", "r2_klassenzimmer")
	await _raumfoto("Dorfplatz", "r2_dorfplatz_links", 300.0)
	_n("Zustand").loese("R10")
	await _raumfoto("Bergwerk", "r2_bergwerk_rechts", 1100.0)
	_n("Zustand").loese("R8")
	await _raumfoto("Dorfplatz", "r2_dorfplatz_ranke", 760.0)
