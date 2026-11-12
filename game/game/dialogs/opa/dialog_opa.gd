@tool
extends CQDialog
# Gespräch „Opa“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## 1322: Opa gibt die P1-Hinweise; die Stufe steigt wie bei der Pfote, sonst wiederholt er.
## Hat Pixel die Dose abgelehnt, gibt dieselbe Option die Hinweise zum Napf (1520–1528).
const NAPF_HINWEISE := ["P0_DACH_OPA_1520", "P0_DACH_OPA_1524", "P0_DACH_OPA_1528"]
const NAPF_WARTEN := {1: 30.0, 2: 60.0}


func antworten(id: String) -> Array:
	if id == "1322" and Zustand.ist("P0_PIXEL_GEWECKT"):
		var s := int(Zustand.wert("P0_NAPF_STUFE", 0))
		var seit: float = Zustand.spielzeit - float(Zustand.wert("P0_NAPF_ZEIT", 0.0))
		if s == 0 or (s < 3 and seit >= NAPF_WARTEN[s]):
			s += 1
			Zustand.setze_wert("P0_NAPF_STUFE", s)
			Zustand.setze_wert("P0_NAPF_ZEIT", Zustand.spielzeit)
		return [{sprecher = "OPA", zeile = NAPF_HINWEISE[s - 1]}]
	if id == "1322":
		return Hinweise.naechste_zeilen("P1", false).map(
			func(z): return {sprecher = "OPA", zeile = z}
		)
	return super(id)


#region Zwischenspiele ############################################################################
## Gesprächsbaum der freien Phase in Zwischenspiel 1 (skript/zwischenspiele-und-finale.md,
## Abschnitt 1). Die Prolog-Optionen gelten dort nicht; die Abschiedszeilen bleiben die des
## Prologs. Optionen der Zwischenspiele tragen das Präfix „zs1_“.
const ZS1_OPTIONEN := [
	["zs1_0380", "ZS1_DACH_MAX_0380", [["OPA", "ZS1_DACH_OPA_0390"], ["MAX", "ZS1_DACH_MAX_0400"], ["PIX", "ZS1_DACH_PIX_0410"]]],
	["zs1_0430", "ZS1_DACH_MAX_0430", [["OPA", "ZS1_DACH_OPA_0432"], ["MAX", "ZS1_DACH_MAX_0434"], ["PIX", "ZS1_DACH_PIX_0436"]]],
	["zs1_0440", "ZS1_DACH_MAX_0440", [["OPA", "ZS1_DACH_OPA_0442"], ["MAX", "ZS1_DACH_MAX_0444"], ["OPA", "ZS1_DACH_OPA_0446"]]],
	["zs1_0450", "ZS1_DACH_MAX_0450", [["OPA", "ZS1_DACH_OPA_0452"], ["PIX", "ZS1_DACH_PIX_0454"]]],
	["zs1_0460", "ZS1_DACH_MAX_0460", [["OPA", "ZS1_DACH_OPA_0462"]], true],
]
## Zwischenspiele 2 und 3: je eine Frage; „Ich geh packen“ (beendet) wie in Zwischenspiel 1
const ZS2_OPTIONEN := [
	["zs2_0410", "ZS2_DACH_MAX_0410", [["OPA", "ZS2_DACH_OPA_0420"], ["MAX", "ZS2_DACH_MAX_0430"], ["OPA", "ZS2_DACH_OPA_0440"]]],
	["zs2_0460", "ZS1_DACH_MAX_0460", [["OPA", "ZS1_DACH_OPA_0462"]], true],
]
const ZS3_OPTIONEN := [
	["zs3_0450", "ZS3_DACH_MAX_0450", [["OPA", "ZS3_DACH_OPA_0460"], ["MAX", "ZS3_DACH_MAX_0470"], ["PIX", "ZS3_DACH_PIX_0480"]]],
	["zs3_0460", "ZS1_DACH_MAX_0460", [["OPA", "ZS1_DACH_OPA_0462"]], true],
]
## Nach dem Ansehen des Kalenders erklärt Opa den Kreis, bevor das Menü kommt (Reden: Opa nach
## Kalender): [Zeile des Kalenders, Opas Ausrede, Pixels Kommentar]
const ZS_KALENDER := {
	2: ["ZS2_DACH_MAX_0330", "ZS2_DACH_OPA_0340", "ZS2_DACH_PIX_0350"],
	3: ["ZS3_DACH_MAX_0360", "ZS3_DACH_OPA_0370", "ZS3_DACH_PIX_0380"],
}


func _zs_optionen() -> Array:
	return {1: ZS1_OPTIONEN, 2: ZS2_OPTIONEN, 3: ZS3_OPTIONEN}.get(_zwischenspiel(), [])


func _zwischenspiel() -> int:
	return int(Zustand.wert("ZWISCHENSPIEL", 0)) if Zustand.abschnitt == "finale" else 0


func bauplan() -> Dictionary:
	var plan: Dictionary = super()
	if _zs_optionen().is_empty():
		return plan
	plan = plan.duplicate()
	plan.erase("einstieg")
	plan.optionen = _zs_optionen().map(func(o): return {
		id = o[0], frage = o[1], bleibt = false, beendet = o.size() > 3 and o[3],
		antworten = o[2].map(func(a): return {sprecher = a[0], zeile = a[1]}),
	})
	return plan


## Popochiu baut die Optionen nur einmal; im Zwischenspiel kommen die neuen dazu.
func sichtbarkeit_anpassen() -> void:
	if not _zs_optionen().is_empty() and not is_instance_valid(get_option(_zs_optionen()[0][0])):
		_has_done_init = false
	super()


## Prolog-Optionen nur im Prolog, Zwischenspiel-Optionen nur im Zwischenspiel.
func option_sichtbar(id: String) -> bool:
	if id.begins_with("zs") != (_zwischenspiel() > 0):
		return false
	if id.begins_with("zs") and not id.begins_with("zs%d_" % _zwischenspiel()):
		return false
	return super(id)


#endregion


func einstieg() -> void:
	var k: Array = ZS_KALENDER.get(_zwischenspiel(), [])
	if k.is_empty():
		await super()
		return
	var gesehen := Zustand.angesehen.keys().any(func(s): return k[0] in str(s))
	if gesehen and Zustand.ansehen_zaehlen("Opa/Kalender/%d" % _zwischenspiel()) == 1:
		await Spiel.sagen("OPA", k[1])
		await Spiel.sagen("PIX", k[2])
