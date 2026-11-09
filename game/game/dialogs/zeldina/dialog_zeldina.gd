@tool
extends CQDialog
# Gespräch „Zeldina“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## Vor Rätsel 9 die Fragen im Luftschloss (0210–0320), danach die im Team (0710–0770).
const VOR_R9 := ["0210", "0230", "0250", "0280", "0320"]


func option_sichtbar(id: String) -> bool:
	if (id in VOR_R9) == Zustand.geloest("R9"):
		return false
	return super(id)


## 0280: Max' Entwicklungsmoment (0310) schaltet die Maklerin-Optionen frei.
## 0710: Zeldina nennt den Anfang des Passworts („Mo“, Notizbuch).
func _nach_option(id: String) -> bool:
	match id:
		"0280":
			Zustand.setze("W1_MAKLERIN_FREI")
		"0710":
			Zustand.setze("W1_PASSWORT_MO")
	return false
