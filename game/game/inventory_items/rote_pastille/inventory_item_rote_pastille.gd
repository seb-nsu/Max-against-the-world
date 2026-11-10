@tool
extends CQGegenstand
# Gegenstand „RotePastille“ (rote_pastille). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_rote_pastille_state.gd')
var state: Data = load("res://game/inventory_items/rote_pastille/inventory_item_rote_pastille.tres")
