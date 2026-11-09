@tool
extends CQFigur
# Figur „Rotkaeppchen“ (rotkaeppchen). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_rotkaeppchen_state.gd')
var state: Data = load("res://game/characters/rotkaeppchen/character_rotkaeppchen.tres")


# Reden: Gespräch aus dem Bauplan (Ketchup-Erlaubnis bei 0230/0240, dialog_rotkaeppchen.gd).
