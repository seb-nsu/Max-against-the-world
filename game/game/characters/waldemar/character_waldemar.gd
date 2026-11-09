@tool
extends CQFigur
# Figur „Waldemar“ (waldemar). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_waldemar_state.gd')
var state: Data = load("res://game/characters/waldemar/character_waldemar.tres")
