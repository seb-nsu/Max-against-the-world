@tool
extends CQGegenstand
# Gegenstand „Rezeptkarte“ (rezeptkarte). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_rezeptkarte_state.gd')
var state: Data = load("res://game/inventory_items/rezeptkarte/inventory_item_rezeptkarte.tres")
