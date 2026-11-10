@tool
extends CQFigur
# Figur „Hermes“ (hermes). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_hermes_state.gd')
var state: Data = load("res://game/characters/hermes/character_hermes.tres")
