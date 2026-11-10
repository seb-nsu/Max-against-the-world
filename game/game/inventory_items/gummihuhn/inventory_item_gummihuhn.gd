@tool
extends CQGegenstand
# Gegenstand „Gummihuhn“ (gummihuhn). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_gummihuhn_state.gd')
var state: Data = load("res://game/inventory_items/gummihuhn/inventory_item_gummihuhn.tres")
