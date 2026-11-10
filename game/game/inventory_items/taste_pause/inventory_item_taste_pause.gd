@tool
extends CQGegenstand
# Gegenstand „TastePause“ (taste_pause). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_taste_pause_state.gd')
var state: Data = load("res://game/inventory_items/taste_pause/inventory_item_taste_pause.tres")
