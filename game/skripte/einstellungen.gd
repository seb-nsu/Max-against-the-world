extends Node
## Autoload „Einstellungen“: Optionen (05-spielsysteme.md, Optionen), getrennt von den
## Spielständen in user://settings.cfg, damit sie für alle Spielstände gelten.
##
## Reiter wie in üblichen PC-Spielen:
## - Audio: Gesamt, Musik, Geräusche, Stimmen (0 bis 100), stumm im Hintergrund
## - Anzeige: Fenstermodus, Fenstergröße in ganzzahligen Stufen, VSync, Bildrate
## - Spiel: Sprache, Textgeschwindigkeit, Text weiter per Klick oder automatisch, Untertitel
## - Steuerung: Tastenbelegung (eigene Aktionen, siehe BELEGBAR)
## - Barrierefreiheit: große Schrift, Hotspots dauerhaft zeigen, Hotspot-Namen zeigen,
##   Bildschirmwackeln aus, Flackern reduzieren, Farbenblind-Hilfe (Wirkung: skripte/effekte.gd)
##
## Andere Teile lesen die Werte über wert(); geändert() meldet jede Änderung.

signal geaendert(schluessel: String)

## Datei der Optionen (Tests setzen eine eigene)
var datei := "user://settings.cfg"
## Busse in default_bus_layout.tres
const BUSSE := {gesamt = "Master", musik = "Musik", geraeusche = "Geraeusche", stimmen = "Stimmen"}
const FENSTERMODI := ["fenster", "vollbild", "randlos"]
## Fenstergröße: Vielfache der Grundauflösung (tools/aufloesung.py)
const FENSTER_STUFEN := [2, 3, 4]
const BILDRATEN := [30, 60, 120, 0]           # 0 = unbegrenzt
const TEXT_TEMPI := {langsam = 0.05, normal = 0.025, schnell = 0.01, sofort = 0.0}
const SPRACHEN := ["de", "en"]
## Große Schrift vergrößert die Textebene um ein Viertel (05-spielsysteme.md, Schrift)
const GROSS_FAKTOR := 1.25
## Aktionen, die der Spieler neu belegen darf (Reihenfolge = Reihenfolge im Menü)
const BELEGBAR := ["cq_text_weiter", "cq_figur_wechseln", "cq_hotspots_zeigen", "cq_pause",
	"cq_schnellspeichern", "cq_schnellladen"]

const STANDARD := {
	gesamt = 80, musik = 70, geraeusche = 80, stimmen = 90, stumm_im_hintergrund = true,
	fenstermodus = "fenster", fenster_stufe = 3, vsync = true, bildrate = 60,
	sprache = "de", text_tempo = "normal", text_auto = false, untertitel = true,
	grosse_schrift = false, hotspots_dauerhaft = false, hotspot_namen = true, wackeln_aus = false,
	flackern_reduzieren = false, farbenblind = false,
	brabbel = true,  # Brabbel-Laute statt Stille, solange es keine Stimmdateien gibt (P4)
	platzhalter_klang = true,  # erzeugte Töne für Geräusche und Jingles ohne Datei
}

var _werte := {}
var _tasten := {}   # Aktion → Keycode, nur geänderte
var _erster_start := true


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	laden()
	anwenden.call_deferred()


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT and wert("stumm_im_hintergrund"):
		AudioServer.set_bus_mute(0, true)
	elif what == NOTIFICATION_APPLICATION_FOCUS_IN:
		AudioServer.set_bus_mute(0, false)


func wert(schluessel: String) -> Variant:
	return _werte.get(schluessel, STANDARD.get(schluessel))


func setze(schluessel: String, w: Variant) -> void:
	if _werte.get(schluessel) == w:
		return
	_werte[schluessel] = w
	_anwenden_eins(schluessel)
	speichern()
	geaendert.emit(schluessel)


## Alles auf die Standardwerte (Knopf „Zurücksetzen“ in den Optionen).
func zuruecksetzen() -> void:
	_werte = STANDARD.duplicate()
	_tasten.clear()
	InputMap.load_from_project_settings()
	anwenden()
	speichern()
	for k in STANDARD:
		geaendert.emit(k)


## Wurde das Spiel zum ersten Mal gestartet (keine settings.cfg)? Für den Epilepsie-Hinweis.
func erster_start() -> bool:
	return _erster_start


