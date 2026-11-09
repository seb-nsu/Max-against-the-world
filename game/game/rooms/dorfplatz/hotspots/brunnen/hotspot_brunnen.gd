@tool
extends CQHotspot
# Hotspot „Brunnen“ (brunnen) im Raum Dorfplatz. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Eimer füllen (0360/0370), Rätsel 5: Goldmünze und drei Wünsche (0720–0880).

## Die drei Wünsche (Max' Zeilen sind zugleich die Auswahltexte)
const WUENSCHE := ["W1_DORF_MAX_0740", "W1_DORF_MAX_0790", "W1_DORF_MAX_0840"]


func _on_click() -> void:
	await Spiel.hingehen(self)
	await Spiel.sagen("BRU", "W1_DORF_BRU_0710")


func _on_item_used(item: PopochiuInventoryItem) -> void:
	match item.script_name:
		"Eimer":
			await Spiel.hingehen(self)
			if Zustand.wert("W1_EIMER", "leer") == "mit_wasser":
				await Spiel.ersatz()
				return
			await Spiel.sagen_eintrag(bauplan().gegenstand_auf[0])
			Zustand.setze_wert("W1_EIMER", "mit_wasser")
		"Goldmuenze":
			await Spiel.hingehen(self)
			await wuenschen()
		"Zauberbohne":
			await Spiel.hingehen(self)
			await Spiel.sagen("MAX", "W1_DORF_MAX_1130")
		_:
			await super(item)


## Münze rein, ein Wunsch. Falsche Wünsche: Münze zurück (0780, 0830), richtig: Zauberbohne.
func wuenschen() -> void:
	await Spiel.sagen("MAX", "W1_DORF_MAX_0720")
	await Spiel.sagen("BRU", "W1_DORF_BRU_0730")
	var wahl := await Spiel.auswahl(WUENSCHE)
	match wahl:
		0:
			await Spiel.szene([
				Spiel.z("MAX", "W1_DORF_MAX_0740"),
				Spiel.z("BRU", "W1_DORF_BRU_0750"),
				Spiel.z("MAX", "W1_DORF_MAX_0760"),
				Spiel.z("PIX", "W1_DORF_PIX_0770"),
				Spiel.z("BRU", "W1_DORF_BRU_0780"),
			])
		1:
			await Spiel.szene([
				Spiel.z("MAX", "W1_DORF_MAX_0790"),
				Spiel.z("BRU", "W1_DORF_BRU_0800"),
				Spiel.z("PIX", "W1_DORF_PIX_0810"),
				Spiel.z("MAX", "W1_DORF_MAX_0820"),
				Spiel.z("BRU", "W1_DORF_BRU_0830"),
			])
		2:
			await Spiel.szene([
				Spiel.z("MAX", "W1_DORF_MAX_0840"),
				Spiel.z("BRU", "W1_DORF_BRU_0850"),
				_r5_setzen,
				Spiel.z("MAX", "W1_DORF_MAX_0860"),
				Spiel.z("PIX", "W1_DORF_PIX_0870"),
				Spiel.z("TOA", "W1_DORF_TOA_0880"),
			])
			await _r5_setzen()


func _r5_setzen() -> void:
	if Zustand.geloest("R5"):
		return
	await Spiel.abgeben("Goldmuenze")
	await Spiel.geben("Zauberbohne")
	Zustand.loese("R5")
