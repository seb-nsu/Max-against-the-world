extends RefCounted
## Regeln von Welt 3, Neo-Neustadt 2099 (raetsel/welt-3.md, skript/welt-3.md).
##
## Aufbau wie skripte/welt_2.gd: Die Basisklassen melden Ereignisse an ereignis(art, obj, item),
## die Behandler heißen nach Art und Objekt-ID (benutzen_automat(), gegenstand_hausmeister(),
## option_deckert_0090() …) und liefern true, wenn sie das Ereignis erledigt haben.
##
## Zwei Ebenen: Max' Geist ist in der Realität, der Simulation oder dem Labor (Wert W3_EBENE),
## sein Körper liegt dann in der Kapsel der Widerstandsbasis. Solange er nicht in der Realität
## ist, sind Max und Pixel getrennt: Der Figurenwechsel springt in den Raum der anderen Figur
## (W3_MAX_RAUM, W3_PIXEL_RAUM), und keiner steht neben dem anderen.
##
## Code-Sicht (ab Rätsel 5): Benutzen auf einem Tauschobjekt öffnet die Auswahl der Tausche des
## Raums. Tausche und Budget gelten nur, solange Max im Raum bleibt (_tausch, nie gespeichert);
## gespeichert wird nur, ob das Rätsel gelöst ist.

#region Konstanten ################################################################################
const SIMULATION := ["stadtstrasse", "kueche_orakel", "buero_50"]
const LABOR := ["testkammer_1", "testkammer_2", "testkammer_3", "kern"]

## Tausche je Raum: Text (UI), Zeilen, gelöst-Kennung (leer = Fehltausch), benötigt Gegenstand
const TAUSCHE := {
	"stadtstrasse": [
		{"text": "UI_W3_TAUSCH_TUER_SCHMIDT", "loesung": "R5",
			"zeilen": ["W3_TUER_NAR_0190", "W3_TUER_TUR_0200", "W3_TUER_TUR_0210", "W3_TUER_SCH_0220", "W3_TUER_MAX_0230"]},
		{"text": "UI_W3_TAUSCH_TUER_AUTO", "zeilen": ["W3_TUER_MAX_0250"]},
		{"text": "UI_W3_TAUSCH_TUER_HAUSSCHUHE", "zeilen": ["W3_TUER_MAX_0260", "W3_TUER_SCH_0270"]},
		{"text": "UI_W3_TAUSCH_SCHMIDT_BAUM", "zeilen": ["W3_TUER_MAX_0280"]},
	],
	"buero_50": [
		{"text": "UI_W3_TAUSCH_ORIGINAL_TASSE", "loesung": "R6a", "braucht": "kaffeetasse",
			"zeilen": ["W3_TURM_NAR_0350", "W3_TURM_SCH_0360", "W3_TURM_KLO_0370", "W3_TURM_MAX_0380"]},
		{"text": "UI_W3_TAUSCH_ORIGINAL_KLON", "zeilen": ["W3_TURM_MAX_0490", "W3_TURM_KLO_0500"]},
		{"text": "UI_W3_TAUSCH_HAUSSCHUHE_TASSE", "braucht": "kaffeetasse", "zeilen": ["W3_TURM_MAX_0510"]},
		{"text": "UI_W3_TAUSCH_ORIGINAL_PFLANZE", "zeilen": ["W3_TURM_MAX_0520"]},
	],
	"testkammer_1": [
		{"text": "UI_W3_TAUSCH_BERND_MAX", "loesung": "R9b",
			"zeilen": ["W3_KAM1_NAR_0440", "W3_KAM1_MAX_0450", "W3_KAM1_NAR_0460", "W3_KAM1_MAX_0470",
				"W3_KAM1_PIX_0480", "W3_KAM1_MUT_0490"]},
		{"text": "UI_W3_TAUSCH_BERND_KUCHEN", "zeilen": ["W3_KAM1_MAX_0530"]},
		{"text": "UI_W3_TAUSCH_BERND_EHRLICH", "zeilen": ["W3_KAM1_MAX_0540"]},
		{"text": "UI_W3_TAUSCH_SCHALTER_MUEDE", "zeilen": ["W3_KAM1_MAX_0550"]},
	],
	"testkammer_2": [
		{"text": "UI_W3_TAUSCH_LASER_HUHN", "loesung": "R9c", "braucht": "gummihuhn",
			"zeilen": ["W3_KAM2_NAR_0090", "W3_KAM2_MAX_0100", "W3_KAM2_MUT_0120"]},
		{"text": "UI_W3_TAUSCH_LASER_FARBE", "braucht": "gummihuhn", "zeilen": ["W3_KAM2_MAX_0190"]},
		{"text": "UI_W3_TAUSCH_LASER_SOCKEL", "zeilen": ["W3_KAM2_MAX_0200"]},
		{"text": "UI_W3_TAUSCH_HUHN_KRITZELEI", "braucht": "gummihuhn", "zeilen": ["W3_KAM2_MAX_0210"]},
	],
	"testkammer_3": [
		{"text": "UI_W3_TAUSCH_TUER_LAUTSPRECHER", "loesung": "tuer",
			"zeilen": ["W3_KAM3_NAR_0100", "W3_KAM3_TUR_0110", "W3_KAM3_MAX_0120", "W3_KAM3_MUT_0130", "W3_KAM3_PIX_0140"]},
		{"text": "UI_W3_TAUSCH_BERND_HUHN", "loesung": "bernd", "braucht": "gummihuhn",
			"zeilen": ["W3_KAM3_NAR_0150", "W3_KAM3_MAX_0160"]},
		{"text": "UI_W3_TAUSCH_TUER_BERND", "zeilen": ["W3_KAM3_MAX_0190", "W3_KAM3_PIX_0200"]},
		{"text": "UI_W3_TAUSCH_LAUTSPRECHER_HUHN", "braucht": "gummihuhn", "zeilen": ["W3_KAM3_MAX_0210"]},
		{"text": "UI_W3_TAUSCH_LAUTSPRECHER_BERND", "zeilen": ["W3_KAM3_MAX_0220", "W3_KAM3_BER_0230"]},
		{"text": "UI_W3_TAUSCH_TUER_HUHN", "braucht": "gummihuhn", "zeilen": ["W3_KAM3_MAX_0240"]},
	],
	"kern": [
		{"text": "UI_W3_TAUSCH_ZELLE_KEKSE", "loesung": "kern", "braucht": "omas_kekse",
			"zeilen": ["W3_KERN_NAR_0440", "W3_KERN_MAX_0450", "W3_KERN_PIX_0460"]},
		{"text": "UI_W3_TAUSCH_ZELLE_MAX", "zeilen": ["W3_KERN_MAX_0600"]},
	],
}
const BUDGET := {"stadtstrasse": 2, "buero_50": 2, "testkammer_1": 2, "testkammer_2": 2,
	"testkammer_3": 2, "kern": 1}
const BUDGET_LEER := {"stadtstrasse": ["W3_TUER_MAX_0290"], "buero_50": ["W3_TURM_MAX_0530"],
	"testkammer_1": ["W3_KAM1_MUT_0570"], "testkammer_2": ["W3_KAM1_MUT_0570"],
	"testkammer_3": ["W3_KAM3_MAX_0250"], "kern": ["W3_KERN_MAX_0470"]}
## Zurücksetzen beim Wiederbetreten nach Fehltauschen
const ZURUECK := {"stadtstrasse": "W3_TUER_MAX_0300", "buero_50": "W3_TURM_SCH_0540",
	"testkammer_1": "W3_KAM1_MUT_0560", "testkammer_2": "W3_KAM2_MUT_0220",
	"testkammer_3": "W3_KAM3_MUT_0260"}
