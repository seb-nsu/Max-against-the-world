@tool
extends CQRaum
# Raum „UnterstadtStrasse“ (unterstadt_strasse). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_unterstadt_strasse_state.gd')

var state: Data = load("res://game/rooms/unterstadt_strasse/room_unterstadt_strasse.tres")
