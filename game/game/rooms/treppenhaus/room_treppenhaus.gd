@tool
extends CQRaum
# Raum „Treppenhaus“ (treppenhaus). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_treppenhaus_state.gd')

var state: Data = load("res://game/rooms/treppenhaus/room_treppenhaus.tres")


## Stufen-Versatz (CQRaum.stufen_anwenden) beim Verlassen zurücknehmen, die Figuren gehen mit.
func _on_room_exited() -> void:
	super()
	for c in get_characters():
		var bild := c.get_node_or_null("Sprite2D") as Node2D
		if bild:
			bild.position.y = 0.0
		if "walk_speed_override" in c:
			c.walk_speed_override = 0.0
		c.animation_prefix = ""
