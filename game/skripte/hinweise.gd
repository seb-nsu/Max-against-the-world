extends Node
## Autoload „Hinweise“: die Hilfe-Pfote (05-spielsysteme.md, Hinweissystem).
##
## Daten: res://daten/hinweise/<abschnitt>.json (tools/spieldaten.py). Je Schritt drei
## Hinweiszeilen; die erreichte Stufe und die Zeit des letzten Hinweises stehen im Zustand
## und werden mitgespeichert.

## Die Pfote leuchtet, wenn für den gewählten Schritt die nächste Stufe bereitliegt.
signal leuchten_geaendert(leuchtet: bool)
## Ein Hinweis wurde angefordert (Telemetrie): Schritt, gezeigte Stufe, ob die Stufe neu ist, ob
## die Wartezeile kam, Quelle „pfote“ oder „gespraech“ (Opa im Prolog). Schritt "" = nichts offen.
signal hinweis_gegeben(schritt: String, stufe: int, neu: bool, wartezeile: bool, quelle: String)

## Wartezeit bis zur Stufe (Sekunden Spielzeit seit dem letzten Hinweis). Offene Entscheidung
## in 05-spielsysteme.md: nach dem ersten Test mit Fremden anpassen.
var wartezeit := {2: 30.0, 3: 60.0}

var _leuchtet := false
var _pruef_takt := 0.0


func _process(delta: float) -> void:
	_pruef_takt += delta
	if _pruef_takt < 0.5:
		return
	_pruef_takt = 0.0
	var neu := pfote_aktiv() and naechste_stufe_bereit(schritt_waehlen())
	if neu != _leuchtet:
		_leuchtet = neu
		leuchten_geaendert.emit(neu)


func leuchtet() -> bool:
	return _leuchtet


## Im Prolog schläft Pixel bis P1; die Pfote ist bis dahin ausgegraut (Wer hilft wann).
func pfote_aktiv() -> bool:
	if Zustand.abschnitt == "prolog":
		return Zustand.geloest("P1")
	return true


## Welcher Schritt drankommt (Regeln 2 bis 4; Regel 5 „nichts offen“ liefert "").
func schritt_waehlen() -> String:
	var offen: Array = Zustand.offene_schritte()
	if offen.is_empty():
		return ""
	if Zustand.notizbuch_ziel in offen:
		return Zustand.notizbuch_ziel
	if Zustand.letzter_schritt in offen:
		return Zustand.letzter_schritt
	offen.sort_custom(func(a, b): return a.naturalnocasecmp_to(b) < 0)
	return offen[0]


func stufe(schritt: String) -> int:
	return int(Zustand.hinweis_stufe.get(schritt, 0))


func naechste_stufe_bereit(schritt: String) -> bool:
	if schritt.is_empty():
		return false
	var s := stufe(schritt)
	if s >= 3:
		return false
	if s == 0:
		return true
	var seit: float = Zustand.spielzeit - float(Zustand.hinweis_zeit.get(schritt, 0.0))
	return seit >= wartezeit[s + 1]


## Merkt sich, mit welchem Schritt der Spieler zuletzt etwas gemacht hat (Regel 3).
## objekt_id ist eine ID aus der Hinweis-Datei („objekte“), also Gegenstand- oder Objekt-ID.
func objekt_beruehrt(objekt_id: String) -> void:
	for s in _schritte():
		if objekt_id in s.get("objekte", []) and Zustand.status(s.schritt) == "offen":
			Zustand.letzter_schritt = s.schritt
			return


## Die Zeilen für den nächsten Klick auf die Pfote (oder auf Opas Hinweis-Option, mit
## mit_wartezeile = false: Opa wiederholt dann nur die letzte Stufe). Erhöht die Stufe.
func naechste_zeilen(schritt: String, mit_wartezeile := true) -> Array:
	var daten := _schritt(schritt)
	if daten.is_empty():
		return []
	var s := stufe(schritt)
	if naechste_stufe_bereit(schritt):
		s += 1
		Zustand.hinweis_stufe[schritt] = s
		Zustand.hinweis_zeit[schritt] = Zustand.spielzeit
		if s == 3:
			Zustand.stufe3_zaehler[Zustand.abschnitt] = (
				int(Zustand.stufe3_zaehler.get(Zustand.abschnitt, 0)) + 1
			)
		Zustand.geaendert.emit("HINWEIS_" + schritt)
		hinweis_gegeben.emit(schritt, s, true, false, "pfote" if mit_wartezeile else "gespraech")
		return [_zeile(daten, s)]
	# Nächste Stufe noch gesperrt: Wartezeile, dann die letzte Stufe noch einmal
	var out := []
	if mit_wartezeile and s < 3:
		var warte := _sonderzeile("wartezeile")
		if not warte.is_empty():
			out.append(warte)
	out.append(_zeile(daten, s))
	hinweis_gegeben.emit(schritt, s, false, out.size() > 1, "pfote" if mit_wartezeile else "gespraech")
	return out


## Klick auf die Pfote.
func pfote_geklickt() -> void:
	Klang.geraeusch("hinweis")
	if not pfote_aktiv():
		return
	var schritt := schritt_waehlen()
	if schritt.is_empty():
		# Regel 5: „nichts offen“-Zeile (0010 bzw. 9990), falls der Abschnitt eine hat
		hinweis_gegeben.emit("", 0, false, false, "pfote")
		var nichts := _nichts_offen_zeile()
		if not nichts.is_empty():
			await Spiel.sagen("PIX", nichts)
		return
	for z in naechste_zeilen(schritt):
		await Spiel.sagen("PIX", z)
	_pruef_takt = 1.0


func _zeile(daten: Dictionary, s: int) -> String:
	for h in daten.hinweise:
		if int(h.stufe) == s:
			return h.zeile
	return ""


func _schritte() -> Array:
	return Bauplan.hinweise.get(Zustand.abschnitt, {}).get("schritte", [])


func _schritt(schritt: String) -> Dictionary:
	for s in _schritte():
		if s.schritt == schritt:
			return s
	return {}


func _nichts_offen_zeile() -> String:
	if Zustand.abschnitt == "finale" and int(Zustand.wert("ZWISCHENSPIEL", 0)) > 0:
		return _sonderzeile("zwischenspiel")  # ZS1_HINT_PIX_0010: Tasche packen, Knopf drehen
	return _sonderzeile("nichts_offen")


## Sonderzeile der Hinweis-Datei (nichts_offen, wartezeile). Fehlt sie im Abschnitt, gilt die
## des Prologs (Welt 1 hat seit G9 eine eigene, W1_HINT_PIX_9995).
func _sonderzeile(art: String) -> String:
	var z: String = Bauplan.hinweise.get(Zustand.abschnitt, {}).get("sonderzeilen", {}).get(art, "")
	if z.is_empty():
		z = Bauplan.hinweise.get("prolog", {}).get("sonderzeilen", {}).get(art, "")
	return z