## Objekte, deren Benutzen die Code-Sicht öffnet (je Raum)
const TAUSCH_OBJEKTE := {
	"stadtstrasse": ["tuer", "schmidt"], "buero_50": ["klone", "schmidt", "klon"],
	"testkammer_1": ["bernd", "bodenschalter"], "testkammer_2": ["laser", "sockel"],
	"testkammer_3": ["tuer", "lautsprecher", "bernd"],  # Kern: benutzen_energiezelle()
}
## Rätsel, das den Raum löst (danach keine Code-Sicht mehr dort)
const RAUM_RAETSEL := {"stadtstrasse": "R5", "buero_50": "R6a", "testkammer_1": "R9b",
	"testkammer_2": "R9c", "testkammer_3": "R9d", "kern": "R11"}

## Mensch-Test (R1b): je Frage logisch, menschlich (mit Beobachtung), Unsinn
const TEST := [
	{"frage": "W3_TEST_DEC_0100", "beobachtung": "BEOBACHTUNG_SCHIRM",
		"antworten": [["W3_TEST_MAX_0110", "W3_TEST_DEC_0120"], ["W3_TEST_MAX_0130", "W3_TEST_DEC_0140"],
			["W3_TEST_MAX_0150", "W3_TEST_DEC_0160"]]},
	{"frage": "W3_TEST_DEC_0170", "beobachtung": "BEOBACHTUNG_MUSIKER",
		"antworten": [["W3_TEST_MAX_0180", "W3_TEST_DEC_0190"], ["W3_TEST_MAX_0200", "W3_TEST_DEC_0210"],
			["W3_TEST_MAX_0220", "W3_TEST_DEC_0230"]]},
	{"frage": "W3_TEST_DEC_0240", "beobachtung": "BEOBACHTUNG_SUPPE",
		"antworten": [["W3_TEST_MAX_0250", "W3_TEST_DEC_0260"], ["W3_TEST_MAX_0270", "W3_TEST_DEC_0280"],
			["W3_TEST_MAX_0290", "W3_TEST_DEC_0300"]]},
]
## Beobachtungen (R1a): Figur → Schalter
const BEOBACHTUNG := {"frau_regenschirm": "BEOBACHTUNG_SCHIRM",
	"strassenmusiker": "BEOBACHTUNG_MUSIKER", "weinender_mann": "BEOBACHTUNG_SUPPE"}

## Patch-Panel (R7b): Kabel → richtige Buchse und Zeile
const KABEL := {"kreis": ["rot", "W3_TERM_PIX_0220"], "dreieck": ["gruen", "W3_TERM_PIX_0230"],
	"quadrat": ["gelb", "W3_TERM_PIX_0240"]}
const BUCHSEN := ["rot", "gruen", "gelb"]

## Pixel auf Figuren, deren Auslöser der Bauplan nicht zuordnet (gebeugte Namen)
const PIXEL_AUF := {"herr_vier": "W3_STR_PIX_1020", "weinender_mann": "W3_STR_PIX_1040"}

## Erste Szene beim Betreten
const ERSTES_BETRETEN := {
	"kueche_orakel": ["W3_KUCH_ORA_0010", "W3_KUCH_MAX_0020", "W3_KUCH_ORA_0030", "W3_KUCH_MAX_0040",
		"W3_KUCH_ORA_0050"],
	"testkammer_2": ["W3_KAM2_MUT_0010"],
	"testkammer_3": ["W3_KAM3_MUT_0010", "W3_KAM3_BER_0020", "W3_KAM3_PIX_0040"],
	"kern": ["W3_KERN_MUT_0010", "W3_KERN_MAX_0020", "W3_KERN_PIX_0030", "W3_KERN_MUT_0040",
		"W3_KERN_MAX_0050", "W3_KERN_MUT_0060"],
}

## Tauschzustand des aktuellen Raums (nie gespeichert): raum, budget, geloest[], fehl
var _tausch := {}
## Paradoxon (R10): Stufe 0–2 im laufenden Gespräch
var _paradox_stufe := 0
#endregion

#region Verteiler ##################################################################################
func ereignis(art: String, obj: Variant, item: Variant) -> bool:
	var oid := _id(obj)
	var iid = _id(item) if item is Object else item
	if art == "figur_wechseln":
		await _wechsel_getrennt()
		return true
	if art == "kombinieren":
		for m in ["kombi_%s_%s" % [oid, iid], "kombi_%s_%s" % [iid, oid]]:
			if has_method(m):
				return bool(await call(m))
		return false
	if art in ["nach_option", "nach_einstieg"]:
		var m := ("option_%s_%s" % [oid, iid]) if art == "nach_option" else "einstieg_" + oid
		return bool(await call(m)) if has_method(m) else false
	if art == "raum_betreten":
		await _raum_betreten(obj)
		return false
	# Code-Sicht: Benutzen auf einem Tauschobjekt
	if art == "benutzen" and not Spiel.ist_pixel() and oid in TAUSCH_OBJEKTE.get(_raum_id(), []):
		if await _code_sicht(oid):
			return true
	var name := "%s_%s" % [art, oid]
	if has_method(name):
		return bool(await call(name, obj, iid))
	if art == "pixel" and obj is PopochiuCharacter and PIXEL_AUF.has(oid):
		await _sag(PIXEL_AUF[oid])
		return true
	return false


func wert(art: String, obj: Variant, item: Variant) -> Variant:
	match art:
		"zustand":
			return _zustand_gegenstand(_id(obj))
		"bedingung_text":
			return _bedingung_text(str(obj))
		"option_sichtbar":
			var m := "sichtbar_%s_%s" % [_id(obj), item]
			return call(m) if has_method(m) else null
		"zustand_anwenden":
			_figuren_anwenden(obj)
			return true
		"partner_getrennt", "wechsel_getrennt":
			return getrennt()
		"wechsel_moeglich":
			return true if getrennt() else null
	return null


func _id(o: Variant) -> String:
	if o == null:
		return ""
	if o is String:
		return o
	if o is PopochiuInventoryItem:
		if o.script_name == Spiel.PIXEL_FELD:
			return "pixel"
		return str(Bauplan.gegenstand(o.script_name).get("id", o.script_name.to_snake_case()))
	if o is CQRaum:
		return o.raum_id()
	if o is PopochiuDialog:
		return str(Bauplan.dialog(o.script_name).get("id", o.script_name.to_snake_case()))
	if o is Object and o.has_method("objekt_id"):
		return o.objekt_id()
	if o is Object and "script_name" in o:
		return str(o.script_name).to_snake_case()
	return str(o)
#endregion

#region Hilfen #####################################################################################
func _sag(zeile: String) -> void:
	await Spiel.sagen(zeile.split("_")[2], zeile)


func _szene(zeilen: Array) -> void:
	var schritte := []
	for z in zeilen:
		schritte.append(Spiel.z(z.split("_")[2], z))
	await Spiel.szene(schritte)


func _hat(id: String) -> bool:
	return is_instance_valid(C.Max) and I.is_item_in_inventory(Bauplan.gegenstand_script_name(id), C.Max)


func _geben(id: String) -> void:
	await Spiel.geben(Bauplan.gegenstand_script_name(id))


func _abgeben(id: String) -> void:
	await Spiel.abgeben(Bauplan.gegenstand_script_name(id))


func _raum_id() -> String:
	return R.current.raum_id() if is_instance_valid(R.current) and R.current is CQRaum else ""


func _liste(name: String) -> Array:
	return (Zustand.wert(name, []) as Array).duplicate()


func _einmal(schalter: String) -> bool:
	if Zustand.ist(schalter):
		return false
	Zustand.setze(schalter)
	return true


