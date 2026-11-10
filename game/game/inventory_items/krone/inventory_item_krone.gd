@tool
extends CQGegenstand
# Gegenstand „Krone“ (krone). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_krone_state.gd')
var state: Data = load("res://game/inventory_items/krone/inventory_item_krone.tres")
