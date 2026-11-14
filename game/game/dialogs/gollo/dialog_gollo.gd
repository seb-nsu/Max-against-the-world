@tool
extends CQDialog
# Gespräch „Gollo“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## R1c auch im Gespräch (Review Fund 6): „Ich hab ein Rätsel für dich“ startet dasselbe Rätselspiel
## wie ein Gegenstand auf Gollo; die Frage hat Max mit der Option schon gestellt.
func _nach_option(id: String) -> bool:
	if id == "0785":
		stop()
		await R.current.call("r1c_loesen", false)
		return true
	return await super(id)
