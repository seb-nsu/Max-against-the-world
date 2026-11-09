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
const PIXEL_WERKBANK := Vector2(105, 189)
const PIXEL_KABEL := Vector2(156, 228)

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
		Spiel.z("OPA", "P0_DACH_OPA_0090"),
		Spiel.z("MAX", "P0_DACH_MAX_0100"),
		Spiel.z("OPA", "P0_DACH_OPA_0110"),
		Spiel.z("MAX", "P0_DACH_MAX_0120"),
		Spiel.z("OPA", "P0_DACH_OPA_0130"),
		Spiel.z("OPA", "P0_DACH_OPA_0140"),
		Spiel.z("MAX", "P0_DACH_MAX_0150"),
		Spiel.z("OPA", "P0_DACH_OPA_0160"),
	])


## Geladener Stand nach dem Ende des Prologs: wieder den Abschluss zeigen.
func _nach_laden() -> void:
	if zwischenspiel() == 1 and not Zustand.ist("ZS1_EI_ABGEGEBEN"):
		await zs1_ankunft()
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
		Spiel.z("OPA", "ZS1_DACH_OPA_0080"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0090"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0100"),
		Spiel.z("NAR", "ZS1_DACH_NAR_0110"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0120"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0130"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0140"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0150"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0160"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0170"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0180"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0190"),
		Spiel.z("OPA", "ZS1_DACH_OPA_0200"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0210"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0220"),
		Spiel.z("MAX", "ZS1_DACH_MAX_0230"),
		Spiel.z("PIX", "ZS1_DACH_PIX_0240"),
	])
	await _ei_abgeben()  # falls übersprungen
	Spielstand.autospeichern()


func _ei_abgeben() -> void:
	await Spiel.abgeben("Drachenei")
	Zustand.setze("ZS1_EI_ABGEGEBEN")


## Ansehen im Zwischenspiel 1 (0310–0375): nur, was sich verändert hat; sonst gelten die
## Prolog-Zeilen. Die Werkbank-Ablage mit dem Ei ist in der Graubox die Werkbank; die Fundkiste
## (0420/0425) hat noch keinen Hotspot.
const ZS1_ANSEHEN := {
	werkbank = [["MAX", "ZS1_DACH_MAX_0310", 1], ["MAX", "ZS1_DACH_MAX_0315", 2, "ZS1_DACH_PIX_0320"]],
	dachfenster = [["MAX", "ZS1_DACH_MAX_0330", 1], ["MAX", "ZS1_DACH_MAX_0335", 2]],
	kalender = [["MAX", "ZS1_DACH_MAX_0340", 1], ["MAX", "ZS1_DACH_MAX_0345", 2]],
	zapp_o_mat = [["MAX", "ZS1_DACH_MAX_0350", 1], ["PIX", "ZS1_DACH_PIX_0355", 2]],
	kiste_mit_fernbedienungen = [["PIX", "ZS1_DACH_PIX_0360", 1], ["PIX", "ZS1_DACH_PIX_0365", 2]],
	ohrensessel = [["MAX", "ZS1_DACH_MAX_0370", 1], ["MAX", "ZS1_DACH_MAX_0375", 2]],
}


func ansehen_zusatz(objekt: String) -> Array:
	if zwischenspiel() != 1 or not ZS1_ANSEHEN.has(objekt):
		return []
	var out := []
	for z in ZS1_ANSEHEN[objekt]:
		var e := {sprecher = z[0], zeile = z[1], mal = z[2]}
		if z.size() > 3:
			e.folge = [{sprecher = "PIX", zeile = z[3]}]
		out.append(e)
	return out


#endregion
