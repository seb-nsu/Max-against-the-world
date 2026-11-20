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
## Eine Ersatzzeile kam (Telemetrie: Ersatzzeilen und Fehlklicks je Objekt)
signal ersatz_gesagt(kuerzel: String, zeile: String)

## Sprecherkürzel der Welt-Tabellen → Popochiu-Figur
const KUERZEL := {"MAX": "Max", "PIX": "Pixel", "OPA": "Opa"}
## Zurufe nach so vielen Sekunden ohne Eingabe (skript/prolog.md, Zurufe)
const ZURUF_NACH := 45.0
const HUD := preload("res://oberflaeche/hud.tscn")
const NAHANSICHT := preload("res://oberflaeche/nahansicht.tscn")
const NOTIZBUCH := preload("res://oberflaeche/notizbuch.tscn")
const REISETASCHE := preload("res://oberflaeche/reisetasche.tscn")
const PAUSEMENUE := preload("res://oberflaeche/pausemenue.gd")
## Erster Raum eines neuen Spiels (Hauptmenü: Neues Spiel, Fortsetzen, Laden)
const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"

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
## Tests: Minispiele warten auch im Testmodus auf echte Knöpfe (tests/minispiele.gd)
var minispiel_von_hand := false
## Offene Spielfläche eines Minispiels (oberflaeche/minispiel.gd), sonst null
var minispiel: CQMinispiel
## Vorgaben für das Packen der Reisetasche (Tests): Gegenstände, die der Reihe nach berührt werden
var vorgabe_tasche: Array = []

## Platz, den der Startraum gleich nach dem Betreten lädt (Hauptmenü: Fortsetzen, Laden); -1 = keiner
var start_platz := -1
## Zurück zum Hauptmenü angefragt (im Testmodus statt des Neustarts)
var hauptmenue_angefragt := false

var hud: CanvasLayer
var _pause: CanvasLayer
var _letzte_ersatz := {}
var _letzter_zuruf := ""
var _ruhe := 0.0
var _schritt_in := 0.0


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	TranslationServer.set_locale("de")
	hud = HUD.instantiate()
	add_child(hud)
	# Popochius Kamera bringt aus ihrer Szene Grenzen von 320×180 mit und stellt sie erst beim
	# ersten Raumwechsel auf die Spielauflösung. Das Spiel beginnt aber im Hauptmenü, der erste
	# Raum kommt ohne Raumwechsel: Ohne diese Zeile sitzt er um 160×90 Pixel verschoben.
	E.camera.restore_default_limits()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton or event is InputEventKey or event is InputEventJoypadButton \
			or (event is InputEventJoypadMotion and absf(event.axis_value) > 0.5):
		_ruhe = 0.0


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cq_pause") and pause_moeglich():
		get_viewport().set_input_as_handled()
		pause_oeffnen()
	elif event.is_action_pressed("cq_figur_wechseln") and not get_tree().paused:
		get_viewport().set_input_as_handled()
		figur_wechseln()
	elif event.is_action_pressed("cq_notizbuch") and OS.is_debug_build():
		# Nur zum Testen: Im Spiel öffnet sich das Notizbuch aus dem Inventar.
		get_viewport().set_input_as_handled()
		notizbuch_oeffnen()


## Die aktive Figur verdeckt nichts: Klicks gehen durch sie durch. Nur mit gewähltem Gegenstand
## bleibt sie anklickbar (Gegenstand oder Pixel-Feld auf sich selbst, 05-spielsysteme.md).
## Popochiu regelt das beim Start und beim Figurenwechsel, aber nicht nach einem Raumwechsel.
func _eigene_figur_durchlassen() -> void:
	var p: PopochiuCharacter = C.player
	if not is_instance_valid(p):
		return
	var soll: bool = I.active != null and p.clickable and p.visible
	if p.input_pickable != soll:
		p.input_pickable = soll


func _process(delta: float) -> void:
	_eigene_figur_durchlassen()
	_schritte(delta)
	if testmodus or not E.in_room or E.playing_queue or in_szene > 0 \
			or is_instance_valid(D.current_dialog):
		_ruhe = 0.0
		return
	_ruhe += delta
	if _ruhe >= ZURUF_NACH:
		_ruhe = 0.0
		_zuruf()


## Schritte der aktiven Figur, solange sie läuft (CQKlangEinsatz.SCHRITT_MAX, SCHRITT_PIXEL).
func _schritte(delta: float) -> void:
	if not is_instance_valid(C.player) or not C.player.is_inside_tree() or not C.player.is_moving \
			or not is_instance_valid(R.current):
		_schritt_in = 0.0
		return
	_schritt_in -= delta
	if _schritt_in > 0.0:
		return
	_schritt_in = CQKlangEinsatz.SCHRITT_TAKT_PIXEL if ist_pixel() else CQKlangEinsatz.SCHRITT_TAKT_MAX
	Klang.einsatz(CQKlangEinsatz.schritt(R.current.raum_id() if R.current.has_method("raum_id") else "", ist_pixel()))


#region Pause und Hauptmenü ########################################################################
## Pausemenü nur im Raum und wenn nichts läuft: In Zwischensequenzen, Gesprächen und
## Überlagerungen bleibt Esc beim Überspringen und Schließen (05-spielsysteme.md, Bildschirme).
func pause_moeglich() -> bool:
	return not is_instance_valid(_pause) and not get_tree().paused \
		and not Spielstand.beschaeftigt()


func pause_oeffnen() -> void:
	# Vorschaubild für „Speichern“ vor dem Menü aufnehmen, damit es das Spiel zeigt
	Spielstand.vorschau_merken()
	_pause = PAUSEMENUE.new()
	_pause.geschlossen.connect(pause_schliessen)
	add_child(_pause)
	get_tree().paused = true


func pause_schliessen() -> void:
	if is_instance_valid(_pause):
		_pause.queue_free()
	_pause = null
	get_tree().paused = false


