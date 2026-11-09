@tool
extends CQFigur
# Figur „Zeldina“ (zeldina). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_zeldina_state.gd')
var state: Data = load("res://game/characters/zeldina/character_zeldina.tres")
