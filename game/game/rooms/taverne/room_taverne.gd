@tool
extends CQRaum
# Raum „Taverne“ (taverne). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_taverne_state.gd')

var state: Data = load("res://game/rooms/taverne/room_taverne.tres")

var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Minka sitzt am Topf bis R1a; Humbert ist im Keller zwischen R1b und R1c; Berta sitzt nach der
## Laute auf dem Dachbalken.
func _zustand_anwenden() -> void:
	super()
	Spiel.figur_hier("Minka", not Zustand.geloest("R1a"))
	Spiel.figur_hier("Humbert", not humbert_im_keller())
	# Berta flieht vor Max' Lautenspiel auf den Dachbalken (TAV 1590) und bleibt dort
	if Zustand.ist("W1_BERTA_WEG") and has_character("Huhn") and has_marker("HuhnBalken"):
		C.Huhn.position = get_marker_position("HuhnBalken")


func humbert_im_keller() -> bool:
	return Zustand.geloest("R1b") and not Zustand.geloest("R1c")


## Erstes Betreten (skript/welt-1.md, Abschnitt 3): Pixel springt auf den Balken, und der
## Figurenwechsel wird freigeschaltet (Rätsel 1a lehrt ihn).
func _nach_uebergang() -> void:
	if not _erster_besuch:
		# Spielt Max, sitzt Pixel wieder auf seinem Balken (Zuruf 1630 „Pixel auf dem Balken“)
		if C.player == C.Max and Zustand.ist("W1_WECHSEL_FREI") and has_character("Pixel"):
			C.Pixel.position = get_marker_position("Balken")
		return
	_erster_besuch = false
	await Spiel.szene([
		Spiel.z("HUM", "W1_TAV_HUM_0010"),
		Spiel.z("MAX", "W1_TAV_MAX_0020"),
		Spiel.z("HUM", "W1_TAV_HUM_0030"),
		Spiel.z("NAR", "W1_TAV_NAR_0040"),
		_pixel_auf_den_balken,
		Spiel.z("PIX", "W1_TAV_PIX_0050"),
		Spiel.z("MAX", "W1_TAV_MAX_0060"),
		Spiel.z("GOL", "W1_TAV_GOL_0070"),
	])
	_pixel_auf_den_balken()


## Pixel springt sichtbar hinauf (Sebastian, 14. November 2026): über die Kiste neben dem Korb und
## den Rahmen des Wandbretts auf den Dachbalken. Nach dem Überspringen sitzt er gleich oben.
const BALKEN_WEG := [Vector2(352, 232), Vector2(342, 197), Vector2(300, 67)]

func _pixel_auf_den_balken() -> void:
	if not has_character("Pixel"):
		return
	var oben := get_marker_position("Balken")
	if C.Pixel.position.distance_to(oben) > 2.0 and not Spiel.testmodus and not E.cutscene_skipped:
		C.Pixel.idle_animation = "stehen" if C.Pixel.get_node("AnimationPlayer").has_animation("stehen") else "idle"
		await C.Pixel.walk_to(BALKEN_WEG[0])
		await C.Pixel.springen_zu(BALKEN_WEG[1], 18.0, 0.32)
		await C.Pixel.springen_zu(BALKEN_WEG[2], 26.0, 0.5)
		await C.Pixel.springen_zu(oben, 12.0, 0.28)
		C.Pixel.idle_animation = "idle"
		C.Pixel._play_idle()
	C.Pixel.position = oben
	C.Pixel.sync_buffered_position()
	Zustand.setze("W1_WECHSEL_FREI")


## Die ersten beiden Wechsel haben eigene Zeilen (0080, 0090), danach der Pool (WECH).
func _figur_gewechselt(neu: PopochiuCharacter) -> bool:
	var n: int = int(Zustand.wert("W1_TAVERNE_WECHSEL", 0))
	if n >= 2:
		return false
	Zustand.setze_wert("W1_TAVERNE_WECHSEL", n + 1)
	if neu == C.Pixel:
		await Spiel.sagen("PIX", "W1_TAV_PIX_0080")
	else:
		await Spiel.sagen("MAX", "W1_TAV_MAX_0090")
	return true


## R1a: Pixel umgarnt Minka (0940–1000). Aufgerufen von Minka.
func r1a_loesen() -> void:
	await Spiel.szene([
		Spiel.z("MIN", "W1_TAV_MIN_0940"),
		Spiel.z("PIX", "W1_TAV_PIX_0950"),
		Spiel.z("MIN", "W1_TAV_MIN_0960"),
		Spiel.z("PIX", "W1_TAV_PIX_0970"),
		Spiel.z("MIN", "W1_TAV_MIN_0980"),
		Zustand.loese.bind("R1a"),
		_zustand_anwenden,
		Spiel.z("MAX", "W1_TAV_MAX_0990"),
		Spiel.z("PIX", "W1_TAV_PIX_1000"),
	])
	Zustand.loese("R1a")
	_zustand_anwenden()


## R1b: Humbert holt den Schicksalsberg (0600, 0610). Aufgerufen vom Gespräch.
func r1b_loesen() -> void:
	var minka_da := has_character("Minka")
	await Spiel.sagen("HUM", "W1_TAV_HUM_0600")
	Zustand.loese("R1b")
	_zustand_anwenden()
	if minka_da:
		await Spiel.sagen("PIX", "W1_TAV_PIX_0610")


## R1c: das Rätselspiel mit Gollo, Humbert kommt zurück (1120–1330). Aufgerufen von Gollo.
func r1c_loesen() -> void:
	await Spiel.szene([
		Spiel.z("MAX", "W1_TAV_MAX_1120"),
		Spiel.z("GOL", "W1_TAV_GOL_1130"),
		Spiel.z("GOL", "W1_TAV_GOL_1140"),
		Spiel.z("MAX", "W1_TAV_MAX_1150"),
		Spiel.z("GOL", "W1_TAV_GOL_1160"),
		Spiel.z("MAX", "W1_TAV_MAX_1170"),
		Spiel.z("GOL", "W1_TAV_GOL_1180"),
		Spiel.z("MAX", "W1_TAV_MAX_1190"),
		Spiel.z("PIX", "W1_TAV_PIX_1200"),
		Spiel.z("GOL", "W1_TAV_GOL_1210"),
		Spiel.z("GOL", "W1_TAV_GOL_1220"),
		Spiel.geben.bind("Goldmuenze"),
		Spiel.z("MAX", "W1_TAV_MAX_1230"),
		Spiel.z("NAR", "W1_TAV_NAR_1240"),
		Zustand.loese.bind("R1c"),
		_zustand_anwenden,
		Spiel.z("HUM", "W1_TAV_HUM_1250"),
		Spiel.z("HUM", "W1_TAV_HUM_1260"),
		Spiel.z("HUM", "W1_TAV_HUM_1270"),
		Spiel.z("HUM", "W1_TAV_HUM_1280"),
		Spiel.geben.bind("Kaesefondue"),
		Spiel.z("MAX", "W1_TAV_MAX_1290"),
		Spiel.z("PIX", "W1_TAV_PIX_1300"),
		Spiel.z("MAX", "W1_TAV_MAX_1310"),
		Spiel.z("PIX", "W1_TAV_PIX_1320"),
		Spiel.z("MAX", "W1_TAV_MAX_1330"),
	])
	# Falls die Szene übersprungen wurde
	await Spiel.geben("Goldmuenze")
	await Spiel.geben("Kaesefondue")
	Zustand.loese("R1c")
	_zustand_anwenden()
