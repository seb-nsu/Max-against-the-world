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


#region Rätsel 10 ##################################################################################
## Weg A, erster Teil: Licht für die Fackeln, Grimmzahn gibt den leeren Tarifvertrag.
func licht_bringen() -> void:
	await Spiel.szene([
		Spiel.z("MAX", "W1_BERG_MAX_0510"),
		Spiel.z("GRI", "W1_BERG_GRI_0520"),
		Spiel.z("GO1", "W1_BERG_GO1_0530"),
		Spiel.z("GO2", "W1_BERG_GO2_0540"),
		Spiel.z("GRI", "W1_BERG_GRI_0550"),
	])
	if not Zustand.ist("W1_GOBLIN_LICHT"):
		await Spiel.abgeben("Leuchttrank")
		await Spiel.geben("Tarifvertrag")
		Zustand.setze("W1_GOBLIN_LICHT")


## Weg A, zweiter Teil: Ketchup als Blut (0570–0590), dann das Arbeitslied.
func vertrag_unterschreiben() -> void:
	if not Zustand.ist("W1_GOBLIN_LICHT") or Zustand.geloest("R10"):
		await Spiel.ersatz()
		return
	await Spiel.szene([
		Spiel.z("MAX", "W1_BERG_MAX_0570"),
		Spiel.z("GRI", "W1_BERG_GRI_0580"),
		Spiel.z("PIX", "W1_BERG_PIX_0590"),
	])
	await Spiel.abgeben("Ketchup")
	Zustand.loese("R10a")
	await lied()


## Das Arbeitslied (0610–0700) nach Weg A oder B: Passwort-Teil „Knuddel-Puddi“, Rune-Tür offen.
func lied() -> void:
	var schritte := [
		Spiel.z("GRI", "W1_BERG_GRI_0610"),
		Spiel.z("GO1", "W1_BERG_GO1_0620"),
		Spiel.z("GO1", "W1_BERG_GO1_0630"),
		Spiel.z("MAX", "W1_BERG_MAX_0640"),
		Spiel.z("GRI", "W1_BERG_GRI_0650"),
	]
	if "zeugnis" in Zustand.nahansichten:
		schritte.append(Spiel.z("PIX", "W1_BERG_PIX_0660"))
	schritte.append_array([
		Spiel.z("MAX", "W1_BERG_MAX_0670"),
		Spiel.z("GRI", "W1_BERG_GRI_0680"),
		Spiel.z("MAX", "W1_BERG_MAX_0690"),
	])
	if has_character("Zeldina"):
		schritte.append(Spiel.z("ZEL", "W1_BERG_ZEL_0700"))
	await Spiel.szene(schritte)
	_zustand_anwenden()


#endregion
