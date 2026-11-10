@tool
extends CQRaum
# Raum „Startbuero“ (startbuero). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_startbuero_state.gd')

var state: Data = load("res://game/rooms/startbuero/room_startbuero.tres")
