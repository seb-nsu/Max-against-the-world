extends RefCounted
## Regeln von Welt 4, Kanal 999 (raetsel/welt-4.md, skript/welt-4.md).
##
## Aufbau wie skripte/welt_3.gd: Die Basisklassen melden Ereignisse an ereignis(art, obj, item),
## die Behandler heißen nach Art und Objekt-ID (benutzen_lichterkette(), gegenstand_hyaene(),
## option_gerd_glueck_0010() …) und liefern true, wenn sie das Ereignis erledigt haben.
##
## Sender: Die Kanäle verbindet kein Ausgang, nur die Taste Umschalten (Auswahl der Sender) und
## die Programmzeitschrift (Sendungen zu festen Zeiten: Mitternachts-TV, Werbespot, Kanal 999).
## Tasten der Fernbedienung sind eigene Gegenstände; allein benutzt wirken sie auf den Sender,
## auf eine Figur oder ein Objekt gezogen auf dieses (_taste()).
##
## Genre-Logik: Gegenstände, die Max in einen Sender trägt, nehmen dessen Genre an (Werte
## W4_KAESE, W4_BANANE): Grusel macht den Käse leuchtend und die Banane faulig, der Comic-Kanal
## macht aus leuchtendem Käse Wunderkäse und aus fauliger Banane eine Stinkbombe.
##
## Pixel krabbelt durchs Rauschen zwischen den Sendern (Rand des Testbilds) und späht von dort in
## die Kanäle. Solange er dort ist, sind Max und Pixel getrennt (W4_PIXEL_IM_RAUSCHEN).

#region Konstanten ################################################################################
## Sender in der Reihenfolge der Umschalt-Auswahl
const KANAELE := ["gluecksrad", "sitcom_kueche", "savanne", "friedhof", "kapitolis", "werbespot_set", "empfang"]
## Rätsel, ab dem ein Sender per Umschalten erreichbar ist
const KANAL_FREI := {"gluecksrad": "R2", "sitcom_kueche": "R2", "savanne": "R2", "kapitolis": "R2",
	"friedhof": "R5a", "werbespot_set": "R11a", "empfang": "R12a"}
## Genre je Raum (Spukhaus gehört zum Mitternachts-TV, die Fabrik zum Comic-Kanal)
const GENRE := {"friedhof": "grusel", "spukhaus_keller": "grusel", "spukhaus_halle": "grusel",
	"kapitolis": "comic", "fondue_fabrik": "comic"}
const SENDERZENTRALE := ["empfang", "kellerarchiv", "zappmanns_studio"]
const TASTEN := ["taste_pause", "taste_rueckspulen", "taste_stumm", "taste_untertitel",
	"taste_sendersuchlauf", "splitscreen_adapter"]

## Programmzeitschrift: Eintrag → [Text, Zeile]; Klick auf Mitternacht, Werbespot und Kanal 999
## führt hin (_zeitschrift())
const ZEITSCHRIFT := [
	["2015", "UI_W4_ZS_2015", "W4_FERN_MAX_0170"],
	["mitternacht", "UI_W4_ZS_MITTERNACHT", "W4_FERN_MAX_0180"],
	["werbespot", "UI_W4_ZS_WERBESPOT", "W4_FERN_MAX_0190"],
	["tiertort", "UI_W4_ZS_TIERTORT", "W4_FERN_MAX_0200"],
	["gluecksrad", "UI_W4_ZS_GLUECKSRAD", "W4_FERN_MAX_0210"],
	["kanal_999", "UI_W4_ZS_LEER", "W4_FERN_MAX_0220"],
]

## Quiz (R2) und Bonusrunde (R9): Frage, richtige Antwort (0–2), Zeilen bei richtig, bei falsch
const QUIZ := [
	["W4_GLUE_GER_0060", 0, ["W4_GLUE_MAX_0070", "W4_GLUE_GER_0080"], ["W4_GLUE_GER_0090", "W4_GLUE_GER_0090"]],
	["W4_GLUE_GER_0110", 1, ["W4_GLUE_MAX_0120", "W4_GLUE_PIX_0130"], ["W4_GLUE_GER_0140", "W4_GLUE_GER_0140"]],
	["W4_GLUE_GER_0150", 2, ["W4_GLUE_MAX_0160"], ["W4_GLUE_GER_0170", "W4_GLUE_GER_0170"]],
]
const BONUS := [
	["W4_BONU_GER_0040", 1, ["W4_BONU_MAX_0050"], ["W4_BONU_GER_0060", "W4_BONU_GER_0070"]],
	["W4_BONU_GER_0080", 0, ["W4_BONU_MAX_0090"], ["W4_BONU_GER_0100", "W4_BONU_GER_0100"]],
	["W4_BONU_GER_0110", 2, ["W4_BONU_MAX_0120"], ["W4_BONU_GER_0130", "W4_BONU_GER_0140"]],
]
const ANTWORTEN := ["UI_W4_ANTWORT_A", "UI_W4_ANTWORT_B", "UI_W4_ANTWORT_C"]

## Opas Nachrichten an der Lichterkette (R7): Auswahlzeile, Folgezeilen
const NACHRICHTEN := [
	["W4_HALL_MAX_0050", ["W4_HALL_OPA_0060", "W4_HALL_MAX_0070", "W4_HALL_PIX_0080"]],
	["W4_HALL_MAX_0090", ["W4_HALL_OPA_0100", "W4_HALL_MAX_0110"]],
	["W4_HALL_MAX_0120", ["W4_HALL_OPA_0130", "W4_HALL_MAX_0140", "W4_HALL_PIX_0150"]],
	["W4_HALL_MAX_0160", ["W4_HALL_OPA_0170", "W4_HALL_MAX_0180"]],
	["W4_HALL_MAX_0190", ["W4_HALL_OPA_0200", "W4_HALL_MAX_0210"]],
	["W4_HALL_MAX_0220", ["W4_HALL_OPA_0230", "W4_HALL_MAX_0240", "W4_HALL_PIX_0250"]],
]

## Comic-Panels (R11d) in der richtigen Reihenfolge
const PANELS := ["panel_schurke_lacht", "panel_held_springt", "panel_explosion", "panel_schurke_im_kaese"]

## Einzelbilder der Fabrik (R10c): falsche Bilder enden in Gags
const EINZELBILD_FALSCH := {0: ["W4_FABR_NAR_0190", "W4_FABR_MAX_0200"], 1: ["W4_FABR_NAR_0210", "W4_FABR_MAX_0220"],
	3: ["W4_FABR_NAR_0230", "W4_FABR_MAX_0240"]}

## Gags der Tasten je Raum (allein benutzt) und je Figur (auf die Figur gezogen)
const TASTE_RAUM := {
	"taste_pause": {"sitcom_kueche": "W4_TAST_MAX_0010", "savanne": "W4_TAST_MAX_0060",
		"spukhaus_halle": "W4_HALL_MAX_0510", "friedhof": "W4_FRIE_MAX_0360", "fondue_fabrik": "W4_FABR_MAX_0390",
		"kapitolis": "W4_KAPI_MAX_0650", "gluecksrad": "W4_BONU_MAX_0280", "kellerarchiv": "W4_ARCH_MAX_0110",
		"testbild": "W4_TAST_MAX_0220", "spukhaus_keller": "W4_KELL_MAX_0410"},
	"taste_rueckspulen": {"sitcom_kueche": "W4_TAST_MAX_0020", "savanne": "W4_TAST_MAX_0070",
		"kapitolis": "W4_TAST_MAX_0160", "spukhaus_keller": "W4_KELL_MAX_0420", "gluecksrad": "W4_BONU_MAX_0290",
		"kellerarchiv": "W4_ARCH_MAX_0120"},
	"taste_stumm": {"sitcom_kueche": "W4_TAST_MAX_0030", "savanne": "W4_TAST_MAX_0080",
		"kapitolis": "W4_TAST_MAX_0170", "friedhof": "W4_FRIE_MAX_0370", "fondue_fabrik": "W4_FABR_MAX_0400"},
	"taste_sendersuchlauf": {"gluecksrad": "W4_BONU_MAX_0320"},
}
const TASTE_FIGUR := {
	"taste_untertitel": {"sitcom_vater": "W4_TAST_MAX_0040", "sitcom_sohn": "W4_TAST_MAX_0050",
		"hyaene": "W4_TAST_MAX_0090", "erzaehler": "W4_TAST_MAX_0100", "kommissar": "W4_TAST_MAX_0110",
		"zombie": "W4_TAST_MAX_0120", "flimmer": "W4_TAST_MAX_0130", "wonder_wilma": "W4_TAST_MAX_0180",
		"fledermann": "W4_TAST_MAX_0190", "gerd_glueck": "W4_BONU_MAX_0310", "super_siegfried": "W4_KAPI_MAX_0660",
		"fbi_agent": "W4_HALL_MAX_0520", "dr_werbepause": "W4_WERB_MAX_0150", "sicherheitsmann": "W4_EMPF_MAX_0230"},
	"taste_stumm": {"gerd_glueck": "W4_BONU_MAX_0300", "fbi_agent": "W4_HALL_MAX_0530"},
}