## Rätsel lösen, ohne dabei Schalter zu setzen, die eigene Bedingungen haben (FREUND_0815 nur mit
## Olivenöl, Regeln erst aus der Nahansicht).
func _loese(id: String, ausnahmen: Array = []) -> void:
	var vorher := {}
	for s in ausnahmen:
		vorher[s] = Zustand.ist(s)
	Zustand.loese(id)
	for s in ausnahmen:
		Zustand.setze(s, vorher[s])


func ebene() -> String:
	return str(Zustand.wert("W3_EBENE", "realitaet"))


## Max ist nicht in der Realität: Max und Pixel stehen in verschiedenen Räumen.
func getrennt() -> bool:
	return ebene() != "realitaet"


func _zustand_gegenstand(id: String) -> Variant:
	var echt := ebene() == "realitaet"
	match id:
		"omas_kekse":
			if Zustand.ist("W3_KEKSE_WARM"):
				return "ofenwarm"
			return "hundekuchen" if echt else "kalt"
		"rezeptkarte":
			return "glueckskeks" if echt else "rezeptkarte"
		"schmidts_akte":
			return "ordner" if echt else "datei"
		"zugangskarte":
			return "plastikkarte" if echt else "code_schluessel"
		"energiezelle":
			return "vereist" if Zustand.ist("W3_ZELLE_KALT") or echt else "gluehend"
		"gummihuhn":
			return "toedlich" if _tausch.get("raum", "") == "testkammer_2" and "R9c" in _tausch.get("geloest", []) else "harmlos"
	return null


func _bedingung_text(text: String) -> Variant:
	match text:
		"Simulation":
			return ebene() == "simulation"
		"Realität":
			return ebene() == "realitaet"
		"Pixel auf der Leitung":
			return Zustand.ist("W3_PIXEL_AUF_LEITUNG")
		"vor dem Tausch":
			return not _raum_geloest()
		"nach dem Tausch":
			return _raum_geloest()
		"nach Hexenschuss":
			return Zustand.ist("HEXENSCHUSS")
		"ohne Olivenöl in der Tasche":
			return not _hat("olivenoel")
		"nur bei FREUND_0815":
			return Zustand.ist("FREUND_0815")
		"nach dem Portal":
			return Zustand.ist("W3_PORTAL_BENUTZT")
		"Max wach":
			return not getrennt()
		"vor der Lösung", "vor der Szene":
			return not Zustand.geloest("R4") if _raum_id() == "kueche_orakel" else null
		"nach der Szene":
			return Zustand.geloest("R4")
	return null


func _raum_geloest() -> bool:
	var r: String = RAUM_RAETSEL.get(_raum_id(), "")
	return not r.is_empty() and Zustand.geloest(r)
#endregion

#region Ebenen und Figurenwechsel ##################################################################
## Wechsel zwischen den getrennten Figuren: in den Raum der anderen Figur springen.
func _wechsel_getrennt() -> void:
	var rid := _raum_id()
	Klang.geraeusch("wechsel")
	I.active = null
	var ziel: String
	if C.player == C.Max:
		Zustand.setze_wert("W3_MAX_RAUM", rid)
		C.player = C.Pixel
		ziel = str(Zustand.wert("W3_PIXEL_RAUM", "widerstandsbasis"))
	else:
		Zustand.setze_wert("W3_PIXEL_RAUM", rid)
		C.player = C.Max
		ziel = str(Zustand.wert("W3_MAX_RAUM", "stadtstrasse"))
	Spiel.figur_gewechselt.emit(C.player)
	Spiel.herkunft_raum = ""
	await R.goto_room(Bauplan.raum_script_name(ziel))


## Max legt sich in die Kapsel (oder schluckt die rote Pastille) und erscheint im Zielraum.
func _einschlafen(ziel: String) -> void:
	var rid := _raum_id()
	Zustand.setze_wert("W3_EBENE", "labor" if ziel in LABOR else "simulation")
	Zustand.setze_wert("W3_PIXEL_RAUM", rid if rid in ["widerstandsbasis", "laboreingang", "kuehlung"] else "widerstandsbasis")
	Zustand.setze_wert("W3_MAX_RAUM", ziel)
	if ziel in SIMULATION:
		# Errungenschaft Déjà-vu (05-spielsysteme.md): jedes Betreten der Simulation zählt
		Zustand.setze_wert("W3_SIMULATION_BESUCHE", int(Zustand.wert("W3_SIMULATION_BESUCHE", 0)) + 1)
	C.player = C.Max
	Spiel.herkunft_raum = "Zelle" if ziel in SIMULATION else "Kapsel"
	await R.goto_room(Bauplan.raum_script_name(ziel))


## Max wacht in seiner Kapsel in der Widerstandsbasis auf.
func _aufwachen() -> void:
	Zustand.setze_wert("W3_EBENE", "realitaet")
	Zustand.setze_wert("W3_MAX_RAUM", "widerstandsbasis")
	I.active = null
	C.player = C.Max
	Spiel.figur_gewechselt.emit(C.player)
	Spiel.herkunft_raum = "Kapsel"
	await R.goto_room(Bauplan.raum_script_name("widerstandsbasis"))


## Klingelnde Zelle oder Omas Wandtelefon: zurück in die Realität.
func _zelle_abheben(zelle: String, zeile: String) -> void:
	Zustand.setze_wert("W3_LETZTE_ZELLE", zelle)
	await _sag(zeile)
	await _aufwachen()


func _raum_betreten(raum: CQRaum) -> void:
	var rid := raum.raum_id()
	# Tauschzustand gilt nur im Raum
	var vorher: Dictionary = _tausch
	_tausch = {"raum": rid, "budget": BUDGET.get(rid, 0), "geloest": [], "fehl": false}
	if rid in TAUSCHE and vorher.get("raum", "") != rid:
		_tausch["zurueck"] = rid in _liste("W3_FEHLTAUSCHE") and not _raum_geloest()
	# Kammer 3 mit Hermes' Sandale: ein Tausch mehr
	if rid == "testkammer_3" and (_hat("sandale") or _hat("sandalen")):
		_tausch["budget"] = 3
	if C.player == C.Max and getrennt():
		Zustand.setze_wert("W3_MAX_RAUM", rid)
	elif C.player == C.Pixel and getrennt():
		Zustand.setze_wert("W3_PIXEL_RAUM", rid)


func _figuren_anwenden(raum: CQRaum) -> void:
	var rid := raum.raum_id()
	var plan := {
		"Morphaeus": rid in ["unterstadt_strasse", "apothekengasse"] and Zustand.geloest("R2") and not Zustand.geloest("R3b"),
		"Hausmeister": rid == "laboreingang" and not Zustand.geloest("R8"),
		"Klon": rid == "buero_50" and not Zustand.geloest("R6b"),
		"Bernd": (rid == "testkammer_1" and not Zustand.geloest("R9b")) or (rid == "testkammer_3" and not Zustand.geloest("R9d")),
		"Kalle": rid == "widerstandsbasis",
		"Opa": false,                 # spricht nur als Hologramm und durch das Portal
		"PortalgeraetStimme": false,  # nur Stimme
	}
	for sn in plan:
		var pos := Vector2.INF
		if plan[sn] and not raum.has_character(sn) and raum.has_marker(sn):
			pos = raum.get_marker_position(sn)
		Spiel.figur_hier(sn, plan[sn], pos)
#endregion

#region Ankunft und Räume ##########################################################################
func nach_uebergang_unterstadt_strasse(_raum, _x) -> bool:
	if _einmal("W3_ANKUNFT"):
		Zustand.setze("W3_WECHSEL_FREI")
		await _szene(["W3_ANK_NAR_0010", "W3_ANK_MAX_0020", "W3_ANK_PIX_0030", "W3_ANK_MAX_0040",
			"W3_ANK_PIX_0050", "W3_ANK_MAX_0060", "W3_ANK_PIX_0070", "W3_ANK_MAX_0080", "W3_ANK_PIX_0090",
			"W3_ANK_MAX_0100", "W3_ANK_PIX_0110"])
		return true
	return false


