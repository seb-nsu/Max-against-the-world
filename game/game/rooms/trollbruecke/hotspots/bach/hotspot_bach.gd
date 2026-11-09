@tool
extends CQHotspot
# Hotspot „Bach“ (bach) im Raum Trollbruecke. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Max schubst Waldemar nicht in den Bach (0930): nach 0920 (R4b gelöst), vor R4c (G13).
func _on_click() -> void:
	if Zustand.geloest("R4b") and not Zustand.geloest("R4c"):
		await Spiel.hingehen(self)
		await Spiel.sagen("MAX", "W1_BRUE_MAX_0930")
		return
	await super()


## Leerer Eimer auf den Bach: Waldemar verbietet es (1070), jederzeit (G13).
func _on_item_used(item: PopochiuInventoryItem) -> void:
	if item.script_name == "Eimer" and Zustand.wert("W1_EIMER", "leer") == "leer":
		await Spiel.hingehen(self)
		await Spiel.sagen("WAL", "W1_BRUE_WAL_1070")
		return
	await super(item)
