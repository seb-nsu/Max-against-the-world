@tool
extends CQGegenstand
# Gegenstand „PixelFeld“ (pixel_feld). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_pixel_feld_state.gd')
var state: Data = load("res://game/inventory_items/pixel_feld/inventory_item_pixel_feld.tres")
