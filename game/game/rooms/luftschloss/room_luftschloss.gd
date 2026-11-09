@tool
extends CQRaum
# Raum „Luftschloss“ (luftschloss). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_luftschloss_state.gd')

var state: Data = load("res://game/rooms/luftschloss/room_luftschloss.tres")


var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Die Maklerin ist bis Rätsel 9 da (danach unterwegs zum Turm).
func _zustand_anwenden() -> void:
	super()
	if Zustand.geloest("R9") and has_character("Maklerin"):
		Spiel.figur_hier("Maklerin", false)


## Ankunft über die Ranke (LUFT 0010–0030)
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.szene([
		Spiel.z("MAX", "W1_LUFT_MAX_0010"),
		Spiel.z("PIX", "W1_LUFT_PIX_0020"),
		Spiel.z("MAK", "W1_LUFT_MAK_0030"),
	])
