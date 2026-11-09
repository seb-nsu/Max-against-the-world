@tool
extends CQGegenstand
# Gegenstand „Ketchup“ (ketchup). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_ketchup_state.gd')
var state: Data = load("res://game/inventory_items/ketchup/inventory_item_ketchup.tres")
