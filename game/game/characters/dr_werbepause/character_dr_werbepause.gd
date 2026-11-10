@tool
extends CQFigur
# Figur „DrWerbepause“ (dr_werbepause). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_dr_werbepause_state.gd')
var state: Data = load("res://game/characters/dr_werbepause/character_dr_werbepause.tres")
