@tool
extends CQProp
# Prop „ZappOMat“ (zapp_o_mat) im Raum Dachboden. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Erstes Ansehen nach P1 mit Pixel und Opa (0410–0440), danach nur noch 0410.
func _on_right_click() -> void:
	var zeile := await ansehen()
	if zeile == "P0_DACH_MAX_0410" and not Zustand.ist("P0_SCHNEE_GESEHEN"):
		Zustand.setze("P0_SCHNEE_GESEHEN")
		await Spiel.szene([
			Spiel.z("PIX", "P0_DACH_PIX_0420"),
			Spiel.z("MAX", "P0_DACH_MAX_0430"),
			Spiel.z("OPA", "P0_DACH_OPA_0440"),
		])


func _on_click() -> void:
	await Spiel.hingehen(self)
	await Spiel.ersatz()


func _on_item_used(item: PopochiuInventoryItem) -> void:
	await Spiel.hingehen(self)
	match item.script_name:
		"Drahtkleiderbuegel":
			if not Zustand.geloest("P1"):
				await Spiel.sagen("MAX", "P0_DACH_MAX_1150")
			elif not Zustand.geloest("P2"):
				var gerade: bool = item.call("zustand") == "gerade"
				await room.call("p2_loesen", gerade)
			else:
				await Spiel.ersatz()
		"Dosenoeffner":
			await Spiel.sagen("MAX", "P0_DACH_MAX_1130")
		_:
			await Spiel.ersatz()


## Pixel als Gegenstand (nur nach P1 möglich, Spiel.pixel_portraet_geklickt())
func _pixel_benutzt() -> void:
	await Spiel.sagen("PIX", "P0_DACH_PIX_1120")
