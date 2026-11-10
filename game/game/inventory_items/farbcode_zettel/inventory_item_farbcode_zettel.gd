@tool
extends CQGegenstand
# Gegenstand „FarbcodeZettel“ (farbcode_zettel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_farbcode_zettel_state.gd')
var state: Data = load("res://game/inventory_items/farbcode_zettel/inventory_item_farbcode_zettel.tres")
