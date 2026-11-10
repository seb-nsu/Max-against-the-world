@tool
extends CQGegenstand
# Gegenstand „Traubensaft“ (traubensaft). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_traubensaft_state.gd')
var state: Data = load("res://game/inventory_items/traubensaft/inventory_item_traubensaft.tres")
