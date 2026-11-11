@tool
extends CQRaum
# Raum „Dachboden“ (dachboden). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_dachboden_state.gd')

var state: Data = load("res://game/rooms/dachboden/room_dachboden.tres")

## Zapp-O-Mat-Bilder (Platzhalter-Sheet aus tools/godot_raeume.py)
enum Bild { AUS, SCHNEE, ANTENNE, BUNT, WIRBEL }
## Pixel nach P1: auf der Werkbank (skript/prolog.md, 0360)
const PIXEL_WERKBANK := Vector2(160, 180)
const PIXEL_KABEL := Vector2(313, 237)
## Hintergrund je Zwischenspiel: Prolog Nachmittag, dann später Nachmittag, früher Abend (Lampe aus),
## Abendrot (Lampe an). Abgeleitet mit tools/stimmung.py aus dem Grundbild.
const LICHT := [
	"res://grafik/hintergruende/w0_bg_dachboden_v01.png",
	"res://grafik/hintergruende/w0_bg_dachboden_rueckkehr1_v01.png",
	"res://grafik/hintergruende/w0_bg_dachboden_rueckkehr2_v01.png",
	"res://grafik/hintergruende/w0_bg_dachboden_rueckkehr3_v01.png",
]

var _erster_besuch := false
## Während der P2-Szene zeigt der Zapp-O-Mat kurz die Antenne
var _p2_laeuft := false


func _ready() -> void:
	super()
	if not Engine.is_editor_hint():
		Zustand.geaendert.connect(_on_zustand_geaendert)


func _on_zustand_geaendert(_name: String) -> void:
	if is_inside_tree():
		_zustand_anwenden()


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch
	if zwischenspiel() > 0 and has_marker("Fernseher"):
		C.player.position = get_marker_position("Fernseher")  # aus dem Bildschirm gepurzelt
		partner_aufstellen(true)


## Laufendes Zwischenspiel (1 bis 3), 0 im Prolog und im Finale.
func zwischenspiel() -> int:
	return int(Zustand.wert("ZWISCHENSPIEL", 0)) if Zustand.abschnitt == "finale" else 0


## Bild des Zapp-O-Mat und Pixels Platz folgen aus P1–P3 (nie gespeichert).
func _zustand_anwenden() -> void:
	super()
	var zapp := get_prop("ZappOMat")
	if is_instance_valid(zapp) and not _p2_laeuft:
		zapp.current_frame = bild()
	var grund := get_prop("Background")
	if is_instance_valid(grund):
		grund.texture = load(LICHT[zwischenspiel()])  # Lichtstimmung je Rückkehr (grafik/02-prolog-und-finale.md)
	var fundkiste := get_hotspot("Fundkiste")
	if is_instance_valid(fundkiste):
		fundkiste.visible = zwischenspiel() > 0 or Zustand.ist("FINALE")  # Opas Archiv gibt es erst ab der ersten Rückkehr
	var lampe := get_hotspot("Lampe")
	if is_instance_valid(lampe):
		lampe.visible = zwischenspiel() >= 3 or Zustand.ist("FINALE")  # Opa knipst sie in Zwischenspiel 3 an
	for sn in ["Maschine", "Ofentuer", "Druckmesser", "Fassungen", "Empfaenger"]:
		var h := get_hotspot(sn)  # Opas Maschine: nur im Finale (skripte/finale.gd)
		if is_instance_valid(h):
			h.visible = Zustand.ist("FINALE")
	if is_instance_valid(C.Pixel) and has_character("Pixel") and zwischenspiel() == 0:
		C.Pixel.position = PIXEL_WERKBANK if Zustand.geloest("P1", "prolog") else PIXEL_KABEL


func bild() -> int:
	if Zustand.geloest("P3", "prolog"):
		return Bild.WIRBEL
	if Zustand.geloest("P2", "prolog"):
		return Bild.BUNT
	if Zustand.geloest("P1", "prolog"):
		return Bild.SCHNEE
	return Bild.AUS


