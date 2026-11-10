@tool
extends CQRaum
# Raum „Kern“ (kern). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_kern_state.gd')

var state: Data = load("res://game/rooms/kern/room_kern.tres")
