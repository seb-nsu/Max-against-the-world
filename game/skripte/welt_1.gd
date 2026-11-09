extends RefCounted
## Regeln von Welt 1, die mehrere Räume betreffen (aufgerufen von CQRaum._zustand_anwenden):
## - Begleiter: Schmiede-Ziege (W1_ZIEGE_FOLGT) und XXL-Ziege (W1_XXL_GELIEFERT) folgen Max bis
##   Rätsel 4; danach steht die Schmiede-Ziege in der Schmiede, die XXL-Ziege an der Brücke.
##   Zeldina folgt ab Rätsel 9 (W1_ZELDINA_FOLGT), Grimmzahn auf Goblin-Weg B ab Rätsel 10b
##   (W1_GRIMMZAHN_FOLGT) bis Rätsel 12.
## - Smaugis Abstellkammern: nach Rätsel 11b stehen dort die drei Abnehmer Humbert, Grimmzahn
##   und Zeldina (Ankunftsszene W1_SMAU 0040–0070).
## - Pixel im Ziegenfell (W1_PIXEL_IM_FELL) bekommt eine Fellfarbe statt eigener Grafik.

const ZIEGE := "SchmiedeZiege"
const XXL := "XxlZiege"
const ZELDINA := "Zeldina"
const GRIMMZAHN := "Grimmzahn"
const HUMBERT := "Humbert"
const ABNEHMER := [HUMBERT, GRIMMZAHN, ZELDINA]
const FELL_FARBE := Color(0.85, 0.72, 0.5)


static func ziege_folgt() -> bool:
	return Zustand.ist("W1_ZIEGE_FOLGT") and not Zustand.geloest("R4c")


static func xxl_folgt() -> bool:
	return Zustand.ist("W1_XXL_GELIEFERT") and not Zustand.geloest("R4c")


static func folgt(sn: String) -> bool:
	match sn:
		ZIEGE:
			return ziege_folgt()
		XXL:
			return xxl_folgt()
		ZELDINA:
			return Zustand.ist("W1_ZELDINA_FOLGT")
		GRIMMZAHN:
			return Zustand.ist("W1_GRIMMZAHN_FOLGT") and not Zustand.geloest("R12")
	return false


## Räume, in denen die Figur steht, wenn sie nicht folgt.
static func heimat(sn: String) -> Array:
	var abnehmer := ["Abstellkammern"] if Zustand.geloest("R11b") else []
	match sn:
		ZIEGE:
			return ["Schmiede"]
		XXL:
			return ["Trollbruecke"] if Zustand.geloest("R4c") else []
		ZELDINA:
			return ["Luftschloss"] if not Zustand.geloest("R9") else abnehmer
		GRIMMZAHN:
			return ["Bergwerk"] + abnehmer
		HUMBERT:
			return ["Taverne"] + abnehmer
	return []


static func figuren_anwenden(raum: PopochiuRoom) -> void:
	var i := 0
	for sn in [ZIEGE, XXL, ZELDINA, GRIMMZAHN, HUMBERT]:
		var f := folgt(sn)
		var da: bool = f or raum.script_name in heimat(sn)
		if sn == HUMBERT and raum.script_name == "Taverne":
			continue  # in der Taverne entscheidet der Raum (Keller, R1b)
		var pos := _platz(raum, i, sn)
		if da and not raum.has_character(sn):
			Spiel.figur_hier(sn, true, pos)
		elif da and (f or (sn in ABNEHMER and raum.has_marker("Abnehmer"))):
			C.get_character(sn).position = pos
		elif not da:
			Spiel.figur_hier(sn, false)
		if f:
			i += 1
	if is_instance_valid(C.Pixel):
		C.Pixel.modulate = FELL_FARBE if Zustand.ist("W1_PIXEL_IM_FELL") else Color.WHITE


static func _platz(raum: PopochiuRoom, i: int, sn := "") -> Vector2:
	if sn in ABNEHMER and raum.has_method("has_marker") and raum.has_marker("Abnehmer"):
		return raum.get_marker_position("Abnehmer") + Vector2(54 * ABNEHMER.find(sn), 0)
	if raum.has_method("has_marker") and raum.has_marker("Ziegen"):
		return raum.get_marker_position("Ziegen") + Vector2(36 * i, 0)
	var basis: Vector2 = C.Max.position if is_instance_valid(C.Max) else Vector2(240, 240)
	var richtung := -1.0 if basis.x > raum.width / 2.0 else 1.0
	return basis + Vector2(richtung * (66 + 33 * i), 6)
