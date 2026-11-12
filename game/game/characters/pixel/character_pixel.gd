@tool
extends CQFigur
# Figur „Pixel“ (pixel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_pixel_state.gd')
var state: Data = load("res://game/characters/pixel/character_pixel.tres")


## Liegt Pixel (Bewegung „schlafen“), redet er im Liegen weiter statt kurz aufzustehen.
func _play_talk() -> void:
	if idle_animation == "schlafen":
		play_animation("schlafen")
	else:
		super()


## Vor P1 schläft Pixel: Benutzen (0220), nach zwei Versuchen kommentiert Opa (0230).
## Nach P1 startet Linksklick das Gespräch.
func _on_click() -> void:
	if Zustand.abschnitt != "prolog":
		await Spiel.ersatz()  # ab Welt 1: Rätsel mit Pixel regelt der Raum (figur_benutzt)
		return
	if Zustand.geloest("P1"):
		await super()
		return
	await Spiel.hingehen(self)
	var n: int = int(Zustand.wert("P0_PIXEL_WECKVERSUCHE", 0)) + 1
	Zustand.setze_wert("P0_PIXEL_WECKVERSUCHE", n)
	await Spiel.sagen("MAX", "P0_DACH_MAX_0220")
	if n == 2:
		await Spiel.sagen("OPA", "P0_DACH_OPA_0230")


func _on_item_used(item: PopochiuInventoryItem) -> void:
	if Zustand.abschnitt != "prolog":
		await super(item)
		return
	await Spiel.hingehen(self)
	match item.script_name:
		"Thunfischdose":
			if not Zustand.geloest("P1"):
				if not Zustand.ist("P0_DOSE_OFFEN"):
					await Spiel.sagen("MAX", "P0_DACH_MAX_0270")  # noch zu
				elif Zustand.ist("P0_PIXEL_GEWECKT"):
					await Spiel.sagen("PIX", "P0_DACH_PIX_1170")  # er will Porzellan
				elif is_instance_valid(R.current) and R.current.has_method("p1_wecken"):
					await R.current.call("p1_wecken")  # offene Dose unter Pixels Nase
				return
		"Teetasse":
			if not Zustand.geloest("P1"):
				if not Zustand.ist("P0_TASSE_GEFUELLT"):
					await Spiel.sagen("MAX", "P0_DACH_MAX_1180")  # nur kalter Tee
				elif is_instance_valid(R.current) and R.current.has_method("p1_loesen"):
					await R.current.call("p1_loesen")  # Thunfisch in Porzellan
				return
		"Drahtkleiderbuegel":
			await Spiel.sagen("MAX", "P0_DACH_MAX_1110")
			return
	await Spiel.ersatz()