func pause_offen() -> bool:
	return is_instance_valid(_pause)


## „Laden“ im Pausemenü: Menü zu, dann laden.
func pause_laden(slot: int) -> void:
	pause_schliessen()
	Spielstand.laden.call_deferred(slot)


## „Hauptmenü“ im Pausemenü. Ein frischer Start ist der einzige sichere Weg zu einem sauberen
## Zustand (Popochiu, Inventare, Schalter): Das Spiel startet neu und zeigt das Hauptmenü.
func zum_hauptmenue() -> void:
	pause_schliessen()
	hauptmenue_angefragt = true
	if testmodus:
		return
	Einstellungen.speichern()
	Telemetrie.sitzung_beenden("hauptmenue")
	# Im Browser gibt es keinen Neustart des Programms: Dort lädt die Seite neu, das ist derselbe
	# frische Start.
	if OS.has_feature("web"):
		JavaScriptBridge.eval("window.location.reload()")
		return
	OS.set_restart_on_exit(true, OS.get_cmdline_args())
	get_tree().quit()


#endregion

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
## Mit der Zeile beginnen ihre Geräusche (Klang.zeilen_klang), ihr Wackeln (CQEffekte) und ihre
## Geste (CQGestenEinsatz.ZEILE: vor, mit oder statt der Redebewegung).
func sagen(kuerzel: String, zeile: String) -> void:
	if tr(zeile) == zeile:
		push_error("Zeile %s fehlt in texte.csv" % zeile)
	Klang.zeilen_klang(kuerzel, zeile)
	CQEffekte.zeilen_wackeln(zeile)
	await CQGestenEinsatz.zeile(zeile)
	for b in blasen(zeile):
		protokoll.append(b)
		zeile_gesagt.emit(b)
		if testmodus:
			continue
		if kuerzel == "NAR":
			await _erzaehlen(tr(b))
			continue
		var c := figur(kuerzel)
		var quelle: PopochiuClickable = null
		if not is_instance_valid(c):
			quelle = _objekt_im_raum(OBJEKTSTIMMEN.get(kuerzel, ""))
			if not is_instance_valid(quelle):
				await G.show_system_text(b)
				continue
		Klang.zeile(kuerzel, b, tr(b))
		if not blase_zeigen(zeile, b):
			ohne_text.append(b)
			await Klang.stimme_abwarten()
			continue
		if is_instance_valid(quelle):
			await _objekt_sagt(kuerzel, quelle, blasen_text(zeile, b))
			continue
		# Stimme aus einem Lautsprecher im Raum (M.U.T.T.I. und Pixel in den Testkammern)
		if not c.is_inside_tree() and kuerzel in LAUTSPRECHER_STIMMEN:
			for oid: String in LAUTSPRECHER_STIMMEN[kuerzel]:
				if not is_instance_valid(quelle):
					quelle = _objekt_im_raum(oid)
			if is_instance_valid(quelle):
				await _objekt_sagt(kuerzel, quelle, blasen_text(zeile, b), c)
				continue
		var gast := not c.is_inside_tree() and is_instance_valid(R.current)
		if gast:
			_stimme_aus_dem_off(c, true)
		await c.say(blasen_text(zeile, b))
		if gast:
			_stimme_aus_dem_off(c, false)
	if testmodus:
		await get_tree().process_frame


## Regiezeilen (NAR) als kurze Erzählzeile oben im Bild, ohne Klick: Was passiert, erfährt der
## Spieler so auch dort, wo es noch keine Animation gibt (Review Fund 18; vorher eine Sekunde Pause
## ohne Text). Blendet nach der Lesezeit aus.
func _erzaehlen(text: String) -> void:
	if E.cutscene_skipped:
		return
	var ebene := CanvasLayer.new()
	ebene.layer = 60
	var l := RichTextLabel.new()
	l.bbcode_enabled = true
	l.fit_content = true
	l.scroll_active = false
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.theme = load("res://game/gui/resources/gui_theme.tres")
	l.add_theme_font_size_override("normal_font_size", 14)
	l.add_theme_font_size_override("italics_font_size", 14)
	l.add_theme_color_override("default_color", Color("ead4aa"))
	l.add_theme_color_override("font_outline_color", Color("181425"))
	l.add_theme_constant_override("outline_size", 3)
	l.text = "[center][i]%s[/i][/center]" % text
	l.position = Vector2(90, 52)
	l.size = Vector2(460, 20)
	ebene.add_child(l)
	add_child(ebene)
	l.modulate.a = 0.0
	var t := create_tween()
	t.tween_property(l, "modulate:a", 1.0, 0.2)
	# bis 8 s, damit auch lange Erzählzeilen lesbar bleiben (Review 17.11., X-05; vorher höchstens 5 s)
	await get_tree().create_timer(clampf(text.length() / 13.0, 1.6, 8.0)).timeout
	if is_instance_valid(l):
		var t2 := create_tween()
		t2.tween_property(l, "modulate:a", 0.0, 0.2)
		await t2.finished
	ebene.queue_free()


## Sprechblasen, die bei „Untertitel aus“ ohne Text liefen (für Tests), neueste zuletzt
var ohne_text: Array[String] = []


## Erscheint der Text dieser Sprechblase? Bei „Untertitel aus“ bleibt er nur weg, wenn es zur
## Blase eine Aufnahme gibt; Zeilen ohne Stimme und gesungene Zeilen zeigen ihn immer
## (05-spielsysteme.md, Optionen: Untertitel).
func blase_zeigen(zeile: String, blase: String) -> bool:
	if Einstellungen.wert("untertitel") or CQKlangEinsatz.ist_lied(zeile):
		return true
	return not Klang.hat_stimme(blase)


