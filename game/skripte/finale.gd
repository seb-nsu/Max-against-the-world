extends RefCounted
## Regeln des Finales (raetsel/finale.md, skript/zwischenspiele-und-finale.md, Abschnitte 4 bis 10).
##
## Abschnitt „finale“ umfasst auch die Zwischenspiele; deren Ablauf steht im Raumskript des
## Dachbodens. Diese Regeln greifen nur im Finale (Schalter FINALE, Spiel.finale_beginnen()).
##
## Ablauf: Heimkehr (Szene) → Stufe 1, verriegelt (Schritt 0: Bodenluke) → Hilferuf (vier Kanäle
## am Drehknopf, Zeldina und mit FREUND_0815 Modell 08/15 kommen heraus) → letztes Rätsel
## (A Riegel, B Ofentür, C Zündkapsel, D rote Taste) → Auflösung → Wohnzimmer (Geburtstag) →
## Abspann-Szene, Supermarkt, Abspann → Hauptmenü.
##
## Graubox: Die Zeitsteuerung der Zurufe (alle 15 Sekunden, Oma nach 30 und 60 Sekunden, Mutter
## nach 60 Sekunden) ist durch Klicks ersetzt: Opa ruft bei jedem Klick den nächsten Satz, Oma ruft
## nach dem zweiten und dritten, die Mutter kommt nach dem ersten Gespräch mit Oma oder Opa.

#region Konstanten ################################################################################
const HEIMKEHR := ["FI_DACH_NAR_0010", "FI_DACH_PIX_0020", "FI_DACH_MAX_0030", "FI_DACH_OPA_0040",
	"FI_DACH_MAX_0050", "FI_DACH_OPA_0060", "FI_DACH_OPA_0070", "FI_DACH_NAR_0080", "FI_DACH_OPA_0090",
	"FI_DACH_OPA_0100", "@fernbedienung", "FI_DACH_NAR_0110", "FI_DACH_OPA_0120", "FI_DACH_MAX_0130",
	"FI_DACH_OPA_0140", "FI_DACH_MAX_0150", "FI_DACH_PIX_0160", "FI_DACH_MAX_0170", "FI_DACH_PIX_0180",
	"FI_DACH_NAR_0190", "FI_DACH_OPA_0200", "FI_DACH_NAR_0210", "FI_DACH_OMA_0220", "FI_DACH_OPA_0230",
	"FI_DACH_NAR_0240", "FI_DACH_OPA_0250", "FI_DACH_MAX_0260", "FI_DACH_OPA_0270", "FI_DACH_MAX_0280"]

## Opas Zurufe in Stufe 1 (in Schleife), Pixels Reaktion nach den ersten beiden
const OPA_RUFE := [["FI_RIEG_OPA_0010", "FI_RIEG_PIX_0040"], ["FI_RIEG_OPA_0020", "FI_RIEG_PIX_0050"],
	["FI_RIEG_OPA_0030"]]

## Hilferuf: Kanal → Zeilen; „+“-Zeilen nur mit FREUND_0815, „-“-Zeilen nur ohne
const KANAELE := {
	"3": ["FI_RUF_MAX_0030", "FI_RUF_ZEL_0040", "FI_RUF_TOA_0050", "@zeldina", "FI_RUF_NAR_0060",
		"FI_RUF_ZEL_0070", "FI_RUF_MAX_0080", "FI_RUF_ZEL_0090", "FI_RUF_PIX_0100"],
	"7": ["FI_RUF_MAX_0110", "FI_RUF_ARC_0120", "FI_RUF_RAM_0130", "FI_RUF_HER_0140", "FI_RUF_MAX_0150"],
	"42": ["FI_RUF_MAX_0160", "+FI_RUF_HAU_0170", "+@roboter", "+FI_RUF_NAR_0180", "+FI_RUF_HAU_0190",
		"-FI_RUF_KAL_0200", "-FI_RUF_MAX_0210", "-FI_RUF_KAL_0220", "-FI_RUF_PIX_0230"],
	"999": ["FI_RUF_MAX_0240", "FI_RUF_FLI_0250", "FI_RUF_GER_0260", "FI_RUF_MAX_0270", "FI_RUF_NAR_0280",
		"FI_RUF_MAX_0290"],
}
const KANAL_TEXTE := {"3": "UI_FI_KANAL_3", "7": "UI_FI_KANAL_7", "42": "UI_FI_KANAL_42", "999": "UI_FI_KANAL_999"}

