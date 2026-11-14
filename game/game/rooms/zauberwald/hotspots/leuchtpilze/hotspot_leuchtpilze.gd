@tool
extends CQHotspot
# Hotspot „Leuchtpilze“ (leuchtpilze) im Raum Zauberwald. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Ein Linksklick auf die Pilzgruppe nimmt den einzelnen Leuchtpilz, solange er noch da ist
## (Review Fund 21: vorher kam eine Ersatzzeile, obwohl Alwin genau diese Pilze verlangt).
func _on_click() -> void:
	var pilz = room.get_node_or_null("Props/Leuchtpilz") if is_instance_valid(room) else null
	if pilz and pilz.visible and pilz.clickable and not Spiel.ist_pixel():
		await pilz.on_click()
		return
	await super()
