@tool
extends CQRaum
# Raum „Abstellkammern“ (abstellkammern). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_abstellkammern_state.gd')

var state: Data = load("res://game/rooms/abstellkammern/room_abstellkammern.tres")


var _erster_besuch := false

## Rätsel 12: wer welchen Kram glücklich macht (Gegenstand → Abnehmer, Schalter, Szene)
const ABNEHMER := {
	"SchwerterBuendel": ["Humbert", "W1_R12_SCHWERTER",
		[["HUM", "W1_SMAU_HUM_0530"], ["SMA", "W1_SMAU_SMA_0540"]]],
	"FackelBuendel": ["Grimmzahn", "W1_R12_FACKELN",
		[["GRI", "W1_SMAU_GRI_0550"], ["SMA", "W1_SMAU_SMA_0560"], ["GRI", "W1_SMAU_GRI_0570"]]],
	"Kronleuchter": ["Zeldina", "W1_R12_KRONLEUCHTER",
		[["ZEL", "W1_SMAU_ZEL_0580"], ["SMA", "W1_SMAU_SMA_0590"], ["ZEL", "W1_SMAU_ZEL_0600"]]],
}
## Passwort an der Geheimtür: vier Teile nacheinander wählen, gewählte verschwinden (G20).
const PASSWORT_TEILE := ["UI_PASSWORT_TEIL_MO", "UI_PASSWORT_TEIL_KNUDDEL",
	"UI_PASSWORT_TEIL_PUDDI", "UI_PASSWORT_TEIL_BAERCHEN"]


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Kram, der schon verschenkt ist, liegt nicht mehr herum.
func _zustand_anwenden() -> void:
	super()
	for sn in ABNEHMER:
		var p := get_prop(sn)
		if is_instance_valid(p) and Zustand.ist(ABNEHMER[sn][1]):
			p.visible = false


## Ankunft (SMAU 0010–0070): Humbert bringt Fondue, Grimmzahn kommt je nach Goblin-Weg mit.
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	var schritte := [
		Spiel.z("SMA", "W1_SMAU_SMA_0010"),
		Spiel.z("MAX", "W1_SMAU_MAX_0020"),
		Spiel.z("SMA", "W1_SMAU_SMA_0030"),
		Spiel.z("HUM", "W1_SMAU_HUM_0040"),
		Spiel.z("ZEL", "W1_SMAU_ZEL_0050"),
		Spiel.z("GRI", "W1_SMAU_GRI_0060" if Zustand.geloest("R10b") else "W1_SMAU_GRI_0070"),
	]
	await Spiel.szene(schritte)


## Schwerter, Fackeln oder Kronleuchter nehmen (0510/0520).
func kram_nehmen(prop: PopochiuProp) -> void:
	if Spiel.ist_pixel():
		await Spiel.wechsel_regel("pixel_nehmen")
		return
	await Spiel.hingehen(prop)
	await Spiel.sagen("SMA", "W1_SMAU_SMA_0510")
	await Spiel.sagen("MAX", "W1_SMAU_MAX_0520")
	prop.hide()
	await Spiel.geben(prop.script_name)


## Kram auf den richtigen Abnehmer; falsche Abnehmer sagen ihre Zeile aus dem Bauplan.
func figur_benutzt(figur: PopochiuCharacter, item: PopochiuInventoryItem) -> bool:
	if item == null or not ABNEHMER.has(item.script_name):
		return false
	var a: Array = ABNEHMER[item.script_name]
	if figur.script_name != a[0]:
		return false
	await Spiel.hingehen(figur)
	await Spiel.szene(a[2].map(func(z): return Spiel.z(z[0], z[1])))
	await Spiel.abgeben(item.script_name)
	Zustand.setze(a[1])
	if ABNEHMER.values().all(func(x): return Zustand.ist(x[1])):
		await ei_bekommen()
	return true


func ei_bekommen() -> void:
	await Spiel.szene([
		Spiel.z("SMA", "W1_SMAU_SMA_0610"),
		Spiel.z("SMA", "W1_SMAU_SMA_0620"),
		_r12_setzen,
		Spiel.z("MAX", "W1_SMAU_MAX_0630"),
		Spiel.z("PIX", "W1_SMAU_PIX_0640"),
		Spiel.z("MAX", "W1_SMAU_MAX_0645"),
	])
	await _r12_setzen()


func _r12_setzen() -> void:
	if Zustand.geloest("R12"):
		return
	await Spiel.geben("Drachenei")
	Zustand.loese("R12")


## Passwort-Teile im Notizbuch: Mo (Zeldina), Knuddel (Zeugnis), Puddi (Lied), Bärchen (Kritzelei)
func passwort_teile() -> int:
	return [
		Zustand.ist("W1_PASSWORT_MO"),
		"zeugnis" in Zustand.nahansichten,
		Zustand.geloest("R10"),
		"luftschloss_kritzelei" in Zustand.nahansichten,
	].count(true)


## Pixel sagt an der Tür, welcher Teil fehlt und wo er steckt (Review Fund 14): der erste
## fehlende in der Reihenfolge des Passworts.
func fehlender_teil_zeile() -> String:
	var z: String = load("res://skripte/welt_1.gd").passwort_fehlt()
	return z if not z.is_empty() else "W1_SMAU_PIX_0724"


## Rätsel 11a an der Geheimtür (0710–0790).
func geheimtuer() -> void:
	await Spiel.sagen("TUE", "W1_SMAU_TUE_0710")
	if passwort_teile() < 4:
		await Spiel.sagen("TUE", "W1_SMAU_TUE_0720")
		await Spiel.sagen("PIX", fehlender_teil_zeile())
		return
	var uebrig := PASSWORT_TEILE.duplicate()
	var folge: Array = []
	while not uebrig.is_empty():
		var wahl := await Spiel.auswahl(uebrig)
		if wahl < 0 or wahl >= uebrig.size():
			return  # abgebrochen
		folge.append(uebrig.pop_at(wahl))
	if folge != PASSWORT_TEILE:
		if folge.slice(0, 3) == [PASSWORT_TEILE[2], PASSWORT_TEILE[3], PASSWORT_TEILE[0]]:
			await Spiel.sagen("TUE", "W1_SMAU_TUE_0750")
		else:
			await Spiel.sagen("TUE", "W1_SMAU_TUE_0730")
			await Spiel.sagen("MAX", "W1_SMAU_MAX_0740")
		return
	var schritte := [
		Spiel.z("MAX", "W1_SMAU_MAX_0760"),
		Spiel.z("TUE", "W1_SMAU_TUE_0770"),
		Zustand.loese.bind("R11a"),
		Spiel.z("PIX", "W1_SMAU_PIX_0780"),
	]
	if has_character("Zeldina"):
		schritte.append(Spiel.z("ZEL", "W1_SMAU_ZEL_0790"))
	await Spiel.szene(schritte)
	Zustand.loese("R11a")
