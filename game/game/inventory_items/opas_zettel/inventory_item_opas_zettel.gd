@tool
extends CQGegenstand
# Gegenstand „OpasZettel“ (opas_zettel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_opas_zettel_state.gd')
var state: Data = load("res://game/inventory_items/opas_zettel/inventory_item_opas_zettel.tres")


## „Lies den Zettel erst drüben“: im Prolog darf Max ihn noch nicht lesen (Bauplan: 0840,
## zweites Mal 0842, dann Pool); ab Welt 1 öffnet er die Nahansicht.
func _ansehen() -> void:
	if Zustand.abschnitt == "prolog":
		await super()
	else:
		await Spiel.nahansicht_zeigen("opas_zettel")
