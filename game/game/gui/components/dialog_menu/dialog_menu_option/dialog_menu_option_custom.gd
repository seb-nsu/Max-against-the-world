extends "dialog_menu_option.gd"
## Schriftgröße der Dialogauswahl: 10, mit „Große Schrift“ größer (skripte/einstellungen.gd).


func _ready() -> void:
	super()
	$RichTextLabel.add_theme_font_size_override(&"normal_font_size", Einstellungen.schrift(10))
