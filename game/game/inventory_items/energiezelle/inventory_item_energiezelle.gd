@tool
extends CQGegenstand
# Gegenstand „Energiezelle“ (energiezelle). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_energiezelle_state.gd')
var state: Data = load("res://game/inventory_items/energiezelle/inventory_item_energiezelle.tres")
