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
	await einstieg()
	sichtbarkeit_anpassen()
	await E.get_tree().process_frame


## Einstieg („Reden: X, Einstieg“ im Skript): einmal vor dem ersten Menü, wenn seine
## Bedingung gilt. Gemerkt wird er im Zustand (Zähler „Einstieg/<Dialog>“).
func einstieg() -> void:
	var e: Dictionary = bauplan().get("einstieg", {})
	if e.is_empty() or Zustand.angesehen.get("Einstieg/" + script_name, 0) > 0:
		return
	if not Spiel.bedingung_ok(e.get("bedingung", [])):
		return
	if not e.get("bedingung_text", "").is_empty() and not Spiel.bedingung_text_ok(e.bedingung_text):
		return
	Zustand.ansehen_zaehlen("Einstieg/" + script_name)
	for z in e.get("zeilen", []):
		await Spiel.sagen(z.sprecher, z.zeile)
	await Spiel.regel("nach_einstieg", self)


func sichtbarkeit_anpassen() -> void:
	build_options()
	for opt in options:
		opt.visible = option_sichtbar(opt.id)


## Ob eine Option gerade angeboten wird. Standard: Bedingung aus dem Bauplan.
func option_sichtbar(id: String) -> bool:
	var o := _plan_option(id)
	if o.is_empty():
		return true
	# Plauderoptionen verschwinden nach Nutzung, Hinweis- und Rätseloptionen („(bleibt)“ im
	# Skript) bleiben ausgegraut wählbar; „Tschüss“ (beendet) bleibt immer.
	var opt := get_option(id)
	if is_instance_valid(opt) and opt.used and not o.get("bleibt", false) and not o.get("beendet", false):
		return false
	for b in o.get("bedingung", []):
		if b.art == "nach_zeile" and not zeile_gehoert(b.zeile):
			return false
	if not o.get("bedingung_text", "").is_empty() and not Spiel.bedingung_text_ok(o.bedingung_text):
		return false
	var w = Spiel.regel_wert("option_sichtbar", self, id)
	if w != null:
		return bool(w)
	return Spiel.bedingung_ok(o.get("bedingung", []))


## Erschöpft: Außer „Tschüss“ (beendet) wird keine Option mehr angeboten.
func erschoepft() -> bool:
	for o in bauplan().get("optionen", []):
		if not o.get("beendet", false) and option_sichtbar(o.id):
			return false
	return true


## Ob alle Plauderoptionen (weder „(bleibt)“ noch beendend) schon gewählt sind. Ohne
## Plauderoptionen false.
func plauder_erschoepft() -> bool:
	build_options()
	var gab_es := false
	for o in bauplan().get("optionen", []):
		if o.get("bleibt", false) or o.get("beendet", false):
			continue
		gab_es = true
		var opt := get_option(o.id)
		if not (is_instance_valid(opt) and opt.used):
			return false
	return gab_es


## Abschiedszeile bei erschöpftem Gespräch (zwei Zeilen im Wechsel). "" ohne solche Zeilen.
func abschied() -> String:
	var zeilen: Array = bauplan().get("erschoepft", [])
	if zeilen.is_empty():
		return ""
	var n := Zustand.ansehen_zaehlen("Abschied/" + script_name)
	return zeilen[(n - 1) % zeilen.size()].zeile


## Ob die Antwortzeile in diesem Gespräch schon kam (Option mit dieser Antwort gewählt).
func zeile_gehoert(zeile: String) -> bool:
	for o in bauplan().get("optionen", []):
		if o.antworten.any(func(a): return a.zeile == zeile):
			var opt := get_option(o.id)
			return is_instance_valid(opt) and opt.used
	# Zeile außerhalb des Gesprächs (Szene, Welt 4: Wilmas Hinweis bei der Ankunft): die Regeln
	# des Abschnitts wissen, ob sie gefallen ist
	return Spiel.regel_wert("zeile_gehoert", self, zeile) == true


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
	Telemetrie.dialog_option(script_name, id)
	await Spiel.sagen("MAX", o.get("frage", id))
	for a in await antworten(id):
		await Spiel.sagen(a.sprecher, a.zeile)
	var ende: bool = await _nach_option(id)
	return not (o.get("beendet", false) or ende)


## Folgen einer Option (Schalter setzen, Szene). true beendet das Gespräch (die Figur geht).
## Standard: die Regeln des Abschnitts (Spiel.regel „nach_option“).
func _nach_option(id: String) -> bool:
	return await Spiel.regel("nach_option", self, id)


## Antwortzeilen einer Option als [{sprecher, zeile}]. Sonderfälle hier überschreiben.
func antworten(id: String) -> Array:
	return _plan_option(id).get("antworten", [])


func _plan_option(id: String) -> Dictionary:
	for o in bauplan().get("optionen", []):
		if o.id == id:
			return o
	return {}
