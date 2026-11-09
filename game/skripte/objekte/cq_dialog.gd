@tool
class_name CQDialog
extends PopochiuDialog
## Basisklasse der Gespräche: Optionen und Antworten aus dem Bauplan (Skript, Abschnitt
## „Gespräche“). Max sagt die Frage, die Figur antwortet; „beendet das Gespräch“ beendet es.
## Bedingungen („nach P1“, „nur vor P1“) blenden Optionen aus. Gewählte Optionen werden grau
## (Popochiu speichert sie mit dem Dialog).


func bauplan() -> Dictionary:
	return Bauplan.dialog(script_name)


func _on_build_options(existing: Array[PopochiuDialogOption]) -> Array[PopochiuDialogOption]:
	var out: Array[PopochiuDialogOption] = existing.duplicate()
	for o in bauplan().get("optionen", []):
		if not out.any(func(x): return x.id == o.id):
			out.append(create_option(o.id, {text = o.frage}))
	return out


func _on_start() -> void:
	sichtbarkeit_anpassen()
	await E.get_tree().process_frame


func sichtbarkeit_anpassen() -> void:
	build_options()
	for opt in options:
		opt.visible = option_sichtbar(opt.id)


## Ob eine Option gerade angeboten wird. Standard: Bedingung aus dem Bauplan.
func option_sichtbar(id: String) -> bool:
	var o := _plan_option(id)
	if o.is_empty():
		return true
	return Spiel.bedingung_ok(o.get("bedingung", []))


func _option_selected(opt: PopochiuDialogOption) -> void:
	var weiter := await waehlen(opt.id)
	if weiter:
		sichtbarkeit_anpassen()
		_show_options()
	else:
		stop()


## Führt eine Option aus (auch für Tests ohne Menü). Liefert false, wenn das Gespräch endet.
func waehlen(id: String) -> bool:
	var o := _plan_option(id)
	var opt := get_option(id)
	if is_instance_valid(opt):
		opt.used = true
	await Spiel.sagen("MAX", o.get("frage", id))
	for a in await antworten(id):
		await Spiel.sagen(a.sprecher, a.zeile)
	return not o.get("beendet", false)


## Antwortzeilen einer Option als [{sprecher, zeile}]. Sonderfälle hier überschreiben.
func antworten(id: String) -> Array:
	return _plan_option(id).get("antworten", [])


func _plan_option(id: String) -> Dictionary:
	for o in bauplan().get("optionen", []):
		if o.id == id:
			return o
	return {}
