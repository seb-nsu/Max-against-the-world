@tool
extends CQFigur
# Figur „TroedelExperte“ (troedel_experte). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_troedel_experte_state.gd')
var state: Data = load("res://game/characters/troedel_experte/character_troedel_experte.tres")
