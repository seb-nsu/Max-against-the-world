@tool
extends CQFigur
# Figur „Pixel“ (pixel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_pixel_state.gd')
var state: Data = load("res://game/characters/pixel/character_pixel.tres")


## Vor P1 schläft Pixel: Benutzen (0220), nach zwei Versuchen kommentiert Opa (0230).
## Nach P1 startet Linksklick das Gespräch.
func _on_click() -> void:
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
	await Spiel.hingehen(self)
	match item.script_name:
		"Thunfischdose":
			if not Zustand.geloest("P1"):
				await Spiel.sagen("MAX", "P0_DACH_MAX_0270")
				return
		"Drahtkleiderbuegel":
			await Spiel.sagen("MAX", "P0_DACH_MAX_1110")
			return
	await Spiel.ersatz()
