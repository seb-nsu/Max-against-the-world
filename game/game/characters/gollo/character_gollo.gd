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


## R1c: ein Gegenstand aus der Tasche auf Gollo, erst wenn Minka und Humbert weg sind (sonst
## 1110). Jeder Gegenstand gilt, denn die Frage heißt „Was hab ich in meiner Tasche?“; die
## Auflösung ist immer die Thunfischdose, die Max aus dem Prolog dabeihat.
func _on_item_used(item: PopochiuInventoryItem) -> void:
	if I.is_item_in_inventory("Thunfischdose") and not Zustand.geloest("R1c"):
		await Spiel.hingehen(self)
		if Zustand.geloest("R1a") and Zustand.geloest("R1b"):
			await room.call("r1c_loesen")
		else:
			await Spiel.sagen("GOL", "W1_TAV_GOL_1110")
		return
	await super(item)
