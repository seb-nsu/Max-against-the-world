extends Node
## Code-Sicht von Welt 3 (raetsel/welt-3.md, Code-Sicht): die Wort-Etiketten an den Tauschobjekten
## und die zweistufige Wahl (Review 20.11., W3-03, Entscheidung Sebastian). Erst ein Wort an einem
## Objekt anklicken, dann ein Wort an einem anderen; welt_3.gd entscheidet, was der Tausch bewirkt.
##
## Jedes Wort ist ein eigener Knopf; die Wörter eines Objekts stehen nebeneinander über dem Objekt
## (Gegenstände aus Max' Tasche mit Namen neben Max). Die Lage kommt in Weltkoordinaten und wird
## jedes Bild über die Kamera auf den Bildschirm gerechnet, so stimmen auch Panoramen und das
## Zeiger-Einrasten des Controllers (Knöpfe in Bildschirmkoordinaten). Überlappende Reihen weichen
## nach oben aus (W3-R10-02). Mit am_rand (im Spiel) bleiben Wörter von Objekten außerhalb des
## Bildausschnitts am Bildrand stehen, mit „<“ oder „>“ davor: Im Panorama der Stadtstraße liegen
## Auto und Glastür 800 px auseinander, und jedes Wort muss anklickbar sein.
##
## Zwei Zustände: Anzeigen (Etiketten unter Popochius Sprechtexten, Klicks gehen durch, z. B. während
## Max die Wörter vorliest oder für die Raumaufnahme) und Wählen (Etiketten über allem, ein
## Klickfang darunter hält Klicks von Raum und Leiste fern, Statuszeile unten). Rechtsklick nimmt
## das erste Wort zurück oder schließt, Esc schließt. Mit dem Controller: Stick oder Steuerkreuz
## zum Wort (die Knöpfe sind Einrast-Ziele), A wählt, B wie Rechtsklick.

## Ein Ereignis der Wahl: Index eines Worts, ZURUECK (Rechtsklick) oder SCHLIESSEN (Esc)
signal _eingabe(wert: int)

const GRUEN := Color("63ff7a")
const THEMA := "res://game/gui/resources/gui_theme.tres"
const ZURUECK := -1
const SCHLIESSEN := -2
## Ebenen: unter Popochius Oberfläche (10) beim Anzeigen, über Leiste (11) und Klickfang beim Wählen
const EBENE_ANZEIGEN := 9
const EBENE_WAEHLEN := 13
const EBENE_FANG := 12

## Je Wort: {oid, wort, knopf}; der Index ist die Antwort von waehlen()
var woerter: Array = []
## Je Reihe: {knoten: HBoxContainer, welt: Vector2 (oben links in Weltkoordinaten), groesse,
## links/rechts: Pfeil-Etiketten}
var _reihen: Array = []
## Wörter außerhalb des Bildausschnitts an den Bildrand holen (im Spiel; die Raumaufnahme nicht)
var am_rand := false
var _raum_breite := 640.0
var _ebene: CanvasLayer
var _fang_ebene: CanvasLayer
var _status: Label
var _erstes := -1
var _waehlt := false
var _stil := {}


func _ready() -> void:
	_ebene = CanvasLayer.new()
	_ebene.name = "Etiketten"
	_ebene.layer = EBENE_ANZEIGEN
	add_child(_ebene)
	_fang_ebene = CanvasLayer.new()
	_fang_ebene.name = "Klickfang"
	_fang_ebene.layer = EBENE_FANG
	_fang_ebene.visible = false
	add_child(_fang_ebene)
	var fang := Control.new()
	fang.set_anchors_preset(Control.PRESET_FULL_RECT)
	fang.mouse_filter = Control.MOUSE_FILTER_STOP   # Raum, Leiste und Porträts bleiben ruhig
	_fang_ebene.add_child(fang)
	_status = Label.new()
	_status.position = Vector2(0, 342)
	_status.size = Vector2(640, 16)
	_status.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_status.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if ResourceLoader.exists(THEMA):
		_status.theme = load(THEMA)
	_status.add_theme_font_size_override("font_size", 8)
	_status.add_theme_color_override("font_color", GRUEN)
	_status.add_theme_color_override("font_outline_color", Color(0.02, 0.07, 0.04))
	_status.add_theme_constant_override("outline_size", 3)
	fang.add_child(_status)
	_stil = {
		"normal": _kasten(Color(0.02, 0.07, 0.04, 0.85), GRUEN),
		"hover": _kasten(Color(0.08, 0.25, 0.12, 0.95), GRUEN),
		"gewaehlt": _kasten(GRUEN, GRUEN),
		"aus": _kasten(Color(0.02, 0.07, 0.04, 0.6), GRUEN.darkened(0.55)),
	}


