@tool
extends CQRaum
# Raum „Abstellkammer1“ (abstellkammer_1). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_abstellkammer_1_state.gd')

var state: Data = load("res://game/rooms/abstellkammer_1/room_abstellkammer_1.tres")


var _erster_besuch := false

## Zeilen unter dem Code TURM (Welt-Tabelle: Abstellkammer 1 hat keinen eigenen Code); der
## Generator ordnet „Ansehen: Besen in Abstellkammer 1“ noch nicht zu, daher hier.
const ANSEHEN := {
	besen = [["MAX", "W1_TURM_MAX_0310", 1, ""], ["MAX", "W1_TURM_MAX_0315", 2, ""],
		["PIX", "W1_TURM_PIX_0320", 1, "PIX"], ["PIX", "W1_TURM_PIX_0325", 2, "PIX"]],
	kram = [["MAX", "W1_TURM_MAX_0330", 1, ""], ["MAX", "W1_TURM_MAX_0335", 2, ""]],
}


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.sagen("MAX", "W1_TURM_MAX_0300")


func ansehen_zusatz(objekt: String) -> Array:
	var out := []
	for z in ANSEHEN.get(objekt, []):
		var e := {sprecher = z[0], zeile = z[1], mal = z[2]}
		if not z[3].is_empty():
			e.figur = z[3]
		out.append(e)
	return out
