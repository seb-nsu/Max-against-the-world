@tool
extends CQGegenstand
# Gegenstand „Kochloeffel“ (kochloeffel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_kochloeffel_state.gd')
var state: Data = load("res://game/inventory_items/kochloeffel/inventory_item_kochloeffel.tres")


func zustand() -> String:
	return "zauberstab" if Zustand.geloest("R2") else "ohne_kaese"


func name_key() -> String:
	return "UI_OBJ_KOCHLOEFFEL_ZAUBERSTAB" if zustand() == "zauberstab" else super()


## R2: Käsefondue auf den Kochlöffel (0500–0540). Der Stabmacher spricht nur, wenn er dabei ist;
## die Socke gibt es in jedem Fall (Lücke G-Liste: R2 außerhalb des Ladens).
func _kombinieren(item: PopochiuInventoryItem) -> bool:
	if item.script_name != "Kaesefondue" or Zustand.geloest("R2"):
		return false
	var stabmacher: bool = is_instance_valid(R.current) and R.current.has_character("Stabmacher")
	var schritte := [Spiel.z("MAX", "W1_STAB_MAX_0500")]
	if stabmacher:
		schritte.append_array([
			Spiel.z("STA", "W1_STAB_STA_0510"),
			Spiel.z("MAX", "W1_STAB_MAX_0520"),
			Spiel.z("STA", "W1_STAB_STA_0530"),
		])
	schritte.append_array([
		Spiel.abgeben.bind("Kaesefondue"),
		Zustand.loese.bind("R2"),
		Spiel.geben.bind("Socke"),
		Spiel.z("PIX", "W1_STAB_PIX_0540"),
	])
	await Spiel.szene(schritte)
	await Spiel.abgeben("Kaesefondue")
	Zustand.loese("R2")
	await Spiel.geben("Socke")
	return true
