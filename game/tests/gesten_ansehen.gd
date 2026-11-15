extends SceneTree
## Gesten im echten Raum ansehen (gesten-regie.md): betritt jeden Raum von Welt 1 und Welt 2, spielt
## jede Bewegung aus CQGestenEinsatz (RUHE, WARTEN, ZEILE) der Figuren dort einmal ab und hält je
## Bewegung vier Augenblicke als Ausschnitt um die Figur fest. Ergebnis: ein Kontaktbogen je Raum
## (gesten_<raum>.png) zum Durchsehen mit dem Auge: Größe gegen den Raum, Höhe von Requisiten,
## Blickrichtung, Fußpunkt. Kein Vergleich mit Referenzen, nur Bilder.
##
## Aufruf (aus game/, unter Linux mit xvfb-run):
##   xvfb-run -s "-screen 0 1280x720x24" godot --path . --rendering-driver opengl3 \
##       --resolution 640x360 -s res://tests/gesten_ansehen.gd -- AUSGABE [raum …]

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
const ABSCHNITTE := ["welt-1", "welt-2"]
const ZELLE := Vector2i(150, 170)
const AUGENBLICKE := 4

var ausgabe := "user://gesten/"
var nur: Array[String] = []


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	var args := OS.get_cmdline_user_args()
	if not args.is_empty():
		ausgabe = args[0].trim_suffix("/") + "/"
		for a in args.slice(1):
			nur.append(a)
	ausgabe = ProjectSettings.globalize_path(ausgabe)
	DirAccess.make_dir_recursive_absolute(ausgabe)
	var spiel = root.get_node("Spiel")
	spiel.testmodus = true
	root.get_node("E").settings.auto_continue_text = true
	CQSaveLoad.ordner = "user://gesten_saves/%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	var bauplan = root.get_node("Bauplan")
	for ab in ABSCHNITTE:
		for r in bauplan.plaene.get(ab, {}).get("raeume", []):
			if not nur.is_empty() and not r.id in nur:
				continue
			await _raum(ab, r)
	print("Gesten angesehen → ", ausgabe)
	quit(0)


func _raum(ab: String, r: Dictionary) -> void:
	var spiel = root.get_node("Spiel")
	spiel.testmodus = true
	root.get_node("Zustand").abschnitt = ab
	spiel.herkunft_raum = ""
	root.get_node("R").goto_room(r.script_name)
	if not await _warte_bis(func(): return _raum_id() == r.id and root.get_node("E").in_room, 20.0):
		print("  %s: nicht erreicht" % r.id)
		return
	await _warte_bis(func(): return spiel.in_szene == 0 and not root.get_node("E").playing_queue, 20.0)
	await create_timer(0.4).timeout
	spiel.testmodus = false
	var raum = root.get_node("R").current
	raum._zustand_anwenden()
	var zellen: Array = []   # [Titel, [Bilder]]
	for c in raum.get_characters():
		if not c.has_method("geste") or not c.visible:
			continue
		# Max und Pixel sind überall gleich groß: nur in je einem Raum jeder Welt ansehen
		if c.objekt_id() in ["max", "pixel"] and not r.id in ["dorfplatz", "nil_delta"]:
			continue
		for g in _gesten(c, r.id):
			zellen.append([ "%s %s" % [c.objekt_id(), g], await _ansehen(c, g)])
	spiel.testmodus = true
	if zellen.is_empty():
		return
	_bogen(zellen).save_png(ausgabe + "gesten_%s.png" % r.id)
	for z in zellen.size():
		print("    Zeile %d: %s" % [z + 1, zellen[z][0]])
	print("  %s: %d Bewegungen" % [r.id, zellen.size()])


