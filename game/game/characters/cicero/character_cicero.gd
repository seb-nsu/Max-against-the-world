@tool
extends CQFigur
# Figur „Cicero“ (cicero). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_cicero_state.gd')
var state: Data = load("res://game/characters/cicero/character_cicero.tres")