## Tasten der Zündkapsel am Empfänger (Schritt D)
const TASTEN := ["UI_FI_TASTE_LAUTER", "UI_FI_TASTE_PROGRAMM", "UI_FI_TASTE_STUMM", "UI_FI_TASTE_ROT"]
const TASTE_FEHL := [["FI_RAET_NAR_0290", "FI_RAET_OPA_0300"], ["FI_RAET_NAR_0310", "FI_RAET_PIX_0320"],
	["FI_RAET_NAR_0330", "FI_RAET_PIX_0340"]]

const FINALE_OBJEKTE := ["maschine", "ofentuer", "druckmesser", "fassungen", "empfaenger"]

## Ansehen im Finale: Objekt → [erste Zeile, zweite Zeile]
const ANSEHEN := {
	"bodenluke": ["FI_RIEG_MAX_0080", "FI_RIEG_MAX_0085"], "maschine": ["FI_RIEG_MAX_0110", "FI_RIEG_MAX_0115"],
	"ofentuer": ["FI_RIEG_MAX_0120", "FI_RIEG_PIX_0125"], "druckmesser": ["FI_RIEG_MAX_0140", "FI_RIEG_MAX_0145"],
	"fassungen": ["FI_RIEG_MAX_0150", "FI_RIEG_MAX_0155"], "empfaenger": ["FI_RIEG_MAX_0160", "FI_RIEG_MAX_0165"],
	"opa": ["FI_RIEG_MAX_0170", "FI_RIEG_MAX_0175"], "dachfenster": ["FI_RIEG_MAX_0200", "FI_RIEG_MAX_0205"],
	"zapp_o_mat": ["FI_RIEG_MAX_0220", "FI_RIEG_MAX_0225"],
	"kuchen": ["FI_WOHN_MAX_0070", "FI_WOHN_MAX_0075"], "girlande": ["FI_WOHN_MAX_0080", "FI_WOHN_MAX_0085"],
	"geschenke": ["FI_WOHN_MAX_0090", "FI_WOHN_MAX_0095"], "familienfoto": ["FI_WOHN_MAX_0100", "FI_WOHN_MAX_0105"],
	"sofa": ["FI_WOHN_MAX_0110", "FI_WOHN_PIX_0115"], "fernseher": ["FI_WOHN_MAX_0120", "FI_WOHN_MAX_0125"],
	"leerer_platz_auf_dem_couchtisch": ["FI_WOHN_MAX_0130", "FI_WOHN_MAX_0135"],
	"zeldina": ["FI_WOHN_PIX_0140", "FI_WOHN_PIX_0145"], "modell_0815": ["FI_WOHN_MAX_0150", "FI_WOHN_MAX_0155"],
	"modell0815": ["FI_WOHN_MAX_0150", "FI_WOHN_MAX_0155"],
}
## Ansehen-Zeilen, die nur in einem Raum gelten
const ANSEHEN_RAUM := {"kuchen": "wohnzimmer", "girlande": "wohnzimmer", "geschenke": "wohnzimmer",
	"familienfoto": "wohnzimmer", "sofa": "wohnzimmer", "fernseher": "wohnzimmer",
	"leerer_platz_auf_dem_couchtisch": "wohnzimmer", "zeldina": "wohnzimmer", "modell_0815": "wohnzimmer",
	"modell0815": "wohnzimmer"}
