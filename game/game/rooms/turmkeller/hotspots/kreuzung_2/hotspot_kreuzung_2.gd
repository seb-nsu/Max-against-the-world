@tool
extends CQHotspot
# Hotspot „Kreuzung2“ (kreuzung_2) im Raum Turmkeller. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


func _on_click() -> void:
	await Spiel.hingehen(self)
	await room.call("kreuzung_max")


func _pixel_benutzt() -> void:
	await room.call("kreuzung_pixel", 2)


## Die Ansehen-Zeilen (TURM 0080/0085) gelten für jede der drei Kreuzungen; der Bauplan hängt
## sie nur an Kreuzung 1 (Layout-Alias kreuzung → kreuzung_1), G23.
func ansehen() -> String:
	Hinweise.objekt_beruehrt(objekt_id())
	var k1: Dictionary = Bauplan.objekt(room.script_name, "Kreuzung1")
	return await Spiel.ansehen(k1.get("ansehen", []), "%s/%s" % [room.script_name, script_name])
