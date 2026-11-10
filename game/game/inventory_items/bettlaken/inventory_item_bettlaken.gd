@tool
extends CQGegenstand
# Gegenstand „Bettlaken“ (bettlaken). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_bettlaken_state.gd')
var state: Data = load("res://game/inventory_items/bettlaken/inventory_item_bettlaken.tres")
