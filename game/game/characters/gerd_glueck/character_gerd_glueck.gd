@tool
extends CQFigur
# Figur „GerdGlueck“ (gerd_glueck). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_gerd_glueck_state.gd')
var state: Data = load("res://game/characters/gerd_glueck/character_gerd_glueck.tres")
