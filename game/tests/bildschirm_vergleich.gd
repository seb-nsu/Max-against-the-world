extends SceneTree
## Screenshot-Regressionstest (A16): betritt jeden gebauten Raum aller Abschnitte, fotografiert
## das Bild ohne Oberfläche und vergleicht es mit der Referenz in tests/bildschirm/referenz/.
## Abweichungen landen als Bildpaar mit markierten Pixeln im Ausgabeordner, dazu eine
## Übersicht aller Räume (uebersicht_<abschnitt>.png) zum Durchsehen mit dem Auge.
##
## Aufruf (aus dem Ordner game/, unter Linux ohne Bildschirm mit xvfb-run):
##   xvfb-run -s "-screen 0 1280x720x24" godot --path . --rendering-driver opengl3 \
##       --resolution 640x360 -s res://tests/bildschirm_vergleich.gd -- [--aktualisieren] [AUSGABE]
## --aktualisieren schreibt die Referenzen neu (nach gewollten Grafikänderungen), sonst wird
## verglichen. Ausgabe: Standard user://bildschirm/.
##
## Jeder Raum wird beim ersten Betreten fotografiert, nach seiner Ankunftsszene; die Abschnitte
## laufen in Spielreihenfolge, der Spielstand ist frisch. Die Toleranz (Kanal um mehr als 24
## von 255, höchstens 0,5 Prozent der Pixel) fängt kleine Rundungsunterschiede der Grafiktreiber ab.

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
const ABSCHNITTE := ["prolog", "welt-1", "welt-2", "welt-3", "welt-4", "finale"]
const BREITE := 640
const HOEHE := 360
const KANAL := 24.0 / 255.0
const ANTEIL := 0.005

var referenz := ""
var ausgabe := "user://bildschirm/"
var aktualisieren := false
var fehler: Array[String] = []
var _pruefungen := 0


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		if a == "--aktualisieren":
			aktualisieren = true
		else:
			ausgabe = a.trim_suffix("/") + "/"
	referenz = ProjectSettings.globalize_path("res://").path_join("../tests/bildschirm/referenz/").simplify_path() + "/"
	ausgabe = ProjectSettings.globalize_path(ausgabe)
	DirAccess.make_dir_recursive_absolute(ausgabe)
	if DisplayServer.get_name() == "headless":
		print("FEHLER: braucht einen Bildschirm (xvfb-run), headless wird nichts gezeichnet")
		quit(2)
		return
	_spiel().testmodus = true
	root.get_node("E").settings.auto_continue_text = true
	CQSaveLoad.ordner = "user://bildschirm_saves/%d/" % OS.get_process_id()
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	await _ruhe()
	var gesehen := {}
	for ab in ABSCHNITTE:
		var plan: Dictionary = _bauplan().plaene.get(ab, {})
		var bilder: Array[Image] = []
		for r in plan.get("raeume", []):
			if gesehen.has(r.id):
				continue  # Dachboden und Wohnzimmer gehören zu mehreren Abschnitten
			gesehen[r.id] = true
			var bild := await _foto_raum(ab, r)
			if bild:
				bilder.append(bild)
				_vergleichen(ab, r.id, bild)
		if not bilder.is_empty():
			_uebersicht(bilder).save_png(ausgabe + "uebersicht_%s.png" % ab)
	_veraltete_referenzen(gesehen)
	print("")
	if aktualisieren:
		print("Referenzen geschrieben: %d Räume → %s" % [gesehen.size(), referenz])
	print("Prüfungen: %d, Fehler: %d" % [_pruefungen, fehler.size()])
	for f in fehler:
		print("  FEHLER: ", f)
	print("Ausgabe: ", ausgabe)
	quit(0 if fehler.is_empty() else 1)


func _foto_raum(ab: String, r: Dictionary) -> Image:
	var szene := "res://game/rooms/%s/room_%s.tscn" % [r.id, r.id]
	if not ResourceLoader.exists(szene):
		return null
	_zustand().abschnitt = ab
	_spiel().herkunft_raum = ""
	root.get_node("R").goto_room(r.script_name)
	var da := await _warte_bis(func(): return _raum_id() == r.id and root.get_node("E").in_room, 20.0)
	if not da:
		_pruefe(false, "%s/%s: Raum nicht erreicht" % [ab, r.id])
		return null
	await _ruhe()
	# Oberfläche aus (Leiste, Sprechblasen, Menüs): nur das Bild des Raums zählt
	var ebenen: Array[CanvasLayer] = []
	for n in root.find_children("*", "CanvasLayer", true, false):
		if n.visible:
			ebenen.append(n)
			n.visible = false
	# Atmende Figuren (Smaugi, Moderwort) und andere Schleifen auf ihr erstes Bild: sonst trifft
	# das Foto zufällig ein anderes Bild als die Referenz (Review Fund 22)
	var angehalten: Array[AnimationPlayer] = []
	for ap in R_current_animationen():
		if ap.is_playing():
			ap.seek(0.0, true)
			ap.pause()
			angehalten.append(ap)
	await process_frame
	await process_frame
	await RenderingServer.frame_post_draw
	var bild := root.get_texture().get_image()
	for n in ebenen:
		n.visible = true
	for ap in angehalten:
		if is_instance_valid(ap):
			ap.play()
	bild.convert(Image.FORMAT_RGB8)
	if bild.get_size() != Vector2i(BREITE, HOEHE):
		bild.resize(BREITE, HOEHE, Image.INTERPOLATE_NEAREST)
	return bild


