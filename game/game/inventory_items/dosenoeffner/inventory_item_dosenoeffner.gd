@tool
extends CQGegenstand
# Gegenstand „Dosenoeffner“ (dosenoeffner). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_dosenoeffner_state.gd')
var state: Data = load("res://game/inventory_items/dosenoeffner/inventory_item_dosenoeffner.tres")
