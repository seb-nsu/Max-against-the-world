@tool
extends CQGegenstand
# Gegenstand „Schallplatte“ (schallplatte). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_schallplatte_state.gd')
var state: Data = load("res://game/inventory_items/schallplatte/inventory_item_schallplatte.tres")
