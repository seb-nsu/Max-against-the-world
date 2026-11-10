@tool
extends CQFigur
# Figur „SphinxFigur“ (sphinx_figur). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_sphinx_figur_state.gd')
var state: Data = load("res://game/characters/sphinx_figur/character_sphinx_figur.tres")
