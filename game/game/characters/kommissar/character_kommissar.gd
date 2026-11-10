@tool
extends CQFigur
# Figur „Kommissar“ (kommissar). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_kommissar_state.gd')
var state: Data = load("res://game/characters/kommissar/character_kommissar.tres")
