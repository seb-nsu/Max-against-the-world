@tool
extends CQProp
# Prop „Ei“ (ei) im Raum Taverne. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Solange Berta auf dem Ei sitzt, hackt sie (TAV 1425–1427). Erst wenn die Laute sie auf den
## Dachbalken vertrieben hat (W1_BERTA_WEG), nimmt Max das Ei wie gewohnt.
func _on_click() -> void:
	if Zustand.ist("W1_BERTA_WEG") or Spiel.ist_pixel():
		await super()
		return
	await Spiel.hingehen(self)
	var schritte := [Spiel.z("MAX", "W1_TAV_MAX_1425"), Spiel.z("HUH", "W1_TAV_HUH_1426")]
	if not Zustand.ist("W1_BERTA_GEFRAGT") and not Zustand.ist("W1_BERTA_MUSIK"):
		Zustand.setze("W1_BERTA_GEFRAGT")
		schritte.append(Spiel.z("PIX", "W1_TAV_PIX_1427"))
	await Spiel.szene(schritte)
