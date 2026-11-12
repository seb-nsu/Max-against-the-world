extends "simple_click_bar.gd"
## Inventarleiste oben (05-spielsysteme.md, Bildschirmaufbau): 48 Pixel hoch, links Platz für die
## Porträts von Max und Pixel, rechts für die Hilfe-Pfote (beide aus oberflaeche/hud.gd). Klappt
## ein, sobald die Maus den oberen Rand verlässt, und bleibt in Gesprächen und Szenen zu.

const HOEHE := 48.0
const LINKS := 108.0         # zwei Porträts zu 48 ab x 4 und 56 (hud.gd) plus Abstand
const RECHTS := 56.0         # Hilfe-Pfote ab x 588
const DUNKEL := Color("181425")
const RAND := Color("262b44")


func _ready() -> void:
	var stil := StyleBoxFlat.new()
	stil.bg_color = DUNKEL
	stil.border_color = RAND
	stil.border_width_bottom = 1
	stil.content_margin_left = LINKS
	stil.content_margin_right = RECHTS
	stil.content_margin_top = 6
	stil.content_margin_bottom = 6
	panel_container.add_theme_stylebox_override(&"panel", stil)
	panel_container.self_modulate = Color.WHITE
	panel_container.offset_bottom = HOEHE
	box.add_theme_constant_override(&"separation", 3)
	hidden_y = -HOEHE
	hide_when_gui_is_blocked = true
	super()