#endregion


func _init() -> void:
	# Schritt C: Pixel bringt die Zelle im Maul; beim Wechsel zurück zu Max kommt sie ins Inventar
	if not Spiel.figur_gewechselt.is_connected(_figur_gewechselt):
		Spiel.figur_gewechselt.connect(_figur_gewechselt)


#region Verteiler ##################################################################################
func ereignis(art: String, obj: Variant, item: Variant) -> bool:
	if not Zustand.ist("FINALE"):
		return false  # Zwischenspiele: Raumskript des Dachbodens
	var oid := _id(obj)
	var iid = _id(item) if item is Object else item
	if art == "kombinieren":
		for m in ["kombi_%s_%s" % [oid, iid], "kombi_%s_%s" % [iid, oid]]:
			if has_method(m):
				return bool(await call(m))
		return false
	if art == "ansehen" and ANSEHEN.has(oid) and ANSEHEN_RAUM.get(oid, "dachboden") == _raum_id():
		await _ansehen(oid)
		return true
	var name := "%s_%s" % [art, oid]
	if has_method(name):
		return bool(await call(name, obj, iid))
	return false


func wert(art: String, obj: Variant, _item: Variant) -> Variant:
	if not Zustand.ist("FINALE"):
		return null
	match art:
		"zustand":
			match _id(obj):
				"goldene_fernbedienung":
					return str(Zustand.wert("FI_FERNBEDIENUNG", "golden"))
				"energiezelle":
					return "batterie"
				"omas_kekse":
					return "hundekuchen"
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
		schritte.append(z if z is Callable else Spiel.z(z.split("_")[2], z))
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


func _zaehle(name: String) -> int:
	var n := int(Zustand.wert(name, 0)) + 1
	Zustand.setze_wert(name, n)
	return n


## Wie oft ein Objekt im Finale angesehen wurde (Wert FI_ANSEHEN: Objekt → Zahl), einschließlich jetzt.
func _angesehen(oid: String) -> int:
	var d: Dictionary = (Zustand.wert("FI_ANSEHEN", {}) as Dictionary).duplicate()
	d[oid] = int(d.get(oid, 0)) + 1
	Zustand.setze_wert("FI_ANSEHEN", d)
	return d[oid]


func _g(id: String) -> bool:
	return Zustand.geloest(id)


func _ansehen(oid: String) -> void:
	var n := _angesehen(oid)
	await _sag(ANSEHEN[oid][1 if n > 1 else 0])
	if oid == "zapp_o_mat" and Zustand.ist("LUKE_ERKANNT") and not Zustand.ist("FI_HILFERUF"):
		await _sag("FI_RIEG_PIX_0230")


func _figuren_anwenden(raum: CQRaum) -> void:
	var rid := raum.raum_id()
	var robo := Zustand.ist("FREUND_0815")
	var plan := {
		"Opa": rid in ["dachboden", "wohnzimmer"],
		"Zeldina": (rid == "dachboden" and Zustand.ist("FI_ZELDINA_DA")) or rid == "wohnzimmer",
		"Modell0815": robo and ((rid == "dachboden" and Zustand.ist("FI_ROBOTER_DA")) or rid == "wohnzimmer"),
		"Oma": rid == "wohnzimmer",
		"Mutter": rid == "wohnzimmer" and Zustand.ist("FI_MUTTER_DA"),
	}
	for sn in plan:
		if not is_instance_valid(C.get_character(sn)):
			continue
		var pos := Vector2.INF
		if plan[sn] and not raum.has_character(sn):
			pos = raum.get_marker_position(sn) if raum.has_marker(sn) else Vector2(140 + 40 * plan.keys().find(sn), 230)
		Spiel.figur_hier(sn, plan[sn], pos)
#endregion

