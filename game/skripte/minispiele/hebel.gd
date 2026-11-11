class_name CQHebel
extends RefCounted
## Regeln von Archimedes' Hebel (raetsel/welt-2.md, Wettkampftage, Disziplin 2), ohne Oberfläche:
## Gegengewichte in den Korb, dazu der Winkel in drei Stufen. Die Kraft ist das Gewicht im Korb,
## der Winkel verschiebt sie um eine Stufe (flach −1, mittel 0, steil +1). Zwischen MIN und MAX
## landet Max hinter der Markierung, darunter in der Sandgrube, darüber im Fluss oder auf der
## Agora. Pixel allein (9) trifft bei jedem Winkel. Die Oberfläche steht in
## oberflaeche/minispiel_hebel.gd.

const MIN := 8
const MAX := 10
## Winkelstufen und ihr Zuschlag auf die Kraft
const WINKEL := [-1, 0, 1]
const WINKEL_NAMEN := ["flach", "mittel", "steil"]
const MITTEL := 1

## Gegenstand-ID → Gewicht
var gewichte := {}
var korb: Array = []
var winkel := MITTEL


func _init(gewichte_je_id: Dictionary, im_korb: Array = [], stufe := MITTEL) -> void:
	gewichte = gewichte_je_id
	korb = im_korb.duplicate()
	winkel = clampi(stufe, 0, WINKEL.size() - 1)


func gewicht() -> int:
	var g := 0
	for id in korb:
		g += int(gewichte.get(id, 0))
	return g


func kraft() -> int:
	return gewicht() + int(WINKEL[winkel])


## "leicht", "treffer" oder "schwer"
func ergebnis() -> String:
	var k := kraft()
	if k < MIN:
		return "leicht"
	return "treffer" if k <= MAX else "schwer"
