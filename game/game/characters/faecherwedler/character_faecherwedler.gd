@tool
extends CQFigur
# Figur „Faecherwedler“ (faecherwedler). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_faecherwedler_state.gd')
var state: Data = load("res://game/characters/faecherwedler/character_faecherwedler.tres")
