@tool
extends CQFigur
# Figur „Hieron“ (hieron). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_hieron_state.gd')
var state: Data = load("res://game/characters/hieron/character_hieron.tres")
