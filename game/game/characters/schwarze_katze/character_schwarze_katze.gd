@tool
extends CQFigur
# Figur „SchwarzeKatze“ (schwarze_katze). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_schwarze_katze_state.gd')
var state: Data = load("res://game/characters/schwarze_katze/character_schwarze_katze.tres")
