extends "dialog_menu.gd"
## Dialogauswahl unten (05-spielsysteme.md, Bildschirmaufbau): dunkle Fläche über die ganze
## Breite, bis zu sechs Zeilen (Review Fund 11: bei vier lag „Tschüss“ hinter dem Rollbalken); neue Optionen weiß, gelesene grau, die unter der Maus gelb.


func _ready() -> void:
	normal_font_color = Color.WHITE
	normal_used_font_color = Color("5a6988")
	hover_font_color = Color("fee761")
	hover_used_font_color = Color("fee761")
	pressed_font_color = Color("feae34")
	pressed_used_font_color = Color("feae34")
	max_height = 112
	var stil := StyleBoxFlat.new()
	stil.bg_color = Color("181425")
	stil.border_color = Color("262b44")
	stil.border_width_top = 1
	stil.content_margin_left = 12
	stil.content_margin_right = 12
	stil.content_margin_top = 4
	stil.content_margin_bottom = 4
	panel_container.add_theme_stylebox_override(&"panel", stil)
	dialog_options_container.add_theme_constant_override(&"separation", 0)
	super()
