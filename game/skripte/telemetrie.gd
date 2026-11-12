extends Node
## Autoload „Telemetrie“: anonymes Spielprotokoll im Testbuild (03-produktion.md, A9 und
## Zeile „Testen“).
##
## Aktiv nur, wenn beides gilt:
## - Der Build ist ein Testbuild: Feature-Tag „cq_testbuild“ (export_presets.cfg) oder, zum
##   Ausprobieren im Editor, die Projekteinstellung couch_quest/testbuild = true.
## - Der Tester hat zugestimmt. Gefragt wird einmal beim ersten Start mit einem Dialog im Spiel;
##   die Antwort steht in user://telemetrie/einwilligung.cfg und lässt sich in den Einstellungen
##   ändern.
##
## Anonym: Die Sitzungs-ID ist zufällig, die Tester-ID auch (einmal bei der Zustimmung erzeugt,
## damit mehrere Sitzungen eines Testers zusammengehören). Keine Namen, keine Pfade, keine
## Rechnerdaten außer dem Betriebssystem-Namen.
##
## Jede Sitzung schreibt user://telemetrie/<sitzung>.jsonl, ein JSON-Objekt je Zeile. Es gibt
## keinen Upload: Tester öffnen den Ordner über die Einstellungen („Telemetrie-Ordner öffnen“,
## im Web-Build „Telemetrie herunterladen“) und schicken die Datei. Auswertung: tools/telemetrie_auswertung.py.
##
## Felder in jeder Zeile: ev (Ereignis), t (Sekunden seit Sitzungsbeginn, Echtzeit), spielzeit
## (Zustand.spielzeit, wird mitgespeichert), abschnitt, raum. Ereignisse und Zusatzfelder:
##
## | ev               | Zusatzfelder                                                         |
## | sitzung_start    | format, sitzung, tester, build, godot, os, sprache, testmodus        |
## | raum_betreten    | –                                                                    |
## | raum_verlassen   | dauer (Sekunden Echtzeit im Raum)                                    |
## | schritt_offen    | schritt (Rätsel-ID der Welt-Tabelle = Schritt der Hinweis-Datei)     |
## | schritt_geloest  | schritt, sammel (Sammelschritt wie R1 ohne eigenen Schalter)         |
## | hinweis          | schritt, stufe, neu (neue Stufe), wartezeile, quelle (pfote/gespraech)|
## | ersatz           | zeile, sprecher                                                      |
## | fehlklick        | objekt, aktion (benutzen/ansehen/gegenstand), gegenstand, zeile      |
## | klick_leer       | taste (links/rechts), gegenstand (ausgewählter Gegenstand oder "")   |
## | dialog_option    | dialog, option                                                       |
## | auswahl          | option (Text-Schlüssel der gewählten Auswahl), index                 |
## | speichern, laden | platz                                                                |
## | sitzung_ende     | grund, dauer                                                         |

const FORMAT := 1
const ORDNER_STANDARD := "user://telemetrie/"
const EINWILLIGUNG := "einwilligung.cfg"
const THEMA := "res://game/gui/resources/gui_theme.tres"

## Ordner der Protokolle (Tests nutzen einen eigenen)
var ordner := ORDNER_STANDARD
## Testbuild? Tests setzen das von Hand.
var testbuild: bool = OS.has_feature("cq_testbuild") \
	or bool(ProjectSettings.get_setting("couch_quest/testbuild", false))
## Zufällige ID der laufenden Sitzung ("" = keine Sitzung)
var sitzung := ""

var _datei: FileAccess
var _pfad := ""
var _start_ms := 0
var _raum := ""
var _raum_seit_ms := 0
## Rätselstatus je „abschnitt/schritt“ beim letzten Prüfen
var _status := {}
var _pruefen_geplant := false
## Beim nächsten Prüfen nur abgleichen, nichts melden (Sitzungsbeginn, Laden)
var _still := true
## Laufende Spieleraktionen (Objekt, Art, Gegenstand), für Fehlklicks
var _aktionen: Array[Dictionary] = []
var _frage: CanvasLayer


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	Zustand.geaendert.connect(_zustand_geaendert)
	Hinweise.hinweis_gegeben.connect(_hinweis_gegeben)
	Spiel.ersatz_gesagt.connect(_ersatz_gesagt)
	if not testbuild:
		return
	match einwilligung():
		1:
			sitzung_starten()
		-1:
			frage_zeigen.call_deferred()


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		sitzung_beenden("fenster_geschlossen")


