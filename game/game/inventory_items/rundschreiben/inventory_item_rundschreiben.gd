@tool
extends CQGegenstand
# Gegenstand „Rundschreiben“ (rundschreiben). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_rundschreiben_state.gd')
var state: Data = load("res://game/inventory_items/rundschreiben/inventory_item_rundschreiben.tres")
