@tool
extends CQFigur
# Figur „FbiAgent“ (fbi_agent). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_fbi_agent_state.gd')
var state: Data = load("res://game/characters/fbi_agent/character_fbi_agent.tres")