func _exit_tree() -> void:
	sitzung_beenden("beendet")


func aktiv() -> bool:
	return _datei != null


#region Einwilligung ###############################################################################
## 1 = zugestimmt, 0 = abgelehnt, -1 = noch nicht gefragt
func einwilligung() -> int:
	var cfg := ConfigFile.new()
	if cfg.load(ordner + EINWILLIGUNG) != OK or not cfg.has_section_key("telemetrie", "einwilligung"):
		return -1
	return 1 if bool(cfg.get_value("telemetrie", "einwilligung")) else 0


## Speichert die Antwort; bei Ja startet die Sitzung (nur im Testbuild), bei Nein endet sie.
func einwilligung_setzen(ja: bool) -> void:
	DirAccess.make_dir_recursive_absolute(ordner)
	var cfg := ConfigFile.new()
	cfg.load(ordner + EINWILLIGUNG)
	cfg.set_value("telemetrie", "einwilligung", ja)
	if ja and str(cfg.get_value("telemetrie", "tester", "")).is_empty():
		cfg.set_value("telemetrie", "tester", _zufalls_id())
	if not ja:
		cfg.set_value("telemetrie", "tester", "")  # neue Tester-ID bei erneuter Zustimmung
	cfg.save(ordner + EINWILLIGUNG)
	if ja and testbuild:
		sitzung_starten()
	elif not ja:
		sitzung_beenden("widerrufen")


func _tester_id() -> String:
	var cfg := ConfigFile.new()
	cfg.load(ordner + EINWILLIGUNG)
	return str(cfg.get_value("telemetrie", "tester", ""))


## Dialog beim ersten Start (Texte in docs/uebersetzung/ui.csv, UI_TELEMETRIE_*).
func frage_zeigen() -> void:
	if is_instance_valid(_frage):
		return
	_frage = CanvasLayer.new()
	_frage.layer = 100
	add_child(_frage)
	var wurzel := ColorRect.new()
	wurzel.color = Color(0.08, 0.09, 0.15, 1.0)  # deckend, sonst scheint beim ersten Start der Epilepsie-Hinweis durch
	wurzel.set_anchors_preset(Control.PRESET_FULL_RECT)
	wurzel.mouse_filter = Control.MOUSE_FILTER_STOP
	if ResourceLoader.exists(THEMA):
		wurzel.theme = load(THEMA)
	_frage.add_child(wurzel)
	var spalte := VBoxContainer.new()
	spalte.position = Vector2(32, 28)
	spalte.size = Vector2(576, 304)
	spalte.add_theme_constant_override("separation", 6)
	wurzel.add_child(spalte)
	var titel := Label.new()
	titel.text = tr("UI_TELEMETRIE_TITEL")
	titel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	spalte.add_child(titel)
	var text := Label.new()
	text.text = tr("UI_TELEMETRIE_FRAGE")
	text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	text.custom_minimum_size = Vector2(576, 0)
	text.size_flags_vertical = Control.SIZE_EXPAND_FILL
	spalte.add_child(text)
	var knoepfe := HBoxContainer.new()
	knoepfe.alignment = BoxContainer.ALIGNMENT_CENTER
	knoepfe.add_theme_constant_override("separation", 16)
	spalte.add_child(knoepfe)
	for ja in [true, false]:
		var b := Button.new()
		b.text = tr("UI_TELEMETRIE_JA" if ja else "UI_TELEMETRIE_NEIN")
		b.pressed.connect(_frage_beantwortet.bind(ja))
		knoepfe.add_child(b)


