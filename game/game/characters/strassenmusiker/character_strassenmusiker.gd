@tool
extends CQFigur
# Figur „Strassenmusiker“ (strassenmusiker). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_strassenmusiker_state.gd')
var state: Data = load("res://game/characters/strassenmusiker/character_strassenmusiker.tres")
