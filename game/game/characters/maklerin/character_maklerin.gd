@tool
extends CQFigur
# Figur „Maklerin“ (maklerin). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_maklerin_state.gd')
var state: Data = load("res://game/characters/maklerin/character_maklerin.tres")


## Ohne Entwicklungsmoment (Zeldina 0280–0310) hat Max der Maklerin nichts zu sagen.
func _on_click() -> void:
	if not Zustand.ist("W1_MAKLERIN_FREI"):
		await Spiel.hingehen(self)
		await Spiel.sagen("MAK", "W1_LUFT_MAK_0030")
		return
	await super()
