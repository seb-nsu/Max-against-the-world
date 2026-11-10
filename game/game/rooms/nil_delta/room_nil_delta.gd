@tool
extends CQRaum
# Raum „NilDelta“ (nil_delta). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_nil_delta_state.gd')

var state: Data = load("res://game/rooms/nil_delta/room_nil_delta.tres")
