@tool
extends CQFigur
# Figur „Ramses“ (ramses). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_ramses_state.gd')
var state: Data = load("res://game/characters/ramses/character_ramses.tres")
