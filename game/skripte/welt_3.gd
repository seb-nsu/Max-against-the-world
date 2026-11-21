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
## Code-Sicht (ab Rätsel 5): Benutzen auf einem Tauschobjekt zeigt die Wörter des Raums; Max klickt
## ein Wort an einem Objekt an, dann eins an einem anderen, und die beiden tauschen (zweistufige
## Wahl, oberflaeche/code_sicht_wahl.gd). Tausche und Budget gelten nur, solange Max im Raum bleibt
## (_tausch, nie gespeichert); gespeichert wird nur, ob das Rätsel gelöst ist.

#region Konstanten ################################################################################
const SIMULATION := ["stadtstrasse", "kueche_orakel", "buero_50"]
const LABOR := ["testkammer_1", "testkammer_2", "testkammer_3", "kern"]

## Tausche je Raum: Text (UI), beteiligte Objekte (für die Etiketten der Code-Sicht), Zeilen,
## gelöst-Kennung (leer = Fehltausch), benötigt Gegenstand
const TAUSCHE := {
	"stadtstrasse": [
		{"text": "UI_W3_TAUSCH_TUER_SCHMIDT", "objekte": ["tuer", "schmidt"], "loesung": "R5",
			"zeilen": ["W3_TUER_NAR_0190", "W3_TUER_TUR_0200", "W3_TUER_TUR_0210", "W3_TUER_SCH_0220", "W3_TUER_MAX_0230"]},
		{"text": "UI_W3_TAUSCH_TUER_AUTO", "objekte": ["tuer", "auto"], "zeilen": ["W3_TUER_MAX_0250"]},
		{"text": "UI_W3_TAUSCH_TUER_HAUSSCHUHE", "objekte": ["tuer", "schmidt"], "zeilen": ["W3_TUER_MAX_0260", "W3_TUER_SCH_0270"]},
		{"text": "UI_W3_TAUSCH_SCHMIDT_BAUM", "objekte": ["schmidt", "baeume"], "zeilen": ["W3_TUER_MAX_0280"]},
	],
	"buero_50": [
		{"text": "UI_W3_TAUSCH_ORIGINAL_TASSE", "objekte": ["schmidt", "kaffeetasse"], "loesung": "R6a", "braucht": "kaffeetasse",
			"zeilen": ["W3_TURM_NAR_0350", "W3_TURM_SCH_0360", "W3_TURM_KLO_0370", "W3_TURM_MAX_0380"]},
		{"text": "UI_W3_TAUSCH_ORIGINAL_KLON", "objekte": ["schmidt", "klon"], "zeilen": ["W3_TURM_MAX_0490", "W3_TURM_KLO_0500"]},
		{"text": "UI_W3_TAUSCH_HAUSSCHUHE_TASSE", "objekte": ["schmidt", "kaffeetasse"], "braucht": "kaffeetasse", "zeilen": ["W3_TURM_MAX_0510"]},
		{"text": "UI_W3_TAUSCH_ORIGINAL_PFLANZE", "objekte": ["schmidt", "topfpflanzen"], "zeilen": ["W3_TURM_MAX_0520"]},
	],
	"testkammer_1": [
		{"text": "UI_W3_TAUSCH_BERND_MAX", "objekte": ["bernd", "max"], "loesung": "R9b",
			"zeilen": ["W3_KAM1_NAR_0440", "W3_KAM1_MAX_0450", "W3_KAM1_NAR_0460", "W3_KAM1_MAX_0470",
				"W3_KAM1_PIX_0480", "W3_KAM1_MUT_0490"]},
		{"text": "UI_W3_TAUSCH_BERND_KUCHEN", "objekte": ["bernd", "pappkuchen"], "zeilen": ["W3_KAM1_MAX_0530"]},
		{"text": "UI_W3_TAUSCH_BERND_EHRLICH", "objekte": ["bernd", "pappkuchen"], "zeilen": ["W3_KAM1_MAX_0540"]},
		{"text": "UI_W3_TAUSCH_SCHALTER_MUEDE", "objekte": ["bodenschalter", "max"], "zeilen": ["W3_KAM1_MAX_0550"]},
	],
	"testkammer_2": [
		{"text": "UI_W3_TAUSCH_LASER_HUHN", "objekte": ["laser", "gummihuhn"], "loesung": "R9c", "braucht": "gummihuhn",
			"zeilen": ["W3_KAM2_NAR_0090", "W3_KAM2_MAX_0100", "W3_KAM2_MUT_0120"]},
		{"text": "UI_W3_TAUSCH_LASER_FARBE", "objekte": ["laser", "gummihuhn"], "braucht": "gummihuhn", "zeilen": ["W3_KAM2_MAX_0190"]},
		{"text": "UI_W3_TAUSCH_LASER_SOCKEL", "objekte": ["laser", "sockel"], "zeilen": ["W3_KAM2_MAX_0200"]},
		{"text": "UI_W3_TAUSCH_HUHN_KRITZELEI", "objekte": ["gummihuhn", "kritzelei"], "braucht": "gummihuhn", "zeilen": ["W3_KAM2_MAX_0210"]},
	],
	"testkammer_3": [
		{"text": "UI_W3_TAUSCH_TUER_LAUTSPRECHER", "objekte": ["tuer", "lautsprecher"], "loesung": "tuer",
			"zeilen": ["W3_KAM3_NAR_0100", "W3_KAM3_TUR_0110", "W3_KAM3_MAX_0120", "W3_KAM3_MUT_0130", "W3_KAM3_PIX_0140"]},
		{"text": "UI_W3_TAUSCH_BERND_HUHN", "objekte": ["bernd", "gummihuhn"], "loesung": "bernd", "braucht": "gummihuhn",
			"zeilen": ["W3_KAM3_NAR_0150", "W3_KAM3_MAX_0160"]},
		{"text": "UI_W3_TAUSCH_TUER_BERND", "objekte": ["tuer", "bernd"], "zeilen": ["W3_KAM3_MAX_0190", "W3_KAM3_PIX_0200"]},
		{"text": "UI_W3_TAUSCH_LAUTSPRECHER_HUHN", "objekte": ["lautsprecher", "gummihuhn"], "braucht": "gummihuhn", "zeilen": ["W3_KAM3_MAX_0210"]},
		{"text": "UI_W3_TAUSCH_LAUTSPRECHER_BERND", "objekte": ["lautsprecher", "bernd"], "zeilen": ["W3_KAM3_MAX_0220", "W3_KAM3_BER_0230"]},
		{"text": "UI_W3_TAUSCH_TUER_HUHN", "objekte": ["tuer", "gummihuhn"], "braucht": "gummihuhn", "zeilen": ["W3_KAM3_MAX_0240"]},
	],
	"kern": [
		{"text": "UI_W3_TAUSCH_ZELLE_KEKSE", "objekte": ["energiezelle", "omas_kekse"], "loesung": "kern", "braucht": "omas_kekse",
			"zeilen": ["W3_KERN_NAR_0440", "W3_KERN_MAX_0450", "W3_KERN_PIX_0460"]},
		{"text": "UI_W3_TAUSCH_ZELLE_MAX", "objekte": ["energiezelle", "max"], "zeilen": ["W3_KERN_MAX_0600"]},
	],
}
const BUDGET := {"stadtstrasse": 2, "buero_50": 2, "testkammer_1": 2, "testkammer_2": 2,
	"testkammer_3": 2, "kern": 1}
