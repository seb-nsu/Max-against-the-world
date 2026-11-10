@tool
extends CQFigur
# Figur „Hofkater“ (hofkater). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_hofkater_state.gd')
var state: Data = load("res://game/characters/hofkater/character_hofkater.tres")
