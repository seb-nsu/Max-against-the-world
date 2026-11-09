@tool
extends CQRaum
# Raum „Schmiede“ (schmiede). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_schmiede_state.gd')

var state: Data = load("res://game/rooms/schmiede/room_schmiede.tres")


var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Erstes Betreten (skript/welt-1.md, Schmiede 0710–0740): der Schmied und seine Ziege.
func _erste_szene() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.szene([
		Spiel.z("SCH", "W1_SCHM_SCH_0710"),
		Spiel.z("MAX", "W1_SCHM_MAX_0720"),
		Spiel.z("SCH", "W1_SCHM_SCH_0730"),
		Spiel.z("ZIE", "W1_SCHM_ZIE_0740"),
	])


func _nach_uebergang() -> void:
	await _erste_szene()
