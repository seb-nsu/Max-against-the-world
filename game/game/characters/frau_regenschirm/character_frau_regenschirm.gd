@tool
extends CQFigur
# Figur „FrauRegenschirm“ (frau_regenschirm). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_frau_regenschirm_state.gd')
var state: Data = load("res://game/characters/frau_regenschirm/character_frau_regenschirm.tres")
