@tool
extends CQGegenstand
# Gegenstand „Amboss“ (amboss). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_amboss_state.gd')
var state: Data = load("res://game/inventory_items/amboss/inventory_item_amboss.tres")
