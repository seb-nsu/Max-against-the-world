@tool
extends CQDialog
# Gespräch „Maklerin“. Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).
# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.


## Drei Optionen nach Max' Entwicklungsmoment (W1_MAKLERIN_FREI); eine falsche beendet das
## Gespräch (die Maklerin wendet sich ab), die richtige (0470, mit Steckbrief) löst Rätsel 9.
func _nach_option(id: String) -> bool:
	if id == "0470":
		Zustand.loese("R9")
		await Spiel.abgeben("Steckbrief")   # die Maklerin nimmt das Exposé mit (Review Fund 34)
		Spiel.figur_hier("Maklerin", false)
		# Wo sie stand, ist jetzt die Kreidekritzelei frei: Pixel zeigt drauf (Review Fund 14)
		await Spiel.sagen("PIX", "W1_LUFT_PIX_0485")
	return true


## Bei 0470 springt die Maklerin direkt nach ihrer Zeile 0500 mit dem Schirm von der Wolke, nicht
## erst am Ende des Gesprächs (Review Fund 18).
func antworten(id: String) -> Array:
	var liste: Array = super(id)
	if id != "0470":
		return liste
	var out: Array = []
	for a in liste:
		out.append(a)
		if a.zeile == "W1_LUFT_MAK_0500":
			out.append({"sprecher": "_SPRUNG", "zeile": ""})
	return out


func waehlen(id: String) -> bool:
	if id != "0470":
		return await super(id)
	var opt := get_option(id)
	if is_instance_valid(opt):
		opt.used = true
	Telemetrie.dialog_option(script_name, id)
	await Spiel.sagen("MAX", _plan_option(id).get("frage", id))
	for a in await antworten(id):
		if a.sprecher == "_SPRUNG":
			await _sprung()
		else:
			await Spiel.sagen(a.sprecher, a.zeile)
	return not await _nach_option(id)


func _sprung() -> void:
	var mak := C.get_character("Maklerin")
	if is_instance_valid(mak) and mak.is_inside_tree() and mak.has_method("springen_zu"):
		await mak.springen_zu(mak.position + Vector2(70, 40), 30.0, 0.5)
		await mak.ausblenden_und_weg(0.3)