func _frage_beantwortet(ja: bool) -> void:
	einwilligung_setzen(ja)
	if is_instance_valid(_frage):
		_frage.queue_free()
	Spiel.melden("UI_TELEMETRIE_DANKE" if ja else "UI_TELEMETRIE_AUS")


## Für die Einstellungen: Ordner im Dateimanager öffnen, damit Tester die Datei schicken können.
## Im Web-Build gibt es keinen Ordner: Der Browser lädt dann alle Sitzungen als eine Datei herunter.
func ordner_oeffnen() -> void:
	DirAccess.make_dir_recursive_absolute(ordner)
	if _datei:
		_datei.flush()
	if OS.has_feature("web"):
		var alles := PackedByteArray()
		for name in DirAccess.get_files_at(ordner):
			if name.ends_with(".jsonl"):
				alles.append_array(FileAccess.get_file_as_bytes(ordner.path_join(name)))
		JavaScriptBridge.download_buffer(alles, "couch_quest_telemetrie.jsonl", "application/x-ndjson")
		return
	OS.shell_show_in_file_manager(ProjectSettings.globalize_path(ordner), true)


#endregion

#region Sitzung ####################################################################################
func sitzung_starten() -> void:
	if aktiv():
		return
	DirAccess.make_dir_recursive_absolute(ordner)
	sitzung = "%s-%s" % [Time.get_datetime_string_from_system(true).replace(":", "").replace("-", ""),
		_zufalls_id().left(8)]
	_pfad = ordner + sitzung + ".jsonl"
	_datei = FileAccess.open(_pfad, FileAccess.WRITE)
	if not _datei:
		push_warning("Telemetrie: %s nicht schreibbar" % _pfad)
		sitzung = ""
		return
	_start_ms = Time.get_ticks_msec()
	_status.clear()
	_aktionen.clear()
	_still = true
	_raum = ""
	ereignis("sitzung_start", {
		format = FORMAT,
		sitzung = sitzung,
		tester = _tester_id(),
		build = _build(),
		godot = Engine.get_version_info().string,
		os = OS.get_name(),
		sprache = TranslationServer.get_locale(),
		testmodus = Spiel.testmodus,
	})
	if is_instance_valid(R.current) and R.current.has_method("raum_id"):
		raum_betreten(R.current.raum_id())
	_schritte_pruefen()


func sitzung_beenden(grund: String) -> void:
	if not aktiv():
		return
	_raum_verlassen()
	ereignis("sitzung_ende", {grund = grund, dauer = _sekunden(_start_ms)})
	_datei.close()
	_datei = null
	sitzung = ""


## Pfad der laufenden Protokolldatei (für Tests und die Meldung in den Einstellungen)
func pfad() -> String:
	return _pfad


## Schreibt eine Zeile, wenn eine Sitzung läuft. daten überschreibt die Grundfelder.
func ereignis(ev: String, daten := {}) -> void:
	if not aktiv():
		return
	var zeile := {
		ev = ev,
		t = _sekunden(_start_ms),
		spielzeit = snappedf(Zustand.spielzeit, 0.1),
		abschnitt = Zustand.abschnitt,
		raum = _raum,
	}
	zeile.merge(daten, true)
	_datei.store_line(JSON.stringify(zeile, "", false))
	_datei.flush()


## Build-Kennung: application/config/version (der Workflow „Testbuild“ setzt dort den Commit),
## sonst „lokal“.
func _build() -> String:
	var v := str(ProjectSettings.get_setting("application/config/version", ""))
	return v if not v.is_empty() else "lokal"


func _sekunden(seit_ms: int) -> float:
	return snappedf((Time.get_ticks_msec() - seit_ms) / 1000.0, 0.1)


func _zufalls_id() -> String:
	return Crypto.new().generate_random_bytes(8).hex_encode()


#endregion

#region Ereignisse aus dem Spiel ###################################################################
func raum_betreten(raum_id: String) -> void:
	if not aktiv() or raum_id == _raum:
		return
	_raum_verlassen()
	_raum = raum_id
	_raum_seit_ms = Time.get_ticks_msec()
	ereignis("raum_betreten")


