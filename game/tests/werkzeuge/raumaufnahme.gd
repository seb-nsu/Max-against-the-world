extends SceneTree
## Werkzeug Raumaufnahme (kein CI-Test): nimmt jeden Raum eines Abschnitts mit Figuren auf, als
## Bild mit Max an der Startstelle und als Panorama über die ganze Breite, und schreibt alle
## Klickflächen, Props, Figuren, Laufbereiche und Marker als JSON daneben. Fester Schritt vor
## jedem Grafik-Einbau-PR (Prüftor: Raumaufnahme mit allen Figuren). Aus dem Review 20.11.
## (`_review_w3_raeume.gd`), jetzt mit Abschnitt als Parameter.
##
## Aufruf aus dem Checkout (mit Fenster, außerhalb des Bildschirms):
##   godot --path game --position 6000,3000 -s res://tests/werkzeuge/raumaufnahme.gd -- \
##       ABSCHNITT [AUSGABE] [ende|varianten|code] [nur=raum,raum]
## ABSCHNITT: prolog, welt-1 … welt-4, finale (Räume aus dem Bauplan res://daten/raeume/).
## AUSGABE: Ordner, Standard user://raumaufnahme/<abschnitt>/.
## „ende“: alle Rätsel des Abschnitts gelöst. „varianten“: Zustandsbilder laut VARIANTEN.
## „code“: zusätzlich die Code-Sicht je Raum (nur Welt 3, Räume mit Code-Sicht-Bild).
## Ausgabe je Raum: <raum>_<modus>_mitmax.png, <raum>_<modus>.png (Panorama), <raum>_<modus>.json.

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := ""
var modus := "anfang"
var welt := ""
var nur: Array = []

## Zustands-Varianten je Abschnitt: Raum -> Schalter-Kombinationen (mit + verbunden, R… = Rätsel
## gelöst). Neue Welten hier ergänzen.
const VARIANTEN := {
	"welt-3": {
		"apothekengasse": ["R3a"],
		"widerstandsbasis": ["W3_SCHNEE", "R13", "R13+W3_SCHNEE"],
		"kuehlung": ["W3_EIMER_GEKIPPT"],
		"laboreingang": ["W3_PANZERTUER_OFFEN"],
		"stadtstrasse": ["W3_NACHT", "W3_WECKER_KLINGELT", "W3_NACHT+W3_WECKER_KLINGELT"],
		"kueche_orakel": ["R4"],
		"testkammer_1": ["R9b+W3_PORTAL_GENOMMEN"],
		"testkammer_2": ["R9c"],
		"testkammer_3": ["R9d"],
		"kern": ["W3_ZELLE_KALT", "R11"],
	},
}


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var B = root.get_node("Bauplan")
	for a in OS.get_cmdline_user_args():
		if a.begins_with("nur="):
			nur = Array(a.trim_prefix("nur=").split(","))
		elif a in ["ende", "varianten", "code"]:
			modus = a
		elif B.plaene.has(a):
			welt = a
		else:
			aus = a.trim_suffix("/") + "/"
	if welt == "":
		print("FEHLER: Abschnitt fehlt, z. B. -- welt-3 (bekannt: %s)" % ", ".join(B.plaene.keys()))
		quit(2)
		return
	if aus == "":
		aus = "user://raumaufnahme/%s/" % welt
	aus = ProjectSettings.globalize_path(aus)
	DirAccess.make_dir_recursive_absolute(aus)
	var raeume: Array = []
	for r in B.plaene[welt].get("raeume", []):
		if ResourceLoader.exists("res://game/rooms/%s/room_%s.tscn" % [r.id, r.id]):
			raeume.append(r.id)
	var S = root.get_node("Spiel")
	var Z = root.get_node("Zustand")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	if welt != "prolog":
		S.welt_beginnen(welt)
		await _warte_bis(func(): return _raum_id() != "" and _raum_id() != "wohnzimmer", 15.0)
		await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
	if modus == "ende":
		for r in _raetsel(welt):
			Z.loese(r)
	var varianten: Dictionary = VARIANTEN.get(welt, {})
	for rid in raeume:
		if not nur.is_empty() and not rid in nur:
			continue
		if modus == "varianten":
			for v in varianten.get(rid, []):
				for s in v.split("+"):
					if s.begins_with("R"):
						Z.loese(s)
					else:
						Z.setze(s)
				await _geh(rid)
				modus = "var_" + v.replace("+", "_").to_lower()
				await _aufnahme(welt, rid)
				modus = "varianten"
				for s in v.split("+"):
					if not s.begins_with("R"):
						Z.setze(s, false)
			continue
		if modus == "code" and not ResourceLoader.exists("res://grafik/oberflaeche/code_sicht/%s.png" % rid):
			continue
		await _geh(rid)
		await _aufnahme(welt, rid)
	print("Ausgabe: ", aus)
	print("FERTIG")
	quit(0)


