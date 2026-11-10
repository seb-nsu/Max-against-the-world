@tool
class_name CQRaum
extends PopochiuRoom
## Basisklasse der Räume.
##
## Beim Betreten: Raum als besucht merken, Spieler an den Ankunfts-Marker „Von<Herkunft>“
## stellen, ab Welt 1 die zweite Spielfigur danebenstellen, den Zustand anwenden
## (_zustand_anwenden(): Props, Ausgänge, Figuren), nach dem Übergang automatisch speichern
## und die eigene Szene des Raums starten (_nach_uebergang()). Nach dem Laden eines Spielstands
## wird nur der Zustand angewendet.


## Regeln eines Abschnitts, die mehrere Räume betreffen (Begleiter). Siehe skripte/welt_1.gd.
const ABSCHNITT_REGELN := {"welt-1": preload("res://skripte/welt_1.gd")}


func bauplan() -> Dictionary:
	return Bauplan.raum(script_name)


func raum_id() -> String:
	return bauplan().get("id", script_name.to_snake_case())


func _on_room_entered() -> void:
	# Der Raum bestimmt den Abschnitt, außer er gehört auch zum aktuellen (Dachboden im
	# Zwischenspiel: Bauplan aus dem Prolog, Welt-Tabelle „finale“).
	var ab := Bauplan.raum_abschnitt(script_name)
	if not ab.is_empty() and not _im_abschnitt(Zustand.abschnitt):
		Zustand.abschnitt = ab
	Klang.raum_musik(raum_id())
	var erster_besuch := not Zustand.war_in(raum_id())
	Telemetrie.raum_betreten(raum_id())
	Zustand.besuche(raum_id())
	if not Spiel.herkunft_raum.is_empty() and has_marker("Von" + Spiel.herkunft_raum):
		C.player.position = get_marker_position("Von" + Spiel.herkunft_raum)
	elif erster_besuch and has_marker("Start"):
		C.player.position = get_marker_position("Start")
	partner_aufstellen(true)
	_zustand_anwenden()
	await _raum_betreten(erster_besuch)
	await Spiel.regel("raum_betreten", self, erster_besuch)
	Spiel.pixel_feld_pruefen()


func _on_room_transition_finished() -> void:
	# Start aus dem Hauptmenü mit „Fortsetzen“ oder „Laden“: gleich den Spielstand laden
	if Spiel.start_platz >= 0:
		var platz := Spiel.start_platz
		Spiel.start_platz = -1
		await Spielstand.laden(platz)
		return
	var war_wechsel := not Spiel.herkunft_raum.is_empty()
	Spiel.herkunft_raum = ""
	if war_wechsel:
		Spielstand.autospeichern()
	if await Spiel.regel("nach_uebergang", self):
		return
	await _nach_uebergang()


func _on_restore_from_savegame() -> void:
	Spiel.herkunft_raum = ""
	Telemetrie.raum_betreten(raum_id())
	Klang.raum_musik(raum_id())
	partner_aufstellen()
	_zustand_anwenden()
	Spiel.pixel_feld_pruefen()
	await Spiel.regel("nach_laden", self)
	await _nach_laden()


func _im_abschnitt(ab: String) -> bool:
	return Bauplan.welten.get(ab, {}).get("raeume", []).any(func(r): return r.id == raum_id())


## Zusätzliche Ansehen-Zeilen eines Objekts (Zwischenspiel auf dem Dachboden); Räume
## überschreiben das. Die Einträge haben die Form des Bauplans ({zeile, sprecher, mal …}) und
## gewinnen bei gleichem „mal“ gegen die Zeilen des Bauplans.
func ansehen_zusatz(_objekt: String) -> Array:
	return []


func has_marker(name: String) -> bool:
	return $Markers.has_node(name)


## Ab Welt 1 (Pixel spielbar) stehen Max und Pixel immer zusammen im Raum: die nicht aktive
## Figur kommt neben die aktive, wenn sie noch nicht hier ist.
## neben_spieler: auch eine schon vorhandene Figur neben die aktive stellen (beim Betreten).
func partner_aufstellen(neben_spieler := false) -> void:
	if not Bauplan.figur_spielbar(Zustand.abschnitt, "pixel") or not is_instance_valid(C.player):
		return
	# get_character legt die Figur an, falls sie in diesem Lauf noch in keinem Raum stand
	# (Spielstand mitten in einer Welt geladen)
	var partner: PopochiuCharacter = C.get_character("Max" if C.player.script_name == "Pixel" else "Pixel")
	if not is_instance_valid(partner):
		return
	# Welt 3: Max in der Simulation, Pixel in der Realität (skripte/welt_3.gd)
	if Spiel.regel_wert("partner_getrennt", self) == true:
		if has_character(partner.script_name):
			Spiel.figur_hier(partner.script_name, false)
		return
	var x := C.player.position.x + (-20.0 if C.player.position.x > width / 2.0 else 20.0)
	var pos := Vector2(x, C.player.position.y)
	if not has_character(partner.script_name):
		Spiel.figur_hier(partner.script_name, true, pos)
	elif neben_spieler:
		partner.position = pos


## Bild, Sichtbarkeit und Positionen aus Schaltern und Werten ableiten (nie speichern).
func _zustand_anwenden() -> void:
	for h in get_hotspots():
		if h is CQAusgang:
			h.sichtbar_anpassen()
	for p in get_props():
		if p is CQProp:
			var g: String = p.bauplan().get("gegenstand", "") if p.bauplan().get("gegenstand") else ""
			if not g.is_empty():
				var sn := Bauplan.gegenstand_script_name(g)
				p.visible = not I.has_item_been_collected(sn)
	var regeln = ABSCHNITT_REGELN.get(Zustand.abschnitt)
	if regeln:
		regeln.figuren_anwenden(self)
	Spiel.regel_wert("zustand_anwenden", self)  # Welt 2 ff.: Begleiter, Figuren, Props


## Vor dem Einblenden (Figuren stellen). erster_besuch: Raum zum ersten Mal betreten.
func _raum_betreten(_erster_besuch: bool) -> void:
	pass


## Nach dem Einblenden: Szenen beim Betreten.
func _nach_uebergang() -> void:
	pass


## Nach dem Laden eines Spielstands.
func _nach_laden() -> void:
	pass
