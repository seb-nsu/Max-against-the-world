@tool
extends CQRaum
# Raum „Turmkeller“ (turmkeller). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_turmkeller_state.gd')

var state: Data = load("res://game/rooms/turmkeller/room_turmkeller.tres")


var _erster_besuch := false

## Pixels Haarspuren an den Kreuzungen: Zeile nach der Anzahl der Spuren (0200, 0210, 0220)
const SPUR_ZEILEN := ["W1_TURM_PIX_0200", "W1_TURM_PIX_0210", "W1_TURM_PIX_0220"]


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Die Besen patrouillieren bis Rätsel 11b, danach fegen sie in Abstellkammer 1.
func _zustand_anwenden() -> void:
	super()
	var besen := get_hotspot("Besen")
	if is_instance_valid(besen):
		besen.visible = not Zustand.geloest("R11b")


## Ankunft durch die Rune-Tür (TURM 0010–0040)
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	var schritte := [Spiel.z("MAX", "W1_TURM_MAX_0010"), Spiel.z("PIX", "W1_TURM_PIX_0020")]
	if has_character("Zeldina"):
		schritte.append(Spiel.z("ZEL", "W1_TURM_ZEL_0030"))
	if Zustand.geloest("R10b") and has_character("Grimmzahn"):
		schritte.append(Spiel.z("GRI", "W1_TURM_GRI_0040"))
	await Spiel.szene(schritte)


func spuren() -> int:
	return [1, 2, 3].filter(func(n): return Zustand.ist("W1_KREUZUNG_%d" % n)).size()


## Pixel schüttelt sich an einer Kreuzung (Rätsel 11b): jede Kreuzung einmal.
func kreuzung_pixel(n: int) -> void:
	if Zustand.ist("W1_KREUZUNG_%d" % n) or Zustand.geloest("R11b"):
		await Spiel.ersatz("PIX")
		return
	var zeile: String = SPUR_ZEILEN[spuren()]
	Zustand.setze("W1_KREUZUNG_%d" % n)
	await Spiel.sagen("PIX", zeile)


## Max auf einer Kreuzung: keine Haare (0140, Hinweis 0150).
func kreuzung_max() -> void:
	await Spiel.sagen("MAX", "W1_TURM_MAX_0140")
	await Spiel.sagen("PIX", "W1_TURM_PIX_0150")


## Ein Besen erwischt Max und fegt ihn zur Treppe (0160, dann 0170 bzw. 0180).
func gefegt() -> void:
	var n := Zustand.ansehen_zaehlen("Turmkeller/gefegt")
	await Spiel.sagen("NAR", "W1_TURM_NAR_0160")
	await Spiel.sagen("PIX", "W1_TURM_PIX_0170" if n == 1 else "W1_TURM_PIX_0180")
	if has_marker("VonBergwerk"):
		C.Max.position = get_marker_position("VonBergwerk")
