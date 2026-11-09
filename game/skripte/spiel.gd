extends Node
## Autoload „Spiel“: gemeinsame Abläufe für alle Räume.
##
## - sagen(): jede Zeile über ihre Zeilen-ID aus texte.csv, Kaskaden (_2, _3) als Folgeblasen
## - szene(): Zwischensequenz (mit Esc überspringbar), merkt Speicherwünsche vor
## - ansehen/hingehen/nehmen/ersatz: Standardverhalten der Basisklassen (CQHotspot …)
## - Figurenwechsel Max ↔ Pixel (Tab oder Porträt), Pixel-Feld in der Inventarleiste
## - Begleiter: Max und Pixel stehen ab Welt 1 immer zusammen im Raum, dazu Folgefiguren
## - Zurufe nach 45 Sekunden ohne Eingabe, Nahansicht, Notizbuch, Meldungen
##
## Testmodus (tests/): Zeilen werden nur protokolliert, Wege nicht gelaufen, Überlagerungen
## nicht gezeigt. So läuft der Lösungspfad headless ohne Mausklicks durch.

signal zeile_gesagt(schluessel: String)
signal prolog_beendet
signal figur_gewechselt(neu: PopochiuCharacter)

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
## Gegenstand „Pixel-Feld“: Pixel als Gegenstand ganz links in Max' Inventarleiste
## (05-spielsysteme.md, UI), solange Max aktiv und Pixel wach ist
const PIXEL_FELD := "PixelFeld"
## Raum, aus dem die Figur gerade kommt (für den Ankunfts-Marker „Von<Raum>“)
var herkunft_raum := ""

## Vorgegebene Antworten für auswahl() (Tests): Index je Auswahl, der Reihe nach verbraucht
var vorgabe_auswahl: Array = []

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
	var sn: String = KUERZEL.get(kuerzel, Bauplan.figur_zu_kuerzel(kuerzel))
	return C.get_character(sn) if not sn.is_empty() else null


func kuerzel_von(c: PopochiuCharacter) -> String:
	for k in KUERZEL:
		if KUERZEL[k] == c.script_name:
			return k
	var k2 = Bauplan.figur(c.script_name).get("kuerzel")
	return k2 if k2 else "MAX"


func ist_pixel() -> bool:
	return is_instance_valid(C.player) and C.player.script_name == "Pixel"


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
			var quelle := _objekt_im_raum(OBJEKTSTIMMEN.get(kuerzel, ""))
			if is_instance_valid(quelle):
				await _objekt_sagt(kuerzel, quelle, b)
			else:
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


## Sprechende Objekte ohne Figur (welt-1.yaml: Figuren mit groesse_px 0) → Objekt-ID im Raum.
## Die Sprechblase kommt vom Objekt (G16), nicht als Systemtext.
const OBJEKTSTIMMEN := {"BRU": "brunnen", "GRA": "grammophon", "TUE": "geheimtuer", "SPI": "spiegel"}
## Farbe der Objektstimmen (wie Figuren ohne eigene Schriftfarbe, 05-spielsysteme.md)
const OBJEKTSTIMME_FARBE := Color.WHITE
## Je Kürzel eine Stimme; sie bleibt bestehen, weil Popochius Verlauf (History) sie festhält.
var _objektstimmen := {}


func _exit_tree() -> void:
	for s in _objektstimmen.values():
		if is_instance_valid(s) and not s.is_inside_tree():
			s.free()


## Hotspot, Prop oder Ausgang im aktuellen Raum mit dieser Objekt-ID (sonst null).
func _objekt_im_raum(oid: String) -> PopochiuClickable:
	if oid.is_empty() or not is_instance_valid(R.current):
		return null
	for o in R.current.get_hotspots() + R.current.get_props():
		if o.has_method("objekt_id") and o.objekt_id() == oid:
			return o
	return null


