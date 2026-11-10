extends Node
## Autoload „Bauplan“: liest die erzeugten Spieldaten (nie von Hand bearbeiten).
##
## - res://daten/raeume/<abschnitt>.json   Bauplan aus tools/godot_raeume.py (Hotspots, Ansehen,
##                                           Nehmen, Gespräche, Zurufe, Ersatzzeilen)
## - res://daten/welten/<abschnitt>.json   Welt-Tabelle aus tools/spieldaten.py (Rätsel, Schalter)
## - res://daten/hinweise/<abschnitt>.json Hinweis-Datei aus tools/spieldaten.py (Hilfe-Pfote)

const RAEUME := "res://daten/raeume/"
const WELTEN := "res://daten/welten/"
const HINWEISE := "res://daten/hinweise/"

## Abschnitt → Bauplan, Welt-Tabelle, Hinweis-Datei
var plaene := {}
var welten := {}
var hinweise := {}
## Kürzel → Liste der Ersatzzeilen (SYS_ERS_*)
var ersatz := {}
## Kürzel → Wiederholungs-Pool fürs Ansehen ab dem dritten Mal (SYS_WDH_*)
var wiederholung := {}
## Kürzel → Pool „Plauderoptionen erschöpft“ (SYS_PLA_*)
var plauder := {}

var _raeume := {}        # Raum-script_name → {abschnitt, daten}
var _objekte := {}       # "Raum/Objekt" → Daten (Hotspot, Prop oder Ausgang)
var _figuren := {}       # script_name → Daten
var _gegenstaende := {}  # script_name → Daten
var _dialoge := {}       # script_name → Daten


func _init() -> void:
	laden()


func laden() -> void:
	for ordner_ziel in [[WELTEN, welten], [HINWEISE, hinweise], [RAEUME, plaene]]:
		var ordner: String = ordner_ziel[0]
		for datei in _dateien(ordner):
			ordner_ziel[1][datei.get_basename()] = _json(ordner + datei)
	# In Spielreihenfolge zusammenlegen (das Finale kommt alphabetisch zuerst, spielt aber zuletzt):
	# der erste Zustand eines Gegenstands ist der aus dem frühesten Abschnitt
	var reihe: Array = plaene.keys()
	reihe.sort_custom(func(x, y): return (x != "finale" and y == "finale") or ((x == "finale") == (y == "finale") and x < y))
	for ab in reihe:
		var plan: Dictionary = plaene[ab]
		for r in plan.raeume:
			_raeume[r.script_name] = {abschnitt = ab, daten = r}
			for liste in ["hotspots", "props", "ausgaenge"]:
				for o in r[liste]:
					_objekte["%s/%s" % [r.script_name, o.script_name]] = o
		for f in plan.figuren:
			_figuren[f.script_name] = _vereinen(_figuren.get(f.script_name, {}), f)
		for g in plan.gegenstaende:
			_gegenstaende[g.script_name] = _vereinen(_gegenstaende.get(g.script_name, {}), g)
		for d in plan.dialoge:
			_dialoge[d.script_name] = d
		for k in plan.ersatz:
			ersatz[k] = plan.ersatz[k]
		for k in plan.get("wiederholung", {}):
			wiederholung[k] = plan.wiederholung[k]
		for k in plan.get("plauder", {}):
			plauder[k] = plan.plauder[k]


## Figuren und Gegenstände kommen in mehreren Abschnitten vor (Max, Thunfischdose): Listen
## (Ansehen-Zeilen, Kombinationen) und Bilder werden zusammengelegt, sonst gilt der spätere Plan.
func _vereinen(alt: Dictionary, neu: Dictionary) -> Dictionary:
	if alt.is_empty():
		return neu.duplicate(true)
	var out := alt.duplicate(true)
	for k in neu:
		if k == "zustaende":
			# Vereinigung in Reihenfolge: der erste Zustand (Standard) bleibt der aus dem frühesten
			# Abschnitt (Kochlöffel „ohne_kaese“ aus Welt 1, nicht „zauberstab“ aus Welt 2)
			for z in neu[k]:
				if not z in out.get(k, []):
					out[k] = out.get(k, []) + [z]
		elif out.get(k) is Array and neu[k] is Array:
			out[k] = out[k] + neu[k]
		elif out.get(k) is Dictionary and neu[k] is Dictionary:
			out[k].merge(neu[k], true)
		else:
			out[k] = neu[k]
	return out


## Rätselschritte, die im Abschnitt gebaut sind (Layout „_ausbau“); andere bleiben gesperrt.
func gebaut(abschnitt: String, raetsel_id: String) -> bool:
	var plan: Dictionary = plaene.get(abschnitt, {})
	return raetsel_id in plan.get("ausbau", [])


## Figurenwechsel-Zeilen des Abschnitts (Pools zu_pixel/zu_max und feste Fälle wie pixel_tuer).
func figurenwechsel(abschnitt: String) -> Dictionary:
	return plaene.get(abschnitt, {}).get("figurenwechsel", {})


## Sprecherkürzel → script_name der Figur (MAX → Max, TOA → Toadi). Kürzel können sich zwischen
## Welten wiederholen (SCH: Schmied in Welt 1, Schreiber in Welt 2): die Figuren des aktuellen
## Abschnitts gehen vor.
func figur_zu_kuerzel(kuerzel: String) -> String:
	for f in plaene.get(Zustand.abschnitt, {}).get("figuren", []):
		if f.get("kuerzel") == kuerzel:
			return f.script_name
	for sn in _figuren:
		if _figuren[sn].get("kuerzel") == kuerzel:
			return sn
	return ""


func raum(script_name: String) -> Dictionary:
	return _raeume.get(script_name, {}).get("daten", {})


func raum_abschnitt(script_name: String) -> String:
	return _raeume.get(script_name, {}).get("abschnitt", "")


## Raum-ID der Welt-Tabelle (dachboden) → script_name (Dachboden)
func raum_script_name(raum_id: String) -> String:
	for sn in _raeume:
		if _raeume[sn].daten.id == raum_id:
			return sn
	return ""


func objekt(raum_script_name: String, objekt_script_name: String) -> Dictionary:
	return _objekte.get("%s/%s" % [raum_script_name, objekt_script_name], {})


func figur(script_name: String) -> Dictionary:
	return _figuren.get(script_name, {})


func gegenstand(script_name: String) -> Dictionary:
	return _gegenstaende.get(script_name, {})


func gegenstand_script_name(id: String) -> String:
	for sn in _gegenstaende:
		if _gegenstaende[sn].id == id:
			return sn
	return ""


func dialog(script_name: String) -> Dictionary:
	return _dialoge.get(script_name, {})


## Ob eine Figur im Abschnitt spielbar ist (Welt-Tabelle, Feld „spielbar“).
func figur_spielbar(abschnitt: String, figur_id: String) -> bool:
	for f in welten.get(abschnitt, {}).get("figuren", []):
		if f.id == figur_id:
			return bool(f.get("spielbar", false))
	return false


func nahansicht(id: String) -> Dictionary:
	for ab in plaene:
		for n in plaene[ab].get("nahansichten", []):
			if n.id == id:
				return n
	return {}


func _dateien(ordner: String) -> Array:
	var out := []
	for d in DirAccess.get_files_at(ordner):
		if d.ends_with(".json"):
			out.append(d)
	out.sort()
	return out


func _json(pfad: String) -> Dictionary:
	var daten = JSON.parse_string(FileAccess.get_file_as_string(pfad))
	if daten is Dictionary:
		return daten
	push_error("Bauplan: %s nicht lesbar" % pfad)
	return {}
