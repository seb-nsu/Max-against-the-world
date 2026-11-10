@tool
extends CQGegenstand
# Gegenstand „SchmidtsAkte“ (schmidts_akte). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_schmidts_akte_state.gd')
var state: Data = load("res://game/inventory_items/schmidts_akte/inventory_item_schmidts_akte.tres")
