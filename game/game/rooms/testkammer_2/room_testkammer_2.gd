@tool
extends CQRaum
# Raum „Testkammer2“ (testkammer_2). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_testkammer_2_state.gd')

var state: Data = load("res://game/rooms/testkammer_2/room_testkammer_2.tres")