## Reden mit Figuren ohne Gespräch (als Max)
const REDEN := {
	"loewe": ["W4_SAV_LOE_0130", "W4_SAV_MAX_0140"],
	"nashorn": ["W4_SAV_MAX_0390", "W4_SAV_NAS_0400", "W4_SAV_MAX_0410"],
	"geier": ["W4_VERH_GEI_0290", "W4_VERH_MAX_0300"],
	"geist": ["W4_KELL_GST_0180", "W4_KELL_MAX_0190"],
	"sicherheitsmann": ["W4_EMPF_SIC_0220"],
	"wettkandidat": ["W4_STUD_WET_0650"],
	"troedel_experte": ["W4_GLUE_EXP_0500", "W4_GLUE_EXP_0520"],
	"flimmer": ["W4_RAU_FLI_0230", "W4_RAU_PIX_0240", "W4_RAU_FLI_0250"],
}

## Pixel auf Mensch (PIXM)
const PIXEL_AUF := {"gerd_glueck": "W4_PIXM_PIX_0010", "sitcom_vater": "W4_PIXM_PIX_0020",
	"sitcom_mutter": "W4_PIXM_PIX_0030", "sitcom_sohn": "W4_PIXM_PIX_0040", "kommissar": "W4_PIXM_PIX_0050",
	"loewe": "W4_PIXM_PIX_0060", "hyaene": "W4_PIXM_PIX_0070", "gepard": "W4_PIXM_PIX_0080",
	"geier": "W4_PIXM_PIX_0090", "nashorn": "W4_PIXM_PIX_0100", "flamingos": "W4_PIXM_PIX_0110",
	"zombie": "W4_PIXM_PIX_0120", "geist": "W4_PIXM_PIX_0130", "fbi_agent": "W4_PIXM_PIX_0140",
	"super_siegfried": "W4_PIXM_PIX_0150", "fledermann": "W4_PIXM_PIX_0160", "wonder_wilma": "W4_PIXM_PIX_0170",
	"dr_werbepause": "W4_PIXM_PIX_0180", "empfangsdame": "W4_PIXM_PIX_0190", "sicherheitsmann": "W4_PIXM_PIX_0200",
	"zappmann": "W4_PIXM_PIX_0210", "flimmer": "W4_PIXM_PIX_0220"}

## Szenen beim ersten Betreten
const ERSTES_BETRETEN := {
	"sitcom_kueche": ["W4_SIT_SMU_0010", "W4_SIT_VAT_0020", "W4_SIT_MAX_0030", "W4_SIT_SOH_0040",
		"W4_SIT_SMU_0050", "W4_SIT_MAX_0060", "W4_SIT_VAT_0070", "W4_SIT_MAX_0080", "W4_SIT_PIX_0090"],
	"savanne": ["W4_SAV_ERZ_0010", "W4_SAV_MAX_0020", "W4_SAV_ERZ_0030", "W4_SAV_MAX_0040", "W4_SAV_KOM_0050",
		"W4_SAV_LOE_0060", "W4_SAV_KOM_0070", "W4_SAV_MAX_0080", "W4_SAV_KOM_0090", "W4_SAV_PIX_0100"],
	"spukhaus_keller": ["W4_KELL_MAX_0010", "W4_KELL_GST_0020", "W4_KELL_MAX_0030"],
	"spukhaus_halle": ["W4_HALL_MAX_0010", "W4_HALL_PIX_0020"],
	"kapitolis": ["W4_KAPI_MAX_0010", "W4_KAPI_PIX_0020", "W4_KAPI_PIX_0030", "W4_KAPI_PIX_0040",
		"W4_KAPI_NAR_0050", "W4_KAPI_MAX_0060", "W4_KAPI_PIX_0070", "W4_KAPI_MAX_0080", "W4_KAPI_SIE_0090",
		"W4_KAPI_FLE_0100", "W4_KAPI_WIL_0110", "W4_KAPI_MAX_0120", "W4_KAPI_WIL_0130"],
	"fondue_fabrik": ["W4_FABR_MAX_0010", "W4_FABR_NAR_0020", "W4_FABR_MAX_0030"],
	"empfang": ["W4_EMPF_MAX_0020", "W4_EMPF_PIX_0030", "W4_EMPF_EMP_0040", "W4_EMPF_MAX_0050", "W4_EMPF_EMP_0060"],
	"kellerarchiv": ["W4_ARCH_MAX_0010"],
	"zappmanns_studio": ["W4_STUD_ZAP_0010", "W4_STUD_MAX_0020", "W4_STUD_ZAP_0030"],
}

## Spähen aus dem Rauschen: Sender → Pixels Zeile
const SPAEHEN := {"gluecksrad": "W4_RAU_PIX_0070", "sitcom_kueche": "W4_RAU_PIX_0080",
	"savanne": "W4_RAU_PIX_0090", "friedhof": "W4_RAU_PIX_0100", "kapitolis": "W4_RAU_PIX_0120",
	"empfang": "W4_RAU_PIX_0130"}

## Zahl der Fehlversuche beim Zombie-Tanz (nur im Raum)
var _tanz_fehler := 0
#endregion

#region Verteiler ##################################################################################
func ereignis(art: String, obj: Variant, item: Variant) -> bool:
	var oid := _id(obj)
	var iid = _id(item) if item is Object else item
	if art == "kombinieren":
		for m in ["kombi_%s_%s" % [oid, iid], "kombi_%s_%s" % [iid, oid]]:
			if has_method(m):
				return bool(await call(m))
		return false
	if art in ["nach_option", "nach_einstieg"]:
		if oid == "kommissar":
			Zustand.setze("W4_KOMMISSAR_FOLGT")  # wer beim Umschalten mit Max redet, kommt mit (R3)
		var m: String = ("option_%s_%s" % [oid, iid]) if art == "nach_option" else "einstieg_" + oid
		return bool(await call(m)) if has_method(m) else false
	if art == "raum_betreten":
		await _raum_betreten(obj)
		return false
	# Tasten: allein benutzt auf den Sender, gezogen auf ein Objekt oder eine Figur
	if art == "benutzen_inventar" and oid in TASTEN:
		return await _taste(oid, "")
	if art == "gegenstand" and str(iid) in TASTEN:
		return await _taste(str(iid), oid)
	var name := "%s_%s" % [art, oid]
	if has_method(name):
		return bool(await call(name, obj, iid))
	if art == "benutzen" and obj is PopochiuCharacter and REDEN.has(oid) and not Spiel.ist_pixel():
		await _szene(REDEN[oid])
		return true
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
			var m: String = "sichtbar_%s_%s" % [_id(obj), item]
			return call(m) if has_method(m) else null
		"zustand_anwenden":
			_figuren_anwenden(obj)
			return true
		"partner_getrennt":
			return Zustand.ist("W4_PIXEL_IM_RAUSCHEN")
		"wechsel_moeglich":
			return false if Zustand.ist("W4_PIXEL_IM_RAUSCHEN") else null
		"zeile_gehoert":
			return _zeile_gehoert(str(item))
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
		if z is Callable:
			schritte.append(z)
		else:
			schritte.append(Spiel.z(z.split("_")[2], z))
	await Spiel.szene(schritte)


