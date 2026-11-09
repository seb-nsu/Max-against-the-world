@tool
extends CQGegenstand
# Gegenstand „Ei“ (ei). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_ei_state.gd')
var state: Data = load("res://game/inventory_items/ei/inventory_item_ei.tres")
