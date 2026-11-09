@tool
extends CQDialog
# Gespräch „Humbert“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## 0590 löst R1b: Humbert geht in den Keller (die Antwort 0600 spricht der Raum).
func antworten(id: String) -> Array:
	if id == "0590":
		return []
	return super(id)


func _nach_option(id: String) -> bool:
	if id == "0590":
		await R.current.call("r1b_loesen")
		return true
	return false