func _hat(id: String) -> bool:
	return is_instance_valid(C.Max) and I.is_item_in_inventory(Bauplan.gegenstand_script_name(id), C.Max)


func _geben(id: String) -> void:
	await Spiel.geben(Bauplan.gegenstand_script_name(id))


func _abgeben(id: String) -> void:
	if _hat(id):
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


## Raum zum ersten Mal mit Szene betreten (Wert W4_BETRETEN: Liste der Räume)
func _erstmals(rid: String) -> bool:
	var l := _liste("W4_BETRETEN")
	if rid in l:
		return false
	l.append(rid)
	Zustand.setze_wert("W4_BETRETEN", l)
	return true


## Zähler je Schlüssel (gespeichert), liefert den neuen Stand
func _zaehle(name: String) -> int:
	var n := int(Zustand.wert(name, 0)) + 1
	Zustand.setze_wert(name, n)
	return n


func _g(id: String) -> bool:
	return Zustand.geloest(id)


func _zustand_gegenstand(id: String) -> Variant:
	match id:
		"fondue_kaese":
			return str(Zustand.wert("W4_KAESE", "normal"))
		"bananenschale":
			return str(Zustand.wert("W4_BANANE", "frisch"))
		"bettlaken":
			return "Superhelden-Anzug" if _g("R10b") else "Bettlaken"
		"billig_fernbedienung":
			return "sechs Tasten" if TASTEN.any(func(t): return _hat(t)) else "eine Taste"
	return null


func _bedingung_text(text: String) -> Variant:
	match text:
		"während R4 offen":
			return not _g("R4")
		"Voraussetzungen erfüllt":
			return not _g("R9")  # die Option prüft selbst, ob Gerd die Bonusrunde startet
		"ohne Beweis, nach dem ersten Gespräch":
			return not _g("R8")
		"vor der Begegnung":
			return not _g("R13")
		"Pixel", "als Pixel, Kaskade":
			return Spiel.ist_pixel()
		"nach Rückspulen":
			return Zustand.ist("W4_ZOMBIES_START")
		"Stinkbombe":
			return _zustand_gegenstand("bananenschale") == "Stinkbombe"
	return null


## Szenenzeilen, nach denen Gesprächsoptionen erscheinen (Fledermann 0340 nach Wilmas Hinweis)
func _zeile_gehoert(zeile: String) -> bool:
	match zeile:
		"W4_KAPI_WIL_0130":
			return Zustand.war_in("kapitolis")
	return false


func _figuren_anwenden(raum: CQRaum) -> void:
	var rid := raum.raum_id()
	var im_sitcom := Zustand.ist("W4_KOMMISSAR_IN_SITCOM")
	var plan := {
		"Kommissar": (rid == "savanne" and not im_sitcom) or (rid == "sitcom_kueche" and im_sitcom),
		"SitcomVater": (rid == "sitcom_kueche" and not _g("R6")) or (rid == "spukhaus_keller" and _g("R6")),
		"Hyaene": rid == "savanne" and not _g("R4"),
		"SuperSiegfried": (rid == "kapitolis" and not _g("R10")) or rid == "fondue_fabrik" or (rid == "werbespot_set" and _g("R10")),
		"Fledermann": (rid == "kapitolis" and not _g("R10")) or rid == "fondue_fabrik" or (rid == "werbespot_set" and _g("R10")),
		"WonderWilma": (rid == "kapitolis" and not _g("R10")) or rid == "fondue_fabrik" or (rid == "werbespot_set" and _g("R10")),
		"DrWerbepause": rid == "werbespot_set" and not _g("R11c"),
		"Flimmer": (rid == "testbild" and not _g("R1")) or rid == "rauschen",
		"Opa": false,                 # nur Stimme aus dem Wohnzimmer (Lichterkette)
		"Nachrichtensprecher": false, # körperlos, aus dem Schnee
		"JungerZappmann": false,      # nur auf dem Archivband
	}
	for sn in plan:
		if not Bauplan.figur(sn).get("raeume", []).has(rid) and not raum.has_character(sn):
			continue
		var pos := Vector2.INF
		if plan[sn] and not raum.has_character(sn) and raum.has_marker(sn):
			pos = raum.get_marker_position(sn)
		Spiel.figur_hier(sn, plan[sn], pos)
	# Props, die erst ein Rätsel freigibt (gesammelte blendet CQRaum schon aus)
	var props := {"TasteStumm": _g("R6"), "TasteSendersuchlauf": _g("R11c"), "Drehbuch": not _g("R4c")}
	if rid == "kapitolis":
		props["Bettlaken"] = Zustand.ist("W4_LAKEN_GEWORFEN")
	for p in raum.get_props():
		if props.has(p.script_name):
			p.visible = p.visible and props[p.script_name]
#endregion

#region Ankunft und Räume ##########################################################################
func _raum_betreten(raum: CQRaum) -> void:
	var rid := raum.raum_id()
	_tanz_fehler = 0
	if rid != "rauschen" and not Zustand.ist("W4_PIXEL_IM_RAUSCHEN"):
		Zustand.setze_wert("W4_MAX_RAUM", rid)
	# Genre-Logik: Max' Gegenstände nehmen das Genre des Senders an
	match GENRE.get(rid, ""):
		"grusel":
			if _hat("fondue_kaese") and _zustand_gegenstand("fondue_kaese") == "normal":
				Zustand.setze_wert("W4_KAESE", "leuchtend")
			if _hat("bananenschale") and _zustand_gegenstand("bananenschale") == "frisch":
				Zustand.setze_wert("W4_BANANE", "faulig")
		"comic":
			if _hat("fondue_kaese") and _zustand_gegenstand("fondue_kaese") == "leuchtend":
				Zustand.setze_wert("W4_KAESE", "Wunderkäse")
				Zustand.loese("R10a")
			if _hat("bananenschale") and _zustand_gegenstand("bananenschale") == "faulig":
				Zustand.setze_wert("W4_BANANE", "Stinkbombe")


## Szene beim ersten Betreten (einmal je Raum)
func _erstes_betreten(rid: String) -> bool:
	if not ERSTES_BETRETEN.has(rid) or not _erstmals(rid):
		return false
	await _szene(ERSTES_BETRETEN[rid])
	return true


func nach_uebergang_testbild(_raum, _x) -> bool:
	if _einmal("W4_ANKUNFT"):
		Zustand.setze("W4_WECHSEL_FREI")
		await _szene(["W4_TEST_MAX_0010", "W4_TEST_PIX_0020", "W4_TEST_MAX_0030", "W4_TEST_PIX_0040",
			"W4_TEST_MAX_0050", "W4_TEST_FLI_0060", "W4_TEST_MAX_0070", "W4_TEST_FLI_0080", "W4_TEST_PIX_0090",
			"W4_TEST_FLI_0100", "W4_TEST_MAX_0110", "W4_TEST_FLI_0120", "W4_TEST_MAX_0130", "W4_TEST_PIX_0140"])
		return true
	return false


func nach_uebergang_gluecksrad(_raum, _x) -> bool:
	if _g("R1") and not _g("R2"):
		await _quiz_r2()
		return true
	return false


func nach_uebergang_sitcom_kueche(_raum, _x) -> bool:
	var erst := await _erstes_betreten("sitcom_kueche")
	if Zustand.ist("W4_KOMMISSAR_KOMMT"):
		Zustand.setze("W4_KOMMISSAR_KOMMT", false)
		await _besuch_r3()
		return true
	return erst


func nach_uebergang_savanne(_raum, _x) -> bool:
	return await _erstes_betreten("savanne")


func nach_uebergang_friedhof(_raum, _x) -> bool:
	if _erstmals("friedhof"):
		await _szene(["W4_FRIE_NAR_0040", "W4_FRIE_MAX_0050", "W4_FRIE_PIX_0060"])
		return true
	return false


