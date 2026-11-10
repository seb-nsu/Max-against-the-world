@tool
extends CQGegenstand
# Gegenstand „Telefonbuchseite“ (telefonbuchseite). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_telefonbuchseite_state.gd')
var state: Data = load("res://game/inventory_items/telefonbuchseite/inventory_item_telefonbuchseite.tres")