#region Heimkehr und Stufe 1 #######################################################################
func nach_uebergang_dachboden(_raum, _x) -> bool:
	if Zustand.ist("FI_HEIMKEHR"):
		return false
	Zustand.setze("FI_HEIMKEHR")
	var schritte := []
	for z in HEIMKEHR:
		schritte.append(_fernbedienung_abgeben if z == "@fernbedienung" else z)
	await _szene(schritte)
	await _fernbedienung_abgeben()  # falls übersprungen
	await _opa_ruft()
	Spielstand.autospeichern()
	return true


## Max gibt Opa die Goldene Fernbedienung; Opa schiebt die Zelle hinein (Zündkapsel).
func _fernbedienung_abgeben() -> void:
	await _abgeben("goldene_fernbedienung")
	Zustand.setze_wert("FI_FERNBEDIENUNG", "grau_ohne_zelle")


func _opa_ruft() -> void:
	var n := _zaehle("FI_OPA_RUFE")
	await _szene(OPA_RUFE[(n - 1) % OPA_RUFE.size()] if n <= OPA_RUFE.size() else [OPA_RUFE[(n - 1) % OPA_RUFE.size()][0]])
	if n == 2:
		await _sag("FI_RIEG_OMA_0060")
	elif n == 3:
		await _sag("FI_RIEG_OMA_0070")


func benutzen_opa(_obj, _x) -> bool:
	if _raum_id() == "wohnzimmer":
		return await _opa_wohnzimmer()
	if _raum_id() != "dachboden" or _g("F1d"):
		return false
	await _opa_ruft()
	return true


## Schritt 0: Die Luke ist verriegelt; danach der Hilferuf über den Zapp-O-Mat.
func ausgang_bodenluke(_obj, _x) -> bool:
	if _g("F1d"):
		return false
	await _sag("FI_RIEG_MAX_0090")
	if not Zustand.ist("LUKE_ERKANNT"):
		Zustand.loese("F1")
		await _sag("FI_RIEG_PIX_0100")
		await _hilferuf()
	return true


func benutzen_maschine(_obj, _x) -> bool:
	await _szene(["FI_RIEG_MAX_0180", "FI_RIEG_OPA_0190"])
	return true


func benutzen_dachfenster(_obj, _x) -> bool:
	await _sag("FI_RIEG_MAX_0210")
	return true


## Omas Kekse in der Fundkiste (Bonus-Gag F2)
func _kekse_in_fundkiste() -> bool:
	return Bauplan.gegenstand_script_name("omas_kekse") in Zustand.wert("FUNDKISTE", [])


func ansehen_fundkiste(_obj, _x) -> bool:
	var zweites := _angesehen("fundkiste") > 1
	if _kekse_in_fundkiste():
		await _sag("FI_RIEG_PIX_0255" if zweites else "FI_RIEG_MAX_0250")
	else:
		await _sag("FI_RIEG_MAX_0285" if zweites else "FI_RIEG_MAX_0280")
	return true


func benutzen_fundkiste(_obj, _x) -> bool:
	if not _kekse_in_fundkiste():
		return false
	var kiste: Array = (Zustand.wert("FUNDKISTE", []) as Array).duplicate()
	kiste.erase(Bauplan.gegenstand_script_name("omas_kekse"))
	Zustand.setze_wert("FUNDKISTE", kiste)
	await _sag("FI_RIEG_MAX_0260")
	await _geben("omas_kekse")
	Zustand.loese("F2")
	await _sag("FI_RIEG_PIX_0270")
	return true
#endregion

