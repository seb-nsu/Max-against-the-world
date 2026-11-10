@tool
extends CQGegenstand
# Gegenstand „Sandalen“ (sandalen). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_sandalen_state.gd')
var state: Data = load("res://game/inventory_items/sandalen/inventory_item_sandalen.tres")
