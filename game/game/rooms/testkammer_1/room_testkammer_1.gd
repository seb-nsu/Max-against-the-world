@tool
extends CQRaum
# Raum „Testkammer1“ (testkammer_1). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_testkammer_1_state.gd')

var state: Data = load("res://game/rooms/testkammer_1/room_testkammer_1.tres")
