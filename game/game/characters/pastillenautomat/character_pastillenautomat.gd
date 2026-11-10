@tool
extends CQFigur
# Figur „Pastillenautomat“ (pastillenautomat). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_pastillenautomat_state.gd')
var state: Data = load("res://game/characters/pastillenautomat/character_pastillenautomat.tres")
