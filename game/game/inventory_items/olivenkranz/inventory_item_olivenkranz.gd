@tool
extends CQGegenstand
# Gegenstand „Olivenkranz“ (olivenkranz). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_olivenkranz_state.gd')
var state: Data = load("res://game/inventory_items/olivenkranz/inventory_item_olivenkranz.tres")
