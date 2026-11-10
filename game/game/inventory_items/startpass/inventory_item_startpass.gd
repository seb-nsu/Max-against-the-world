@tool
extends CQGegenstand
# Gegenstand „Startpass“ (startpass). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_startpass_state.gd')
var state: Data = load("res://game/inventory_items/startpass/inventory_item_startpass.tres")
