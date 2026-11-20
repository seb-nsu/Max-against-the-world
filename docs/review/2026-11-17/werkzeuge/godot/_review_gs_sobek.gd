extends SceneTree
## Review GS (nicht committen): Wo steht Sobek, wenn er Pixel folgt (R2b, Gefolge), nach dem
## Betreten des Thronsaals vom Nil-Delta aus? Schreibt Positionen und ein Bild.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_gs_sobek.gd -- AUSGABE

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_gs/"


func _initialize() -> void:
	_lauf.call_deferred()


func _rect(c) -> Array:
	var spr = c.get_node_or_null("Sprite2D")
	if spr == null or spr.texture == null:
		return []
	var r: Rect2 = spr.get_rect()
	var a: Vector2 = spr.global_transform * r.position
	var b: Vector2 = spr.global_transform * r.end
	return [roundi(minf(a.x, b.x)), roundi(minf(a.y, b.y)), roundi(maxf(a.x, b.x)), roundi(maxf(a.y, b.y))]


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		aus = a.trim_suffix("/") + "/"
	var S = root.get_node("Spiel")
	var Z = root.get_node("Zustand")
	var R = root.get_node("R")
	var C = root.get_node("C")
	var E = root.get_node("E")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return E.in_room, 15.0)
	S.welt_beginnen("welt-2")
	await _warte_bis(func(): return R.current and R.current.raum_id() == "nil_delta" and S.in_szene == 0, 30.0)
	Z.loese("R1")
	Z.setze("W2_SOBEK_FOLGT")
	Z.setze("W2_BESUCHT_THRONSAAL_RAMSES")
	for vor_duell in [true, false]:
		if not vor_duell:
			Z.setze("W2_DUELL")
		S.herkunft_raum = "NilDelta"
		R.goto_room("ThronsaalRamses")
		await _warte_bis(func(): return R.current and R.current.raum_id() == "thronsaal_ramses" and E.in_room and S.in_szene == 0, 30.0)
		for i in 40:
			await process_frame
		var sob = C.get_character("Sobek")
		print("Duell=", not vor_duell, " Max ", C.Max.position, " Pixel ", C.Pixel.position, " Sobek ", sob.position if sob else null,
			" im Raum ", R.current.has_character("Sobek"), " Sprite ", _rect(sob) if sob else [], " Variante ", sob.get("grafik_variante") if sob else "")
		var img := root.get_texture().get_image()
		img.convert(Image.FORMAT_RGBA8)
		img.resize(640, 360, Image.INTERPOLATE_NEAREST)
		img.save_png(aus + "sobek_thronsaal_%s.png" % ("vor_duell" if vor_duell else "duell"))
		S.herkunft_raum = ""
		R.goto_room("NilDelta")
		await _warte_bis(func(): return R.current and R.current.raum_id() == "nil_delta" and E.in_room and S.in_szene == 0, 30.0)
		for i in 20:
			await process_frame
	print("FERTIG")
	quit(0)


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true
