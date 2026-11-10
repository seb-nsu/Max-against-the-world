@tool
extends CQFigur
# Figur „Tiro“ (tiro). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_tiro_state.gd')
var state: Data = load("res://game/characters/tiro/character_tiro.tres")
