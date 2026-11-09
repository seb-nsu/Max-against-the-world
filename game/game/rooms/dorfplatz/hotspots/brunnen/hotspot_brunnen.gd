@tool
extends CQHotspot
# Hotspot „Brunnen“ (brunnen) im Raum Dorfplatz. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Eimer füllen (0360/0370). Die Goldmünze gehört zu Rätsel 5, das im Vertical Slice fehlt.
func _on_item_used(item: PopochiuInventoryItem) -> void:
	match item.script_name:
		"Eimer":
			await Spiel.hingehen(self)
			if Zustand.wert("W1_EIMER", "leer") == "mit_wasser":
				await Spiel.ersatz()
				return
			await Spiel.sagen_eintrag(bauplan().gegenstand_auf[0])
			Zustand.setze_wert("W1_EIMER", "mit_wasser")
		"Goldmuenze":
			await Spiel.hingehen(self)
			Spiel.ausbau_ende("UI_WELT_1_ENDE")
		_:
			await super(item)
