@tool
extends CQHotspot
# Hotspot „Kritzelei“ (kritzelei) im Raum Luftschloss. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Ansehen öffnet die Nahansicht (Notizbuch „…-Bärchen“, Passwort-Teil für Rätsel 11a).
func ansehen() -> String:
	await Spiel.nahansicht_zeigen("luftschloss_kritzelei")
	return await super()
