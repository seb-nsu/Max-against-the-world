@tool
extends CQFigur
# Figur „Erzaehler“ (erzaehler). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_erzaehler_state.gd')
var state: Data = load("res://game/characters/erzaehler/character_erzaehler.tres")
