@tool
extends CQGegenstand
# Gegenstand „BilligFernbedienung“ (billig_fernbedienung). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_billig_fernbedienung_state.gd')
var state: Data = load("res://game/inventory_items/billig_fernbedienung/inventory_item_billig_fernbedienung.tres")
