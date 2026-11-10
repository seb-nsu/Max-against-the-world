@tool
extends CQFigur
# Figur „Rebell“ (rebell). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_rebell_state.gd')
var state: Data = load("res://game/characters/rebell/character_rebell.tres")
