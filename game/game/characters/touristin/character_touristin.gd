@tool
extends CQFigur
# Figur „Touristin“ (touristin). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_touristin_state.gd')
var state: Data = load("res://game/characters/touristin/character_touristin.tres")
