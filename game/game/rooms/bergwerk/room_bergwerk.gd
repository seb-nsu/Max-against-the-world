@tool
extends CQRaum
# Raum „Bergwerk“ (bergwerk). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_bergwerk_state.gd')

var state: Data = load("res://game/rooms/bergwerk/room_bergwerk.tres")

var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Erstes Betreten (skript/welt-1.md, Abschnitt 11): Streik. Rätsel 10 folgt nach dem Slice.
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.sagen("GRI", "W1_BERG_GRI_0010")
