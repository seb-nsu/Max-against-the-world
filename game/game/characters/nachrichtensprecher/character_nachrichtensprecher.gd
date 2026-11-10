@tool
extends CQFigur
# Figur „Nachrichtensprecher“ (nachrichtensprecher). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_nachrichtensprecher_state.gd')
var state: Data = load("res://game/characters/nachrichtensprecher/character_nachrichtensprecher.tres")
