@tool
extends CQGegenstand
# Gegenstand „Entwurf“ (entwurf). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_entwurf_state.gd')
var state: Data = load("res://game/inventory_items/entwurf/inventory_item_entwurf.tres")
