@tool
extends CQFigur
# Figur „SitcomMutter“ (sitcom_mutter). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_sitcom_mutter_state.gd')
var state: Data = load("res://game/characters/sitcom_mutter/character_sitcom_mutter.tres")
