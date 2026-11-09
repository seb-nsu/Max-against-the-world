@tool
extends CQHotspot
# Hotspot „Schild“ (schild) im Raum Trollbruecke. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Ansehen öffnet die Nahansicht der Märchen-Satzung; beim ersten Mal liest das Schild vor.
func _on_right_click() -> void:
	var neu := not "maerchen_satzung" in Zustand.nahansichten
	await ansehen()
	if Spiel.ist_pixel():
		return
	await Spiel.nahansicht_zeigen("maerchen_satzung")
	if neu:
		await Spiel.szene([
			Spiel.z("WAL", "W1_BRUE_WAL_0040"),
			Spiel.z("WAL", "W1_BRUE_WAL_0050"),
			Spiel.z("WAL", "W1_BRUE_WAL_0060"),
			Spiel.z("MAX", "W1_BRUE_MAX_0070"),
		])


## Benutzen: nach R4a die Sätze vorlesen (R4b), sonst wie Ansehen.
func _on_click() -> void:
	await Spiel.hingehen(self)
	if Zustand.geloest("R4a") and not Zustand.ist("W1_SATZUNG_VORGELESEN"):
		await room.call("vorlesen")
		return
	await _on_right_click()
