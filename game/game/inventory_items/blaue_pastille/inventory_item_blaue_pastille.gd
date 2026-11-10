@tool
extends CQGegenstand
# Gegenstand „BlauePastille“ (blaue_pastille). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_blaue_pastille_state.gd')
var state: Data = load("res://game/inventory_items/blaue_pastille/inventory_item_blaue_pastille.tres")
