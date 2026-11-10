extends CanvasLayer
## Pausemenü (05-spielsysteme.md, Bildschirme; Taste cq_pause, Standard Esc): Weiterspielen,
## Speichern, Laden, Optionen, Hauptmenü. Das Spiel steht, solange es offen ist. Öffnet nur
## außerhalb von Zwischensequenzen, Gesprächen und Überlagerungen (dort überspringt Esc).

signal geschlossen

const S := preload("res://oberflaeche/menue_stil.gd")
const SPIELSTAENDE := preload("res://oberflaeche/spielstaende.gd")
const OPTIONEN := preload("res://oberflaeche/optionen.gd")

var _haupt: Control
var _unter: Control
var _hauptmenue_knopf: Button
var _hinweis: Label


func _ready() -> void:
	layer = 20
	process_mode = Node.PROCESS_MODE_ALWAYS
	var dunkel := ColorRect.new()
	dunkel.color = Color(0.09, 0.08, 0.15, 0.7)
	dunkel.set_anchors_preset(Control.PRESET_FULL_RECT)
	dunkel.mouse_filter = Control.MOUSE_FILTER_STOP
	add_child(dunkel)
	_haupt = Control.new()
	_haupt.set_anchors_preset(Control.PRESET_FULL_RECT)
	_haupt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_haupt)
	var p := S.panel(Vector2(165, 40), Vector2(150, 190))
	_haupt.add_child(p)
	var titel := S.label(tr("UI_MENUE_PAUSE"), 12)
	titel.position = Vector2(10, 4)
	p.add_child(titel)
	var liste := VBoxContainer.new()
	liste.position = Vector2(12, 28)
	liste.size = Vector2(126, 130)
	liste.add_theme_constant_override("separation", 5)
	p.add_child(liste)
	var eintraege := [
		["UI_MENUE_WEITER", schliessen],
		["UI_MENUE_SPEICHERN", _unter_zeigen.bind("speichern")],
		["UI_MENUE_LADEN", _unter_zeigen.bind("laden")],
		["UI_MENUE_OPTIONEN", _unter_zeigen.bind("optionen")],
		["UI_MENUE_HAUPTMENUE", _zum_hauptmenue],
	]
	for e in eintraege:
		var k := S.knopf(tr(e[0]))
		k.pressed.connect(e[1])
		liste.add_child(k)
	_hauptmenue_knopf = liste.get_child(liste.get_child_count() - 1)
	_hinweis = S.label("", 8, S.GELB)
	_hinweis.position = Vector2(10, 160)
	_hinweis.size = Vector2(130, 26)
	_hinweis.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	p.add_child(_hinweis)
	(liste.get_child(0) as Button).grab_focus.call_deferred()


func _unter_zeigen(art: String) -> void:
	_haupt.hide()
	if art == "optionen":
		_unter = OPTIONEN.new()
	else:
		_unter = SPIELSTAENDE.new()
		_unter.modus = art
		_unter.geladen_werden.connect(_laden)
	_unter.zurueck.connect(_unter_schliessen)
	add_child(_unter)


func _unter_schliessen() -> void:
	if is_instance_valid(_unter):
		_unter.queue_free()
	_unter = null
	_haupt.show()
	(_haupt.get_child(0).get_child(1).get_child(0) as Button).grab_focus.call_deferred()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cq_pause") or event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		if is_instance_valid(_unter):
			_unter_schliessen()
		else:
			schliessen()


func schliessen() -> void:
	geschlossen.emit()


## Für Tests und Tastatur: Knopf der Liste nach Index (0 = Weiterspielen).
func knopf(i: int) -> Button:
	return _hauptmenue_knopf.get_parent().get_child(i)


func _laden(slot: int) -> void:
	Spiel.pause_laden(slot)


## Erst beim zweiten Klick: Was nicht gespeichert ist, geht verloren.
func _zum_hauptmenue() -> void:
	if _hinweis.text.is_empty():
		_hinweis.text = tr("UI_MENUE_HAUPTMENUE_SICHER")
		return
	Spiel.zum_hauptmenue()
