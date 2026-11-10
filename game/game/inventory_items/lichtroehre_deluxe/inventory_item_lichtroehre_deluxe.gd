@tool
extends CQGegenstand
# Gegenstand „LichtroehreDeluxe“ (lichtroehre_deluxe). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_lichtroehre_deluxe_state.gd')
var state: Data = load("res://game/inventory_items/lichtroehre_deluxe/inventory_item_lichtroehre_deluxe.tres")
