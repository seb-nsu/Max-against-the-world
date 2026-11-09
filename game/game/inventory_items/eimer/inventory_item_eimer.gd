@tool
extends CQGegenstand
# Gegenstand „Eimer“ (eimer). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_eimer_state.gd')
var state: Data = load("res://game/inventory_items/eimer/inventory_item_eimer.tres")


func zustand() -> String:
	return str(Zustand.wert("W1_EIMER", "leer"))


func name_key() -> String:
	return "UI_OBJ_EIMER_MIT_WASSER" if zustand() == "mit_wasser" else super()
