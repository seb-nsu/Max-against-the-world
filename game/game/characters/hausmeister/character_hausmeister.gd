@tool
extends CQFigur
# Figur „Hausmeister“ (hausmeister). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_hausmeister_state.gd')
var state: Data = load("res://game/characters/hausmeister/character_hausmeister.tres")
