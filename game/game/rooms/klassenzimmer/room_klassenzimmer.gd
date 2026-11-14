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


## Die sechs Flaschen sind eigene Sprites (Vordergrund „flasche_1“ bis „flasche_6“): Die Flasche,
## die Max gerade trägt, fehlt im Regal; Flasche 3 ist nach dem Trank (R6b) aufgebraucht.
func _process(delta: float) -> void:
	super(delta)
	if Engine.is_editor_hint() or not has_node("Props"):
		return
	var getragen := int(Zustand.wert("W1_FLASCHE", 0))
	if getragen > 0 and not I.is_item_in_inventory("Flasche"):
		getragen = 0
	for n in range(1, 7):
		var k := get_node_or_null("Props/Vordergrund_flasche_%d" % n)
		if k:
			k.visible = n != getragen and not (n == 3 and Zustand.geloest("R6b"))


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
