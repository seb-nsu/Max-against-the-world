@tool
extends CQGegenstand
# Gegenstand „Goldmuenze“ (goldmuenze). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_goldmuenze_state.gd')
var state: Data = load("res://game/inventory_items/goldmuenze/inventory_item_goldmuenze.tres")
