@tool
extends CQFigur
# Figur „Toadi“ (toadi). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_toadi_state.gd')
var state: Data = load("res://game/characters/toadi/character_toadi.tres")
