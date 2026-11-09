@tool
extends CQGegenstand
# Gegenstand „Notizbuch“ (notizbuch). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_notizbuch_state.gd')
var state: Data = load("res://game/inventory_items/notizbuch/inventory_item_notizbuch.tres")


## Linksklick öffnet das Notizbuch (Ziele, Regeln, Einkaufsliste).
func _on_click() -> void:
	await Spiel.notizbuch_oeffnen()
