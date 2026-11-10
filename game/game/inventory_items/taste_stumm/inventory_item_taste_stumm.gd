@tool
extends CQGegenstand
# Gegenstand „TasteStumm“ (taste_stumm). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_taste_stumm_state.gd')
var state: Data = load("res://game/inventory_items/taste_stumm/inventory_item_taste_stumm.tres")
