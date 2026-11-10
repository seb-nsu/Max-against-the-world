@tool
extends CQFigur
# Figur „Leonidas“ (leonidas). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_leonidas_state.gd')
var state: Data = load("res://game/characters/leonidas/character_leonidas.tres")
