extends RefCounted
## Regeln von Welt 2, Antikodonien (raetsel/welt-2.md, skript/welt-2.md).
##
## Die Basisklassen melden ihre Ereignisse an ereignis(art, obj, item) (Spiel.regel). Hier
## heißen die Behandler nach Art und Objekt-ID: benutzen_faehre(), gegenstand_nebet(),
## pixel_sobek(), ansehen_inventar_handy(), kombi_brot_datteln(), option_ramses_0210(),
## nach_uebergang_nil_delta() … Jeder liefert true, wenn er das Ereignis erledigt hat; sonst gilt
## das Standardverhalten aus dem Bauplan. Werte ohne Warten (Zustand der Gegenstände, Bedingungen
## in Worten, Figuren im Raum) liefert wert().
##
## Gespeichert wird nur in Zustand (Schalter W2_*, Werte W2_*); alles andere ist abgeleitet:
## - W2_FAEHRE_STEG: Anlegestelle der Zeitfähre. Alter von Grabstein, Traubensaft und Essigkrug
##   folgt allein daraus (Tabelle „Zeitrechnung der Fähre“).
## - W2_FEIGE_ZUSTAND: setzling, feigenbaum oder feigenkern.
## - W2_BAUSTEINE (Rätsel-Bausteine der Sphinx), W2_KONTER (Konter 1–7 fürs Rede-Ringen).

#region Konstanten ################################################################################
const STEGE := ["nil_delta", "faehrsteg_olympia", "hafen_syrakus"]
## Jahre ab Ägypten (Ägypten–Olympia 112, Olympia–Syrakus 25)
const JAHRE := {"nil_delta": 0, "faehrsteg_olympia": 112, "hafen_syrakus": 137}
const ANKUNFT := {
	"nil_delta": "W2_FAHR_FAE_0300", "faehrsteg_olympia": "W2_FAHR_FAE_0280",
	"hafen_syrakus": "W2_FAHR_FAE_0290",
}
## Getränke: Alter → Stufe 0 Traubensaft, 1 Wein, 2 Essig (Schwellen 50 und 100 Jahre)
const GETRAENK := ["Traubensaft", "Wein", "Essig"]
## Der Essigkrug ist in Syrakus 120 Jahre alt: Alter = Jahre des Stegs − 17
const ESSIGKRUG_VERSATZ := -17
## Ohne Sanduhr: ein Kommentar je Ding auf einer Fahrt (FAHR 0240–0270)
const ZEITLOS := {"handy": "W2_FAHR_MAX_0240", "kaugummi": "W2_FAHR_MAX_0250",
	"thunfischdose": "W2_FAHR_PIX_0260", "olivenoel": "W2_FAHR_MAX_0270"}

## Hieroglyphen-Tafel (2a): 16 Kacheln, Zielsatz Mann, Katze, Pharao, Ohr
const KACHELN := ["mann", "katze", "pharao", "ohr", "mund", "hand", "auge", "krokodil",
	"skarabaeus", "haus", "vogel", "sonne", "wasser", "schlange", "lotus", "feder"]
const BOTSCHAFT := ["mann", "katze", "pharao", "ohr"]

## Sphinx (8): Bausteine je Wunderding und die Kommentare zum ersten falschen Baustein
const BAUSTEINE := {
	"handy": ["klingelt", "leuchtet", "stirbt"],
	"kaugummi": ["nie_alle", "klebt", "sonne"],
	"kugelschreiber": ["schreibt", "klickt", "blau"],
}
const SPHINX_FALSCH := {
	"kaugummi": {"klingelt": "0260", "leuchtet": "0270", "stirbt": "0280", "schreibt": "0290",
		"klickt": "0300", "blau": "0310"},
	"kugelschreiber": {"klingelt": "0320", "leuchtet": "0330", "stirbt": "0340",
		"nie_alle": "0350", "klebt": "0360", "sonne": "0370"},
	"handy": {"nie_alle": "0380", "klebt": "0390", "sonne": "0400", "schreibt": "0410",
		"klickt": "0420", "blau": "0430"},
}
const SPHINX_RICHTIG := {"handy": ["0450", "0490"], "kaugummi": ["0460", "0500"],
	"kugelschreiber": ["0470", "0510"]}

## Rede-Ringen: Konter-Zeilen und welche Konter auf welche Beleidigung (Linie) passen
const KONTER_ZEILE := {1: "W2_RING_MAX_0170", 2: "W2_RING_MAX_0100", 3: "W2_RING_MAX_0130",
	4: "W2_RING_MAX_0110", 5: "W2_RING_MAX_0150", 6: "W2_RING_MAX_0140", 7: "W2_RING_MAX_0090"}
const BELEIDIGUNG := {1: "W2_RING_CIC_0040", 2: "W2_RING_CIC_0050", 3: "W2_RING_CIC_0060",
	4: "W2_RING_CIC_0070", 5: "W2_RING_CIC_0080"}
const PASSEND := {1: [2, 7], 2: [4], 3: [3, 6], 4: [5], 5: [1]}

## Archimedes' Hebel: Gewichte der Gegenstände im Korb; richtig ist 8 bis 10 (Pixel allein: 9)
const GEWICHT := {"thunfischdose": 0, "notizbuch": 1, "kochloeffel": 1, "handy": 1,
	"kugelschreiber": 0, "kaugummi": 0, "startpass": 1, "olivenoel": 6, "waage": 4,
	"tintenfass": 3, "traubensaft": 12, "essigkrug": 12, "pharaonenteller": 3, "opas_papyrus": 0,
	"messbecher": 1, "brennspiegel": 3, "socke": 0, "pixel": 9}
const HEBEL_KOMMENTAR := {"thunfischdose": "W2_HEBL_ARC_0020", "notizbuch": "W2_HEBL_ARC_0040",
	"kochloeffel": "W2_HEBL_ARC_0050", "handy": "W2_HEBL_ARC_0060",
	"kugelschreiber": "W2_HEBL_ARC_0070", "kaugummi": "W2_HEBL_ARC_0080",
	"startpass": "W2_HEBL_ARC_0090", "olivenoel": "W2_HEBL_ARC_0100", "waage": "W2_HEBL_ARC_0110",
	"tintenfass": "W2_HEBL_ARC_0120", "traubensaft": "W2_HEBL_ARC_0130",
	"essigkrug": "W2_HEBL_ARC_0130", "pharaonenteller": "W2_HEBL_ARC_0140",
	"opas_papyrus": "W2_HEBL_ARC_0150", "messbecher": "W2_HEBL_ARC_0160",
	"brennspiegel": "W2_HEBL_ARC_0170", "socke": "W2_HEBL_ARC_0180", "pixel": "W2_HEBL_ARC_0190"}
const HEBEL_MIN := 8
const HEBEL_MAX := 10

## Diskus-Diebstahl (7): Verhör, Pixels Nase, Anklage
const VERDAECHTIGE := {
	"leonidas": {"verhoer": ["W2_DISK_MAX_0040", "W2_DISK_LEO_0050", "W2_DISK_LEO_0060"],
		"nase": ["W2_DISK_PIX_0070"], "anklage": ["W2_DISK_MAX_0210", "W2_DISK_LEO_0220"]},
	"hermes": {"verhoer": ["W2_DISK_MAX_0080", "W2_DISK_HER_0090", "W2_DISK_HER_0100"],
		"nase": ["W2_DISK_PIX_0110"], "anklage": ["W2_DISK_MAX_0230", "W2_DISK_HER_0240"]},
	"tiro": {"verhoer": ["W2_DISK_MAX_0120", "W2_DISK_TIR_0130", "W2_DISK_TIR_0140"],
		"nase": ["W2_DISK_PIX_0150", "W2_DISK_MAX_0160"], "anklage": []},
	"sphinx_figur": {"verhoer": ["W2_DISK_MAX_0170", "W2_DISK_SPH_0180", "W2_DISK_SPH_0190"],
		"nase": ["W2_DISK_PIX_0200"], "anklage": ["W2_DISK_MAX_0250", "W2_DISK_SPH_0260"]},
}
const WURFGERAETE := ["diskus", "wurfscheibe", "pharaonenteller", "schallplatte"]

## Paraden-Plan (11a): Feld 1 bis 4
const PARADE := ["hermes", "brennspiegel", "cicero", "pixel"]
const PARADE_TEXT := {"hermes": "UI_OBJ_HERMES", "brennspiegel": "UI_OBJ_BRENNSPIEGEL",
	"cicero": "UI_OBJ_CICERO", "pixel": "UI_OBJ_PIXEL"}

## Pixel auf Menschen (INV 0070–0210); Tiere reden mit Pixel über den Bauplan
const PIXEL_AUF := {"ramses": "W2_INV_PIX_0070", "faehrmann": "W2_INV_PIX_0090",
	"nebet": "W2_INV_PIX_0100", "archimedes": "W2_INV_PIX_0110", "cicero": "W2_INV_PIX_0120",
	"leonidas": "W2_INV_PIX_0130", "hermes": "W2_INV_PIX_0140", "tiro": "W2_INV_PIX_0150",
	"brian": "W2_INV_PIX_0160", "beamter_1": "W2_BUER_BE1_0590", "beamter_2": "W2_INV_PIX_0170",
	"steinmetz": "W2_INV_PIX_0180", "faecherwedler": "W2_INV_PIX_0190",
	"zeremonienmeister": "W2_INV_PIX_0200", "tourist": "W2_INV_PIX_0210",
	"sphinx_figur": "W2_SPHX_PIX_0580"}