## Szene beim ersten Betreten: Opas Auftrag (skript/prolog.md, Abschnitt 2)
func _nach_uebergang() -> void:
	if zwischenspiel() == 1 and not Zustand.ist("ZS1_EI_ABGEGEBEN"):
		await zs1_ankunft()
		return
	if zwischenspiel() > 1 and not angekommen(zwischenspiel()):
		await zs_ankunft(zwischenspiel())
		return
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.szene([
		Spiel.z("OPA", "P0_DACH_OPA_0010"),
		Spiel.z("MAX", "P0_DACH_MAX_0020"),
		Spiel.z("OPA", "P0_DACH_OPA_0030"),
		Spiel.z("OPA", "P0_DACH_OPA_0040"),
		Spiel.z("MAX", "P0_DACH_MAX_0050"),
		Spiel.z("OPA", "P0_DACH_OPA_0060"),
		Spiel.z("OPA", "P0_DACH_OPA_0070"),
		Spiel.z("OPA", "P0_DACH_OPA_0080"),
		Spiel.z("MAX", "P0_DACH_MAX_0085"),
		Spiel.z("OPA", "P0_DACH_OPA_0090"),
		Spiel.z("MAX", "P0_DACH_MAX_0100"),
		Spiel.z("OPA", "P0_DACH_OPA_0110"),
		Spiel.z("MAX", "P0_DACH_MAX_0120"),
		Spiel.z("OPA", "P0_DACH_OPA_0130"),
		Spiel.z("OPA", "P0_DACH_OPA_0140"),
		Spiel.z("MAX", "P0_DACH_MAX_0150"),
		Spiel.z("OPA", "P0_DACH_OPA_0155"),
		Spiel.z("OPA", "P0_DACH_OPA_0160"),
	])


## Geladener Stand nach dem Ende des Prologs: wieder den Abschluss zeigen.
func _nach_laden() -> void:
	if zwischenspiel() == 1 and not Zustand.ist("ZS1_EI_ABGEGEBEN"):
		await zs1_ankunft()
	elif zwischenspiel() > 1 and not angekommen(zwischenspiel()):
		await zs_ankunft(zwischenspiel())
	elif Zustand.abschnitt == "prolog" and Zustand.geloest("P3"):
		await Spiel.prolog_beenden()


#region Rätsel P1–P3 ###############################################################################
## P1: Dosenöffner mit Thunfischdose (0280–0390). Aufgerufen von den Gegenständen.
func p1_loesen() -> void:
	await Spiel.szene([
		Spiel.z("MAX", "P0_DACH_MAX_0280"),
		Spiel.z("NAR", "P0_DACH_NAR_0290"),
		Spiel.z("OPA", "P0_DACH_OPA_0300"),
		Spiel.z("PIX", "P0_DACH_PIX_0310"),
		Spiel.z("PIX", "P0_DACH_PIX_0320"),
		Spiel.z("MAX", "P0_DACH_MAX_0330"),
		Spiel.z("PIX", "P0_DACH_PIX_0340"),
		Spiel.z("MAX", "P0_DACH_MAX_0350"),
		Spiel.z("PIX", "P0_DACH_PIX_0360"),
		# Pixel frisst und wechselt auf die Werkbank, Opa schaltet den Zapp-O-Mat ein
		Zustand.loese.bind("P1"),
		Spiel.z("OPA", "P0_DACH_OPA_0370"),
		Spiel.z("PIX", "P0_DACH_PIX_0380"),
		Spiel.z("MAX", "P0_DACH_MAX_0390"),
	])
	# Falls die Szene übersprungen wurde
	Zustand.loese("P1")
	# Pixel ist wach: das Pixel-Feld erscheint in der Inventarleiste (05-spielsysteme.md, UI)
	await Spiel.pixel_feld_pruefen()


