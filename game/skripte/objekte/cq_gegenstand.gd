@tool
class_name CQGegenstand
extends PopochiuInventoryItem
## Basisklasse der Inventar-Gegenstände: Linksklick wählt ihn aus (dann Ziel anklicken),
## Rechtsklick sieht ihn an, Gegenstand auf Gegenstand kombiniert in beide Richtungen.
## Zustände (Welt-Tabelle „zustaende“) leitet das Skript des Gegenstands in zustand() ab;
## Bild, Name und Ansehen-Zeile (Bauplan, je Zustand) folgen daraus.


func bauplan() -> Dictionary:
	return Bauplan.gegenstand(script_name)


## Aktueller Zustand, z. B. „antenne“. Standard: der erste aus der Welt-Tabelle.
func zustand() -> String:
	var z: Array = bauplan().get("zustaende", [])
	return z[0] if not z.is_empty() else ""


## Bild und Namen an den Zustand anpassen (aufrufen, wenn sich der Zustand ändert).
func aussehen_anpassen() -> void:
	var b := bauplan()
	var icons: Dictionary = b.get("icons", {})
	var z := zustand()
	var pfad: String = icons.get(z, b.get("icon", ""))
	if not pfad.is_empty() and ResourceLoader.exists(pfad):
		texture = load(pfad)
	var key := name_key()
	if not key.is_empty():
		description = key


## Name-Schlüssel (ui.csv) für den aktuellen Zustand. Standard: der aus dem Bauplan.
func name_key() -> String:
	return bauplan().get("name_key", "")


func _ready() -> void:
	super()
	if not Engine.is_editor_hint():
		aussehen_anpassen.call_deferred()
		Zustand.geaendert.connect(func(_n): aussehen_anpassen())


func _on_click() -> void:
	set_active()


func on_right_click() -> void:
	Telemetrie.aktion_beginnen(bauplan().get("id", script_name.to_snake_case()), "ansehen")
	await super()
	Telemetrie.aktion_beenden()


func on_item_used(item: PopochiuInventoryItem) -> void:
	Telemetrie.aktion_beginnen(bauplan().get("id", script_name.to_snake_case()), "gegenstand",
		Telemetrie.gegenstand_id(item))
	await super(item)
	Telemetrie.aktion_beenden()


func _on_right_click() -> void:
	Hinweise.objekt_beruehrt(bauplan().get("id", ""))
	await _ansehen()


## Standard: Ansehen-Zeile aus dem Bauplan (je Zustand), sonst Ersatzzeile.
func _ansehen() -> void:
	await Spiel.ansehen(bauplan().get("ansehen", []), "Gegenstand/" + script_name, zustand())


func _on_middle_click() -> void:
	pass


func _on_item_used(item: PopochiuInventoryItem) -> void:
	if item == self:
		# Gegenstand auf sich selbst = „Benutzen im Inventar“ (nur Zusatzreaktion, 05 UI)
		I.active = null
		await _benutzen()
		return
	if item.script_name == Spiel.PIXEL_FELD:
		I.active = null
		await Spiel.ersatz("PIX")
		return
	Hinweise.objekt_beruehrt(bauplan().get("id", ""))
	if await _kombinieren(item):
		return
	if item.has_method("_kombinieren") and await item._kombinieren(self):
		return
	var e := Spiel.gegenstand_zeile(bauplan().get("kombinieren", []),
		Bauplan.gegenstand(item.script_name).get("id", ""))
	if not e.is_empty() and e.get("zustand", zustand()) == zustand():
		await Spiel.sagen_eintrag(e)
		return
	await Spiel.ersatz()


## Benutzen im Inventar. Standard: Benutzen-Zeile aus dem Bauplan (je Zustand), sonst nichts.
func _benutzen() -> void:
	for e in bauplan().get("benutzen", []):
		if Spiel.eintrag_passt(e, zustand()):
			await Spiel.sagen_eintrag(e)
			return


## Diesen Gegenstand mit item kombinieren. true, wenn es eine Lösung oder eigene Zeile gab.
func _kombinieren(_item: PopochiuInventoryItem) -> bool:
	return false
