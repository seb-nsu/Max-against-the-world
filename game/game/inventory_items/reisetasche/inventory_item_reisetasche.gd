@tool
extends CQGegenstand
# Gegenstand „Reisetasche“ (reisetasche). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_reisetasche_state.gd')
var state: Data = load("res://game/inventory_items/reisetasche/inventory_item_reisetasche.tres")
