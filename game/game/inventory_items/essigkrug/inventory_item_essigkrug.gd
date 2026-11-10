@tool
extends CQGegenstand
# Gegenstand „Essigkrug“ (essigkrug). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_essigkrug_state.gd')
var state: Data = load("res://game/inventory_items/essigkrug/inventory_item_essigkrug.tres")
