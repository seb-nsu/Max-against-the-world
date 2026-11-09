@tool
extends CQFigur
# Figur „Max“ (max). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_max_state.gd')
var state: Data = load("res://game/characters/max/character_max.tres")
