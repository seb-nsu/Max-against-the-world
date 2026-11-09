@tool
extends CQAusgang
# Hotspot „Kammertuer“ (kammertuer) im Raum Turmkeller. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Führt nach: abstellkammer_1. Gehen und Raumwechsel macht CQAusgang.
# Gesperrt? _darf_gehen() überschreiben.


## Rätsel 11b: Max schließt die Tür, wenn alle drei Besen der Spur in die Kammer gefolgt sind
## (0240–0260), vorher 0270. Danach führt die Tür in Abstellkammer 1. Pixel: 0230.
func _on_click() -> void:
	if Spiel.ist_pixel():
		await Spiel.sagen("PIX", "W1_TURM_PIX_0230")
		return
	if Zustand.geloest("R11b"):
		await super()
		return
	await Spiel.hingehen(self)
	if room.call("spuren") < 3:
		await Spiel.sagen("MAX", "W1_TURM_MAX_0270")
		return
	var schritte := [Spiel.z("MAX", "W1_TURM_MAX_0240"), Zustand.loese.bind("R11b"),
		Spiel.z("PIX", "W1_TURM_PIX_0250")]
	if room.has_character("Zeldina"):
		schritte.append(Spiel.z("ZEL", "W1_TURM_ZEL_0260"))
	await Spiel.szene(schritte)
	Zustand.loese("R11b")
	room._zustand_anwenden()