const BUDGET_LEER := {"stadtstrasse": ["W3_TUER_MAX_0290"], "buero_50": ["W3_TURM_MAX_0530"],
	# Büro und Kammer 1 haben keinen offenen Ausgang: Die Zeilen nennen den Figurenwechsel (W3-R08-01)
	"testkammer_1": ["W3_KAM1_MUT_0570", "W3_KAM1_PIX_0575"], "testkammer_2": ["W3_KAM1_MUT_0570"],
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
	{"frage": "W3_TEST_DEC_0100", "beobachtung": "W3_BEOBACHTUNG_SCHIRM",
		"antworten": [["W3_TEST_MAX_0110", "W3_TEST_DEC_0120"], ["W3_TEST_MAX_0130", "W3_TEST_DEC_0140"],
			["W3_TEST_MAX_0150", "W3_TEST_DEC_0160"]]},
	{"frage": "W3_TEST_DEC_0170", "beobachtung": "W3_BEOBACHTUNG_MUSIKER",
		"antworten": [["W3_TEST_MAX_0180", "W3_TEST_DEC_0190"], ["W3_TEST_MAX_0200", "W3_TEST_DEC_0210"],
			["W3_TEST_MAX_0220", "W3_TEST_DEC_0230"]]},
	{"frage": "W3_TEST_DEC_0240", "beobachtung": "W3_BEOBACHTUNG_SUPPE",
		"antworten": [["W3_TEST_MAX_0250", "W3_TEST_DEC_0260"], ["W3_TEST_MAX_0270", "W3_TEST_DEC_0280"],
			["W3_TEST_MAX_0290", "W3_TEST_DEC_0300"]]},
]
## Beobachtungen (R1a): Figur → Schalter
const BEOBACHTUNG := {"frau_regenschirm": "W3_BEOBACHTUNG_SCHIRM",
	"strassenmusiker_w3": "W3_BEOBACHTUNG_MUSIKER", "weinender_mann": "W3_BEOBACHTUNG_SUPPE"}

## Patch-Panel (R7b): Kabel → richtige Buchse und Zeile
const KABEL := {"kreis": ["rot", "W3_TERM_PIX_0220"], "dreieck": ["gruen", "W3_TERM_PIX_0230"],
	"quadrat": ["gelb", "W3_TERM_PIX_0240"]}
const BUCHSEN := ["rot", "gruen", "gelb"]

## Pixel auf Figuren, deren Auslöser der Bauplan nicht zuordnet (gebeugte Namen)
const PIXEL_AUF := {"herr_vier": "W3_STR_PIX_1020", "weinender_mann": "W3_STR_PIX_1040"}

## Objekte, deren Regel benutzen_<id>() auch Pixel als Spielfigur behandelt (ist_pixel()). Ein Klick
## von Pixel (Art „pixel“) geht dorthin; liefert die Regel false, schnuppert Pixel wie sonst.
const PIXEL_BENUTZT := ["patch_panel", "kalles_tasse", "tisch_mit_kalles_tasse", "lueftungsschacht",
	"wassereimer", "fenster", "stromkasten", "max_kapsel", "automat", "pastillenautomat", "terminal"]
## Rätselschritte, die Pixel als Spielfigur löst (ortsbezogene Hilfe-Pfote, W3-04)
const PIXEL_SCHRITTE := ["R7b", "R13"]

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
	# Erste Worte und Zwischenbemerkungen, bevor das Gespräch (oder die Code-Sicht) beginnt
	if art == "benutzen" and not Spiel.ist_pixel() and obj is PopochiuCharacter:
		await _vor_gespraech(oid)
	# Code-Sicht: Benutzen auf einem Tauschobjekt
	if art == "benutzen" and not Spiel.ist_pixel() and oid in TAUSCH_OBJEKTE.get(_raum_id(), []):
		if await _code_sicht(oid):
			return true
	var name := "%s_%s" % [art, oid]
	if has_method(name):
		return bool(await call(name, obj, iid))
	# Pixel als Spielfigur klickt ein Objekt an: Die Basisklassen melden das als Art „pixel“, die
	# Regeln von Welt 3 stehen aber als benutzen_<id>() mit ist_pixel() (Review 20.11., W3-01).
	if art == "pixel" and Spiel.ist_pixel() and oid in PIXEL_BENUTZT:
		return bool(await call("benutzen_" + oid, obj, iid))
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
		"partner_getrennt":
			# In die Kühlung passt nur Pixel (durch den Lüftungsschacht); Max wartet in der Basis
			return getrennt() or _raum_id() == "kuehlung"
		"wechsel_getrennt":
			return getrennt()
		"wechsel_moeglich":
			return true if getrennt() else null
		"pixel_ausgang":
			# Pixel geht sonst durch keine Tür; Schacht und Kühlung sind seine (W3-01)
			return _id(obj) == "ausgang_kuehlung" or _raum_id() == "kuehlung"
		"hinweis_rang":
			return _hinweis_rang(str(obj), str(item))
		"hinweis_vorher":
			return _hinweis_vorher(str(obj))
		"hinweis_wegweiser":
			return _hinweis_wegweiser()
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


## Rätsel lösen, ohne dabei Schalter zu setzen, die eigene Bedingungen haben (W3_FREUND_0815 nur mit
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
			return Zustand.ist("W3_HEXENSCHUSS")
		"ohne Olivenöl in der Tasche":
			return not _hat("olivenoel")
		"mit Olivenöl":
			return _hat("olivenoel")
		"nur bei W3_FREUND_0815":
			return Zustand.ist("W3_FREUND_0815")
		"nach dem Portal":
			return Zustand.ist("W3_PORTAL_BENUTZT")
		"Max wach":
			return not getrennt()
		"vor der Lösung", "vor der Szene":
			return not Zustand.geloest("R4") if _raum_id() == "kueche_orakel" else null
		"nach der Szene":
			return Zustand.geloest("R4")
		"Panzertür offen":
			return Zustand.ist("W3_PANZERTUER_OFFEN")
		"nach dem zweiten Tausch":
			return Zustand.geloest("R9d")
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
		C.player = C.get_character("Pixel")  # C.Pixel fehlt, solange Pixel in diesem Lauf in keinem Raum stand
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
	Zustand.setze("W3_WECKER_KLINGELT", false)   # jeder Traum beginnt um 5:59
	_wecker_bis = 0
	Spiel.herkunft_raum = "Zelle" if ziel in SIMULATION else "Kapsel"
	await R.goto_room(Bauplan.raum_script_name(ziel))


## Max wacht in seiner Kapsel in der Widerstandsbasis auf.
func _aufwachen() -> void:
	Zustand.setze_wert("W3_EBENE", "realitaet")
	Zustand.setze("W3_NACHT", false)   # Pixel hat den Strom längst wieder an
	Zustand.setze_wert("W3_MAX_RAUM", "widerstandsbasis")
	I.active = null
	C.player = C.Max
	Spiel.figur_gewechselt.emit(C.player)
	Spiel.herkunft_raum = "Kapsel"
	await Spiel.raum_wechseln_und_warten(Bauplan.raum_script_name("widerstandsbasis"))


