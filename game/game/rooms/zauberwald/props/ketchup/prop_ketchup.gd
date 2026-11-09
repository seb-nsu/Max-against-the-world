@tool
extends CQProp
# Prop „Ketchup“ (ketchup) im Raum Zauberwald. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Nehmen erst nach Rotkäppchens Erlaubnis (WALD 0230/0240, Schalter W1_KETCHUP_FREI).
## Vorher fragt Max lieber (0730), danach nimmt er die Flasche mit 0110 (G22). Der Bauplan
## führt 0730 als Nehmen-Zeile (die 0110 wird dort überschrieben), deshalb entscheidet der Code.
func _on_click() -> void:
	if Spiel.ist_pixel():
		await super()
		return
	var d := bauplan().duplicate()
	if Zustand.ist("W1_KETCHUP_FREI"):
		d.nehmen = {sprecher = "MAX", zeile = "W1_WALD_MAX_0110"}
		await Spiel.nehmen(self, d)
		return
	await Spiel.hingehen(self)
	await Spiel.sagen("MAX", "W1_WALD_MAX_0730")