func nach_uebergang_spukhaus_keller(_raum, _x) -> bool:
	return await _erstes_betreten("spukhaus_keller")


func nach_uebergang_spukhaus_halle(_raum, _x) -> bool:
	return await _erstes_betreten("spukhaus_halle")


func nach_uebergang_kapitolis(_raum, _x) -> bool:
	return await _erstes_betreten("kapitolis")


func nach_uebergang_fondue_fabrik(_raum, _x) -> bool:
	return await _erstes_betreten("fondue_fabrik")


func nach_uebergang_werbespot_set(_raum, _x) -> bool:
	if _erstmals("werbespot_set"):
		var zeilen := ["W4_WERB_WER_0010", "W4_WERB_MAX_0020", "W4_WERB_WER_0030", "W4_WERB_MAX_0040",
			"W4_WERB_PIX_0050", "W4_WERB_WER_0060", "W4_WERB_MAX_0070", "W4_WERB_WER_0080", "W4_WERB_MAX_0090"]
		if not _hat("taste_stumm"):
			zeilen.append("W4_WERB_PIX_0510")
		await _szene(zeilen)
		return true
	return false


func nach_uebergang_empfang(_raum, _x) -> bool:
	return await _erstes_betreten("empfang")


func nach_uebergang_kellerarchiv(_raum, _x) -> bool:
	return await _erstes_betreten("kellerarchiv")


func nach_uebergang_zappmanns_studio(_raum, _x) -> bool:
	return await _erstes_betreten("zappmanns_studio")


func nach_uebergang_rauschen(_raum, _x) -> bool:
	var n := _zaehle("W4_RAUSCHEN_BESUCHE")
	if n == 1:
		await _szene(["W4_RAU_PIX_0010", "W4_RAU_FLI_0020", "W4_RAU_FLI_0040"])
	elif n == 3:
		await _szene(["W4_RAU_NSP_0150", "W4_RAU_PIX_0160"])
	elif n == 5:
		await _sag("W4_RAU_NSP_0170")
	elif not _g("R4"):
		await _sag("W4_RAU_NSP_0180")
	return true
#endregion

#region Sender: Umschalten, Programmzeitschrift, Rauschen ##########################################
func benutzen_inventar_taste_umschalten(_obj, _x) -> bool:
	await _umschalten()
	return true


func benutzen_inventar_billig_fernbedienung(_obj, _x) -> bool:
	await _umschalten()
	return true


func kombi_billig_fernbedienung_programmzeitschrift() -> bool:
	await _sag("W4_FERN_MAX_0250")
	return true


func _umschalten() -> void:
	var rid := _raum_id()
	if rid == "zappmanns_studio" and not _g("R13"):
		await _sag("W4_FERN_MAX_0270")
		return
	if _einmal("W4_UMGESCHALTET"):
		await _szene(["W4_FERN_MAX_0050", "W4_RAU_FLI_0050", "W4_RAU_MAX_0060"])
	var ziele := []
	for k in KANAELE:
		if k != rid and (_g(KANAL_FREI[k]) or k == "friedhof"):
			ziele.append(k)
	var texte: Array = ziele.map(func(k): return "UI_RAUM_" + k.to_upper())
	texte.append("UI_MENUE_ZURUECK")
	var wahl := await Spiel.auswahl(texte)
	if wahl < 0 or wahl >= ziele.size():
		return
	var ziel: String = ziele[wahl]
	if ziel == "friedhof" and not _g("R5a"):
		# Mitternachts-TV läuft nur um Mitternacht
		await _szene(["W4_FRIE_MAX_0010", "W4_FRIE_PIX_0020"])
		if _hat("taste_rueckspulen"):
			await _sag("W4_FRIE_MAX_0030")
		return
	await _sender_wechseln(ziel, rid)


## Sprung in einen Sender. Kommissar und Bonusrunde hängen am Umschalten.
func _sender_wechseln(ziel: String, von := "") -> void:
	if von == "sitcom_kueche" and Zustand.ist("W4_KOMMISSAR_IN_SITCOM"):
		await _sag("W4_SIT_MAX_0660")
		Zustand.setze("W4_KOMMISSAR_IN_SITCOM", false)
	if von == "savanne" and ziel == "sitcom_kueche" and Zustand.ist("W4_KOMMISSAR_FOLGT") \
			and not _g("R3") and _hat("billig_fernbedienung"):
		Zustand.setze("W4_KOMMISSAR_KOMMT")
	Zustand.setze("W4_KOMMISSAR_FOLGT", false)
	Klang.geraeusch("umschalten")
	await _sag("W4_FERN_NAR_0060")
	I.active = null
	Spiel.herkunft_raum = ""
	await R.goto_room(Bauplan.raum_script_name(ziel))


func benutzen_inventar_programmzeitschrift(_obj, _x) -> bool:
	if _einmal("W4_ZEITSCHRIFT_BENUTZT"):
		await _sag("W4_FERN_MAX_0240")
	var texte: Array = ZEITSCHRIFT.map(func(e): return e[1])
	if _g("R12a"):
		texte[5] = "UI_W4_ZS_KANAL_999"
	texte.append("UI_MENUE_ZURUECK")
	var wahl := await Spiel.auswahl(texte)
	if wahl < 0 or wahl >= ZEITSCHRIFT.size():
		return true
	var e: Array = ZEITSCHRIFT[wahl]
	await _zeitschrift_gefunden(e[0])
	match e[0]:
		"2015":
			await _sag(e[2])
			Zustand.setze("W4_FOLGE_2015_GELESEN")
		"mitternacht":
			await _sag(e[2])
			if _g("R2"):
				Zustand.loese("R5a")
				await _sender_wechseln("friedhof", _raum_id())
		"werbespot":
			await _sag(e[2])
			if _g("R2"):
				Zustand.loese("R11a")
				await _sender_wechseln("werbespot_set", _raum_id())
		"kanal_999":
			if _g("R12a"):
				await _sag("W4_FERN_MAX_0230")
				if not _raum_id() in SENDERZENTRALE:
					await _sender_wechseln("empfang", _raum_id())
			else:
				await _sag(e[2])
		_:
			await _sag(e[2])
	return true


## Errungenschaft Zapp-Meister: jeder Eintrag der Programmzeitschrift einmal angeklickt, der
## leere Kanal erst, wenn er Kanal 999 heißt.
func _zeitschrift_gefunden(eintrag: String) -> void:
	if eintrag == "kanal_999" and not _g("R12a"):
		return
	var gefunden := _liste("W4_ZEITSCHRIFT_GEFUNDEN")
	if not eintrag in gefunden:
		gefunden.append(eintrag)
		Zustand.setze_wert("W4_ZEITSCHRIFT_GEFUNDEN", gefunden)
	if gefunden.size() >= ZEITSCHRIFT.size():
		Zustand.setze("W4_ALLE_KANAELE")


func ansehen_inventar_programmzeitschrift(_obj, _x) -> bool:
	if Zustand.ist("W4_ZEITSCHRIFT_ANGESEHEN"):
		await _sag("W4_FERN_PIX_0160")
		return true
	Zustand.setze("W4_ZEITSCHRIFT_ANGESEHEN")
	await Spiel.nahansicht_zeigen("programmzeitschrift")
	return true


## Pixel krabbelt am Rand des Testbilds ins Rauschen (ab R1).
func pixel_rauschen_am_rand(_obj, _x) -> bool:
	if not Spiel.ist_pixel() or not _g("R1"):
		return false
	Zustand.setze("W4_PIXEL_IM_RAUSCHEN")
	Spiel.herkunft_raum = ""
	await R.goto_room(Bauplan.raum_script_name("rauschen"))
	return true


## Kriechweg: in einen Sender spähen oder zurück zu Max.
func benutzen_kriechweg(obj, x) -> bool:
	return await pixel_kriechweg(obj, x)