## Figuren ohne Gespräch: eine kurze Szene beim Reden
const REDEN := {"tourist": ["W2_AGOR_TOU_0140"], "tiro": ["W2_AGOR_MAX_0360", "W2_AGOR_TIR_0370"],
	"philosoph": ["W2_AGOR_MAX_0450", "W2_AGOR_PHI_0460", "W2_AGOR_MAX_0470"]}

## Erstes Betreten
const ERSTES_BETRETEN := {
	"thronsaal_ramses": ["W2_THRO_MAX_0010", "W2_THRO_RAM_0020", "W2_THRO_HOF_0030",
		"W2_THRO_PIX_0040", "W2_THRO_SCH_0050", "W2_THRO_MAX_0060"],
	"palastkueche": ["W2_KUCH_PIX_0010"],
	"werkstatt": ["W2_WERK_MAX_0010", "W2_WERK_PIX_0020"],
	"startbuero": ["W2_BUER_MAX_0010", "W2_BUER_PIX_0020"],
	"agora": ["W2_AGOR_MAX_0010"],
	"stadion": ["W2_STAD_MAX_0010"],
	"grabhuegel": ["W2_GRAB_MAX_0100"],
}


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
		var m := ("option_%s_%s" % [oid, iid]) if art == "nach_option" else "einstieg_" + oid
		return bool(await call(m)) if has_method(m) else false
	var name := "%s_%s" % [art, oid]
	if has_method(name):
		return bool(await call(name, obj, iid))
	# allgemeine Fälle
	if obj is PopochiuCharacter:
		match art:
			"pixel":
				return await _pixel_auf_figur(oid)
			"benutzen":
				return await _reden_kurz(oid)
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


func _einmal(schalter: String) -> bool:
	if Zustand.ist(schalter):
		return false
	Zustand.setze(schalter)
	return true


func _liste(name: String) -> Array:
	return (Zustand.wert(name, []) as Array).duplicate()


func _baustein(b: String) -> void:
	var l := _liste("W2_BAUSTEINE")
	if not b in l:
		l.append(b)
		Zustand.setze_wert("W2_BAUSTEINE", l)
		Klang.geraeusch("notiz")


func _konter(nummern: Array) -> void:
	var l := _liste("W2_KONTER")
	for n in nummern:
		if not int(n) in l:
			l.append(int(n))
	l.sort()
	Zustand.setze_wert("W2_KONTER", l)
	Klang.geraeusch("notiz")
	# Rätsel 9: für jede Beleidigung ein Konter (Schriftrolle plus beide Griechen-Konter)
	if Zustand.geloest("R8") and not Zustand.geloest("R9"):
		var alle := true
		for linie in PASSEND:
			if not PASSEND[linie].any(func(k): return k in l):
				alle = false
		if alle:
			Zustand.loese("R9")


func audienz() -> bool:
	return Zustand.ist("W2_AUDIENZ")


func steg() -> String:
	return str(Zustand.wert("W2_FAEHRE_STEG", "nil_delta"))


func _getraenk(alter: int) -> int:
	return 0 if alter < 50 else (1 if alter < 100 else 2)


func _alter(id: String, s := "") -> int:
	if s.is_empty():
		s = steg()
	return int(JAHRE[s]) + (ESSIGKRUG_VERSATZ if id == "essigkrug" else 0)


func _zustand_gegenstand(id: String) -> Variant:
	match id:
		"traubensaft", "essigkrug":
			return GETRAENK[_getraenk(_alter(id))]
		"grabstein":
			return ["frisch", "grau", "verwittert"][STEGE.find(steg())]
		"feigensetzling":
			return {"setzling": "Feigensetzling", "feigenbaum": "Feigenbaum",
				"feigenkern": "Feigenkern"}.get(str(Zustand.wert("W2_FEIGE_ZUSTAND", "setzling")))
		"fladen":
			return str(Zustand.wert("W2_FLADEN", "mit Datteln"))
		"olivenoel":
			return "angebrochen" if Zustand.ist("W2_SANDALEN_GEOELT") else "voll"
		"rundschreiben":
			return str(Zustand.wert("W2_RUNDSCHREIBEN", "mit Kugelschreiber"))
	return null


## Bedingungen, die das Skript in Worten nennt. Beschreibungen ohne Bedingung gelten immer.
func _bedingung_text(text: String) -> Variant:
	match text:
		"nach der Audienz":
			return audienz()
		"vor der Sandale":
			return not Zustand.geloest("R6a")
		"nach dem Besuch in Syrakus":
			return Zustand.war_in("hafen_syrakus")
		"nach Ciceros Forderung (R10), und nach Tag 1":
			return Zustand.ist("W2_CICERO_FORDERUNG") and Zustand.geloest("R12")
		"Wettkampftage":
			return _wettkampf()
		"nach dem Training":
			return Zustand.geloest("R5")
	return null


func _wettkampf() -> bool:
	return Zustand.ist("W2_TAG1_LAEUFT") or Zustand.geloest("R13")


#endregion

#region Figuren in den Räumen ######################################################################
func sobek_folgt() -> bool:
	return Zustand.ist("W2_SOBEK_FOLGT") and not Zustand.geloest("R2b")


## Wer wo steht, folgt aus dem Spielstand (nie gespeichert).
func _figuren_anwenden(raum: CQRaum) -> void:
	var rid := raum.raum_id()
	var tag := _wettkampf()
	var plan := {
		"Sobek": rid == "nil_delta" or (sobek_folgt() and rid == "thronsaal_ramses"),
		"Hofkater": rid == "thronsaal_ramses" and not Zustand.geloest("R2b"),
		"Ramses": (rid == "thronsaal_ramses" and not tag) or (rid == "stadion" and tag),
		"Faecherwedler": (rid == "thronsaal_ramses" and not tag) or (rid == "stadion" and tag),
		"Archimedes": (rid == "werkstatt" and not tag) or (rid == "stadion" and tag),
		"Cicero": (rid == "agora" and not Zustand.geloest("R13")) or (rid == "stadion" and Zustand.geloest("R13")),
		"Hermes": (rid == "startbuero" and Zustand.ist("W2_HERMES_IM_BUERO") and not Zustand.geloest("R12"))
			or (rid == "stadion" and (Zustand.geloest("R12") and not Zustand.geloest("R7") or Zustand.geloest("R13"))),
		"Brian": rid == "agora" and not Zustand.geloest("R6a"),
		"Zeremonienmeister": rid == "stadion" and Zustand.geloest("R13"),
		"Aegypter": rid == "stadion" and Zustand.geloest("R13"),
	}
	for sn in plan:
		var marker: String = {"Sobek": "Sobek", "Hofkater": "Kissen", "Ramses": "Ramses",
			"Faecherwedler": "Wedler", "Archimedes": "Archimedes", "Cicero": "Cicero",
			"Hermes": "Hermes", "Zeremonienmeister": "Zeremonienmeister", "Aegypter": "Aegypter"}.get(sn, "")
		var pos := Vector2.INF
		if plan[sn] and not raum.has_character(sn) and raum.has_marker(marker):
			pos = raum.get_marker_position(marker)
		Spiel.figur_hier(sn, plan[sn], pos)
	# Sobek kriecht Pixel hinterher (2b, Gefolge)
	if sobek_folgt() and raum.has_character("Sobek") and is_instance_valid(C.Pixel) and C.Pixel.is_inside_tree():
		C.get_character("Sobek").position = C.Pixel.position + Vector2(-45, 5)


#endregion

#region Ankunft und Räume ##########################################################################
func nach_uebergang_nil_delta(_raum, _x) -> bool:
	if _einmal("W2_ANKUNFT"):
		Zustand.setze("W2_WECHSEL_FREI")
		await _szene(["W2_NIL_MAX_0010", "W2_NIL_PIX_0020", "W2_NIL_MAX_0030", "W2_NIL_PIX_0040",
			"W2_NIL_MAX_0050", "W2_NIL_PIX_0060", "W2_NIL_MAX_0070", "W2_NIL_PIX_0080",
			"W2_NIL_MAX_0090", "W2_NIL_PIX_0100", "W2_NIL_MAX_0105", "W2_NIL_NAR_0110", "W2_NIL_PIX_0120"])
		return true
	# Hermes bringt Opas Papyrus beim ersten Betreten nach der ersten Fährfahrt
	if int(Zustand.wert("W2_FAHRTEN", 0)) > 0 and _einmal("W2_OPAS_PAPYRUS"):
		var raum: CQRaum = R.current
		Spiel.figur_hier("Hermes", true, raum.get_marker_position("Hermes") if raum.has_marker("Hermes") else Vector2.INF)
		await _szene(["W2_NIL_HER_0910", "W2_NIL_MAX_0920"])
		await _geben("opas_papyrus")
		await _szene(["W2_NIL_HER_0930", "W2_NIL_OPA_0940", "W2_NIL_MAX_0950", "W2_NIL_PIX_0960",
			"W2_NIL_HER_0970", "W2_NIL_MAX_0980", "W2_NIL_HER_0990"])
		Spiel.figur_hier("Hermes", false)
		return true
	return false


