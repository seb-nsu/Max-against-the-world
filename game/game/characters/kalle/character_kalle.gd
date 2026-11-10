@tool
extends CQFigur
# Figur „Kalle“ (kalle). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_kalle_state.gd')
var state: Data = load("res://game/characters/kalle/character_kalle.tres")