func _kasten(grund: Color, rand: Color) -> StyleBoxFlat:
	var k := StyleBoxFlat.new()
	k.bg_color = grund
	k.border_color = rand
	k.set_border_width_all(1)
	k.content_margin_left = 3
	k.content_margin_right = 3
	k.content_margin_top = 1
	k.content_margin_bottom = 1
	return k


## Eine Reihe über einem Objekt. eintraege: [{oid, wort, aktiv}], anker: Oberkante (Mitte) des
## Objekts in Weltkoordinaten, praefix: Name vor den Wörtern (Gegenstand in der Tasche).
func reihe(eintraege: Array, anker: Vector2, praefix := "") -> void:
	var box := HBoxContainer.new()
	box.add_theme_constant_override("separation", 2)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if ResourceLoader.exists(THEMA):
		box.theme = load(THEMA)
	var links := _etikett("<")
	links.modulate.a = 0.0   # Platz bleibt immer frei, damit sich die Reihe nie neu ordnet
	box.add_child(links)
	if not praefix.is_empty():
		box.add_child(_etikett(praefix + ":"))
	for e: Dictionary in eintraege:
		var b := Button.new()
		b.text = e.wort
		b.focus_mode = Control.FOCUS_NONE
		b.disabled = not e.get("aktiv", true)
		b.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_theme_font_size_override("font_size", 8)
		for f in ["font_color", "font_hover_color", "font_pressed_color", "font_focus_color"]:
			b.add_theme_color_override(f, GRUEN)
		b.add_theme_color_override("font_disabled_color", GRUEN.darkened(0.55))
		b.add_theme_stylebox_override("normal", _stil.normal)
		b.add_theme_stylebox_override("hover", _stil.hover)
		b.add_theme_stylebox_override("pressed", _stil.hover)
		b.add_theme_stylebox_override("focus", StyleBoxEmpty.new())
		b.add_theme_stylebox_override("disabled", _stil.aus)
		var i := woerter.size()
		b.pressed.connect(func(): if _waehlt: _eingabe.emit(i))
		b.add_to_group("code_sicht_wort")
		b.set_meta("oid", e.oid)
		box.add_child(b)
		woerter.append({"oid": e.oid, "wort": e.wort, "knopf": b})
	var rechts := _etikett(">")
	rechts.modulate.a = 0.0
	box.add_child(rechts)
	_ebene.add_child(box)
	box.reset_size()
	var groesse := box.get_combined_minimum_size()
	_reihen.append({"knoten": box, "welt": anker - Vector2(groesse.x / 2.0, groesse.y), "groesse": groesse,
		"links": links, "rechts": rechts})


func _etikett(text: String) -> Label:
	var l := Label.new()
	l.text = text
	l.add_theme_font_size_override("font_size", 8)
	l.add_theme_color_override("font_color", GRUEN)
	l.add_theme_stylebox_override("normal", _stil.normal)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l


func anordnen(raum_breite: float) -> void:
	_raum_breite = raum_breite
	_process(0.0)


