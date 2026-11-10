@tool
extends CQFigur
# Figur „Zombie“ (zombie). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_zombie_state.gd')
var state: Data = load("res://game/characters/zombie/character_zombie.tres")
