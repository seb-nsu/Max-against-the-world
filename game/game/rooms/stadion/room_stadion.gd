@tool
extends CQRaum
# Raum „Stadion“ (stadion). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_stadion_state.gd')

var state: Data = load("res://game/rooms/stadion/room_stadion.tres")
