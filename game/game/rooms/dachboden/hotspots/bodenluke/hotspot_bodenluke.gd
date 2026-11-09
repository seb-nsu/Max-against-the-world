@tool
extends CQAusgang
# Hotspot „Bodenluke“ (bodenluke) im Raum Dachboden. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Führt nach: treppenhaus. Gehen und Raumwechsel macht CQAusgang.
# Gesperrt? _darf_gehen() überschreiben.


## Vor P3 will Max nicht zurück (skript/prolog.md, 1000). Nach P3 endet der Prolog ohnehin.
func _darf_gehen() -> bool:
	if Zustand.geloest("P3"):
		return true
	await Spiel.sagen("MAX", "P0_DACH_MAX_1000")
	return false
