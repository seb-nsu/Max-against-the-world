@tool
extends CQHotspot
# Hotspot „Drehknopf“ (drehknopf) im Raum Dachboden. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


func _on_click() -> void:
	await Spiel.hingehen(self)
	if not Zustand.geloest("P2"):
		await Spiel.sagen("OPA", "P0_DACH_OPA_1140")
	elif Zustand.geloest("P3"):
		await Spiel.ersatz()
	elif not "kalender" in Zustand.nahansichten:
		# Max kennt die Nummer noch nicht: Testbild Kanal 4
		await Spiel.sagen("MAX", "P0_DACH_MAX_0680")
	else:
		await room.call("p3_loesen")
