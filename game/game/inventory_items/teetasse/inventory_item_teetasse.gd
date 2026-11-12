@tool
extends CQGegenstand
# Gegenstand „Teetasse“ (teetasse). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_teetasse_state.gd')
var state: Data = load("res://game/inventory_items/teetasse/inventory_item_teetasse.tres")


## Kalter Tee, bis Max den Thunfisch aus der offenen Dose hineinfüllt (0072, die Dose regelt das).
func zustand() -> String:
	return "gefuellt" if Zustand.ist("P0_TASSE_GEFUELLT") else "kalt"
