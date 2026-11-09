@tool
extends CQGegenstand
# Gegenstand „Kronleuchter“ (kronleuchter). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_kronleuchter_state.gd')
var state: Data = load("res://game/inventory_items/kronleuchter/inventory_item_kronleuchter.tres")
