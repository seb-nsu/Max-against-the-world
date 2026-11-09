@tool
extends CQGegenstand
# Gegenstand „Kaesefondue“ (kaesefondue). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_kaesefondue_state.gd')
var state: Data = load("res://game/inventory_items/kaesefondue/inventory_item_kaesefondue.tres")
