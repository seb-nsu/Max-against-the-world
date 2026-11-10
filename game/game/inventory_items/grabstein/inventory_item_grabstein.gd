@tool
extends CQGegenstand
# Gegenstand „Grabstein“ (grabstein). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_grabstein_state.gd')
var state: Data = load("res://game/inventory_items/grabstein/inventory_item_grabstein.tres")
