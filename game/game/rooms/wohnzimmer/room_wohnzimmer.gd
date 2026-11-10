@tool
extends CQRaum
# Raum „Wohnzimmer“ (wohnzimmer). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_wohnzimmer_state.gd')

var state: Data = load("res://game/rooms/wohnzimmer/room_wohnzimmer.tres")

var _intro := false


func _raum_betreten(erster_besuch: bool) -> void:
	# Spielbeginn: Szene „Kein WLAN“ (skript/prolog.md, Abschnitt 1)
	# (nicht, wenn das Hauptmenü gleich einen Spielstand lädt)
	_intro = erster_besuch and not Zustand.war_in("dachboden") and Spiel.start_platz < 0


func _nach_uebergang() -> void:
	if not _intro:
		return
	_intro = false
	await Spiel.szene([
		Spiel.z("MAX", "P0_WOHN_MAX_0010"),
		Spiel.z("MAX", "P0_WOHN_MAX_0020"),
		Spiel.z("OPA", "P0_WOHN_OPA_0030"),
		Spiel.z("MAX", "P0_WOHN_MAX_0040"),
		Spiel.z("OPA", "P0_WOHN_OPA_0050"),
		Spiel.z("MAX", "P0_WOHN_MAX_0060"),
		Spiel.z("MAX", "P0_WOHN_MAX_0070"),
	])
	# Autospeicher „Anfang Welt“ (05-spielsysteme.md, Speichern)
	Spielstand.autospeichern()