## Klingelnder Radiowecker oder Omas Eieruhr: zurück in die Realität. Die Werte W3_LETZTE_ZELLE und
## W3_ZELLE_BENUTZT heißen noch nach der Fassung mit Telefonzellen (Spielstände bleiben gültig).
func _wecker_aufstehen(wecker: String, zeile: String) -> void:
	Zustand.setze_wert("W3_LETZTE_ZELLE", wecker)
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
	elif C.player.script_name == "Pixel" and getrennt():
		Zustand.setze_wert("W3_PIXEL_RAUM", rid)


func _figuren_anwenden(raum: CQRaum) -> void:
	var rid := raum.raum_id()
	var plan := {
		"Morphaeus": rid in ["unterstadt_strasse", "apothekengasse"] and Zustand.geloest("R2") and not Zustand.geloest("R3b"),
		"Hausmeister": rid == "laboreingang" and not Zustand.geloest("R8"),
		"Klon": rid == "buero_50" and not Zustand.geloest("R6b"),
		"Bernd": (rid == "testkammer_1" and not Zustand.geloest("R9b")) or (rid == "testkammer_3" and not Zustand.geloest("R9d")),
		"Kalle": rid == "widerstandsbasis",
		"Mutti": rid == "kern",       # in den Testkammern nur Stimme aus dem Lautsprecher
		"Opa": false,                 # spricht nur als Hologramm und durch das Portal
		"PortalgeraetStimme": false,  # nur Stimme
	}
	for sn in plan:
		var pos := Vector2.INF
		if plan[sn] and not raum.has_character(sn) and raum.has_marker(sn):
			pos = raum.get_marker_position(sn)
		Spiel.figur_hier(sn, plan[sn], pos)
	_max_gang()
	if rid == "stadtstrasse":
		_wecker_anzeigen()
		_katze_schleife()


## Der Radiowecker zeigt 5:59 und klingelt erst eine halbe Minute nach dem Einschlafen (W3-B50,
## W3-B51). Davor gilt die Klickfläche „Radiowecker“, danach „klingelnder Radiowecker“.
const WECKER_SEKUNDEN := 30.0
var _wecker_wartet := false
## Wann der Wecker in diesem Traum klingelt (Ticks, 0 = noch nicht gestellt). Einmal je Traum gestellt,
## nicht bei jedem Betreten (Review 20.11., W3-R06-04).
var _wecker_bis := 0


func _wecker_anzeigen() -> void:
	var raum = R.current
	if not is_instance_valid(raum) or _raum_id() != "stadtstrasse":
		return
	var klingelt := Zustand.ist("W3_WECKER_KLINGELT")
	for h in raum.get_hotspots():
		if h.script_name == "Radiowecker":
			h.visible = not klingelt
		elif h.script_name == "KlingelnderRadiowecker":
			h.visible = klingelt


func _wecker_warten() -> void:
	if _wecker_wartet or Spiel.testmodus or Zustand.ist("W3_WECKER_KLINGELT"):
		return
	_wecker_wartet = true
	if _wecker_bis == 0:
		_wecker_bis = Time.get_ticks_msec() + int(WECKER_SEKUNDEN * 1000)
	while Time.get_ticks_msec() < _wecker_bis and _raum_id() == "stadtstrasse":
		await Spiel.get_tree().create_timer(0.5).timeout
	_wecker_wartet = false
	if _raum_id() != "stadtstrasse" or Zustand.ist("W3_WECKER_KLINGELT"):
		return
	Zustand.setze("W3_WECKER_KLINGELT")
	Klang.geraeusch("radiowecker")
	_wecker_anzeigen()


## Die schwarze Katze der Simulation läuft immer gleich über die Bordsteinkante, von rechts nach
## links, alle 20 Sekunden (Déjà-vu, W3_SIM_MAX_0040; Platzierung W3-R06_platzierung.json)
const KATZE_WEG := [1300.0, -60.0, 306.0]   # von x, nach x, Fußlinie
var _katze_laeuft := false


func _katze_schleife() -> void:
	if _katze_laeuft or Spiel.testmodus:
		return
	_katze_laeuft = true
	while _raum_id() == "stadtstrasse":
		var k: PopochiuCharacter = C.get_runtime_character("SchwarzeKatze")
		if not is_instance_valid(k) or not k.is_inside_tree():
			break
		k.position = Vector2(KATZE_WEG[0], KATZE_WEG[2])
		k.update_scale()
		k.face_left()
		k.play_animation("walk")
		var tw := k.create_tween()
		tw.tween_property(k, "position:x", KATZE_WEG[1], (KATZE_WEG[0] - KATZE_WEG[1]) / 55.0)
		await tw.finished
		if not is_instance_valid(k):
			break
		k._play_idle()
		await Spiel.get_tree().create_timer(20.0).timeout
	_katze_laeuft = false


## Nach dem Hexenschuss hinkt Max bis zum Ende der Welt (Hand am Rücken, W3-B47)
func _max_gang(hinkt := true) -> void:
	if not is_instance_valid(C.Max) or not C.Max.has_method("hat_animation"):
		return
	var gang := "walk"
	if hinkt and Zustand.ist("W3_HEXENSCHUSS") and C.Max.hat_animation("hexenschuss_gehen"):
		gang = "hexenschuss_gehen"
	C.Max.walk_animation = gang
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
	_wecker_warten()
	return true


func nach_uebergang_kueche_orakel(_raum, _x) -> bool:
	return await _erstes_betreten("kueche_orakel")


func nach_uebergang_buero_50(_raum, _x) -> bool:
	if _einmal("W3_TURM_GESEHEN"):
		await _szene(["W3_TURM_SCH_0010", "W3_TURM_MAX_0020", "W3_TURM_SCH_0030", "W3_TURM_SCH_0040",
			"W3_TURM_KLO_0050", "W3_TURM_MAX_0060", "W3_TURM_KLO_0070", "W3_TURM_NAR_0080",
			"W3_TURM_MAX_0090", "W3_TURM_MAX_0100"])
		Zustand.setze("W3_HEXENSCHUSS")
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
	await _loesung_b()
	return true


## Lösung B: Pixel hat das Fenster über der Kapsel geöffnet, es schneit auf Max' Körper. Greift beim
## Betreten des Kerns und direkt nach dem Paradoxon, wenn das Fenster schon offen war (W3-R03-06).
func _loesung_b() -> void:
	if Zustand.ist("W3_SCHNEE") and Zustand.geloest("R10") and not Zustand.ist("W3_ZELLE_KALT") \
			and _raum_id() == "kern":
		Zustand.setze("W3_ZELLE_KALT")
		Zustand.setze("W3_ZELLE_SCHNEE")  # für Pixels Schlusszeile („ich habe das Fenster“)
		await _szene(["W3_KERN_NAR_0480", "W3_KERN_MAX_0490"])


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


func ansehen_strassenmusiker_w3(_obj, _x) -> bool:
	_beobachtung("strassenmusiker_w3")
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