func nach_uebergang_stadtstrasse(_raum, _x) -> bool:
	if _einmal("W3_SIM_GESEHEN"):
		await _szene(["W3_SIM_NAR_0010", "W3_SIM_MAX_0020", "W3_SIM_MAX_0030", "W3_SIM_MAX_0040",
			"W3_SIM_MAX_0050", "W3_SIM_MAX_0060"])
	if int(Zustand.wert("W3_SIMULATION_BESUCHE", 0)) >= 3 and _einmal("W3_DEJA_VU"):
		await _sag("W3_SIM_PIX_0250")
	await _zurueckgesetzt()
	return true


func nach_uebergang_kueche_orakel(_raum, _x) -> bool:
	return await _erstes_betreten("kueche_orakel")


func nach_uebergang_buero_50(_raum, _x) -> bool:
	if _einmal("W3_TURM_GESEHEN"):
		await _szene(["W3_TURM_SCH_0010", "W3_TURM_MAX_0020", "W3_TURM_SCH_0030", "W3_TURM_SCH_0040",
			"W3_TURM_KLO_0050", "W3_TURM_MAX_0060", "W3_TURM_KLO_0070", "W3_TURM_NAR_0080",
			"W3_TURM_MAX_0090", "W3_TURM_MAX_0100"])
		Zustand.setze("HEXENSCHUSS")
		await _szene(["W3_TURM_SCH_0110", "W3_TURM_KLO_0120", "W3_TURM_MAX_0130"])
	await _zurueckgesetzt()
	return true


func nach_uebergang_widerstandsbasis(_raum, _x) -> bool:
	if Spiel.ist_pixel() or getrennt():
		return true
	if _einmal("W3_ERSTES_AUFWACHEN"):
		await _szene(["W3_BAS_NAR_0010", "W3_BAS_PIX_0020", "W3_BAS_MAX_0030", "W3_BAS_KAL_0040",
			"W3_BAS_PIX_0050", "W3_BAS_MAX_0060", "W3_BAS_NAR_0070", "W3_BAS_PIX_0080", "W3_BAS_PIX_0090",
			"W3_BAS_MAX_0100", "W3_BAS_KAL_0110", "W3_BAS_KAL_0120", "W3_BAS_MAX_0130", "W3_BAS_PIX_0140",
			"W3_BAS_KAL_0150", "W3_BAS_KAL_0160"])
		Zustand.setze("W3_PIXEL_AUF_LEITUNG")
		await _szene(["W3_BAS_PIX_0170", "W3_BAS_REB_0180", "W3_BAS_MAX_0190"])
	return true


func nach_uebergang_testkammer_1(_raum, _x) -> bool:
	if _einmal("W3_LABOR_GESEHEN"):
		await _szene(["W3_KAM1_NAR_0010", "W3_KAM1_MUT_0020", "W3_KAM1_MAX_0030", "W3_KAM1_PIX_0040",
			"W3_KAM1_MUT_0050", "W3_KAM1_MUT_0060"])
	await _zurueckgesetzt()
	return true


func nach_uebergang_testkammer_2(_raum, _x) -> bool:
	await _erstes_betreten("testkammer_2")
	await _zurueckgesetzt()
	return true


func nach_uebergang_testkammer_3(_raum, _x) -> bool:
	await _erstes_betreten("testkammer_3")
	if _tausch.get("budget", 0) == 3 and not Zustand.geloest("R9d"):
		await _szene(["W3_KAM3_MAX_0270", "W3_KAM3_PIX_0280"])
	await _zurueckgesetzt()
	return true


func nach_uebergang_kern(_raum, _x) -> bool:
	await _erstes_betreten("kern")
	# Lösung B: Pixel hat das Fenster geöffnet, während Max im Kern war
	if Zustand.ist("W3_SCHNEE") and Zustand.geloest("R10") and not Zustand.ist("W3_ZELLE_KALT"):
		Zustand.setze("W3_ZELLE_KALT")
		await _szene(["W3_KERN_NAR_0480", "W3_KERN_MAX_0490"])
	return true


func _erstes_betreten(rid: String) -> bool:
	if not ERSTES_BETRETEN.has(rid) or not _einmal("W3_ERST_" + rid.to_upper()):
		return false
	await _szene(ERSTES_BETRETEN[rid])
	return true


## Wiederbetreten nach Fehltauschen: alles zurückgesetzt.
func _zurueckgesetzt() -> void:
	if _tausch.get("zurueck", false) and ZURUECK.has(_raum_id()):
		Zustand.setze_wert("W3_FEHLTAUSCHE", _liste("W3_FEHLTAUSCHE").filter(func(r): return r != _raum_id()))
		await _sag(ZURUECK[_raum_id()])


## Büroturm: hinaus nur über Rätsel 7 (Einbahn).
func ausgang_ausgang_stadtstrasse(_obj, _x) -> bool:
	if _raum_id() == "buero_50":
		await _sag("W3_TURM_MAX_0570" if Zustand.geloest("R6b") else "W3_TURM_MAX_0250")
		return true
	return false


## Apothekengasse erst nach dem Mensch-Test
func ausgang_ausgang_apothekengasse(_obj, _x) -> bool:
	if _raum_id() == "unterstadt_strasse" and not Zustand.geloest("R1b"):
		await _sag("W3_STR_DEC_0290")
		return true
	return false


## Die Kühlung erreicht nur Pixel, durch den Lüftungsschacht.
func ausgang_ausgang_kuehlung(_obj, _x) -> bool:
	if Spiel.ist_pixel():
		if _einmal("W3_SCHACHT"):
			await _szene(["W3_BAS_PIX_0630", "W3_BAS_PIX_0640"])
		return false
	await _sag("W3_BAS_MAX_0620")
	return true


func benutzen_lueftungsschacht(_obj, _x) -> bool:
	if not Spiel.ist_pixel():
		return false
	if _einmal("W3_SCHACHT"):
		await _szene(["W3_BAS_PIX_0630", "W3_BAS_PIX_0640"])
	await Spiel.raum_wechseln("kuehlung")
	return true
#endregion

#region Rätsel 1: Der Mensch-Test ##################################################################
func ansehen_frau_regenschirm(_obj, _x) -> bool:
	_beobachtung("frau_regenschirm")
	return false


func ansehen_strassenmusiker(_obj, _x) -> bool:
	_beobachtung("strassenmusiker")
	return false


func ansehen_weinender_mann(_obj, _x) -> bool:
	_beobachtung("weinender_mann")
	return false


func _beobachtung(fig: String) -> void:
	if _einmal(BEOBACHTUNG[fig]):
		Klang.geraeusch("notiz")
	if BEOBACHTUNG.values().all(func(s): return Zustand.ist(s)) and not Zustand.geloest("R1a"):
		Zustand.loese("R1a")


func option_deckert_0090() -> bool:
	if Zustand.geloest("R1b"):
		return false
	var frage := 0
	while frage < TEST.size():
		var f: Dictionary = TEST[frage]
		await _sag(f.frage)
		var wahl: Array = [f.antworten[0], f.antworten[2]]
		if Zustand.ist(f.beobachtung):
			wahl.insert(1, f.antworten[1])
		var w := await Spiel.auswahl(wahl.map(func(a): return a[0]))
		if w < 0:
			return true
		await _szene(wahl[w])
		if wahl[w] == f.antworten[1]:
			frage += 1
		else:
			return true  # falsche Antwort: der Test beginnt beim nächsten Mal ohne Strafe neu
	await _szene(["W3_TEST_DEC_0310", "W3_TEST_MAX_0320", "W3_TEST_DEC_0330", "W3_TEST_PIX_0340",
		"W3_TEST_MAX_0350", "W3_TEST_PIX_0360"])
	Zustand.loese("R1b")
	return true
