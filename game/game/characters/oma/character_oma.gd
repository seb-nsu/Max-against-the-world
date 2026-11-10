@tool
extends CQFigur
# Figur „Oma“ (oma). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_oma_state.gd')
var state: Data = load("res://game/characters/oma/character_oma.tres")
