extends Node
## Autoload „Zustand“: das gemeinsame Zustandssystem (03-produktion.md, System 1).
##
## Gespeichert werden nur Schalter und Werte (05-spielsysteme.md, Speichern, Regeln für den
## Code). Alles, was daraus folgt, wird abgeleitet und nie gespeichert:
## - Rätselschritt gelöst  = alle „…_GELOEST“-Schalter des Rätsels aus der Welt-Tabelle sind
##                           gesetzt (z. B. P0_P1_GELOEST); Sammelschritte (R1): alle Teile gelöst
## - Rätselschritt offen   = nicht gelöst, sein Raum wurde betreten, und jede Voraussetzung aus
##                           „benoetigt“ ist erfüllt: Rätsel gelöst, Gegenstand erreichbar
##                           (Fundraum erreichbar oder Herkunftsrätsel gelöst)
## - sonst gesperrt
## Code-Sicht (Welt 3) und Fernbedienung (Welt 4) sollen dieselben Schalter nutzen.

signal geaendert(name: String)

## Schalter (Name → true/false), Namen wie in den Welt-Tabellen
var schalter := {}
## Werte, die keine Schalter sind (Name → JSON-fähiger Wert)
var werte := {}
## Aktueller Abschnitt (prolog, welt-1 …)
var abschnitt := "prolog"
## Spielzeit in Sekunden (läuft nur, solange ein Raum aktiv ist)
var spielzeit := 0.0
## Betretene Räume (Raum-IDs der Welt-Tabellen)
var besucht: Array = []
## Geöffnete Nahansichten (für Notizbuch und Errungenschaft „Neugier“)
var nahansichten: Array = []
## Hilfe-Pfote: erreichte Stufe und Spielzeit des letzten Hinweises je Schritt
var hinweis_stufe := {}
var hinweis_zeit := {}
## Stufe-3-Hinweise je Abschnitt (Errungenschaften „Ohne Pfote“)
var stufe3_zaehler := {}
## Wie oft jedes Objekt (je Zustand) angesehen wurde: „Raum/Objekt|zustand“ → Anzahl
## (Ansehen-Wiederholung, Spiel.ansehen())
var angesehen := {}
## Im Notizbuch gewähltes Ziel und zuletzt berührter Schritt (Hinweis-Regeln 2 und 3)
var notizbuch_ziel := ""
var letzter_schritt := ""


func _process(delta: float) -> void:
	if is_instance_valid(E) and E.in_room:
		spielzeit += delta


#region Schalter und Werte #########################################################################
func ist(name: String) -> bool:
	return bool(schalter.get(name, false))


func setze(name: String, an := true) -> void:
	if ist(name) == an:
		return
	schalter[name] = an
	geaendert.emit(name)


func wert(name: String, standard: Variant = null) -> Variant:
	return werte.get(name, standard)


func setze_wert(name: String, w: Variant) -> void:
	if werte.get(name) == w:
		return
	werte[name] = w
	geaendert.emit(name)


## Zählt ein Ansehen und liefert, das wievielte es war (1, 2 …).
func ansehen_zaehlen(schluessel: String) -> int:
	angesehen[schluessel] = int(angesehen.get(schluessel, 0)) + 1
	return angesehen[schluessel]


func besuche(raum_id: String) -> void:
	if not raum_id in besucht:
		besucht.append(raum_id)
		geaendert.emit("BESUCHT_" + raum_id)


func war_in(raum_id: String) -> bool:
	return raum_id in besucht


func nahansicht_gesehen(id: String) -> void:
	if not id in nahansichten:
		nahansichten.append(id)
		geaendert.emit("NAHANSICHT_" + id)


#endregion

#region Rätsel #####################################################################################
func raetsel(id: String, ab := "") -> Dictionary:
	for r in Bauplan.welten.get(ab if ab else abschnitt, {}).get("raetsel", []):
		if r.id == id:
			return r
	return {}


func alle_raetsel(ab := "") -> Array:
	return Bauplan.welten.get(ab if ab else abschnitt, {}).get("raetsel", [])


## Setzt alle Schalter des Rätsels (Welt-Tabelle, Feld „schalter“).
func loese(id: String, ab := "") -> void:
	var r := raetsel(id, ab)
	if r.is_empty():
		push_error("Zustand: Rätsel %s unbekannt" % id)
		return
	for s in r.schalter:
		setze(s)


## Gelöst = alle „…_GELOEST“-Schalter des Rätsels sind gesetzt. Andere Schalter in der Liste
## (etwa der Begleiter-Schalter W1_ZIEGEN_FOLGEN bei R3) sind Folgen und dürfen später wieder
## aus gehen. Sammelschritte ohne eigenen Schalter (R1, R4) sind gelöst, wenn alle Rätsel
## unter „benoetigt“ gelöst sind.
func geloest(id: String, ab := "") -> bool:
	var r := raetsel(id, ab)
	if r.is_empty():
		return false
	var eigene: Array = r.schalter.filter(func(s): return str(s).ends_with("_GELOEST"))
	if eigene.is_empty():
		var teile: Array = r.get("benoetigt", []).filter(func(b): return not raetsel(b, ab).is_empty())
		if teile.is_empty():
			return false
		return teile.all(func(b): return geloest(b, ab))
	return eigene.all(func(s): return ist(s))


