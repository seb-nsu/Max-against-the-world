@tool
extends CQFigur
# Figur „Huhn“ (huhn). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_huhn_state.gd')
var state: Data = load("res://game/characters/huhn/character_huhn.tres")


## Pixel übersetzt Berta (TAV 1460, 1470): danach weiß Max, dass sie vor schlechter Musik flieht.
func _pixel_auf() -> void:
	await super()
	if Zustand.abschnitt == "welt-1":
		Zustand.setze("W1_BERTA_MUSIK")


## Max auf das Huhn, solange es auf dem Ei sitzt: dasselbe wie ein Klick auf das Ei (Hacken und
## Pixels Tipp), statt der allgemeinen Tierzeile (Review Fund 16).
func _on_click() -> void:
	if Zustand.abschnitt == "welt-1" and not Spiel.ist_pixel() and not Zustand.ist("W1_BERTA_WEG") and is_instance_valid(R.current) and R.current.has_node("Props/Ei"):
		var ei = R.current.get_node("Props/Ei")
		if ei.visible:
			await ei._on_click()
			return
	await super()
