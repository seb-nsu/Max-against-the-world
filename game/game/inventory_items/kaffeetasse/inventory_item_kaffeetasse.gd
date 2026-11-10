@tool
extends CQGegenstand
# Gegenstand „Kaffeetasse“ (kaffeetasse). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_kaffeetasse_state.gd')
var state: Data = load("res://game/inventory_items/kaffeetasse/inventory_item_kaffeetasse.tres")
