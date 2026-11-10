@tool
extends CQGegenstand
# Gegenstand „Haufen“ (haufen). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_haufen_state.gd')
var state: Data = load("res://game/inventory_items/haufen/inventory_item_haufen.tres")
