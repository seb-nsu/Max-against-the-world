@tool
extends CQFigur
# Figur „Flimmer“ (flimmer). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_flimmer_state.gd')
var state: Data = load("res://game/characters/flimmer/character_flimmer.tres")
