extends "hover_text.gd"
## Objektname unter dem Zeiger, gelb mit dunklem Rand (05-spielsysteme.md, Bildschirmaufbau).
## Bleibt am Bildrand, damit lange Namen nicht abgeschnitten werden.

const GELB := Color("fee761")
const ABSTAND := Vector2(0, 14)        # unter der Zeigerspitze, in Spielpixeln
const BREITE := 200.0


func _ready() -> void:
	super()
	label.set_anchors_preset(Control.PRESET_TOP_LEFT)
	label.size = Vector2(BREITE, 14)
	label.add_theme_color_override(&"default_color", GELB)
	label.add_theme_font_size_override(&"normal_font_size", 10)


func _process(_delta: float) -> void:
	if not visible or label.text.is_empty():
		return
	var flaeche := get_viewport_rect().size
	var p := get_viewport().get_mouse_position() + ABSTAND
	p.x = clampf(p.x - BREITE / 2.0, 0.0, flaeche.x - BREITE)
	p.y = minf(p.y, flaeche.y - label.size.y - 2.0)
	label.position = p
