@tool
extends CQFigur
# Figur „WonderWilma“ (wonder_wilma). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_wonder_wilma_state.gd')
var state: Data = load("res://game/characters/wonder_wilma/character_wonder_wilma.tres")
