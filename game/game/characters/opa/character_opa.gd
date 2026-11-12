@tool
extends CQFigur
# Figur „Opa“ (opa). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_opa_state.gd')
var state: Data = load("res://game/characters/opa/character_opa.tres")


## Offene Thunfischdose auf Opa (1160): eigene Zeile, solange Pixel noch schläft.
func _on_item_used(item: PopochiuInventoryItem) -> void:
	if item.script_name == "Thunfischdose" and Zustand.abschnitt == "prolog" \
			and Zustand.ist("P0_DOSE_OFFEN") and not Zustand.geloest("P1"):
		await Spiel.hingehen(self)
		await Spiel.sagen("OPA", "P0_DACH_OPA_1160")
		return
	await super(item)
