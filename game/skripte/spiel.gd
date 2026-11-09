extends Node
## Autoload „Spiel“: gemeinsame Abläufe für alle Räume.
##
## - sagen(): jede Zeile über ihre Zeilen-ID aus texte.csv, Kaskaden (_2, _3) als Folgeblasen
## - szene(): Zwischensequenz (mit Esc überspringbar), merkt Speicherwünsche vor
## - ansehen/hingehen/nehmen/ersatz: Standardverhalten der Basisklassen (CQHotspot …)
## - Figurenwechsel Max ↔ Pixel (Tab oder Porträt), Pixel trägt nur einen Gegenstand
## - Zurufe nach 45 Sekunden ohne Eingabe, Nahansicht, Notizbuch, Meldungen
##
## Testmodus (tests/): Zeilen werden nur protokolliert, Wege nicht gelaufen, Überlagerungen
## nicht gezeigt. So läuft der Lösungspfad headless ohne Mausklicks durch.

signal zeile_gesagt(schluessel: String)
signal prolog_beendet

## Sprecherkürzel der Welt-Tabellen → Popochiu-Figur
const KUERZEL := {"MAX": "Max", "PIX": "Pixel", "OPA": "Opa"}
## Zurufe nach so vielen Sekunden ohne Eingabe (skript/prolog.md, Zurufe)
const ZURUF_NACH := 45.0
const HUD := preload("res://oberflaeche/hud.tscn")
const NAHANSICHT := preload("res://oberflaeche/nahansicht.tscn")
const NOTIZBUCH := preload("res://oberflaeche/notizbuch.tscn")

var testmodus := false
## Alle gesagten Sprechblasen-Schlüssel in Reihenfolge (für Tests und Telemetrie)
var protokoll: Array[String] = []
## Zähler laufender Szenen, Gespräche und Überlagerungen (Speichern wartet darauf)
var in_szene := 0
## Prolog: Pixel ist noch keine Spielfigur, sein Porträt lässt sich aber nach P1 wie ein
## Gegenstand auf Dinge anwenden (skript/prolog.md, P0_DACH_PIX_1120)
var pixel_als_gegenstand := false
## Raum, aus dem die Figur gerade kommt (für den Ankunfts-Marker „Von<Raum>“)
var herkunft_raum := ""

var hud: CanvasLayer
var _letzte_ersatz := {}
var _letzter_zuruf := ""
var _ruhe := 0.0


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	TranslationServer.set_locale("de")
	hud = HUD.instantiate()
	add_child(hud)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton or event is InputEventKey:
		_ruhe = 0.0


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cq_figur_wechseln"):
		get_viewport().set_input_as_handled()
		figur_wechseln()
	elif event.is_action_pressed("cq_notizbuch") and OS.is_debug_build():
		# Nur zum Testen: Im Spiel öffnet sich das Notizbuch aus dem Inventar.
		get_viewport().set_input_as_handled()
		notizbuch_oeffnen()


func _process(delta: float) -> void:
	if testmodus or not E.in_room or E.playing_queue or in_szene > 0 \
			or is_instance_valid(D.current_dialog):
		_ruhe = 0.0
		return
	_ruhe += delta
	if _ruhe >= ZURUF_NACH:
		_ruhe = 0.0
		_zuruf()


#region Sprechen ###################################################################################
func figur(kuerzel: String) -> PopochiuCharacter:
	return C.get_character(KUERZEL.get(kuerzel, ""))


func kuerzel_von(c: PopochiuCharacter) -> String:
	for k in KUERZEL:
		if KUERZEL[k] == c.script_name:
			return k
	return "MAX"


## Sprechblasen einer Zeile: die ID selbst und Kaskaden-Folgeblasen _2, _3 …
func blasen(zeile: String) -> Array[String]:
	var out: Array[String] = [zeile]
	var i := 2
	while tr("%s_%d" % [zeile, i]) != "%s_%d" % [zeile, i]:
		out.append("%s_%d" % [zeile, i])
		i += 1
	return out


## Lässt die Figur mit dem Kürzel die Zeile sagen (Popochiu übersetzt die ID selbst).
## NAR-Zeilen sind Regie ohne Text: es gibt nur eine kurze Pause für die Animation.
func sagen(kuerzel: String, zeile: String) -> void:
	if tr(zeile) == zeile:
		push_error("Zeile %s fehlt in texte.csv" % zeile)
	for b in blasen(zeile):
		protokoll.append(b)
		zeile_gesagt.emit(b)
		if testmodus:
			continue
		if kuerzel == "NAR":
			await E.wait(1.0)
			continue
		var c := figur(kuerzel)
		if not is_instance_valid(c):
			await G.show_system_text(b)
			continue
		var gast := not c.is_inside_tree() and is_instance_valid(R.current)
		if gast:
			_stimme_aus_dem_off(c, true)
		await c.say(b)
		if gast:
			_stimme_aus_dem_off(c, false)
	if testmodus:
		await get_tree().process_frame


