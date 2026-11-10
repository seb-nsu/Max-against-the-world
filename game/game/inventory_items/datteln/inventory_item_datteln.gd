@tool
extends CQGegenstand
# Gegenstand „Datteln“ (datteln). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_datteln_state.gd')
var state: Data = load("res://game/inventory_items/datteln/inventory_item_datteln.tres")
