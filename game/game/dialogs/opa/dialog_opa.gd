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
