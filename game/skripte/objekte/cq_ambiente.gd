class_name CQAmbiente
extends Node2D
## Lebendige Hintergründe (offene Punkte P16): kleine Bewegungen, damit ein Raum nicht wie ein
## Standbild wirkt. Nur Optik, kein Einfluss auf Rätsel, nicht klickbar.
##
## Je Raum im Layout (tools/layout/<abschnitt>.yaml) eingetragen, z. B.
##   ambiente:
##     voegel: {bereich: [0, 15, 1280, 45]}     # Rechteck x, y, Breite, Höhe; genutzt wird die Höhe
##     blaetter: {bereich: [0, 240, 1280, 115]}
## CQRaum legt die Ebene beim Betreten an. Alle 15 bis 45 Sekunden löst ein zufälliger Baustein
## aus, der erste schon nach 4 bis 10 Sekunden. Gezeichnet wird pixelgenau mit wenigen Punkten aus
## der Spielpalette (Endesga 32); später in Aseprite durch echte Sprites ersetzbar.

const PAUSE := Vector2(15.0, 45.0)
const ERSTE_PAUSE := Vector2(4.0, 10.0)

## Vogel, zwei Flügelschläge: Punkte relativ zur Körpermitte
const VOGEL_OBEN := [Vector2i(-2, -1), Vector2i(2, -1), Vector2i(-1, 0), Vector2i(1, 0), Vector2i(0, 1)]
const VOGEL_UNTEN := [Vector2i(-1, 0), Vector2i(0, 0), Vector2i(1, 0), Vector2i(-2, 1), Vector2i(2, 1)]
const VOGEL_FARBEN := [Color("#262b44"), Color("#3a4466")]
## Blatt in drei Drehstufen, erster Punkt ist die dunkle Kante
const BLATT_FORMEN := [
	[Vector2i(0, 1), Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0), Vector2i(1, 1)],
	[Vector2i(0, 2), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 0)],
	[Vector2i(0, 2), Vector2i(1, -1), Vector2i(1, 0), Vector2i(0, 1), Vector2i(1, 1)],
]
const BLATT_FARBEN := [Color("#63c74d"), Color("#3e8948"), Color("#feae34"), Color("#f77622"), Color("#b86f50")]

var bausteine := {}
var _rng := RandomNumberGenerator.new()
var _teile: Array[Dictionary] = []
var _bis := 0.0


func _init(cfg: Dictionary = {}) -> void:
	name = "Ambiente"
	bausteine = cfg
	_rng.randomize()
	_bis = _rng.randf_range(ERSTE_PAUSE.x, ERSTE_PAUSE.y)


func _process(delta: float) -> void:
	_bis -= delta
	# Im Testmodus nur auf Abruf (ausloesen), damit Bildschirmfotos gleich bleiben
	if _bis <= 0.0 and not bausteine.is_empty() and not Spiel.testmodus:
		ausloesen(bausteine.keys()[_rng.randi() % bausteine.size()])
		_bis = _rng.randf_range(PAUSE.x, PAUSE.y)
	if _teile.is_empty():
		return
	var sicht := _sichtbar().grow(40.0)
	for t in _teile:
		t.zeit += delta
		t.pos += t.v * delta
	_teile = _teile.filter(func(t): return (t.pos.x + 40.0 > t.feld.position.x) if t.art == "flieger" 			else (sicht.has_point(t.pos) or t.zeit < 1.0))
	queue_redraw()


## Sichtbarer Ausschnitt in Raumkoordinaten (breite Räume scrollen).
func _sichtbar() -> Rect2:
	var vp := get_viewport()
	return vp.get_canvas_transform().affine_inverse() * Rect2(Vector2.ZERO, vp.get_visible_rect().size)


func _hoehe(art: String, standard: Vector2) -> Vector2:
	var b: Array = bausteine.get(art, {}).get("bereich", [])
	return Vector2(b[1], b[1] + b[3]) if b.size() == 4 else standard


## Löst einen Baustein sofort aus (auch für Tests und Szenen).
func ausloesen(art: String) -> void:
	match art:
		"voegel": _voegel()
		"blaetter": _blaetter()
		"schueler": _flieger(art)
		_: push_warning("Ambiente: unbekannter Baustein " + art)


## Kleiner Schwarm (3 bis 6) quer durchs Bild, locker gestaffelt, leicht auf und ab.
func _voegel() -> void:
	var sicht := _sichtbar()
	var hoehe := _hoehe("voegel", Vector2(15, 60))
	var nach_rechts := _rng.randf() < 0.5
	var tempo := _rng.randf_range(45.0, 65.0) * (1.0 if nach_rechts else -1.0)
	var start_x := sicht.position.x - 12.0 if nach_rechts else sicht.end.x + 12.0
	var y := _rng.randf_range(hoehe.x, hoehe.y)
	for i in _rng.randi_range(3, 6):
		var versatz := Vector2(-sign(tempo) * (i * _rng.randf_range(9.0, 15.0)), _rng.randf_range(-8.0, 8.0))
		_teile.append({
			"art": "vogel", "pos": Vector2(start_x, y) + versatz, "zeit": 0.0,
			"v": Vector2(tempo * _rng.randf_range(0.95, 1.05), _rng.randf_range(-3.0, 3.0)),
			"phase": _rng.randf() * TAU, "farbe": VOGEL_FARBEN[i % 2],
		})


