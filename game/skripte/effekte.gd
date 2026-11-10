class_name CQEffekte
extends RefCounted
## Effekte, die die Barrierefreiheits-Optionen beachten (05-spielsysteme.md, Optionen). Wer im
## Spiel wackeln, flackern oder mit Farben codieren will, geht über diese Funktionen, damit die
## Schalter überall gleich wirken:
## - wackeln(): Bildschirmwackeln, entfällt bei „Bildschirmwackeln aus“
## - flackern_erlaubt(): false bei „Flackern reduzieren“; dann die weiche Variante zeigen
##   (Lampe dimmt langsam statt zu flackern, Umschalt-Störung als kurze Blende)
## - weich_blinken(): Helligkeit für eine flackernde Lichtquelle, mit der Option als sanftes Pulsieren
## - farbsymbol(): Symbol zu einer Farbe für die Farbenblind-Hilfe (Welt 3, Rätsel 7: Kabel mit
##   Kreis, Dreieck, Quadrat), leer, solange die Hilfe aus ist

const SYMBOLE := {rot = "●", gruen = "▲", blau = "■", gelb = "◆"}


static func wackeln(staerke := 1.0, dauer := 0.5) -> void:
	if Einstellungen.wert("wackeln_aus") or not is_instance_valid(E) or not E.camera:
		return
	E.camera.shake(staerke, dauer)


static func flackern_erlaubt() -> bool:
	return not Einstellungen.wert("flackern_reduzieren")


## Helligkeit 0 bis 1 zur Zeit t (Sekunden): hartes Flackern oder, mit „Flackern reduzieren“,
## ein langsames Pulsieren unter einmal je Sekunde (weit unter den kritischen 3 Hz).
static func weich_blinken(t: float, takt := 8.0) -> float:
	if flackern_erlaubt():
		return 1.0 if fmod(t * takt, 1.0) < 0.5 else 0.3
	return 0.65 + 0.35 * cos(t * TAU * 0.6)


static func farbsymbol(farbe: String) -> String:
	return SYMBOLE.get(farbe, "") if Einstellungen.wert("farbenblind") else ""
