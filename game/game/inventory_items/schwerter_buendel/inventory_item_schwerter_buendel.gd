@tool
extends CQGegenstand
# Gegenstand „SchwerterBuendel“ (schwerter_buendel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_schwerter_buendel_state.gd')
var state: Data = load("res://game/inventory_items/schwerter_buendel/inventory_item_schwerter_buendel.tres")
