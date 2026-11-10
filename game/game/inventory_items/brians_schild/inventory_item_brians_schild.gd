@tool
extends CQGegenstand
# Gegenstand „BriansSchild“ (brians_schild). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_brians_schild_state.gd')
var state: Data = load("res://game/inventory_items/brians_schild/inventory_item_brians_schild.tres")
