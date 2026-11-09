@tool
extends CQFigur
# Figur „Minka“ (minka). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_minka_state.gd')
var state: Data = load("res://game/characters/minka/character_minka.tres")


## Max: Minka faucht (0910/0920). Pixel: R1a.
func _on_click() -> void:
	await Spiel.sagen("MIN", "W1_TAV_MIN_0910")
	await Spiel.sagen("MAX", "W1_TAV_MAX_0920")


func _pixel_auf() -> void:
	await Spiel.hingehen(self)
	await room.call("r1a_loesen")
