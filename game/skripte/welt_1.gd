extends RefCounted
## Regeln von Welt 1, die mehrere Räume betreffen (raetsel/prolog-und-welt-1.md, Rätsel 3 und 4):
## die Ziegen als Begleiter und Pixel im Ziegenfell. CQRaum ruft figuren_anwenden() nach jedem
## Betreten und Laden auf; alles folgt aus Schaltern, nichts davon wird eigens gespeichert.
##
## Schmiede-Ziege: in der Schmiede, folgt Max nach „Kann ich die Ziege haben?“ (W1_ZIEGE_FOLGT)
## bis R4c, danach wieder in der Schmiede. XXL-Ziege: erst nach der Lieferung (W1_XXL_GELIEFERT),
## folgt Max bis R4c, danach grast sie an der Troll-Brücke.

const ZIEGE := "SchmiedeZiege"
const XXL := "XxlZiege"
## Platzhalter für „Pixel als Ziege“ (Figur-Variante, Grafik folgt): Pixel wird bräunlich.
const FELL_FARBE := Color(0.85, 0.72, 0.5)


static func ziege_folgt() -> bool:
	return Zustand.ist("W1_ZIEGE_FOLGT") and not Zustand.geloest("R4c")


static func xxl_folgt() -> bool:
	return Zustand.ist("W1_XXL_GELIEFERT") and not Zustand.geloest("R4c")


## Raum, in dem die Ziege steht, wenn sie nicht folgt ("" = nirgends).
static func heimat(sn: String) -> String:
	if sn == ZIEGE:
		return "Schmiede"
	if sn == XXL and Zustand.geloest("R4c"):
		return "Trollbruecke"
	return ""


static func figuren_anwenden(raum: PopochiuRoom) -> void:
	var i := 0
	for sn in [ZIEGE, XXL]:
		var folgt: bool = ziege_folgt() if sn == ZIEGE else xxl_folgt()
		var da := folgt or raum.script_name == heimat(sn)
		if da and not raum.has_character(sn):
			Spiel.figur_hier(sn, true, _platz(raum, i))
		elif da and folgt:
			C.get_character(sn).position = _platz(raum, i)
		elif not da:
			Spiel.figur_hier(sn, false)
		if folgt:
			i += 1
	if is_instance_valid(C.Pixel):
		C.Pixel.modulate = FELL_FARBE if Zustand.ist("W1_PIXEL_IM_FELL") else Color.WHITE


## Wo eine folgende Ziege steht: an der Brücke am Marker „Ziegen“, sonst hinter Max.
static func _platz(raum: PopochiuRoom, i: int) -> Vector2:
	if raum.has_method("has_marker") and raum.has_marker("Ziegen"):
		return raum.get_marker_position("Ziegen") + Vector2(24 * i, 0)
	var basis: Vector2 = C.Max.position if is_instance_valid(C.Max) else Vector2(160, 160)
	var richtung := -1.0 if basis.x > raum.width / 2.0 else 1.0
	return basis + Vector2(richtung * (44 + 22 * i), 4)
