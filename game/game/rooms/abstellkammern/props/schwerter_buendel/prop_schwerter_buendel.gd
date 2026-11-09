@tool
extends CQProp
# Prop „SchwerterBuendel“ (schwerter_buendel) im Raum Abstellkammern. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


func _on_click() -> void:
	await room.call("kram_nehmen", self)
