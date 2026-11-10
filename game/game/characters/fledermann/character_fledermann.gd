@tool
extends CQFigur
# Figur „Fledermann“ (fledermann). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_fledermann_state.gd')
var state: Data = load("res://game/characters/fledermann/character_fledermann.tres")