## Der Test bleibt nach dem Durchfallen wählbar („(bleibt)“ im Skript), bis er bestanden ist
## (Review 20.11., W3-R01-01).
func sichtbar_deckert_0090() -> Variant:
	return not Zustand.geloest("R1b")
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
func option_morphaeus_0600() -> bool:
	if _einmal("W3_WENIGER_LOGISCH"):
		await _sag("W3_NUD_MAX_0620")
	return false


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
		# Pixel läuft auf eigene Faust einmal vorbei: zählt nicht, Max sieht den Unterschied
		if Zustand.ist("W3_SYMPTOM_BEKANNT") and not Zustand.ist("W3_PIXEL_DOPPELT") and not Zustand.geloest("R3a"):
			await _sag("W3_APO_PIX_0180")
			Zustand.setze("W3_PIXEL_EINMAL")
			return true
		return false
	if Zustand.ist("W3_PIXEL_EINMAL") and not Zustand.ist("W3_PIXEL_DOPPELT") and _einmal("W3_PIXEL_NICHT_GLEICH"):
		await _sag("W3_APO_MAX_0220")
		return true
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
	# Die Wahl ist gefallen: Die blaue bleibt beim Automaten (Review 20.11., W3-R02-03)
	await _abgeben("blaue_pastille")
	Zustand.loese("R3b")
	await _einschlafen("stadtstrasse")
	return true
#endregion

#region Ebenenwechsel: Wecker, Terminal, Kapsel #####################################################
## Die Telefonzelle der Unterstadt ist kein Sprungpunkt (W3_STR_MAX_0040 aus dem Bauplan), am Ende
## klingelt dort der Werbeblock. In der Simulation wecken nur Wecker.
func benutzen_radiowecker(_obj, _x) -> bool:
	# Beim ersten Aufstehen 0230, danach 0240. Vor dem ersten Klingeln weiß Max noch nicht, dass
	# der Wecker ihn rausholt: er tippt auf die Anzeige, es bleibt 5:59.
	if not Zustand.ist("W3_WECKER_KLINGELT") and not Zustand.ist("W3_ZELLE_BENUTZT"):
		await _sag("W3_SIM_MAX_0215")
		return true
	var zeile := "W3_SIM_MAX_0240" if Zustand.ist("W3_ZELLE_BENUTZT") else "W3_SIM_MAX_0230"
	Zustand.setze("W3_ZELLE_BENUTZT")
	await _wecker_aufstehen("stadtstrasse", zeile)
	return true


func benutzen_klingelnder_radiowecker(obj, x) -> bool:
	Zustand.setze("W3_WECKER_KLINGELT")   # die Klickfläche gibt es nur, solange er klingelt
	return await benutzen_radiowecker(obj, x)


func benutzen_eieruhr(_obj, _x) -> bool:
	await _wecker_aufstehen("kueche_orakel", "W3_KUCH_MAX_0680")
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
	# Aus dem Büroturm führt nur Rätsel 7 hinaus; Schütteln würde R7 und R13 überspringen
	# (Review 20.11., W3-R08-02, Entscheidung Sebastian: sperren)
	if str(Zustand.wert("W3_MAX_RAUM", "")) == "buero_50" and not Zustand.geloest("R7b"):
		await _sag("W3_BAS_PIX_0545")
		return true
	await _sag("W3_BAS_PIX_0540")
	await _aufwachen()
	return true


func benutzen_stromkasten(_obj, _x) -> bool:
	if Spiel.ist_pixel():
		await _sag("W3_BAS_PIX_0680")
		# Gag: drüben wird es Nacht (Stadtstraße W3-R06b), bis Max das nächste Mal aufwacht
		if getrennt():
			Zustand.setze("W3_NACHT")
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
	if Zustand.ist("W3_SCHNEE") and ebene() == "labor" and not Zustand.ist("W3_ZELLE_KALT"):
		await _sag("W3_BAS_PIX_0615")  # bleibt offen, solange Max im Labor ist (W3-R03-06)
	elif Zustand.ist("W3_SCHNEE"):
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
	Zustand.setze("W3_EIMER_GEKIPPT")  # Kühlung taut (Hintergrund W3-R04b)
	return true
#endregion

#region Code-Sicht und Tausche ######################################################################
## Rätsel 5: Beim zweiten Ansehen der Tür am Glaseingang schaltet Max die Code-Sicht frei und sieht
## die Wörter gleich (Regie 0150–0180). Die Glasfläche gehört zur Tür: Ansehen des Ausgangs zählt
## vor der Freischaltung mit (Review 20.11., W3-R06-01, ansehen_ausgang_buero_50()).
func ansehen_tuer(_obj, _x) -> bool:
	if _raum_id() != "stadtstrasse" or Zustand.ist("W3_CODE_SICHT"):
		return false
	if _einmal("W3_TUER_ANGESEHEN"):
		return false
	await _sag("W3_TUER_MAX_0150")
	Zustand.setze("W3_CODE_SICHT")
	_code_frisch = true
	await _code_sicht("tuer")
	return true


## Die Glastür ist zugleich der Ausgang zum Büroturm; vor der Freischaltung zählt ihr Ansehen wie
## das der Tür (erstes Mal die Zeile des Ausgangs, zweites Mal die Freischaltung).
func ansehen_ausgang_buero_50(obj, x) -> bool:
	if _raum_id() != "stadtstrasse" or Zustand.ist("W3_CODE_SICHT"):
		return false
	return await ansehen_tuer(obj, x)


## Sprechanlage der Glastür (Klickfläche kommt mit dem Layout, siehe AP-02-Antwort): wie die Tür.
func ansehen_sprechanlage(obj, x) -> bool:
	return await ansehen_ausgang_buero_50(obj, x)


## Code-Sicht im Raum: Wörter zeigen, zwei wählen lassen, tauschen (W3-03, zweistufige Wahl statt
## einer Liste fertiger Tauschsätze). true, wenn die Code-Sicht zuständig war.
##
## Ein Paar mit eigenem Eintrag in TAUSCHE spielt dessen Zeilen (Lösung oder Fehltausch mit Pointe).
## Jedes andere Paar aus zwei Objekten ist auch ein Tausch: Es kostet einen Versuch und zählt als
## Fehltausch, Max sagt die allgemeine Zeile 0390. Begründung: Laut Rätseldoku kann Max beliebige
## Eigenschaften zwischen zwei Dingen tauschen, und jeder Tausch kostet Budget; ein kostenloses
## Durchprobieren würde die Paare mit Pointe (und damit die Lösung) verraten. Kostenlos und ohne
## Tausch bleiben nur zwei Wörter am selben Objekt (0400) und das Zurücktauschen eines schon gelösten
## Paares in Kammer 3 (0410). Etiketten bleiben nach Fehltauschen, wie sie waren (wie bisher die
## Liste); nach einem Lösungstausch in Kammer 3 stehen die beiden Wörter am neuen Objekt.
func _code_sicht(_oid: String) -> bool:
	var rid := _raum_id()
	if not Zustand.ist("W3_CODE_SICHT") or _raum_geloest():
		return false
	if rid == "kern" and (not Zustand.geloest("R10") or Zustand.ist("W3_ZELLE_KALT")):
		return false
	if _code_offen:
		return true   # zweiter Klick, während die Code-Sicht schon offen ist
	if _tausch.get("budget", 0) <= 0:
		await _szene(BUDGET_LEER.get(rid, []))
		return true
	_code_offen = true
	Klang.geraeusch("code_sicht")  # Code-Sicht an
	_code_sicht_zeigen(rid, true)   # Wörter außerhalb des Bildausschnitts an den Rand holen
	var erst := _code_einfuehrung(rid)
	if not erst.is_empty():
		await _szene(erst)
	while is_instance_valid(_code_wahl):
		Spiel.in_szene += 1   # Figurenwechsel und Zurufe ruhen, Controller rastet nur auf Wörtern ein
		var wahl: Array = await _code_wahl.waehlen()
		Spiel.in_szene -= 1
		if wahl.is_empty():
			_code_sicht_weg()
			Klang.geraeusch("code_sicht")  # und wieder aus
			break
		var a: Dictionary = _code_woerter[wahl[0]]
		var b: Dictionary = _code_woerter[wahl[1]]
		if a.oid == b.oid:
			await _sag("W3_TUER_MAX_0400")
			continue
		if _code_zurueck(rid, a, b):
			await _sag("W3_TUER_MAX_0410")
			continue
		Telemetrie.auswahl("%s:%s ↔ %s:%s" % [a.oid, a.wort, b.oid, b.wort], 0)
		_code_sicht_weg()
		var t := _code_tausch(rid, a, b)
		await _tauschen(rid, t if not t.is_empty() else {"zeilen": ["W3_TUER_MAX_0390"]})
		break
	_code_offen = false
	_code_frisch = false
	return true