## Erstes Betreten der übrigen Räume (Szenen aus dem Skript)
func _erstes_betreten(rid: String) -> bool:
	if rid in ERSTES_BETRETEN and _einmal("W2_BESUCHT_" + rid.to_upper()):
		await _szene(ERSTES_BETRETEN[rid])
		return true
	return false


func nach_uebergang_thronsaal_ramses(_raum, _x) -> bool:
	if await _erstes_betreten("thronsaal_ramses"):
		return true
	if Zustand.ist("W2_DUELL") and sobek_folgt() and not Zustand.ist("W2_DUELL_GEFOLGE"):
		await _gefolge()
		return true
	if Zustand.geloest("R2a") and Zustand.geloest("R2b") and not audienz():
		await _audienz()
		return true
	return false


func nach_uebergang_palastkueche(_raum, _x) -> bool:
	return await _erstes_betreten("palastkueche")


func nach_uebergang_werkstatt(_raum, _x) -> bool:
	return await _erstes_betreten("werkstatt")


func nach_uebergang_startbuero(_raum, _x) -> bool:
	return await _erstes_betreten("startbuero")


func nach_uebergang_grabhuegel(_raum, _x) -> bool:
	return await _erstes_betreten("grabhuegel")


func nach_uebergang_stadion(_raum, _x) -> bool:
	return await _erstes_betreten("stadion")


func nach_uebergang_agora(_raum, _x) -> bool:
	if await _erstes_betreten("agora"):
		return true
	# Die Sandale liegt oben auf der Säule: die Menge streitet (nach Tag 1)
	if Zustand.geloest("R12") and not Zustand.geloest("R6a") and _einmal("W2_SANDALE_GESEHEN"):
		await _szene(["W2_SAND_TOU_0020", "W2_SAND_GRI_0030", "W2_SAND_TOU_0040", "W2_SAND_PIX_0050"])
		return true
	return false


## Die Sandale auf der Säule gibt es nur zwischen Tag 1 und Rätsel 6a.
func ansehen_sandale_auf_der_saeule(obj, _x) -> bool:
	if not Zustand.geloest("R12") or Zustand.geloest("R6a"):
		await Spiel.ersatz()
		return true
	return false


#endregion

#region Rätsel 1: Die Krokodil-Fähre und die Zeitfähre ############################################
func benutzen_faehre(_obj, _x) -> bool:
	if not Zustand.geloest("R1"):
		await _sag("W2_NIL_MAX_0380")
		return true
	await flusskarte()
	return true


func pixel_faehre(_obj, _x) -> bool:
	if Zustand.geloest("R1"):
		if Spiel.ist_pixel():
			await Spiel.wechsel_regel("pixel_tuer")
		else:
			await flusskarte()
		return true
	await _szene(["W2_NIL_MAX_0400", "W2_NIL_FAE_0410", "W2_NIL_FAE_0420", "W2_NIL_MAX_0430",
		"W2_NIL_PIX_0440", "W2_NIL_MAX_0450", "W2_NIL_FAE_0460"])
	Zustand.loese("R1")
	if Spiel.ist_pixel():
		Spiel.figur_wechseln(false)
	await flusskarte()
	return true


func pixel_sobek(_obj, _x) -> bool:
	if not Zustand.geloest("R1"):
		await _sag("W2_NIL_PIX_0390")
	elif not Zustand.geloest("R2b") and not Zustand.ist("W2_SOBEK_FOLGT"):
		await _sag("W2_INV_PIX_0080")
		Zustand.setze("W2_SOBEK_FOLGT")
		Spiel.regel_wert("zustand_anwenden", R.current)
	else:
		await _sag("W2_INV_PIX_0080")
	return true


## Die Flusskarte: von jedem Steg zu den beiden anderen (auch Ägypten–Syrakus ohne Halt).
func flusskarte() -> void:
	if _einmal("W2_FLUSSKARTE_OFFEN"):
		await _szene(["W2_FAHR_PIX_0020", "W2_FAHR_MAX_0010"])
	elif _einmal("W2_FLUSSKARTE_ZWEITES"):
		await _sag("W2_FAHR_MAX_0015")
	var hier := steg()
	var ziele: Array = STEGE.filter(func(s): return s != hier)
	var wahl := await Spiel.auswahl(ziele.map(func(s): return "UI_RAUM_" + s.to_upper()) + ["UI_W2_DOCH_NICHT"])
	if wahl < 0 or wahl >= ziele.size():
		return
	await fahren(ziele[wahl])


## Eine Fahrt: Abfahrt, Altern und Verjüngen im Inventar, Ankunft im Zielraum.
func fahren(ziel: String) -> void:
	var von := steg()
	var i := STEGE.find(von)
	var j := STEGE.find(ziel)
	var abwaerts := j > i
	var zeilen := ["W2_FAHR_FAE_0030"]
	var fahrten := int(Zustand.wert("W2_FAHRTEN", 0))
	if fahrten == 0:
		zeilen.append_array(["W2_FAHR_PIX_0070", "W2_FAHR_SOB_0080"])
	# Dinge ohne Sanduhr-Symbol: je einmal ein Blick während der Fahrt
	for id in ZEITLOS:
		if _hat(id) and _einmal("W2_ZEITLOS_" + id.to_upper()):
			zeilen.append(ZEITLOS[id])
			break
	if von == "nil_delta" and ziel != "nil_delta" and _einmal("W2_FAHRT_OLYMPIA"):
		zeilen.append("W2_FAHR_FAE_0040")
	if ziel == "hafen_syrakus" and _einmal("W2_FAHRT_SYRAKUS"):
		zeilen.append("W2_FAHR_FAE_0050")
	if not abwaerts and _einmal("W2_FAHRT_AUFWAERTS"):
		zeilen.append("W2_FAHR_MAX_0060")
	# Getränke: jede Schwelle, die ein Krug überschreitet
	for id in ["traubensaft", "essigkrug"]:
		if _hat(id):
			zeilen.append_array(_getraenk_zeilen(_getraenk(_alter(id, von)), _getraenk(_alter(id, ziel))))
	if _hat("grabstein"):
		var a := i
		while a != j:
			a += 1 if abwaerts else -1
			if abwaerts:
				zeilen.append("W2_FAHR_MAX_0200" if a == 1 else "W2_FAHR_MAX_0210")
			elif not "W2_FAHR_MAX_0230" in zeilen:
				zeilen.append("W2_FAHR_MAX_0230")
		if ziel == "hafen_syrakus":
			zeilen.append("W2_FAHR_PIX_0220")
	if _hat("feigensetzling"):
		if abwaerts:
			zeilen.append_array(["W2_FAHR_MAX_0150", "W2_FAHR_PIX_0160"])
			Zustand.setze_wert("W2_FEIGE_ZUSTAND", "feigenbaum")
		else:
			zeilen.append_array(["W2_FAHR_MAX_0170", "W2_FAHR_PIX_0180"])
			Zustand.setze_wert("W2_FEIGE_ZUSTAND", "feigenkern")
	if _hat("feigen"):
		zeilen.append("W2_FAHR_MAX_0190")
	zeilen.append(ANKUNFT[ziel])
	await _szene(zeilen)
	Zustand.setze_wert("W2_FAEHRE_STEG", ziel)
	Zustand.setze_wert("W2_FAHRTEN", fahrten + 1)
	Spiel.herkunft_raum = "Faehre"
	await R.goto_room(Bauplan.raum_script_name(ziel))


func _getraenk_zeilen(a: int, b: int) -> Array:
	var out := []
	while a != b:
		if b > a:
			out.append(["W2_FAHR_MAX_0090", "W2_FAHR_PIX_0100"][a])
			a += 1
		else:
			out.append(["W2_FAHR_MAX_0130", "W2_FAHR_MAX_0120"][a - 1])
			a -= 1
	if b == 2 and not out.is_empty():
		out.append("W2_FAHR_MAX_0110")
	return out


## Fährtafel: Nahansicht, Max liest die drei Zeilen vor (Notizbuch Seite 2)
func ansehen_faehrtafel(obj, _x) -> bool:
	if obj is Object:
		await obj.ansehen()
	var neu := not "faehrtafel" in Zustand.nahansichten
	await Spiel.nahansicht_zeigen("faehrtafel")
	await _sag("W2_NIL_MAX_0650")
	if neu:
		await _sag("W2_NIL_PIX_0660")
	return true


## Feigensetzling ins Schilf (oder in die Erde am Ufer): lieber nicht
func gegenstand_schilf(_obj, iid) -> bool:
	if iid == "feigensetzling":
		await _sag("W2_SAND_MAX_0390")
		return true
	return false


#endregion

#region Rätsel 2a: Die Hieroglyphen-Botschaft #######################################################
func einstieg_schreiber() -> bool:
	if not _hat("bildtafel") and not Zustand.geloest("R2a"):
		await _geben("bildtafel")
	return false


func ansehen_inschrift(obj, _x) -> bool:
	await obj.ansehen()
	var neu := not "hieroglyphen_grammatik" in Zustand.nahansichten
	await Spiel.nahansicht_zeigen("hieroglyphen_grammatik")
	if neu:
		await _szene(["W2_THRO_MAX_0280", "W2_THRO_PIX_0290"])
	return true


