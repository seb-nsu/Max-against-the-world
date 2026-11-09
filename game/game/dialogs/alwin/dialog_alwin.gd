@tool
extends CQDialog
# Gespräch „Alwin“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## 0310: Rezept bekannt (Melken erlaubt), 0370: Alwins Hinweiszettel.
func _nach_option(id: String) -> bool:
	match id:
		"0310":
			Zustand.setze("W1_REZEPT_BEKANNT")
		"0370":
			if not I.is_item_in_inventory("Hinweiszettel", C.Max) and not Zustand.geloest("R6b"):
				await Spiel.geben("Hinweiszettel")
	return false
