@tool
extends CQGegenstand
# Gegenstand „Drehbuch“ (drehbuch). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_drehbuch_state.gd')
var state: Data = load("res://game/inventory_items/drehbuch/inventory_item_drehbuch.tres")
