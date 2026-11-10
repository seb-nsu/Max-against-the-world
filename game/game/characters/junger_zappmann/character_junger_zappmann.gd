@tool
extends CQFigur
# Figur „JungerZappmann“ (junger_zappmann). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_junger_zappmann_state.gd')
var state: Data = load("res://game/characters/junger_zappmann/character_junger_zappmann.tres")
