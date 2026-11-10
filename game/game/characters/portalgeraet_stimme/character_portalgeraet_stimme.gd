@tool
extends CQFigur
# Figur „PortalgeraetStimme“ (portalgeraet_stimme). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_portalgeraet_stimme_state.gd')
var state: Data = load("res://game/characters/portalgeraet_stimme/character_portalgeraet_stimme.tres")