## Eine Sprechblase über dem Objekt: eine unsichtbare, nicht klickbare Stimme (Popochius
## Vorlagen-Figur) steht für die Dauer der Blase an der Oberkante des Objekts und „spricht“
## über Popochius Signal (Farbe, Position und Verlauf wie bei Figuren).
func _objekt_sagt(kuerzel: String, quelle: PopochiuClickable, text: String) -> void:
	if E.cutscene_skipped:
		await get_tree().process_frame
		return
	var stimme: PopochiuCharacter = _objektstimmen.get(kuerzel)
	if not is_instance_valid(stimme):
		stimme = load("res://addons/popochiu/engine/objects/character/popochiu_character.tscn").instantiate()
		stimme.script_name = "Objektstimme" + kuerzel.capitalize()
		stimme.description = quelle.description
		stimme.clickable = false
		stimme.modulate.a = 0.0
		stimme.text_color = OBJEKTSTIMME_FARBE
		stimme.dialog_pos = Vector2(0, -4)
		_objektstimmen[kuerzel] = stimme
	var oben := 0.0
	for p in quelle.interaction_polygon:
		oben = minf(oben, p.y)
	R.current.add_child(stimme)
	stimme.global_position = quelle.global_position + Vector2(0, oben)
	C.character_spoke.emit(stimme, E.translate(text))
	await G.dialog_line_finished
	if stimme.get_parent():
		stimme.get_parent().remove_child(stimme)


## Eine Zeile aus dem Bauplan ({zeile, sprecher, folge?}) samt Folgezeilen („nach 0360“).
func sagen_eintrag(e: Dictionary) -> void:
	await sagen(e.sprecher, e.zeile)
	for f in e.get("folge", []):
		await sagen(f.sprecher, f.zeile)


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
## Bedingungen aus dem Bauplan: [{art: "nach"/"vor", raetsel: "P1"}], [{art: "hat"/"hat_nicht",
## gegenstand: "goldmuenze"}] (Max' Inventar). „nach_zeile“ prüft das Gespräch selbst (CQDialog).
func bedingung_ok(bedingungen: Array) -> bool:
	for b in bedingungen:
		match b.art:
			"nach", "vor":
				var g: bool = Zustand.geloest(b.raetsel)
				if (b.art == "nach" and not g) or (b.art == "vor" and g):
					return false
			"hat", "hat_nicht":
				var sn := Bauplan.gegenstand_script_name(b.gegenstand)
				var da := is_instance_valid(C.Max) and I.is_item_in_inventory(sn, C.Max)
				if da != (b.art == "hat"):
					return false
	return true


## Ob ein Eintrag gerade gilt: Bedingungen, Raum (bei Figuren in mehreren Räumen), Zustand des
## Gegenstands und aktive Figur („, Pixel“-Zeilen nur, wenn Pixel spielt).
func eintrag_passt(e: Dictionary, zustand := "") -> bool:
	if not bedingung_ok(e.get("bedingung", [])):
		return false
	if e.has("raum") and is_instance_valid(R.current) and e.raum != Bauplan.raum(R.current.script_name).get("id", ""):
		return false
	if e.has("zustand") and e.zustand != zustand:
		return false
	return true


## Wählt aus den Ansehen-Zeilen eines Objekts: erfüllte Bedingung, beim n-ten Ansehen die
## Zeile mit dem größten „mal“ ≤ n. Spielt Pixel, zählen seine eigenen Zeilen („, Pixel“,
## „Pixel schnuppert“), sonst die von Max. Leeres Dictionary, wenn keine passt.
func ansehen_waehlen(eintraege: Array, mal: int, zustand := "") -> Dictionary:
	var pixel := ist_pixel()
	if pixel and not eintraege.any(func(e): return e.get("figur") == "PIX" and eintrag_passt(e, zustand)):
		pixel = false  # keine eigene Zeile für Pixel: Max kommentiert
	var beste := {}
	for e in eintraege:
		if not eintrag_passt(e, zustand) or (e.get("figur") == "PIX") != pixel:
			continue
		var m := int(e.get("mal", 1))
		if m <= mal and (beste.is_empty() or m >= int(beste.get("mal", 1))):
			beste = e
	return beste


