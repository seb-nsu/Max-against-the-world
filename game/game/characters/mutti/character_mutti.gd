@tool
extends CQFigur
# Figur „Mutti“ (mutti). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_mutti_state.gd')
var state: Data = load("res://game/characters/mutti/character_mutti.tres")
