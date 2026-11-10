@tool
extends CQGegenstand
# Gegenstand „Zugangskarte“ (zugangskarte). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_zugangskarte_state.gd')
var state: Data = load("res://game/inventory_items/zugangskarte/inventory_item_zugangskarte.tres")
