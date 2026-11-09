@tool
extends CQHotspot
# Hotspot „FondueTopf“ (fondue_topf) im Raum Taverne. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Solange Minka am Topf sitzt: Max wird angefaucht (0910/0920), Pixel traut sich nicht (0930).
func _on_click() -> void:
	if room.has_character("Minka"):
		await Spiel.hingehen(self)
		await Spiel.sagen("MIN", "W1_TAV_MIN_0910")
		await Spiel.sagen("MAX", "W1_TAV_MAX_0920")
		return
	await super()


func _pixel_benutzt() -> void:
	if room.has_character("Minka"):
		await Spiel.sagen("PIX", "W1_TAV_PIX_0930")
		return
	await super()
