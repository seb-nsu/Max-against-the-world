@tool
extends CQFigur
# Figur „Geier“ (geier). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_geier_state.gd')
var state: Data = load("res://game/characters/geier/character_geier.tres")
