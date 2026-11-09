@tool
extends CQHotspot
# Hotspot „Kalender“ (kalender) im Raum Dachboden. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Beim zweiten Ansehen (0630) öffnet sich die Nahansicht; ab dann kennt Max die Nummer.
func _on_right_click() -> void:
	var zeile := await ansehen()
	if zeile == "P0_DACH_MAX_0630":
		await Spiel.nahansicht_zeigen("kalender")
