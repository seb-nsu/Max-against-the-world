@tool
extends CQGegenstand
# Gegenstand „Kaugummi“ (kaugummi). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_kaugummi_state.gd')
var state: Data = load("res://game/inventory_items/kaugummi/inventory_item_kaugummi.tres")