## Zeilen beim ersten Öffnen je Raum, gesprochen, während die Wörter schon zu sehen sind.
func _code_einfuehrung(rid: String) -> Array:
	match rid:
		"stadtstrasse":
			if _einmal("W3_CODE_TUTORIAL"):
				# 0160/0170 nur direkt nach der Freischaltung (alte Spielstände haben sie schon gehört)
				return (["W3_TUER_MAX_0160", "W3_TUER_MAX_0170"] if _code_frisch else []) + ["W3_TUER_MAX_0180"]
		"buero_50":
			if _einmal("W3_CODE_KLONE"):
				return ["W3_TURM_MAX_0330", "W3_TURM_MAX_0340"]
		"testkammer_1":
			if _einmal("W3_CODE_KAM1"):
				return ["W3_KAM1_MAX_0430"]
		"testkammer_2":
			if _hat("gummihuhn") and _einmal("W3_CODE_KAM2"):
				return ["W3_KAM2_MAX_0080"]
		"kern":
			if _einmal("W3_CODE_KERN"):
				return ["W3_KERN_MAX_0430"]
	return []


## Wörter des Raums aus den Tauschtexten („Tür: verschlossen ↔ Schmidt: gesprächig“, also auch auf
## Englisch): je Wort {oid (wo es gerade hängt), von (wo es herkommt), wort, name}. Gelöste Tausche
## in Kammer 3 stehen vertauscht.
func _code_woerter_lesen(rid: String) -> Array:
	var liste := []
	var gesehen := {}
	for t: Dictionary in TAUSCHE.get(rid, []):
		var haelften := tr(t.text).split("↔")
		for i in mini(haelften.size(), t.get("objekte", []).size()):
			var teil := haelften[i].split(":")
			var oid: String = t.objekte[i]
			var wort := teil[teil.size() - 1].strip_edges()
			if gesehen.has(oid + "|" + wort):
				continue
			gesehen[oid + "|" + wort] = true
			liste.append({"oid": oid, "von": oid, "wort": wort, "name": teil[0].strip_edges()})
	for t: Dictionary in TAUSCHE.get(rid, []):
		if t.get("loesung", "") in _tausch.get("geloest", []):
			var paar := _code_paar(t)
			for w: Dictionary in liste:
				if w.von == paar[0].oid and w.wort == paar[0].wort:
					w.oid = paar[1].oid
				elif w.von == paar[1].oid and w.wort == paar[1].wort:
					w.oid = paar[0].oid
	return liste


## Die beiden Wörter eines Tauschs: [{oid, wort}, {oid, wort}]
func _code_paar(t: Dictionary) -> Array:
	var haelften := tr(t.text).split("↔")
	var paar := []
	for i in 2:
		var teil := haelften[i].split(":")
		paar.append({"oid": t.objekte[i], "wort": teil[teil.size() - 1].strip_edges()})
	return paar


## Eintrag in TAUSCHE für zwei gewählte Wörter (an ihren jetzigen Objekten), sonst {}.
func _code_tausch(rid: String, a: Dictionary, b: Dictionary) -> Dictionary:
	for t: Dictionary in TAUSCHE.get(rid, []):
		if t.get("loesung", "") in _tausch.get("geloest", []):
			continue
		var p := _code_paar(t)
		var passt := func(x: Dictionary, y: Dictionary) -> bool:
			return x.oid == y.oid and x.wort == y.wort
		if (passt.call(a, p[0]) and passt.call(b, p[1])) or (passt.call(a, p[1]) and passt.call(b, p[0])):
			return t
	return {}


## Die zwei Wörter eines schon gelösten Tauschs zurücktauschen?
func _code_zurueck(rid: String, a: Dictionary, b: Dictionary) -> bool:
	for t: Dictionary in TAUSCHE.get(rid, []):
		if not t.get("loesung", "") in _tausch.get("geloest", []):
			continue
		var p := _code_paar(t)
		var ids := [a.von + "|" + a.wort, b.von + "|" + b.wort]
		if p[0].oid + "|" + p[0].wort in ids and p[1].oid + "|" + p[1].wort in ids:
			return true
	return false


## Code-Sicht als Bild (grafik/welt-3.md): der Hintergrund als grüne Umrisse
## (tools/grafik_w3/code_sicht.py) über dem Hintergrund und unter den Figuren, die Figuren grün
## getönt, an jedem Tauschobjekt die Wörter als Knöpfe (oberflaeche/code_sicht_wahl.gd).
## Gegenstände, die ein Tausch braucht, sind nur in Max' Tasche wählbar; im Raum steht ihr Etikett
## ausgegraut (wie früher: zu sehen, aber nicht in der Auswahl).
const CODE_SICHT_BILD := "res://grafik/oberflaeche/code_sicht/%s.png"
const CODE_WAHL := "res://oberflaeche/code_sicht_wahl.gd"
var _code_wahl: Node = null
var _code_woerter: Array = []
var _code_toenung := {}
var _code_offen := false
## Die Code-Sicht öffnet sich direkt nach der Freischaltung (für die Einführungszeilen 0160/0170)
var _code_frisch := false


func _code_sicht_zeigen(rid: String, am_rand := false) -> void:
	_code_sicht_weg()
	var raum := R.current
	if not is_instance_valid(raum) or not raum.has_node("Props/Background"):
		return
	var bg := raum.get_node("Props/Background") as Node2D
	if ResourceLoader.exists(CODE_SICHT_BILD % rid):
		var bild := Sprite2D.new()
		bild.name = "CodeSicht"
		bild.texture = load(CODE_SICHT_BILD % rid)
		bild.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		bild.modulate.a = 0.92
		bild.centered = false
		bg.add_child(bild)  # über dem Hintergrund, unter Figuren und Props
		# Am Sprite des Hintergrunds ausrichten, nicht am Prop-Knoten: Popochiu setzt den Knoten auf
		# seine Baseline (y 0) und das Sprite darunter auf y 180 (Review 20.11., W3-02, L-S08).
		bild.global_position = _bild_oben_links(bg)
	for c in raum.get_characters():
		_code_toenung[c] = c.modulate
		c.modulate = Color(0.45, 1.0, 0.55, c.modulate.a)
	_code_wahl = (load(CODE_WAHL) as GDScript).new()
	_code_wahl.name = "CodeSichtWahl"
	_code_wahl.am_rand = am_rand
	Spiel.add_child(_code_wahl)
	_code_woerter = []
	var reihen := {}   # oid → [Wörter], in der Reihenfolge der Tausche
	var namen := {}    # oid → Name aus dem Tauschtext („Omas Kekse“)
	for w: Dictionary in _code_woerter_lesen(rid):
		if not reihen.has(w.oid):
			reihen[w.oid] = []
		reihen[w.oid].append(w)
		namen[w.von] = w.name
	var braucht := {}
	for t: Dictionary in TAUSCHE.get(rid, []):
		if t.has("braucht"):
			braucht[t.braucht] = true
	var max_versatz := 0.0
	for oid: String in reihen:
		var ort := _code_ort(raum, oid)
		var praefix := ""
		var aktiv := not braucht.has(oid) or _hat(oid)
		if ort == Vector2.INF:
			if not _hat(oid):
				continue
			# Gegenstand in Max' Tasche: Etikett neben Max
			ort = _code_ort(raum, "max") + Vector2(0, -14.0 - max_versatz)
			max_versatz += 14.0
			praefix = namen.get(oid, reihen[oid][0].name)
		var eintraege := []
		for w: Dictionary in reihen[oid]:
			eintraege.append({"oid": oid, "wort": w.wort, "aktiv": aktiv})
			_code_woerter.append(w)
		_code_wahl.reihe(eintraege, ort, praefix)
	_code_wahl.anordnen(raum.width if "width" in raum else 640.0)


