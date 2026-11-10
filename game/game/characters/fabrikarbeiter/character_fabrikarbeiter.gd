@tool
extends CQFigur
# Figur „Fabrikarbeiter“ (fabrikarbeiter). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_fabrikarbeiter_state.gd')
var state: Data = load("res://game/characters/fabrikarbeiter/character_fabrikarbeiter.tres")
