@tool
extends CQFigur
# Figur „Gepard“ (gepard). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_gepard_state.gd')
var state: Data = load("res://game/characters/gepard/character_gepard.tres")