## Was Popochiu als Sprechblase zeigt: der Schlüssel der Blase (Popochiu übersetzt ihn) oder,
## bei gesungenen Zeilen, der fertige Text kursiv mit einer Note davor.
func blasen_text(zeile: String, blase: String) -> String:
	return CQEffekte.lied_text(tr(blase)) if CQKlangEinsatz.ist_lied(zeile) else blase


## Sprechende Objekte ohne Figur (welt-1.yaml: Figuren mit groesse_px 0) → Objekt-ID im Raum.
## Die Sprechblase kommt vom Objekt (G16), nicht als Systemtext.
const OBJEKTSTIMMEN := {"BRU": "brunnen", "GRA": "grammophon", "TUE": "geheimtuer", "SPI": "spiegel"}
## Figuren, die nicht im Raum stehen, aber durch einen Lautsprecher dort sprechen (Welt 3, Labor)
## (Pixel im Büroturm: über das Terminal, W3-B45)
const LAUTSPRECHER_STIMMEN := {"MUT": ["lautsprecher"], "PIX": ["lautsprecher", "terminal"]}
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
func _objekt_sagt(kuerzel: String, quelle: PopochiuClickable, text: String, figur_selbst: PopochiuCharacter = null) -> void:
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
		stimme.dialog_pos = Vector2(0, -8)
		_objektstimmen[kuerzel] = stimme
	if is_instance_valid(figur_selbst):
		# Figur spricht durch den Lautsprecher: ihre Schriftfarbe und ihr Name
		stimme.text_color = figur_selbst.text_color
		stimme.description = figur_selbst.description
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
		c.position = Vector2(E.width / 2.0, 140)
		c.modulate.a = 0.0
		c.clickable = false
	else:
		c.modulate.a = 1.0
		c.clickable = true
		R.current.remove_character(c)
		# Im Treppenhaus hebt stufen_anwenden() das Bild der unsichtbaren Stimme auf eine Stufe; das
		# darf nicht in den nächsten Raum mitwandern (Opa stand sonst im Dachboden 100 px zu tief).
		var bild := c.get_node_or_null("Sprite2D") as Node2D
		if bild:
			bild.position = Vector2.ZERO
		c.animation_prefix = ""


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
	gesten_loesen()


## Gehaltene Gesten (Max sitzt auf dem Hebel, liegt nach dem Fall) enden spätestens mit der Szene.
func gesten_loesen() -> void:
	if not is_instance_valid(R.current):
		return
	for c in R.current.get_characters():
		if c is CQFigur and c.geste_gehalten:
			c.geste_ende()


## Max zeigt auf das erste dieser Objekte, das im Raum zu sehen ist (Hinweise der Pfote).
func max_zeigt_auf(objekt_ids: Array) -> void:
	var m := C.get_character("Max") if is_instance_valid(R.current) and R.current.has_character("Max") else null
	if not m is CQFigur or CQFigur.gesten_aus() or m.is_moving or m.geste_laeuft:
		return
	for oid in objekt_ids:
		var o := _objekt_im_raum(str(oid))
		if is_instance_valid(o) and o.visible:
			m.schauen_zu(o.global_position.x)
			m.geste("zeigen", false)
			return


## Sekunden ohne Eingabe (für Max' Warte-Gesten, CQGestenEinsatz.WARTEN „spieler_ruhe“).
func ruhe_zeit() -> float:
	return _ruhe


## Geste der aktiven Figur, wenn Max spielt (aufheben, benutzen …). Hat die Zeile, die gleich
## kommt, schon eine eigene Geste in CQGestenEinsatz.ZEILE, bleibt es bei der.
func max_geste(anim: String, warten := true, zeile := "") -> void:
	if ist_pixel() or not C.player is CQFigur or (not zeile.is_empty() and CQGestenEinsatz.hat_zeile(zeile)):
		return
	if warten:
		await C.player.geste(anim)
	else:
		C.player.geste(anim, false)


## Zufällige Ersatzzeile der aktiven Figur, nie zweimal hintereinander dieselbe.
## Max zuckt bei jeder zweiten „geht nicht“-Zeile mit den Schultern und kratzt sich bei jeder
## vierten Ersatzzeile zum Ansehen (ansehen = true) am Kopf (Entscheidung 2, abwechselnd statt zufällig).
var _ersatz_gesten := {"benutzen": 0, "ansehen": 0}


func ersatz(kuerzel := "", ansehen := false) -> void:
	if kuerzel.is_empty():
		kuerzel = kuerzel_von(C.player) if is_instance_valid(C.player) else "MAX"
	var pool: Array = Bauplan.ersatz.get(kuerzel, [])
	if pool.is_empty():
		return
	var wahl: String = pool.pick_random()
	while pool.size() > 1 and wahl == _letzte_ersatz.get(kuerzel, ""):
		wahl = pool.pick_random()
	_letzte_ersatz[kuerzel] = wahl
	ersatz_gesagt.emit(kuerzel, wahl)
	Klang.jingle("falsch")
	if kuerzel == "MAX":
		var art := "ansehen" if ansehen else "benutzen"
		_ersatz_gesten[art] += 1
		var c := figur("MAX")
		if c is CQFigur and c.is_inside_tree():
			if ansehen and _ersatz_gesten[art] % 4 == 0:
				c.geste("kopf_kratzen", false)
			elif not ansehen and _ersatz_gesten[art] % 2 == 0:
				c.geste("schulterzucken", false)
	await sagen(kuerzel, wahl)


#endregion

#region Regeln der Abschnitte #######################################################################
## Regeln eines Abschnitts, die über einzelne Objekte hinausgehen (skripte/welt_2.gd …): ein
## Objekt je Abschnitt, geladen beim ersten Gebrauch. Die Basisklassen der Objekte melden ihre
## Ereignisse an ereignis(art, obj, item) -> bool (true = erledigt, sonst Standardverhalten aus
## dem Bauplan); Werte ohne Warten (Zustand eines Gegenstands, Bedingungen in Worten) liefert
## wert(art, obj) (null = Standard). Welt 1 regelt ihre Rätsel in den Objektskripten.
var _regeln := {}