## P2: Antenne auf den Zapp-O-Mat (0480–0500, dann 0610).
func p2_loesen(gerade: bool) -> void:
	var schritte := []
	if gerade:
		schritte.append(Spiel.z("MAX", "P0_DACH_MAX_0470"))
	schritte.append_array([
		_antenne_zeigen,
		Spiel.z("MAX", "P0_DACH_MAX_0480"),
		Spiel.z("PIX", "P0_DACH_PIX_0490"),
		_p2_setzen,  # Rauschen wird bunter
		Spiel.z("OPA", "P0_DACH_OPA_0500"),
		Spiel.z("OPA", "P0_DACH_OPA_0610"),
	])
	await I.get_item_instance("Drahtkleiderbuegel").remove()
	await Spiel.szene(schritte)
	_p2_setzen()


func _antenne_zeigen() -> void:
	_p2_laeuft = true
	get_prop("ZappOMat").current_frame = Bild.ANTENNE


func _p2_setzen() -> void:
	_p2_laeuft = false
	Zustand.loese("P2")
	_zustand_anwenden()


## P3: Kanal 3 am Drehknopf (0670, 0690), dann die Reisetasche (0810–0880) und das Ende.
func p3_loesen() -> void:
	await Spiel.szene([
		Spiel.z("MAX", "P0_DACH_MAX_0670"),
		Zustand.loese.bind("P3"),
		Spiel.z("OPA", "P0_DACH_OPA_0690"),
		Spiel.z("OPA", "P0_DACH_OPA_0810"),
		_bekommen.bind("Reisetasche"),
		_bekommen.bind("Notizbuch"),
		Spiel.z("PIX", "P0_DACH_PIX_0820"),
		Spiel.z("OPA", "P0_DACH_OPA_0830"),
		_bekommen.bind("OpasZettel"),
		Spiel.z("MAX", "P0_DACH_MAX_0840"),
		Spiel.z("OPA", "P0_DACH_OPA_0845"),
		Spiel.z("PIX", "P0_DACH_PIX_0850"),
		Spiel.z("OPA", "P0_DACH_OPA_0860"),
		Spiel.z("MAX", "P0_DACH_MAX_0870"),
		Spiel.z("PIX", "P0_DACH_PIX_0880"),
	])
	# Übersprungen? Ergebnis trotzdem herstellen.
	Zustand.loese("P3")
	for sn in ["Reisetasche", "Notizbuch", "OpasZettel"]:
		await _bekommen(sn)
	# Autospeicher „Ende Welt“, dann das Einsaugen
	Spielstand.autospeichern()
	await Spiel.prolog_beenden()


func _bekommen(sn: String) -> void:
	if not I.is_item_in_inventory(sn):
		await I.get_item_instance(sn).add()


#endregion


