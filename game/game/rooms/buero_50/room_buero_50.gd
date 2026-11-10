@tool
extends CQRaum
# Raum „Buero50“ (buero_50). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_buero_50_state.gd')

var state: Data = load("res://game/rooms/buero_50/room_buero_50.tres")
