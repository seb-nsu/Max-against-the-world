extends Node
## Autoload „Errungenschaften“ (05-spielsysteme.md, Errungenschaften): 13 Stück, alle aus
## Schaltern, Werten und Zählern, die das Spiel ohnehin speichert. Keine verlangt Zeitdruck
## oder Raten.
##
## - Nach jeder Änderung im Zustand (und nach dem Laden) werden alle Bedingungen geprüft.
## - Freigeschaltet bleibt freigeschaltet, über alle Spielstände hinweg, wie bei Steam:
##   user://errungenschaften.cfg, getrennt von Spielständen und Optionen.
## - Ist GodotSteam eingebunden (Singleton „Steam“), meldet das Spiel jede neue Errungenschaft
##   unter ihrer ID auch an Steam und gleicht beim Start ab, was offline freigeschaltet wurde.
##   Ohne Steam zeigt die Leiste unten eine kurze Meldung.
## - Das Hauptmenü zeigt die Liste (oberflaeche/errungenschaften.gd).
##
## Bedingungen (Feld „wenn“), alles aus Zustand:
##   schalter: Name          – Schalter gesetzt
##   alle_schalter: [Namen]  – alle gesetzt
##   wert: Name, mindestens  – Wert (Zahl) mindestens so groß
##   raetsel: "abschnitt:ID" – Rätsel gelöst (Zustand.geloest)
##   ohne_pfote: Welt        – Welt beendet (WELT_ENDE) und dort keine Stufe 3 der Hilfe-Pfote
##   nahansichten: true      – alle Nahansichten aus den Welt-Tabellen geöffnet

signal freigeschaltet(id: String)

## Datei der freigeschalteten Errungenschaften (Tests setzen eine eigene)
var datei := "user://errungenschaften.cfg"

## Reihenfolge = Reihenfolge in der Liste. Die ID ist zugleich der API-Name bei Steam; Name und
## Beschreibung stehen in ui.csv unter UI_ERR_<ID> und UI_ERR_<ID>_TEXT.
const LISTE := [
	{id = "EMPFANG", wenn = {schalter = "P0_P3_GELOEST"}},
	{id = "ZIEGENFLUESTERER", wenn = {raetsel = "welt-1:R4"}},
	{id = "OHNE_PFOTE_1", wenn = {ohne_pfote = "welt-1"}},
	{id = "FUENFKAMPF", wenn = {alle_schalter = ["W2_LAUF_BESTLEISTUNG", "W2_HEBEL_BESTLEISTUNG",
		"W2_SPEER_BESTLEISTUNG", "W2_DISKUS_BESTLEISTUNG", "W2_RINGEN_BESTLEISTUNG"]}},
	{id = "OHNE_PFOTE_2", wenn = {ohne_pfote = "welt-2"}},
	{id = "DEJA_VU", wenn = {wert = "W3_SIMULATION_BESUCHE", mindestens = 3}},
	{id = "FREUND_0815", wenn = {schalter = "W3_FREUND_0815"}},
	{id = "OHNE_PFOTE_3", wenn = {ohne_pfote = "welt-3"}},
	{id = "ZAPP_MEISTER", wenn = {schalter = "W4_ALLE_KANAELE"}},
	{id = "OHNE_PFOTE_4", wenn = {ohne_pfote = "welt-4"}},
	{id = "EINKAUFSLISTE", wenn = {wert = "EINKAUFSLISTE", mindestens = 4}},
	{id = "NEUGIER", wenn = {nahansichten = true}},
	{id = "WELT_GERETTET", wenn = {schalter = "FI_ENDE_GESEHEN"}},
]

## Wann eine Welt beendet ist: Welt 1 bis 3, sobald das Zwischenspiel danach beginnt
## (Wert ZWISCHENSPIEL, Spiel.zwischenspiel_beginnen); Welt 4 mit dem letzten Rätsel.
const WELT_ENDE := {
	"welt-1": {wert = "ZWISCHENSPIEL", mindestens = 1},
	"welt-2": {wert = "ZWISCHENSPIEL", mindestens = 2},
	"welt-3": {wert = "ZWISCHENSPIEL", mindestens = 3},
	"welt-4": {raetsel = "welt-4:R13"},
}

