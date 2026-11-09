@tool
extends CQFigur
# Figur „Alwin“ (alwin). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_alwin_state.gd')
var state: Data = load("res://game/characters/alwin/character_alwin.tres")


## Die Aufnahmeprüfung (Rätsel 6) gehört nicht zum Vertical Slice: Alwin prüft nur den Stab.
func _on_click() -> void:
	await Spiel.hingehen(self)
	await stab_pruefen()


## Ohne Kochlöffel-Zauberstab 0060, mit ihm 0070 und die Meldung „Ende des Vertical Slice“.
func stab_pruefen() -> void:
	if Zustand.geloest("R2"):
		await Spiel.sagen("ALW", "W1_HOGG_ALW_0070")
		Spiel.ausbau_ende("UI_WELT_1_ENDE")
	else:
		await Spiel.sagen("ALW", "W1_HOGG_ALW_0060")