## Alle Bewegungen der Figur aus den Tabellen (Ruhe, Warten, Zeilen) in diesem Raum.
func _gesten(c, raum: String) -> Array[String]:
	var GE = load("res://skripte/gesten_einsatz.gd")
	var out: Array[String] = []
	# Ruhe-Schleife, die ein Raum selbst setzt (Schmied hämmert, Alwin rührt)
	if c.idle_animation != "idle":
		out.append(c.idle_animation)
	var ruhe: String = GE.ruhe_fuer(c.objekt_id(), raum)
	if not ruhe.is_empty() and not ruhe in out:
		out.append(ruhe)
	var w: Dictionary = GE.warten_fuer(c.objekt_id(), raum)
	for g in w.get("gesten", []):
		for schritt in (g if g is Array else [g]):
			var n: String = schritt[0] if schritt is Array else schritt
			if not n in out:
				out.append(n)
	for t in [GE.ZEILE] + GE.WELTEN.map(func(x): return x.ZEILE):
		for id in t:
			var e: Array = t[id]
			var f = root.get_node("Spiel").figur(e[0])
			if f == c and not e[1] in out:
				out.append(e[1])
	return out.filter(func(g): return c.hat_animation(g))


func _ansehen(c, anim: String) -> Array:
	var ap: AnimationPlayer = c.get_node("AnimationPlayer")
	var a := ap.get_animation(anim)
	var bilder: Array = []
	# Breite Räume: Die Kamera folgt der Spielfigur; die steht für die Aufnahme 200 Pixel neben der
	# Figur (außerhalb des Ausschnitts), danach wieder an ihrem Platz
	var spieler = root.get_node("C").player
	var spieler_ort: Vector2 = spieler.position if spieler and spieler != c else Vector2.ZERO
	if spieler and spieler != c:
		spieler.position = c.position + Vector2(200 if c.position.x < 640 else -200, 0)
		for i in 6:
			await process_frame
	c.geste(anim, false)
	for i in AUGENBLICKE:
		ap.seek(a.length * i / float(AUGENBLICKE - 1) * 0.999, true)
		await process_frame
		await RenderingServer.frame_post_draw
		bilder.append(_ausschnitt(c))
	c.geste_ende()
	if spieler and spieler != c:
		spieler.position = spieler_ort
	await process_frame
	return bilder


func _ausschnitt(c: Node2D) -> Image:
	var bild := root.get_texture().get_image()
	var fenster := Vector2(bild.get_size())
	var p := c.get_viewport().get_canvas_transform() * c.global_position
	p *= fenster / Vector2(640, 360)
	var faktor := fenster.x / 640.0
	var groesse := Vector2(ZELLE) * faktor
	var ecke := Vector2i((p - Vector2(groesse.x / 2.0, groesse.y - 12.0 * faktor)).round())
	var rect := Rect2i(ecke, Vector2i(groesse)).intersection(Rect2i(Vector2i.ZERO, bild.get_size()))
	var out := Image.create(int(groesse.x), int(groesse.y), false, Image.FORMAT_RGBA8)
	out.fill(Color(0.2, 0.2, 0.2))
	if rect.size.x > 0 and rect.size.y > 0:
		bild.convert(Image.FORMAT_RGBA8)
		out.blit_rect(bild, rect, rect.position - ecke)
	out.resize(ZELLE.x, ZELLE.y, Image.INTERPOLATE_NEAREST)
	return out


func _bogen(zellen: Array) -> Image:
	var b := Image.create(ZELLE.x * AUGENBLICKE, ZELLE.y * zellen.size(), false, Image.FORMAT_RGBA8)
	for z in zellen.size():
		var bilder: Array = zellen[z][1]
		for i in bilder.size():
			b.blit_rect(bilder[i], Rect2i(Vector2i.ZERO, ZELLE), Vector2i(i * ZELLE.x, z * ZELLE.y))
	return b


func _raum_id() -> String:
	var raum = root.get_node("R").current
	return raum.raum_id() if is_instance_valid(raum) and raum.has_method("raum_id") else ""


func _warte_bis(bedingung: Callable, sekunden: float) -> bool:
	var ende := Time.get_ticks_msec() + int(sekunden * 1000)
	while Time.get_ticks_msec() < ende:
		if bedingung.call():
			return true
		await process_frame
	return false
