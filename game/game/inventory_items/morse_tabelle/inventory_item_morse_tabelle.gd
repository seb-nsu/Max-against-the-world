@tool
extends CQGegenstand
# Gegenstand „MorseTabelle“ (morse_tabelle). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_morse_tabelle_state.gd')
var state: Data = load("res://game/inventory_items/morse_tabelle/inventory_item_morse_tabelle.tres")
