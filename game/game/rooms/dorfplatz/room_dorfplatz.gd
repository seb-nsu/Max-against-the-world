@tool
extends CQRaum
# Raum „Dorfplatz“ (dorfplatz). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_dorfplatz_state.gd')

var state: Data = load("res://game/rooms/dorfplatz/room_dorfplatz.tres")

var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Ankunft in Welt 1 (skript/welt-1.md, Abschnitt 1): Max liest Opas Zettel, Toadi stürmt herbei.
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.szene([
		Spiel.z("MAX", "W1_ANK_MAX_0010"),
		Spiel.z("PIX", "W1_ANK_PIX_0020"),
		Spiel.z("MAX", "W1_ANK_MAX_0030"),
		Spiel.z("PIX", "W1_ANK_PIX_0040"),
		Spiel.z("MAX", "W1_ANK_MAX_0050"),
		Spiel.z("MAX", "W1_ANK_MAX_0060"),
		Spiel.nahansicht_zeigen.bind("opas_zettel"),
		Spiel.z("OPA", "W1_ANK_OPA_0070"),
		Spiel.z("MAX", "W1_ANK_MAX_0080"),
		Spiel.z("PIX", "W1_ANK_PIX_0090"),
		Spiel.z("TOA", "W1_ANK_TOA_0100"),
		Spiel.z("MAX", "W1_ANK_MAX_0110"),
		Spiel.z("TOA", "W1_ANK_TOA_0120"),
		Spiel.z("TOA", "W1_ANK_TOA_0130"),
		Spiel.z("MAX", "W1_ANK_MAX_0140"),
		Spiel.z("TOA", "W1_ANK_TOA_0150"),
		Spiel.z("PIX", "W1_ANK_PIX_0160"),
		Spiel.z("TOA", "W1_ANK_TOA_0170"),
		Spiel.z("MAX", "W1_ANK_MAX_0180"),
		Spiel.z("TOA", "W1_ANK_TOA_0190"),
		Spiel.z("TOA", "W1_ANK_TOA_0200"),
		Spiel.z("MAX", "W1_ANK_MAX_0210"),
		Spiel.z("PIX", "W1_ANK_PIX_0220"),
		Spiel.z("MAX", "W1_ANK_MAX_0230"),
		Spiel.z("PIX", "W1_ANK_PIX_0240"),
	])


## Rätsel 3, zweite Ziege (0910–1010): Bestellzettel ans Dorfbrett, Rotkäppchen liefert.
func xxl_liefern() -> void:
	await Spiel.abgeben("Bestellzettel")
	await Spiel.szene([
		Spiel.z("MAX", "W1_DORF_MAX_0910"),
		Spiel.z("NAR", "W1_DORF_NAR_0920"),
		_lieferung.bind(true),
		Spiel.z("ROT", "W1_DORF_ROT_0930"),
		Spiel.z("XXL", "W1_DORF_XXL_0940"),
		Spiel.z("MAX", "W1_DORF_MAX_0950"),
		Spiel.z("ROT", "W1_DORF_ROT_0960"),
		Spiel.z("PIX", "W1_DORF_PIX_0970"),
		Spiel.z("ROT", "W1_DORF_ROT_0980"),
		_lieferung.bind(false),
	])
	_lieferung(false)
	if Zustand.ist("W1_ZIEGE_FOLGT"):
		await Spiel.sagen("MAX", "W1_DORF_MAX_1010")


func _lieferung(an: bool) -> void:
	var pos := get_marker_position("Lieferung")
	if an:
		Spiel.figur_hier("Rotkaeppchen", true, pos)
		Spiel.figur_hier("XxlZiege", true, pos + Vector2(24, 2))
		Zustand.setze("W1_XXL_GELIEFERT")  # ab jetzt folgt sie (skripte/welt_1.gd)
	else:
		Spiel.figur_hier("Rotkaeppchen", false)
		_zustand_anwenden()
