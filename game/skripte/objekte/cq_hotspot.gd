@tool
class_name CQHotspot
extends PopochiuHotspot
## Basisklasse aller Hotspots (vom Godot-Bau gesetzt).
##
## Standard: Rechtsklick sagt die Ansehen-Zeile aus dem Bauplan (Bedingungen „vor/nach Px“,
## „zweites Mal“), Linksklick und Gegenstand-darauf geben eine Ersatzzeile. Rätsellogik
## gehört in das Skript des Hotspots: _on_click() und _on_item_used(item) überschreiben,
## Ansehen-Sonderfälle in _on_right_click() (dann ansehen() aufrufen).

## Wie oft der Spieler das Objekt angesehen hat (Popochiu speichert es mit dem Raum).
var ansehen_zaehler := 0


func bauplan() -> Dictionary:
	if not is_instance_valid(room):
		return {}
	return Bauplan.objekt(room.script_name, script_name)


func objekt_id() -> String:
	return bauplan().get("id", script_name.to_snake_case())


## Die Ansehen-Zeile sagen; liefert die gesagte Zeilen-ID ("" bei Ersatzzeile).
func ansehen() -> String:
	ansehen_zaehler += 1
	Hinweise.objekt_beruehrt(objekt_id())
	return await Spiel.ansehen(bauplan().get("ansehen", []), ansehen_zaehler)


func on_click() -> void:
	Hinweise.objekt_beruehrt(objekt_id())
	if Spiel.pixel_als_gegenstand:
		Spiel.pixel_als_gegenstand = false
		await _pixel_benutzt()
		return
	await super()


func on_item_used(item: PopochiuInventoryItem) -> void:
	Hinweise.objekt_beruehrt(objekt_id())
	Hinweise.objekt_beruehrt(Bauplan.gegenstand(item.script_name).get("id", ""))
	await super(item)


func _on_click() -> void:
	await Spiel.hingehen(self)
	await Spiel.ersatz()


func _on_double_click() -> void:
	await _on_click()


func _on_right_click() -> void:
	await ansehen()


func _on_middle_click() -> void:
	pass


func _on_item_used(_item: PopochiuInventoryItem) -> void:
	await Spiel.hingehen(self)
	await Spiel.ersatz()


## Pixel als Gegenstand auf dieses Objekt (Prolog, nach P1). Standard: Pixels Ersatzzeile.
func _pixel_benutzt() -> void:
	await Spiel.ersatz("PIX")
