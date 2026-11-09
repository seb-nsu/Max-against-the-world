@tool
extends CQDialog
# Gespräch „Maklerin“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## Drei Optionen nach Max' Entwicklungsmoment (W1_MAKLERIN_FREI); eine falsche beendet das
## Gespräch (die Maklerin wendet sich ab), die richtige (0470, mit Steckbrief) löst Rätsel 9.
func _nach_option(id: String) -> bool:
	if id == "0470":
		Zustand.loese("R9")
		Spiel.figur_hier("Maklerin", false)
	return true
