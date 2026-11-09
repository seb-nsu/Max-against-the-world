@tool
extends CQRaum
# Raum „Wasserschloss“ (wasserschloss). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_wasserschloss_state.gd')

var state: Data = load("res://game/rooms/wasserschloss/room_wasserschloss.tres")

var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Gag-Szene beim ersten Betreten (skript/welt-1.md, Abschnitt 8).
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.szene([
		Spiel.z("MAX", "W1_WASS_MAX_0010"),
		Spiel.z("TOA", "W1_WASS_TOA_0020"),
		Spiel.z("MAX", "W1_WASS_MAX_0030"),
		Spiel.z("TOA", "W1_WASS_TOA_0040"),
		Spiel.z("PIX", "W1_WASS_PIX_0050"),
	])
