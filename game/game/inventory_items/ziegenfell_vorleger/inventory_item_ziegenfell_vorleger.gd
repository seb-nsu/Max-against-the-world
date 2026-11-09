@tool
extends CQGegenstand
# Gegenstand „ZiegenfellVorleger“ (ziegenfell_vorleger). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_ziegenfell_vorleger_state.gd')
var state: Data = load("res://game/inventory_items/ziegenfell_vorleger/inventory_item_ziegenfell_vorleger.tres")
