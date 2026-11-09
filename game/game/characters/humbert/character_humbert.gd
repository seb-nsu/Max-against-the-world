@tool
extends CQFigur
# Figur „Humbert“ (humbert). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_humbert_state.gd')
var state: Data = load("res://game/characters/humbert/character_humbert.tres")