## Obere linke Ecke des Hintergrundbilds in Weltkoordinaten (Sprite2D des Background-Props).
func _bild_oben_links(bg: Node2D) -> Vector2:
	var sp := bg.get_node_or_null("Sprite2D") as Sprite2D
	if sp == null or sp.texture == null:
		return bg.global_position
	return sp.to_global(sp.get_rect().position)


## Oberkante (Mitte) eines Objekts im Raum: Figur, Hotspot oder Prop; INF, wenn nicht da.
func _code_ort(raum: CQRaum, oid: String) -> Vector2:
	for c in raum.get_characters():
		if c.has_method("objekt_id") and c.objekt_id() == oid or str(c.script_name).to_snake_case() == oid:
			var h := 60.0
			if c.has_node("Sprite2D") and c.get_node("Sprite2D").texture:
				var sp := c.get_node("Sprite2D") as Sprite2D
				h = sp.get_rect().size.y * absf(sp.scale.y) * absf(c.scale.y)
			return c.global_position + Vector2(0, -h - 4.0)
	for o in raum.get_hotspots() + raum.get_props():
		if o.has_method("objekt_id") and o.objekt_id() == oid and o.visible:
			var oben := 0.0
			for p in o.interaction_polygon:
				oben = minf(oben, p.y)
			return o.global_position + Vector2(0, oben - 2.0)
	return Vector2.INF


func _code_sicht_weg() -> void:
	if is_instance_valid(_code_wahl):
		_code_wahl.queue_free()
	_code_wahl = null
	if is_instance_valid(R.current) and R.current.has_node("Props/Background/CodeSicht"):
		R.current.get_node("Props/Background/CodeSicht").queue_free()
	for c in _code_toenung:
		if is_instance_valid(c):
			c.modulate = _code_toenung[c]
	_code_toenung.clear()


func _tauschen(rid: String, t: Dictionary) -> void:
	_tausch.budget = int(_tausch.budget) - 1
	Klang.geraeusch("glitch")  # jeder Tausch ist ein Fehler im Bild
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
				_loese("R9c", ["W3_REGEL_3"])
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

#region Rätsel 4: Das Sparschwein des Orakels #####################################################
func sichtbar_orakel_oma_0150() -> Variant:
	return _option_gewaehlt("OrakelOma", "0110") and _option_gewaehlt("OrakelOma", "0130") \
		and not Zustand.geloest("R4")


func sichtbar_orakel_oma_0130() -> Variant:
	return not Zustand.geloest("R4")


func option_orakel_oma_0150() -> bool:
	if Zustand.geloest("R4"):
		return false
	await _geben("rezeptkarte")
	_loese("R4", ["W3_REGEL_2"])
	return false


func ansehen_kochbuch(obj, _x) -> bool:
	if obj is Object:
		await obj.ansehen()
	await Spiel.nahansicht_zeigen("kochbuch")
	Zustand.setze("W3_REGEL_2")
	return true


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
	_loese("R6b", ["W3_REGEL_1"])
	_figuren_anwenden(R.current)
	await _sag("W3_TURM_MAX_0570")
	return true


## Regel 1 steht in der Akte (Nahansicht); beim ersten Lesen auch die Berichte über Max.
func ansehen_inventar_schmidts_akte(_obj, _x) -> bool:
	var neu := not "schmidts_akte" in Zustand.nahansichten
	await Spiel.nahansicht_zeigen("schmidts_akte")
	Zustand.setze("W3_REGEL_1")
	if not neu:
		return false
	await _szene(["W3_TURM_MAX_0470", "W3_TURM_MAX_0480"])
	return true


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
			# Mit der Farbenblind-Hilfe steht das Zeichen der Buchse als Form davor (● ▲ ■)
			var w := await Spiel.auswahl(BUCHSEN.map(func(b):
				return CQEffekte.mit_farbsymbol(b, "UI_W3_BUCHSE_" + b.to_upper())) + ["UI_W2_DOCH_NICHT"])
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
## Läuft die Szene schon (zweiter Klick auf die Tasse währenddessen), nichts ein zweites Mal starten.
var _r13_laeuft := false


func benutzen_kalles_tasse(_obj, _x) -> bool:
	if _r13_laeuft:
		return true
	if Zustand.geloest("R13"):
		return false
	if not Spiel.ist_pixel():
		await _sag("W3_PIEP_MAX_0270")
		return true
	_r13_laeuft = true
	await _szene(["W3_PIEP_PIX_0010", "W3_PIEP_KAL_0020", "W3_PIEP_NAR_0030", "W3_PIEP_KAL_0040",
		"W3_PIEP_NAR_0050", "W3_PIEP_PIE_0060", "W3_PIEP_PIX_0070", "W3_PIEP_KAL_0080",
		"W3_PIEP_PIX_0090", "W3_PIEP_PIE_0100", "W3_PIEP_PIX_0110", "W3_PIEP_OPA_0120",
		"W3_PIEP_OPA_0130", "W3_PIEP_MAX_0140", "W3_PIEP_PIX_0150", "W3_PIEP_MAX_0160",
		"W3_PIEP_PIE_0170", "W3_PIEP_PIX_0180", "W3_PIEP_KAL_0190"])
	await _geben("morse_tabelle")  # in Max' Inventar, auch wenn er in der Kapsel liegt
	await _szene(["W3_PIEP_PIX_0200", "W3_PIEP_KAL_0210"])
	Zustand.loese("R13")
	_r13_laeuft = false
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
		"thunfischdose":
			await _sag("W3_EING_MAX_0530")
			return true
		"olivenoel":
			if Zustand.ist("W3_FREUND_0815"):
				return false
			await _sag("W3_EING_MAX_0240")
			await _szene(["W3_EING_HAU_0250", "W3_EING_HAU_0260", "W3_EING_PIX_0270"])
			Zustand.setze("W3_FREUND_0815")
			return true
		"telefonbuchseite":
			# Mit Öl in der Tasche warnt Pixel einmal, bevor der Roboter für immer losrollt
			if _hat("olivenoel") and not Zustand.ist("W3_FREUND_0815") and _einmal("W3_OEL_WARNUNG"):
				await _sag("W3_EING_PIX_0185")
				return true
			await _szene(["W3_EING_MAX_0190", "W3_EING_HAU_0200", "W3_EING_HAU_0210", "W3_EING_HAU_0220",
				"W3_EING_PIX_0230"])
			await _abgeben("telefonbuchseite")
			_loese("R8", ["W3_FREUND_0815"])
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
	const FALSCH := {"omas_kekse": "W3_SUPP_MAX_0170", "thunfischdose": "W3_SUPP_MAX_0180",
		"schmidts_akte": "W3_SUPP_VIE_0190"}
	if FALSCH.has(iid):
		await _sag(FALSCH[iid])
		return true
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
	if not Zustand.ist("W3_CODE_SICHT"):
		await _sag("W3_KAM1_MAX_0320")
		return true
	return await _code_sicht("bodenschalter")