func benutzen_inschrift(obj, x) -> bool:
	return await ansehen_inschrift(obj, x)


func benutzen_inventar_bildtafel(_obj, _x) -> bool:
	await botschaft_legen()
	return true


func kombi_bildtafel_pixel() -> bool:
	await _sag("W2_HIER_MAX_0300")
	return true


func gegenstand_schreiber(_obj, iid) -> bool:
	if iid == "bildtafel":
		await botschaft_legen()
		return true
	return false


## Vier Kacheln nacheinander; der Schreiber liest vor (Pointen nach dem ersten passenden Fall).
func botschaft_legen() -> void:
	if Zustand.geloest("R2a"):
		await Spiel.ersatz()
		return
	if _raum_id() != "thronsaal_ramses":
		await _sag("W2_HIER_MAX_0030")
		return
	var satz := []
	for feld in 4:
		var w := await Spiel.auswahl(KACHELN.map(func(k): return "UI_W2_KACHEL_" + k.to_upper()))
		if w < 0:
			return
		satz.append(KACHELN[w])
	if satz == BOTSCHAFT:
		await _szene(["W2_HIER_MAX_0250", "W2_HIER_SCH_0260", "W2_HIER_PIX_0270", "W2_HIER_SCH_0280"])
		Zustand.loese("R2a")
		await _abgeben("bildtafel")
		if Zustand.geloest("R2b"):
			await _audienz()
		return
	var pointe := []
	match satz:
		["krokodil", "katze", "pharao", "mund"]:
			pointe = ["W2_HIER_SCH_0130"]
		["mann", "katze", "pharao", "hand"]:
			pointe = ["W2_HIER_SCH_0140"]
		["mann", "pharao", "katze", "ohr"]:
			pointe = ["W2_HIER_SCH_0150", "W2_HIER_PIX_0160"]
	if pointe.is_empty():
		if satz[0] == "katze" and satz[1] == "mann":
			pointe = ["W2_HIER_PIX_0170"]
		elif "skarabaeus" in satz:
			pointe = ["W2_HIER_SCH_0180"]
		elif satz[2] == "haus":
			pointe = ["W2_HIER_SCH_0190"]
		elif satz[0] == "vogel" and satz[1] == "krokodil":
			pointe = ["W2_HIER_SCH_0200"]
		elif satz[0] == "pharao":
			pointe = ["W2_HIER_SCH_0210"]
		elif satz[3] == "sonne":
			pointe = ["W2_HIER_SCH_0220"]
		elif satz[3] == "wasser":
			pointe = ["W2_HIER_SCH_0230"]
		elif satz[3] == "mund" and satz.slice(0, 3) == BOTSCHAFT.slice(0, 3):
			pointe = ["W2_HIER_SCH_0240"]
	await _szene(["W2_HIER_SCH_0120"] + pointe)


#endregion

#region Rätsel 2b: Das Götter-Duell und die Audienz ################################################
func benutzen_hofkater(_obj, _x) -> bool:
	await _szene(["W2_DUEL_MAX_0010", "W2_DUEL_HOF_0020", "W2_DUEL_MAX_0030"])
	return true


func pixel_hofkater(_obj, _x) -> bool:
	if not Spiel.ist_pixel():
		await _sag("W2_DUEL_MAX_0360")
		return true
	if Zustand.ist("W2_DUELL"):
		await _sag("W2_DUEL_PIX_0040")
		return true
	await _szene(["W2_DUEL_PIX_0040", "W2_DUEL_HOF_0050", "W2_DUEL_PIX_0060", "W2_DUEL_HOF_0070",
		"W2_DUEL_PIX_0080", "W2_DUEL_MAX_0090", "W2_DUEL_MAX_0100"])
	Zustand.setze("W2_DUELL")
	if sobek_folgt() and R.current.has_character("Sobek"):
		await _gefolge()
	return true


func gegenstand_hofkater(_obj, iid) -> bool:
	match iid:
		"thunfischdose":
			await _opfergabe()
			return true
		"handy":
			await _sag("W2_DUEL_MAX_0340")
			_baustein("leuchtet")
			return true
		"kugelschreiber":
			await _sag("W2_DUEL_MAX_0330")
			return true
	return false


func gegenstand_opferschale(_obj, iid) -> bool:
	if iid == "thunfischdose":
		await _opfergabe()
		return true
	return false


func _opfergabe() -> void:
	if not Zustand.ist("W2_DUELL"):
		await _sag("W2_DUEL_HOF_0350")
		return
	if Zustand.ist("W2_DUELL_OPFER"):
		await Spiel.ersatz()
		return
	await _szene(["W2_DUEL_MAX_0130", "W2_DUEL_HOF_0140", "W2_DUEL_PIX_0150", "W2_DUEL_PIX_0160"])
	Zustand.setze("W2_DUELL_OPFER")
	await _duell_pruefen()


func _gefolge() -> void:
	await _szene(["W2_DUEL_MAX_0170", "W2_DUEL_HOF_0180", "W2_DUEL_PIX_0190", "W2_DUEL_SOB_0200"])
	Zustand.setze("W2_DUELL_GEFOLGE")
	await _duell_pruefen()


func ansehen_inventar_kaugummi(obj, _x) -> bool:
	if Zustand.ist("W2_DUELL") and not Zustand.geloest("R2b") and _raum_id() == "thronsaal_ramses":
		await _sag("W2_DUEL_MAX_0210")
		return true
	var z := await Spiel.ansehen(obj.bauplan().get("ansehen", []), "Gegenstand/Kaugummi")
	_baustein({"W2_INV_MAX_0030": "nie_alle", "W2_INV_MAX_0040": "klebt"}.get(z, ""))
	return true


func benutzen_inventar_kaugummi(_obj, _x) -> bool:
	if Zustand.ist("W2_DUELL") and not Zustand.ist("W2_DUELL_WUNDER") and _raum_id() == "thronsaal_ramses":
		await _szene(["W2_DUEL_MAX_0220", "W2_DUEL_NAR_0230", "W2_DUEL_HOF_0240"])
		await _abgeben("kaugummi")
		_baustein("sonne")
		await _wunder()
		return true
	return false


func benutzen_inventar_brennspiegel(_obj, _x) -> bool:
	if Zustand.ist("W2_DUELL") and not Zustand.ist("W2_DUELL_WUNDER") and _raum_id() == "thronsaal_ramses" \
			and not _hat("kaugummi"):
		await _szene(["W2_DUEL_MAX_0250", "W2_DUEL_NAR_0260"])
		await _wunder()
		return true
	return false


func _wunder() -> void:
	await _sag("W2_DUEL_RAM_0270")
	Zustand.setze("W2_DUELL_WUNDER")
	await _duell_pruefen()


func _duell_pruefen() -> void:
	if not (Zustand.ist("W2_DUELL_OPFER") and Zustand.ist("W2_DUELL_GEFOLGE") and Zustand.ist("W2_DUELL_WUNDER")):
		return
	await _szene(["W2_DUEL_NAR_0280", "W2_DUEL_HOF_0290", "W2_DUEL_PIX_0300", "W2_DUEL_MAX_0310",
		"W2_DUEL_PIX_0320"])
	Zustand.loese("R2b")
	Spiel.figur_hier("Hofkater", false)
	if Zustand.geloest("R2a"):
		await _audienz()


func _audienz() -> void:
	if audienz():
		return
	await _szene(["W2_AUDI_RAM_0010", "W2_AUDI_MAX_0020", "W2_AUDI_RAM_0030", "W2_AUDI_PIX_0040",
		"W2_AUDI_RAM_0050", "W2_AUDI_MAX_0060", "W2_AUDI_RAM_0070", "W2_AUDI_MAX_0080",
		"W2_AUDI_PIX_0090", "W2_AUDI_MAX_0095", "W2_AUDI_RAM_0100", "W2_AUDI_MAX_0110"])
	Zustand.setze("W2_AUDIENZ")


## Vor der Audienz empfängt Ramses nur schriftlich.
func benutzen_ramses(_obj, _x) -> bool:
	if not audienz():
		await _sag("W2_THRO_SCH_0050")
		return true
	return false


## Der Teller neben dem Thron ist erst nach der Audienz zu haben.
func benutzen_pharaonenteller(_obj, _x) -> bool:
	if not audienz():
		await Spiel.ersatz()
		return true
	return false


#endregion

#region Rätsel 3: Der Passierschein ################################################################
func option_beamter_1_0210() -> bool:
	await _hermes_im_buero()
	return false


func option_beamter_2_0310() -> bool:
	await _hermes_im_buero()
	return false


func _hermes_im_buero() -> void:
	if not _einmal("W2_HERMES_IM_BUERO"):
		return
	Spiel.regel_wert("zustand_anwenden", R.current)
	await _szene(["W2_BUER_HER_0330", "W2_BUER_MAX_0340", "W2_BUER_HER_0350", "W2_BUER_PIX_0360"])


func ansehen_aushang(obj, _x) -> bool:
	await obj.ansehen()
	var neu := not "aushang" in Zustand.nahansichten
	await Spiel.nahansicht_zeigen("aushang")
	if neu:
		await _szene(["W2_BUER_MAX_0090", "W2_BUER_PIX_0100"])
	return true


