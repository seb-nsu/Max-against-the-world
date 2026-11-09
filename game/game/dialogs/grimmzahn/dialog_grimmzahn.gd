@tool
extends CQDialog
# Gespräch „Grimmzahn“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## 0390 (Hausmeister-Posten) nur mit Zeldina im Team und vor Rätsel 10: Weg B.
func option_sichtbar(id: String) -> bool:
	if id == "0390" and (not Zustand.ist("W1_ZELDINA_FOLGT") or Zustand.geloest("R10")):
		return false
	return super(id)


func _nach_option(id: String) -> bool:
	if id == "0390":
		Zustand.loese("R10b")
		await R.current.call("lied")
		return true
	return false
