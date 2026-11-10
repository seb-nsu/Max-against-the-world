@tool
extends CQFigur
# Figur „Piepsi“ (piepsi). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_piepsi_state.gd')
var state: Data = load("res://game/characters/piepsi/character_piepsi.tres")
