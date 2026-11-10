@tool
extends CQFigur
# Figur „WeinenderMann“ (weinender_mann). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_weinender_mann_state.gd')
var state: Data = load("res://game/characters/weinender_mann/character_weinender_mann.tres")
