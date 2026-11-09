@tool
extends CQRaum
# Raum „Klassenzimmer“ (klassenzimmer). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_klassenzimmer_state.gd')

var state: Data = load("res://game/rooms/klassenzimmer/room_klassenzimmer.tres")

var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Erstes Betreten (skript/welt-1.md, Abschnitt 6): der Übungsbesen, dann Alwin.
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.szene([
		Spiel.z("NAR", "W1_HOGG_NAR_0010"),
		Spiel.z("PIX", "W1_HOGG_PIX_0020"),
		Spiel.z("ALW", "W1_HOGG_ALW_0030"),
		Spiel.z("MAX", "W1_HOGG_MAX_0040"),
		Spiel.z("ALW", "W1_HOGG_ALW_0050"),
	])
	await C.get_character("Alwin").call("stab_pruefen")