#endregion

#region Rätsel 2: Die Nudelbude ####################################################################
func option_herr_vier_0090() -> bool:
	if Zustand.geloest("R2"):
		return false
	await _szene(["W3_NUD_MOR_0210", "W3_NUD_MAX_0220", "W3_NUD_MOR_0230", "W3_NUD_PIX_0240"])
	await bestellen()
	return true


func bestellen() -> void:
	await _sag("W3_NUD_VIE_0250")
	var optionen := ["W3_NUD_MAX_0260", "W3_NUD_MAX_0280", "W3_NUD_MAX_0300", "W3_NUD_MAX_0320"]
	var antwort := {"W3_NUD_MAX_0260": "W3_NUD_VIE_0270", "W3_NUD_MAX_0280": "W3_NUD_VIE_0290",
		"W3_NUD_MAX_0320": "W3_NUD_VIE_0330"}
	while true:
		var w := await Spiel.auswahl(optionen)
		if w < 0:
			return
		var o: String = optionen[w]
		await _sag(o)
		if o != "W3_NUD_MAX_0300":
			await _sag(antwort[o])
			continue
		break
	await _szene(["W3_NUD_VIE_0310", "W3_NUD_PIX_0340", "W3_NUD_MOR_0350", "W3_NUD_MAX_0360",
		"W3_NUD_MOR_0370", "W3_NUD_VIE_0380", "W3_NUD_PIX_0390"])
	Zustand.loese("R2")
	_figuren_anwenden(R.current)


## Bestellen geht auch ohne den Umweg über das Gespräch, sobald Morphäus' Hinweis da ist.
func sichtbar_herr_vier_0090() -> Variant:
	return not Zustand.geloest("R2")


## Morphäus beschreibt das Symptom (R3a)
func option_morphaeus_0480() -> bool:
	Zustand.setze("W3_SYMPTOM_BEKANNT")
	return false


func sichtbar_morphaeus_0480() -> Variant:
	return _option_gewaehlt("Morphaeus", "0450")


func sichtbar_morphaeus_0550() -> Variant:
	return _option_gewaehlt("Morphaeus", "0450")


func _option_gewaehlt(dialog_sn: String, id: String) -> bool:
	var d: PopochiuDialog = D.get_instance(dialog_sn)
	if not is_instance_valid(d):
		return false
	var o := d.get_option(id)
	return is_instance_valid(o) and o.used
#endregion

#region Rätsel 3: Der Pastillenautomat #############################################################
func benutzen_automat(_obj, _x) -> bool:
	return await _automat()


func benutzen_pastillenautomat(_obj, _x) -> bool:
	return await _automat()


func _automat() -> bool:
	if Spiel.ist_pixel():
		return false
	if not Zustand.geloest("R1b"):
		await _sag("W3_APO_AUT_0030")
		return true
	if Zustand.geloest("R3a"):
		await _pastillen_hinweis()
		return true
	await _sag("W3_APO_AUT_0040")
	var optionen := ["W3_APO_MAX_0050", "W3_APO_MAX_0070"]
	if Zustand.ist("W3_SYMPTOM_BEKANNT"):
		optionen.append("W3_APO_MAX_0110" if Zustand.ist("W3_PIXEL_DOPPELT") else "W3_APO_MAX_0090")
	optionen.append("W3_APO_MAX_0140")
	var w := await Spiel.auswahl(optionen)
	if w < 0:
		return true
	match optionen[w]:
		"W3_APO_MAX_0050":
			await _szene(["W3_APO_MAX_0050", "W3_APO_AUT_0060"])
		"W3_APO_MAX_0070":
			await _szene(["W3_APO_MAX_0070", "W3_APO_AUT_0080"])
		"W3_APO_MAX_0090":
			await _szene(["W3_APO_MAX_0090", "W3_APO_AUT_0100"])
		"W3_APO_MAX_0140":
			await _szene(["W3_APO_MAX_0140", "W3_APO_AUT_0150"])
		"W3_APO_MAX_0110":
			await _szene(["W3_APO_MAX_0110", "W3_APO_AUT_0120", "W3_APO_AUT_0130"])
			Zustand.loese("R3a")
			await _geben("rote_pastille")
			await _geben("blaue_pastille")
			await _szene(["W3_APO_MAX_0410", "W3_APO_MOR_0420"])
			await _geben("omas_kekse")
			Zustand.setze("KEKSE_DABEI")
			await _szene(["W3_APO_MAX_0430", "W3_APO_MOR_0440", "W3_APO_PIX_0450"])
	return true


func _pastillen_hinweis() -> void:
	await _sag("W3_APO_PIX_0920")


## Pixel soll zweimal gleich am Automaten vorbeigehen (erst nach Morphäus' Hinweis).
func benutzen_pixel(_obj, _x) -> bool:
	if _raum_id() != "apothekengasse" or not Zustand.ist("W3_SYMPTOM_BEKANNT") or Zustand.geloest("R3a"):
		return false
	if Zustand.ist("W3_PIXEL_DOPPELT"):
		await _sag("W3_APO_PIX_0210")
		return true
	await _szene(["W3_APO_MAX_0160", "W3_APO_PIX_0170", "W3_APO_PIX_0180", "W3_APO_PIX_0190",
		"W3_APO_PIX_0200"])
	Zustand.setze("W3_PIXEL_DOPPELT")
	return true


func benutzen_inventar_blaue_pastille(_obj, _x) -> bool:
	await _szene(["W3_APO_MAX_0460", "W3_APO_AUT_0470", "W3_SOFA_NAR_0480", "W3_SOFA_MAX_0490",
		"W3_SOFA_MAX_0500", "W3_SOFA_MAX_0510", "W3_SOFA_PIX_0520", "W3_SOFA_MAX_0530",
		"W3_SOFA_PIX_0540", "W3_SOFA_MAX_0550", "W3_SOFA_PIX_0560", "W3_APO_MAX_0570"])
	return true


func benutzen_inventar_rote_pastille(_obj, _x) -> bool:
	await _szene(["W3_APO_MAX_0580", "W3_APO_PIX_0590", "W3_APO_MAX_0600", "W3_APO_MOR_0610",
		"W3_APO_PIX_0620", "W3_APO_AUT_0630"])
	await _abgeben("rote_pastille")
	Zustand.loese("R3b")
	await _einschlafen("stadtstrasse")
	return true
#endregion

#region Ebenenwechsel: Zellen, Terminal, Kapsel #####################################################
func benutzen_telefonzelle(_obj, _x) -> bool:
	if _raum_id() != "stadtstrasse":
		return false  # Unterstadt: kein Sprungpunkt (W3_STR_MAX_0040), am Ende der Werbeblock
	await _zelle_abheben("stadtstrasse", "W3_SIM_MAX_0240" if Zustand.ist("W3_ZELLE_BENUTZT") else "W3_SIM_MAX_0230")
	return true


func benutzen_klingelnde_telefonzelle(obj, x) -> bool:
	Zustand.setze("W3_ZELLE_BENUTZT")
	return await benutzen_telefonzelle(obj, x)


func benutzen_wandtelefon(_obj, _x) -> bool:
	await _zelle_abheben("kueche_orakel", "W3_KUCH_MAX_0680")
	return true


