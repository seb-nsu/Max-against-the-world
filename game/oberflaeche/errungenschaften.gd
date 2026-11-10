extends Control
## Liste der Errungenschaften (05-spielsysteme.md, Errungenschaften), aus dem Hauptmenü.
## Freigeschaltete hell mit Datum, gesperrte grau. Jede Zeile ist fokussierbar, damit Pfeiltasten
## und Controller durch die Liste scrollen.

signal zurueck

const S := preload("res://oberflaeche/menue_stil.gd")

var _zeilen: Array[Button] = []


func _ready() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	var p := S.panel(Vector2(24, 9), Vector2(432, 252))
	add_child(p)
	var titel := S.label(tr("UI_MENUE_ERRUNGENSCHAFTEN"), 12)
	titel.position = Vector2(12, 4)
	p.add_child(titel)
	var zahl := S.label(tr("UI_ERRUNGENSCHAFTEN_ZAHL") % [Errungenschaften.anzahl_frei(),
		Errungenschaften.ids().size()], 9, S.GRAU)
	zahl.position = Vector2(300, 8)
	zahl.size = Vector2(120, 14)
	zahl.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	p.add_child(zahl)

	var rollen := ScrollContainer.new()
	rollen.position = Vector2(8, 26)
	rollen.size = Vector2(416, 192)
	rollen.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	rollen.follow_focus = true
	p.add_child(rollen)
	var liste := VBoxContainer.new()
	liste.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	liste.add_theme_constant_override("separation", 2)
	rollen.add_child(liste)
	for id in Errungenschaften.ids():
		liste.add_child(_zeile(id))

	var zu := S.knopf(tr("UI_MENUE_ZURUECK"))
	zu.position = Vector2(352, 226)
	zu.custom_minimum_size = Vector2(72, 0)
	zu.pressed.connect(func(): zurueck.emit())
	p.add_child(zu)
	if not _zeilen.is_empty():
		_zeilen[-1].focus_neighbor_bottom = _zeilen[-1].get_path_to(zu)
		zu.focus_neighbor_top = zu.get_path_to(_zeilen[-1])
	zu.grab_focus.call_deferred()


func _zeile(id: String) -> Button:
	var frei := Errungenschaften.ist_frei(id)
	var b := Button.new()
	b.focus_mode = Control.FOCUS_ALL
	b.custom_minimum_size = Vector2(404, Einstellungen.schrift(30))
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.add_theme_stylebox_override("normal", S.flaeche(S.FELD if frei else S.DUNKEL, S.AKTIV if frei else S.RAND, 1))
	b.add_theme_stylebox_override("hover", S.flaeche(S.AKTIV, S.GELB, 1))
	b.add_theme_stylebox_override("focus", S.flaeche(S.AKTIV, S.GELB, 1))
	b.add_theme_stylebox_override("pressed", S.flaeche(S.AKTIV, S.GELB, 1))
	var name_l := S.label(tr("UI_ERR_" + id), 10, S.GELB if frei else S.GRAU)
	name_l.position = Vector2(6, 1)
	b.add_child(name_l)
	var text := S.label(tr("UI_ERR_%s_TEXT" % id), 8, Color.WHITE if frei else S.HOVER)
	text.position = Vector2(6, Einstellungen.schrift(15))
	b.add_child(text)
	if frei:
		var d := S.label(Errungenschaften.datum(id).left(10), 8, S.GRAU)
		d.position = Vector2(300, 2)
		d.size = Vector2(98, 12)
		d.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		b.add_child(d)
	_zeilen.append(b)
	return b


## Für Tests: Zeile je ID.
func zeilen() -> Array[Button]:
	return _zeilen