func pixel_kriechweg(_obj, _x) -> bool:
	var ziele := SPAEHEN.keys().filter(func(k): return _g(KANAL_FREI[k]) or k == "friedhof")
	var texte: Array = ziele.map(func(k): return "UI_RAUM_" + k.to_upper())
	texte.append("UI_MENUE_ZURUECK")
	var wahl := await Spiel.auswahl(texte)
	if wahl >= 0 and wahl < ziele.size():
		var k: String = ziele[wahl]
		await _sag("W4_RAU_PIX_0110" if k == "friedhof" and _g("R5") else SPAEHEN[k])
		return true
	Zustand.setze("W4_PIXEL_IM_RAUSCHEN", false)
	C.player = C.Pixel
	Spiel.herkunft_raum = ""
	await R.goto_room(Bauplan.raum_script_name(str(Zustand.wert("W4_MAX_RAUM", "testbild"))))
	return true
#endregion

#region Tasten #####################################################################################
## Taste allein (oid leer) oder auf ein Objekt/eine Figur. Erst die Rätsel, dann die Gags.
func _taste(t: String, oid: String) -> bool:
	var rid := _raum_id()
	if rid == "zappmanns_studio" and int(Zustand.wert("W4_KAMPF", 0)) > 0 and not _g("R13"):
		await _kampf(t)
		return true
	match t:
		"taste_rueckspulen":
			if rid == "friedhof" and not _g("R5"):
				await _zombies_zurueck()
				return true
			if rid == "fondue_fabrik" and not _g("R10c"):
				await _einzelbilder()
				return true
			if rid == "werbespot_set" and not _g("R11b"):
				await _sag("W4_WERB_MAX_0140")
				return true
		"taste_pause":
			if rid == "werbespot_set" and not _g("R11b"):
				await _sag("W4_WERB_MAX_0130")
				return true
			if rid == "empfang" and oid in ["", "sicherheitsmann"] and Zustand.ist("W4_CODE_EINGEGEBEN") and not _g("R12b"):
				await _szene(["W4_EMPF_NAR_0200", "W4_EMPF_MAX_0210"])
				Zustand.loese("R12b")
				Zustand.loese("R12")
				return true
		"taste_stumm":
			if rid == "werbespot_set" and oid in ["", "autoplay_countdown", "dr_werbepause"] and not _g("R11b"):
				await _szene(["W4_WERB_NAR_0100", "W4_WERB_MAX_0110", "W4_WERB_WER_0120"])
				Zustand.loese("R11b")
				return true
		"taste_untertitel":
			if oid == "empfangsdame":
				await _szene(["W4_EMPF_MAX_0150", "W4_EMPF_MAX_0160"])
				Zustand.setze("W4_CODE_BEKANNT")
				return true
		"taste_sendersuchlauf":
			if not rid in SENDERZENTRALE:
				if not _g("R12a"):
					await _sag("W4_EMPF_NAR_0010")
					Zustand.loese("R12a")
				else:
					await _sag("W4_TAST_MAX_0200")
				await _sender_wechseln("empfang", rid)
				return true
		"splitscreen_adapter":
			if rid == "spukhaus_keller":
				if _g("R6"):
					await _sag("W4_KELL_MAX_0390")
				elif oid in ["roehrenfernseher", "verkettete_tuer", ""]:
					await _genre_tuer()
				else:
					return false
				return true
			if rid != "zappmanns_studio":
				await _sag("W4_FERN_MAX_0140")
				return true
	if oid.is_empty() and TASTE_RAUM.get(t, {}).has(rid):
		await _sag(TASTE_RAUM[t][rid])
		return true
	if TASTE_FIGUR.get(t, {}).has(oid):
		await _sag(TASTE_FIGUR[t][oid])
		return true
	return false


func kombi_taste_untertitel_pixel() -> bool:
	await _sag("W4_TAST_PIX_0140")
	return true


func ansehen_inventar_taste_pause(_obj, _x) -> bool:
	await _sag("W4_FERN_MAX_0075" if _zaehle("W4_ANSEHEN_PAUSE") > 1 else "W4_FERN_MAX_0070")
	return true
#endregion

#region R1 Testbild und R2 Glücksrad ###############################################################
## Max sieht keine Ordnung in den Balken (Zeilen aus dem Bauplan, 0270, 0280).
func benutzen_balken(_obj, _x) -> bool:
	if _g("R1"):
		await _sag("W4_TEST_PIX_0380")
		return true
	return false


## Pixel (als Figur oder auf die Balken gezogen) sortiert in Graustufen von hell nach dunkel.
func pixel_balken(_obj, _x) -> bool:
	if _g("R1"):
		await _sag("W4_TEST_PIX_0380")
		return true
	await _sag("W4_TEST_PIX_0290")
	var wahl := await Spiel.auswahl(["UI_W4_BALKEN_HELL_DUNKEL", "UI_W4_BALKEN_DUNKEL_HELL", "UI_W4_BALKEN_BUNT"])
	if wahl != 0:
		await _sag("W4_TEST_PIX_0300")
		return true
	await _szene(["W4_TEST_PIX_0310", "W4_TEST_NAR_0320", "W4_TEST_FLI_0330", "W4_TEST_MAX_0340",
		"W4_TEST_GER_0350", "W4_TEST_MAX_0360", "W4_TEST_PIX_0370"])
	Zustand.loese("R1")
	I.active = null
	C.player = C.Max
	Spiel.figur_gewechselt.emit(C.player)
	Spiel.herkunft_raum = ""
	await R.goto_room(Bauplan.raum_script_name("gluecksrad"))
	return true


## Fragerunde: falsche Antworten kosten nichts, Gerd stellt dieselbe Frage neu.
func _fragen(fragen: Array) -> void:
	for f in fragen:
		var fehler := 0
		while true:
			await _sag(f[0])
			var wahl := await Spiel.auswahl(ANTWORTEN)
			if wahl == f[1]:
				await _szene(f[2])
				break
			var falsch: Array = f[3]
			await _sag(falsch[0] if wahl == (f[1] + 1) % 3 else falsch[1])
			fehler += 1
			if fragen == QUIZ and fehler == 1 and f == QUIZ[0]:
				await _sag("W4_GLUE_MAX_0100")


func _quiz_r2() -> void:
	await _szene(["W4_GLUE_GER_0010", "W4_GLUE_MAX_0020", "W4_GLUE_GER_0030", "W4_GLUE_MAX_0040", "W4_GLUE_GER_0050"])
	await _fragen(QUIZ)
	await _szene(["W4_GLUE_GER_0180", "W4_GLUE_MAX_0190", _geben.bind("billig_fernbedienung"),
		_geben.bind("taste_umschalten"), "W4_GLUE_GER_0200", "W4_GLUE_MAX_0210", "W4_GLUE_GER_0220",
		_geben.bind("programmzeitschrift"), "W4_GLUE_MAX_0230", "W4_GLUE_GER_0240", _geben.bind("lichtroehre_deluxe"),
		"W4_GLUE_MAX_0250", "W4_GLUE_PIX_0260", "W4_GLUE_GER_0270"])
	for g in ["billig_fernbedienung", "taste_umschalten", "programmzeitschrift", "lichtroehre_deluxe"]:
		await _geben(g)  # falls übersprungen
	Zustand.loese("R2")


func benutzen_inventar_lichtroehre_deluxe(_obj, _x) -> bool:
	match _raum_id():
		"kapitolis":
			await _szene(["W4_KAPI_MAX_0590", "W4_KAPI_PIX_0600"])
		"savanne":
			await _sag("W4_SAV_MAX_0440")
		"friedhof":
			await _sag("W4_FRIE_MAX_0380")
		_:
			await _sag("W4_GLUE_MAX_0540")
	return true


## Gerd bestätigt das Alibi des Geiers (R4d).
func option_gerd_glueck_0330() -> bool:
	Zustand.loese("R4d")
	return false


