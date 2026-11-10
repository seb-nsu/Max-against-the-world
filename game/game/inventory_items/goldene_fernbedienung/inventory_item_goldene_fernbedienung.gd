@tool
extends CQGegenstand
# Gegenstand „GoldeneFernbedienung“ (goldene_fernbedienung). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_goldene_fernbedienung_state.gd')
var state: Data = load("res://game/inventory_items/goldene_fernbedienung/inventory_item_goldene_fernbedienung.tres")
