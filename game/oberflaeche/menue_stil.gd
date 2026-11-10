class_name CQMenueStil
extends RefCounted
## Gemeinsamer Stil der Menüs (Hauptmenü, Pausemenü, Spielstände, Optionen): Farben wie Leiste
## und Dialogauswahl (05-spielsysteme.md, Bildschirmaufbau), Nunito aus dem GUI-Thema, Größen in
## logischen Einheiten der Grundauflösung 480×270 (×4 bei 1080p).

const THEMA := "res://game/gui/resources/gui_theme.tres"
const DUNKEL := Color("181425")
const RAND := Color("262b44")
const FELD := Color("262b44")
const AKTIV := Color("3a4466")
const HOVER := Color("5a6988")
const GELB := Color("fee761")
const ORANGE := Color("feae34")
const GRAU := Color("8b9bb4")


static func thema() -> Theme:
	return load(THEMA) if ResourceLoader.exists(THEMA) else null


static func flaeche(farbe := DUNKEL, rand := RAND, breite := 2) -> StyleBoxFlat:
	var s := StyleBoxFlat.new()
	s.bg_color = farbe
	s.border_color = rand
	s.set_border_width_all(breite)
	s.content_margin_left = 6
	s.content_margin_right = 6
	s.content_margin_top = 2
	s.content_margin_bottom = 2
	return s


static func panel(pos: Vector2, groesse: Vector2) -> Panel:
	var p := Panel.new()
	p.position = pos
	p.size = groesse
	p.theme = thema()
	p.add_theme_stylebox_override("panel", flaeche())
	return p


static func label(text: String, groesse := 10, farbe := Color.WHITE) -> Label:
	var l := Label.new()
	l.text = text
	l.add_theme_font_size_override("font_size", Einstellungen.schrift(groesse))
	l.add_theme_color_override("font_color", farbe)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l


## Knopf im Menü-Stil; ein Klick spielt das Geräusch ui_klick.
static func knopf(text: String, groesse := 10) -> Button:
	var k := Button.new()
	k.text = text
	k.focus_mode = Control.FOCUS_ALL
	k.add_theme_font_size_override("font_size", Einstellungen.schrift(groesse))
	k.add_theme_stylebox_override("normal", flaeche(FELD, AKTIV, 1))
	k.add_theme_stylebox_override("hover", flaeche(AKTIV, GELB, 1))
	k.add_theme_stylebox_override("focus", flaeche(AKTIV, GELB, 1))
	k.add_theme_stylebox_override("pressed", flaeche(HOVER, ORANGE, 1))
	k.add_theme_stylebox_override("disabled", flaeche(DUNKEL, RAND, 1))
	k.add_theme_color_override("font_hover_color", GELB)
	k.add_theme_color_override("font_focus_color", GELB)
	k.add_theme_color_override("font_disabled_color", HOVER)
	k.pressed.connect(func(): Klang.geraeusch("ui_klick"))
	return k


## Auswahl (OptionButton) mit Einträgen [[wert, text_key], …]; aktueller Wert vorgewählt.
static func auswahl(eintraege: Array, aktuell: Variant, groesse := 10) -> OptionButton:
	var o := OptionButton.new()
	o.add_theme_font_size_override("font_size", Einstellungen.schrift(groesse))
	o.add_theme_stylebox_override("normal", flaeche(FELD, AKTIV, 1))
	o.add_theme_stylebox_override("hover", flaeche(AKTIV, GELB, 1))
	o.add_theme_stylebox_override("focus", flaeche(AKTIV, GELB, 1))
	o.add_theme_stylebox_override("pressed", flaeche(HOVER, ORANGE, 1))
	for i in eintraege.size():
		o.add_item(TranslationServer.translate(str(eintraege[i][1])), i)
		o.set_item_metadata(i, eintraege[i][0])
		if eintraege[i][0] == aktuell:
			o.select(i)
	o.get_popup().add_theme_font_size_override("font_size", Einstellungen.schrift(groesse))
	return o
