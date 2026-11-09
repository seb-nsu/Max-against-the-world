@tool
extends CQGegenstand
# Gegenstand „Zeugnis“ (zeugnis). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_zeugnis_state.gd')
var state: Data = load("res://game/inventory_items/zeugnis/inventory_item_zeugnis.tres")


## Ansehen öffnet die Nahansicht (HOGG 0830, Notizbuch „Mo-Knuddel“).
func _ansehen() -> void:
	await Spiel.nahansicht_zeigen("zeugnis")
	await super()
