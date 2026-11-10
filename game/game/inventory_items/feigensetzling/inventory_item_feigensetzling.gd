@tool
extends CQGegenstand
# Gegenstand „Feigensetzling“ (feigensetzling). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_feigensetzling_state.gd')
var state: Data = load("res://game/inventory_items/feigensetzling/inventory_item_feigensetzling.tres")
