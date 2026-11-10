@tool
extends CQGegenstand
# Gegenstand „Bananenschale“ (bananenschale). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_bananenschale_state.gd')
var state: Data = load("res://game/inventory_items/bananenschale/inventory_item_bananenschale.tres")
