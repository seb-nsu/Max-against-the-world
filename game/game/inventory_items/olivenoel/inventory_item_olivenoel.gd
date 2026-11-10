@tool
extends CQGegenstand
# Gegenstand „Olivenoel“ (olivenoel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_olivenoel_state.gd')
var state: Data = load("res://game/inventory_items/olivenoel/inventory_item_olivenoel.tres")