## Bonusrunde (R9): nur mit R3, R4 und R11a; dann drei Fragen über die anderen Sender.
func option_gerd_glueck_0010() -> bool:
	if not (_g("R3") and _g("R4") and _g("R11a") and _hat("programmzeitschrift")):
		await _szene(["W4_BONU_GER_0260", "W4_BONU_MAX_0270"])
		return true
	await _szene(["W4_BONU_GER_0020", "W4_BONU_MAX_0030"])
	await _fragen(BONUS)
	await _szene(["W4_BONU_GER_0210", "W4_BONU_MAX_0220", _geben.bind("splitscreen_adapter"),
		"W4_BONU_GER_0230", "W4_BONU_PIX_0240", "W4_BONU_GER_0250"])
	await _geben("splitscreen_adapter")
	Zustand.loese("R9")
	return true
#endregion

#region R3 Sitcom und R4 Savanne ###################################################################
func benutzen_kuechentuer(_obj, _x) -> bool:
	await _sag("W4_SIT_MAX_0190")
	return true


## Der Kommissar kommt als Gast in die Sitcom; der Vater lässt die Keksdose fallen (R3).
func _besuch_r3() -> void:
	Zustand.setze("W4_KOMMISSAR_IN_SITCOM")
	if is_instance_valid(R.current):
		_figuren_anwenden(R.current)
	await _szene(["W4_SIT_KOM_0510", "W4_SIT_VAT_0520", "W4_SIT_SMU_0530", "W4_SIT_KOM_0540",
		"W4_SIT_VAT_0550", "W4_SIT_SOH_0560", "W4_SIT_VAT_0570", "W4_SIT_NAR_0580", "W4_SIT_MAX_0590",
		_geben.bind("taste_pause"), "W4_SIT_KOM_0600", "W4_SIT_MAX_0610", "W4_SIT_KOM_0620",
		"W4_SIT_VAT_0630", "W4_SIT_SMU_0640"])
	await _geben("taste_pause")
	Zustand.loese("R3")


## Die Mutter bestätigt das Fondue (R4a), wenn Max die 20:15-Folge in der Zeitschrift gelesen hat.
func option_sitcom_mutter_0320() -> bool:
	if Zustand.ist("W4_FOLGE_2015_GELESEN"):
		Zustand.loese("R4a")
	return false


## Max nähert sich dem Geparden: Sprint, nach zwanzig Sekunden liegt er (R4b).
func benutzen_gepard(_obj, _x) -> bool:
	if Spiel.ist_pixel():
		return await pixel_gepard(null, null)
	if Zustand.ist("W4_GEPARD_LIEGT"):
		await _sag("W4_VERH_GEP_0140")
	else:
		await _szene(["W4_VERH_GEP_0120", "W4_VERH_MAX_0130"])
		Zustand.setze("W4_GEPARD_LIEGT")
		if _einmal("W4_ERZAEHLER_GEPARD"):
			await _sag("W4_VERH_ERZ_0090")
	return true


func pixel_gepard(_obj, _x) -> bool:
	if not Zustand.ist("W4_GEPARD_LIEGT"):
		await _sag("W4_PIXM_PIX_0080")
		return true
	await _szene(["W4_VERH_PIX_0150", "W4_VERH_GEP_0160", "W4_VERH_PIX_0170"])
	Zustand.setze("W4_GEPARD_VERHOERT")
	return true


func benutzen_flamingos(_obj, _x) -> bool:
	if Zustand.ist("W4_GEPARD_VERHOERT") and not _g("R4b"):
		await _szene(["W4_VERH_FLA_0180", "W4_VERH_MAX_0190"])
		Zustand.loese("R4b")
		return true
	return false


func pixel_flamingos(obj, x) -> bool:
	if Zustand.ist("W4_GEPARD_VERHOERT") and not _g("R4b"):
		return await benutzen_flamingos(obj, x)
	await _sag(PIXEL_AUF["flamingos"])
	return true


## Pixel stibitzt das Drehbuch des Erzählers (R4c); Max darf es nicht nehmen.
func benutzen_drehbuch(obj, _x) -> bool:
	if not Spiel.ist_pixel():
		await _sag("W4_SAV_ERZ_0330")
		return true
	await _szene(["W4_VERH_PIX_0200", "W4_VERH_ERZ_0210", "W4_VERH_PIX_0220", "W4_VERH_MAX_0230"])
	if obj is PopochiuProp:
		obj.hide()
	await _geben("drehbuch")
	Zustand.loese("R4c")
	return true


func pixel_drehbuch(obj, x) -> bool:
	if _raum_id() != "savanne" or _g("R4c"):
		return false
	var vorher := C.player
	C.player = C.Pixel
	await benutzen_drehbuch(obj, x)
	C.player = vorher
	return true


func benutzen_hyaene(_obj, _x) -> bool:
	if Spiel.ist_pixel():
		return false
	if _zaehle("W4_REDEN_HYAENE") == 1:
		await _szene(["W4_VERH_HYA_0310", "W4_VERH_MAX_0320"])
	else:
		await _sag("W4_VERH_HYA_0330")
	return true


func gegenstand_hyaene(_obj, iid) -> bool:
	if not iid in ["programmzeitschrift", "notizbuch"]:
		return false
	if not (_g("R4a") and _g("R4b") and _g("R4c") and _g("R4d")):
		await _sag("W4_VERH_HYA_0440")
		return true
	await _szene(["W4_VERH_MAX_0340", "W4_VERH_HYA_0350", "W4_VERH_NAR_0360", "W4_VERH_LOE_0370",
		"W4_VERH_PIX_0380", "W4_VERH_KOM_0390", "W4_VERH_HYA_0400", "W4_VERH_KOM_0410",
		_geben.bind("taste_rueckspulen"), "W4_VERH_MAX_0420", "W4_VERH_ERZ_0430"])
	await _geben("taste_rueckspulen")
	Zustand.loese("R4")
	return true


func gegenstand_geier(_obj, iid) -> bool:
	if iid == "notizbuch":
		await _sag("W4_VERH_MAX_0450")
		return true
	return false


func pixel_loewe(_obj, _x) -> bool:
	await _szene(["W4_VERH_PIX_0470", "W4_VERH_LOE_0480"])
	return true


func pixel_felsenthron(_obj, _x) -> bool:
	await _sag("W4_VERH_MAX_0460")
	return true
#endregion

#region R5 Friedhof und R6 Keller ##################################################################
func _tanzflaeche() -> bool:
	if _g("R5"):
		return false
	if not Zustand.ist("W4_ZOMBIES_START"):
		await _szene(["W4_FRIE_ZOM_0080", "W4_FRIE_MAX_0090"])
		return true
	await _sag("W4_FRIE_MAX_0240")
	var wahl := await Spiel.auswahl(["UI_W4_TANZ_TAKT", "UI_W4_TANZ_GEGEN"])
	if wahl == 1:
		await _szene(["W4_FRIE_ZOM_0250", "W4_FRIE_MAX_0260", "W4_FRIE_PIX_0270"])
		await _r5_geloest()
		return true
	_tanz_fehler += 1
	if _tanz_fehler == 1:
		await _sag("W4_FRIE_MAX_0280")
		return true
	await _szene(["W4_FRIE_MAX_0290", "W4_FRIE_FLI_0300"])
	if await Spiel.auswahl(["W4_FRIE_MAX_0310", "W4_FRIE_MAX_0320"]) == 0:
		await _szene(["W4_FRIE_MAX_0310", "W4_FRIE_FLI_0330"])
		await _r5_geloest()
	else:
		await _sag("W4_FRIE_MAX_0320")
	return true


func _r5_geloest() -> void:
	await _sag("W4_FRIE_NAR_0340")
	Zustand.loese("R5b")
	Zustand.loese("R5")


func benutzen_zombies(_obj, _x) -> bool:
	return await _tanzflaeche()


func benutzen_leuchtfliesen(_obj, _x) -> bool:
	return await _tanzflaeche()


func benutzen_zombie(_obj, _x) -> bool:
	return await _tanzflaeche()


func _zombies_zurueck() -> void:
	if Zustand.ist("W4_ZOMBIES_START"):
		await _sag("W4_FRIE_MAX_0230")
		return
	await _szene(["W4_FRIE_MAX_0200", "W4_FRIE_MAX_0210", "W4_FRIE_PIX_0220"])
	Zustand.setze("W4_ZOMBIES_START")


