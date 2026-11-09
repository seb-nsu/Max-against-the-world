@tool
extends CQHotspot
# Hotspot „Niesrosen“ (niesrosen) im Raum Zauberwald. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Rätsel 7: die Rosen gehen nur auf, wenn Waldemar singt (Waldemar-Option 0290, Szene im Raum).
func _on_click() -> void:
	await Spiel.hingehen(self)
	if Zustand.geloest("R7"):
		await Spiel.ersatz()
		return
	await Spiel.sagen("MAX", "W1_WALD_MAX_0420")
	await Spiel.sagen("PIX", "W1_WALD_PIX_0430")


func _pixel_benutzt() -> void:
	if Zustand.geloest("R7"):
		await super()
		return
	await Spiel.sagen("PIX", "W1_WALD_PIX_0440")


func _on_item_used(item: PopochiuInventoryItem) -> void:
	match item.script_name:
		"Socke" when not Zustand.geloest("R7"):
			await Spiel.hingehen(self)
			await Spiel.sagen("MAX", "W1_WALD_MAX_0410")
		"Eimer":
			await Spiel.hingehen(self)
			await Spiel.sagen("MAX", "W1_WALD_MAX_0450")
		_:
			await super(item)
