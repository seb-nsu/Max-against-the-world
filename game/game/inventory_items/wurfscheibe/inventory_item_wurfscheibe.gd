@tool
extends CQGegenstand
# Gegenstand „Wurfscheibe“ (wurfscheibe). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_wurfscheibe_state.gd')
var state: Data = load("res://game/inventory_items/wurfscheibe/inventory_item_wurfscheibe.tres")
