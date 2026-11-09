@tool
extends CQFigur
# Figur „Goblin2“ (goblin_2). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_goblin_2_state.gd')
var state: Data = load("res://game/characters/goblin_2/character_goblin_2.tres")