func regeln() -> Object:
	var ab: String = Zustand.abschnitt
	if not _regeln.has(ab):
		var pfad := "res://skripte/%s.gd" % ab.replace("-", "_")
		_regeln[ab] = load(pfad).new() if ResourceLoader.exists(pfad) else null
	return _regeln[ab]


## Ereignis an die Regeln des Abschnitts melden. Arten: benutzen, ansehen, gegenstand, pixel
## (Hotspots, Props, Figuren), ausgang (true sperrt), kombinieren, benutzen_inventar,
## ansehen_inventar (Gegenstände), raum_betreten, nach_uebergang, nach_laden (Räume),
## nach_option (Gespräche: obj ist der Dialog, item die Options-ID).
func regel(art: String, obj: Variant = null, item: Variant = null) -> bool:
	Klang.einsatz(CQKlangEinsatz.fuer_ereignis(art, klang_id(obj), klang_id(item)))
	var r := regeln()
	if r == null or not r.has_method("ereignis"):
		return false
	return bool(await r.ereignis(art, obj, item))


## Kennung eines Objekts oder Gegenstands für die Geräusch-Tabellen (CQKlangEinsatz): die ID aus
## dem Bauplan.
func klang_id(o: Variant) -> String:
	if o is String:
		return o
	if o is PopochiuInventoryItem:
		return str(Bauplan.gegenstand(o.script_name).get("id", o.script_name.to_snake_case()))
	if o is Object and o.has_method("objekt_id"):
		return str(o.objekt_id())
	return ""


## Wert aus den Regeln des Abschnitts ohne Warten; null, wenn die Regeln nichts dazu sagen.
func regel_wert(art: String, obj: Variant = null, item: Variant = null) -> Variant:
	var r := regeln()
	if r == null or not r.has_method("wert"):
		return null
	return r.wert(art, obj, item)


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


## Ob ein Eintrag gerade gilt: Bedingungen, Bedingung in Worten („nach dem Finaltag“), Raum (bei
## Figuren in mehreren Räumen), Zustand des Gegenstands und aktive Figur („, Pixel“-Zeilen nur,
## wenn Pixel spielt).
func eintrag_passt(e: Dictionary, zustand := "") -> bool:
	if not bedingung_ok(e.get("bedingung", [])):
		return false
	if not zusatz_ok(e.get("bedingung_text", "")):
		return false
	if e.has("raum") and is_instance_valid(R.current) and e.raum != Bauplan.raum(R.current.script_name).get("id", ""):
		return false
	if e.has("zustand") and e.zustand != zustand:
		return false
	return true


## Zusatz in Worten an einer Ansehen-, Benutzen- oder Gegenstand-Zeile („vor dem Finaltag“,
## „nach dem Tausch, Jingle“). Jeder Teil, den das Spiel oder die Regeln des Abschnitts kennen,
## muss gelten. Unbekannte Teile sind Anmerkungen für die Regie und zählen nicht. Dass dabei
## keine Zeile verdrängt wird, prüft tools/godot_raeume.py (verdraengte).
func zusatz_ok(text: String) -> bool:
	if text.is_empty():
		return true
	var ganz = _bedingung_text_wert(text)
	if ganz != null:
		return bool(ganz)
	for teil in text.split(", "):
		var w = _bedingung_text_wert(teil)
		if w != null and not bool(w):
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
## 1. Mal die eigene Zeile, 2. Mal die „zweites Mal“-Zeile, 3. und 4. Mal die „drittes Mal“- und
## „viertes Mal“-Zeile, wenn das Skript eine hat; sonst eine Zeile aus dem Wiederholungs-Pool (SYS_WDH_*) des Sprechers
## der ersten Zeile, nie zweimal dieselbe hintereinander. Fehlt die „zweites Mal“-Zeile, kommt schon beim 2. Mal der Pool; fehlt der
## Pool (noch nicht geschrieben), wiederholen sich die eigenen Zeilen. Gezählt wird je Objekt,
## Zustand, erster Zeile und Figur im Zustand (gespeichert). Ohne eigene Zeile: Ersatzzeile.
## Liefert die gesagte Zeilen-ID ("" bei Ersatzzeile).
func ansehen(eintraege: Array, schluessel: String, zustand := "") -> String:
	var erste := ansehen_waehlen(eintraege, 1, zustand)
	if erste.is_empty():
		await ersatz("", true)
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
	var nte := ansehen_waehlen(eintraege, n, zustand)
	if n >= 3 and int(nte.get("mal", 1)) == n:
		await sagen_eintrag(nte)
		return nte.zeile
	var kz: String = erste.sprecher if erste.sprecher in ["MAX", "PIX"] else kuerzel_von(C.player)
	var wahl := pool_zeile(Bauplan.wiederholung.get(kz, []), "WDH_" + kz)
	if wahl.is_empty():
		var e: Dictionary = zweite if hat_zweite and n % 2 == 0 else erste
		await sagen_eintrag(e)
		return e.zeile
	await sagen(kz, wahl)
	return wahl