func benutzen_laser(_obj, _x) -> bool:
	if Zustand.geloest("R9c") or not Zustand.ist("W3_CODE_SICHT"):
		return false
	return await _code_sicht("laser")


## Kritzelei: Max' Ansehen-Zeile, dann die Nahansicht mit Regel 3 (beim ersten Mal vorgelesen).
func ansehen_kritzelei(obj, _x) -> bool:
	if obj is Object:
		await obj.ansehen()
	var neu := not "kritzelei_kammer_2" in Zustand.nahansichten
	await Spiel.nahansicht_zeigen("kritzelei_kammer_2")
	Zustand.setze("W3_REGEL_3")
	if neu:
		await _szene(["W3_KAM2_MAX_0150", "W3_KAM2_PIX_0160"])
	return true


func ansehen_kritzelei_kammer_2(obj, x) -> bool:
	return await ansehen_kritzelei(obj, x)
#endregion

#region Rätsel 10 und 11: Kern #####################################################################
func _regeln() -> int:
	return ["W3_REGEL_1", "W3_REGEL_2", "W3_REGEL_3"].filter(func(r): return Zustand.ist(r)).size()


func benutzen_mutti(_obj, _x) -> bool:
	if _raum_id() != "kern":
		return await _mutti_kammer()
	if Zustand.geloest("R10"):
		await _sag("W3_KERN_MUT_0610")
		return true
	if _regeln() < 3:
		await _sag("W3_KERN_MAX_0340")
		# Regel 1 steht in der Akte, die Max schon trägt; nur Regel 2 liegt außerhalb des Labors
		# (Review 20.11., W3-R12-02: die alte Zeile schickte auch bei ungelesener Akte hinaus)
		var pixel := _regel_fehlt_zeile()
		if not pixel.is_empty():
			await _sag(pixel)
		return true
	await _paradoxon()
	return true


## Pixels Zeile, wenn Max M.U.T.T.I. mit zu wenigen Regeln anspricht: ungelesene Akte (Regel 1)
## vor dem Kochbuch (Regel 2); fehlt nur Regel 3 (Kritzelei im Labor), sagt Pixel nichts.
func _regel_fehlt_zeile() -> String:
	if not Zustand.ist("W3_REGEL_1") and _hat("schmidts_akte"):
		return "W3_KERN_PIX_0355"
	if not Zustand.ist("W3_REGEL_1") or not Zustand.ist("W3_REGEL_2"):
		return "W3_KERN_PIX_0350"
	return ""


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
					await _loesung_b()
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

#region Gesprächsanfänge, Kammer-Gags, Fehlkombinationen ############################################
## Erste Worte (Regie „Reden: …, erstes Mal“) und Bemerkungen zum Stand, bevor das Gespräch
## der Figur beginnt. Spielt nie selbst das Gespräch.
func _vor_gespraech(oid: String) -> void:
	match oid:
		"deckert":
			if Zustand.geloest("R1b"):
				if _einmal("W3_DECKERT_NACH_TEST"):
					await _sag("W3_TEST_DEC_0370")
			elif _einmal("W3_DECKERT_ERSTES_MAL"):
				await _szene(["W3_TEST_DEC_0010", "W3_TEST_DEC_0020", "W3_TEST_PIX_0030"])
			elif not BEOBACHTUNG.values().any(func(b): return Zustand.ist(b)) \
					and _einmal("W3_DECKERT_SCHWEIGEN"):
				await _szene(["W3_TEST_MAX_0380", "W3_TEST_DEC_0390"])
		"herr_vier":
			if Zustand.geloest("R12"):
				if _einmal("W3_VIER_NACH_SUPPE"):
					await _sag("W3_SUPP_VIE_0160")
			elif _einmal("W3_VIER_ERSTES_MAL"):
				await _sag("W3_NUD_VIE_0010")
		"schmidt":
			if _raum_id() == "stadtstrasse" and not Zustand.geloest("R5") and _einmal("W3_SCHMIDT_ERSTES_MAL"):
				await _szene(["W3_TUER_SCH_0010", "W3_TUER_SCH_0020"])
		"hausmeister":
			if _raum_id() != "laboreingang" or Zustand.geloest("R8"):
				return
			if _einmal("W3_HAUSMEISTER_ERSTES_MAL"):
				await _szene(["W3_EING_HAU_0010", "W3_EING_MAX_0020", "W3_EING_HAU_0030"])
			elif _einmal("W3_GEDANKENTRICK"):
				await _szene(["W3_EING_MAX_0160", "W3_EING_HAU_0170", "W3_EING_PIX_0180"])
		"kalle":
			if Zustand.geloest("R13") and _einmal("W3_KALLE_NEUER_KAFFEE"):
				await _sag("W3_PIEP_KAL_0280")


## Schmidt nach dem Tausch: vor der Tür stumm, im Büroturm die Kopie ohne Meinung.
func benutzen_schmidt(_obj, _x) -> bool:
	match _raum_id():
		"stadtstrasse":
			if Zustand.geloest("R5"):
				await _sag("W3_TUER_SCH_0220")
				return true
		"buero_50":
			if Zustand.geloest("R6a"):
				await _sag("W3_TURM_SCH_0560")
				if not Zustand.geloest("R7b") and _einmal("W3_SCHMIDT_TASSE_MIT"):
					await _sag("W3_TERM_SCH_0370")
				return true
	return false


## Die Tür vor dem Büroturm: zu, solange Schmidt redet; danach redet sie.
func benutzen_tuer(_obj, _x) -> bool:
	if _raum_id() != "stadtstrasse":
		return false
	await _sag("W3_TUER_TUR_0240" if Zustand.geloest("R5") else "W3_TUER_MAX_0140")
	return true


func benutzen_rebell(_obj, _x) -> bool:
	await _sag("W3_BAS_REL_0850")
	return true


func benutzen_rebellin(_obj, _x) -> bool:
	await _sag("W3_BAS_REB_0860")
	return true


func benutzen_piepsi(_obj, _x) -> bool:
	if not Zustand.geloest("R13"):
		return false
	await _sag("W3_PIEP_PIE_0240")
	if _einmal("W3_PIEPSI_UEBERSETZT"):
		await _sag("W3_PIEP_PIX_0250")
	return true


