@tool
extends CQProp
# Prop „Ketchup“ (ketchup) im Raum Zauberwald. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Nehmen erst nach Rotkäppchens Erlaubnis (WALD 0230/0240, Schalter W1_KETCHUP_FREI).
func _on_click() -> void:
	if not Zustand.ist("W1_KETCHUP_FREI"):
		await Spiel.hingehen(self)
		await Spiel.ersatz()
		return
	await super()
