@tool
extends CQFigur
# Figur „Huhn“ (huhn). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_huhn_state.gd')
var state: Data = load("res://game/characters/huhn/character_huhn.tres")


## Pixel übersetzt Berta (TAV 1460, 1470): danach weiß Max, dass sie vor schlechter Musik flieht.
func _pixel_auf() -> void:
	await super()
	if Zustand.abschnitt == "welt-1":
		Zustand.setze("W1_BERTA_MUSIK")
