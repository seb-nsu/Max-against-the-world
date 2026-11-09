@tool
extends CQHotspot
# Hotspot „Spiegel“ (spiegel) im Raum Luftschloss. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Benutzen wie Ansehen (0100/0110), Pixel: 0120/0130.
func _on_click() -> void:
	await Spiel.hingehen(self)
	await ansehen()


func _pixel_benutzt() -> void:
	await Spiel.sagen("SPI", "W1_LUFT_SPI_0120")
	await Spiel.sagen("PIX", "W1_LUFT_PIX_0130")
