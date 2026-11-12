@tool
extends CQGegenstand
# Gegenstand „Thunfischdose“ (thunfischdose). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.

const Data := preload('inventory_item_thunfischdose_state.gd')
var state: Data = load("res://game/inventory_items/thunfischdose/inventory_item_thunfischdose.tres")


## Zu, bis Max sie mit dem Dosenöffner öffnet (0280). Offen, bis P1 gelöst ist (Pixel frisst aus
## Opas Teetasse); danach ist sie leer.
func zustand() -> String:
	if Zustand.abschnitt != "prolog" or Zustand.geloest("P1"):
		return "leer"
	return "offen" if Zustand.ist("P0_DOSE_OFFEN") else "zu"


## Dosenöffner mit Thunfischdose: Die Dose geht auf, in jedem Raum. Pixel wacht davon noch
## nicht auf. Die offene Dose auf Pixel weckt ihn, aber er frisst nicht aus dem Blech
## (character_pixel.gd). Offene Dose mit Teetasse: Der Thunfisch kommt in die Tasse (0072),
## aber erst, wenn Pixel die Dose abgelehnt hat (vorher 0070).
func _kombinieren(item: PopochiuInventoryItem) -> bool:
	if item.script_name == "Teetasse":
		return await _in_die_tasse()
	if item.script_name != "Dosenoeffner":
		return false
	if zustand() != "zu":
		await Spiel.ersatz()
		return true
	await Spiel.sagen("MAX", "P0_DACH_MAX_0280")
	Zustand.setze("P0_DOSE_OFFEN")
	await Spiel.sagen("MAX", "P0_DACH_MAX_0282")
	return true


func _in_die_tasse() -> bool:
	if zustand() != "offen" or Zustand.ist("P0_TASSE_GEFUELLT"):
		return false  # geschlossene oder leere Dose, volle Tasse: Ersatzzeile
	if not Zustand.ist("P0_PIXEL_GEWECKT"):
		await Spiel.sagen("MAX", "P0_INV_MAX_0070")
		return true
	await Spiel.sagen("MAX", "P0_INV_MAX_0072")
	Zustand.setze("P0_TASSE_GEFUELLT")
	var tasse: PopochiuInventoryItem = I.get_item_instance("Teetasse")
	if tasse is CQGegenstand:
		tasse.aussehen_anpassen()
	return true
