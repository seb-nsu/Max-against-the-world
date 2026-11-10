@tool
extends CQFigur
# Figur „Nebet“ (nebet). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_nebet_state.gd')
var state: Data = load("res://game/characters/nebet/character_nebet.tres")
