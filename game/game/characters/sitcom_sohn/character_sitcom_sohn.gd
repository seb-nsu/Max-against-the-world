@tool
extends CQFigur
# Figur „SitcomSohn“ (sitcom_sohn). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_sitcom_sohn_state.gd')
var state: Data = load("res://game/characters/sitcom_sohn/character_sitcom_sohn.tres")
