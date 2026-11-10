@tool
extends CQGegenstand
# Gegenstand „Papyrusblatt“ (papyrusblatt). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_papyrusblatt_state.gd')
var state: Data = load("res://game/inventory_items/papyrusblatt/inventory_item_papyrusblatt.tres")
