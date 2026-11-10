@tool
extends CQGegenstand
# Gegenstand „TasteSendersuchlauf“ (taste_sendersuchlauf). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_taste_sendersuchlauf_state.gd')
var state: Data = load("res://game/inventory_items/taste_sendersuchlauf/inventory_item_taste_sendersuchlauf.tres")