func kombi_kugelschreiber_leeres_formular() -> bool:
	await _sag("W2_BUER_MAX_0370")
	_baustein("schreibt")
	if not audienz():
		return true
	await _rundschreiben("mit Kugelschreiber", ["W2_BUER_MAX_0380"])
	await _abgeben("kugelschreiber")
	await _abgeben("leeres_formular")
	return true


func kombi_tintenfass_papyrusblatt() -> bool:
	await _sag("W2_BUER_MAX_0390")
	if not audienz():
		return true
	await _rundschreiben("mit Tinte", ["W2_BUER_MAX_0400"])
	await _abgeben("tintenfass")
	await _abgeben("papyrusblatt")
	return true


func gegenstand_formularberg(_obj, iid) -> bool:
	if iid == "socke" and audienz() and not Zustand.geloest("R3a") and not Zustand.geloest("R3b"):
		await _rundschreiben("gefunden", ["W2_BUER_MAX_0410", "W2_BUER_NAR_0420", "W2_BUER_MAX_0430",
			"W2_BUER_PIX_0440"])
		return true
	return false


func _rundschreiben(art: String, zeilen: Array) -> void:
	await _szene(zeilen)
	Zustand.setze_wert("W2_RUNDSCHREIBEN", art)
	await _geben("rundschreiben")
	Zustand.loese("R3a")


func gegenstand_beamter_1(obj, iid) -> bool:
	return await _schalter(obj, iid)


func gegenstand_beamter_2(obj, iid) -> bool:
	if iid == "kugelschreiber":
		await _sag("W2_BUER_BE2_0560")
		_baustein("schreibt")
		return true
	return await _schalter(obj, iid)


func _schalter(_obj, iid) -> bool:
	match iid:
		"rundschreiben":
			await _szene(["W2_BUER_MAX_0450", "W2_BUER_BE2_0460", "W2_BUER_BE1_0470", "W2_BUER_BE2_0480",
				"W2_BUER_BE1_0490", "W2_BUER_NAR_0500", "W2_BUER_BE2_0510"])
			await _abgeben("rundschreiben")
		"empfehlungsschreiben":
			await _szene(["W2_BUER_MAX_0530", "W2_BUER_BE2_0540", "W2_BUER_BE1_0550"])
			await _abgeben("empfehlungsschreiben")
		_:
			return false
	await _geben("startpass")
	Zustand.loese("R3b")
	# Hermes leiht Max gleich seine Sandalen
	Zustand.setze("W2_HERMES_IM_BUERO")
	Spiel.regel_wert("zustand_anwenden", R.current)
	await _szene(["W2_BUER_MAX_0600", "W2_BUER_HER_0610"])
	await _geben("sandalen")
	return true


#endregion

#region Rätsel 4: Das Olivenöl #####################################################################
func gegenstand_nebet(_obj, iid) -> bool:
	match iid:
		"kaugummi":
			if Zustand.geloest("R4"):
				return false
			await _szene(["W2_KUCH_MAX_0270", "W2_KUCH_NEB_0280", "W2_KUCH_NEB_0290", "W2_KUCH_PIX_0300",
				"W2_KUCH_NEB_0310"])
			await _abgeben("kaugummi")
			_baustein("nie_alle")
			await _oel()
			return true
		"fladen":
			if Zustand.wert("W2_FLADEN", "") != "mit Kruste":
				await _sag("W2_KUCH_MAX_0470")
				return true
			await _szene(["W2_KUCH_MAX_0400", "W2_KUCH_NEB_0410", "W2_KUCH_PIX_0420"])
			await _abgeben("fladen")
			await _oel()
			return true
	return false


func _oel() -> void:
	await _geben("olivenoel")
	Zustand.loese("R4")


## Pixel sagt sein Rezept an, sobald Nebet nach einem Rezept gefragt wurde (0240)
func benutzen_pixel(_obj, _x) -> bool:
	if _raum_id() == "palastkueche" and not Zustand.geloest("R4") and _option_gewaehlt("Nebet", "0230") \
			and _einmal("W2_REZEPT"):
		await _sag("W2_KUCH_PIX_0320")
		return true
	return false


func _option_gewaehlt(dialog_sn: String, id: String) -> bool:
	var d: PopochiuDialog = D.get_instance(dialog_sn)
	if not is_instance_valid(d):
		return false
	var o := d.get_option(id)
	return is_instance_valid(o) and o.used


func kombi_brot_datteln() -> bool:
	await _sag("W2_KUCH_MAX_0360")
	await _abgeben("brot")
	await _abgeben("datteln")
	Zustand.setze_wert("W2_FLADEN", "mit Datteln")
	await _geben("fladen")
	return true


func kombi_fladen_zwiebel() -> bool:
	if Zustand.wert("W2_FLADEN", "") != "mit Datteln":
		return false
	await _sag("W2_KUCH_MAX_0370")
	await _abgeben("zwiebel")
	Zustand.setze_wert("W2_FLADEN", "roh")
	return true


## Nebet wehrt ab, solange das Öl nicht verdient ist
func benutzen_oelkruege(_obj, _x) -> bool:
	if Zustand.geloest("R4"):
		return false
	await _sag("W2_KUCH_NEB_0070")
	return true


func gegenstand_lehmoefen(_obj, iid) -> bool:
	if iid == "pixel":
		await _sag("W2_KUCH_PIX_0480")
		return true
	if iid == "fladen" and Zustand.wert("W2_FLADEN", "") == "roh":
		await _szene(["W2_KUCH_MAX_0380", "W2_KUCH_PIX_0390"])
		Zustand.setze_wert("W2_FLADEN", "mit Kruste")
		return true
	return false


func kombi_olivenoel_sandalen() -> bool:
	if Zustand.ist("W2_SANDALEN_GEOELT"):
		return false
	await _szene(["W2_BUER_MAX_0630", "W2_BUER_PIX_0640"])
	Zustand.setze("W2_SANDALEN_GEOELT")
	return true


#endregion

#region Rätsel 5: Archimedes' Krone und das Training ###############################################
func option_hieron_0470() -> bool:
	if not Zustand.geloest("R5") and not _hat("krone"):
		await _geben("krone")
		await _geben("goldbarren")
	return false


func sichtbar_hieron_0470() -> Variant:
	return not Zustand.geloest("R5")


func kombi_krone_waage() -> bool:
	await _sag("W2_KRON_MAX_0040")
	Zustand.setze("W2_KRONE_AUF_WAAGE")
	return true


func kombi_goldbarren_waage() -> bool:
	if Zustand.ist("W2_KRONE_AUF_WAAGE"):
		await _szene(["W2_KRON_MAX_0050", "W2_KRON_ARC_0060"])
	else:
		await _sag("W2_KRON_MAX_0260")
	return true


func gegenstand_badewanne(_obj, iid) -> bool:
	match iid:
		"pixel":
			await _szene(["W2_KRON_MAX_0210", "W2_KRON_PIX_0220"])
			return true
		"thunfischdose":
			await _sag("W2_KRON_MAX_0230")
			return true
		"brennspiegel":
			await _sag("W2_KRON_MAX_0270")
			return true
		"krone":
			await _sag("W2_KRON_MAX_0070")
			Zustand.setze_wert("W2_GETAUCHT", "krone")
			return true
		"goldbarren":
			await _sag("W2_KRON_MAX_0090")
			Zustand.setze_wert("W2_GETAUCHT", "goldbarren")
			return true
		"messbecher":
			match Zustand.wert("W2_GETAUCHT", ""):
				"krone":
					await _sag("W2_KRON_MAX_0080")
					Zustand.setze("W2_KRONE_GEMESSEN")
				"goldbarren":
					await _sag("W2_KRON_MAX_0100")
					Zustand.setze("W2_BARREN_GEMESSEN")
				_:
					await _sag("W2_KRON_MAX_0250")
					return true
			if Zustand.ist("W2_KRONE_GEMESSEN") and Zustand.ist("W2_BARREN_GEMESSEN"):
				await _heureka()
			return true
	return false


func _heureka() -> void:
	await _szene(["W2_KRON_MAX_0110", "W2_KRON_ARC_0120", "W2_KRON_ARC_0130", "W2_KRON_HIE_0140",
		"W2_KRON_PIX_0150", "W2_KRON_MAX_0160", "W2_KRON_HIE_0170"])
	await _abgeben("krone")
	await _abgeben("goldbarren")
	Zustand.loese("R5")
	# Trainings-Szene: dreimal am Hebel, beim dritten Mal „Noch mal.“
	await _szene(["W2_TRAI_ARC_0010", "W2_TRAI_MAX_0020", "W2_TRAI_ARC_0030", "W2_TRAI_MAX_0040",
		"W2_TRAI_NAR_0050", "W2_TRAI_PIX_0060", "W2_TRAI_ARC_0070", "W2_TRAI_MAX_0080",
		"W2_TRAI_NAR_0090", "W2_TRAI_ARC_0100", "W2_TRAI_MAX_0110", "W2_TRAI_PIX_0120",
		"W2_TRAI_MAX_0130", "W2_TRAI_PIX_0140", "W2_TRAI_NAR_0150", "W2_TRAI_ARC_0160",
		"W2_TRAI_MAX_0170", "W2_TRAI_PIX_0180"])


