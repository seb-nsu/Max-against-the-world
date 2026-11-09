@tool
extends CQRaum
# Raum „Trollbruecke“ (trollbruecke). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_trollbruecke_state.gd')

var state: Data = load("res://game/rooms/trollbruecke/room_trollbruecke.tres")

## Reihenfolge auf der Brücke (Paragraf 1): klein (Pixel im Fell), mittel, groß.
const REIHE := ["Pixel", "SchmiedeZiege", "XxlZiege"]


## Wer schon auf der Brücke steht (W1_R4A_REIHE), steht in der Mitte; R3 gilt, sobald Pixel
## im Fell steckt und beide Ziegen da sind.
func _zustand_anwenden() -> void:
	super()
	var n := reihe()
	if Zustand.geloest("R4a") and not Zustand.geloest("R4c"):
		n = 3
	if Zustand.geloest("R4c"):
		n = 0
	for i in n:
		if has_character(REIHE[i]):
			C.get_character(REIHE[i]).position = get_marker_position("BrueckeMitte") + Vector2(-24 + 24 * i, 0)
	if not Zustand.geloest("R3") and Zustand.ist("W1_PIXEL_IM_FELL") \
			and has_character("SchmiedeZiege") and has_character("XxlZiege"):
		Zustand.loese("R3")


func reihe() -> int:
	return int(Zustand.wert("W1_R4A_REIHE", 0))


## Rätsel 3 und 4 betreffen mehrere Figuren (CQFigur ruft das vor allem anderen auf).
func figur_benutzt(figur: PopochiuCharacter, item: PopochiuInventoryItem) -> bool:
	var sn := figur.script_name
	if item == null:
		if Spiel.ist_pixel():
			if sn in ["SchmiedeZiege", "XxlZiege"] and Zustand.geloest("R4a") \
					and Zustand.ist("W1_SATZUNG_VORGELESEN") and not Zustand.geloest("R4b"):
				await Spiel.hingehen(figur)
				await _uebersetzen(sn)
				return true
			return false
		var ziege := sn in ["SchmiedeZiege", "XxlZiege"] or (sn == "Pixel" and Zustand.ist("W1_PIXEL_IM_FELL"))
		if ziege and not Zustand.geloest("R4a"):
			await _auf_die_bruecke(sn)
			return true
		return false
	match [sn, item.script_name]:
		["Pixel", "ZiegenfellVorleger"]:
			await _fell_anlegen()
			return true
		["Waldemar", "Eimer"]:
			await Spiel.hingehen(figur)
			await _eimer_auf_waldemar()
			return true
	return false


## R3, dritte Ziege (0410–0460)
func _fell_anlegen() -> void:
	await Spiel.hingehen(C.Pixel)
	await Spiel.szene([
		Spiel.abgeben.bind("ZiegenfellVorleger"),
		Spiel.z("PIX", "W1_BRUE_PIX_0410"),
		Spiel.z("MAX", "W1_BRUE_MAX_0420"),
		Zustand.setze.bind("W1_PIXEL_IM_FELL"),
		_zustand_anwenden,
		Spiel.z("PIX", "W1_BRUE_PIX_0430"),
		Spiel.z("WAL", "W1_BRUE_WAL_0440"),
		Spiel.z("MAX", "W1_BRUE_MAX_0450"),
		Spiel.z("WAL", "W1_BRUE_WAL_0460"),
	])
	await Spiel.abgeben("ZiegenfellVorleger")
	Zustand.setze("W1_PIXEL_IM_FELL")
	_zustand_anwenden()


## R4a: Max schickt eine Ziege auf die Brücke (0470–0530), danach fehlen die Sätze (0610–0640).
func _auf_die_bruecke(sn: String) -> void:
	if not Zustand.geloest("R3"):
		await Spiel.sagen("MAX", "W1_BRUE_MAX_0470")
		return
	var n := reihe()
	if REIHE.find(sn) < n:
		await Spiel.ersatz()  # steht schon auf der Brücke
		return
	if REIHE[n] != sn:
		await Spiel.sagen("WAL", "W1_BRUE_WAL_0480" if n == 0 else "W1_BRUE_WAL_0490")
		Zustand.setze_wert("W1_R4A_REIHE", 0)
		_zustand_anwenden()
		return
	Zustand.setze_wert("W1_R4A_REIHE", n + 1)
	_zustand_anwenden()
	match n:
		0:
			await Spiel.sagen("PIX", "W1_BRUE_PIX_0500")
			await Spiel.sagen("WAL", "W1_BRUE_WAL_0510")
		1:
			await Spiel.sagen("WAL", "W1_BRUE_WAL_0520")
		2:
			await Spiel.sagen("WAL", "W1_BRUE_WAL_0530")
			await Spiel.szene([
				Zustand.loese.bind("R4a"),
				Spiel.z("ZIE", "W1_BRUE_ZIE_0610"),
				Spiel.z("WAL", "W1_BRUE_WAL_0620"),
				Spiel.z("MAX", "W1_BRUE_MAX_0630"),
				Spiel.z("PIX", "W1_BRUE_PIX_0640"),
			])
			Zustand.loese("R4a")


