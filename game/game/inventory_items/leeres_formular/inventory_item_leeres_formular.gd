@tool
extends CQGegenstand
# Gegenstand „LeeresFormular“ (leeres_formular). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_leeres_formular_state.gd')
var state: Data = load("res://game/inventory_items/leeres_formular/inventory_item_leeres_formular.tres")