## Terminal neben der Kapsel (Basis) oder im 50. Stock (Rätsel 7)
func benutzen_terminal(obj, x) -> bool:
	if _raum_id() == "buero_50":
		return await _turm_terminal()
	if Spiel.ist_pixel():
		return false
	var ziele := ["UI_W3_ZIEL_STADT", "UI_W3_ZIEL_LABOR", "UI_W2_DOCH_NICHT"]
	var w := await Spiel.auswahl(ziele)
	if w == 0:
		await _sag("W3_BAS_MAX_0560")
		await _einschlafen(str(Zustand.wert("W3_LETZTE_ZELLE", "stadtstrasse")))
	elif w == 1:
		if not Zustand.geloest("R9a"):
			await _sag("W3_BAS_MAX_0570")
			return true
		await _sag("W3_BAS_MAX_0560")
		await _einschlafen("testkammer_1")
	return true


## Pixel schüttelt die Kapsel und holt Max zurück.
func benutzen_max_kapsel(_obj, _x) -> bool:
	if not Spiel.ist_pixel():
		return false
	if not getrennt():
		return false
	await _sag("W3_BAS_PIX_0540")
	await _aufwachen()
	return true


func benutzen_stromkasten(_obj, _x) -> bool:
	if Spiel.ist_pixel():
		await _sag("W3_BAS_PIX_0680")
		return true
	await _sag("W3_BAS_MAX_0670")
	return true


func benutzen_patch_panel(_obj, _x) -> bool:
	if Spiel.ist_pixel():
		return await _kabel_stecken()
	await _sag("W3_BAS_MAX_0700")
	return true


func benutzen_fenster(_obj, _x) -> bool:
	if _raum_id() != "widerstandsbasis":
		return false
	if not Spiel.ist_pixel():
		await _sag("W3_BAS_MAX_0590")
		return true
	if Zustand.ist("W3_SCHNEE"):
		Zustand.setze("W3_SCHNEE", false)
		await _sag("W3_BAS_PIX_0610")
	else:
		Zustand.setze("W3_SCHNEE")
		await _sag("W3_BAS_PIX_0600")
	return true


func benutzen_wassereimer(_obj, _x) -> bool:
	if not Spiel.ist_pixel():
		return false
	await _sag("W3_BAS_PIX_0650")
	return true
#endregion

#region Code-Sicht und Tausche ######################################################################
## Rätsel 5: Beim zweiten Ansehen der Tür am Glaseingang schaltet Max die Code-Sicht frei.
func ansehen_tuer(_obj, _x) -> bool:
	if _raum_id() != "stadtstrasse" or Zustand.ist("CODE_SICHT"):
		return false
	if _einmal("W3_TUER_ANGESEHEN"):
		return false
	await _szene(["W3_TUER_MAX_0150", "W3_TUER_MAX_0160", "W3_TUER_MAX_0170"])
	Zustand.setze("CODE_SICHT")
	return true


## Code-Sicht im Raum: Auswahl der Tausche. true, wenn die Code-Sicht offen war.
func _code_sicht(oid: String) -> bool:
	var rid := _raum_id()
	if not Zustand.ist("CODE_SICHT") or _raum_geloest():
		return false
	if rid == "kern":
		if not Zustand.geloest("R10") or Zustand.ist("W3_ZELLE_KALT"):
			return false
		if _einmal("W3_CODE_KERN"):
			await _sag("W3_KERN_MAX_0430")
	match rid:
		"stadtstrasse":
			if _einmal("W3_CODE_TUTORIAL"):
				await _sag("W3_TUER_MAX_0180")
		"buero_50":
			if _einmal("W3_CODE_KLONE"):
				await _szene(["W3_TURM_MAX_0330", "W3_TURM_MAX_0340"])
		"testkammer_1":
			if _einmal("W3_CODE_KAM1"):
				await _sag("W3_KAM1_MAX_0430")
		"testkammer_2":
			if _hat("gummihuhn") and _einmal("W3_CODE_KAM2"):
				await _sag("W3_KAM2_MAX_0080")
	if _tausch.get("budget", 0) <= 0:
		await _szene(BUDGET_LEER.get(rid, []))
		return true
	var liste: Array = TAUSCHE.get(rid, []).filter(func(t):
		return (not t.has("braucht") or _hat(t.braucht)) and not t.get("loesung", "") in _tausch.geloest)
	var texte: Array = liste.map(func(t): return t.text)
	texte.append("UI_W3_CODE_SICHT_AUS")
	var w := await Spiel.auswahl(texte)
	if w < 0 or w >= liste.size():
		return true
	await _tauschen(rid, liste[w])
	return true


func _tauschen(rid: String, t: Dictionary) -> void:
	_tausch.budget = int(_tausch.budget) - 1
	await _szene(t.zeilen)
	var l: String = t.get("loesung", "")
	if l.is_empty():
		var fehl := _liste("W3_FEHLTAUSCHE")
		if not rid in fehl:
			fehl.append(rid)
			Zustand.setze_wert("W3_FEHLTAUSCHE", fehl)
	else:
		_tausch.geloest.append(l)
		match l:
			"R5":
				_loese("R5")
			"R6a":
				_loese("R6a")
			"R9b":
				_loese("R9b")
			"R9c":
				_loese("R9c", ["REGEL_3"])
			"tuer", "bernd":
				if "tuer" in _tausch.geloest and "bernd" in _tausch.geloest:
					await _abgeben("gummihuhn")  # bleibt am Boden von Kammer 3
					_loese("R9d")
					_figuren_anwenden(R.current)
			"kern":
				Zustand.setze("W3_KEKSE_WARM")
				Zustand.setze("W3_ZELLE_KALT")
	if _tausch.budget <= 0 and not _raum_geloest() and not (rid == "kern" and Zustand.ist("W3_ZELLE_KALT")):
		await _szene(BUDGET_LEER.get(rid, []))
#endregion

#region Rätsel 4: Die Vase des Orakels ##############################################################
func sichtbar_orakel_oma_0150() -> Variant:
	return _option_gewaehlt("OrakelOma", "0110") and _option_gewaehlt("OrakelOma", "0130") \
		and not Zustand.geloest("R4")


func sichtbar_orakel_oma_0130() -> Variant:
	return not Zustand.geloest("R4")


func option_orakel_oma_0150() -> bool:
	if Zustand.geloest("R4"):
		return false
	await _geben("rezeptkarte")
	_loese("R4", ["REGEL_2"])
	return false


func ansehen_kochbuch(_obj, _x) -> bool:
	Zustand.setze("REGEL_2")
	return false


func gegenstand_orakel_oma(_obj, iid) -> bool:
	match iid:
		"omas_kekse":
			await _sag("W3_KUCH_MAX_0760")
			return true
		"rezeptkarte":
			await _szene(["W3_KUCH_MAX_0770", "W3_KUCH_ORA_0780"])
			return true
	return false
#endregion

#region Rätsel 6 und 7: Büroturm ###################################################################
func gegenstand_klone(_obj, iid) -> bool:
	return await _tasse_befiehlt(iid)


func gegenstand_klon(_obj, iid) -> bool:
	return await _tasse_befiehlt(iid)


func benutzen_inventar_kaffeetasse(_obj, _x) -> bool:
	if _raum_id() != "buero_50":
		return false
	return await _tasse_befiehlt("kaffeetasse")


func _tasse_befiehlt(iid: String) -> bool:
	if iid != "kaffeetasse":
		return false
	if not Zustand.geloest("R6a"):
		await _sag("W3_TURM_MAX_0550")
		return true
	if Zustand.geloest("R6b"):
		return false
	await _szene(["W3_TURM_MAX_0390", "W3_TURM_KLO_0400", "W3_TURM_KLO_0410", "W3_TURM_MAX_0420",
		"W3_TURM_SCH_0430", "W3_TURM_MAX_0440"])
	await _geben("sonnenbrille")
	await _szene(["W3_TURM_SCH_0450", "W3_TURM_MAX_0460"])
	await _geben("schmidts_akte")
	_loese("R6b", ["REGEL_1"])
	_figuren_anwenden(R.current)
	await _sag("W3_TURM_MAX_0570")
	return true


