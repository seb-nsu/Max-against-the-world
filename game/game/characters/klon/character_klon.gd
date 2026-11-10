@tool
extends CQFigur
# Figur „Klon“ (klon). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_klon_state.gd')
var state: Data = load("res://game/characters/klon/character_klon.tres")
