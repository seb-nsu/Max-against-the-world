@tool
class_name CQProp
extends PopochiuProp
## Basisklasse der Props aus dem Bauplan. Steht das Prop für einen Gegenstand mit
## Nehmen-Zeile (Bauplan: „gegenstand“, „nehmen“), nimmt Linksklick ihn auf. Sichtbarkeit und
## Bild leitet der Raum aus dem Zustand ab (CQRaum._zustand_anwenden()).

var ansehen_zaehler := 0


func bauplan() -> Dictionary:
	if not is_instance_valid(room):
		return {}
	return Bauplan.objekt(room.script_name, script_name)


func objekt_id() -> String:
	return bauplan().get("id", script_name.to_snake_case())


func ansehen() -> String:
	ansehen_zaehler += 1
	Hinweise.objekt_beruehrt(objekt_id())
	var eintraege: Array = bauplan().get("ansehen", [])
	if eintraege.is_empty() and bauplan().get("nehmen"):
		# Kein eigenes Ansehen im Skript: die Nehmen-Zeile beschreibt das Ding.
		eintraege = [bauplan().nehmen]
	return await Spiel.ansehen(eintraege, ansehen_zaehler)


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
	var d := bauplan()
	if d.get("gegenstand") and d.get("nehmen"):
		await Spiel.nehmen(self, d)
		return
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


func _pixel_benutzt() -> void:
	await Spiel.ersatz("PIX")
