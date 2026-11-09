@tool
class_name CQFigur
extends PopochiuCharacter
## Basisklasse der Figuren: Rechtsklick sagt die Ansehen-Zeile aus dem Bauplan, Linksklick
## startet das gleichnamige Gespräch (falls es eins gibt), sonst Ersatzzeile.

var ansehen_zaehler := 0


func bauplan() -> Dictionary:
	return Bauplan.figur(script_name)


func ansehen() -> String:
	ansehen_zaehler += 1
	Hinweise.objekt_beruehrt(bauplan().get("id", ""))
	return await Spiel.ansehen(bauplan().get("ansehen", []), ansehen_zaehler)


func on_click() -> void:
	if Spiel.pixel_als_gegenstand:
		Spiel.pixel_als_gegenstand = false
		await _pixel_benutzt()
		return
	await super()


func _on_click() -> void:
	if C.player == self:
		return
	if not Bauplan.dialog(script_name).is_empty():
		await reden()
		return
	await Spiel.ersatz()


func _on_double_click() -> void:
	await _on_click()


func _on_right_click() -> void:
	if C.player == self:
		return
	await ansehen()


func _on_middle_click() -> void:
	pass


func _on_item_used(_item: PopochiuInventoryItem) -> void:
	await Spiel.ersatz()


## Gespräch mit dieser Figur (Dialog mit gleichem Namen).
func reden() -> void:
	await Spiel.hingehen(self)
	var d: PopochiuDialog = D.get_instance(script_name)
	if is_instance_valid(d):
		await d.start()


func _pixel_benutzt() -> void:
	await Spiel.ersatz("PIX")