## R4b: Max liest die Sätze vor (0650), Pixel sagt seinen selbst (0660, 0670). Vom Schild.
func vorlesen() -> void:
	await Spiel.szene([
		Spiel.z("MAX", "W1_BRUE_MAX_0650"),
		Zustand.setze.bind("W1_SATZUNG_VORGELESEN"),
		Spiel.z("PIX", "W1_BRUE_PIX_0660"),
		Spiel.z("WAL", "W1_BRUE_WAL_0670"),
	])
	Zustand.setze("W1_SATZUNG_VORGELESEN")


## R4b: Pixel übersetzt; der erste Versuch je Ziege geht schief (0680–0810).
func _uebersetzen(sn: String) -> void:
	var schluessel := "W1_R4B_ZIE_VERSUCHE" if sn == "SchmiedeZiege" else "W1_R4B_XXL_VERSUCHE"
	var n: int = int(Zustand.wert(schluessel, 0))
	if n >= 2:
		await Spiel.ersatz()
		return
	var zeilen := {
		"SchmiedeZiege": [
			[["PIX", "W1_BRUE_PIX_0680"], ["ZIE", "W1_BRUE_ZIE_0690"], ["WAL", "W1_BRUE_WAL_0700"], ["PIX", "W1_BRUE_PIX_0710"]],
			[["PIX", "W1_BRUE_PIX_0720"], ["ZIE", "W1_BRUE_ZIE_0730"], ["WAL", "W1_BRUE_WAL_0740"]],
		],
		"XxlZiege": [
			[["PIX", "W1_BRUE_PIX_0750"], ["XXL", "W1_BRUE_XXL_0760"], ["WAL", "W1_BRUE_WAL_0770"], ["PIX", "W1_BRUE_PIX_0780"]],
			[["PIX", "W1_BRUE_PIX_0790"], ["XXL", "W1_BRUE_XXL_0800"], ["WAL", "W1_BRUE_WAL_0810"]],
		],
	}
	var schritte := []
	for zl in zeilen[sn][n]:
		schritte.append(Spiel.z(zl[0], zl[1]))
	Zustand.setze_wert(schluessel, n + 1)
	await Spiel.szene(schritte)
	if int(Zustand.wert("W1_R4B_ZIE_VERSUCHE", 0)) >= 2 and int(Zustand.wert("W1_R4B_XXL_VERSUCHE", 0)) >= 2:
		await Spiel.szene([
			Spiel.z("MAX", "W1_BRUE_MAX_0820"),
			Zustand.loese.bind("R4b"),
			Spiel.z("WAL", "W1_BRUE_WAL_0910"),
			Spiel.z("WAL", "W1_BRUE_WAL_0920"),
		])
		Zustand.loese("R4b")


## R4c: Eimer mit Wasser auf Waldemar (0940–1050).
func _eimer_auf_waldemar() -> void:
	if Zustand.wert("W1_EIMER", "leer") != "mit_wasser":
		await Spiel.sagen("WAL", "W1_BRUE_WAL_0940")
		return
	if Zustand.geloest("R4c"):
		await Spiel.sagen("WAL", "W1_BRUE_WAL_1050")
		return
	if not Zustand.geloest("R4b"):
		await Spiel.ersatz()
		return
	await Spiel.szene([
		Spiel.z("MAX", "W1_BRUE_MAX_0950"),
		Spiel.z("WAL", "W1_BRUE_WAL_0960"),
		Spiel.z("WAL", "W1_BRUE_WAL_0970"),
		Spiel.z("MAX", "W1_BRUE_MAX_0980"),
		Spiel.z("PIX", "W1_BRUE_PIX_0990"),
		Spiel.z("WAL", "W1_BRUE_WAL_1000"),
		Zustand.setze_wert.bind("W1_EIMER", "leer"),
		Spiel.z("PIX", "W1_BRUE_PIX_1010"),
		Spiel.z("MAX", "W1_BRUE_MAX_1020"),
		Spiel.z("PIX", "W1_BRUE_PIX_1030"),
	])
	await _r4c_setzen()


func _r4c_setzen() -> void:
	Zustand.setze_wert("W1_EIMER", "leer")
	Zustand.setze("W1_PIXEL_IM_FELL", false)
	await Spiel.geben("ZiegenfellVorleger")
	Zustand.loese("R4c")
	Zustand.setze("W1_ZIEGEN_FOLGEN", false)  # Begleiter-Schalter endet mit R4
	_zustand_anwenden()