func _raum_id() -> String:
	var r = root.get_node("R").current
	return r.raum_id() if is_instance_valid(r) and r.has_method("raum_id") else ""


func _raetsel(welt: String) -> Array:
	var ids := []
	var pfad := "res://daten/welten/%s.json" % welt
	if not FileAccess.file_exists(pfad):
		return ids
	var d: Variant = JSON.parse_string(FileAccess.get_file_as_string(pfad))
	if typeof(d) == TYPE_DICTIONARY and d.has("raetsel"):
		var r = d.raetsel
		if typeof(r) == TYPE_DICTIONARY:
			ids = r.keys()
		else:
			for e in r:
				ids.append(e.id)
	return ids


func _poly(node: Node) -> Array:
	var out := []
	var pn = node.get_node_or_null("InteractionPolygon")
	if pn and pn is CollisionPolygon2D:
		for p in pn.polygon:
			var g: Vector2 = pn.global_transform * p
			out.append([roundi(g.x), roundi(g.y)])
	return out


func _aufnahme(welt: String, rid: String) -> void:
	if _raum_id() != rid:
		return  # nicht erreicht (Meldung in _geh), kein falsches Bild unter diesem Namen
	var raum = root.get_node("R").current
	var breite := int(raum.get("width")) if raum.get("width") else 640
	var mx = root.get_node("C").player
	var info := {"welt": welt, "raum": rid, "modus": modus, "breite": breite, "hotspots": [], "props": [],
		"figuren": [], "laufbereiche": [], "marker": {}, "bauplan_laufbereich": []}
	if raum.has_method("bauplan"):
		info.bauplan_laufbereich = raum.bauplan().get("laufbereich", [])
		info.tiefe = raum.bauplan().get("tiefe", null)
		info.skala = raum.bauplan().get("skala", null)
	for h in raum.get_hotspots():
		info.hotspots.append({"name": h.name, "text": str(h.get("description")), "sichtbar": h.visible,
			"klickbar": h.get("clickable"), "baseline": h.baseline, "pos": [h.global_position.x, h.global_position.y],
			"walk_to": [h.walk_to_point.x, h.walk_to_point.y], "poly": _poly(h)})
	for p in raum.get_props():
		var spr = p.get_node_or_null("Sprite2D")
		var rect := []
		if spr and spr.texture:
			var r: Rect2 = spr.get_rect()
			var a: Vector2 = spr.global_transform * r.position
			var b: Vector2 = spr.global_transform * r.end
			rect = [roundi(a.x), roundi(a.y), roundi(b.x), roundi(b.y)]
		info.props.append({"name": p.name, "text": str(p.get("description")), "sichtbar": p.visible,
			"klickbar": p.get("clickable"), "baseline": p.baseline, "z": p.z_index,
			"pos": [p.global_position.x, p.global_position.y], "rect": rect, "poly": _poly(p),
			"walk_to": [p.walk_to_point.x, p.walk_to_point.y]})
	for c in raum.get_characters():
		var ap = c.get_node_or_null("AnimationPlayer")
		var anims := []
		if ap:
			anims = Array(ap.get_animation_list())
		var spr = c.get_node_or_null("Sprite2D")
		var rect := []
		if spr and spr.texture:
			var r: Rect2 = spr.get_rect()
			var a: Vector2 = spr.global_transform * r.position
			var b: Vector2 = spr.global_transform * r.end
			rect = [roundi(a.x), roundi(a.y), roundi(b.x), roundi(b.y)]
		info.figuren.append({"name": c.script_name, "sichtbar": c.visible, "pos": [c.global_position.x, c.global_position.y],
			"skala": [c.scale.x, c.scale.y], "baseline": c.baseline, "z": c.z_index, "rect": rect, "poly": _poly(c),
			"anim_aktuell": ap.current_animation if ap else "", "anims": anims,
			"walk_speed": c.get("walk_speed"), "variante": c.get("grafik_variante")})
	for w in raum.get_walkable_areas():
		var polys := []
		for pg in w.interaction_polygon:
			var pts := []
			for p in pg:
				var g: Vector2 = w.global_transform * (p + w.interaction_polygon_position)
				pts.append([roundi(g.x), roundi(g.y)])
			polys.append(pts)
		info.laufbereiche.append({"name": w.name, "polys": polys})
	for m in raum.get_markers():
		info.marker[m.name] = [m.global_position.x, m.global_position.y]
	# Bild mit Max an der Startstelle (Kameraausschnitt)
	for i in 30:
		await process_frame
	var img := root.get_texture().get_image()
	img.convert(Image.FORMAT_RGBA8)
	img.resize(640, 360, Image.INTERPOLATE_NEAREST)
	img.save_png(aus + "%s_%s_mitmax.png" % [rid, modus])
	var cam = raum.get_viewport().get_camera_2d()
	info.kamera_max = [cam.get_screen_center_position().x, cam.get_screen_center_position().y] if cam else []
	# Panorama ohne Max
	var ges := Image.create(breite, 360, false, Image.FORMAT_RGBA8)
	var mpos: Vector2 = mx.position
	for px in range(0, breite, 640):
		var sx := mini(px, breite - 640)
		mx.position = Vector2(sx + 320, mpos.y)
		for i in 40:
			await process_frame
		mx.visible = false
		await process_frame
		await process_frame
		var im := root.get_texture().get_image()
		im.convert(Image.FORMAT_RGBA8)
		im.resize(640, 360, Image.INTERPOLATE_NEAREST)
		ges.blit_rect(im, Rect2i(0, 0, 640, 360), Vector2i(sx, 0))
		mx.visible = true
	mx.position = mpos
	ges.save_png(aus + "%s_%s.png" % [rid, modus])
	if modus == "code":
		var W = root.get_node("Spiel").regeln()
		W._code_sicht_zeigen(rid)
		var ges2 := Image.create(breite, 360, false, Image.FORMAT_RGBA8)
		for px in range(0, breite, 640):
			var sx := mini(px, breite - 640)
			mx.position = Vector2(sx + 320, mpos.y)
			for i in 40:
				await process_frame
			var im2 := root.get_texture().get_image()
			im2.convert(Image.FORMAT_RGBA8)
			im2.resize(640, 360, Image.INTERPOLATE_NEAREST)
			ges2.blit_rect(im2, Rect2i(0, 0, 640, 360), Vector2i(sx, 0))
		mx.position = mpos
		ges2.save_png(aus + "%s_codesicht.png" % rid)
		W._code_sicht_weg()
	var f := FileAccess.open(aus + "%s_%s.json" % [rid, modus], FileAccess.WRITE)
	f.store_string(JSON.stringify(info, "  "))
	f.close()
	print("RAUM ", rid, " ", modus, " ok")


## Geht in den Raum; läuft beim ersten Versuch noch eine Szene (Ankunft, Welt-Intro), greift der
## Raumwechsel nicht, dann bis zu zwei weitere Versuche.
func _geh(rid: String) -> void:
	for versuch in 3:
		await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
		root.get_node("Spiel").herkunft_raum = ""
		root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
		await _warte_raum(rid)
		if _raum_id() == rid:
			return
	print("FEHLER: Raum %s nicht erreicht (aufgenommen wird %s)" % [rid, _raum_id()])


func _warte_raum(rid: String) -> void:
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
