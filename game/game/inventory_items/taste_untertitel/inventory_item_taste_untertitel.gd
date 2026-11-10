@tool
extends CQGegenstand
# Gegenstand „TasteUntertitel“ (taste_untertitel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_taste_untertitel_state.gd')
var state: Data = load("res://game/inventory_items/taste_untertitel/inventory_item_taste_untertitel.tres")