#region Hilferuf ###################################################################################
## Vier Kanäle am Drehknopf, jeder einmal; die Auswahl bleibt offen, bis alle dran waren.
func _hilferuf() -> void:
	await _szene(["FI_RUF_PIX_0010", "FI_RUF_MAX_0020"])
	var robo := Zustand.ist("FREUND_0815")
	while true:
		var offen := KANAELE.keys().filter(func(k): return not k in _liste("FI_KANAELE"))
		if offen.is_empty():
			break
		var wahl := await Spiel.auswahl(offen.map(func(k): return KANAL_TEXTE[k]))
		if wahl < 0:
			wahl = 0
		var k: String = offen[wahl]
		var schritte := []
		for z in KANAELE[k]:
			var zeile: String = z
			if zeile.begins_with("+") or zeile.begins_with("-"):
				if zeile.begins_with("+") != robo:
					continue
				zeile = zeile.substr(1)
			if zeile == "@zeldina":
				schritte.append(_kommt.bind("FI_ZELDINA_DA"))
			elif zeile == "@roboter":
				schritte.append(_kommt.bind("FI_ROBOTER_DA"))
			else:
				schritte.append(zeile)
		await _szene(schritte)
		var l := _liste("FI_KANAELE")
		l.append(k)
		Zustand.setze_wert("FI_KANAELE", l)
	Zustand.setze("FI_ZELDINA_DA")
	if robo:
		Zustand.setze("FI_ROBOTER_DA")
	if is_instance_valid(R.current):
		_figuren_anwenden(R.current)
	await _sag("FI_RUF_ZEL_0310" if robo else "FI_RUF_ZEL_0300")
	Zustand.setze("FI_HILFERUF")
	Spielstand.autospeichern()


func _kommt(schalter: String) -> void:
	Zustand.setze(schalter)
	if is_instance_valid(R.current):
		_figuren_anwenden(R.current)


func _liste(name: String) -> Array:
	return (Zustand.wert(name, []) as Array).duplicate()


## Drehknopf im Finale: vor dem Hilferuf erst die Luke, danach nur noch ein Kommentar.
func benutzen_drehknopf(_obj, _x) -> bool:
	if not Zustand.ist("LUKE_ERKANNT"):
		await _sag("FI_RIEG_MAX_0240")
	elif not Zustand.ist("FI_HILFERUF"):
		await _hilferuf()
	else:
		await Spiel.ersatz()
	return true
#endregion

#region Letztes Rätsel #############################################################################
## Gespräch mit Zeldina: Auswahl aus den Fragen 0320/0340 und der Luke (Schritt A).
func benutzen_zeldina(_obj, _x) -> bool:
	if _raum_id() != "dachboden":
		return false
	var fragen := ["FI_RUF_MAX_0320", "FI_RUF_MAX_0340", "FI_RAET_MAX_0090" if _g("F1a") else "FI_RAET_MAX_0010",
		"UI_MENUE_ZURUECK"]
	match await Spiel.auswahl(fragen):
		0:
			await _szene(["FI_RUF_MAX_0320", "FI_RUF_ZEL_0330"])
		1:
			await _szene(["FI_RUF_MAX_0340", "FI_RUF_ZEL_0350"])
		2:
			if _g("F1a"):
				await _szene(["FI_RAET_MAX_0090", "FI_RAET_ZEL_0100"])
			else:
				await _szene(["FI_RAET_MAX_0010", "FI_RAET_ZEL_0020", "FI_RAET_NAR_0030", "FI_RAET_ZEL_0040",
					"FI_RAET_MAX_0050", "FI_RAET_PIX_0060", "FI_RAET_MAX_0070", "FI_RAET_OPA_0080"])
				Zustand.loese("F1a")
	return true


## Modell 08/15 (nur mit FREUND_0815): hält die Ofentür (Schritt B).
func benutzen_modell_0815(_obj, _x) -> bool:
	if _raum_id() != "dachboden":
		return false
	var fragen := ["FI_RUF_MAX_0360", "FI_RAET_MAX_0110", "UI_MENUE_ZURUECK"]
	match await Spiel.auswahl(fragen):
		0:
			await _szene(["FI_RUF_MAX_0360", "FI_RUF_HAU_0370"])
		1:
			if _g("F1b"):
				await Spiel.ersatz()
			else:
				await _szene(["FI_RAET_MAX_0110", "FI_RAET_HAU_0120", "FI_RAET_PIX_0130"])
				Zustand.loese("F1b")
	return true


