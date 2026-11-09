@tool
extends CQFigur
# Figur „Goblin1“ (goblin_1). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_goblin_1_state.gd')
var state: Data = load("res://game/characters/goblin_1/character_goblin_1.tres")
