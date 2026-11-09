@tool
extends CQRaum
# Raum „Zauberstabladen“ (zauberstabladen). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_zauberstabladen_state.gd')

var state: Data = load("res://game/rooms/zauberstabladen/room_zauberstabladen.tres")


var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Erstes Betreten (skript/welt-1.md, Zauberstab-Laden 0710–0740): der Stabmacher begrüßt Max.
func _erste_szene() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.szene([
		Spiel.z("STA", "W1_STAB_STA_0710"),
		Spiel.z("MAX", "W1_STAB_MAX_0720"),
		Spiel.z("STA", "W1_STAB_STA_0730"),
		Spiel.z("PIX", "W1_STAB_PIX_0740"),
	])


func _nach_uebergang() -> void:
	await _erste_szene()
