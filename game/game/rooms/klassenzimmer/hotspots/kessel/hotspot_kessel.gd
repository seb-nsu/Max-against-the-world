@tool
extends CQHotspot
# Hotspot „Kessel“ (kessel) im Raum Klassenzimmer. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.
# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.


## Rätsel 6: Ei, Ziegenmilch und Leuchtpilz in beliebiger Reihenfolge (0510–0540, nach der
## dritten 0580), dann eine Flasche aus dem Regal: Flasche 3 ist richtig (0770–0850), jede
## andere macht Max kurz zum Pilz (0710–0760) und steht danach wieder im Regal.
const ZUTATEN := {
	"Ei": ["W1_KESSEL_EI", "W1_HOGG_MAX_0510"],
	"Krug": ["W1_KESSEL_MILCH", "W1_HOGG_MAX_0520"],
	"Leuchtpilz": ["W1_KESSEL_PILZ", "W1_HOGG_MAX_0540"],
}
const RICHTIGE_FLASCHE := 3


func zutaten_drin() -> bool:
	return ZUTATEN.values().all(func(z): return Zustand.ist(z[0]))


func _on_item_used(item: PopochiuInventoryItem) -> void:
	var sn := item.script_name
	if ZUTATEN.has(sn) and not (sn == "Krug" and item.call("zustand") != "mit_ziegenmilch"):
		await Spiel.hingehen(self)
		await zutat(sn)
		return
	if sn == "Flasche" and not Zustand.geloest("R6"):
		await Spiel.hingehen(self)
		if not zutaten_drin():
			await Spiel.sagen("MAX", "W1_HOGG_MAX_0590")
		elif int(Zustand.wert("W1_FLASCHE", 0)) == RICHTIGE_FLASCHE:
			await bestanden()
		else:
			await falsche_flasche()
		return
	await super(item)


func zutat(sn: String) -> void:
	var z: Array = ZUTATEN[sn]
	var e := Spiel.gegenstand_zeile(bauplan().get("gegenstand_auf", []), Bauplan.gegenstand(sn).id)
	await Spiel.sagen_eintrag(e if not e.is_empty() else {sprecher = "MAX", zeile = z[1]})
	await Spiel.abgeben(sn)
	Zustand.setze(z[0])
	if zutaten_drin():
		Zustand.loese("R6a")
		await Spiel.sagen("ALW", "W1_HOGG_ALW_0580")


func falsche_flasche() -> void:
	var vier := int(Zustand.wert("W1_FLASCHE", 0)) == 4
	var schritte := [
		Spiel.z("MAX", "W1_HOGG_MAX_0710"),
		Spiel.z("MAX", "W1_HOGG_MAX_0720"),
		Spiel.z("TOA", "W1_HOGG_TOA_0730"),
		Spiel.z("PIX", "W1_HOGG_PIX_0740"),
		Spiel.z("ALW", "W1_HOGG_ALW_0750"),
	]
	if vier:
		schritte.append(Spiel.z("PIX", "W1_HOGG_PIX_0760"))
	await Spiel.szene(schritte)
	await flasche_zurueck()


func flasche_zurueck() -> void:
	await Spiel.abgeben("Flasche")
	Zustand.setze_wert("W1_FLASCHE", 0)


func bestanden() -> void:
	await Spiel.szene([
		Spiel.z("MAX", "W1_HOGG_MAX_0770"),
		Spiel.z("PIX", "W1_HOGG_PIX_0780"),
		Spiel.z("NAR", "W1_HOGG_NAR_0790"),
		Spiel.z("ALW", "W1_HOGG_ALW_0800"),
		_r6b_setzen,
		Spiel.z("MAX", "W1_HOGG_MAX_0810"),
		Spiel.z("ALW", "W1_HOGG_ALW_0820"),
		Spiel.nahansicht_zeigen.bind("zeugnis"),
		Spiel.z("MAX", "W1_HOGG_MAX_0830"),
		Spiel.z("PIX", "W1_HOGG_PIX_0840"),
		Spiel.z("ALW", "W1_HOGG_ALW_0850"),
	])
	await _r6b_setzen()


func _r6b_setzen() -> void:
	if Zustand.geloest("R6b"):
		return
	await flasche_zurueck()
	await Spiel.geben("Leuchttrank")
	await Spiel.geben("Zeugnis")
	Zustand.loese("R6b")
