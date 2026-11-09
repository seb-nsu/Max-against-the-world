@tool
extends CQFigur
# Figur „Smaugi“ (smaugi). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_smaugi_state.gd')
var state: Data = load("res://game/characters/smaugi/character_smaugi.tres")
