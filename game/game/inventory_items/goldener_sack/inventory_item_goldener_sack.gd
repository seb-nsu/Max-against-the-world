@tool
extends CQGegenstand
# Gegenstand „GoldenerSack“ (goldener_sack). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_goldener_sack_state.gd')
var state: Data = load("res://game/inventory_items/goldener_sack/inventory_item_goldener_sack.tres")