## Kurzform für Szenen: Spiel.z("OPA", "P0_DACH_OPA_0010")
func z(kuerzel: String, zeile: String) -> Callable:
	return func(): await sagen(kuerzel, zeile)


## Spricht eine Figur, die nicht im Raum steht (Opa „von oben“ im Wohnzimmer), wird sie
## unsichtbar oben in den Raum gestellt, damit die Sprechblase von dort kommt.
func _stimme_aus_dem_off(c: PopochiuCharacter, an: bool) -> void:
	if an:
		R.current.add_character(c)
		c.position = Vector2(E.width / 2.0, 70)
		c.modulate.a = 0.0
		c.clickable = false
	else:
		c.modulate.a = 1.0
		c.clickable = true
		R.current.remove_character(c)


## Eine Zwischensequenz: Liste von Callables (Spiel.z(...) oder eigene Funktionen).
## Mit Esc überspringbar (Popochiu E.cutscene), Speichern wartet bis zum Ende.
func szene(schritte: Array) -> void:
	in_szene += 1
	if testmodus:
		for s in schritte:
			await s.call()
	else:
		await E.cutscene(schritte)
	in_szene -= 1


## Zufällige Ersatzzeile der aktiven Figur, nie zweimal hintereinander dieselbe.
func ersatz(kuerzel := "") -> void:
	if kuerzel.is_empty():
		kuerzel = kuerzel_von(C.player) if is_instance_valid(C.player) else "MAX"
	var pool: Array = Bauplan.ersatz.get(kuerzel, [])
	if pool.is_empty():
		return
	var wahl: String = pool.pick_random()
	while pool.size() > 1 and wahl == _letzte_ersatz.get(kuerzel, ""):
		wahl = pool.pick_random()
	_letzte_ersatz[kuerzel] = wahl
	await sagen(kuerzel, wahl)


#endregion

#region Standardverhalten ##########################################################################
## Bedingungen aus dem Bauplan: [{art: "nach"/"vor", raetsel: "P1"}]
func bedingung_ok(bedingungen: Array) -> bool:
	for b in bedingungen:
		var g: bool = Zustand.geloest(b.raetsel)
		if (b.art == "nach" and not g) or (b.art == "vor" and g):
			return false
	return true


## Wählt aus den Ansehen-Zeilen eines Objekts: erfüllte Bedingung, beim n-ten Ansehen die
## Zeile mit dem größten „mal“ ≤ n. Leeres Dictionary, wenn keine passt.
func ansehen_waehlen(eintraege: Array, mal: int) -> Dictionary:
	var beste := {}
	for e in eintraege:
		if not bedingung_ok(e.get("bedingung", [])):
			continue
		var m := int(e.get("mal", 1))
		if m <= mal and (beste.is_empty() or m >= int(beste.get("mal", 1))):
			beste = e
	return beste


## Ansehen (Rechtsklick): Zeile aus dem Bauplan oder Ersatzzeile. Liefert die gesagte Zeile.
func ansehen(eintraege: Array, mal: int) -> String:
	var e := ansehen_waehlen(eintraege, mal)
	if e.is_empty():
		await ersatz()
		return ""
	await sagen(e.sprecher, e.zeile)
	return e.zeile


func hingehen(ziel: PopochiuClickable) -> void:
	if testmodus or not is_instance_valid(C.player) or not C.player.is_inside_tree():
		return
	var punkt := ziel.to_global(ziel.walk_to_point)
	if R.current.get_navigation_path(C.player.global_position, punkt).is_empty():
		# Ohne Weg bliebe walk_to() hängen (Popochiu 2.2.1 wartet dann ewig): nicht laufen.
		push_warning("Kein Weg von %s nach %s (%s)" % [C.player.global_position, punkt, ziel.name])
		return
	await C.player.walk_to(punkt)


## Nehmen eines Props, das für einen Gegenstand steht (Bauplan: „nehmen“, „gegenstand“).
func nehmen(prop: PopochiuProp, daten: Dictionary) -> void:
	await hingehen(prop)
	if not kann_aufnehmen(C.player):
		await ersatz()
		return
	if daten.get("nehmen"):
		await sagen(daten.nehmen.sprecher, daten.nehmen.zeile)
	var item := I.get_item_instance(Bauplan.gegenstand_script_name(daten.gegenstand))
	prop.hide()
	await item.add()
	Hinweise.objekt_beruehrt(daten.gegenstand)


