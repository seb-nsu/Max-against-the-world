@tool
extends CQGegenstand
# Gegenstand „Sandale“ (sandale). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_sandale_state.gd')
var state: Data = load("res://game/inventory_items/sandale/inventory_item_sandale.tres")