## M.U.T.T.I. aus dem Lautsprecher in den Kammern: der Kuchen ist immer woanders.
func _mutti_kammer() -> bool:
	match _raum_id():
		"testkammer_1":
			if Zustand.geloest("R9b"):
				await _szene(["W3_KAM1_MAX_0500", "W3_KAM1_MUT_0510", "W3_KAM1_MAX_0520"])
				return true
		"testkammer_2":
			await _szene(["W3_KAM2_MAX_0260", "W3_KAM2_MUT_0270"])
			return true
		"testkammer_3":
			if not Zustand.geloest("R9d"):
				await _szene(["W3_KAM3_MAX_0300", "W3_KAM3_MUT_0310"])
				return true
	return false


## Kammer 2 verlassen, nachdem der Laser quietscht: M.U.T.T.I. lobt, Max fragt doch.
func ausgang_ausgang_testkammer_3(_obj, _x) -> bool:
	if _raum_id() == "testkammer_2" and Zustand.geloest("R9c") and _einmal("W3_KAM2_VERLASSEN"):
		await _szene(["W3_KAM2_MUT_0250", "W3_KAM2_MAX_0260", "W3_KAM2_MUT_0270"])
		if _hat("gummihuhn"):
			await _sag("W3_KAM2_MAX_0130")
	return false


## Kammer 3 verlassen: M.U.T.T.I. merkt, dass ihr Lautsprecher-Tausch mit dem Raum endet.
func ausgang_ausgang_kern(_obj, _x) -> bool:
	if _raum_id() == "testkammer_3" and Zustand.geloest("R9d") and _einmal("W3_KAM3_VERLASSEN"):
		await _sag("W3_KAM3_MUT_0180")
	return false


func gegenstand_bernd(_obj, iid) -> bool:
	if iid != "thunfischdose":
		return false
	await _sag("W3_KAM1_MAX_0590")
	if Zustand.ist("W3_PIXEL_AUF_LEITUNG"):
		await _sag("W3_KAM1_PIX_0600")
	return true


## Im Kern mit Code-Sicht: beim zweiten Blick auf die Kekse die Ersatzpointe.
func ansehen_inventar_omas_kekse(_obj, _x) -> bool:
	if _raum_id() != "kern" or Zustand.ist("W3_ZELLE_KALT") or not Zustand.geloest("R10"):
		return false
	if _einmal("W3_KEKSE_IM_KERN_1"):
		return false
	if _einmal("W3_KEKSE_IM_KERN_2"):
		await _sag("W3_KERN_MAX_0590")
		return true
	return false


func kombi_kochloeffel_portalgeraet() -> bool:
	await _sag("W3_KAM1_MAX_0610")
	return true


## Telefonbuch in der Zelle: Ansehen, dann die Seite mit den 47 Konners (Nahansicht).
func ansehen_telefonbuch_in_der_zelle(obj, _x) -> bool:
	if obj is Object:
		await obj.ansehen()
	await Spiel.nahansicht_zeigen("telefonbuchseite")
	await _sag("W3_STR_MAX_0070")
	return true


## Die Morse-Tabelle als Nahansicht (N05), danach Max' Ansehen-Zeile (Review 20.11., W3-N-01)
func ansehen_inventar_morse_tabelle(_obj, _x) -> bool:
	await Spiel.nahansicht_zeigen("morse_tabelle")
	return false


func ansehen_inventar_telefonbuchseite(_obj, _x) -> bool:
	await Spiel.nahansicht_zeigen("telefonbuchseite")
	return false
#endregion

#region Hilfe-Pfote ################################################################################
## Ortsbezogene Auswahl (Review 20.11., W3-04): 0 = Schritt im Raum der aktiven Figur, 1 = auf ihrer
## Ebene erreichbar (Max im Büroturm: nur Pixels Schritte), 2 = über den Figurenwechsel oder einen
## Ebenenwechsel, 3 = gerade nicht erreichbar.
func _hinweis_rang(schritt: String, raum: String) -> int:
	var hier := _raum_id()
	if raum == hier:
		return 0
	if str(Zustand.wert("W3_MAX_RAUM", "")) == "buero_50" and getrennt() and not Zustand.geloest("R7b"):
		return 1 if schritt in PIXEL_SCHRITTE else 3   # Max sitzt im Turm fest, nur Pixel kann etwas tun
	if Spiel.ist_pixel():
		return 1 if schritt in PIXEL_SCHRITTE else 2
	return 1 if _ebene_von(raum) == _ebene_von(hier) else 2


func _ebene_von(raum: String) -> String:
	if raum in SIMULATION:
		return "simulation"
	if raum in LABOR:
		return "labor"
	return "realitaet"


## Vor den Stufen von R10: fehlt eine Regel, sagt die Pfote dasselbe wie Pixel am Lautsprecher (W3-R12-02).
func _hinweis_vorher(schritt: String) -> Variant:
	if schritt != "R10" or _regeln() >= 3:
		return null
	var z := _regel_fehlt_zeile()
	return z if not z.is_empty() else null


## [gelöst, Raum noch nie betreten, Zeile]; „start“ gilt immer
const WEGWEISER := [["R1b", "apothekengasse", "W3_HINT_PIX_0020"], ["R5", "buero_50", "W3_HINT_PIX_0030"],
	["R3b", "kueche_orakel", "W3_HINT_PIX_0040"], ["start", "laboreingang", "W3_HINT_PIX_0050"],
	["R9a", "testkammer_1", "W3_HINT_PIX_0060"]]


## Nichts offen, weil der nächste Pflichtschritt in einem noch nie betretenen Raum liegt: ein Satz, der
## den Ort nennt (W3-05). Sonst null (dann die eigene „nichts offen“-Zeile).
func _hinweis_wegweiser() -> Variant:
	for w in WEGWEISER:
		if (w[0] == "start" or Zustand.geloest(w[0])) and not Zustand.war_in(w[1]):
			return w[2]
	return null
#endregion

#region Abschluss ##################################################################################
## Pixels Lob nur ohne einen einzigen Hinweis der Stufe 3 in dieser Welt
func _hinweis_stufe_3() -> bool:
	for r in Zustand.alle_raetsel("welt-3"):
		if Hinweise.stufe(str(r.get("id", "")), "welt-3") >= 3:
			return true
	return false


func _abschluss() -> void:
	await _aufwachen()
	# „Ich habe das Fenster“ nur bei Lösung B; über Omas Kekse (Lösung A) die zweite Fassung
	var pixel := "W3_ENDE_PIX_0020" if Zustand.ist("W3_ZELLE_SCHNEE") else "W3_ENDE_PIX_0022"
	var zeilen := ["W3_ENDE_NAR_0010", pixel, "W3_ENDE_KAL_0030", "W3_ENDE_REB_0050"]
	if Zustand.ist("W3_FREUND_0815"):
		zeilen.append_array(["W3_ENDE_HAU_0060", "W3_ENDE_HAU_0070"])
	if not _hinweis_stufe_3():
		zeilen.append("W3_ENDE_PIX_0080")
	await _szene(zeilen)
	Spiel.herkunft_raum = ""
	await Spiel.raum_wechseln_und_warten(Bauplan.raum_script_name("unterstadt_strasse"))
	await _szene(["W3_ENDE_NAR_0090", "W3_ENDE_MAX_0100", "W3_ENDE_PIX_0110", "W3_ENDE_MAX_0120",
		"W3_ENDE_PIX_0130", "W3_ENDE_DEC_0140"])
	_max_gang(false)
	await Spiel.zwischenspiel_beginnen(3)
#endregion
