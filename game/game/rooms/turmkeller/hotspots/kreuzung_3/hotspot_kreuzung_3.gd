@tool
extends CQHotspot
# Hotspot „Kreuzung3“ (kreuzung_3) im Raum Turmkeller. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


func _on_click() -> void:
	await Spiel.hingehen(self)
	await room.call("kreuzung_max")


func _pixel_benutzt() -> void:
	await room.call("kreuzung_pixel", 3)
