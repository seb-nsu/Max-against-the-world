@tool
extends CQGegenstand
# Gegenstand „Goldbarren“ (goldbarren). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_goldbarren_state.gd')
var state: Data = load("res://game/inventory_items/goldbarren/inventory_item_goldbarren.tres")
