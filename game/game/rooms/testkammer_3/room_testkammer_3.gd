@tool
extends CQRaum
# Raum „Testkammer3“ (testkammer_3). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_testkammer_3_state.gd')

var state: Data = load("res://game/rooms/testkammer_3/room_testkammer_3.tres")
