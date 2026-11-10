@tool
extends CQGegenstand
# Gegenstand „Brennspiegel“ (brennspiegel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_brennspiegel_state.gd')
var state: Data = load("res://game/inventory_items/brennspiegel/inventory_item_brennspiegel.tres")
