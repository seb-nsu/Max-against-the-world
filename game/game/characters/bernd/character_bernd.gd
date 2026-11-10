@tool
extends CQFigur
# Figur „Bernd“ (bernd). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_bernd_state.gd')
var state: Data = load("res://game/characters/bernd/character_bernd.tres")