## Benutzen (Linksklick) aus dem Bauplan: die erste passende Zeile. Gibt es „zweites Mal“-Zeilen
## (mal 2, 3 …), kommen sie beim 2., 3. … Klick der Reihe nach; danach eine davon zufällig, nie
## zweimal dieselbe hintereinander. Gezählt wird je Objekt und erster Zeile (gespeichert).
## Liefert false, wenn keine Zeile passt (dann Ersatzzeile beim Aufrufer).
func benutzen(eintraege: Array, schluessel: String) -> bool:
	var passend := eintraege.filter(func(e): return eintrag_passt(e))
	if passend.is_empty():
		return false
	var kette := []
	for m in range(1, 10):
		var e_m: Array = passend.filter(func(e): return int(e.get("mal", 1)) == m)
		if e_m.is_empty():
			break
		kette.append(e_m[0])
	if kette.size() < 2:
		await sagen_eintrag(passend[0])
		return true
	var n := Zustand.ansehen_zaehlen("benutzen|%s|%s" % [schluessel, kette[0].zeile])
	var e: Dictionary
	if n <= kette.size():
		e = kette[n - 1]
	else:
		var merk := "BEN_" + schluessel
		var auswahl := kette.filter(func(k): return k.zeile != _letzte_ersatz.get(merk, ""))
		e = auswahl.pick_random()
	_letzte_ersatz["BEN_" + schluessel] = e.zeile
	await sagen_eintrag(e)
	return true


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


## Mauszeiger über mehreren Objekten: Popochiu entscheidet nach der Reihenfolge im Elternknoten, und
## die sagt zwischen Figuren, Props und Hotspots nichts (Review 17.11., X-01: Humbert war nur an
## 9 % seiner Fläche anklickbar, der Traubensaft gar nicht, die Fischsuppe nur von rechts kommend).
## Regel: Der Stapel unter dem Zeiger wird bei jedem Eintritt neu sortiert, oben liegt das Objekt
## mit dem kleinsten Wert aus Klickfläche geteilt durch Rang (Figur 2,5, Prop 1,5, Hotspot 1,
## Spielfigur 0,5). Kleine Dinge gewinnen also gegen große Flächen, bei ähnlicher Größe gewinnt die
## Figur vor dem Prop vor dem Hotspot, unabhängig davon, aus welcher Richtung die Maus kommt.
## Gibt immer true zurück (die Regel entscheidet).
func zeiger_betritt(obj: PopochiuClickable) -> bool:
	var q: Array = E._hovered_queue
	var vorher: PopochiuClickable = E.hovered
	for i in range(q.size() - 1, -1, -1):
		if not is_instance_valid(q[i]):
			q.remove_at(i)
	if not q.has(obj):
		q.append(obj)
	q.sort_custom(func(a, b) -> bool: return _zeiger_wert(a) > _zeiger_wert(b))
	if E.hovered == obj and vorher != obj:
		G.mouse_entered_clickable.emit(obj)
	return true


## Kleiner Wert liegt oben (siehe zeiger_betritt).
func _zeiger_wert(obj: PopochiuClickable) -> float:
	var rang := 1.0
	if obj is PopochiuCharacter:
		rang = 0.5 if obj == C.player else 2.5
	elif obj is PopochiuProp:
		rang = 1.5
	return _zeiger_flaeche(obj) / rang


## Fläche der Klickfläche in Bildpunkten des Raums (Umriss des Klickpolygons, mit Skalierung).
func _zeiger_flaeche(obj: PopochiuClickable) -> float:
	var pn := obj.get_node_or_null("InteractionPolygon") as CollisionPolygon2D
	if pn == null or pn.polygon.is_empty():
		return 1.0e9
	var r := Rect2(pn.global_transform * pn.polygon[0], Vector2.ZERO)
	for p in pn.polygon:
		r = r.expand(pn.global_transform * p)
	return maxf(r.get_area(), 1.0)


func hingehen(ziel: PopochiuClickable) -> void:
	if testmodus or not is_instance_valid(C.player) or not C.player.is_inside_tree():
		return
	var punkt := ziel.to_global(ziel.walk_to_point)
	# Zu einer Figur geht man nicht hinein, sondern stellt sich etwa 55 Pixel seitlich vor sie, auf
	# die Seite, von der man kommt (Review Fund 24: Max verdeckte Alwin, Gollo und den Kessel).
	if ziel is PopochiuCharacter and ziel != C.player and ziel.walk_to_point.length() < 30.0:
		var seite := -1.0 if C.player.global_position.x < ziel.global_position.x else 1.0
		var s := absf(ziel.scale.x) if ziel.scale.x != 0.0 else 1.0
		for abstand in [55.0, 40.0]:
			var p := ziel.global_position + Vector2(seite * abstand * s, 0)
			if not R.current.get_navigation_path(C.player.global_position, p).is_empty() and R.current.get_navigation_path(C.player.global_position, p)[-1].distance_to(p) < 4.0:
				punkt = p
				break
	if R.current.get_navigation_path(C.player.global_position, punkt).is_empty():
		# Ohne Weg bliebe walk_to() hängen (Popochiu 2.2.1 wartet dann ewig): nicht laufen.
		push_warning("Kein Weg von %s nach %s (%s)" % [C.player.global_position, punkt, ziel.name])
		return
	await C.player.walk_to(punkt)
	if ziel is PopochiuCharacter and is_instance_valid(C.player) and C.player.has_method("schauen_zu"):
		C.player.schauen_zu(ziel.global_position.x)


## Nehmen eines Props (Bauplan: „nehmen“, „gegenstand“). Ohne Gegenstand bleibt es bei der
## Zeile (Zahnstocher: „Er wählt mich nicht“). Pixel nimmt in der Graubox nichts (WECH 0070).
func nehmen(prop: PopochiuProp, daten: Dictionary) -> void:
	if ist_pixel():
		if not await regel("pixel_nehmen", prop):
			await wechsel_regel("pixel_nehmen")
		return
	await hingehen(prop)
	if not kann_aufnehmen(C.player):
		await ersatz()
		return
	if daten.get("gegenstand"):
		await _aufheben_geste(prop, daten)
	if daten.get("nehmen"):
		await sagen_eintrag(daten.nehmen)
	if not daten.get("gegenstand"):
		return
	prop.hide()
	await geben(Bauplan.gegenstand_script_name(daten.gegenstand))
	Hinweise.objekt_beruehrt(daten.gegenstand)


