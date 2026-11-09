extends CanvasLayer
## Notizbuch (05-spielsysteme.md, Bildschirme). Öffnet sich immer auf Seite 1.
## Seite 1: aktuelle Ziele (offene Rätselschritte aus der Hinweis-Datei); ein Klick auf ein
##          Ziel macht es zum Schritt, den die Hilfe-Pfote nimmt (Hinweis-Regel 2).
## Seite 2: Regeln und Passwort-Teile (erst nach geöffneter Nahansicht; im Prolog leer).
## Seite 3: Pixels Einkaufsliste (je Welt ein Wunsch; im Prolog leer).

signal geschlossen

const THEMA := "res://game/gui/resources/gui_theme.tres"
const SEITEN := ["UI_NOTIZBUCH_ZIELE", "UI_NOTIZBUCH_REGELN", "UI_NOTIZBUCH_EINKAUF"]

var seite := 0
var _inhalt: VBoxContainer
var _titel: Label


func _ready() -> void:
	layer = 12
	var wurzel := Panel.new()
	wurzel.position = Vector2(30, 16)
	wurzel.size = Vector2(260, 148)
	if ResourceLoader.exists(THEMA):
		wurzel.theme = load(THEMA)
	add_child(wurzel)
	_titel = Label.new()
	_titel.position = Vector2(8, 4)
	wurzel.add_child(_titel)
	_inhalt = VBoxContainer.new()
	_inhalt.position = Vector2(8, 22)
	_inhalt.size = Vector2(244, 100)
	wurzel.add_child(_inhalt)
	var zurueck := _knopf(wurzel, "UI_SEITE_ZURUECK", Vector2(8, 128))
	zurueck.pressed.connect(func(): blaettern(-1))
	var weiter := _knopf(wurzel, "UI_SEITE_WEITER", Vector2(190, 128))
	weiter.pressed.connect(func(): blaettern(1))
	var zu := _knopf(wurzel, "UI_SCHLIESSEN", Vector2(100, 128))
	zu.pressed.connect(schliessen)
	zeigen()


func blaettern(richtung: int) -> void:
	seite = clampi(seite + richtung, 0, SEITEN.size() - 1)
	zeigen()


## Die Ziele von Seite 1 als [{schritt, text_key}] (auch für Tests).
static func ziele() -> Array:
	var out := []
	for schritt in Zustand.offene_schritte():
		out.append({schritt = schritt, text_key = "UI_ZIEL_" + schritt})
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
	if eintraege.is_empty():
		var l := Label.new()
		l.text = tr("UI_NOTIZBUCH_LEER")
		eintraege.append(l)
	for e in eintraege:
		_inhalt.add_child(e)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		schliessen()


func schliessen() -> void:
	geschlossen.emit()


func _knopf(eltern: Control, key: String, pos: Vector2) -> Button:
	var b := Button.new()
	b.text = key
	b.position = pos
	eltern.add_child(b)
	return b
