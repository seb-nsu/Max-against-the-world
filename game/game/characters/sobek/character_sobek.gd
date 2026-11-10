@tool
extends CQFigur
# Figur „Sobek“ (sobek). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_sobek_state.gd')
var state: Data = load("res://game/characters/sobek/character_sobek.tres")
