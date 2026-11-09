@tool
extends CQFigur
# Figur „SchmiedeZiege“ (schmiede_ziege). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_schmiede_ziege_state.gd')
var state: Data = load("res://game/characters/schmiede_ziege/character_schmiede_ziege.tres")


## Max benutzt die Ziege: wie „Kann ich die Ziege haben?“ beim Schmied (0270–0300), solange sie
## noch in der Schmiede wohnt; sonst versteht Max nur Miau (WECH).
func _on_click() -> void:
	if not Zustand.ist("W1_ZIEGE_FOLGT") and room.has_character("Schmied"):
		await Spiel.hingehen(self)
		var d = D.get_instance("Schmied")
		if is_instance_valid(d):
			d.build_options()
		if is_instance_valid(d) and d.get_option("0270"):
			d.get_option("0270").used = true
		await Spiel.szene([
			Spiel.z("MAX", "W1_SCHM_MAX_0270"),
			Spiel.z("SCH", "W1_SCHM_SCH_0280"),
			Spiel.z("ZIE", "W1_SCHM_ZIE_0290"),
			Spiel.z("PIX", "W1_SCHM_PIX_0300"),
		])
		Zustand.setze("W1_ZIEGE_FOLGT")
		room._zustand_anwenden()
		return
	await super()


## Krug: Melken (Rätsel 6a), Thunfischdose: 0500.
func _on_item_used(item: PopochiuInventoryItem) -> void:
	match item.script_name:
		"Krug":
			await Spiel.hingehen(self)
			await melken()
		"Thunfischdose":
			await Spiel.hingehen(self)
			await Spiel.sagen("MAX", "W1_SCHM_MAX_0500")
		_:
			await super(item)


## Melken erst nach Alwins Rezept (0430 vorher), einmal und nie wieder (0440–0480, dann 0490).
func melken() -> void:
	if not Zustand.ist("W1_REZEPT_BEKANNT"):
		await Spiel.sagen("MAX", "W1_SCHM_MAX_0430")
		return
	if Zustand.ist("W1_MELK_SCHWUR"):
		await Spiel.sagen("MAX", "W1_SCHM_MAX_0490")
		return
	var schritte := [
		Spiel.z("MAX", "W1_SCHM_MAX_0440"),
		Spiel.z("ZIE", "W1_SCHM_ZIE_0450"),
		Zustand.setze.bind("W1_MELK_SCHWUR", true),
		Spiel.z("MAX", "W1_SCHM_MAX_0460"),
		Spiel.z("PIX", "W1_SCHM_PIX_0470"),
	]
	if is_instance_valid(room) and room.has_character("Schmied"):
		schritte.append(Spiel.z("SCH", "W1_SCHM_SCH_0480"))
	await Spiel.szene(schritte)
	Zustand.setze("W1_MELK_SCHWUR")
