@tool
extends CQFigur
# Figur „Philosoph“ (philosoph). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_philosoph_state.gd')
var state: Data = load("res://game/characters/philosoph/character_philosoph.tres")
