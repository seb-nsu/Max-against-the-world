@tool
extends CQGegenstand
# Gegenstand „Socke“ (socke). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_socke_state.gd')
var state: Data = load("res://game/inventory_items/socke/inventory_item_socke.tres")


func zustand() -> String:
	return "voller_pollen" if Zustand.geloest("R7") else "leer"


## WALD 0600/0605 stehen in einer Regie-Tabelle und fehlen im Bauplan (offene-punkte.md G21).
func _ansehen() -> void:
	if zustand() != "voller_pollen":
		await super()
		return
	await Spiel.ansehen([
		{sprecher = "MAX", zeile = "W1_WALD_MAX_0600", mal = 1},
		{sprecher = "MAX", zeile = "W1_WALD_MAX_0605", mal = 2},
	], "Gegenstand/" + script_name, zustand())
