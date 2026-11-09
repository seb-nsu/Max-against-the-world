@tool
extends CQFigur
# Figur „Huhn“ (huhn). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_huhn_state.gd')
var state: Data = load("res://game/characters/huhn/character_huhn.tres")