#endregion

#region Wettkampftag 1 (R12): Sandalen-Lauf und Archimedes' Hebel ##################################
func benutzen_startlinie(_obj, _x) -> bool:
	if Zustand.geloest("R13"):
		return false
	if not _hat("startpass") and not Zustand.geloest("R12"):
		await _sag("W2_STAD_MAX_0280")
		return true
	if not Zustand.geloest("R12"):
		if Zustand.ist("W2_TAG1_LAEUFT"):
			await Spiel.ersatz()
		elif not Zustand.geloest("R5"):
			await _sag("W2_STAD_MAX_0290")
		else:
			await _tag_1()
		return true
	if not (Zustand.geloest("R7") and Zustand.geloest("R9") and Zustand.geloest("R10b")):
		await _sag("W2_STAD_MAX_0300")
		return true
	if not Zustand.geloest("R6b") and _einmal("W2_WEDLER_ERINNERT"):
		await _sag("W2_STAD_MAX_0310")
		return true
	await _finaltag()
	return true


func _tag_1() -> void:
	Zustand.setze("W2_TAG1_LAEUFT")
	Spiel.regel_wert("zustand_anwenden", R.current)
	var geoelt := Zustand.ist("W2_SANDALEN_GEOELT")
	var lauf := ["W2_TAG1_RAM_0010", "W2_TAG1_LEO_0020", "W2_TAG1_MAX_0030", "W2_TAG1_LEO_0040"]
	if geoelt:
		lauf += ["W2_TAG1_MAX_0050", "W2_TAG1_NAR_0060", "W2_TAG1_PIX_0070", "W2_TAG1_NAR_0080",
			"W2_TAG1_MAX_0090"]
	else:
		lauf += ["W2_TAG1_NAR_0100", "W2_TAG1_MAX_0110", "W2_TAG1_NAR_0060", "W2_TAG1_PIX_0120",
			"W2_TAG1_MAX_0130"]
	lauf += ["W2_TAG1_RAM_0140", "W2_TAG1_LEO_0150", "W2_TAG1_MAX_0160", "W2_TAG1_PIX_0170",
		"W2_HEBL_ARC_0010"]
	await _szene(lauf)
	await _abgeben("sandalen")
	Zustand.setze("W2_LAUF_GEOELT", geoelt)
	Zustand.setze_wert("W2_KORB", [])


## Hebel-Minispiel: Gegenstände (und Pixel) in den Korb, dann abspringen.
func gegenstand_wurfhebel(_obj, iid) -> bool:
	if not Zustand.ist("W2_TAG1_LAEUFT") or _raum_id() != "stadion":
		return false
	var korb := _liste("W2_KORB")
	if iid in korb:
		await Spiel.ersatz()
		return true
	if iid in HEBEL_KOMMENTAR:
		await _sag(HEBEL_KOMMENTAR[iid])
	else:
		await Spiel.ersatz()
		return true
	match iid:
		"thunfischdose":
			await _sag("W2_HEBL_PIX_0030")  # Pixel holt sie sofort wieder heraus
			return true
		"pixel":
			await _sag("W2_HEBL_PIX_0200")
	korb.append(iid)
	Zustand.setze_wert("W2_KORB", korb)
	return true


func pixel_wurfhebel(obj, _x) -> bool:
	if Zustand.ist("W2_TAG1_LAEUFT") and _raum_id() == "stadion":
		return await gegenstand_wurfhebel(obj, "pixel")
	return false


func benutzen_wurfhebel(_obj, _x) -> bool:
	if not Zustand.ist("W2_TAG1_LAEUFT") or _raum_id() != "stadion":
		return false
	var korb := _liste("W2_KORB")
	if not korb.is_empty():
		# Abspringen oder den Korb ausräumen
		var w := await Spiel.auswahl(["UI_W2_HEBEL_ZIEHEN", "UI_W2_KORB_LEEREN"])
		if w == 1:
			Zustand.setze_wert("W2_KORB", [])
			return true
		if w != 0:
			return true
	var gewicht := 0
	for g in korb:
		gewicht += int(GEWICHT.get(g, 0))
	var fehler := int(Zustand.wert("W2_HEBEL_FEHLER", 0))
	if gewicht >= HEBEL_MIN and gewicht <= HEBEL_MAX:
		await _szene(["W2_HEBL_NAR_0300", "W2_HEBL_ARC_0310"])
		await _tag_1_ende(true)
		return true
	if gewicht < HEBEL_MIN:
		await _szene(["W2_HEBL_NAR_0210", "W2_HEBL_MAX_0220"])
	elif fehler % 2 == 0:
		await _szene(["W2_HEBL_NAR_0230", "W2_HEBL_MAX_0240"])
	else:
		await _szene(["W2_HEBL_NAR_0250", "W2_HEBL_CIC_0260"])
	fehler += 1
	Zustand.setze_wert("W2_HEBEL_FEHLER", fehler)
	Zustand.setze_wert("W2_KORB", [])
	if fehler >= 2 and await _nachsicht("W2_HEBL_RAM_0270"):
		await _tag_1_ende(false)
	return true


## Ramses' großzügige Wertung nach zwei Fehlversuchen: true, wenn Max annimmt.
func _nachsicht(zeile: String) -> bool:
	await _sag(zeile)
	var w := await Spiel.auswahl(["W2_HEBL_MAX_0280", "W2_HEBL_MAX_0290"])
	await _sag("W2_HEBL_MAX_0280" if w == 0 else "W2_HEBL_MAX_0290")
	return w == 0


func _tag_1_ende(bestleistung: bool) -> void:
	await _szene(["W2_HEBL_RAM_0320", "W2_HEBL_LEO_0330"])
	Zustand.setze("W2_TAG1_LAEUFT", false)
	Zustand.setze_wert("W2_KORB", [])
	Zustand.loese("R12")  # setzt alle Schalter von R12; die Bestleistungen danach richtig
	Zustand.setze("W2_LAUF_BESTLEISTUNG", Zustand.ist("W2_LAUF_GEOELT"))
	Zustand.setze("W2_HEBEL_BESTLEISTUNG", bestleistung)
	Spiel.regel_wert("zustand_anwenden", R.current)
	# Nach Tag 1 findet Max Schallplatte und Wurfscheibe in seinen Taschen; der Diskus ist weg.
	await _geben("schallplatte")
	await _geben("wurfscheibe")
	await _szene(["W2_DISK_LEO_0010", "W2_DISK_MAX_0020", "W2_DISK_PIX_0030"])


#endregion

#region Rätsel 6: Das Zeichen der Sandale und die Feigen ###########################################
func pixel_hohe_saeule_mit_adler(_obj, _x) -> bool:
	return await _sandale_angeln()


func pixel_sandale_auf_der_saeule(_obj, _x) -> bool:
	return await _sandale_angeln()


func _sandale_angeln() -> bool:
	if not Spiel.ist_pixel() or not Zustand.geloest("R12") or Zustand.geloest("R6a") or _hat("sandale"):
		return false
	await _szene(["W2_SAND_PIX_0130", "W2_SAND_NAR_0140", "W2_SAND_PIX_0150"])
	await _geben("sandale")
	return true


func benutzen_inventar_sandale(_obj, _x) -> bool:
	if Zustand.geloest("R6a") or _raum_id() != "agora":
		return false
	await _szene(["W2_SAND_MAX_0160", "W2_SAND_TOU_0170", "W2_SAND_MAX_0180", "W2_SAND_GRI_0190",
		"W2_SAND_MAX_0200", "W2_SAND_TOU_0210", "W2_SAND_PIX_0220", "W2_SAND_BRI_0230"])
	await _geben("brians_schild")
	await _sag("W2_SAND_NAR_0250")
	Zustand.setze_wert("W2_FEIGE_ZUSTAND", "setzling")
	await _geben("feigensetzling")
	Zustand.loese("R6a")
	Spiel.figur_hier("Brian", false)
	return true


func benutzen_inventar_feigensetzling(_obj, _x) -> bool:
	if Zustand.wert("W2_FEIGE_ZUSTAND", "") != "feigenbaum" or _hat("feigen"):
		return false
	await _szene(["W2_SAND_MAX_0300", "W2_SAND_PIX_0310"])
	await _geben("feigen")
	return true


func gegenstand_faecherwedler(_obj, iid) -> bool:
	match iid:
		"feigen":
			if Zustand.geloest("R6b") or Zustand.geloest("R13"):
				return false
			await _szene(["W2_SAND_MAX_0330", "W2_SAND_FAW_0340", "W2_SAND_PIX_0350"])
			await _abgeben("feigen")
			Zustand.loese("R6b")
			return true
		"feigensetzling":
			var z: String = _zustand_gegenstand("feigensetzling")
			await _sag({"Feigensetzling": "W2_SAND_FAW_0280", "Feigenbaum": "W2_SAND_MAX_0380",
				"Feigenkern": "W2_SAND_FAW_0370"}[z])
			return true
	return false


func benutzen_faecherwedler(_obj, _x) -> bool:
	if not Zustand.geloest("R6b"):
		await _sag("W2_THRO_FAW_0160")
		return true
	return false


