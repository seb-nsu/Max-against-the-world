@tool
extends CQHotspot
# Hotspot „GeradeRoute“ (gerade_route) im Raum Turmkeller. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Pixel auf dem Boden außerhalb der Kreuzungen: hier fegt keiner (0190).
func _pixel_benutzt() -> void:
	await Spiel.sagen("PIX", "W1_TURM_PIX_0190")