## Die Küchentür kommt per Bild-in-Bild in den Keller (R6).
func _genre_tuer() -> void:
	await _szene(["W4_KELL_MAX_0210", "W4_KELL_NAR_0220", "W4_KELL_MAX_0230", "W4_KELL_SOH_0240",
		"W4_KELL_SMU_0250", "W4_KELL_MAX_0260", "W4_KELL_NAR_0270", "W4_KELL_VAT_0280", "W4_KELL_GST_0290",
		"W4_KELL_MAX_0300", "W4_KELL_VAT_0310", "W4_KELL_MAX_0320", "W4_KELL_VAT_0330"])
	Zustand.loese("R6")
	if is_instance_valid(R.current):
		_figuren_anwenden(R.current)


## Laken im Keller: nur ein Gag, das echte Bettlaken wirft der Fledermann.
func benutzen_bettlaken(_obj, _x) -> bool:
	if _raum_id() == "spukhaus_keller":
		await _sag("W4_KELL_MAX_0380")
		return true
	return false
#endregion

#region R7 Lichterkette und R8 Agent ###############################################################
func benutzen_lichterkette(_obj, _x) -> bool:
	if _g("R7"):
		await _sag("W4_HALL_MAX_0260")
		return true
	await _sag("W4_HALL_MAX_0040")
	while true:
		var gehoert := _liste("W4_NACHRICHTEN")
		var offen := []
		for i in NACHRICHTEN.size():
			if i in gehoert or (i == 2 and not 1 in gehoert):
				continue
			offen.append(i)
		if offen.is_empty():
			break
		var wahl := await Spiel.auswahl(offen.map(func(i): return NACHRICHTEN[i][0]))
		if wahl < 0:
			break
		var n: int = offen[wahl]
		await _szene([NACHRICHTEN[n][0]] + NACHRICHTEN[n][1])
		gehoert.append(n)
		Zustand.setze_wert("W4_NACHRICHTEN", gehoert)
		if n == NACHRICHTEN.size() - 1:
			break  # die letzte Nachricht beendet das Gespräch
	if _liste("W4_NACHRICHTEN").size() >= NACHRICHTEN.size():
		Zustand.loese("R7")
	return true


func gegenstand_fbi_agent(_obj, iid) -> bool:
	if _g("R8"):
		return false
	if iid == "notizbuch" and _g("R7"):
		await _szene(["W4_HALL_MAX_0420", "W4_HALL_AGE_0430", "W4_HALL_MAX_0440", "W4_HALL_AGE_0450",
			_geben.bind("taste_untertitel"), "W4_HALL_MAX_0460"])
	elif iid == "sonnenbrille":
		await _szene(["W4_HALL_AGE_0470", _geben.bind("taste_untertitel"), "W4_HALL_MAX_0480"])
	else:
		return false
	await _geben("taste_untertitel")
	Zustand.loese("R8")
	return true


## Agent Schmidts Sonnenbrille aus Welt 3 in der Halle aufgesetzt: Abkürzung für R8
func benutzen_inventar_sonnenbrille(_obj, _x) -> bool:
	if _raum_id() != "spukhaus_halle" or _g("R8"):
		return false
	return await gegenstand_fbi_agent(null, "sonnenbrille")
#endregion

#region R10 Käsemann ###############################################################################
func option_fledermann_0340() -> bool:
	Zustand.setze("W4_LAKEN_GEWORFEN")
	if is_instance_valid(R.current):
		_figuren_anwenden(R.current)
	return false


func kombi_bettlaken_pixel() -> bool:
	if _g("R10b"):
		return false
	await _sag("W4_KAPI_PIX_0370")
	Zustand.loese("R10b")
	return true


func ansehen_normaler_kaese_in_der_fabrik(_obj, _x) -> bool:
	await _sag("W4_FABR_PIX_0385" if _zaehle("W4_ANSEHEN_KAESE_FABRIK") > 1 else "W4_FABR_PIX_0380")
	return true


func gegenstand_bottiche(_obj, iid) -> bool:
	if iid == "amboss":
		await _sag("W4_FABR_MAX_0410")
		return true
	return false


## Rückspulen in der Fabrik hält den Unfall an vier Einzelbildern an; Bild drei ist der offene
## Bottich (R10c).
func _einzelbilder() -> void:
	await _sag("W4_FABR_MAX_0140")
	var wahl := await Spiel.auswahl(["UI_OBJ_EINZELBILD_1", "UI_OBJ_EINZELBILD_2", "UI_OBJ_EINZELBILD_3",
		"UI_OBJ_EINZELBILD_4"])
	if EINZELBILD_FALSCH.has(wahl):
		await _szene(EINZELBILD_FALSCH[wahl] + ["W4_FABR_PIX_0250"])
		return
	if wahl != 2:
		return
	if _zustand_gegenstand("fondue_kaese") != "Wunderkäse" or not _hat("fondue_kaese"):
		await _sag("W4_FABR_MAX_0360")
		return
	if not (_hat("bettlaken") and _g("R10b")):
		await _sag("W4_FABR_MAX_0370")
		return
	await _szene(["W4_FABR_MAX_0260", "W4_FABR_NAR_0270", "W4_FABR_MAX_0280", "W4_FABR_PIX_0290",
		"W4_FABR_WIL_0300", "W4_FABR_MAX_0310", "W4_FABR_SIE_0320", "W4_FABR_FLE_0330", "W4_FABR_MAX_0340",
		"W4_FABR_PIX_0350"])
	Zustand.loese("R10c")
	Zustand.loese("R10")
#endregion

#region R11 Werbespot ##############################################################################
func gegenstand_dr_werbepause(_obj, iid) -> bool:
	match iid:
		"bananenschale":
			if _zustand_gegenstand("bananenschale") != "Stinkbombe":
				await _szene(["W4_WERB_NAR_0160", "W4_WERB_WER_0170", "W4_WERB_MAX_0180"])
				return true
			if not _g("R10"):
				await _sag("W4_WERB_MAX_0490")
				return true
			if not _g("R11b"):
				await _sag("W4_WERB_MAX_0090")
				return true
			await _szene(["W4_WERB_MAX_0190", "W4_WERB_NAR_0200", "W4_WERB_WER_0210", "W4_WERB_WIL_0250"])
			await _abgeben("bananenschale")
			Zustand.loese("R11c")
			if is_instance_valid(R.current):
				_figuren_anwenden(R.current)
			return true
		"amboss":
			await _szene(["W4_WERB_NAR_0230", "W4_WERB_MAX_0240"])
			return true
	return false


func gegenstand_werbepause(obj, iid) -> bool:
	return await gegenstand_dr_werbepause(obj, iid)


func benutzen_produktpodest(_obj, _x) -> bool:
	if _g("R11b") and not _g("R11c"):
		await _sag("W4_WERB_MAX_0470")
		return true
	return false


func benutzen_taste_sendersuchlauf(_obj, _x) -> bool:
	if not _g("R11d"):
		await _sag("W4_WERB_MAX_0500")
		return true
	return false  # Nehmen aus dem Bauplan (0220)


## Comic-Panels sortieren (R11d): vier Panels nacheinander wählen.
func ansehen_comic_panels(_obj, _x) -> bool:
	if not _g("R11c") or _g("R11d"):
		return false
	var fehl := int(Zustand.wert("W4_PANEL_FEHLER", 0))
	await _sag("W4_WERB_MAX_0350" if fehl > 0 else ("W4_WERB_MAX_0265" if Zustand.ist("W4_PANELS_GESEHEN") else "W4_WERB_MAX_0260"))
	Zustand.setze("W4_PANELS_GESEHEN")
	var rest := PANELS.duplicate()
	var reihe := []
	while not rest.is_empty():
		var wahl := await Spiel.auswahl(rest.map(func(p): return "UI_OBJ_" + p.to_upper()))
		if wahl < 0:
			return true
		reihe.append(rest[wahl])
		rest.remove_at(wahl)
	if reihe == PANELS:
		await _szene(["W4_WERB_NAR_0360", "W4_WERB_MAX_0370", "W4_WERB_WIL_0380", "W4_WERB_FLE_0390"])
		Zustand.loese("R11d")
		Zustand.loese("R11")
		return true
	await _szene(["W4_WERB_NAR_0320", "W4_WERB_MAX_0330", "W4_WERB_SIE_0340"])
	Zustand.setze_wert("W4_PANEL_FEHLER", fehl + 1)
	if fehl == 0:
		await _sag("W4_WERB_PIX_0310")
	return true


