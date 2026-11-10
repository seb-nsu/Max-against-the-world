@tool
extends CQHotspot
# Hotspot „Kochgeschirr“ (kochgeschirr) im Raum Schmiede. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Krug auf Kochgeschirr: Max versucht es gar nicht erst (0510).
func _on_item_used(item: PopochiuInventoryItem) -> void:
	if item.script_name == "Krug":
		await Spiel.hingehen(self)
		await Spiel.sagen("MAX", "W1_SCHM_MAX_0510")
		return
	await super(item)
