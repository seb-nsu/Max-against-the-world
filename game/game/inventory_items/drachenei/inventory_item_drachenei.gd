@tool
extends CQGegenstand
# Gegenstand „Drachenei“ (drachenei). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_drachenei_state.gd')
var state: Data = load("res://game/inventory_items/drachenei/inventory_item_drachenei.tres")