## Ansehen (Rechtsklick) nach der Wiederholungsregel (05, „Wiederholung und Erschöpfung“):
## 1. Mal die eigene Zeile, 2. Mal die „zweites Mal“-Zeile, ab dem 3. Mal eine Zeile aus dem
## Wiederholungs-Pool (SYS_WDH_*) des Sprechers der ersten Zeile, nie zweimal dieselbe
## hintereinander. Fehlt die „zweites Mal“-Zeile, kommt schon beim 2. Mal der Pool; fehlt der
## Pool (noch nicht geschrieben), wiederholen sich die eigenen Zeilen. Gezählt wird je Objekt,
## Zustand, erster Zeile und Figur im Zustand (gespeichert). Ohne eigene Zeile: Ersatzzeile.
## Liefert die gesagte Zeilen-ID ("" bei Ersatzzeile).
func ansehen(eintraege: Array, schluessel: String, zustand := "") -> String:
	var erste := ansehen_waehlen(eintraege, 1, zustand)
	if erste.is_empty():
		await ersatz()
		return ""
	# Die erste Zeile gehört zum Schlüssel: Wechselt sie mit dem Spielstand („nach P1“), zählt
	# das als neues Ansehen.
	var n := Zustand.ansehen_zaehlen("%s|%s|%s|%s" % [schluessel, zustand, erste.zeile, kuerzel_von(C.player)])
	var zweite := ansehen_waehlen(eintraege, 2, zustand)
	var hat_zweite: bool = not zweite.is_empty() and zweite.zeile != erste.zeile
	if n == 1:
		await sagen_eintrag(erste)
		return erste.zeile
	if n == 2 and hat_zweite:
		await sagen_eintrag(zweite)
		return zweite.zeile
	var kz: String = erste.sprecher if erste.sprecher in ["MAX", "PIX"] else kuerzel_von(C.player)
	var wahl := pool_zeile(Bauplan.wiederholung.get(kz, []), "WDH_" + kz)
	if wahl.is_empty():
		var e: Dictionary = zweite if hat_zweite and n % 2 == 0 else erste
		await sagen_eintrag(e)
		return e.zeile
	await sagen(kz, wahl)
	return wahl


## Zufällige Zeile aus einem Pool, nie zweimal dieselbe hintereinander (je Merkname).
func pool_zeile(pool: Array, merk: String) -> String:
	if pool.is_empty():
		return ""
	var wahl: String = pool.pick_random()
	while pool.size() > 1 and wahl == _letzte_ersatz.get(merk, ""):
		wahl = pool.pick_random()
	_letzte_ersatz[merk] = wahl
	return wahl


## Erste passende Zeile für einen Gegenstand auf einem Objekt („Eimer auf Fondue-Topf“).
## Die spätere gewinnt, damit „nach R1“-Varianten die allgemeine Zeile ablösen.
func gegenstand_zeile(eintraege: Array, gegenstand_id: String) -> Dictionary:
	var beste := {}
	for e in eintraege:
		if e.get("gegenstand") == gegenstand_id and eintrag_passt(e):
			beste = e
	return beste


func hingehen(ziel: PopochiuClickable) -> void:
	if testmodus or not is_instance_valid(C.player) or not C.player.is_inside_tree():
		return
	var punkt := ziel.to_global(ziel.walk_to_point)
	if R.current.get_navigation_path(C.player.global_position, punkt).is_empty():
		# Ohne Weg bliebe walk_to() hängen (Popochiu 2.2.1 wartet dann ewig): nicht laufen.
		push_warning("Kein Weg von %s nach %s (%s)" % [C.player.global_position, punkt, ziel.name])
		return
	await C.player.walk_to(punkt)


## Nehmen eines Props (Bauplan: „nehmen“, „gegenstand“). Ohne Gegenstand bleibt es bei der
## Zeile (Zahnstocher: „Er wählt mich nicht“). Pixel nimmt in der Graubox nichts (WECH 0070).
func nehmen(prop: PopochiuProp, daten: Dictionary) -> void:
	if ist_pixel():
		await wechsel_regel("pixel_nehmen")
		return
	await hingehen(prop)
	if not kann_aufnehmen(C.player):
		await ersatz()
		return
	if daten.get("nehmen"):
		await sagen_eintrag(daten.nehmen)
	if not daten.get("gegenstand"):
		return
	prop.hide()
	await geben(Bauplan.gegenstand_script_name(daten.gegenstand))
	Hinweise.objekt_beruehrt(daten.gegenstand)


## Gegenstand in Max' Inventar legen (auch wenn gerade Pixel spielt).
func geben(sn: String) -> void:
	if not I.is_item_in_inventory(sn, C.Max):
		var leise := _leise_an()
		await I.add_item(I.get_item_instance(sn), 1, C.Max)
		I.is_restoring = leise


## Gegenstand aus Max' Inventar nehmen.
func abgeben(sn: String) -> void:
	if I.is_item_in_inventory(sn, C.Max):
		if I.active and I.active.script_name == sn:
			I.active = null
		var leise := _leise_an()
		await I.remove_item(I.get_item_instance(sn), 0, C.Max)
		I.is_restoring = leise


