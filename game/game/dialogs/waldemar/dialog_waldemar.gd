@tool
extends CQDialog
# Gespräch „Waldemar“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## 0290 (singen) erst, wenn Max den Zauberwald kennt und die Rosen noch zu sind. Danach geht
## Waldemar in den Wald (W1_WALDEMAR_SINGT); die Nummer spielt beim Betreten des Zauberwalds.
func option_sichtbar(id: String) -> bool:
	if id == "0290" and (not Zustand.war_in("zauberwald") or Zustand.ist("W1_WALDEMAR_SINGT")
			or Zustand.geloest("R7")):
		return false
	return super(id)


func _nach_option(id: String) -> bool:
	if id == "0290":
		Zustand.setze("W1_WALDEMAR_SINGT")
		return true
	return false