func benutzen_modell0815(obj, x) -> bool:
	return await benutzen_modell_0815(obj, x)


func gegenstand_ofentuer(_obj, iid) -> bool:
	match iid:
		"kochloeffel":
			if Zustand.ist("FREUND_0815"):
				await _sag("FI_RAET_MAX_0160")
			elif not _g("F1b"):
				await _szene(["FI_RAET_MAX_0140", "FI_RAET_PIX_0150"])
				Zustand.loese("F1b")
			else:
				await Spiel.ersatz()
			return true
		"thunfischdose":
			await _sag("FI_RAET_PIX_0430")
			return true
	return false


func gegenstand_bodenluke(_obj, iid) -> bool:
	if iid == "kochloeffel":
		await _sag("FI_RAET_MAX_0420")
		return true
	return false


## Schritt C: unter dem Ohrensessel liegt die Fernbedienung; die Zelle holt nur Pixel.
func ansehen_ohrensessel(_obj, _x) -> bool:
	if not Zustand.ist("FI_HILFERUF") or _g("F1c"):
		return false
	await _sag("FI_RAET_MAX_0175" if _angesehen("ohrensessel") > 1 else "FI_RAET_MAX_0170")
	return true


func benutzen_ohrensessel(_obj, _x) -> bool:
	if not Zustand.ist("FI_HILFERUF") or _g("F1c"):
		return false
	if not _hat("goldene_fernbedienung"):
		await _sag("FI_RAET_MAX_0180")
		await _geben("goldene_fernbedienung")
	elif not _hat("energiezelle") and not Zustand.ist("FI_ZELLE_IM_MAUL"):
		await _szene(["FI_RAET_MAX_0190", "FI_RAET_PIX_0200"])
	else:
		await Spiel.ersatz()
	return true


func pixel_ohrensessel(_obj, _x) -> bool:
	if not _hat("goldene_fernbedienung") or _hat("energiezelle") or Zustand.ist("FI_ZELLE_IM_MAUL") or _g("F1c"):
		return false
	await _sag("FI_RAET_PIX_0210")
	Zustand.setze("FI_ZELLE_IM_MAUL")
	return true


## Pixel auf Max oder Wechsel zurück: die Zelle kommt ins Inventar.
func pixel_max(_obj, _x) -> bool:
	if not Zustand.ist("FI_ZELLE_IM_MAUL"):
		return false
	await _zelle_abgeben()
	return true


func _figur_gewechselt(neu: PopochiuCharacter) -> void:
	if Zustand.ist("FINALE") and Zustand.ist("FI_ZELLE_IM_MAUL") and is_instance_valid(neu) and neu.script_name == "Max":
		_zelle_abgeben.call_deferred()


func _zelle_abgeben() -> void:
	if not Zustand.ist("FI_ZELLE_IM_MAUL"):
		return
	Zustand.setze("FI_ZELLE_IM_MAUL", false)
	await _sag("FI_RAET_MAX_0220")
	await _geben("energiezelle")


func kombi_energiezelle_goldene_fernbedienung() -> bool:
	await _sag("FI_RAET_MAX_0230")
	await _abgeben("energiezelle")
	Zustand.setze_wert("FI_FERNBEDIENUNG", "zuendkapsel")
	Zustand.loese("F1c")
	return true


func ansehen_inventar_goldene_fernbedienung(_obj, _x) -> bool:
	if Zustand.wert("FI_FERNBEDIENUNG", "") != "zuendkapsel":
		return false
	await _sag("FI_RAET_MAX_0245" if _angesehen("zuendkapsel") > 1 else "FI_RAET_MAX_0240")
	return true


