@tool
extends CQFigur
# Figur „Grimmzahn“ (grimmzahn). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_grimmzahn_state.gd')
var state: Data = load("res://game/characters/grimmzahn/character_grimmzahn.tres")


## Reden: Gespräch aus dem Bauplan (Weg B bei 0390, dialog_grimmzahn.gd).
## Gegenstände im Bergwerk (Weg A): Leuchttrank 0510–0550, Ketchup 0560 bzw. Unterschrift.
func _on_item_used(item: PopochiuInventoryItem) -> void:
	if is_instance_valid(R.current) and R.current.script_name == "Bergwerk" and not Zustand.geloest("R10"):
		match item.script_name:
			"Leuchttrank":
				await Spiel.hingehen(self)
				await R.current.call("licht_bringen")
				return
			"Ketchup":
				await Spiel.hingehen(self)
				if Zustand.ist("W1_GOBLIN_LICHT"):
					await R.current.call("vertrag_unterschreiben")
				else:
					await Spiel.sagen("GRI", "W1_BERG_GRI_0560")
				return
	await super(item)
