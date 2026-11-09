extends CanvasLayer
## Nahansicht (05-spielsysteme.md, Bildschirme): Überlagerung in 320×180 mit Rahmen und
## Schließen-Knopf oben rechts. Das Bild steht im Bauplan („nahansichten“), bis zur fertigen
## Grafik ein Platzhalter aus tools/godot_raeume.py.

signal geschlossen


func _ready() -> void:
	layer = 12


func zeigen(daten: Dictionary) -> void:
	var dunkel := ColorRect.new()
	dunkel.color = Color(0.15, 0.17, 0.27, 0.6)
	dunkel.set_anchors_preset(Control.PRESET_FULL_RECT)
	dunkel.mouse_filter = Control.MOUSE_FILTER_STOP
	add_child(dunkel)
	var bild := TextureRect.new()
	bild.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	if ResourceLoader.exists(daten.get("bild", "")):
		bild.texture = load(daten.bild)
	bild.set_anchors_preset(Control.PRESET_FULL_RECT)
	bild.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(bild)
	var zu := Button.new()
	zu.text = "X"
	zu.tooltip_text = tr("UI_SCHLIESSEN")
	zu.position = Vector2(300, 2)
	zu.size = Vector2(18, 14)
	zu.pressed.connect(schliessen)
	if ResourceLoader.exists(HUD_THEMA):
		zu.theme = load(HUD_THEMA)
	add_child(zu)


const HUD_THEMA := "res://game/gui/resources/gui_theme.tres"


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		schliessen()


func schliessen() -> void:
	geschlossen.emit()
