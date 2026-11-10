@tool
extends CQGegenstand
# Gegenstand „FondueKaese“ (fondue_kaese). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_fondue_kaese_state.gd')
var state: Data = load("res://game/inventory_items/fondue_kaese/inventory_item_fondue_kaese.tres")
