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
const BALKEN_WEG := [Vector2(352, 232), Vector2(356, 205), Vector2(300, 67)]   # Zwischenlandung auf der Kistenkante, nicht im Hühnerkorb (Review Fund 27)

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
		_minka_geht_hinaus,
		Zustand.loese.bind("R1a"),
		_zustand_anwenden,
		Spiel.z("MAX", "W1_TAV_MAX_0990"),
		Spiel.z("PIX", "W1_TAV_PIX_1000"),
	])
	Zustand.loese("R1a")
	_zustand_anwenden()
	await _keiner_guckt()


## Minka steht auf und geht zur Tür hinaus (0980 „folgt Pixel nach draußen“), Review Fund 18.
func _minka_geht_hinaus() -> void:
	if not has_character("Minka"):
		return
	var tuer := get_marker_position("VonDorfplatz")
	await C.Minka.laufen_zu(Vector2(C.Minka.position.x + 70.0, 228.0), 80.0)
	await C.Minka.laufen_zu(tuer, 110.0)
	await C.Minka.ausblenden_und_weg()


## R1b: Humbert holt den Schicksalsberg (0600, 0610). Aufgerufen vom Gespräch.
func r1b_loesen() -> void:
	var minka_da := has_character("Minka")
	await Spiel.sagen("HUM", "W1_TAV_HUM_0600")
	# Humbert geht wirklich zur Kellertür hinter dem Tresen (Review Fund 18)
	if has_character("Humbert"):
		await C.Humbert.laufen_zu(get_marker_position("Keller") + Vector2(0, 40), 60.0)
		await C.Humbert.ausblenden_und_weg()
	Zustand.loese("R1b")
	_zustand_anwenden()
	if minka_da:
		await Spiel.sagen("PIX", "W1_TAV_PIX_0610")
	await _keiner_guckt()


## Sind Minka und Humbert beide weg, sagt Pixel es einmal laut (Review Fund 6): Jetzt ist die
## Gelegenheit für Gollos Rätselspiel.
func _keiner_guckt() -> void:
	if Zustand.geloest("R1a") and Zustand.geloest("R1b") and not Zustand.geloest("R1c") and not Zustand.ist("W1_TAV_KEINER_GUCKT"):
		Zustand.setze("W1_TAV_KEINER_GUCKT")
		await Spiel.sagen("PIX", "W1_TAV_PIX_1105")


## R1c: das Rätselspiel mit Gollo, Humbert kommt zurück (1120–1330). Aufgerufen von Gollo.
func r1c_loesen(mit_frage := true) -> void:
	await Spiel.szene(([Spiel.z("MAX", "W1_TAV_MAX_1120")] if mit_frage else []) + [
		Spiel.z("GOL", "W1_TAV_GOL_1130"),
		Spiel.z("GOL", "W1_TAV_GOL_1140"),
		Spiel.z("MAX", "W1_TAV_MAX_1150"),
		Spiel.z("GOL", "W1_TAV_GOL_1160"),
		Spiel.z("MAX", "W1_TAV_MAX_1170"),
		Spiel.z("GOL", "W1_TAV_GOL_1180"),
		Spiel.z("MAX", "W1_TAV_MAX_1190"),
		Spiel.z("PIX", "W1_TAV_PIX_1200"),
		Spiel.z("GOL", "W1_TAV_GOL_1210"),
		_ring_fliegt,
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


## Gollo wirft den Ring im Bogen in den Fondue-Topf; dort zischt eine kleine Dampfwolke
## (Review Fund 18; vorher geschah an dieser Stelle nichts).
func _ring_fliegt() -> void:
	if Spiel.testmodus or E.cutscene_skipped or not has_character("Gollo"):
		return
	var ring := Polygon2D.new()
	var punkte := PackedVector2Array()
	for k in 12:
		var w := TAU * k / 12.0
		punkte.append(Vector2(cos(w) * 3.0, sin(w) * 2.0))
	ring.polygon = punkte
	ring.color = Color("feae34")
	ring.z_index = 40
	var start: Vector2 = C.Gollo.position + Vector2(0, -60)
	var ziel := Vector2(225, 128)   # Fondue-Topf auf dem Tresen
	ring.position = start
	add_child(ring)
	var t := create_tween()
	t.tween_method(func(k: float):
		ring.position = start.lerp(ziel, k) + Vector2(0, -sin(k * PI) * 55.0)
		ring.rotation = k * TAU * 2.0, 0.0, 1.0, 0.8)
	await t.finished
	ring.queue_free()
	CQEffekte.rauchwolke(self, ziel + Vector2(0, 6), 26.0)
	await get_tree().create_timer(0.5).timeout
