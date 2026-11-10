@tool
extends CQGegenstand
# Gegenstand „Kugelschreiber“ (kugelschreiber). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_kugelschreiber_state.gd')
var state: Data = load("res://game/inventory_items/kugelschreiber/inventory_item_kugelschreiber.tres")
