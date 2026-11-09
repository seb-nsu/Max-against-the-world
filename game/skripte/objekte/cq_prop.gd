@tool
class_name CQProp
extends PopochiuProp
## Basisklasse der Props aus dem Bauplan. Steht das Prop für einen Gegenstand mit
## Nehmen-Zeile (Bauplan: „gegenstand“, „nehmen“), nimmt Linksklick ihn auf; ohne Gegenstand
## bleibt es bei der Nehmen-Zeile. Sichtbarkeit und Bild leitet der Raum aus dem Zustand ab
## (CQRaum._zustand_anwenden()). Ansehen, Benutzen, Gegenstände und Pixel wie bei CQHotspot.



func bauplan() -> Dictionary:
	if not is_instance_valid(room):
		return {}
	return Bauplan.objekt(room.script_name, script_name)


func objekt_id() -> String:
	return bauplan().get("id", script_name.to_snake_case())


func ansehen() -> String:
	Hinweise.objekt_beruehrt(objekt_id())
	var eintraege: Array = bauplan().get("ansehen", [])
	if eintraege.is_empty() and bauplan().get("nehmen"):
		# Kein eigenes Ansehen im Skript: die Nehmen-Zeile beschreibt das Ding.
		eintraege = [bauplan().nehmen]
	if room is CQRaum:
		eintraege = eintraege + room.ansehen_zusatz(objekt_id())
	return await Spiel.ansehen(eintraege, "%s/%s" % [room.script_name if is_instance_valid(room) else "", script_name])


func on_click() -> void:
	Hinweise.objekt_beruehrt(objekt_id())
	Telemetrie.aktion_beginnen(objekt_id(), "benutzen")
	if Spiel.ist_pixel() and not bauplan().get("nehmen"):
		await _pixel_benutzt()
	else:
		await super()
	Telemetrie.aktion_beenden()


func on_right_click() -> void:
	Telemetrie.aktion_beginnen(objekt_id(), "ansehen")
	await super()
	Telemetrie.aktion_beenden()


func on_item_used(item: PopochiuInventoryItem) -> void:
	Hinweise.objekt_beruehrt(objekt_id())
	Telemetrie.aktion_beginnen(objekt_id(), "gegenstand", Telemetrie.gegenstand_id(item))
	if item.script_name == Spiel.PIXEL_FELD:
		I.active = null
		await _pixel_benutzt()
	else:
		Hinweise.objekt_beruehrt(Bauplan.gegenstand(item.script_name).get("id", ""))
		await super(item)
	Telemetrie.aktion_beenden()


func _on_click() -> void:
	var d := bauplan()
	if d.get("nehmen"):
		await Spiel.nehmen(self, d)
		return
	await Spiel.hingehen(self)
	for e in d.get("benutzen", []):
		if Spiel.eintrag_passt(e):
			await Spiel.sagen_eintrag(e)
			return
	await Spiel.ersatz()


func _on_double_click() -> void:
	await _on_click()


func _on_right_click() -> void:
	await ansehen()


func _on_middle_click() -> void:
	pass


func _on_item_used(item: PopochiuInventoryItem) -> void:
	await Spiel.hingehen(self)
	var e := Spiel.gegenstand_zeile(bauplan().get("gegenstand_auf", []),
		Bauplan.gegenstand(item.script_name).get("id", ""))
	if e.is_empty():
		await Spiel.ersatz()
	else:
		await Spiel.sagen_eintrag(e)


func _pixel_benutzt() -> void:
	for e in bauplan().get("ansehen", []):
		if e.get("figur") == "PIX" and Spiel.eintrag_passt(e):
			await Spiel.sagen_eintrag(e)
			return
	await Spiel.ersatz("PIX")
