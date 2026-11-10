@tool
extends CQFigur
# Figur „Geist“ (geist). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_geist_state.gd')
var state: Data = load("res://game/characters/geist/character_geist.tres")
