@tool
extends CQFigur
# Figur „Faehrmann“ (faehrmann). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_faehrmann_state.gd')
var state: Data = load("res://game/characters/faehrmann/character_faehrmann.tres")
