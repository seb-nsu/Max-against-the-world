@tool
extends CQGegenstand
# Gegenstand „SplitscreenAdapter“ (splitscreen_adapter). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_splitscreen_adapter_state.gd')
var state: Data = load("res://game/inventory_items/splitscreen_adapter/inventory_item_splitscreen_adapter.tres")
