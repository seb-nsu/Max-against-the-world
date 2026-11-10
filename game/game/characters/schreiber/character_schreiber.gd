@tool
extends CQFigur
# Figur „Schreiber“ (schreiber). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_schreiber_state.gd')
var state: Data = load("res://game/characters/schreiber/character_schreiber.tres")