#region Datei ######################################################################################
func laden() -> void:
	_werte = STANDARD.duplicate()
	_tasten.clear()
	var cfg := ConfigFile.new()
	_erster_start = cfg.load(datei) != OK
	if _erster_start:
		return
	for k in STANDARD:
		_werte[k] = cfg.get_value("optionen", k, STANDARD[k])
	for aktion in BELEGBAR:
		if cfg.has_section_key("tasten", aktion):
			_tasten[aktion] = int(cfg.get_value("tasten", aktion))


func speichern() -> void:
	var cfg := ConfigFile.new()
	for k in _werte:
		cfg.set_value("optionen", k, _werte[k])
	for aktion in _tasten:
		cfg.set_value("tasten", aktion, _tasten[aktion])
	cfg.save(datei)
	_erster_start = false


#endregion

#region Anwenden ###################################################################################
func anwenden() -> void:
	for k in STANDARD:
		_anwenden_eins(k)
	for aktion in _tasten:
		_taste_setzen(aktion, _tasten[aktion])


func _anwenden_eins(k: String) -> void:
	if BUSSE.has(k):
		var bus := AudioServer.get_bus_index(BUSSE[k])
		if bus >= 0:
			var v := clampf(float(wert(k)) / 100.0, 0.0, 1.0)
			AudioServer.set_bus_volume_db(bus, linear_to_db(v) if v > 0.0 else -80.0)
			AudioServer.set_bus_mute(bus, v <= 0.0)
		return
	match k:
		"fenstermodus", "fenster_stufe":
			_fenster_anwenden()
		"vsync":
			DisplayServer.window_set_vsync_mode(
				DisplayServer.VSYNC_ENABLED if wert("vsync") else DisplayServer.VSYNC_DISABLED)
		"bildrate":
			Engine.max_fps = int(wert("bildrate"))
		"sprache":
			TranslationServer.set_locale(str(wert("sprache")))
		"text_tempo":
			if is_instance_valid(E):
				E.text_speed = TEXT_TEMPI.get(str(wert("text_tempo")), 0.025)
		"text_auto":
			if is_instance_valid(E):
				E.settings.auto_continue_text = bool(wert("text_auto"))
		"grosse_schrift":
			_schrift_anwenden()


func _fenster_anwenden() -> void:
	if DisplayServer.get_name() == "headless":
		return
	match str(wert("fenstermodus")):
		"vollbild":
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		"randlos":
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		_:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			var basis := Vector2i(
				int(ProjectSettings.get_setting("display/window/size/viewport_width")),
				int(ProjectSettings.get_setting("display/window/size/viewport_height")))
			var groesse := basis * int(wert("fenster_stufe"))
			var bildschirm := DisplayServer.screen_get_usable_rect().size
			while groesse.x > bildschirm.x and groesse.x > basis.x:
				groesse -= basis
			DisplayServer.window_set_size(groesse)
			DisplayServer.window_set_position((bildschirm - groesse) / 2)


## Schriftgröße in logischen Einheiten (×4 bei 1080p), mit „Große Schrift“ um ein Viertel größer.
## Schriftgrößen im Code sind für 480×270 angegeben; bei 640×360 wachsen sie mit, damit Text auf dem
## Bildschirm gleich groß bleibt (tools/aufloesung.py, Entscheidung 10. November 2026).
static var _aufloesung := float(ProjectSettings.get_setting("display/window/size/viewport_height", 270)) / 270.0


func schrift(groesse: int) -> int:
	return roundi(groesse * _aufloesung * (GROSS_FAKTOR if wert("grosse_schrift") else 1.0))


const THEMA := "res://game/gui/resources/gui_theme.tres"


func _schrift_anwenden() -> void:
	if ResourceLoader.exists(THEMA):
		(load(THEMA) as Theme).default_font_size = schrift(12)


#endregion

#region Tastenbelegung #############################################################################
## Erste Taste einer Aktion (für die Anzeige im Menü), 0 = keine.
func taste(aktion: String) -> int:
	for e in InputMap.action_get_events(aktion):
		if e is InputEventKey:
			return e.keycode if e.keycode != 0 else e.physical_keycode
	return 0


func taste_belegen(aktion: String, keycode: int) -> void:
	_tasten[aktion] = keycode
	_taste_setzen(aktion, keycode)
	speichern()
	geaendert.emit("taste_" + aktion)


func _taste_setzen(aktion: String, keycode: int) -> void:
	if not InputMap.has_action(aktion):
		return
	for e in InputMap.action_get_events(aktion):
		if e is InputEventKey:
			InputMap.action_erase_event(aktion, e)
	var neu := InputEventKey.new()
	neu.keycode = keycode
	InputMap.action_add_event(aktion, neu)


#endregion
