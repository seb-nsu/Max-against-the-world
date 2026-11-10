@tool
extends CQFigur
# Figur „Wettkandidat“ (wettkandidat). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_wettkandidat_state.gd')
var state: Data = load("res://game/characters/wettkandidat/character_wettkandidat.tres")
