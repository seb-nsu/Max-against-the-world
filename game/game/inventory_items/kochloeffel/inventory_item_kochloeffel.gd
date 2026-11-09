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


## R2: Käsefondue auf den Kochlöffel (0500–0540), nur im Zauberstab-Laden beim Stabmacher.
## Anderswo nur Max' Zeile 0600; R2 bleibt offen, das Fondue bleibt (G10).
func _kombinieren(item: PopochiuInventoryItem) -> bool:
	if item.script_name != "Kaesefondue" or Zustand.geloest("R2"):
		return false
	if not (is_instance_valid(R.current) and R.current.has_character("Stabmacher")):
		await Spiel.sagen("MAX", "W1_STAB_MAX_0600")
		return true
	await Spiel.szene([
		Spiel.z("MAX", "W1_STAB_MAX_0500"),
		Spiel.z("STA", "W1_STAB_STA_0510"),
		Spiel.z("MAX", "W1_STAB_MAX_0520"),
		Spiel.z("STA", "W1_STAB_STA_0530"),
		Spiel.abgeben.bind("Kaesefondue"),
		Zustand.loese.bind("R2"),
		Spiel.geben.bind("Socke"),
		Spiel.z("PIX", "W1_STAB_PIX_0540"),
	])
	await Spiel.abgeben("Kaesefondue")
	Zustand.loese("R2")
	await Spiel.geben("Socke")
	return true