## Raumwechsel über einen Ausgang. Die Ankunft steht im Marker „Von<Herkunft>“.
func raum_wechseln(ziel_raum_id: String) -> void:
	var sn := Bauplan.raum_script_name(ziel_raum_id)
	if sn.is_empty():
		push_error("Raum %s fehlt im Bauplan" % ziel_raum_id)
		return
	herkunft_raum = R.current.script_name if is_instance_valid(R.current) else ""
	await R.goto_room(sn)


#endregion

#region Figuren ####################################################################################
## Wechsel ist erlaubt, wenn Pixel im Abschnitt spielbar ist (Welt-Tabelle) und im Raum steht.
## Im Prolog ist er es nicht (raetsel/prolog-und-welt-1.md: Wechsel erst ab Welt 1).
func wechsel_moeglich() -> bool:
	if not Bauplan.figur_spielbar(Zustand.abschnitt, "pixel"):
		return false
	return is_instance_valid(C.Pixel) and C.Pixel.is_inside_tree() \
		and is_instance_valid(C.Max) and C.Max.is_inside_tree()


func figur_wechseln() -> bool:
	if not wechsel_moeglich() or in_szene > 0 or E.playing_queue:
		return false
	I.active = null
	C.player = C.Pixel if C.player == C.Max else C.Max
	return true


## Pixel trägt nur einen kleinen Gegenstand im Maul.
func kann_aufnehmen(c: PopochiuCharacter) -> bool:
	if is_instance_valid(c) and c.script_name == "Pixel":
		return c.inventory.size() < 1
	return true


## Klick auf Pixels Porträt: Wechsel, oder im Prolog nach P1 Pixel „als Gegenstand“.
func pixel_portraet_geklickt() -> void:
	if figur_wechseln():
		return
	if Zustand.abschnitt == "prolog" and Zustand.geloest("P1"):
		pixel_als_gegenstand = not pixel_als_gegenstand
		I.active = null


#endregion

#region Überlagerungen und Meldungen ###############################################################
func nahansicht_zeigen(id: String) -> void:
	Zustand.nahansicht_gesehen(id)
	if testmodus:
		return
	in_szene += 1
	var n := NAHANSICHT.instantiate()
	add_child(n)
	n.zeigen(Bauplan.nahansicht(id))
	await n.geschlossen
	n.queue_free()
	in_szene -= 1


func notizbuch_oeffnen() -> void:
	if testmodus or has_node("Notizbuch"):
		return
	in_szene += 1
	var n := NOTIZBUCH.instantiate()
	n.name = "Notizbuch"
	add_child(n)
	await n.geschlossen
	n.queue_free()
	in_szene -= 1


## Kurze Meldung unten im Bild (Schlüssel aus ui.csv).
func melden(schluessel: String) -> void:
	if is_instance_valid(hud):
		hud.melden(tr(schluessel))


func _zuruf() -> void:
	var raum := Bauplan.raum(R.current.script_name)
	var moeglich := []
	for zr in raum.get("zurufe", []):
		if bedingung_ok(zr.get("bedingung", [])) and _bedingung_text_ok(zr.get("bedingung_text", "")):
			moeglich.append(zr)
	if moeglich.size() > 1:
		moeglich = moeglich.filter(func(zr): return zr.zeile != _letzter_zuruf)
	if moeglich.is_empty():
		return
	var zr: Dictionary = moeglich.pick_random()
	_letzter_zuruf = zr.zeile
	await sagen(zr.sprecher, zr.zeile)


## Bedingungen, die das Skript in Worten nennt (nicht „vor/nach Rätsel“).
func _bedingung_text_ok(text: String) -> bool:
	match text:
		"":
			return true
		"vor dem Dachboden":
			return not Zustand.war_in("dachboden")
	return false


#endregion

#region Prolog-Ende ################################################################################
## Ende des Prologs: Max wird in den Fernseher gesaugt (Platzhalter-Übergang).
func prolog_beenden() -> void:
	if not testmodus:
		# Platzhalter fürs Einsaugen: Popochius Übergang „tunnel“ zieht ins Bild hinein
		await T.play_transition("tunnel", 1.5, T.PLAY_MODE.IN)
		hud.ende_zeigen(tr("UI_PROLOG_ENDE"))
	prolog_beendet.emit()


#endregion
