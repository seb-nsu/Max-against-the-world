@tool
extends CQHotspot
# Hotspot „Dachbalken“ (dachbalken) im Raum Taverne. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Spielt Pixel, springt er zurück auf den Balken; Max bekommt die Zeile aus dem Bauplan.
func _on_click() -> void:
	if C.player != C.Pixel:
		await super()
		return
	C.Pixel.position = R.current.get_marker_position("Balken")
