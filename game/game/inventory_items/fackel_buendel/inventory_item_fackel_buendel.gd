@tool
extends CQGegenstand
# Gegenstand „FackelBuendel“ (fackel_buendel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_fackel_buendel_state.gd')
var state: Data = load("res://game/inventory_items/fackel_buendel/inventory_item_fackel_buendel.tres")
