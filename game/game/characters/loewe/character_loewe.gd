@tool
extends CQFigur
# Figur „Loewe“ (loewe). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_loewe_state.gd')
var state: Data = load("res://game/characters/loewe/character_loewe.tres")