## Max greift nach dem Prop (Entscheidung 2): vom Boden mit „aufheben“, aus Brusthöhe (Tresen,
## Regal, Werkbank) mit „benutzen“. Der Bauplan kennt keine Höhe; maßgeblich ist, wie hoch die
## Unterkante des Props über Max' Füßen liegt. Das Prop verschwindet, wenn die Hand es erreicht.
const AUFHEBEN_BIS := 45.0


func _aufheben_geste(prop: PopochiuProp, daten: Dictionary) -> void:
	var m = C.player
	if not m is CQFigur or CQFigur.gesten_aus() or ist_pixel():
		return
	var zeile: String = daten.nehmen.get("zeile", "") if daten.get("nehmen") else ""
	if not zeile.is_empty() and CQGestenEinsatz.hat_zeile(zeile):
		return
	var r: Array = prop.bauplan().get("rect", []) if prop.has_method("bauplan") else []
	# Das Prop liegt mit seiner Mitte auf position (Größe aus dem Bauplan)
	var unten := prop.global_position.y + (float(r[3]) / 2.0 if r.size() == 4 else 0.0)
	var boden: bool = unten >= m.global_position.y - AUFHEBEN_BIS * absf(m.scale.y)
	var anim := "aufheben" if boden else "benutzen"
	if not m.hat_animation(anim):
		return
	m.schauen_zu(prop.global_position.x)
	var dauer: float = (m.get_node("AnimationPlayer") as AnimationPlayer).get_animation(anim).length
	m.geste(anim, false)
	await get_tree().create_timer(dauer * 0.5).timeout
	if m.geste_laeuft:
		prop.hide()
	while is_instance_valid(m) and m.geste_laeuft:
		await get_tree().process_frame


## Gegenstand in Max' Inventar legen (auch wenn gerade Pixel spielt).
func geben(sn: String) -> void:
	if not I.is_item_in_inventory(sn, C.Max):
		if not I.is_restoring:
			Klang.jingle("aufgehoben")
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
## Raumwechsel, der erst zurückkehrt, wenn der Zielraum steht. Popochiu ignoriert ein goto_room,
## solange der vorige Wechsel noch läuft (E.in_room false); Szenen mit mehreren Räumen
## hintereinander (Welt-3-Abschluss) brauchen deshalb diese Variante.
func raum_wechseln_und_warten(sn: String) -> void:
	while not E.in_room:
		await get_tree().process_frame
	await R.goto_room(sn)
	while not (E.in_room and is_instance_valid(R.current) and R.current.script_name == sn):
		await get_tree().process_frame


## Zählt die Raumwechsel; ein Klick, der vor dem Wechsel losging, erkennt daran, dass er veraltet ist.
var raum_wechsel_nr := 0


func raum_wechseln(ziel_raum_id: String) -> void:
	var sn := Bauplan.raum_script_name(ziel_raum_id)
	if sn.is_empty():
		push_error("Raum %s fehlt im Bauplan" % ziel_raum_id)
		return
	raum_wechsel_nr += 1
	# Ein angefangener Weg (Doppelklick auf einen Ausgang während des Hingehens) liefe sonst im
	# neuen Raum zum alten Ziel weiter, meist an den rechten Rand (Sebastian, 14. November 2026).
	if is_instance_valid(C.player) and C.player.is_moving:
		C.player.stop_walking()
	herkunft_raum = R.current.script_name if is_instance_valid(R.current) else ""
	await R.goto_room(sn)


#endregion

#region Figuren ####################################################################################
## Wechsel ist erlaubt, wenn Pixel im Abschnitt spielbar ist (Welt-Tabelle), der Wechsel
## freigeschaltet ist und beide im Raum stehen. Im Prolog nie (raetsel/prolog-und-welt-1.md:
## Wechsel erst ab Welt 1).
func wechsel_moeglich() -> bool:
	if not Bauplan.figur_spielbar(Zustand.abschnitt, "pixel"):
		return false
	if not wechsel_frei():
		return false
	var regel_w = regel_wert("wechsel_moeglich")  # Welt 3: Wechsel über die Ebenen hinweg
	if regel_w != null:
		return bool(regel_w)
	return is_instance_valid(C.Pixel) and C.Pixel.is_inside_tree() \
		and is_instance_valid(C.Max) and C.Max.is_inside_tree()


## Ob der Wechsel im Abschnitt freigeschaltet ist. Die Welten setzen dafür bei der Ankunft den
## Schalter <Präfix>_WECHSEL_FREI (Welt 1: erstes Betreten der Taverne). Abschnitte ohne eigenen
## Schalter antworten über ihre Regeln (wert "wechsel_frei"): Der Abschnitt „finale“ hat vier
## Präfixe (ZS1 bis FI), dort ist der Wechsel nur im letzten Rätsel frei (skripte/finale.gd).
func wechsel_frei() -> bool:
	var regel_f = regel_wert("wechsel_frei")
	if regel_f != null:
		return bool(regel_f)
	return Zustand.ist(praefix() + "_WECHSEL_FREI")


func praefix() -> String:
	return Bauplan.plaene.get(Zustand.abschnitt, {}).get("praefix", "")


## Wechsel Max ↔ Pixel. Danach sagt die neue Figur eine Wechselzeile (zufällig, nie zweimal
## hintereinander), außer der Raum übernimmt (Taverne: erste Wechsel, TAV 0080/0090).
func figur_wechseln(mit_zeile := true) -> bool:
	if not wechsel_moeglich() or in_szene > 0 or E.playing_queue:
		if in_szene == 0 and not E.playing_queue:
			Klang.geraeusch("fehler")  # Wechsel geht hier nicht
		return false
	if regel_wert("wechsel_getrennt") == true:
		regel("figur_wechseln")  # Raumwechsel zur anderen Figur, läuft für sich weiter
		return true
	I.active = null
	Klang.geraeusch("wechsel")
	C.player = C.get_character("Pixel") if C.player.script_name == "Max" else C.get_character("Max")
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
	if schluessel.begins_with("pixel_"):
		Klang.geraeusch("pixel_miau")  # Pixel kann oder will das nicht
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
	# Beim Überspringen keine Nahansicht mitten in die übersprungene Szene (Review Fund 23); was
	# man darin lesen kann, bleibt im Inventar oder Notizbuch erreichbar.
	if testmodus or E.cutscene_skipped:
		return
	Klang.geraeusch("nahansicht")
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
	Klang.geraeusch("seite")
	in_szene += 1
	var n := NOTIZBUCH.instantiate()
	n.name = "Notizbuch"
	add_child(n)
	await n.geschlossen
	n.queue_free()
	in_szene -= 1


