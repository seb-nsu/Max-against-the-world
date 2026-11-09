@tool
extends CQGegenstand
# Gegenstand „Thunfischdose“ (thunfischdose). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_thunfischdose_state.gd')
var state: Data = load("res://game/inventory_items/thunfischdose/inventory_item_thunfischdose.tres")


## Zu, bis P1 sie öffnet; danach hat Pixel sie leer gefressen („offen“ nur in der Szene).
func zustand() -> String:
	if Zustand.abschnitt != "prolog":
		return "leer"
	return "leer" if Zustand.geloest("P1") else "zu"


func _kombinieren(item: PopochiuInventoryItem) -> bool:
	if item.script_name != "Dosenoeffner":
		return false
	if Zustand.geloest("P1") or not is_instance_valid(R.current) or not R.current.has_method("p1_loesen"):
		await Spiel.ersatz()
		return true
	await R.current.call("p1_loesen")
	return true
