@tool
extends CQDialog
# Gespräch „Schmied“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## 0270: Die Ziege folgt Max ab jetzt (Begleiter, skripte/welt_1.gd).
func _nach_option(id: String) -> bool:
	if id == "0270":
		Zustand.setze("W1_ZIEGE_FOLGT")
		R.current._zustand_anwenden()
	return false


## „Kann ich die Ziege haben?“ nur, solange sie noch beim Schmied steht.
func option_sichtbar(id: String) -> bool:
	if id == "0270" and Zustand.ist("W1_ZIEGE_FOLGT"):
		return false
	return super(id)