func _raum_verlassen() -> void:
	if _raum.is_empty():
		return
	ereignis("raum_verlassen", {dauer = _sekunden(_raum_seit_ms)})
	_raum = ""


## Eine Spieleraktion auf ein Objekt beginnt (Basisklassen CQHotspot, CQProp, CQFigur,
## CQGegenstand). Endet sie mit einer Ersatzzeile, ist das ein Fehlklick auf dieses Objekt.
func aktion_beginnen(objekt: String, aktion: String, gegenstand := "") -> void:
	_aktionen.push_back({objekt = objekt, aktion = aktion, gegenstand = gegenstand})


func aktion_beenden() -> void:
	if not _aktionen.is_empty():
		_aktionen.pop_back()


## Gegenstand-ID der Welt-Tabellen (Pixel-Feld: „pixel_feld“).
func gegenstand_id(item: PopochiuInventoryItem) -> String:
	if not is_instance_valid(item):
		return ""
	return Bauplan.gegenstand(item.script_name).get("id", item.script_name.to_snake_case())


func _ersatz_gesagt(sprecher: String, zeile: String) -> void:
	ereignis("ersatz", {zeile = zeile, sprecher = sprecher})
	if not _aktionen.is_empty():
		var a: Dictionary = _aktionen.back()
		ereignis("fehlklick", {objekt = a.objekt, aktion = a.aktion, gegenstand = a.gegenstand, zeile = zeile})


func _hinweis_gegeben(schritt: String, stufe: int, neu: bool, wartezeile: bool, quelle: String) -> void:
	ereignis("hinweis", {schritt = schritt, stufe = stufe, neu = neu, wartezeile = wartezeile, quelle = quelle})


func dialog_option(dialog: String, option: String) -> void:
	ereignis("dialog_option", {dialog = dialog, option = option})


func auswahl(option: String, index: int) -> void:
	ereignis("auswahl", {option = option, index = index})


func gespeichert(platz: String) -> void:
	ereignis("speichern", {platz = platz})


func geloescht(platz: String) -> void:
	ereignis("loeschen", {platz = platz})


func geladen(platz: String) -> void:
	_still = true  # der geladene Stand gilt als Ausgangslage, kein „gelöst“/„offen“ melden
	ereignis("laden", {platz = platz})


## Klicks ins Leere: Maustaste im Raum, kein Objekt unter dem Zeiger, keine Szene, kein Gespräch.
func _unhandled_input(event: InputEvent) -> void:
	if not aktiv() or not event is InputEventMouseButton or not event.pressed:
		return
	if not event.button_index in [MOUSE_BUTTON_LEFT, MOUSE_BUTTON_RIGHT]:
		return
	if not E.in_room or E.hovered or E.playing_queue or Spiel.in_szene > 0 \
			or is_instance_valid(D.current_dialog):
		return
	ereignis("klick_leer", {
		taste = "links" if event.button_index == MOUSE_BUTTON_LEFT else "rechts",
		gegenstand = gegenstand_id(I.active) if I.active else "",
	})


func _zustand_geaendert(name: String) -> void:
	if name == "*":
		_still = true
	if aktiv() and not _pruefen_geplant:
		_pruefen_geplant = true
		_schritte_pruefen.call_deferred()


## Rätselschritte, deren Status sich geändert hat, als schritt_offen/schritt_geloest melden.
## Status wie Hinweise und Notizbuch (Zustand.status: gesperrt, offen, geloest).
func _schritte_pruefen() -> void:
	_pruefen_geplant = false
	if not aktiv():
		return
	var ab := Zustand.abschnitt
	for r in Zustand.alle_raetsel(ab):
		var schluessel: String = ab + "/" + r.id
		var neu := Zustand.status(r.id, ab)
		var alt: String = _status.get(schluessel, "gesperrt")
		_status[schluessel] = neu
		if _still or neu == alt:
			continue
		if neu == "offen":
			ereignis("schritt_offen", {schritt = r.id})
		elif neu == "geloest":
			ereignis("schritt_geloest", {schritt = r.id, sammel = r.get("schalter", []).is_empty()})
	_still = false


#endregion
