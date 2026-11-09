@tool
extends CQGegenstand
# Gegenstand „Drahtkleiderbuegel“ (drahtkleiderbuegel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_drahtkleiderbuegel_state.gd')
var state: Data = load("res://game/inventory_items/drahtkleiderbuegel/inventory_item_drahtkleiderbuegel.tres")


func zustand() -> String:
	return str(Zustand.wert("P0_DRAHTKLEIDERBUEGEL", "gerade"))


func name_key() -> String:
	return "UI_OBJ_ANTENNE" if zustand() == "antenne" else super()


## Benutzen im Inventar: zur Antenne biegen (skript/prolog.md, 0470).
func _benutzen() -> void:
	if zustand() == "antenne":
		await Spiel.ersatz()
		return
	await Spiel.sagen("MAX", "P0_DACH_MAX_0470")
	biegen()


func biegen() -> void:
	Zustand.setze_wert("P0_DRAHTKLEIDERBUEGEL", "antenne")
