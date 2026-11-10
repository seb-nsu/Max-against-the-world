@tool
extends CQGegenstand
# Gegenstand „Fladen“ (fladen). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_fladen_state.gd')
var state: Data = load("res://game/inventory_items/fladen/inventory_item_fladen.tres")
