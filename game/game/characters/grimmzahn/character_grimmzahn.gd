@tool
extends CQFigur
# Figur „Grimmzahn“ (grimmzahn). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_grimmzahn_state.gd')
var state: Data = load("res://game/characters/grimmzahn/character_grimmzahn.tres")


## Das Gespräch gehört zu Rätseln nach dem Vertical Slice (ab R5): nur die Meldung.
func _on_click() -> void:
	await Spiel.hingehen(self)
	Spiel.ausbau_ende("UI_WELT_1_ENDE")
