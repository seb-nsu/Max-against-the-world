@tool
extends CQAusgang
# Hotspot „Geheimtuer“ (geheimtuer) im Raum Abstellkammern. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Führt nach: thronsaal. Gehen und Raumwechsel macht CQAusgang.
# Gesperrt? _darf_gehen() überschreiben.


## Vor Rätsel 11a fragt die Tür nach dem Passwort, danach „Erst das Ei.“ (0820) bis Rätsel 12.
func _on_click() -> void:
	if Spiel.ist_pixel():
		await super()
		return
	if not Zustand.geloest("R11a"):
		await Spiel.hingehen(self)
		await room.call("geheimtuer")
		return
	if not Zustand.geloest("R12"):
		await Spiel.hingehen(self)
		await Spiel.sagen("MAX", "W1_SMAU_MAX_0820")
		return
	# Ohne Pollen (R7) wäre das Duell mit Moderwort nicht zu gewinnen: Zeldina hält Max hier
	# zurück, statt ihn erst im Thronsaal merken zu lassen, dass er fünf Räume zurück muss
	# (Review Fund 15).
	if not Zustand.geloest("R7"):
		await Spiel.hingehen(self)
		await Spiel.sagen("ZEL", "W1_SMAU_ZEL_0825")
		await Spiel.sagen("PIX", "W1_SMAU_PIX_0826")
		return
	await super()
