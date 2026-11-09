@tool
extends CQFigur
# Figur „Gollo“ (gollo). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_gollo_state.gd')
var state: Data = load("res://game/characters/gollo/character_gollo.tres")


## Nach R1 schläft Gollo (1570).
func _on_click() -> void:
	if Zustand.geloest("R1c"):
		await Spiel.sagen("GOL", "W1_TAV_GOL_1570")
		return
	await super()


## R1c: Thunfischdose auf Gollo, erst wenn Minka und Humbert weg sind (sonst 1110).
func _on_item_used(item: PopochiuInventoryItem) -> void:
	if item.script_name == "Thunfischdose" and not Zustand.geloest("R1c"):
		await Spiel.hingehen(self)
		if Zustand.geloest("R1a") and Zustand.geloest("R1b"):
			await room.call("r1c_loesen")
		else:
			await Spiel.sagen("GOL", "W1_TAV_GOL_1110")
		return
	await super(item)