## Im Testmodus ohne die Wartezeiten der Inventarleiste (2,5 s beim Hinzufügen, 1 s beim
## Entfernen): Popochius Schalter is_restoring. Liefert den alten Wert zum Zurücksetzen.
func _leise_an() -> bool:
	var vorher: bool = I.is_restoring
	if testmodus:
		I.is_restoring = true
	return vorher


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
## Wechsel ist erlaubt, wenn Pixel im Abschnitt spielbar ist (Welt-Tabelle), der Wechsel
## freigeschaltet ist (<Präfix>_WECHSEL_FREI, Welt 1: erstes Betreten der Taverne) und beide im
## Raum stehen. Im Prolog nie (raetsel/prolog-und-welt-1.md: Wechsel erst ab Welt 1).
func wechsel_moeglich() -> bool:
	if not Bauplan.figur_spielbar(Zustand.abschnitt, "pixel"):
		return false
	if not Zustand.ist(praefix() + "_WECHSEL_FREI"):
		return false
	return is_instance_valid(C.Pixel) and C.Pixel.is_inside_tree() \
		and is_instance_valid(C.Max) and C.Max.is_inside_tree()


func praefix() -> String:
	return Bauplan.plaene.get(Zustand.abschnitt, {}).get("praefix", "")


## Wechsel Max ↔ Pixel. Danach sagt die neue Figur eine Wechselzeile (zufällig, nie zweimal
## hintereinander), außer der Raum übernimmt (Taverne: erste Wechsel, TAV 0080/0090).
func figur_wechseln(mit_zeile := true) -> bool:
	if not wechsel_moeglich() or in_szene > 0 or E.playing_queue:
		return false
	I.active = null
	C.player = C.Pixel if C.player == C.Max else C.Max
	figur_gewechselt.emit(C.player)
	if mit_zeile:
		_wechsel_sagen.call_deferred()
	return true


func _wechsel_sagen() -> void:
	if is_instance_valid(R.current) and R.current.has_method("_figur_gewechselt") \
			and await R.current.call("_figur_gewechselt", C.player):
		return
	var pool: Array = Bauplan.figurenwechsel(Zustand.abschnitt).get(
		"zu_pixel" if ist_pixel() else "zu_max", []
	)
	if pool.is_empty():
		return
	var wahl: String = pool.pick_random()
	while pool.size() > 1 and wahl == _letzte_ersatz.get("WECHSEL", ""):
		wahl = pool.pick_random()
	_letzte_ersatz["WECHSEL"] = wahl
	await sagen(kuerzel_von(C.player), wahl)


## Feste Zeile aus dem Abschnitt „Figurenwechsel“ (pixel_tuer, max_tier …), sonst Ersatzzeile.
func wechsel_regel(schluessel: String) -> void:
	var zeile: String = Bauplan.figurenwechsel(Zustand.abschnitt).get(schluessel, "")
	if zeile.is_empty():
		await ersatz()
		return
	await sagen(zeile.split("_")[2], zeile)


## Pixel trägt nur einen kleinen Gegenstand im Maul.
func kann_aufnehmen(c: PopochiuCharacter) -> bool:
	if is_instance_valid(c) and c.script_name == "Pixel":
		return c.inventory.size() < 1
	return true


## Klick auf Pixels Porträt: immer der Figurenwechsel (im Prolog ohne Wirkung). Pixel als
## Gegenstand geht über das Pixel-Feld der Inventarleiste.
func pixel_portraet_geklickt() -> void:
	figur_wechseln()


## Pixel ist wach: im Prolog ab P1, danach immer.
func pixel_wach() -> bool:
	return Zustand.abschnitt != "prolog" or Zustand.geloest("P1")


## Das Pixel-Feld liegt in Max' Inventar, sobald Pixel wach ist (abgeleitet, nie gesetzt).
func pixel_feld_pruefen() -> void:
	if not is_instance_valid(C.Max) or not ResourceLoader.exists(
			"res://game/inventory_items/pixel_feld/inventory_item_pixel_feld.tscn"):
		return
	if pixel_wach() and not I.is_item_in_inventory(PIXEL_FELD, C.Max):
		await I.add_item(I.get_item_instance(PIXEL_FELD), 1, C.Max)