#region Zwischenspiel 1 ############################################################################
## Ankunft mit dem Drachenei (skript/zwischenspiele-und-finale.md, Abschnitt 1, 0010–0240).
## Opa nimmt das Ei bei 0070; im Eierkarton wird es ein weißes Ei (0110).
func zs1_ankunft() -> void:
	await Spiel.szene([
		Spiel.z("NAR", "ZS1_DACH_NAR_0010"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0020"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0030"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0040"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0050"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0060"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0070"),
		_ei_abgeben,
		Spiel.z("MAX", "ZS1_DACH_MAX_0072"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0074"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0080"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0090"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0100"),
		Spiel.z("NAR", "ZS1_DACH_NAR_0110"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0120"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0130"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0132"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0140"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0142"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0150"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0160"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0170"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0180"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0190"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0192"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0194"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0200"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0202"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0204"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0210"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0220"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0230"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0240"),
	])
	await _ei_abgeben()  # falls übersprungen
	wunsch_eintragen(1)
	Spielstand.autospeichern()


func _ei_abgeben() -> void:
	await Spiel.abgeben("Drachenei")
	Zustand.setze("ZS1_EI_ABGEGEBEN")


## Drehknopf im Zwischenspiel 1: Beim ersten Mal hält Opa Max auf und öffnet die Reisetasche
## (0510–0514), nach dem Packen verabschiedet er sich (0630–0650). Der zweite Dreh wählt Kanal 7
## (0660, 0670) und schickt Max nach Welt 2.
func zs1_drehknopf() -> void:
	if not Zustand.ist("ZS1_GEPACKT"):
		await Spiel.szene([
			Spiel.z("OPA", "ZS1_DACH_OPA_0510"),
			Spiel.z("MAX", "ZS1_DACH_MAX_0512"),
			Spiel.z("OPA", "ZS1_DACH_OPA_0514"),
		])
		await Spiel.reisetasche_packen(1)
		Zustand.setze("ZS1_GEPACKT")
		await Spiel.szene([
			Spiel.z("OPA", "ZS1_DACH_OPA_0630"),
			Spiel.z("MAX", "ZS1_DACH_MAX_0640"),
			Spiel.z("OPA", "ZS1_DACH_OPA_0650"),
		])
		Spielstand.autospeichern()
		return
	await Spiel.szene([
		Spiel.z("MAX", "ZS1_DACH_MAX_0660"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0670"),
	])
	if Spiel.abschnitt_gebaut("welt-2"):
		await Spiel.welt_beginnen("welt-2")
	else:
		Spiel.ausbau_ende("UI_WELT_1_ENDE")


## Ansehen im Zwischenspiel 1 (0310–0375, Fundkiste 0420/0425): nur, was sich verändert hat;
## sonst gelten die Prolog-Zeilen. Die Werkbank-Ablage mit dem Ei ist die Werkbank (G26).
const ZS1_ANSEHEN := {
	werkbank = [["MAX", "ZS1_DACH_MAX_0310", 1], ["MAX", "ZS1_DACH_MAX_0315", 2, "ZS1_DACH_PIX_0320"],
		["MAX", "ZS1_DACH_MAX_0322", 3, "ZS1_DACH_PIX_0324"]],
	dachfenster = [["MAX", "ZS1_DACH_MAX_0330", 1], ["MAX", "ZS1_DACH_MAX_0335", 2]],
	kalender = [["MAX", "ZS1_DACH_MAX_0340", 1], ["MAX", "ZS1_DACH_MAX_0345", 2]],
	zapp_o_mat = [["MAX", "ZS1_DACH_MAX_0350", 1], ["PIX", "ZS1_DACH_PIX_0355", 2]],
	kiste_mit_fernbedienungen = [["PIX", "ZS1_DACH_PIX_0360", 1], ["PIX", "ZS1_DACH_PIX_0365", 2]],
	ohrensessel = [["MAX", "ZS1_DACH_MAX_0370", 1], ["MAX", "ZS1_DACH_MAX_0375", 2]],
	fundkiste = [["MAX", "ZS1_DACH_MAX_0420", 1], ["MAX", "ZS1_DACH_MAX_0425", 2]],
}


func ansehen_zusatz(objekt: String) -> Array:
	var tabelle: Dictionary = {1: ZS1_ANSEHEN, 2: ZS2_ANSEHEN, 3: ZS3_ANSEHEN}.get(zwischenspiel(), {})
	if zwischenspiel() == 3 and objekt == "zapp_o_mat":
		tabelle = {zapp_o_mat = ZS3_ZAPP_FREUND if Zustand.ist("W3_FREUND_0815") else ZS3_ZAPP_OHNE}
	if not tabelle.has(objekt):
		return []
	var out := []
	for z in tabelle[objekt]:
		var e := {sprecher = z[0], zeile = z[1], mal = z[2]}
		if z.size() > 3:
			e.folge = [{sprecher = "PIX", zeile = z[3]}]
		out.append(e)
	return out


#endregion


#region Zwischenspiele 2 und 3 #####################################################################
## Ankunft, freie Phase und Packen wie in Zwischenspiel 1 (skript/zwischenspiele-und-finale.md,
## Abschnitte 2 und 3). Opa nimmt das Mitbringsel der Welt an der markierten Stelle der Szene.
const MITBRINGSEL := {2: "goldener_sack", 3: "energiezelle"}
const ZS_ANKUNFT := {
	2: ["ZS2_DACH_NAR_0010", "ZS2_DACH_PIX_0020", "ZS2_DACH_MAX_0030", "ZS2_DACH_OPA_0040",
		"ZS2_DACH_MAX_0050", "ZS2_DACH_OPA_0060", "@", "ZS2_DACH_NAR_0070", "ZS2_DACH_OPA_0080",
		"ZS2_DACH_NAR_0090", "ZS2_DACH_PIX_0100", "ZS2_DACH_MAX_0110", "ZS2_DACH_PIX_0120",
		"ZS2_DACH_OPA_0130", "ZS2_DACH_MAX_0140", "ZS2_DACH_OPA_0150", "ZS2_DACH_MAX_0160",
		"ZS2_DACH_NAR_0170", "ZS2_DACH_PIX_0180", "ZS2_DACH_OPA_0190", "ZS2_DACH_MAX_0200",
		"ZS2_DACH_OPA_0210", "ZS2_DACH_MAX_0220", "ZS2_DACH_PIX_0230", "ZS2_DACH_MAX_0240",
		"ZS2_DACH_PIX_0250"],
	3: ["ZS3_DACH_NAR_0010", "ZS3_DACH_PIX_0020", "ZS3_DACH_MAX_0030", "ZS3_DACH_OPA_0040",
		"ZS3_DACH_MAX_0050", "@", "ZS3_DACH_NAR_0060", "ZS3_DACH_OPA_0070", "ZS3_DACH_MAX_0080",
		"ZS3_DACH_NAR_0090", "ZS3_DACH_MAX_0100", "ZS3_DACH_OPA_0110", "ZS3_DACH_MAX_0112",
		"ZS3_DACH_PIX_0120",
		"ZS3_DACH_NAR_0130", "ZS3_DACH_PIX_0140", "ZS3_DACH_OPA_0150", "ZS3_DACH_MAX_0160",
		"ZS3_DACH_NAR_0170", "ZS3_DACH_OPA_0180", "ZS3_DACH_MAX_0190", "ZS3_DACH_OPA_0200",
		"ZS3_DACH_PIX_0210", "ZS3_DACH_MAX_0220", "ZS3_DACH_PIX_0230"],
}
## Drehknopf: Opa öffnet die Tasche, verabschiedet sich nach dem Packen; der zweite Dreh wählt
## den nächsten Kanal.
const ZS_DREHKNOPF := {
	2: {tasche = ["ZS2_DACH_OPA_0510"], abschied = ["ZS2_DACH_OPA_0620", "ZS2_DACH_MAX_0630",
		"ZS2_DACH_OPA_0640", "ZS2_DACH_PIX_0650"], kanal = ["ZS2_DACH_MAX_0660", "ZS2_DACH_PIX_0670"],
		welt = "welt-3", ende = "UI_WELT_2_ENDE"},
	3: {tasche = ["ZS3_DACH_OPA_0510"], abschied = ["ZS3_DACH_OPA_0620", "ZS3_DACH_MAX_0630",
		"ZS3_DACH_OPA_0640", "ZS3_DACH_PIX_0650"], kanal = ["ZS3_DACH_MAX_0660", "ZS3_DACH_PIX_0670"],
		welt = "welt-4", ende = "UI_WELT_3_ENDE"},
}
const ZS2_ANSEHEN := {
	werkbank = [["MAX", "ZS2_DACH_MAX_0380", 1], ["PIX", "ZS2_DACH_PIX_0385", 2], ["MAX", "ZS2_DACH_MAX_0310", 3],
		["MAX", "ZS2_DACH_MAX_0315", 4, "ZS2_DACH_PIX_0320"]],
	kalender = [["MAX", "ZS2_DACH_MAX_0330", 1], ["MAX", "ZS2_DACH_MAX_0335", 2]],
	dachfenster = [["MAX", "ZS2_DACH_MAX_0360", 1], ["MAX", "ZS2_DACH_MAX_0365", 2]],
	zapp_o_mat = [["MAX", "ZS2_DACH_MAX_0370", 1], ["MAX", "ZS2_DACH_MAX_0375", 2]],
	kiste_mit_fernbedienungen = [["PIX", "ZS2_DACH_PIX_0390", 1], ["PIX", "ZS2_DACH_PIX_0395", 2]],
	ohrensessel = [["MAX", "ZS2_DACH_MAX_0400", 1], ["MAX", "ZS2_DACH_MAX_0405", 2]],
}
const ZS3_ANSEHEN := {
	werkbank = [["MAX", "ZS3_DACH_MAX_0310", 1], ["MAX", "ZS3_DACH_MAX_0315", 2, "ZS3_DACH_PIX_0320"]],
	kiste_mit_fernbedienungen = [["MAX", "ZS3_DACH_MAX_0330", 1], ["MAX", "ZS3_DACH_MAX_0335", 2, "ZS3_DACH_PIX_0340"]],
	dachfenster = [["MAX", "ZS3_DACH_MAX_0350", 1], ["MAX", "ZS3_DACH_MAX_0355", 2]],
	kalender = [["MAX", "ZS3_DACH_MAX_0360", 1], ["MAX", "ZS3_DACH_MAX_0365", 2]],
	ohrensessel = [["MAX", "ZS3_DACH_MAX_0420", 1], ["MAX", "ZS3_DACH_MAX_0425", 2]],
	kochbuch = [["MAX", "ZS3_DACH_MAX_0430", 1], ["MAX", "ZS3_DACH_MAX_0435", 2, "ZS3_DACH_PIX_0440"]],
	lampe = [["MAX", "ZS3_DACH_MAX_0410", 1], ["PIX", "ZS3_DACH_PIX_0415", 2]],
}
## Zapp-O-Mat in Zwischenspiel 3: Kanal 42 zeigt Modell 08/15, je nachdem, ob Max ihm geholfen hat
const ZS3_ZAPP_FREUND := [["MAX", "ZS3_DACH_MAX_0390", 1], ["MAX", "ZS3_DACH_MAX_0395", 2]]
const ZS3_ZAPP_OHNE := [["MAX", "ZS3_DACH_MAX_0400", 1], ["MAX", "ZS3_DACH_MAX_0405", 2]]


func angekommen(nr: int) -> bool:
	return Zustand.ist("ZS%d_MITBRINGSEL_ABGEGEBEN" % nr)


func zs_ankunft(nr: int) -> void:
	var schritte := []
	for z in ZS_ANKUNFT[nr]:
		if z == "@":
			schritte.append(_mitbringsel_abgeben.bind(nr))
		else:
			schritte.append(Spiel.z(z.split("_")[2], z))
	await Spiel.szene(schritte)
	await _mitbringsel_abgeben(nr)  # falls übersprungen
	wunsch_eintragen(nr)
	Spielstand.autospeichern()


## Pixels Einkaufsliste (Notizbuch Seite 3): ein Wunsch je Rückkehr, der vierte (Milch) in Welt 4.
## Wert EINKAUFSLISTE zählt die Wünsche (Errungenschaft „Einkaufsliste komplett“).
static func wunsch_eintragen(n: int) -> void:
	Zustand.setze_wert("EINKAUFSLISTE", maxi(int(Zustand.wert("EINKAUFSLISTE", 0)), n))


func _mitbringsel_abgeben(nr: int) -> void:
	await Spiel.abgeben(Bauplan.gegenstand_script_name(MITBRINGSEL[nr]))
	Zustand.setze("ZS%d_MITBRINGSEL_ABGEGEBEN" % nr)


func zs_drehknopf(nr: int) -> void:
	var d: Dictionary = ZS_DREHKNOPF[nr]
	if not Zustand.ist("ZS%d_GEPACKT" % nr):
		await _zeilen(d.tasche)
		await Spiel.reisetasche_packen(nr)
		Zustand.setze("ZS%d_GEPACKT" % nr)
		await _zeilen(d.abschied)
		Spielstand.autospeichern()
		return
	await _zeilen(d.kanal)
	if Spiel.abschnitt_gebaut(d.welt):
		await Spiel.welt_beginnen(d.welt)
	else:
		Spiel.ausbau_ende(d.ende)


func _zeilen(zeilen: Array) -> void:
	await Spiel.szene(zeilen.map(func(z): return Spiel.z(z.split("_")[2], z)))


#endregion
