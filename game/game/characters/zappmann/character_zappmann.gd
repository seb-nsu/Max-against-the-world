@tool
extends CQFigur
# Figur „Zappmann“ (zappmann). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_zappmann_state.gd')
var state: Data = load("res://game/characters/zappmann/character_zappmann.tres")
