extends CanvasLayer
## Bildschirm Reisetasche (05-spielsysteme.md): eigene Überlagerung im oberen Bildteil, damit die
## Sprechblasen von Max und Pixel darüber sichtbar bleiben (Ebene 9, Popochius Oberfläche liegt
## auf 10). Oben links das Pflichtfach, daneben die zwei Wahlfächer, darunter, was daneben liegt.
## Klick packt ein oder aus, Rechtsklick fragt Pixel; die Logik steht in skripte/reisetasche.gd.

signal geschlossen

const THEMA := "res://game/gui/resources/gui_theme.tres"
const FELD := 53
const ABSTAND := 56
## So viele Felder passen in eine Zeile der Auslage; weitere Dinge kommen in die nächste Zeile.
const JE_ZEILE := 8
const PANEL_HOEHE := 208
const GELB := Color("fee761")
const RAND := Color("3a4466")
const RAND_AKTIV := Color("2ce8f5")

var tasche: CQReisetasche
var _panel: Panel
var _name: Label
var _felder: Array[Control] = []


func _ready() -> void:
	layer = 9


func zeigen(t: CQReisetasche) -> void:
	tasche = t
	tasche.geaendert.connect(_aufbauen)
	# Fängt Klicks neben dem Fenster ab, damit Max nicht losläuft (durchsichtig: die Blasen
	# liegen auf einer höheren Ebene)
	var sperre := Control.new()
	sperre.set_anchors_preset(Control.PRESET_FULL_RECT)
	sperre.mouse_filter = Control.MOUSE_FILTER_STOP
	add_child(sperre)
	_panel = Panel.new()
	_panel.position = Vector2(72, 8)
	_panel.size = Vector2(496, PANEL_HOEHE)
	if ResourceLoader.exists(THEMA):
		_panel.theme = load(THEMA)
	var grund := StyleBoxFlat.new()
	grund.bg_color = Color("181425")
	grund.border_color = Color("262b44")
	grund.set_border_width_all(2)
	_panel.add_theme_stylebox_override("panel", grund)
	add_child(_panel)
	_label(tr("UI_TASCHE_TITEL"), Vector2(16, 4), 12)
	var hilfe := _label(tr("UI_TASCHE_HILFE"), Vector2(160, 8), 8)
	hilfe.modulate = Color(1, 1, 1, 0.7)
	_label(tr("UI_TASCHE_PFLICHT"), Vector2(16, 32), 8)
	_label(tr("UI_TASCHE_WAHL"), Vector2(200, 32), 8)
	_label(tr("UI_TASCHE_AUSLAGE"), Vector2(16, 112), 8)
	_name = _label("", Vector2(16, 184), 10)
	_name.modulate = GELB
	var fertig := Button.new()
	fertig.text = tr("UI_TASCHE_FERTIG")
	fertig.position = Vector2(312, 56)
	fertig.size = Vector2(136, 40)
	fertig.add_theme_font_size_override("font_size", Einstellungen.schrift(10))
	var knopf := StyleBoxFlat.new()
	knopf.bg_color = Color("3a4466")
	knopf.border_color = GELB
	knopf.set_border_width_all(1)
	fertig.add_theme_stylebox_override("normal", knopf)
	var knopf_hover := knopf.duplicate()
	knopf_hover.bg_color = Color("5a6988")
	fertig.add_theme_stylebox_override("hover", knopf_hover)
	fertig.add_theme_stylebox_override("pressed", knopf_hover)
	fertig.pressed.connect(_fertig)
	_panel.add_child(fertig)
	_aufbauen()


func _label(text: String, pos: Vector2, groesse: int) -> Label:
	var l := Label.new()
	l.text = text
	l.position = pos
	l.add_theme_font_size_override("font_size", Einstellungen.schrift(groesse))
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_panel.add_child(l)
	return l


func _aufbauen() -> void:
	for f in _felder:
		f.queue_free()
	_felder.clear()
	for i in CQReisetasche.PFLICHT.size():
		_feld(CQReisetasche.PFLICHT[i], Vector2(16 + i * ABSTAND, 51), false)
	for i in CQReisetasche.WAHLFAECHER:
		var sn: String = tasche.wahl[i] if i < tasche.wahl.size() else ""
		_feld(sn, Vector2(200 + i * ABSTAND, 51), true)
	for i in tasche.auslage.size():
		_feld(tasche.auslage[i], Vector2(16 + (i % JE_ZEILE) * ABSTAND, 131 + (i / JE_ZEILE) * ABSTAND), false)
	# Ab dem neunten Gegenstand wächst das Fenster um eine Zeile, der Name rutscht mit.
	var mehr := (zeilen() - 1) * ABSTAND
	_panel.size.y = PANEL_HOEHE + mehr
	_name.position.y = 184 + mehr


## Zeilen der Auslage (mindestens eine).
func zeilen() -> int:
	return maxi(1, ceili(tasche.auslage.size() / float(JE_ZEILE)))


## Lage der Felder der Auslage im Fenster (für Tests: Kein Feld liegt auf einem anderen).
func auslage_felder() -> Array:
	var out := []
	for f in _felder.slice(CQReisetasche.PFLICHT.size() + CQReisetasche.WAHLFAECHER):
		out.append(Rect2(f.position, f.size))
	return out


func _feld(sn: String, pos: Vector2, wahlfach: bool) -> void:
	var f := Panel.new()
	f.position = pos
	f.size = Vector2(FELD, FELD)
	var stil := StyleBoxFlat.new()
	stil.bg_color = Color("262b44")
	stil.border_color = RAND_AKTIV if wahlfach and not sn.is_empty() else RAND
	stil.set_border_width_all(1)
	f.add_theme_stylebox_override("panel", stil)
	_panel.add_child(f)
	_felder.append(f)
	if sn.is_empty():
		return
	var bild := TextureRect.new()
	bild.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	var item := I.get_item_instance(sn)
	if is_instance_valid(item):
		bild.texture = item.texture
	bild.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	bild.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	bild.position = Vector2(3, 3)
	bild.size = Vector2(FELD - 5, FELD - 5)
	bild.mouse_filter = Control.MOUSE_FILTER_IGNORE
	f.add_child(bild)
	f.mouse_filter = Control.MOUSE_FILTER_STOP
	f.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	f.mouse_entered.connect(func(): _name.text = tr(Bauplan.gegenstand(sn).get("name_key", sn)))
	f.mouse_exited.connect(func(): _name.text = "")
	f.gui_input.connect(_feld_klick.bind(sn))


func _feld_klick(event: InputEvent, sn: String) -> void:
	if not (event is InputEventMouseButton and event.pressed):
		return
	get_viewport().set_input_as_handled()
	if event.button_index == MOUSE_BUTTON_LEFT:
		tasche.beruehren(sn)
	elif event.button_index == MOUSE_BUTTON_RIGHT:
		tasche.ansehen(sn)


func _fertig() -> void:
	if tasche.beschaeftigt:
		return
	geschlossen.emit()
