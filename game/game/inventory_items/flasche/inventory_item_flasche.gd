@tool
extends CQGegenstand
# Gegenstand „Flasche“ (flasche). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_flasche_state.gd')
var state: Data = load("res://game/inventory_items/flasche/inventory_item_flasche.tres")


## Flaschen 2 und 5 sind groß (W1_FLASCHE: Nummer der genommenen Flasche, 0 = keine).
func zustand() -> String:
	return "gross" if int(Zustand.wert("W1_FLASCHE", 0)) in [2, 5] else "klein"
