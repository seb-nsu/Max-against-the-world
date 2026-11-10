@tool
extends CQGegenstand
# Gegenstand „Schriftrolle“ (schriftrolle). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_schriftrolle_state.gd')
var state: Data = load("res://game/inventory_items/schriftrolle/inventory_item_schriftrolle.tres")
