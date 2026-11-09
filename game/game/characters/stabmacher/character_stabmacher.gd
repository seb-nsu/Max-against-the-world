@tool
extends CQFigur
# Figur „Stabmacher“ (stabmacher). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_stabmacher_state.gd')
var state: Data = load("res://game/characters/stabmacher/character_stabmacher.tres")
