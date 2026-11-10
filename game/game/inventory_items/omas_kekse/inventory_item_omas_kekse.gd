@tool
extends CQGegenstand
# Gegenstand „OmasKekse“ (omas_kekse). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_omas_kekse_state.gd')
var state: Data = load("res://game/inventory_items/omas_kekse/inventory_item_omas_kekse.tres")