## Regel 1 steht in der Akte (Nahansicht)
func ansehen_inventar_schmidts_akte(_obj, _x) -> bool:
	Zustand.setze("REGEL_1")
	return false


func benutzen_farbcode_an_der_wand(_obj, _x) -> bool:
	if _hat("farbcode_zettel") or Zustand.geloest("R7a"):
		return false
	await _sag("W3_TERM_MAX_0020")
	await _geben("farbcode_zettel")
	return true


func _turm_terminal() -> bool:
	if _einmal("W3_TERMINAL_TURM"):
		await _szene(["W3_TERM_MAX_0050", "W3_TERM_KAL_0060", "W3_TERM_KAL_0070", "W3_TERM_MAX_0080"])
		if not _hat("morse_tabelle"):
			await _szene(["W3_TERM_KAL_0100", "W3_TERM_MAX_0110"])
		return true
	if Zustand.geloest("R7a"):
		await _sag("W3_TERM_MAX_0200")
		return true
	if not _hat("farbcode_zettel"):
		await _sag("W3_TERM_MAX_0380")
		return true
	return await gegenstand_terminal(null, "farbcode_zettel")


func gegenstand_terminal(_obj, iid) -> bool:
	if _raum_id() != "buero_50":
		return false
	match iid:
		"handy":
			await _sag("W3_TERM_MAX_0040")
			return true
		"farbcode_zettel":
			if not _hat("morse_tabelle"):
				await _szene(["W3_TERM_KAL_0100", "W3_TERM_MAX_0110"])
				return true
			await _szene(["W3_TERM_KAL_0090", "W3_TERM_MAX_0120"])
			await _abgeben("farbcode_zettel")
			await _szene(["W3_TERM_PIX_0130", "W3_TERM_KAL_0140", "W3_TERM_MAX_0150", "W3_TERM_PIX_0160",
				"W3_TERM_KAL_0170", "W3_TERM_MAX_0180", "W3_TERM_KAL_0190", "W3_TERM_MAX_0200"])
			Zustand.loese("R7a")
			return true
	return false


## Rätsel 7b: Pixel steckt die drei Kabel (als Spielfigur in der Basis).
func _kabel_stecken() -> bool:
	if not Zustand.geloest("R7a") or Zustand.geloest("R7b"):
		await _sag("W3_TERM_PIX_0210")
		return true
	await _sag("W3_TERM_PIX_0210")
	var gesteckt := []
	for kabel in ["kreis", "dreieck", "quadrat"]:
		while true:
			var frei := BUCHSEN.filter(func(b): return not b in gesteckt)
			var w := await Spiel.auswahl(BUCHSEN.map(func(b): return "UI_W3_BUCHSE_" + b.to_upper()) + ["UI_W2_DOCH_NICHT"])
			if w < 0 or w >= BUCHSEN.size():
				return true
			var b: String = BUCHSEN[w]
			if not b in frei:
				await _sag("W3_TERM_PIX_0300")
			elif b == KABEL[kabel][0]:
				await _sag(KABEL[kabel][1])
				gesteckt.append(b)
				break
			else:
				# falsches Kabel: Max ist drüben kurz eine Ente
				await _szene(["W3_TERM_PIX_0250", "W3_TERM_MAX_0260", "W3_TERM_MAX_0270",
					"W3_TERM_PIX_0280", "W3_TERM_KAL_0290"])
	await _szene(["W3_TERM_PIX_0310", "W3_TERM_KAL_0320", "W3_TERM_MAX_0330", "W3_TERM_NAR_0340"])
	Zustand.loese("R7b")
	await _aufwachen()
	return true
#endregion

#region Rätsel 13: Kalles Morse-Tabelle ############################################################
func benutzen_kalles_tasse(_obj, _x) -> bool:
	if Zustand.geloest("R13"):
		return false
	if not Spiel.ist_pixel():
		await _sag("W3_PIEP_MAX_0270")
		return true
	await _szene(["W3_PIEP_PIX_0010", "W3_PIEP_KAL_0020", "W3_PIEP_NAR_0030", "W3_PIEP_KAL_0040",
		"W3_PIEP_NAR_0050", "W3_PIEP_PIE_0060", "W3_PIEP_PIX_0070", "W3_PIEP_KAL_0080",
		"W3_PIEP_PIX_0090", "W3_PIEP_PIE_0100", "W3_PIEP_PIX_0110", "W3_PIEP_OPA_0120",
		"W3_PIEP_OPA_0130", "W3_PIEP_MAX_0140", "W3_PIEP_PIX_0150", "W3_PIEP_MAX_0160",
		"W3_PIEP_PIE_0170", "W3_PIEP_PIX_0180", "W3_PIEP_KAL_0190"])
	await _geben("morse_tabelle")  # in Max' Inventar, auch wenn er in der Kapsel liegt
	await _szene(["W3_PIEP_PIX_0200", "W3_PIEP_KAL_0210"])
	Zustand.loese("R13")
	return true


func benutzen_tisch_mit_kalles_tasse(obj, x) -> bool:
	if Spiel.ist_pixel() and Zustand.geloest("R13"):
		await _sag("W3_PIEP_PIX_0260")
		return true
	return await benutzen_kalles_tasse(obj, x)


## Kalles Antwort nach Rätsel 13 ist eine Antwortvariante, keine eigene Frage.
func sichtbar_kalle_0420() -> Variant:
	return false
#endregion

#region Rätsel 8 und 9a: Laboreingang ###############################################################
func gegenstand_hausmeister(_obj, iid) -> bool:
	match iid:
		"olivenoel":
			if Zustand.ist("FREUND_0815"):
				return false
			await _sag("W3_EING_MAX_0240")
			await _szene(["W3_EING_HAU_0250", "W3_EING_HAU_0260", "W3_EING_PIX_0270"])
			Zustand.setze("FREUND_0815")
			return true
		"telefonbuchseite":
			await _szene(["W3_EING_MAX_0190", "W3_EING_HAU_0200", "W3_EING_HAU_0210", "W3_EING_HAU_0220",
				"W3_EING_PIX_0230"])
			await _abgeben("telefonbuchseite")
			_loese("R8", ["FREUND_0815"])
			_figuren_anwenden(R.current)
			return true
	return false


func gegenstand_kartenleser(_obj, iid) -> bool:
	if iid != "zugangskarte":
		return false
	if not Zustand.geloest("R8"):
		await _sag("W3_EING_HAU_0360")
		return true
	await _sag("W3_EING_MAX_0350")
	await _abgeben("zugangskarte")  # bleibt im Leser stecken
	Zustand.setze("W3_PANZERTUER_OFFEN")
	return true


func benutzen_datenanschluss(_obj, _x) -> bool:
	if not Zustand.ist("W3_PANZERTUER_OFFEN") or Zustand.geloest("R9a"):
		return false
	await _szene(["W3_EING_KAL_0380", "W3_EING_KAL_0390", "W3_EING_PIX_0400", "W3_EING_MAX_0410"])
	Zustand.loese("R9a")
	return true


func benutzen_panzertuer(obj, x) -> bool:
	if Zustand.ist("W3_PANZERTUER_OFFEN"):
		return await benutzen_datenanschluss(obj, x)
	return false
#endregion