## Reisetasche packen (Zwischenspiele): Überlagerung, bis „Fertig gepackt“ gedrückt ist, dann
## übernimmt CQReisetasche die Auswahl. Mit Vorgaben (Tests) oder im Testmodus werden die
## Vorgaben ohne Überlagerung der Reihe nach berührt.
func reisetasche_packen(nr: int) -> void:
	var t := CQReisetasche.new(nr)
	in_szene += 1
	if testmodus or not vorgabe_tasche.is_empty():
		for sn in vorgabe_tasche:
			await t.beruehren(sn)
		vorgabe_tasche.clear()
	else:
		G.block()
		Klang.geraeusch("inventar")
		hud.visible = false  # Porträts und Pfote lägen über dem Fenster
		var n := REISETASCHE.instantiate()
		add_child(n)
		n.zeigen(t)
		await n.geschlossen
		n.queue_free()
		hud.visible = true
		G.unblock()
	await t.bestaetigen()
	in_szene -= 1


## Spielfläche eines Minispiels öffnen (oberflaeche/minispiel_*.gd). Minispiele zählen wie
## Zwischensequenzen: Speichern und Pausemenü warten, bis sie zu sind (05-spielsysteme.md,
## Speichern). Popochius Leiste bleibt gesperrt, auch wenn eine Szene im Minispiel sie freigibt.
func minispiel_oeffnen(skript: Script) -> CQMinispiel:
	in_szene += 1
	I.active = null
	minispiel = skript.new()
	minispiel.name = "Minispiel"
	add_child(minispiel)
	hud.visible = false  # Porträts und Pfote lägen über dem Fenster
	G.show_hover_text()  # der Name des Hotspots unter dem Zeiger bliebe sonst stehen
	if not testmodus:
		if not G.unblocked.is_connected(_minispiel_sperren):
			G.unblocked.connect(_minispiel_sperren)
		G.block()
	return minispiel


func minispiel_schliessen() -> void:
	if not is_instance_valid(minispiel):
		return
	minispiel.blasen_zurueck()
	minispiel.queue_free()
	minispiel = null
	in_szene -= 1
	hud.visible = true
	if not testmodus:
		if G.unblocked.is_connected(_minispiel_sperren):
			G.unblocked.disconnect(_minispiel_sperren)
		if not E.playing_queue:
			G.unblock()


func _minispiel_sperren() -> void:
	if is_instance_valid(minispiel) and not G.is_blocked:
		G.block.call_deferred()


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


## Bedingungen, die das Skript in Worten nennt (nicht „vor/nach Rätsel“). Gesprächsoptionen und
## Zurufe mit unbekanntem Text bleiben aus: Dann entscheidet der Rätselcode.
func _bedingung_text_ok(text: String) -> bool:
	return text.is_empty() or _bedingung_text_wert(text) == true


## Wert einer Bedingung in Worten; null, wenn weder das Spiel noch die Regeln sie kennen.
func _bedingung_text_wert(text: String) -> Variant:
	match text:
		"vor dem Dachboden":
			return not Zustand.war_in("dachboden")
		"nach der Nahansicht Kalender":
			return "kalender" in Zustand.nahansichten
		"solange Toadi im Raum ist":
			return is_instance_valid(R.current) and R.current.has_character("Toadi")
		"Zauberwald betreten":
			return Zustand.war_in("zauberwald")
		"Pixel auf dem Balken":
			# Taverne: Pixel sitzt auf dem Dachbalken, solange Max spielt (G17)
			return (
				is_instance_valid(R.current) and R.current.script_name == "Taverne"
				and R.current.has_character("Pixel") and C.player != C.Pixel
				and C.Pixel.position.distance_to(R.current.get_marker_position("Balken")) < 4.0
			)
		"nur mit Zeldina im Team":
			return Zustand.ist("W1_ZELDINA_FOLGT")
		"vor dem Duell":
			return not Zustand.geloest("R13")  # Welt 1, Thronsaal: Lord Moderwort
		"Feilschen", "Haustier", "richtig":
			return true  # Beschreibung der Option, keine Bedingung (Maklerin, LUFT 0410–0470)
		"wenn Ziegen dabei sind":
			return is_instance_valid(R.current) and (
				R.current.has_character("SchmiedeZiege") or R.current.has_character("XxlZiege")
			)
	var w = regel_wert("bedingung_text", text)
	if w != null:
		return bool(w)
	return null


## Öffentlicher Zugang für Gespräche und Tests.
func bedingung_text_ok(text: String) -> bool:
	return _bedingung_text_ok(text)


#endregion

#region Abschnitte #################################################################################
## Ende des Prologs: Max wird in den Fernseher gesaugt (Platzhalter-Übergang) und landet in
## Welt 1 auf dem Dorfplatz (Ankunft, skript/welt-1.md Abschnitt 1).
func prolog_beenden() -> void:
	Klang.geraeusch("zappomat_sog")
	Klang.musik("zappomat")
	if not testmodus:
		# Platzhalter fürs Einsaugen: Popochius Übergang „tunnel“ zieht ins Bild hinein
		await T.play_transition("tunnel", 1.5, T.PLAY_MODE.IN)
	prolog_beendet.emit()
	await welt_beginnen("welt-1")