func benutzen_comic_panels(obj, x) -> bool:
	return await ansehen_comic_panels(obj, x)
#endregion

#region R12 Senderzentrale #########################################################################
func benutzen_zahlenfeld_mit_code(_obj, _x) -> bool:
	if _g("R12b"):
		return false
	if not _g("R7"):
		await _sag("W4_EMPF_PIX_0350")
	elif not _hat("archivband"):
		await _sag("W4_EMPF_PIX_0340")
	elif not Zustand.ist("W4_CODE_BEKANNT"):
		await _sag("W4_EMPF_MAX_0240")
	else:
		await _szene(["W4_EMPF_MAX_0170", "W4_EMPF_SIC_0180", "W4_EMPF_MAX_0190"])
		Zustand.setze("W4_CODE_EINGEGEBEN")
	return true


## Das Archivband nimmt Max erst, wenn er von der Lichterkette weiß, was es ist.
func benutzen_archivband(_obj, _x) -> bool:
	if _g("R7"):
		return false  # Nehmen aus dem Bauplan (0080)
	await _sag("W4_ARCH_MAX_0090")
	return true


func ansehen_band_in_der_presse(_obj, _x) -> bool:
	var zweites := _zaehle("W4_ANSEHEN_BAND") > 1
	if _g("R7"):
		await _sag("W4_ARCH_MAX_0075" if zweites else "W4_ARCH_MAX_0070")
	else:
		await _sag("W4_ARCH_MAX_0095" if zweites else "W4_ARCH_MAX_0090")
	return true


func gegenstand_muellpresse(_obj, iid) -> bool:
	if iid == "drehbuch":
		await _sag("W4_ARCH_MAX_0130")
		return true
	return false
#endregion

#region R13 Zappmann ###############################################################################
func ansehen_goldenes_sofa(_obj, _x) -> bool:
	if _g("R13") or int(Zustand.wert("W4_KAMPF", 0)) > 0:
		return false
	await _sag("W4_STUD_MAX_0045" if Zustand.ist("W4_SOFA_GESEHEN") else "W4_STUD_MAX_0040")
	Zustand.setze("W4_SOFA_GESEHEN")
	await _angebot()
	return true


func benutzen_goldenes_sofa(obj, x) -> bool:
	return await ansehen_goldenes_sofa(obj, x)


func benutzen_zappmann(obj, x) -> bool:
	if Spiel.ist_pixel():
		return false
	return await ansehen_goldenes_sofa(obj, x)


## Das Sofa-Angebot: Zusagen enden im Albtraum, erst die Ablehnung startet den Kampf.
func _angebot() -> void:
	await _szene(["W4_STUD_ZAP_0050", "W4_STUD_PIX_0060"])
	while true:
		var wahl := await Spiel.auswahl(["W4_STUD_MAX_0070", "W4_STUD_MAX_0080", "W4_STUD_MAX_0090"])
		match wahl:
			0:
				await _szene(["W4_STUD_MAX_0070", "W4_STUD_NAR_0100", "W4_STUD_MAX_0110", "W4_STUD_PIX_0120",
					"W4_STUD_NAR_0130", "W4_STUD_ZAP_0140"])
			1:
				await _szene(["W4_STUD_MAX_0080", "W4_STUD_ZAP_0150"])
			_:
				await _szene(["W4_STUD_MAX_0090", "W4_STUD_MAX_0160", "W4_STUD_PIX_0170", "W4_STUD_ZAP_0180",
					"W4_STUD_MAX_0190"])
				Zustand.setze_wert("W4_KAMPF", 1)
				return


## Kampf: Pause, Bild-in-Bild mit Archivband, Stumm, Untertitel, Sendersuchlauf. Falsche Tasten
## sagen, was fehlt; Scheitern gibt es nicht.
func _kampf(t: String) -> void:
	var schritt := int(Zustand.wert("W4_KAMPF", 1))
	match t:
		"taste_rueckspulen":
			await _sag("W4_STUD_ZAP_0510")
		"taste_pause":
			if schritt == 1:
				await _szene(["W4_STUD_NAR_0200", "W4_STUD_ZAP_0210", "W4_STUD_MAX_0220"])
				Zustand.setze_wert("W4_KAMPF", 2)
			else:
				await _sag("W4_STUD_MAX_0580")
		"splitscreen_adapter":
			if not _hat("archivband"):
				await _sag("W4_STUD_MAX_0550")
			elif schritt < 2:
				await _sag("W4_STUD_MAX_0560")
			elif schritt == 2:
				await _szene(["W4_STUD_NAR_0230", "W4_STUD_ZAP_0240", "W4_STUD_MAX_0250", "W4_STUD_NAR_0260"])
				Zustand.setze_wert("W4_KAMPF", 3)
			else:
				await Spiel.ersatz()
		"taste_stumm":
			if schritt < 2:
				await _sag("W4_STUD_MAX_0520")
			elif schritt == 2:
				await _sag("W4_STUD_MAX_0570")
			elif schritt == 3:
				await _szene(["W4_STUD_MAX_0270", "W4_STUD_NAR_0280", "W4_STUD_MAX_0290"])
				Zustand.setze_wert("W4_KAMPF", 4)
			else:
				await Spiel.ersatz()
		"taste_untertitel":
			if schritt == 4:
				await _szene(["W4_STUD_ZAP_0300", "W4_STUD_MAX_0310", "W4_STUD_PIX_0320", "W4_STUD_NAR_0330"])
				Zustand.setze_wert("W4_KAMPF", 5)
			else:
				await _sag("W4_STUD_MAX_0530")
		"taste_sendersuchlauf":
			if schritt == 5:
				await _sieg()
			else:
				await _sag("W4_STUD_MAX_0540")


func _sieg() -> void:
	var zeilen := ["W4_STUD_ZAP_0340", "W4_STUD_MAX_0350", "W4_STUD_NAR_0360", "W4_STUD_ZAP_0370",
		"W4_STUD_MAX_0380", "W4_STUD_ZAP_0390", "W4_STUD_MAX_0400", _geben.bind("goldene_fernbedienung"),
		"W4_STUD_ZAP_0410", "W4_STUD_PIX_0420"]
	if not _hinweis_stufe_3():
		zeilen.append("W4_STUD_PIX_0440")
	zeilen.append("W4_STUD_PIX_0450")
	await _szene(zeilen)
	await _geben("goldene_fernbedienung")
	# Pixels vierter Wunsch auf Seite 3: Milch (W4_STUD_PIX_0450)
	Zustand.setze_wert("EINKAUFSLISTE", maxi(int(Zustand.wert("EINKAUFSLISTE", 0)), 4))
	Zustand.loese("R13")


func gegenstand_zappmann(_obj, iid) -> bool:
	if iid == "amboss":
		await _sag("W4_STUD_MAX_0680")
		return true
	return false


## Die Goldene Fernbedienung bringt Max heim: Werbeblock, dann das Finale auf dem Dachboden.
func benutzen_inventar_goldene_fernbedienung(_obj, _x) -> bool:
	if not _g("R13"):
		return false
	await _sag("W4_STUD_MAX_0460")
	await _abschluss()
	return true
#endregion

#region Abschluss ##################################################################################
## Pixels Lob nur ohne einen einzigen Hinweis der Stufe 3 in dieser Welt
func _hinweis_stufe_3() -> bool:
	for r in Zustand.alle_raetsel("welt-4"):
		if Hinweise.stufe(str(r.get("id", ""))) >= 3:
			return true
	return false


func _abschluss() -> void:
	await Spiel.finale_beginnen()
#endregion
