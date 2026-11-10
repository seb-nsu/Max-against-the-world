@tool
extends CQFigur
# Figur „Radio“ (radio). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_radio_state.gd')
var state: Data = load("res://game/characters/radio/character_radio.tres")
