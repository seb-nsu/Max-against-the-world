@tool
extends CQGegenstand
# Gegenstand „Handy“ (handy). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_handy_state.gd')
var state: Data = load("res://game/inventory_items/handy/inventory_item_handy.tres")
