@tool
extends CQFigur
# Figur „Sicherheitsmann“ (sicherheitsmann). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_sicherheitsmann_state.gd')
var state: Data = load("res://game/characters/sicherheitsmann/character_sicherheitsmann.tres")
