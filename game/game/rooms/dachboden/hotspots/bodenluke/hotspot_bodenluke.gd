@tool
extends CQAusgang
# Hotspot „Bodenluke“ (bodenluke) im Raum Dachboden. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Führt nach: treppenhaus. Gehen und Raumwechsel macht CQAusgang.
# Gesperrt? _darf_gehen() überschreiben.


## Vor P1 steigt Max wieder hinunter (1020, 1025): Die Thunfischdose steckt im Treppenhaus in
## Opas Mantel, die Teetasse steht im Wohnzimmer. Ist Pixel satt, will er nicht mehr zurück
## (1000, 1005). Nach P3 endet der Prolog ohnehin.
func _darf_gehen() -> bool:
	if Zustand.geloest("P3"):
		return true
	var runter := not Zustand.geloest("P1")
	await Spiel.benutzen(bauplan().get("benutzen", []), "Hotspot/" + script_name)
	return runter
