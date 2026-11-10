@tool
extends CQGegenstand
# Gegenstand „Portalgeraet“ (portalgeraet). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_portalgeraet_state.gd')
var state: Data = load("res://game/inventory_items/portalgeraet/inventory_item_portalgeraet.tres")
