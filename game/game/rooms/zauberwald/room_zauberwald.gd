@tool
extends CQRaum
# Raum „Zauberwald“ (zauberwald). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_zauberwald_state.gd')

var state: Data = load("res://game/rooms/zauberwald/room_zauberwald.tres")


## Waldemars Nummer (WALD 0460–0590), wenn er nach Option 0290 im Wald wartet.
func _nach_uebergang() -> void:
	if Zustand.ist("W1_WALDEMAR_SINGT") and not Zustand.geloest("R7"):
		await r7_szene()


func _nach_laden() -> void:
	await _nach_uebergang()


func r7_szene() -> void:
	Spiel.figur_hier("Waldemar", true, Vector2(200, 150))
	await Spiel.szene([
		Spiel.z("WAL", "W1_WALD_WAL_0460"),
		Spiel.z("MAX", "W1_WALD_MAX_0470"),
		Spiel.z("WAL", "W1_WALD_WAL_0480"),
		Spiel.z("WAL", "W1_WALD_WAL_0490"),
		Spiel.z("WAL", "W1_WALD_WAL_0500"),
		Spiel.z("NAR", "W1_WALD_NAR_0510"),
		Spiel.z("MAX", "W1_WALD_MAX_0520"),
		Zustand.loese.bind("R7"),
		Spiel.z("MAX", "W1_WALD_MAX_0530"),
		Spiel.z("PIX", "W1_WALD_PIX_0540"),
		Spiel.z("WAL", "W1_WALD_WAL_0550"),
		Spiel.z("MAX", "W1_WALD_MAX_0560"),
		Spiel.z("MAX", "W1_WALD_MAX_0570"),
		Spiel.z("WAL", "W1_WALD_WAL_0580"),
		Spiel.z("PIX", "W1_WALD_PIX_0590"),
	])
	Zustand.loese("R7")
	Spiel.figur_hier("Waldemar", false)
