class_name CQRedeRingen
extends RefCounted
## Regeln des Rede-Ringens (raetsel/welt-2.md, Rede-Ringen in der Sandgrube), ohne Oberfläche:
## Cicero steht auf der Linie seiner Beleidigung (1 bis 5). Ein passender Konter schiebt ihn eine
## Linie nach rechts, der fünfte Treffer über die Mauer. Ein falscher Konter kostet eine Linie
## (nie hinter Linie 1) und bleibt für die Beleidigung, bei der er danebenging, gesperrt.
## Konter verbrauchen sich nicht. Die Oberfläche steht in oberflaeche/minispiel_ringen.gd.

const LINIEN := 5

## Gesammelte Konter (Nummern 1 bis 7) in der Reihenfolge des Notizbuchs
var konter: Array = []
## Linie → passende Konter
var passend := {}
## Linie, auf der Cicero steht; LINIEN + 1 heißt: über die Mauer, gewonnen
var linie := 1
var fehler := 0
var treffer := 0
## Linie → Konter, die dort schon danebengingen
var gesperrt := {}


func _init(gesammelt: Array, passende: Dictionary) -> void:
	konter = gesammelt.duplicate()
	passend = passende


func gewonnen() -> bool:
	return linie > LINIEN


## Ist der Konter für die Beleidigung der aktuellen Linie ausgegraut?
func ist_gesperrt(k: int) -> bool:
	return k in gesperrt.get(linie, [])


## Konter, die gerade wählbar sind. Sind alle gesperrt (nur möglich, wenn der passende Konter
## fehlt), werden alle wieder frei, damit niemand festsitzt.
func angebot() -> Array:
	var frei := konter.filter(func(k): return not ist_gesperrt(k))
	if frei.is_empty():
		gesperrt.erase(linie)
		return konter.duplicate()
	return frei


## Max kontert mit k. true = Treffer (Cicero rückt eine Linie nach rechts), false = daneben
## (Konter für diese Linie gesperrt, Cicero rückt eine Linie zurück).
func kontern(k: int) -> bool:
	if gewonnen():
		return true
	if k in passend.get(linie, []):
		linie += 1
		treffer += 1
		return true
	gesperrt[linie] = gesperrt.get(linie, []) + [k]
	linie = maxi(1, linie - 1)
	fehler += 1
	return false
