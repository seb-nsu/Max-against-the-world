@tool
extends CQFigur
# Figur „Opa“ (opa). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_opa_state.gd')
var state: Data = load("res://game/characters/opa/character_opa.tres")
