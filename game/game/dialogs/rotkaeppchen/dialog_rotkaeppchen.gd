@tool
extends CQDialog
# Gespräch „Rotkaeppchen“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## 0230/0240: Rotkäppchen gibt den Ketchup frei.
func _nach_option(id: String) -> bool:
	if id == "0230":
		Zustand.setze("W1_KETCHUP_FREI")
	return false
