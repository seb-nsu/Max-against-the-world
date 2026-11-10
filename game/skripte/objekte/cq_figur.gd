@tool
class_name CQFigur
extends PopochiuCharacter
## Basisklasse der Figuren. Aus dem Bauplan:
## - Rechtsklick: Ansehen-Zeile (Pixel-Variante, wenn Pixel spielt)
## - Linksklick mit Max: das gleichnamige Gespräch; bei Tieren (Layout „_tiere“) versteht Max
##   nur Miau (WECH „max_tier“); sonst Ersatzzeile
## - Linksklick mit Pixel: Tiere reden mit ihm („Pixel redet mit …“ samt Übersetzung), Menschen
##   kommentieren den Kater („Pixel auf …“), sonst WECH „pixel_figur“
## - Pixel-Feld auf die Figur: wie Linksklick mit Pixel
## - Gegenstand auf die Figur: Kombinationszeile („Thunfischdose auf Grimmzahn“), sonst Ersatz
## Rätsellogik in den Skripten der Figuren: _on_click(), _on_item_used(), _pixel_auf(); betrifft
## ein Rätsel mehrere Figuren, im Raum: figur_benutzt(figur, item) -> bool (true = erledigt).



func bauplan() -> Dictionary:
	return Bauplan.figur(script_name)


func ansehen() -> String:
	Hinweise.objekt_beruehrt(bauplan().get("id", ""))
	return await Spiel.ansehen(bauplan().get("ansehen", []), "Figur/" + script_name)


func objekt_id() -> String:
	return bauplan().get("id", script_name.to_snake_case())


func on_click() -> void:
	Telemetrie.aktion_beginnen(objekt_id(), "benutzen")
	await _klick()
	Telemetrie.aktion_beenden()


func _klick() -> void:
	# Rätsel, die mehrere Figuren betreffen (Ziegen an der Brücke), regelt der Raum.
	if C.player != self and is_instance_valid(R.current) and R.current.has_method("figur_benutzt") \
			and await R.current.call("figur_benutzt", self, null):
		return
	if C.player != self and await Spiel.regel("pixel" if Spiel.ist_pixel() else "benutzen", self):
		return
	if Spiel.ist_pixel() and C.player != self:
		await _pixel_auf()
		return
	await super.on_click()


func on_right_click() -> void:
	Telemetrie.aktion_beginnen(objekt_id(), "ansehen")
	await super()
	Telemetrie.aktion_beenden()


func on_item_used(item: PopochiuInventoryItem) -> void:
	Telemetrie.aktion_beginnen(objekt_id(), "gegenstand", Telemetrie.gegenstand_id(item))
	await _gegenstand_benutzt(item)
	Telemetrie.aktion_beenden()


func _gegenstand_benutzt(item: PopochiuInventoryItem) -> void:
	if is_instance_valid(R.current) and R.current.has_method("figur_benutzt") \
			and await R.current.call("figur_benutzt", self, item):
		I.active = null
		return
	if item.script_name == Spiel.PIXEL_FELD:
		I.active = null
		if await Spiel.regel("pixel", self):
			return
		await _pixel_auf()
		return
	if await Spiel.regel("gegenstand", self, item):
		I.active = null
		return
	await super.on_item_used(item)


func _on_click() -> void:
	if C.player == self:
		return
	if bauplan().get("tier", false):
		await Spiel.wechsel_regel("max_tier")
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
	if await Spiel.regel("ansehen", self):
		return
	await ansehen()


func _on_middle_click() -> void:
	pass


func _on_item_used(item: PopochiuInventoryItem) -> void:
	var e := Spiel.gegenstand_zeile(bauplan().get("gegenstand_auf", []),
		Bauplan.gegenstand(item.script_name).get("id", ""))
	if e.is_empty():
		await Spiel.ersatz()
	else:
		await Spiel.sagen_eintrag(e)


## Gespräch mit dieser Figur (Dialog mit gleichem Namen).
func reden() -> void:
	await Spiel.hingehen(self)
	var d: PopochiuDialog = D.get_instance(script_name)
	if not is_instance_valid(d):
		return
	if d is CQDialog and d.plauder_erschoepft() \
			and Zustand.ansehen_zaehlen("Plauder/" + script_name) == 1:
		# Alle Plauderoptionen weg: Max sagt einmalig eine Zeile aus SYS_PLA_MAX_*.
		var pla := Spiel.pool_zeile(Bauplan.plauder.get("MAX", []), "PLA_MAX")
		if not pla.is_empty():
			await Spiel.sagen("MAX", pla)
	if d is CQDialog and d.erschoepft():
		var zeile: String = d.abschied()
		if not zeile.is_empty():
			# Gespräch erschöpft: kein Menü, sondern die Abschiedszeilen im Wechsel
			await Spiel.sagen(zeile.split("_")[2], zeile)
			return
	await d.start()


## Pixel mit dieser Figur: reden (Tiere), kommentieren lassen (Menschen) oder WECH-Zeile.
func _pixel_auf() -> void:
	await Spiel.hingehen(self)
	for art in ["pixel_redet", "pixel_auf"]:
		for e in bauplan().get(art, []):
			if Spiel.eintrag_passt(e):
				await Spiel.sagen_eintrag(e)
				return
	if Zustand.abschnitt == "prolog":
		await Spiel.ersatz("PIX")
	else:
		await Spiel.wechsel_regel("pixel_figur")
