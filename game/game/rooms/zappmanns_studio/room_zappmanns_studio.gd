@tool
extends CQRaum
# Raum „ZappmannsStudio“ (zappmanns_studio). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_zappmanns_studio_state.gd')

var state: Data = load("res://game/rooms/zappmanns_studio/room_zappmanns_studio.tres")
