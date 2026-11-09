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
	for ab in plaene:
		var plan: Dictionary = plaene[ab]
		for r in plan.raeume:
			_raeume[r.script_name] = {abschnitt = ab, daten = r}
			for liste in ["hotspots", "props", "ausgaenge"]:
				for o in r[liste]:
					_objekte["%s/%s" % [r.script_name, o.script_name]] = o
		for f in plan.figuren:
			_figuren[f.script_name] = f
		for g in plan.gegenstaende:
			_gegenstaende[g.script_name] = g
		for d in plan.dialoge:
			_dialoge[d.script_name] = d
		for k in plan.ersatz:
			ersatz[k] = plan.ersatz[k]


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
