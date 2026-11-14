@tool
class_name CQAusgang
extends CQHotspot
## Basisklasse der Ausgänge: Linksklick geht hin und wechselt den Raum, Doppelklick wechselt
## sofort (05-spielsysteme.md, Steuerung). Ist das Ziel erst nach einem Rätsel erreichbar
## (Welt-Tabelle „erreichbar_ab“), sagt Max die Sperr-Zeile aus dem Layout oder eine
## Ersatzzeile; „versteckt“ blendet den Ausgang bis dahin aus. Sonderfälle: _darf_gehen().
## Pixel geht nicht durch Türen (WECH 0080): Raumwechsel nur mit Max, Pixel folgt.


func ziel() -> String:
	return bauplan().get("ziel", "")


## Ziel erreichbar: „start“ oder das Rätsel aus „erreichbar_ab“ ist gelöst.
func offen() -> bool:
	var ab: String = bauplan().get("erreichbar_ab", "start")
	return ab == "start" or Zustand.geloest(ab)


func sichtbar_anpassen() -> void:
	if bauplan().get("versteckt", false):
		visible = offen()
	_zeiger_richtung()


## Der grüne Ausgangspfeil zeigt in die Richtung des Ausgangs (Review P15: zeigte immer nach oben):
## am linken oder rechten Rand zur Seite, im unteren Viertel nach unten, sonst nach oben.
func _zeiger_richtung() -> void:
	if Engine.is_editor_hint() or not is_instance_valid(room):
		return
	var breite: float = room.bauplan().get("groesse", [640, 360])[0]
	var hoehe: float = room.bauplan().get("groesse", [640, 360])[1]
	var mitte := global_position
	if mitte.x < breite * 0.12:
		cursor = PopochiuCursor.Type.LEFT
	elif mitte.x > breite * 0.88:
		cursor = PopochiuCursor.Type.RIGHT
	elif mitte.y > hoehe * 0.75:
		cursor = PopochiuCursor.Type.DOWN
	else:
		cursor = PopochiuCursor.Type.UP


func _on_click() -> void:
	if not await _darf_gehen():
		return
	await Spiel.hingehen(self)
	await Spiel.raum_wechseln(ziel())


func _on_double_click() -> void:
	if not await _darf_gehen():
		return
	await Spiel.raum_wechseln(ziel())


## Ausgänge: auch Pixel „benutzt“ sie (und bekommt die Tür-Zeile), statt zu schnuppern.
func on_click() -> void:
	Hinweise.objekt_beruehrt(objekt_id())
	Telemetrie.aktion_beginnen(objekt_id(), "benutzen")
	await _on_click()
	Telemetrie.aktion_beenden()


## true, wenn die Figur hier hinaus darf. Darf sprechen (await), bevor sie false liefert.
func _darf_gehen() -> bool:
	if Spiel.ist_pixel():
		await Spiel.wechsel_regel("pixel_tuer")
		return false
	if await Spiel.regel("ausgang", self):
		return false  # die Regeln des Abschnitts sperren (und sagen, warum)
	if not offen():
		var zeile: String = bauplan().get("gesperrt", "")
		await Spiel.hingehen(self)
		if zeile.is_empty():
			await Spiel.ersatz()
		else:
			await Spiel.sagen(zeile.split("_")[2], zeile)
		return false
	return true
