@tool
extends CQFigur
# Figur „Schmidt“ (schmidt). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_schmidt_state.gd')
var state: Data = load("res://game/characters/schmidt/character_schmidt.tres")
