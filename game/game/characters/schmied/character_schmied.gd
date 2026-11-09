@tool
extends CQFigur
# Figur „Schmied“ (schmied). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_schmied_state.gd')
var state: Data = load("res://game/characters/schmied/character_schmied.tres")