## Figur in den aktuellen Raum holen (an) oder aus ihm nehmen; pos nur beim Hinzufügen.
func figur_hier(sn: String, an: bool, pos := Vector2.INF) -> void:
	if not is_instance_valid(R.current):
		return
	var c := C.get_character(sn)
	if not is_instance_valid(c):
		return
	var da := R.current.has_character(sn)
	if an and not da:
		if c.is_inside_tree():
			c.get_parent().remove_child(c)
		R.current.add_character(c)
		if pos != Vector2.INF:
			c.position = pos
	elif not an and da:
		R.current.remove_character(c)


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
		"nach der Nahansicht Kalender":
			return "kalender" in Zustand.nahansichten
		"solange Toadi im Raum ist":
			return is_instance_valid(R.current) and R.current.has_character("Toadi")
		"Zauberwald betreten":
			return Zustand.war_in("zauberwald")
		"nur mit Zeldina im Team":
			return Zustand.ist("W1_ZELDINA_FOLGT")
		"Feilschen", "Haustier", "richtig":
			return true  # Beschreibung der Option, keine Bedingung (Maklerin, LUFT 0410–0470)
		"wenn Ziegen dabei sind":
			return is_instance_valid(R.current) and (
				R.current.has_character("SchmiedeZiege") or R.current.has_character("XxlZiege")
			)
	return false  # unbekannt: Rätselcode entscheidet (Option bzw. Zuruf bleibt aus)


## Öffentlicher Zugang für Gespräche und Tests.
func bedingung_text_ok(text: String) -> bool:
	return _bedingung_text_ok(text)


#endregion

#region Abschnitte #################################################################################
## Ende des Prologs: Max wird in den Fernseher gesaugt (Platzhalter-Übergang) und landet in
## Welt 1 auf dem Dorfplatz (Ankunft, skript/welt-1.md Abschnitt 1).
func prolog_beenden() -> void:
	if not testmodus:
		# Platzhalter fürs Einsaugen: Popochius Übergang „tunnel“ zieht ins Bild hinein
		await T.play_transition("tunnel", 1.5, T.PLAY_MODE.IN)
	prolog_beendet.emit()
	await welt_beginnen("welt-1")


## Wechsel in einen neuen Abschnitt. Mit reist nur, was die Welt-Tabelle des Ziels als
## mitgebracht führt (herkunft = früherer Abschnitt), dazu die Reisetasche selbst; der
## Dosenöffner bleibt auf dem Dachboden (raetsel/prolog-und-welt-1.md, Was auf dem Dachboden
## bleibt). Der erste Raum ist der erste Raum der Welt-Tabelle.
func welt_beginnen(ab: String) -> void:
	var mit := ["Reisetasche", PIXEL_FELD]
	for g in Bauplan.welten.get(ab, {}).get("gegenstaende", []):
		if g.get("herkunft", "") in Bauplan.welten.keys():
			mit.append(Bauplan.gegenstand_script_name(g.id))
	for sn in C.Max.inventory.keys():
		if not sn in mit:
			await abgeben(sn)
	Zustand.abschnitt = ab
	herkunft_raum = ""
	var erster: Dictionary = Bauplan.welten.get(ab, {}).get("raeume", [{}])[0]
	await R.goto_room(Bauplan.raum_script_name(erster.get("id", "")))


## Zwischenspiel nach einer Welt (skript/zwischenspiele-und-finale.md): zurück auf den
## Dachboden, Abschnitt „finale“ (der Dachboden gehört dort zur Welt-Tabelle), Wert
## ZWISCHENSPIEL = nr. Anders als welt_beginnen() bleibt das Inventar, wie es ist: Opa nimmt
## das Mitbringsel in der Ankunftsszene, das Packen der Reisetasche entscheidet später.
func zwischenspiel_beginnen(nr: int) -> void:
	if not testmodus:
		await T.play_transition("tunnel", 1.5, T.PLAY_MODE.IN)
	I.active = null
	if is_instance_valid(C.Max) and C.player != C.Max:
		C.player = C.Max
	Zustand.abschnitt = "finale"
	Zustand.setze_wert("ZWISCHENSPIEL", nr)
	herkunft_raum = ""
	await R.goto_room(Bauplan.raum_script_name("dachboden"))


## Auswahl ohne Gesprächsfigur (Wünsche am Brunnen, Passwort an der Geheimtür): Popochius
## Inline-Dialog mit den übersetzten Texten, liefert den Index. Tests geben die Antwort über
## vorgabe_auswahl vor.
func auswahl(texte: Array) -> int:
	if not vorgabe_auswahl.is_empty():
		return int(vorgabe_auswahl.pop_front())
	var opt: PopochiuDialogOption = await D.show_inline_dialog(texte.map(func(t): return tr(t)))
	return int(opt.id) if is_instance_valid(opt) else -1


## Ende des gebauten Teils (Graubox-Ausbaustand): Meldung, das Spiel läuft weiter.
func ausbau_ende(schluessel: String) -> void:
	protokoll.append(schluessel)  # für den Test sichtbar
	if is_instance_valid(hud) and not testmodus:
		hud.melden(tr(schluessel), 4.0)


#endregion
