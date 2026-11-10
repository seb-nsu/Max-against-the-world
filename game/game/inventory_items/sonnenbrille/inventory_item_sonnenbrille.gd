@tool
extends CQGegenstand
# Gegenstand „Sonnenbrille“ (sonnenbrille). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_sonnenbrille_state.gd')
var state: Data = load("res://game/inventory_items/sonnenbrille/inventory_item_sonnenbrille.tres")
