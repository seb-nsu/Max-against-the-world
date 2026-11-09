@tool
extends CQGegenstand
# Gegenstand „Tarifvertrag“ (tarifvertrag). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_tarifvertrag_state.gd')
var state: Data = load("res://game/inventory_items/tarifvertrag/inventory_item_tarifvertrag.tres")


## Leer von Grimmzahn (BERG 0550), unterschrieben mit Ketchup (0570–0590, Weg A).
func zustand() -> String:
	return "unterschrieben" if Zustand.geloest("R10a") else "leer"


func _kombinieren(item: PopochiuInventoryItem) -> bool:
	if item.script_name != "Ketchup" or Zustand.geloest("R10a"):
		return false
	if is_instance_valid(R.current) and R.current.has_method("vertrag_unterschreiben"):
		await R.current.call("vertrag_unterschreiben")
		return true
	return false


## BERG 0710/0715 stehen in einer Regie-Tabelle und fehlen im Bauplan (offene-punkte.md G21).
func _ansehen() -> void:
	if zustand() != "unterschrieben":
		await super()
		return
	await Spiel.ansehen([
		{sprecher = "MAX", zeile = "W1_BERG_MAX_0710", mal = 1},
		{sprecher = "MAX", zeile = "W1_BERG_MAX_0715", mal = 2},
	], "Gegenstand/" + script_name, zustand())
