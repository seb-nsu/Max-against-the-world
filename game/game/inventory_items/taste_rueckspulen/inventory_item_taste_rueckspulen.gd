@tool
extends CQGegenstand
# Gegenstand „TasteRueckspulen“ (taste_rueckspulen). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_taste_rueckspulen_state.gd')
var state: Data = load("res://game/inventory_items/taste_rueckspulen/inventory_item_taste_rueckspulen.tres")