#region Rätsel 12: Die vierte Zutat ################################################################
func gegenstand_herr_vier(_obj, iid) -> bool:
	if iid != "rezeptkarte" or Zustand.geloest("R12"):
		return false
	await _szene(["W3_SUPP_MAX_0010", "W3_SUPP_VIE_0020", "W3_SUPP_VIE_0030", "W3_SUPP_VIE_0040",
		"W3_SUPP_MAX_0050", "W3_SUPP_VIE_0060", "W3_SUPP_PIX_0070", "W3_SUPP_VIE_0080",
		"W3_SUPP_PIX_0090", "W3_SUPP_VIE_0100", "W3_SUPP_MAX_0110", "W3_SUPP_WEI_0120",
		"W3_SUPP_VIE_0130"])
	await _abgeben("rezeptkarte")
	await _geben("zugangskarte")
	await _szene(["W3_SUPP_MAX_0140", "W3_SUPP_PIX_0150"])
	Zustand.loese("R12")
	return true
#endregion

#region Rätsel 9: Testkammern ######################################################################
func benutzen_portalgeraet_in_der_halterung(_obj, _x) -> bool:
	if _hat("portalgeraet") or Zustand.ist("W3_PORTAL_GENOMMEN"):
		return false
	Zustand.setze("W3_PORTAL_GENOMMEN")
	await _sag("W3_KAM1_MAX_0080")
	await _geben("portalgeraet")
	return true


func benutzen_inventar_portalgeraet(_obj, _x) -> bool:
	if not _einmal("W3_PORTAL_BENUTZT"):
		return false
	await _szene(["W3_KAM1_NAR_0090", "W3_KAM1_OPA_0100", "W3_KAM1_POR_0110", "W3_KAM1_MAX_0120",
		"W3_KAM1_PIX_0130", "W3_KAM1_MAX_0140", "W3_KAM1_MUT_0150"])
	if _einmal("W3_BERND_VORGESTELLT"):
		await _szene(["W3_KAM1_MUT_0160", "W3_KAM1_BER_0170", "W3_KAM1_MUT_0180", "W3_KAM1_MAX_0190",
			"W3_KAM1_PIX_0200"])
	return true


func benutzen_bodenschalter(_obj, _x) -> bool:
	if Zustand.geloest("R9b"):
		return false
	if not Zustand.ist("CODE_SICHT"):
		await _sag("W3_KAM1_MAX_0320")
		return true
	return await _code_sicht("bodenschalter")


func benutzen_laser(_obj, _x) -> bool:
	if Zustand.geloest("R9c") or not Zustand.ist("CODE_SICHT"):
		return false
	return await _code_sicht("laser")


func ansehen_kritzelei(_obj, _x) -> bool:
	Zustand.setze("REGEL_3")
	return false


func ansehen_kritzelei_kammer_2(obj, x) -> bool:
	return await ansehen_kritzelei(obj, x)
#endregion

#region Rätsel 10 und 11: Kern #####################################################################
func _regeln() -> int:
	return ["REGEL_1", "REGEL_2", "REGEL_3"].filter(func(r): return Zustand.ist(r)).size()


func benutzen_mutti(_obj, _x) -> bool:
	if _raum_id() != "kern":
		return false
	if Zustand.geloest("R10"):
		await _sag("W3_KERN_MUT_0610")
		return true
	if _regeln() < 3:
		await _sag("W3_KERN_MAX_0340")
		if not Zustand.ist("REGEL_1") or not Zustand.ist("REGEL_2"):
			await _sag("W3_KERN_PIX_0350")
		return true
	await _paradoxon()
	return true


func _paradoxon() -> void:
	_paradox_stufe = 0
	while true:
		var optionen := ["UI_W3_REGEL_1", "UI_W3_REGEL_2", "UI_W3_REGEL_3", "W3_KERN_MAX_0290",
			"W3_KERN_MAX_0310", "UI_W2_DOCH_NICHT"]
		var w := await Spiel.auswahl(optionen)
		if w < 0 or w == 5:
			return
		match w:
			0:
				if _paradox_stufe == 0:
					await _szene(["W3_KERN_MAX_0110", "W3_KERN_MUT_0120"])
					_paradox_stufe = 1
				elif _paradox_stufe == 2:
					await _szene(["W3_KERN_MAX_0270", "W3_KERN_MUT_0280"])
				else:
					await _szene(["W3_KERN_MAX_0110", "W3_KERN_MUT_0120"])
			1:
				if _paradox_stufe == 1:
					await _szene(["W3_KERN_MAX_0130", "W3_KERN_MUT_0140"])
					_paradox_stufe = 2
				else:
					await _szene(["W3_KERN_MAX_0230", "W3_KERN_MUT_0240"])
			2:
				if _paradox_stufe == 2:
					await _szene(["W3_KERN_MAX_0150", "W3_KERN_MUT_0160", "W3_KERN_MUT_0170",
						"W3_KERN_MUT_0180", "W3_KERN_MAX_0190", "W3_KERN_MUT_0200", "W3_KERN_NAR_0210",
						"W3_KERN_PIX_0220"])
					Zustand.loese("R10")
					return
				await _szene(["W3_KERN_MAX_0250", "W3_KERN_MUT_0260"])
			3:
				await _szene(["W3_KERN_MAX_0290", "W3_KERN_MUT_0300"])
			4:
				await _szene(["W3_KERN_MAX_0310", "W3_KERN_MUT_0320", "W3_KERN_PIX_0330"])


func benutzen_energiezelle(obj, _x) -> bool:
	if _raum_id() != "kern":
		return false
	if not Zustand.ist("W3_ZELLE_KALT"):
		if Zustand.geloest("R10") and await _code_sicht("energiezelle"):
			if not Zustand.ist("W3_ZELLE_KALT"):
				return true
		else:
			await _sag("W3_KERN_MAX_0420")
			return true
	# kalt: nehmen, Welt geschafft
	await Spiel.nehmen(obj, obj.bauplan())
	_loese("R11", ["W3_KEKSE_WARM"])
	await _szene(["W3_KERN_PIX_0510", "W3_KERN_PIX_0520", "W3_KERN_MAX_0530"])
	await _abschluss()
	return true


func gegenstand_energiezelle(_obj, iid) -> bool:
	if iid == "portalgeraet":
		await _sag("W3_KERN_MAX_0580")
		return true
	return false


func kombi_energiezelle_portalgeraet() -> bool:
	await _sag("W3_KERN_MAX_0580")
	return true
#endregion

#region Abschluss ##################################################################################
## Pixels Lob nur ohne einen einzigen Hinweis der Stufe 3 in dieser Welt
func _hinweis_stufe_3() -> bool:
	for r in Zustand.alle_raetsel("welt-3"):
		if Hinweise.stufe(str(r.get("id", ""))) >= 3:
			return true
	return false


func _abschluss() -> void:
	await _aufwachen()
	var zeilen := ["W3_ENDE_NAR_0010", "W3_ENDE_PIX_0020", "W3_ENDE_KAL_0030", "W3_ENDE_REB_0050"]
	if Zustand.ist("FREUND_0815"):
		zeilen.append_array(["W3_ENDE_HAU_0060", "W3_ENDE_HAU_0070"])
	if not _hinweis_stufe_3():
		zeilen.append("W3_ENDE_PIX_0080")
	await _szene(zeilen)
	Spiel.herkunft_raum = ""
	await R.goto_room(Bauplan.raum_script_name("unterstadt_strasse"))
	await _szene(["W3_ENDE_NAR_0090", "W3_ENDE_MAX_0100", "W3_ENDE_PIX_0110", "W3_ENDE_MAX_0120",
		"W3_ENDE_PIX_0130", "W3_ENDE_DEC_0140"])
	await Spiel.zwischenspiel_beginnen(3)
#endregion
