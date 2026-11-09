@tool
extends CQGegenstand
# Gegenstand „Bestellzettel“ (bestellzettel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_bestellzettel_state.gd')
var state: Data = load("res://game/inventory_items/bestellzettel/inventory_item_bestellzettel.tres")
