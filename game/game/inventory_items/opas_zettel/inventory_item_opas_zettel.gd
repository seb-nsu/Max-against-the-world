@tool
extends CQGegenstand
# Gegenstand „OpasZettel“ (opas_zettel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_opas_zettel_state.gd')
var state: Data = load("res://game/inventory_items/opas_zettel/inventory_item_opas_zettel.tres")


## „Lies den Zettel erst drüben“: im Prolog nur Max' Kommentar (0840).
## Im Prolog darf Max ihn noch nicht lesen (0840); ab Welt 1 öffnet er die Nahansicht.
func _ansehen() -> void:
	if Zustand.abschnitt == "prolog":
		await Spiel.sagen("MAX", "P0_DACH_MAX_0840")
	else:
		await Spiel.nahansicht_zeigen("opas_zettel")
