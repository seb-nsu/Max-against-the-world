@tool
extends CQHotspot
## Gemeinsames Verhalten der sechs Flaschen im Regal (Rätsel 6b). Die Skripte flasche_1 bis
## flasche_6 erben davon; die Nummer steht im Namen des Hotspots.
## - Max nimmt eine Flasche (W1_FLASCHE = Nummer, 0930), immer nur eine (sonst 0940); falsche
##   kommen zurück.
## - Pixel schnuppert höchstens zwei Flaschen (0640–0690), beim dritten Versuch 0700
##   (Wert W1_SCHNUPPER: Anzahl).


func nummer() -> int:
	return int(script_name.right(1))


func _on_click() -> void:
	await Spiel.hingehen(self)
	if Zustand.geloest("R6b"):
		await Spiel.ersatz()
		return
	if I.is_item_in_inventory("Flasche", C.Max):
		await Spiel.sagen("MAX", "W1_HOGG_MAX_0940")  # nur eine pro Versuch (G22)
		return
	Zustand.setze_wert("W1_FLASCHE", nummer())
	await Spiel.geben("Flasche")
	await Spiel.sagen("MAX", "W1_HOGG_MAX_0930")


func ansehen() -> String:
	if Spiel.ist_pixel():
		await _pixel_benutzt()
		return ""
	return await super()


func _pixel_benutzt() -> void:
	var n := int(Zustand.wert("W1_SCHNUPPER", 0))
	if n >= 2:
		await Spiel.sagen("PIX", "W1_HOGG_PIX_0700")
		return
	Zustand.setze_wert("W1_SCHNUPPER", n + 1)
	await super()
