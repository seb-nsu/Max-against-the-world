@tool
extends CQDialog
# Gespräch „Opa“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## 1322: Opa gibt die P1-Hinweise; die Stufe steigt wie bei der Pfote, sonst wiederholt er.
func antworten(id: String) -> Array:
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


func _zwischenspiel() -> int:
	return int(Zustand.wert("ZWISCHENSPIEL", 0)) if Zustand.abschnitt == "finale" else 0


func bauplan() -> Dictionary:
	var plan: Dictionary = super()
	if _zwischenspiel() != 1:
		return plan
	plan = plan.duplicate()
	plan.optionen = ZS1_OPTIONEN.map(func(o): return {
		id = o[0], frage = o[1], bleibt = false, beendet = o.size() > 3 and o[3],
		antworten = o[2].map(func(a): return {sprecher = a[0], zeile = a[1]}),
	})
	return plan


## Popochiu baut die Optionen nur einmal; im Zwischenspiel kommen die neuen dazu.
func sichtbarkeit_anpassen() -> void:
	if _zwischenspiel() == 1 and not is_instance_valid(get_option(ZS1_OPTIONEN[0][0])):
		_has_done_init = false
	super()


## Prolog-Optionen nur im Prolog, Zwischenspiel-Optionen nur im Zwischenspiel.
func option_sichtbar(id: String) -> bool:
	if id.begins_with("zs") != (_zwischenspiel() > 0):
		return false
	return super(id)


#endregion
