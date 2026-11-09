@tool
extends CQGegenstand
# Gegenstand „Zauberbohne“ (zauberbohne). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_zauberbohne_state.gd')
var state: Data = load("res://game/inventory_items/zauberbohne/inventory_item_zauberbohne.tres")
