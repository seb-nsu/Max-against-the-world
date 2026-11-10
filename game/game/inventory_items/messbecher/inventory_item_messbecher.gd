@tool
extends CQGegenstand
# Gegenstand „Messbecher“ (messbecher). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_messbecher_state.gd')
var state: Data = load("res://game/inventory_items/messbecher/inventory_item_messbecher.tres")
