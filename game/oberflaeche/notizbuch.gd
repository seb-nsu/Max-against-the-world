extends CanvasLayer
## Notizbuch (05-spielsysteme.md, Bildschirme). Öffnet sich immer auf Seite 1.
## Seite 1: aktuelle Ziele (offene Rätselschritte aus der Hinweis-Datei); ein Klick auf ein
##          Ziel macht es zum Schritt, den die Hilfe-Pfote nimmt (Hinweis-Regel 2).
## Seite 2: Regeln und Passwort-Teile (erst nach geöffneter Nahansicht; im Prolog leer;
##          die Graubox zeigt nur den Namen der Nahansicht).
## Seite 3: Pixels Einkaufsliste (je Welt ein Wunsch; im Prolog leer), siehe einkaufsliste().

signal geschlossen

const THEMA := "res://game/gui/resources/gui_theme.tres"
## Gemalte Doppelseite (tools/nahansichten_prolog.py, Review Fund 29) und Tinte für die Schrift
const SEITE_BILD := "res://grafik/oberflaeche/notizbuch_seite.png"
const TINTE := Color("34243c")
const TINTE_HELL := Color("7a5c48")
const SEITEN := ["UI_NOTIZBUCH_ZIELE", "UI_NOTIZBUCH_REGELN", "UI_NOTIZBUCH_EINKAUF"]

var seite := 0
var _inhalt: VBoxContainer
var _titel: Label


func _ready() -> void:
	layer = 12
	var wurzel := Panel.new()
	wurzel.position = Vector2(60, 32)
	wurzel.size = Vector2(520, 296)
	if ResourceLoader.exists(THEMA):
		wurzel.theme = load(THEMA)
	add_child(wurzel)
	if ResourceLoader.exists(SEITE_BILD):
		wurzel.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
		var papier := TextureRect.new()
		papier.texture = load(SEITE_BILD)
		papier.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		papier.size = wurzel.size
		papier.mouse_filter = Control.MOUSE_FILTER_IGNORE
		wurzel.add_child(papier)

	_titel = Label.new()
	_titel.position = Vector2(24, 14)
	_titel.add_theme_color_override("font_color", TINTE)
	wurzel.add_child(_titel)
	_inhalt = VBoxContainer.new()
	_inhalt.position = Vector2(24, 48)
	_inhalt.size = Vector2(470, 200)
	wurzel.add_child(_inhalt)
	var zurueck := _knopf(wurzel, "UI_SEITE_ZURUECK", Vector2(16, 256))
	zurueck.pressed.connect(func(): blaettern(-1))
	var weiter := _knopf(wurzel, "UI_SEITE_WEITER", Vector2(380, 256))
	weiter.pressed.connect(func(): blaettern(1))
	var zu := _knopf(wurzel, "UI_SCHLIESSEN", Vector2(200, 256))
	zu.pressed.connect(schliessen)
	zeigen()


func blaettern(richtung: int) -> void:
	seite = clampi(seite + richtung, 0, SEITEN.size() - 1)
	zeigen()


## Die Ziele von Seite 1 als [{schritt, text_key}] (auch für Tests).
static func ziele() -> Array:
	var out := []
	var praefix: String = Bauplan.plaene.get(Zustand.abschnitt, {}).get("praefix", "")
	for schritt in Zustand.offene_schritte():
		# Schlüssel-Schema UI_ZIEL_<Abschnitt>_<Rätsel-ID> (05-spielsysteme.md)
		out.append({schritt = schritt, text_key = "UI_ZIEL_%s_%s" % [praefix, schritt.to_upper()]})
	return out


## Seite 2: Regeln aus Nahansichten, die im aktuellen Abschnitt angesehen wurden (Satzung …).
## Der Prolog trägt nichts ein (Kalender und Zettel sind keine Regeln).
static func regeln() -> Array:
	var out := []
	if Zustand.abschnitt == "prolog":
		return out
	for n in Bauplan.plaene.get(Zustand.abschnitt, {}).get("nahansichten", []):
		if n.id in Zustand.nahansichten:
			out.append(n.name_key)
	return out


## Seite 3: Pixels Einkaufsliste. Der Wert EINKAUFSLISTE zählt die Wünsche (einer je Rückkehr,
## der vierte in Welt 4). Im Finale steht ab dem Wohnzimmer der Eintrag darunter, den Max in
## FI_WOHN_MAX_0165 vorliest.
static func einkaufsliste() -> Array:
	var out := []
	for i in clampi(int(Zustand.wert("EINKAUFSLISTE", 0)), 0, 4):
		out.append("UI_EINKAUF_%d" % (i + 1))
	if Zustand.ist("FI_WOHN_ANKUNFT"):
		out.append("UI_EINKAUF_SOFA")
	return out


func zeigen() -> void:
	_titel.text = tr(SEITEN[seite])
	for k in _inhalt.get_children():
		k.queue_free()
	var eintraege := []
	if seite == 0:
		for z in ziele():
			var b := Button.new()
			b.text = ("> " if z.schritt == Zustand.notizbuch_ziel else "") + tr(z.text_key)
			b.flat = true
			b.alignment = HORIZONTAL_ALIGNMENT_LEFT
			b.pressed.connect(func():
				Zustand.notizbuch_ziel = z.schritt
				zeigen())
			eintraege.append(b)
	elif seite == 1:
		for key in regeln():
			var l := Label.new()
			l.text = "- " + tr(key)
			eintraege.append(l)
	else:
		for key in einkaufsliste():
			var l := Label.new()
			l.text = "- " + tr(key)
			eintraege.append(l)
	if eintraege.is_empty():
		var l := Label.new()
		l.text = tr("UI_NOTIZBUCH_LEER")
		eintraege.append(l)
	for e in eintraege:
		_tinte(e)
		_inhalt.add_child(e)


func _tinte(c: Control) -> void:
	if not ResourceLoader.exists(SEITE_BILD):
		return
	c.add_theme_color_override("font_color", TINTE)
	if c is Button:
		c.add_theme_color_override("font_hover_color", Color("b13e53"))
		c.add_theme_color_override("font_pressed_color", Color("b13e53"))
		c.add_theme_color_override("font_focus_color", TINTE)
		c.add_theme_stylebox_override("normal", StyleBoxEmpty.new())
		c.add_theme_stylebox_override("hover", StyleBoxEmpty.new())
		c.add_theme_stylebox_override("pressed", StyleBoxEmpty.new())
		c.add_theme_stylebox_override("focus", StyleBoxEmpty.new())


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		schliessen()


func schliessen() -> void:
	geschlossen.emit()


func _knopf(eltern: Control, key: String, pos: Vector2) -> Button:
	var b := Button.new()
	b.text = key
	b.position = pos + Vector2(8, 4)
	_tinte(b)
	eltern.add_child(b)
	return b
