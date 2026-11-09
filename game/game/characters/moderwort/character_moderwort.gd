@tool
extends CQFigur
# Figur „Moderwort“ (moderwort). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_moderwort_state.gd')
var state: Data = load("res://game/characters/moderwort/character_moderwort.tres")


## Kein Gespräch im Bauplan: der Thronsaal entscheidet (Option 0350 nach dem Käse).
func _on_click() -> void:
	await Spiel.hingehen(self)
	if is_instance_valid(R.current) and R.current.has_method("moderwort_reden"):
		await R.current.call("moderwort_reden")
		return
	await super()
