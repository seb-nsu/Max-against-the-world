@tool
extends CQRaum
# Raum „Gluecksrad“ (gluecksrad). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_gluecksrad_state.gd')

var state: Data = load("res://game/rooms/gluecksrad/room_gluecksrad.tres")
