@tool
extends CQFigur
# Figur „Zeremonienmeister“ (zeremonienmeister). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_zeremonienmeister_state.gd')
var state: Data = load("res://game/characters/zeremonienmeister/character_zeremonienmeister.tres")
