@tool
extends CQGegenstand
# Gegenstand „Archivband“ (archivband). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_archivband_state.gd')
var state: Data = load("res://game/inventory_items/archivband/inventory_item_archivband.tres")
