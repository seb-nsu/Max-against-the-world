@tool
extends CQFigur
# Figur „Nashorn“ (nashorn). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_nashorn_state.gd')
var state: Data = load("res://game/characters/nashorn/character_nashorn.tres")
