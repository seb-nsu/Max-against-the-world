@tool
extends CQGegenstand
# Gegenstand „Bildtafel“ (bildtafel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_bildtafel_state.gd')
var state: Data = load("res://game/inventory_items/bildtafel/inventory_item_bildtafel.tres")
