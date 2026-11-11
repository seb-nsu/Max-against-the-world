@tool
extends CQHotspot
# Hotspot „Kalender“ (kalender) im Raum Dachboden. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Schon beim ersten Ansehen (0620, gleich danach 0630) öffnet sich die Nahansicht; ab dann
## kennt Max die Nummer. Die Lösung von P3 steht nicht hinter einem zweiten Klick.
func _on_right_click() -> void:
	var zeile := await ansehen()
	if zeile == "P0_DACH_MAX_0620":
		await Spiel.nahansicht_zeigen("kalender")