## Windstoß: 8 bis 14 Blätter wirbeln von einer Seite über den Platz.
func _blaetter() -> void:
	var sicht := _sichtbar()
	var hoehe := _hoehe("blaetter", Vector2(240, 350))
	var nach_rechts := _rng.randf() < 0.5
	var r := 1.0 if nach_rechts else -1.0
	for i in _rng.randi_range(10, 16):
		var x := (sicht.position.x - _rng.randf_range(5, 120)) if nach_rechts else (sicht.end.x + _rng.randf_range(5, 120))
		_teile.append({
			"art": "blatt", "pos": Vector2(x, _rng.randf_range(hoehe.x, hoehe.y)), "zeit": 0.0,
			"v": Vector2(r * _rng.randf_range(110.0, 170.0), _rng.randf_range(-12.0, 6.0)),
			"phase": _rng.randf() * TAU, "farbe": BLATT_FARBEN[_rng.randi() % BLATT_FARBEN.size()],
			"schwung": _rng.randf_range(4.0, 10.0),
		})


## Ein Bild fliegt durch einen begrenzten Ausschnitt, etwa ein Schüler auf dem Besen hinter dem
## Fenster (Klassenzimmer, Witz W1_HOGG_MAX_0165): „schueler: {bild, bereich: [x, y, w, h]}“.
## Außerhalb des Bereichs wird nichts gezeichnet. Mit „glas: \"#rrggbb\"“ zeigt er sich nur, wo im
## Hintergrund die Scheibe ist: Rahmen und Sprossen aus dem Bild liegen davor (Sebastian, 14. November
## 2026: sonst wirkte es, als fliege er im Raum).
func _flieger(art: String) -> void:
	var cfg: Dictionary = bausteine.get(art, {})
	var tex: Texture2D = load(cfg.get("bild", "")) if ResourceLoader.exists(cfg.get("bild", "")) else null
	var b: Array = cfg.get("bereich", [])
	if tex == null or b.size() != 4:
		return
	var feld := Rect2(b[0], b[1], b[2], b[3])
	# Der Schüler fliegt rückwärts: Blick nach rechts, Flug nach links
	var y := _rng.randf_range(feld.position.y, feld.end.y - tex.get_height())
	_teile.append({
		"art": "flieger", "tex": tex, "feld": feld, "zeit": 0.0, "phase": _rng.randf() * TAU,
		"pos": Vector2(feld.end.x, y), "v": Vector2(-_rng.randf_range(28.0, 40.0), 0.0),
		"rahmen": _rahmen(cfg, feld),
	})


## Bildausschnitt des Fensters, in dem nur die Scheibe durchsichtig ist (wird über den Flieger gelegt).
var _rahmen_cache := {}

func _rahmen(cfg: Dictionary, feld: Rect2) -> Texture2D:
	var glas: String = cfg.get("glas", "")
	var pfad: String = bausteine.get("_hintergrund", "")
	if glas.is_empty() or not ResourceLoader.exists(pfad):
		return null
	var schluessel := "%s|%s|%s" % [pfad, glas, feld]
	if _rahmen_cache.has(schluessel):
		return _rahmen_cache[schluessel]
	var bild: Image = (load(pfad) as Texture2D).get_image()
	if bild.is_compressed():
		bild.decompress()
	var aus := bild.get_region(Rect2i(feld))
	aus.convert(Image.FORMAT_RGBA8)
	var farbe := Color(glas)
	for y in aus.get_height():
		for x in aus.get_width():
			var c := aus.get_pixel(x, y)
			if absf(c.r - farbe.r) + absf(c.g - farbe.g) + absf(c.b - farbe.b) < 0.08:
				aus.set_pixel(x, y, Color(0, 0, 0, 0))
	var tex := ImageTexture.create_from_image(aus)
	_rahmen_cache[schluessel] = tex
	return tex


func _draw() -> void:
	for t in _teile:
		if t.art == "flieger":
			var tex: Texture2D = t.tex
			var p := Vector2(t.pos.x, t.pos.y + sin(t.zeit * 4.0 + t.phase) * 2.0).round()
			var ziel := Rect2(p, tex.get_size()).intersection(t.feld)
			if ziel.size.x > 0 and ziel.size.y > 0:
				var hinter_glas: bool = t.get("rahmen") != null
				var tint := Color(0.86, 0.95, 1.0, 0.8) if hinter_glas else Color(1, 1, 1, 0.85)
				draw_texture_rect_region(tex, ziel, Rect2(ziel.position - p, ziel.size), tint)
				if hinter_glas:
					draw_texture(t.rahmen, t.feld.position)
			continue
		if t.art == "vogel":
			var p := Vector2(t.pos.x, t.pos.y + sin(t.zeit * 2.0 + t.phase) * 2.0).round()
			var form: Array = VOGEL_OBEN if int((t.zeit * 6.0) + t.phase) % 2 == 0 else VOGEL_UNTEN
			for o in form:
				draw_rect(Rect2(p + Vector2(o), Vector2.ONE), t.farbe)
		else:
			var p := Vector2(t.pos.x, t.pos.y + sin(t.zeit * 5.0 + t.phase) * t.schwung).round()
			# Drehen angedeutet: liegend, schräg, stehend; eine Kante dunkler
			var stufe := int(t.zeit * 8.0 + t.phase * 3.0) % BLATT_FORMEN.size()
			var form: Array = BLATT_FORMEN[stufe]
			for i in form.size():
				draw_rect(Rect2(p + Vector2(form[i]), Vector2.ONE), t.farbe.darkened(0.35) if i == 0 else t.farbe)
