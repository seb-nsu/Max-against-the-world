@tool
extends CQFigur
# Figur „Tuer“ (tuer). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_tuer_state.gd')
var state: Data = load("res://game/characters/tuer/character_tuer.tres")
