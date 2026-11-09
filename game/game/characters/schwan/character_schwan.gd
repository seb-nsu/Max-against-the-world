@tool
extends CQFigur
# Figur „Schwan“ (schwan). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_schwan_state.gd')
var state: Data = load("res://game/characters/schwan/character_schwan.tres")
