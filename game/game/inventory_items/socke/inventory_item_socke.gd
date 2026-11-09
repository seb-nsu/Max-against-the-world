@tool
extends CQGegenstand
# Gegenstand „Socke“ (socke). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_socke_state.gd')
var state: Data = load("res://game/inventory_items/socke/inventory_item_socke.tres")


func zustand() -> String:
	return "voller_pollen" if Zustand.geloest("R7") else "leer"
