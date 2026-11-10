@tool
extends CQFigur
# Figur „OrakelOma“ (orakel_oma). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_orakel_oma_state.gd')
var state: Data = load("res://game/characters/orakel_oma/character_orakel_oma.tres")