#endregion

#region Rätsel 7: Der Diskus-Diebstahl #############################################################
func _diskus_offen() -> bool:
	return Zustand.geloest("R12") and not Zustand.geloest("R7")


func benutzen_leonidas(_obj, _x) -> bool:
	return await _verdaechtiger("leonidas")


func benutzen_hermes(_obj, _x) -> bool:
	return await _verdaechtiger("hermes")


func benutzen_tiro(_obj, _x) -> bool:
	if await _verdaechtiger("tiro"):
		return true
	return await _reden_kurz("tiro")


func benutzen_sphinx_figur(_obj, _x) -> bool:
	return await _verdaechtiger("sphinx_figur")


## Verhör beim ersten Ansprechen, danach: anklagen, reden oder (bei Leonidas) einen Ersatz nehmen.
func _verdaechtiger(id: String) -> bool:
	if not _diskus_offen():
		return false
	var v: Dictionary = VERDAECHTIGE[id]
	if _einmal("W2_VERHOERT_" + id.to_upper()):
		await _szene(v.verhoer)
		return true
	var texte := ["UI_W2_ANKLAGEN", "UI_W2_REDEN"]
	if id == "leonidas":
		texte.append("W2_DISK_MAX_0340")
	texte.append("UI_W2_DOCH_NICHT")
	var w := await Spiel.auswahl(texte)
	match texte[w] if w >= 0 else "":
		"UI_W2_ANKLAGEN":
			if id == "tiro":
				await _szene(["W2_DISK_MAX_0270", "W2_DISK_TIR_0280", "W2_DISK_PIX_0290"])
				await _geben("diskus")
				Zustand.loese("R7")
			else:
				await _szene(v.anklage)
			return true
		"W2_DISK_MAX_0340":
			await _sag("W2_DISK_MAX_0340")
			Zustand.setze("W2_DISKUS_ERSATZ")
			Zustand.loese("R7")
			return true
		"UI_W2_REDEN":
			return false
	return true


func _pixel_auf_figur(id: String) -> bool:
	if _diskus_offen() and id in VERDAECHTIGE:
		await _szene(VERDAECHTIGE[id].nase)
		return true
	if id in PIXEL_AUF:
		await _sag(PIXEL_AUF[id])
		return true
	return false


func _reden_kurz(id: String) -> bool:
	if id in REDEN:
		await _szene(REDEN[id])
		return true
	return false


#endregion

#region Rätsel 8: Die Sphinx mit Schreibblockade ###################################################
func einstieg_faehrmann() -> bool:
	_baustein("stirbt")
	return false


func ansehen_inventar_handy(obj, _x) -> bool:
	var z := await Spiel.ansehen(obj.bauplan().get("ansehen", []), "Gegenstand/Handy")
	_baustein({"W2_INV_MAX_0010": "klingelt", "W2_INV_MAX_0020": "leuchtet"}.get(z, ""))
	return true


func ansehen_inventar_kugelschreiber(obj, _x) -> bool:
	var z := await Spiel.ansehen(obj.bauplan().get("ansehen", []), "Gegenstand/Kugelschreiber")
	_baustein({"W2_INV_MAX_0050": "schreibt", "W2_INV_MAX_0060": "klickt"}.get(z, ""))
	return true


func gegenstand_tiro(_obj, iid) -> bool:
	if iid == "kugelschreiber":
		await _sag("W2_AGOR_TIR_0380")
		_baustein("blau")
		return true
	return false


## Schriftrolle ansehen; steht Max dabei vor der Sphinx, ergänzt sie einmal (0550).
func ansehen_inventar_schriftrolle(obj, _x) -> bool:
	if obj is Object:
		await Spiel.ansehen(obj.bauplan().get("ansehen", []), "Gegenstand/Schriftrolle")
	if _raum_id() == "sphinx" and not Zustand.geloest("R9") and _einmal("W2_ROLLE_BEI_SPHINX"):
		await _sag("W2_SPHX_SPH_0550")
	return true


func gegenstand_sphinx_figur(_obj, iid) -> bool:
	if iid in ["handy", "kaugummi", "kugelschreiber"]:
		await _sag("W2_SPHX_MAX_0560")
		return true
	return false


## „Ich stell dir ein Rätsel“: Wort wählen, dann drei Bausteine aus dem Notizbuch.
func option_sphinx_figur_0250() -> bool:
	if Zustand.geloest("R8"):
		await Spiel.ersatz()
		return false
	var woerter := ["handy", "kaugummi", "kugelschreiber"]
	var w := await Spiel.auswahl(woerter.map(func(x): return "UI_OBJ_" + x.to_upper()) + ["UI_W2_DOCH_NICHT"])
	if w < 0 or w >= woerter.size():
		return false
	var wort: String = woerter[w]
	var vorrat := _liste("W2_BAUSTEINE")
	if vorrat.size() < 3:
		await Spiel.ersatz()
		return false
	var gelegt := []
	for n in 3:
		var b := await Spiel.auswahl(vorrat.map(func(x): return "UI_W2_BAUSTEIN_" + x.to_upper()))
		if b < 0:
			return false
		gelegt.append(vorrat[b])
		vorrat.remove_at(b)
	for b in gelegt:
		if not b in BAUSTEINE[wort]:
			await _sag("W2_SPHX_SPH_" + SPHINX_FALSCH[wort][b])
			var n := Zustand.ansehen_zaehlen("W2_SPHINX_FEHLVERSUCHE")
			if n % 3 == 0:
				await _sag("W2_SPHX_PIX_0440")
			return false
	await _szene(["W2_SPHX_SPH_" + SPHINX_RICHTIG[wort][0], "W2_SPHX_SPH_0480"])
	await _geben("schriftrolle")
	Zustand.loese("R8")
	_konter([1, 2, 3])
	await _szene(["W2_SPHX_MAX_" + SPHINX_RICHTIG[wort][1], "W2_SPHX_SPH_0520", "W2_SPHX_PIX_0530"])
	return false


## Empfehlungsschreiben (Weg C): nach Rätsel 8, solange der Startpass noch fehlt
func sichtbar_sphinx_figur_0210() -> Variant:
	return Zustand.geloest("R8") and not Zustand.geloest("R3b") and not _hat("empfehlungsschreiben")


func option_sphinx_figur_0210() -> bool:
	await _geben("empfehlungsschreiben")
	return false


#endregion

#region Rätsel 9: Konter sammeln ###################################################################
func einstieg_grieche() -> bool:
	_konter([4])
	return false


func option_grieche_0420() -> bool:
	_konter([5])
	return false


func benutzen_menge(_obj, _x) -> bool:
	var d: PopochiuDialog = D.get_instance("Grieche")
	if is_instance_valid(d):
		await d.start()
		return true
	return false


func pixel_tonne(_obj, _x) -> bool:
	if not Spiel.ist_pixel() or 6 in _liste("W2_KONTER"):
		return false
	await _szene(["W2_AGOR_PIX_0480", "W2_AGOR_PHI_0490", "W2_AGOR_NAR_0500", "W2_AGOR_PIX_0510",
		"W2_AGOR_MAX_0520", "W2_AGOR_PHI_0530"])
	_konter([6, 7])
	return true


#endregion

#region Rätsel 10: Ein Grab für Archimedes #########################################################
func option_cicero_0250() -> bool:
	Zustand.setze("W2_CICERO_FORDERUNG")
	return false


func option_archimedes_0410() -> bool:
	if not _hat("entwurf") and not Zustand.geloest("R10a"):
		await _geben("entwurf")
	return false


func sichtbar_archimedes_0410() -> Variant:
	return Zustand.geloest("R5") and Zustand.ist("W2_CICERO_FORDERUNG") and Zustand.geloest("R12") \
		and not Zustand.geloest("R10a") and not _hat("entwurf")


## Ohne Entwurf bestellt Max „irgendwas“ und bekommt einen zerbröselten Haufen (Gag).
func benutzen_steinmetz(_obj, _x) -> bool:
	if Zustand.ist("W2_CICERO_FORDERUNG") and not Zustand.geloest("R10a") and not _hat("entwurf") \
			and _einmal("W2_HAUFEN_BESTELLT"):
		await _szene(["W2_GRAB_MAX_0030", "W2_GRAB_STM_0040"])
		await _geben("haufen")
		return true
	return false


func gegenstand_steinmetz(_obj, iid) -> bool:
	if iid != "entwurf":
		return false
	var zeilen := ["W2_GRAB_MAX_0010"]
	if _hat("haufen"):
		zeilen.append("W2_GRAB_STM_0070")
		await _abgeben("haufen")
	zeilen.append("W2_GRAB_STM_0020")
	await _szene(zeilen)
	await _abgeben("entwurf")
	await _geben("grabstein")
	Zustand.loese("R10a")
	return true


