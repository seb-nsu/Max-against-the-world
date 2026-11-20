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

func _s_werkstatt() -> void:
	await _welt1()
	await _raum("Schmiede")
	_echt()
	_n("R").current._zustand_anwenden()
	await _warte(0.5)
	await _film("schmied", 1.6, 20.0)
	await _raum("Klassenzimmer")
	_echt()
	_n("R").current._zustand_anwenden()
	await _warte(0.5)
	await _film("alwin", 1.2, 20.0)
	await _raum("Turmkeller")
	_echt()
	await _film("besen", 3.0, 10.0)
	_n("Zustand").loese("R10")
	await _raum("Bergwerk")
	var m = _n("C").player
	m.position.x = 1050.0
	await _warte(1.0)
	await _foto("bergwerk_tuer")
	await _raum("Zauberwald")
	m = _n("C").player
	m.position.x = 700.0
	await _warte(1.0)
	await _foto("zauberwald_pilze")

func _s_dach() -> void:
	await _raumfoto("Dachboden", "dach")

func _s_effekte() -> void:
	await _welt1()
	for r in ["Taverne", "Klassenzimmer", "Schmiede", "Turmkeller", "Trollbruecke"]:
		await _raum(r)
		_echt()
		_n("R").current._effekte_setzen()
		await _warte(1.5)
		await _film("eff_" + r.to_lower(), 1.2, 10.0)

func _s_kamin() -> void:
	await _welt1()
	await _raum("Taverne")
	var m = _n("C").player
	for p in [Vector2(485, 250), Vector2(470, 236), Vector2(500, 240)]:
		m.position = p
		if m.has_method("sync_buffered_position"):
			m.sync_buffered_position()
		await _warte(0.6)
		await _foto("kamin_%d_%d" % [p.x, p.y])

func _s_liegen() -> void:
	_echt()
	var raum = _n("R").current
	raum._liegen_an()
	_n("Spiel").sagen("MAX", "P0_WOHN_MAX_0010")
	await _warte(0.3)
	await _film("liegen", 1.2, 12.0)

func _s_treppe() -> void:
	await _raum("Treppenhaus")
	var m = _n("C").player
	m.position = Vector2(380, 330)
	if m.has_method("sync_buffered_position"):
		m.sync_buffered_position()
	_echt()
	await _warte(0.5)
	m.walk_to(Vector2(592, 50))
	var zeilen := []
	for i in 140:
		await _warte(0.05)
		zeilen.append("%.0f;%.0f;%.1f" % [m.position.x, m.position.y, m.get_node("Sprite2D").position.y])
		if i % 6 == 0:
			await _foto("treppe_%03d" % i)
	var d := FileAccess.open(ziel + "treppe.csv", FileAccess.WRITE)
	d.store_string("\n".join(zeilen))

func _s_werkbank() -> void:
	await _raum("Dachboden")
	_echt()
	var r = _n("R").current
	_n("C").Pixel.position = Vector2(262, 272)
	r._pixel_auf_die_werkbank()
	await _film("werkbank", 1.4, 12.0)

func _s_folgen() -> void:
	await _welt1()
	await _raum("Dorfplatz")
	_echt()
	var m = _n("C").player
	var px = _n("C").Pixel
	await _warte(0.5)
	m.walk_to(Vector2(m.position.x + 300, 300))
	var zeilen := []
	for i in 80:
		await _warte(0.05)
		zeilen.append("%.0f;%.0f;%.0f;%.0f" % [m.position.x, m.position.y, px.position.x, px.position.y])
	var d := FileAccess.open(ziel + "folgen.csv", FileAccess.WRITE)
	d.store_string("\n".join(zeilen))
	await _foto("folgen_ende")

func _s_bruecke() -> void:
	await _welt1()
	await _raum("Dorfplatz")
	_echt()
	_n("E").settings.auto_continue_text = true
	var aus = _n("R").current.get_hotspot("Waldweg")
	aus.on_click()
	var zeilen := []
	for i in 300:
		await _warte(0.05)
		var m = _n("C").player
		var r = _n("R").current
		zeilen.append("%s;%.0f;%.0f" % [r.script_name if r else "-", m.position.x, m.position.y])
		if i % 20 == 0:
			await _foto("bruecke_%03d" % i)
	var d := FileAccess.open(ziel + "bruecke.csv", FileAccess.WRITE)
	d.store_string("\n".join(zeilen))

