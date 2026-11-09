@tool
extends CQRaum
# Raum „Thronsaal“ (thronsaal). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_thronsaal_state.gd')

var state: Data = load("res://game/rooms/thronsaal/room_thronsaal.tres")


var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Ankunft (THRO 0010–0060), das Duell beginnt.
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	var schritte := [
		Spiel.z("MOD", "W1_THRO_MOD_0010"),
		Spiel.z("MAX", "W1_THRO_MAX_0020"),
		Spiel.z("MOD", "W1_THRO_MOD_0030"),
	]
	if has_character("Zeldina"):
		schritte.append(Spiel.z("ZEL", "W1_THRO_ZEL_0040"))
	schritte.append_array([Spiel.z("MOD", "W1_THRO_MOD_0050"), Spiel.z("MAX", "W1_THRO_MAX_0060")])
	await Spiel.szene(schritte)


## Rätsel 13: Socke voller Pollen (0240–0270), dann der Kochlöffel als Ersatzstab (0280–0340).
func figur_benutzt(figur: PopochiuCharacter, item: PopochiuInventoryItem) -> bool:
	if figur.script_name != "Moderwort" or item == null or Zustand.geloest("R13"):
		return false
	match item.script_name:
		"Socke" when Zustand.geloest("R7") and not Zustand.ist("W1_MOD_GENIEST"):
			await Spiel.hingehen(figur)
			await Spiel.szene([
				Spiel.z("MAX", "W1_THRO_MAX_0240"),
				Spiel.z("MOD", "W1_THRO_MOD_0250"),
				Zustand.setze.bind("W1_MOD_GENIEST", true),
				Spiel.z("ZEL", "W1_THRO_ZEL_0260"),
				Spiel.z("MOD", "W1_THRO_MOD_0270"),
			])
			Zustand.setze("W1_MOD_GENIEST")
			return true
		"Kochloeffel" when not Zustand.ist("W1_MOD_GENIEST"):
			# Bauplan hat 0210 (vor dem Niesen) und 0280 ohne Bedingung: hier entscheiden
			await Spiel.hingehen(figur)
			await Spiel.sagen("MOD", "W1_THRO_MOD_0210")
			return true
		"Kochloeffel" when not Zustand.ist("W1_MOD_KAESE"):
			await Spiel.hingehen(figur)
			await Spiel.szene([
				Spiel.z("MAX", "W1_THRO_MAX_0280"),
				Spiel.abgeben.bind("Kochloeffel"),
				Spiel.z("MOD", "W1_THRO_MOD_0290"),
				Spiel.z("MOD", "W1_THRO_MOD_0300"),
				Spiel.z("MAX", "W1_THRO_MAX_0310"),
				Spiel.z("MOD", "W1_THRO_MOD_0320"),
				Spiel.z("PIX", "W1_THRO_PIX_0330"),
				Spiel.z("MOD", "W1_THRO_MOD_0340"),
			])
			await Spiel.abgeben("Kochloeffel")
			Zustand.setze("W1_MOD_KAESE")
			return true
	return false


## Reden mit Moderwort: nach dem Käse die Option 0350 (Spitzname), dann der Abschluss.
func moderwort_reden() -> void:
	if Zustand.geloest("R13"):
		await Spiel.sagen("MOD", "W1_THRO_MOD_0630")
		return
	if not Zustand.ist("W1_MOD_KAESE"):
		await Spiel.ersatz()
		return
	await Spiel.szene([
		Spiel.z("MAX", "W1_THRO_MAX_0350"),
		Spiel.z("MOD", "W1_THRO_MOD_0360"),
		Spiel.z("MAX", "W1_THRO_MAX_0370"),
		Spiel.z("MOD", "W1_THRO_MOD_0380"),
		Spiel.z("ZEL", "W1_THRO_ZEL_0390"),
		Spiel.z("MOD", "W1_THRO_MOD_0400"),
		Spiel.z("MOD", "W1_THRO_MOD_0410"),
		_r13_setzen,
		Spiel.z("MAX", "W1_THRO_MAX_0420"),
	])
	await _r13_setzen()
	await abschluss()


func _r13_setzen() -> void:
	if Zustand.geloest("R13"):
		return
	await Spiel.geben("Kochloeffel")
	Zustand.loese("R13")


## Abschluss der Welt (0510–0610) und Übergang ins Zwischenspiel 1.
func abschluss() -> void:
	var ohne_pfote := int(Zustand.stufe3_zaehler.get("welt-1", 0)) == 0
	await Spiel.szene([
		Spiel.z("ZEL", "W1_THRO_ZEL_0510"),
		Spiel.z("MOD", "W1_THRO_MOD_0520"),
		Spiel.z("ZEL", "W1_THRO_ZEL_0530"),
		Spiel.z("TOA", "W1_THRO_TOA_0540"),
		Spiel.z("ZEL", "W1_THRO_ZEL_0550"),
		Spiel.z("PIX", "W1_THRO_PIX_0560" if ohne_pfote else "W1_THRO_PIX_0570"),
		Spiel.z("MAX", "W1_THRO_MAX_0580"),
		Spiel.z("PIX", "W1_THRO_PIX_0590"),
		Spiel.z("MAX", "W1_THRO_MAX_0600"),
		Spiel.z("PIX", "W1_THRO_PIX_0610"),
	])
	Spielstand.autospeichern()
	await Spiel.zwischenspiel_beginnen(1)


## Geladener Stand nach Rätsel 13 (Autospeicher „Ende Welt“): weiter ins Zwischenspiel.
func _nach_laden() -> void:
	if Zustand.geloest("R13"):
		await Spiel.zwischenspiel_beginnen(1)