func R_current_animationen() -> Array[AnimationPlayer]:
	var out: Array[AnimationPlayer] = []
	var raum = root.get_node("R").current
	if is_instance_valid(raum):
		for n in raum.find_children("*", "AnimationPlayer", true, false):
			out.append(n)
	return out


## Wartet, bis keine Szene mehr läuft und die Übergänge fertig sind.
func _ruhe() -> void:
	await _warte_bis(func(): return _spiel().in_szene == 0 and not root.get_node("E").playing_queue, 20.0)
	await create_timer(0.6).timeout


func _vergleichen(ab: String, rid: String, bild: Image) -> void:
	var pfad := referenz + "%s/%s.png" % [ab, rid]
	if aktualisieren:
		DirAccess.make_dir_recursive_absolute(pfad.get_base_dir())
		bild.save_png(pfad)
		return
	if not FileAccess.file_exists(pfad):
		_pruefe(false, "%s/%s: Referenz fehlt (mit --aktualisieren anlegen)" % [ab, rid])
		bild.save_png(ausgabe + "neu_%s_%s.png" % [ab, rid])
		return
	var ref := Image.load_from_file(pfad)
	ref.convert(Image.FORMAT_RGB8)
	var maske := Image.create(BREITE, HOEHE, false, Image.FORMAT_RGB8)
	var anders := 0
	for y in HOEHE:
		for x in BREITE:
			var a := bild.get_pixel(x, y)
			var b := ref.get_pixel(x, y)
			if absf(a.r - b.r) > KANAL or absf(a.g - b.g) > KANAL or absf(a.b - b.b) > KANAL:
				anders += 1
				maske.set_pixel(x, y, Color.MAGENTA)
			else:
				maske.set_pixel(x, y, b.darkened(0.6))
	var anteil := float(anders) / float(BREITE * HOEHE)
	_pruefe(anteil <= ANTEIL, "%s/%s: %.2f %% der Pixel anders" % [ab, rid, anteil * 100.0])
	if anteil > ANTEIL:
		var paar := Image.create(BREITE * 3, HOEHE, false, Image.FORMAT_RGB8)
		paar.blit_rect(ref, Rect2i(0, 0, BREITE, HOEHE), Vector2i(0, 0))
		paar.blit_rect(bild, Rect2i(0, 0, BREITE, HOEHE), Vector2i(BREITE, 0))
		paar.blit_rect(maske, Rect2i(0, 0, BREITE, HOEHE), Vector2i(BREITE * 2, 0))
		paar.save_png(ausgabe + "abweichung_%s_%s.png" % [ab, rid])


## Alle Räume eines Abschnitts als Raster, vier nebeneinander.
func _uebersicht(bilder: Array[Image]) -> Image:
	var spalten := 4
	var zeilen := ceili(bilder.size() / float(spalten))
	var u := Image.create(BREITE * spalten, HOEHE * zeilen, false, Image.FORMAT_RGB8)
	for i in bilder.size():
		u.blit_rect(bilder[i], Rect2i(0, 0, BREITE, HOEHE), Vector2i((i % spalten) * BREITE, (i / spalten) * HOEHE))
	return u


func _veraltete_referenzen(gesehen: Dictionary) -> void:
	for ab in ABSCHNITTE:
		var d := DirAccess.open(referenz + ab)
		if d == null:
			continue
		for datei in d.get_files():
			if datei.ends_with(".png") and not gesehen.has(datei.get_basename()):
				print("  Hinweis: Referenz ohne Raum: %s/%s" % [ab, datei])


#region Hilfen #####################################################################################
func _pruefe(bedingung: bool, text: String) -> void:
	_pruefungen += 1
	if bedingung:
		print("  ok    ", text)
	else:
		print("  FEHLT ", text)
		fehler.append(text)


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true


func _spiel():
	return root.get_node("Spiel")


func _zustand():
	return root.get_node("Zustand")


func _bauplan():
	return root.get_node("Bauplan")


func _raum_id() -> String:
	var r = root.get_node("R").current
	return r.raum_id() if is_instance_valid(r) and r.has_method("raum_id") else ""
#endregion