func gegenstand_sockel(_obj, iid) -> bool:
	match iid:
		"grabstein":
			if _zustand_gegenstand("grabstein") != "verwittert":
				await _sag("W2_GRAB_MAX_0090")
				return true
			var raum: CQRaum = R.current
			for sn in ["Cicero", "Archimedes"]:
				var m: String = sn
				Spiel.figur_hier(sn, true, raum.get_marker_position(m) if raum.has_marker(m) else Vector2.INF)
			await _szene(["W2_GRAB_MAX_0160", "W2_GRAB_CIC_0170", "W2_GRAB_ARC_0180", "W2_GRAB_CIC_0190",
				"W2_GRAB_PIX_0200", "W2_GRAB_ARC_0210", "W2_GRAB_MAX_0215"])
			await _abgeben("grabstein")
			Zustand.loese("R10b")
			for sn in ["Cicero", "Archimedes"]:
				Spiel.figur_hier(sn, false)
			return true
		"haufen":
			await _sag("W2_GRAB_CIC_0240")
			return true
		"pixel":
			await _sag("W2_GRAB_MAX_0260")
			return true
	return false


#endregion

#region Finaltag (R13): Speer, Diskus, Rede-Ringen ##################################################
func _finaltag() -> void:
	var bestochen := Zustand.geloest("R6b")
	var speer := ["W2_FINA_RAM_0010", "W2_FINA_MAX_0020"]
	if bestochen:
		speer += ["W2_FINA_FAW_0030", "W2_FINA_NAR_0040", "W2_FINA_LEO_0050", "W2_FINA_MAX_0060"]
	else:
		speer += ["W2_FINA_NAR_0070", "W2_FINA_LEO_0050", "W2_FINA_MAX_0080"]
	speer += ["W2_FINA_PIX_0090", "W2_FINA_RAM_0100", "W2_FINA_MAX_0110", "W2_FINA_NAR_0120",
		"W2_FINA_MAX_0130", "W2_FINA_PIX_0140", "W2_FINA_MAX_0150"]
	await _szene(speer)
	# Nasen-Diskus: Wurfgegenstand wählen
	var geraete: Array = WURFGERAETE.filter(func(g): return _hat(g))
	var wahl := 0
	if geraete.size() > 1:
		wahl = maxi(0, await Spiel.auswahl(geraete.map(func(g): return "UI_OBJ_" + g.to_upper())))
	var geraet: String = geraete[wahl] if not geraete.is_empty() else "schallplatte"
	await _szene([{"diskus": "W2_FINA_NAR_0160", "wurfscheibe": "W2_FINA_NAR_0160",
		"pharaonenteller": "W2_FINA_NAR_0170", "schallplatte": "W2_FINA_NAR_0180"}[geraet], "W2_FINA_RAM_0190"])
	var nachsicht := await _rede_ringen()
	Zustand.loese("R13")  # setzt alle Schalter von R13; die Bestleistungen danach richtig
	Zustand.setze("W2_SPEER_BESTLEISTUNG", bestochen)
	Zustand.setze("W2_DISKUS_BESTLEISTUNG", geraet in ["diskus", "wurfscheibe"])
	Zustand.setze("W2_RINGEN_BESTLEISTUNG", not nachsicht)
	if fuenfkampf():
		await _sag("W2_RING_PIX_0290")
	Spiel.regel_wert("zustand_anwenden", R.current)
	# Parade: das Volk will Brot und Spiele
	await _szene(["W2_PARA_VOL_0010", "W2_PARA_VOL_0020", "W2_PARA_RAM_0030", "W2_PARA_ZER_0040"])
	await _geben("paraden_plan")


## Rede-Ringen: Cicero steht auf der Linie seiner Beleidigung; ein Treffer schiebt ihn eine
## Linie weiter, ein Fehlversuch eine zurück. Falsche Konter bleiben je Linie ausgegraut (hier:
## nicht mehr angeboten). Liefert true, wenn Max Ramses' großzügige Wertung angenommen hat.
func _rede_ringen() -> bool:
	await _szene(["W2_RING_CIC_0010", "W2_RING_MAX_0020"])
	var linie := 1
	var fehler := 0
	var gesperrt := {}
	var konter := _liste("W2_KONTER")
	var nachsicht := false
	while linie <= 5:
		await _sag(BELEIDIGUNG[linie])
		var angebot: Array = konter.filter(func(k): return not k in gesperrt.get(linie, []))
		if angebot.is_empty():
			angebot = konter
		var w := await Spiel.auswahl(angebot.map(func(k): return KONTER_ZEILE[k]))
		var k: int = angebot[maxi(w, 0)]
		await _sag(KONTER_ZEILE[k])
		if k in PASSEND[linie]:
			if k == 4:
				await _sag("W2_RING_CIC_0120")
			elif k == 5:
				await _sag("W2_RING_CIC_0160")
			linie += 1
			continue
		gesperrt[linie] = gesperrt.get(linie, []) + [k]
		await _szene(["W2_RING_CIC_0180", "W2_RING_NAR_0190", "W2_RING_PIX_0200", "W2_RING_MAX_0210"])
		linie = maxi(1, linie - 1)
		fehler += 1
		if fehler == 2 and await _nachsicht("W2_RING_RAM_0220"):
			nachsicht = true
			break
	await _szene(["W2_RING_NAR_0230", "W2_RING_CIC_0240", "W2_RING_MAX_0250", "W2_RING_PIX_0260",
		"W2_RING_RAM_0270"])
	await _geben("olivenkranz")
	return nachsicht


func fuenfkampf() -> bool:
	for s in ["W2_LAUF_BESTLEISTUNG", "W2_HEBEL_BESTLEISTUNG", "W2_SPEER_BESTLEISTUNG",
			"W2_DISKUS_BESTLEISTUNG", "W2_RINGEN_BESTLEISTUNG"]:
		if not Zustand.ist(s):
			return false
	return true


#endregion

#region Rätsel 11: Die Siegesparade und der Wein ###################################################
func benutzen_inventar_paraden_plan(_obj, _x) -> bool:
	await parade_planen()
	return true


func gegenstand_zeremonienmeister(_obj, iid) -> bool:
	if iid == "paraden_plan":
		await parade_planen()
		return true
	return false


func parade_planen() -> void:
	if Zustand.geloest("R11a") or _raum_id() != "stadion":
		await Spiel.ersatz()
		return
	var frei := PARADE.duplicate()
	var plan := []
	for feld in 4:
		var w := await Spiel.auswahl(frei.map(func(p): return PARADE_TEXT[p]))
		if w < 0:
			return
		plan.append(frei[w])
		frei.remove_at(w)
	var zeilen := []
	for feld in 4:
		match plan[feld]:
			"hermes":
				zeilen.append("W2_PARA_HER_0060" if feld == 0 else "W2_PARA_HER_0070")
			"brennspiegel":
				zeilen.append("W2_PARA_ARC_0080" if feld == 1 else "W2_PARA_ARC_0090")
			"cicero":
				zeilen.append(["W2_PARA_CIC_0110", "W2_PARA_CIC_0110", "W2_PARA_CIC_0100", "W2_PARA_CIC_0120"][feld])
			"pixel":
				zeilen.append("W2_PARA_PIX_0130" if feld == 3 else "W2_PARA_PIX_0140")
	await _szene(zeilen)
	if plan != PARADE:
		return
	if not _hat("brennspiegel"):
		await _sag("W2_PARA_ARC_0090")  # ohne Spiegel aus der Werkstatt kein Licht
		return
	await _szene(["W2_PARA_ZER_0150", "W2_PARA_RAM_0160"])
	Zustand.loese("R11a")


func gegenstand_ramses(_obj, iid) -> bool:
	if not Zustand.geloest("R11a") or Zustand.geloest("R11b"):
		return false
	if not iid in ["traubensaft", "essigkrug"]:
		return false
	var z: String = _zustand_gegenstand(iid)
	match z:
		"Wein":
			await _szene(["W2_PARA_MAX_0170", "W2_PARA_RAM_0180"])
			await _abgeben(iid)
			Zustand.loese("R11b")
			await _abschluss()
		"Essig":
			await _szene(["W2_PARA_RAM_0190", "W2_PARA_PIX_0210"])
		_:
			await _szene(["W2_PARA_RAM_0200", "W2_PARA_PIX_0210"])
	return true


## Parade, Goldener Sack, Abschied und Übergang ins Zwischenspiel 2
func _abschluss() -> void:
	var alle_drei := _hat("handy") and _hat("kaugummi") and _hat("kugelschreiber")
	var zeilen := ["W2_PARA_NAR_0220", "W2_PARA_VOL_0230"]
	if _hat("handy"):
		zeilen += ["W2_PARA_MAX_0240", "W2_PARA_NAR_0250"]
	if alle_drei:
		zeilen.append("W2_PARA_PIX_0260")
	zeilen.append("W2_PARA_RAM_0270")
	await _szene(zeilen)
	Zustand.setze("W2_WUNDERDINGE_BEHALTEN", alle_drei)
	if _hat("handy"):
		await _abgeben("handy")
	await _geben("goldener_sack")
	zeilen = ["W2_PARA_PIX_0300", "W2_PARA_MAX_0310", "W2_PARA_PIX_0320"]
	if int(Zustand.stufe3_zaehler.get("welt-2", 0)) == 0:
		zeilen.append("W2_PARA_PIX_0330")
	zeilen += ["W2_PARA_HER_0340", "W2_PARA_ARC_0350", "W2_PARA_MAX_0360"]
	await _szene(zeilen)
	Zustand.setze("W2_GESCHAFFT")
	await Spiel.zwischenspiel_beginnen(2)


#endregion
