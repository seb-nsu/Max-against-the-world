@tool
class_name CQAusgang
extends CQHotspot
## Basisklasse der Ausgänge: Linksklick geht hin und wechselt den Raum, Doppelklick wechselt
## sofort (05-spielsysteme.md, Steuerung). Gesperrt? _darf_gehen() überschreiben.


func ziel() -> String:
	return bauplan().get("ziel", "")


func _on_click() -> void:
	if not await _darf_gehen():
		return
	await Spiel.hingehen(self)
	await Spiel.raum_wechseln(ziel())


func _on_double_click() -> void:
	if not await _darf_gehen():
		return
	await Spiel.raum_wechseln(ziel())


## true, wenn die Figur hier hinaus darf. Darf sprechen (await), bevor sie false liefert.
func _darf_gehen() -> bool:
	return true
