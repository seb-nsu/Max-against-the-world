@tool
extends CQFigur
# Figur „Beamter1“ (beamter_1). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_beamter_1_state.gd')
var state: Data = load("res://game/characters/beamter_1/character_beamter_1.tres")
