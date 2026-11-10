@tool
extends CQRaum
# Raum „Testbild“ (testbild). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_testbild_state.gd')

var state: Data = load("res://game/rooms/testbild/room_testbild.tres")
