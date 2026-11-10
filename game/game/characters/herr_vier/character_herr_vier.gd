@tool
extends CQFigur
# Figur „HerrVier“ (herr_vier). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_herr_vier_state.gd')
var state: Data = load("res://game/characters/herr_vier/character_herr_vier.tres")
