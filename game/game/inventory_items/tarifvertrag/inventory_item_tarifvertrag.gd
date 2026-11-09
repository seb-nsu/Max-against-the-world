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


## BERG 0710/0715 stehen seit der Regie-Tabellen-Korrektur im Bauplan, aber ohne Zustand
## (Skript: „Ansehen: Tarifvertrag“ statt „…, unterschrieben“). Sie gelten nur unterschrieben.
func _ansehen() -> void:
	var leer := zustand() == "leer"
	var eintraege: Array = bauplan().get("ansehen", []).filter(
		func(e): return (e.get("zustand", "") == "leer") == leer)
	await Spiel.ansehen(eintraege, "Gegenstand/" + script_name, zustand())
