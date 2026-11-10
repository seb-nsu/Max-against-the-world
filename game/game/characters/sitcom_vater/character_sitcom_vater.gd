@tool
extends CQFigur
# Figur „SitcomVater“ (sitcom_vater). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_sitcom_vater_state.gd')
var state: Data = load("res://game/characters/sitcom_vater/character_sitcom_vater.tres")