var _frei := {}          # ID → Datum (Text)
var _pruefen_geplant := false
var _steam: Object = null


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	laden()
	if Engine.has_singleton("Steam"):
		_steam = Engine.get_singleton("Steam")
	Zustand.geaendert.connect(func(_n): _planen())
	_steam_abgleichen.call_deferred()


## Liste der IDs in Anzeige-Reihenfolge.
func ids() -> Array:
	return LISTE.map(func(e): return e.id)


func ist_frei(id: String) -> bool:
	return _frei.has(id)


func anzahl_frei() -> int:
	return _frei.size()


func datum(id: String) -> String:
	return str(_frei.get(id, ""))


## Schaltet frei (auch von Hand, etwa aus einem Raum-Skript). Doppelt schadet nicht.
func freischalten(id: String) -> void:
	if ist_frei(id) or not id in ids():
		return
	_frei[id] = Time.get_datetime_string_from_system(false, true)
	speichern()
	_steam_melden(id)
	Telemetrie.ereignis("errungenschaft", {id = id})
	freigeschaltet.emit(id)
	if _steam == null and is_instance_valid(Spiel.hud) and not Spiel.testmodus:
		Spiel.hud.melden(tr("UI_ERRUNGENSCHAFT_FREI") % tr("UI_ERR_" + id), 4.0)


#region Prüfen #####################################################################################
func _planen() -> void:
	if _pruefen_geplant:
		return
	_pruefen_geplant = true
	pruefen.call_deferred()


## Prüft alle Bedingungen gegen den aktuellen Zustand.
func pruefen() -> void:
	_pruefen_geplant = false
	for e in LISTE:
		if not ist_frei(e.id) and erfuellt(e.wenn):
			freischalten(e.id)


func erfuellt(wenn: Dictionary) -> bool:
	if wenn.has("schalter"):
		return Zustand.ist(wenn.schalter)
	if wenn.has("alle_schalter"):
		return wenn.alle_schalter.all(func(s): return Zustand.ist(s))
	if wenn.has("wert"):
		var w = Zustand.wert(wenn.wert, 0)
		return (w is int or w is float) and w >= wenn.mindestens
	if wenn.has("raetsel"):
		var teile: PackedStringArray = str(wenn.raetsel).split(":")
		return Zustand.geloest(teile[1], teile[0])
	if wenn.has("ohne_pfote"):
		return welt_beendet(wenn.ohne_pfote) \
			and int(Zustand.stufe3_zaehler.get(wenn.ohne_pfote, 0)) == 0
	if wenn.has("nahansichten"):
		var alle := alle_nahansichten()
		return not alle.is_empty() and alle.all(func(n): return n in Zustand.nahansichten)
	push_error("Errungenschaften: Bedingung unbekannt %s" % wenn)
	return false


func welt_beendet(welt: String) -> bool:
	return WELT_ENDE.has(welt) and erfuellt(WELT_ENDE[welt])


## Alle Nahansichten des Spiels aus den Welt-Tabellen (Feld „nahansicht“ bei Gegenständen,
## Liste „nahansichten“), dieselbe Zählung wie tools/pruefen.py.
func alle_nahansichten() -> Array:
	var out := []
	for ab in Bauplan.welten:
		for g in Bauplan.welten[ab].get("gegenstaende", []):
			if g.get("nahansicht", false):
				out.append(g.id)
		for n in Bauplan.welten[ab].get("nahansichten", []):
			out.append(n.id)
	return out


#endregion

#region Datei und Steam #############################################################################
func laden() -> void:
	_frei.clear()
	var cfg := ConfigFile.new()
	if cfg.load(datei) != OK:
		return
	for id in ids():
		if cfg.has_section_key("frei", id):
			_frei[id] = cfg.get_value("frei", id)


func speichern() -> void:
	var cfg := ConfigFile.new()
	for id in _frei:
		cfg.set_value("frei", id, _frei[id])
	cfg.save(datei)


## Alles zurücknehmen (nur für Tests und den Debug-Build).
func zuruecksetzen() -> void:
	_frei.clear()
	speichern()


func _steam_melden(id: String) -> void:
	if _steam == null:
		return
	_steam.call("setAchievement", id)
	_steam.call("storeStats")


## Was offline freigeschaltet wurde, nachträglich an Steam melden.
func _steam_abgleichen() -> void:
	if _steam == null:
		return
	for id in _frei:
		_steam.call("setAchievement", id)
	if not _frei.is_empty():
		_steam.call("storeStats")


#endregion
