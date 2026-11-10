@tool
extends CQFigur
# Figur „Schildkroete“ (schildkroete). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_schildkroete_state.gd')
var state: Data = load("res://game/characters/schildkroete/character_schildkroete.tres")
