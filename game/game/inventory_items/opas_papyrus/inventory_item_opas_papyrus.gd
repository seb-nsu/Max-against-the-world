@tool
extends CQGegenstand
# Gegenstand „OpasPapyrus“ (opas_papyrus). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_opas_papyrus_state.gd')
var state: Data = load("res://game/inventory_items/opas_papyrus/inventory_item_opas_papyrus.tres")
