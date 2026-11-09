@tool
extends CQGegenstand
# Gegenstand „Steckbrief“ (steckbrief). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_steckbrief_state.gd')
var state: Data = load("res://game/inventory_items/steckbrief/inventory_item_steckbrief.tres")
