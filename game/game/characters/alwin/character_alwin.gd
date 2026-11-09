@tool
extends CQFigur
# Figur „Alwin“ (alwin). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_alwin_state.gd')
var state: Data = load("res://game/characters/alwin/character_alwin.tres")


## Vor dem Kochlöffel-Zauberstab prüft Alwin nur den Stab (0060), danach das Gespräch.
func _on_click() -> void:
	if not Zustand.geloest("R2"):
		await Spiel.hingehen(self)
		await stab_pruefen()
		return
	await super()


func stab_pruefen() -> void:
	if Zustand.geloest("R2"):
		await Spiel.sagen("ALW", "W1_HOGG_ALW_0070")
	else:
		await Spiel.sagen("ALW", "W1_HOGG_ALW_0060")
