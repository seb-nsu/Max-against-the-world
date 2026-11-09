@tool
extends CQDialog
# Gespräch „Opa“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## Extra-Option nach der Nahansicht Kalender (0640–0660), steht im Skript nicht unter „Gespräche“.
const KALENDER := {
	id = "0640", frage = "P0_DACH_MAX_0640", beendet = false,
	antworten = [{sprecher = "OPA", zeile = "P0_DACH_OPA_0650"}, {sprecher = "PIX", zeile = "P0_DACH_PIX_0660"}],
}


func _on_build_options(existing: Array[PopochiuDialogOption]) -> Array[PopochiuDialogOption]:
	var out := super(existing)
	if not out.any(func(x): return x.id == KALENDER.id):
		# vor „Ich muss noch was anderes machen“
		out.insert(out.size() - 1, create_option(KALENDER.id, {text = KALENDER.frage}))
	return out


func option_sichtbar(id: String) -> bool:
	if id == KALENDER.id:
		return "kalender" in Zustand.nahansichten and not Zustand.geloest("P3")
	return super(id)


## 1322: Opa gibt die P1-Hinweise; die Stufe steigt wie bei der Pfote, sonst wiederholt er.
func antworten(id: String) -> Array:
	if id == "1322":
		return Hinweise.naechste_zeilen("P1", false).map(
			func(z): return {sprecher = "OPA", zeile = z}
		)
	if id == KALENDER.id:
		return KALENDER.antworten
	return super(id)


func _plan_option(id: String) -> Dictionary:
	if id == KALENDER.id:
		return KALENDER
	return super(id)
