@tool
extends CQFigur
# Figur „Empfangsdame“ (empfangsdame). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_empfangsdame_state.gd')
var state: Data = load("res://game/characters/empfangsdame/character_empfangsdame.tres")
