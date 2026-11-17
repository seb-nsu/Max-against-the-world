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
		_waldemar_geht.call_deferred()
		return true
	return false


## Waldemar geht sichtbar Richtung Wald (er hat gerade „Im Wald, zwischen den Pilzen“ gesagt) (Review 17.11., W1 R7: vorher stand er
## an der Brücke, bis Max den Wald betrat, und niemand wusste, wo er singt).
func _waldemar_geht() -> void:
	if not is_instance_valid(R.current) or not R.current.has_character("Waldemar"):
		return
	var w: CQFigur = C.get_character("Waldemar")
	await Spiel.szene([
		func(): await w.laufen_zu(Vector2(700, w.position.y), 90.0),
		func(): Spiel.figur_hier("Waldemar", false),
	])
