@tool
extends CQFigur
# Figur „Beamter2“ (beamter_2). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_beamter_2_state.gd')
var state: Data = load("res://game/characters/beamter_2/character_beamter_2.tres")