## Lage auf dem Bildschirm, jedes Bild neu (die Kamera kann sich bewegen). Jede Reihe steht mittig
## über ihrem Objekt, innerhalb der Raumbreite (mit am_rand innerhalb des Bildausschnitts); wo sie
## eine schon gesetzte Reihe schneidet, rückt sie über deren Oberkante, bis sie frei steht
## (W3-R10-02). Ist oben kein Platz mehr, weicht sie unter die gesetzten Reihen aus.
func _process(_delta: float) -> void:
	var xf := get_viewport().get_canvas_transform()
	var sicht := get_viewport().get_visible_rect().size
	var belegt: Array[Rect2] = []
	for r: Dictionary in _reihen:
		if not is_instance_valid(r.knoten):
			continue
		var welt: Vector2 = r.welt
		var g: Vector2 = r.groesse
		welt.x = clampf(welt.x, 2.0, maxf(_raum_breite - g.x - 2.0, 2.0))
		var pos := xf * welt
		var links := am_rand and pos.x < 2.0
		var rechts := am_rand and not links and pos.x + g.x > sicht.x - 2.0
		r.links.modulate.a = 1.0 if links else 0.0
		r.rechts.modulate.a = 1.0 if rechts else 0.0
		if links or rechts:
			pos.x = clampf(pos.x, 2.0, sicht.x - g.x - 2.0)
		pos.y = maxf(pos.y, 2.0)
		var rechteck := Rect2(pos, g)
		for versuch in 12:
			var oben := INF
			var unten := -INF
			for b in belegt:
				if b.grow(1.0).intersects(rechteck):
					oben = minf(oben, b.position.y)
					unten = maxf(unten, b.end.y)
			if oben == INF:
				break
			if oben - g.y - 1.0 >= 2.0:
				rechteck.position.y = oben - g.y - 1.0
			else:
				rechteck.position.y = unten + 1.0
		belegt.append(rechteck)
		r.knoten.position = rechteck.position.round()
		r.knoten.size = g


## Zweistufige Wahl: liefert [erstes, zweites] (Indizes in woerter) oder [] (geschlossen).
func waehlen() -> Array:
	# Erst nach einem Bild: Die Reihen ordnen ihre Knöpfe verzögert (Container), vorher stimmen die Lagen nicht
	await get_tree().process_frame
	await get_tree().process_frame
	_waehlt = true
	_erstes = -1
	_umschalten(true)
	_markieren()
	var ergebnis := []
	while true:
		var w: int = await _eingabe
		if w >= 0:
			if _erstes < 0:
				_erstes = w
			elif w == _erstes:
				_erstes = -1   # dasselbe Wort noch einmal: zurücknehmen
			else:
				ergebnis = [_erstes, w]
				break
		elif w == ZURUECK and _erstes >= 0:
			_erstes = -1
		else:
			break
		_markieren()
	_waehlt = false
	_erstes = -1
	_markieren()
	_umschalten(false)
	return ergebnis


func waehlt() -> bool:
	return _waehlt


func _umschalten(an: bool) -> void:
	_ebene.layer = EBENE_WAEHLEN if an else EBENE_ANZEIGEN
	_fang_ebene.visible = an
	for w: Dictionary in woerter:
		(w.knopf as Button).mouse_filter = Control.MOUSE_FILTER_STOP if an else Control.MOUSE_FILTER_IGNORE


func _markieren() -> void:
	for i in woerter.size():
		var b: Button = woerter[i].knopf
		var an := i == _erstes
		b.add_theme_stylebox_override("normal", _stil.gewaehlt if an else _stil.normal)
		b.add_theme_stylebox_override("hover", _stil.gewaehlt if an else _stil.hover)
		b.add_theme_color_override("font_color", Color(0.02, 0.07, 0.04) if an else GRUEN)
		b.add_theme_color_override("font_hover_color", Color(0.02, 0.07, 0.04) if an else GRUEN)
	if _erstes < 0:
		_status.text = tr("UI_W3_CODE_WAHL_1")
	else:
		var muster := tr("UI_W3_CODE_WAHL_2")
		_status.text = muster % woerter[_erstes].wort if "%s" in muster else muster


## Rechtsklick und Esc vor allem anderen (sonst öffnete Esc das Pausemenü). B am Controller kommt als
## Rechtsklick (Controller.gd); als ui_cancel zählt darum nur die Tastatur.
func _input(event: InputEvent) -> void:
	if not _waehlt:
		return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		get_viewport().set_input_as_handled()
		if event.pressed:
			_eingabe.emit(ZURUECK)
	elif event is InputEventKey and event.pressed and not event.echo \
			and (event.is_action("ui_cancel") or event.is_action("cq_pause")):
		get_viewport().set_input_as_handled()
		_eingabe.emit(SCHLIESSEN)
