@tool
extends CQHotspot
# Hotspot „Besen“ (besen) im Raum Turmkeller. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Benutzen: der Besen erwischt Max (0160–0180).
func _on_click() -> void:
	await Spiel.hingehen(self)
	await room.call("gefegt")