## Schritt D: Zündkapsel auf den Empfänger, die rote Taste heißt Stopp.
func gegenstand_empfaenger(_obj, iid) -> bool:
	match iid:
		"energiezelle":
			await _sag("FI_RAET_OPA_0440")
			return true
		"goldene_fernbedienung":
			if Zustand.wert("FI_FERNBEDIENUNG", "") != "zuendkapsel":
				await _sag("FI_RAET_MAX_0450")
				return true
			await _szene(["FI_RAET_OPA_0250", "FI_RAET_NAR_0260"])
			var wahl := await Spiel.auswahl(TASTEN)
			if wahl >= 0 and wahl < TASTE_FEHL.size():
				await _szene(TASTE_FEHL[wahl])
				return true
			await _sag("FI_RAET_OPA_0270")
			if not _g("F1b"):
				await _szene(["FI_RAET_NAR_0350", "FI_RAET_MAX_0360", "FI_RAET_PIX_0370", "FI_RAET_OPA_0380"])
				return true
			await _sag("FI_RAET_MAX_0280")
			Zustand.loese("F1d")
			await _aufloesung()
			return true
	return false


func gegenstand_opa(_obj, iid) -> bool:
	if iid == "goldene_fernbedienung" and Zustand.wert("FI_FERNBEDIENUNG", "") == "zuendkapsel":
		await _szene(["FI_RAET_MAX_0460", "FI_RAET_OPA_0470"])
		return true
	return false


#endregion

#region Auflösung, Wohnzimmer, Abspann #############################################################
func _aufloesung() -> void:
	var robo := Zustand.ist("FREUND_0815")
	var kekse := _hat("omas_kekse")
	var z := ["FI_AUFL_NAR_0010", "FI_AUFL_HAU_0020" if robo else "FI_AUFL_NAR_0030"]
	for n in range(40, 390, 10):
		var id := _zeile_mit_nummer("FI_AUFL_", n)
		if not id.is_empty():
			z.append(id)
	z.append_array(["FI_AUFL_NAR_0390", "FI_AUFL_OMA_0400", "FI_AUFL_OPA_0410", "FI_AUFL_OMA_0420",
		"FI_AUFL_OMA_0430", "FI_AUFL_ZEL_0440", "FI_AUFL_OMA_0450"])
	if robo:
		z.append_array(["FI_AUFL_OMA_0460", "FI_AUFL_HAU_0470", "FI_AUFL_OMA_0480"])
	z.append_array(["FI_AUFL_OMA_0490", "FI_AUFL_MAX_0500"])
	if kekse:
		z.append_array(["FI_AUFL_MAX_0510", "FI_AUFL_NAR_0520", "FI_AUFL_OMA_0530", "FI_AUFL_PIX_0540"])
		Zustand.setze("KEKSE_DABEI")
	z.append_array(["FI_AUFL_OMA_0550", "FI_AUFL_PIX_0560"])
	await _szene(z)
	if kekse:
		await _abgeben("omas_kekse")
	Spielstand.autospeichern()
	Spiel.herkunft_raum = ""
	await R.goto_room(Bauplan.raum_script_name("wohnzimmer"))


## Zeilen-ID einer Szene nach ihrer Nummer (Sprecher unbekannt): FI_AUFL_ + Sprecher + Nummer.
func _zeile_mit_nummer(praefix: String, n: int) -> String:
	for k in ["MAX", "OPA", "PIX", "NAR", "OMA", "ZEL", "HAU"]:
		var id := "%s%s_%04d" % [praefix, k, n]
		if tr(id) != id:
			return id
	return ""


func nach_uebergang_wohnzimmer(_raum, _x) -> bool:
	if Zustand.ist("FI_WOHN_ANKUNFT"):
		return false
	Zustand.setze("FI_WOHN_ANKUNFT")
	await _szene(["FI_WOHN_NAR_0010", "FI_WOHN_OMA_0020", "FI_WOHN_OPA_0030", "FI_WOHN_OMA_0040",
		"FI_WOHN_OPA_0050", "FI_WOHN_PIX_0060"])
	return true