## Wechsel in einen neuen Abschnitt. Mit reist nur, was die Welt-Tabelle des Ziels als
## mitgebracht führt (herkunft = früherer Abschnitt), dazu die Reisetasche selbst, das Pflichtfach
## und die Wahlfächer aus dem letzten Zwischenspiel (Wert TASCHE); der
## Dosenöffner bleibt auf dem Dachboden (raetsel/prolog-und-welt-1.md, Was auf dem Dachboden
## bleibt). Der erste Raum ist der erste Raum der Welt-Tabelle.
func welt_beginnen(ab: String) -> void:
	var mit := ["Reisetasche", PIXEL_FELD]
	mit.append_array(CQReisetasche.PFLICHT)
	mit.append_array(Zustand.wert("TASCHE", []))
	for g in Bauplan.welten.get(ab, {}).get("gegenstaende", []):
		if g.get("herkunft", "") in Bauplan.welten.keys():
			mit.append(Bauplan.gegenstand_script_name(g.id))
	for sn in C.Max.inventory.keys():
		if not sn in mit:
			await abgeben(sn)
	Zustand.abschnitt = ab
	# Dinge aus Max' eigenen Taschen (Welt-Tabelle: herkunft „max“, Welt 2: Handy, Kaugummi,
	# Kugelschreiber) hat er zu Beginn der Welt dabei.
	for g in Bauplan.welten.get(ab, {}).get("gegenstaende", []):
		if g.get("herkunft", "") == "max":
			await geben(Bauplan.gegenstand_script_name(g.id))
	herkunft_raum = ""
	var erster: Dictionary = Bauplan.welten.get(ab, {}).get("raeume", [{}])[0]
	await R.goto_room(Bauplan.raum_script_name(erster.get("id", "")))


## Ist der Abschnitt in Godot gebaut? Die Raumdaten (Bauplan) können vor den Szenen da sein;
## erst der Godot-Bau (addons/couch_quest_bau) legt Räume und Gegenstände an. Geprüft wird die
## Szene des ersten Raums der Welt-Tabelle.
func abschnitt_gebaut(ab: String) -> bool:
	var erster: Dictionary = Bauplan.welten.get(ab, {}).get("raeume", [{}])[0]
	var rid: String = str(erster.get("id", ""))
	return not rid.is_empty() and ResourceLoader.exists("res://game/rooms/%s/room_%s.tscn" % [rid, rid])


## Zwischenspiel nach einer Welt (skript/zwischenspiele-und-finale.md): zurück auf den
## Dachboden, Abschnitt „finale“ (der Dachboden gehört dort zur Welt-Tabelle), Wert
## ZWISCHENSPIEL = nr. Anders als welt_beginnen() bleibt das Inventar, wie es ist: Opa nimmt
## das Mitbringsel in der Ankunftsszene, das Packen der Reisetasche entscheidet später.
func zwischenspiel_beginnen(nr: int) -> void:
	Klang.jingle("welt_geschafft")
	Klang.geraeusch("werbeblock_start")
	Klang.musik("werbeblock")
	if not testmodus:
		await T.play_transition("tunnel", 1.5, T.PLAY_MODE.IN)
	I.active = null
	if is_instance_valid(C.Max) and C.player != C.Max:
		C.player = C.Max
	Zustand.abschnitt = "finale"
	Zustand.setze_wert("ZWISCHENSPIEL", nr)
	herkunft_raum = ""
	while not E.in_room:  # ein laufender Raumwechsel würde goto_room verschlucken
		await get_tree().process_frame
	await R.goto_room(Bauplan.raum_script_name("dachboden"))


## Finale nach Welt 4 (skript/zwischenspiele-und-finale.md, Abschnitt 4): zurück auf den
## Dachboden wie im Zwischenspiel, aber ohne Wert ZWISCHENSPIEL und mit Schalter FINALE; die
## Regeln stehen in skripte/finale.gd. Das Inventar bleibt (die Goldene Fernbedienung gibt Max in
## der Heimkehr-Szene ab).
func finale_beginnen() -> void:
	Klang.jingle("welt_geschafft")
	if not testmodus:
		await T.play_transition("tunnel", 1.5, T.PLAY_MODE.IN)
	I.active = null
	if is_instance_valid(C.Max) and C.player != C.Max:
		C.player = C.Max
	Zustand.abschnitt = "finale"
	Zustand.setze_wert("ZWISCHENSPIEL", 0)
	Zustand.setze("FINALE")
	herkunft_raum = ""
	while not E.in_room:  # ein laufender Raumwechsel würde goto_room verschlucken
		await get_tree().process_frame
	await R.goto_room(Bauplan.raum_script_name("dachboden"))


## Auswahl ohne Gesprächsfigur (Wünsche am Brunnen, Passwort an der Geheimtür): Popochius
## Inline-Dialog mit den übersetzten Texten, liefert den Index. Tests geben die Antwort über
## vorgabe_auswahl vor.
func auswahl(texte: Array) -> int:
	var index := -1
	if not vorgabe_auswahl.is_empty():
		index = int(vorgabe_auswahl.pop_front())
	else:
		var opt: PopochiuDialogOption = await D.show_inline_dialog(texte.map(func(t): return tr(t)))
		index = int(opt.id) if is_instance_valid(opt) else -1
	Telemetrie.auswahl(str(texte[index]) if index >= 0 and index < texte.size() else "", index)
	return index


## Ende des gebauten Teils (Graubox-Ausbaustand): Meldung, das Spiel läuft weiter.
func ausbau_ende(schluessel: String) -> void:
	protokoll.append(schluessel)  # für den Test sichtbar
	if is_instance_valid(hud) and not testmodus:
		hud.melden(tr(schluessel), 4.0)


#endregion
