@tool
class_name CQRaum
extends PopochiuRoom
## Basisklasse der Räume.
##
## Beim Betreten: Raum als besucht merken, Spieler an den Ankunfts-Marker „Von<Herkunft>“
## stellen, den Zustand anwenden (_zustand_anwenden()), nach dem Übergang automatisch speichern
## und die eigene Szene des Raums starten (_nach_uebergang()). Nach dem Laden eines Spielstands
## wird nur der Zustand angewendet.


func bauplan() -> Dictionary:
	return Bauplan.raum(script_name)


func raum_id() -> String:
	return bauplan().get("id", script_name.to_snake_case())


func _on_room_entered() -> void:
	var ab := Bauplan.raum_abschnitt(script_name)
	if not ab.is_empty():
		Zustand.abschnitt = ab
	var erster_besuch := not Zustand.war_in(raum_id())
	Zustand.besuche(raum_id())
	if not Spiel.herkunft_raum.is_empty() and has_marker("Von" + Spiel.herkunft_raum):
		C.player.position = get_marker_position("Von" + Spiel.herkunft_raum)
	elif erster_besuch and has_marker("Start"):
		C.player.position = get_marker_position("Start")
	_zustand_anwenden()
	await _raum_betreten(erster_besuch)


func _on_room_transition_finished() -> void:
	var war_wechsel := not Spiel.herkunft_raum.is_empty()
	Spiel.herkunft_raum = ""
	if war_wechsel:
		Spielstand.autospeichern()
	await _nach_uebergang()


func _on_restore_from_savegame() -> void:
	Spiel.herkunft_raum = ""
	_zustand_anwenden()
	await _nach_laden()


func has_marker(name: String) -> bool:
	return $Markers.has_node(name)


## Bild, Sichtbarkeit und Positionen aus Schaltern und Werten ableiten (nie speichern).
func _zustand_anwenden() -> void:
	for p in get_props():
		if p is CQProp:
			var g: String = p.bauplan().get("gegenstand", "") if p.bauplan().get("gegenstand") else ""
			if not g.is_empty():
				var sn := Bauplan.gegenstand_script_name(g)
				p.visible = not I.has_item_been_collected(sn)


## Vor dem Einblenden (Figuren stellen). erster_besuch: Raum zum ersten Mal betreten.
func _raum_betreten(_erster_besuch: bool) -> void:
	pass


## Nach dem Einblenden: Szenen beim Betreten.
func _nach_uebergang() -> void:
	pass


## Nach dem Laden eines Spielstands.
func _nach_laden() -> void:
	pass
