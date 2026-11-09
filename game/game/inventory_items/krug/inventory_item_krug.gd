@tool
extends CQGegenstand
# Gegenstand „Krug“ (krug). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_krug_state.gd')
var state: Data = load("res://game/inventory_items/krug/inventory_item_krug.tres")
