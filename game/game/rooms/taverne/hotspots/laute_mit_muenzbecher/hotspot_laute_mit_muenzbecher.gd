@tool
extends CQHotspot
# Hotspot „LauteMitMuenzbecher“ (laute_mit_muenzbecher) im Raum Taverne. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Weiß Max von Bertas Musikgeschmack (W1_BERTA_MUSIK), spielt er so schief, dass sie auf den
## Dachbalken flieht und das Ei freigibt (TAV 1580–1605). Sonst die gewohnte Zeile 1560.
func _on_click() -> void:
	if not Zustand.ist("W1_BERTA_MUSIK") or Zustand.ist("W1_BERTA_WEG") or Spiel.ist_pixel():
		await super()
		return
	await Spiel.hingehen(self)
	await Spiel.szene([
		Spiel.z("MAX", "W1_TAV_MAX_1580"),
		Spiel.z("NAR", "W1_TAV_NAR_1590"),
		_berta_fliegt,
		Spiel.z("HUH", "W1_TAV_HUH_1600"),
		Spiel.z("PIX", "W1_TAV_PIX_1605"),
	])


func _berta_fliegt() -> void:
	# Berta flattert im Bogen über zwei Sprünge auf den Dachbalken (Review Fund 18)
	if is_instance_valid(room) and room.has_character("Huhn") and room.has_marker("HuhnBalken"):
		var oben: Vector2 = room.get_marker_position("HuhnBalken")
		var start: Vector2 = C.Huhn.position
		await C.Huhn.springen_zu(start.lerp(oben, 0.5) + Vector2(-30, 0), 26.0, 0.4)
		await C.Huhn.springen_zu(oben, 20.0, 0.4)
	Zustand.setze("W1_BERTA_WEG")
	if is_instance_valid(room) and room.has_method("_zustand_anwenden"):
		room._zustand_anwenden()
