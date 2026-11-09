@tool
extends CQHotspot
# Hotspot „Dorfbrett“ (dorfbrett) im Raum Dorfplatz. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Rätsel 3: Bestellzettel ans Brett, Rotkäppchen liefert die XXL-Ziege (Raum, xxl_liefern()).
func _on_item_used(item: PopochiuInventoryItem) -> void:
	if item.script_name == "Bestellzettel":
		await Spiel.hingehen(self)
		await room.call("xxl_liefern")
		return
	await super(item)