func _s_sperre() -> void:
	await _welt1()
	await _raum("Trollbruecke")
	_echt()
	var m = _n("C").player
	m.walk_to(Vector2(600, 228))
	for i in 160:
		await _warte(0.05)
	await _foto("sperre")
	print("SPERRE ", m.position)

func _s_ruhe() -> void:
	await _welt1()
	await _raum("Dorfplatz")
	_echt()
	var m = _n("C").player
	var px = _n("C").Pixel
	var ap: AnimationPlayer = px.get_node("AnimationPlayer")
	px._play_idle()
	await _warte(0.5)
	print("start ", ap.current_animation)
	m.walk_to(Vector2(m.position.x + 300, 300))
	for i in 20:
		await _warte(1.0)
		print("t=%d mm=%s mt=%s pm=%s pt=%s anim=%s w=%s s=%s auto=%s idle=%s" % [i, m.is_moving, m.is_talking, px.is_moving, px.is_talking, ap.current_animation, px._warten, px._sitzt, px._automatisch(), str([px.is_inside_tree(), px.get_path() if px.is_inside_tree() else "", px._takt != null and px._takt.is_inside_tree(), px._takt.time_left if px._takt else -1, px._takt.is_stopped() if px._takt else true, px.can_process(), px.process_mode])])
	await _foto("ruhe_sitzt")
	m.walk_to(Vector2(m.position.x - 100, 300))
	await _warte(0.6)
	print("nach Losgehen: ", ap.current_animation)
	await _foto("ruhe_steht")

func _s_eintritt() -> void:
	await _welt1()
	await _raum("Dorfplatz")
	_echt()
	var aus = _n("R").current.get_node("Hotspots").get_children().filter(func(h): return h.script_name.to_lower().contains("hoggelwarz") or h.script_name.to_lower().contains("klassen"))
	print("Ausgang ", aus)
	aus[0].on_click()
	await _warte(0.25)
	for i in 60:
		await _warte(0.2)
		var m = _n("C").player
		print("t=%.1f raum=%s pos=%s moving=%s" % [i*0.2, _n("R").current.script_name, m.position, m.is_moving])
	await _foto("eintritt")

func _s_pixgang() -> void:
	await _welt1()
	await _raum("Dorfplatz")
	_echt()
	var m = _n("C").player
	var px = _n("C").Pixel
	await _warte(0.5)
	px.walk_to(Vector2(px.position.x + 250, px.position.y + 10))
	await _film("pg", 1.4, 15.0, [px])

func _s_flieger() -> void:
	await _welt1()
	await _raum("Klassenzimmer")
	_echt()
	var amb = _n("R").current.get_node_or_null("Ambiente")
	if amb == null:
		amb = _n("R").current.ambiente_starten()
	amb._flieger("schueler")
	for i in 6:
		await _warte(0.35)
		await _foto("fl_%d" % i)

func _s_tav() -> void:
	await _welt1()
	await _raum("Dorfplatz")
	_echt()
	_n("Spiel").raum_wechseln("taverne")
	var px = _n("C").Pixel
	for i in 40:
		await _warte(1.0)
		if i % 3 == 0:
			print("t=%d raum=%s pix=%s anim=%s szene=%d" % [i, _n("R").current.script_name, px.position, px.get_node("AnimationPlayer").current_animation, _n("Spiel").in_szene])
	await _foto("tav")

func _s_tav2() -> void:
	await _welt1()
	await _raum("Dorfplatz")
	_echt()
	_n("Spiel").raum_wechseln("taverne")
	await _warte(45.0)
	await _foto("tav_a")
	var m = _n("C").player
	var px = _n("C").Pixel
	m.walk_to(Vector2(200, 300))
	for i in 12:
		await _warte(1.0)
		print("t=%d pix=%s anim=%s max=%s" % [i, px.position, px.get_node("AnimationPlayer").current_animation, m.position])
	await _foto("tav_b")
	_n("Spiel").raum_wechseln("dorfplatz")
	await _warte(4.0)
	_n("Spiel").raum_wechseln("taverne")
	await _warte(5.0)
	print("zurück pix=%s" % [px.position])
	await _foto("tav_c")

func _s_tavvgl() -> void:
	await _welt1()
	await _raum("Taverne")
	var px = _n("C").Pixel
	px.position = Vector2(150, 300)
	px.idle_animation = "idle"
	px._play_idle()
	await _warte(1.0)
	await _foto("tavvgl")
