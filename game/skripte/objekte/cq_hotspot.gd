@tool
class_name CQHotspot
extends PopochiuHotspot
## Basisklasse aller Hotspots (vom Godot-Bau gesetzt).
##
## Standard aus dem Bauplan: Rechtsklick sagt die Ansehen-Zeile (Bedingungen „vor/nach Px“,
## „zweites Mal“, Pixel-Varianten), Linksklick die Benutzen-Zeile, ein Gegenstand darauf seine
## Kombinationszeile („Eimer auf Fondue-Topf“); sonst Ersatzzeile. Spielt Pixel, schnuppert er
## (seine Ansehen-Zeile), statt zu benutzen. Rätsellogik gehört in das Skript des Hotspots:
## _on_click() und _on_item_used(item) überschreiben, Ansehen-Sonderfälle in _on_right_click()
## (dann ansehen() aufrufen), Pixel als Gegenstand in _pixel_benutzt().



func bauplan() -> Dictionary:
	if not is_instance_valid(room):
		return {}
	return Bauplan.objekt(room.script_name, script_name)


## Liegt das Objekt über oder unter einem deutlich größeren, gewinnt das kleinere
## (Spiel.zeiger_betritt); sonst gilt Popochius Reihenfolge.
func _on_mouse_entered() -> void:
	if not Spiel.zeiger_betritt(self):
		super()


func objekt_id() -> String:
	return bauplan().get("id", script_name.to_snake_case())


## Die Ansehen-Zeile sagen; liefert die gesagte Zeilen-ID ("" bei Ersatzzeile).
func ansehen() -> String:
	Hinweise.objekt_beruehrt(objekt_id())
	var eintraege: Array = bauplan().get("ansehen", [])
	if room is CQRaum:
		eintraege = eintraege + room.ansehen_zusatz(objekt_id())
	return await Spiel.ansehen(eintraege, "%s/%s" % [room.script_name if is_instance_valid(room) else "", script_name])


func on_click() -> void:
	Hinweise.objekt_beruehrt(objekt_id())
	Telemetrie.aktion_beginnen(objekt_id(), "benutzen")
	if Spiel.ist_pixel():
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
	await Spiel.hingehen(self)
	if await Spiel.regel("benutzen", self):
		return
	await benutzen_standard()


## Benutzen-Zeile aus dem Bauplan, sonst Ersatzzeile.
func benutzen_standard() -> void:
	var schluessel := "%s/%s" % [room.script_name if is_instance_valid(room) else "", script_name]
	if await Spiel.benutzen(bauplan().get("benutzen", []), schluessel):
		return
	await Spiel.ersatz()


func _on_double_click() -> void:
	await _on_click()


func _on_right_click() -> void:
	if await Spiel.regel("ansehen", self):
		return
	await ansehen()


func _on_middle_click() -> void:
	pass


func _on_item_used(item: PopochiuInventoryItem) -> void:
	await Spiel.hingehen(self)
	if await Spiel.regel("gegenstand", self, item):
		return
	await gegenstand_standard(item)


## Kombinationszeile aus dem Bauplan („Eimer auf Fondue-Topf“), sonst Ersatzzeile.
func gegenstand_standard(item: PopochiuInventoryItem) -> void:
	var e := Spiel.gegenstand_zeile(bauplan().get("gegenstand_auf", []),
		Bauplan.gegenstand(item.script_name).get("id", ""))
	if e.is_empty():
		await Spiel.ersatz()
	else:
		await Spiel.sagen_eintrag(e)


## Pixel auf dieses Objekt (Pixel-Feld oder Pixel als aktive Figur): Pixels eigene Ansehen-
## bzw. Schnupper-Zeile, sonst seine Ersatzzeile.
func _pixel_benutzt() -> void:
	if await Spiel.regel("pixel", self):
		return
	for e in bauplan().get("ansehen", []):
		if e.get("figur") == "PIX" and Spiel.eintrag_passt(e):
			await Spiel.sagen_eintrag(e)
			return
	await Spiel.ersatz("PIX")
