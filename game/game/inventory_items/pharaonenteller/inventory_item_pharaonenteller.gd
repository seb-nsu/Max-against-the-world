@tool
extends CQGegenstand
# Gegenstand „Pharaonenteller“ (pharaonenteller). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_pharaonenteller_state.gd')
var state: Data = load("res://game/inventory_items/pharaonenteller/inventory_item_pharaonenteller.tres")
