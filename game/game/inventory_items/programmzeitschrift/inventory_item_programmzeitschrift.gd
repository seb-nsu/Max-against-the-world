@tool
extends CQGegenstand
# Gegenstand „Programmzeitschrift“ (programmzeitschrift). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_programmzeitschrift_state.gd')
var state: Data = load("res://game/inventory_items/programmzeitschrift/inventory_item_programmzeitschrift.tres")
