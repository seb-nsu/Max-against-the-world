@tool
extends CQGegenstand
# Gegenstand „Leuchtpilz“ (leuchtpilz). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_leuchtpilz_state.gd')
var state: Data = load("res://game/inventory_items/leuchtpilz/inventory_item_leuchtpilz.tres")
