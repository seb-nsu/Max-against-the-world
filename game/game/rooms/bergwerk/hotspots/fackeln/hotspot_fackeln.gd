@tool
extends CQHotspot
# Hotspot „Fackeln“ (fackeln) im Raum Bergwerk. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Leuchttrank in die Fackeln: wie auf Grimmzahn (Weg A, 0510–0550).
func _on_item_used(item: PopochiuInventoryItem) -> void:
	if item.script_name == "Leuchttrank" and not Zustand.ist("W1_GOBLIN_LICHT"):
		await Spiel.hingehen(self)
		await room.call("licht_bringen")
		return
	await super(item)
