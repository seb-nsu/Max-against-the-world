@tool
extends CQFigur
# Figur „Flamingos“ (flamingos). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_flamingos_state.gd')
var state: Data = load("res://game/characters/flamingos/character_flamingos.tres")
