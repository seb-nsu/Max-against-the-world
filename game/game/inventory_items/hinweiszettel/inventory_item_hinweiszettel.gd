@tool
extends CQGegenstand
# Gegenstand „Hinweiszettel“ (hinweiszettel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_hinweiszettel_state.gd')
var state: Data = load("res://game/inventory_items/hinweiszettel/inventory_item_hinweiszettel.tres")


## Nahansicht mit Alwins Versen (HOGG 0610–0630); danach das Inventar-Ansehen.
func _ansehen() -> void:
	var erstes := not "hinweiszettel" in Zustand.nahansichten
	await Spiel.nahansicht_zeigen("hinweiszettel")
	if erstes:
		await Spiel.sagen("ALW", "W1_HOGG_ALW_0610")
		await Spiel.sagen("ALW", "W1_HOGG_ALW_0620")
		await Spiel.sagen("MAX", "W1_HOGG_MAX_0630")
		return
	await super()