func benutzen_oma(_obj, _x) -> bool:
	if _raum_id() != "wohnzimmer":
		return false
	await _szene(["FI_WOHN_MAX_0180", "FI_WOHN_OMA_0190"])
	await _mutter_kommt()
	return true


func _opa_wohnzimmer() -> bool:
	await _szene(["FI_WOHN_MAX_0200", "FI_WOHN_OPA_0210"])
	await _mutter_kommt()
	return true


func ansehen_inventar_notizbuch(_obj, _x) -> bool:
	if _raum_id() != "wohnzimmer":
		return false
	await _szene(["FI_WOHN_MAX_0165" if _angesehen("notizbuch") > 1 else "FI_WOHN_MAX_0160", "FI_WOHN_PIX_0170"])
	return true


## Die Mutter liest Opas Einkaufsliste vor; Max holt die Milch.
func _mutter_kommt() -> void:
	if Zustand.ist("FI_MUTTER_DA"):
		return
	Zustand.setze("FI_MUTTER_DA")
	if is_instance_valid(R.current):
		_figuren_anwenden(R.current)
	var z := ["FI_WOHN_NAR_0220", "FI_WOHN_MUT_0230", "FI_WOHN_MUT_0240", "FI_WOHN_NAR_0250",
		"FI_WOHN_MUT_0260", "FI_WOHN_MUT_0270", "FI_WOHN_NAR_0280", "FI_WOHN_OPA_0290", "FI_WOHN_NAR_0300",
		"FI_WOHN_MAX_0310", "FI_WOHN_NAR_0320", "FI_WOHN_PIX_0330", "FI_WOHN_OPA_0340", "FI_WOHN_MAX_0350",
		"FI_WOHN_OMA_0360", "FI_WOHN_ZEL_0370", "FI_WOHN_MAX_0380"]
	if Zustand.ist("FREUND_0815"):
		z.append("FI_WOHN_HAU_0390")
	z.append_array(["FI_WOHN_MAX_0400", "FI_WOHN_PIX_0410"])
	await _szene(z)
	await _abspann_szene()


## Max dreht im Vorbeigehen am Zapp-O-Mat, dann der Supermarkt.
func _abspann_szene() -> void:
	await _szene(["FI_ABSP_NAR_0010", "FI_ABSP_TOA_0020", "FI_ABSP_MAX_0030", "FI_ABSP_PIX_0040"])
	Spiel.herkunft_raum = ""
	await R.goto_room(Bauplan.raum_script_name("supermarkt"))


func nach_uebergang_supermarkt(_raum, _x) -> bool:
	if Zustand.ist("FI_SUPERMARKT"):
		return false
	Zustand.setze("FI_SUPERMARKT")
	await _sag("FI_SUPM_NAR_0050")
	return true


func benutzen_automatische_tuer(_obj, _x) -> bool:
	await _sag("FI_SUPM_MAX_0080")
	await _abspann()
	return true


func _abspann() -> void:
	await _sag("FI_SUPM_NAR_0090")
	var weg_b := Zustand.ist("W1_R10_B_GELOEST") and not Zustand.ist("W1_R10_A_GELOEST")
	await _szene(["FI_ABSP_NAR_0100", "FI_ABSP_NAR_0110", "FI_ABSP_NAR_0120",
		"FI_ABSP_NAR_0140" if weg_b else "FI_ABSP_NAR_0130", "FI_ABSP_NAR_0150",
		"FI_ABSP_WAL_0160", "FI_ABSP_WAL_0170", "FI_ABSP_WAL_0180", "FI_ABSP_WAL_0190", "FI_ABSP_PIX_0200"])
	Zustand.setze("FI_ENDE_GESEHEN")
	Spielstand.autospeichern()
	Spiel.zum_hauptmenue()
#endregion
