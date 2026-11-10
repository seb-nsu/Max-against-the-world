@tool
extends CQGegenstand
# Gegenstand „ParadenPlan“ (paraden_plan). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_paraden_plan_state.gd')
var state: Data = load("res://game/inventory_items/paraden_plan/inventory_item_paraden_plan.tres")
