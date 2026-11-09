@tool
extends CQHotspot
# Hotspot „Erdfleck“ (erdfleck) im Raum Dorfplatz. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsel 8: Zauberbohne pflanzen (1110), mit Wasser gießen (1140–1200), leerer Eimer (1210).


func _on_click() -> void:
	if Zustand.ist("W1_BOHNE_GEPFLANZT") and not Zustand.geloest("R8"):
		await Spiel.hingehen(self)
		await Spiel.sagen("PIX", "W1_DORF_PIX_1120")
		return
	await super()


func _on_item_used(item: PopochiuInventoryItem) -> void:
	match item.script_name:
		"Zauberbohne":
			await Spiel.hingehen(self)
			await Spiel.sagen("MAX", "W1_DORF_MAX_1110")
			await Spiel.abgeben("Zauberbohne")
			Zustand.setze("W1_BOHNE_GEPFLANZT")
		"Eimer" when Zustand.ist("W1_BOHNE_GEPFLANZT"):
			await Spiel.hingehen(self)
			if Zustand.wert("W1_EIMER", "leer") != "mit_wasser":
				await Spiel.sagen("MAX", "W1_DORF_MAX_1210")
				return
			if Zustand.geloest("R8"):
				await Spiel.ersatz()
				return
			await Spiel.szene([
				Spiel.z("MAX", "W1_DORF_MAX_1140"),
				_r8_setzen,
				Spiel.z("NAR", "W1_DORF_NAR_1150"),
				Spiel.z("MAX", "W1_DORF_MAX_1160"),
				Spiel.z("PIX", "W1_DORF_PIX_1170"),
				Spiel.z("TOA", "W1_DORF_TOA_1180"),
				Spiel.z("MAX", "W1_DORF_MAX_1190"),
				Spiel.z("TOA", "W1_DORF_TOA_1200"),
			])
			_r8_setzen()
		_:
			await super(item)


func _r8_setzen() -> void:
	Zustand.setze_wert("W1_EIMER", "leer")
	Zustand.loese("R8")
	room._zustand_anwenden()  # Ausgang Bohnenranke erscheint
