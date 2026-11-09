@tool
extends CQGegenstand
# Gegenstand „Leuchttrank“ (leuchttrank). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_leuchttrank_state.gd')
var state: Data = load("res://game/inventory_items/leuchttrank/inventory_item_leuchttrank.tres")
