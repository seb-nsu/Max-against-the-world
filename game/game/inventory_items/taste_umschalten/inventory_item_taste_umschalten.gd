@tool
extends CQGegenstand
# Gegenstand „TasteUmschalten“ (taste_umschalten). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_taste_umschalten_state.gd')
var state: Data = load("res://game/inventory_items/taste_umschalten/inventory_item_taste_umschalten.tres")