## „gesperrt“, „offen“ oder „geloest“ (05-spielsysteme.md, Hinweissystem, Regel 1)
func status(id: String, ab := "") -> String:
	ab = ab if ab else abschnitt
	if geloest(id, ab):
		return "geloest"
	var r := raetsel(id, ab)
	if r.is_empty():
		return "gesperrt"
	if not Bauplan.gebaut(ab, id):
		return "gesperrt"  # noch nicht gebaut (Graubox-Ausbaustand): Pfote und Notizbuch schweigen
	if not war_in(r.raum):
		return "gesperrt"
	for v in r.get("benoetigt", []):
		if not _voraussetzung(v, ab):
			return "gesperrt"
	var eins: Array = r.get("benoetigt_eins_von", [])
	if not eins.is_empty() and not eins.any(func(v): return _voraussetzung(v, ab)):
		return "gesperrt"
	return "offen"


func offene_schritte(ab := "") -> Array:
	return alle_raetsel(ab).filter(func(r): return status(r.id, ab) == "offen").map(
		func(r): return r.id
	)


func _voraussetzung(v: String, ab: String) -> bool:
	if not raetsel(v, ab).is_empty():
		return geloest(v, ab)
	var g := _gegenstand(v, ab)
	if g.is_empty():
		return true  # mitgebracht oder unbekannt: prüft tools/pruefen.py
	var herkunft: String = g.get("herkunft", "")
	if not raetsel(herkunft, ab).is_empty():
		return geloest(herkunft, ab)
	var raum := _raum(herkunft, ab)
	if not raum.is_empty():
		var ab_wann: String = str(raum.get("erreichbar_ab", "start"))
		return ab_wann == "start" or geloest(ab_wann, ab)
	return true


func _gegenstand(id: String, ab: String) -> Dictionary:
	for g in Bauplan.welten.get(ab, {}).get("gegenstaende", []):
		if g.id == id:
			return g
	return {}


func _raum(id: String, ab: String) -> Dictionary:
	for r in Bauplan.welten.get(ab, {}).get("raeume", []):
		if r.id == id:
			return r
	return {}


#endregion

#region Speichern ##################################################################################
## Alles, was dieser Zustand speichert (Teil des Spielstands, über Globals.on_save).
func speichern() -> Dictionary:
	return {
		schalter = schalter.duplicate(true),
		werte = werte.duplicate(true),
		abschnitt = abschnitt,
		spielzeit = spielzeit,
		besucht = besucht.duplicate(),
		angesehen = angesehen.duplicate(),
		nahansichten = nahansichten.duplicate(),
		hinweis_stufe = hinweis_stufe.duplicate(),
		hinweis_zeit = hinweis_zeit.duplicate(),
		stufe3_zaehler = stufe3_zaehler.duplicate(),
		notizbuch_ziel = notizbuch_ziel,
		letzter_schritt = letzter_schritt,
	}


func laden(d: Dictionary) -> void:
	schalter = d.get("schalter", {}).duplicate(true)
	werte = {}
	for k in d.get("werte", {}):
		werte[k] = _ganzzahl_wenn_moeglich(d.werte[k])
	abschnitt = d.get("abschnitt", "prolog")
	spielzeit = float(d.get("spielzeit", 0.0))
	besucht = d.get("besucht", []).duplicate()
	nahansichten = d.get("nahansichten", []).duplicate()
	angesehen = {}
	for k in d.get("angesehen", {}):
		angesehen[k] = int(d.angesehen[k])
	hinweis_stufe = {}
	for k in d.get("hinweis_stufe", {}):
		hinweis_stufe[k] = int(d.hinweis_stufe[k])  # JSON liefert float
	hinweis_zeit = d.get("hinweis_zeit", {}).duplicate()
	stufe3_zaehler = {}
	for k in d.get("stufe3_zaehler", {}):
		stufe3_zaehler[k] = int(d.stufe3_zaehler[k])
	notizbuch_ziel = d.get("notizbuch_ziel", "")
	letzter_schritt = d.get("letzter_schritt", "")
	geaendert.emit("*")


# JSON kennt nur float: ganze Zahlen kommen als ganze Zahlen zurück.
func _ganzzahl_wenn_moeglich(v: Variant) -> Variant:
	if v is float and v == floorf(v) and absf(v) < 1e15:
		return int(v)
	return v


func zuruecksetzen() -> void:
	laden({})


#endregion
