class_name CQReisetasche
extends RefCounted
## Reisetasche packen in den Zwischenspielen (raetsel/finale.md, Regeln für alle Rückkehren;
## 05-spielsysteme.md, Bildschirm Reisetasche). Die Logik liegt hier, damit der Testlauf ohne
## Überlagerung packen kann; oberflaeche/reisetasche.gd zeigt sie nur an.
##
## - Pflichtfach: Notizbuch, Thunfischdose, Kochlöffel; immer gefüllt, Berühren gibt nur Pixels
##   Kommentar.
## - Zwei Wahlfächer. Daneben liegt alles, was Max an mitreisefähigen Gegenständen (Welt-Tabelle,
##   reist_mit) noch hat, dazu der Inhalt der Fundkiste (beim ersten Mal der Dosenöffner aus dem
##   Prolog, den Opa aufgehoben hat).
## - Klick auf einen Gegenstand packt ihn ein oder aus. Beim ersten Berühren kommentiert Pixel;
##   Rechtsklick wiederholt den Kommentar. Ein drittes Wahlstück gibt Max' Zeile (0610).
## - Bestätigen: Pixels Zeile (0620). Eingepacktes kommt ins Inventar, alles andere in die
##   Fundkiste (Wert FUNDKISTE); die Wahl steht im Wert TASCHE (welt_beginnen nimmt sie mit).

signal geaendert

const PFLICHT := ["Notizbuch", "Thunfischdose", "Kochloeffel"]
const WAHLFAECHER := 2
## Was Opa beim ersten Packen schon in der Fundkiste hat (raetsel/prolog-und-welt-1.md)
const FUNDKISTE_START := ["Dosenoeffner"]
## Pixels Kommentare je Zwischenspiel (skript/zwischenspiele-und-finale.md)
const KOMMENTARE := {
	1: {
		Kochloeffel = "ZS1_DACH_PIX_0520", Thunfischdose = "ZS1_DACH_PIX_0530",
		Notizbuch = "ZS1_DACH_PIX_0535", Socke = "ZS1_DACH_PIX_0540",
		ZiegenfellVorleger = "ZS1_DACH_PIX_0550", Zeugnis = "ZS1_DACH_PIX_0560",
		Eimer = "ZS1_DACH_PIX_0570", Dosenoeffner = "ZS1_DACH_PIX_0580",
		Leuchttrank = "ZS1_DACH_PIX_0590", Ketchup = "ZS1_DACH_PIX_0600",
	},
	2: {
		Olivenoel = "ZS2_DACH_PIX_0520", Sandale = "ZS2_DACH_PIX_0530",
		Olivenkranz = "ZS2_DACH_PIX_0540", Schriftrolle = "ZS2_DACH_PIX_0550",
		Handy = "ZS2_DACH_PIX_0560", Kaugummi = "ZS2_DACH_PIX_0570",
		Kugelschreiber = "ZS2_DACH_PIX_0580", Diskus = "ZS2_DACH_PIX_0590",
		Wurfscheibe = "ZS2_DACH_PIX_0590", Pharaonenteller = "ZS2_DACH_PIX_0590",
		Schallplatte = "ZS2_DACH_PIX_0590",
	},
	3: {
		Sonnenbrille = "ZS3_DACH_PIX_0520", OmasKekse = "ZS3_DACH_PIX_0530",
		Portalgeraet = "ZS3_DACH_PIX_0540", Kaffeetasse = "ZS3_DACH_PIX_0560",
		SchmidtsAkte = "ZS3_DACH_PIX_0570", MorseTabelle = "ZS3_DACH_PIX_0580",
		Olivenoel = "ZS3_DACH_PIX_0590",
	},
}
## Ältere Dinge aus der Fundkiste und das Pflichtfach: Pixels Kommentar aus einem früheren
## Zwischenspiel gilt weiter, wenn er nichts über das nächste Reiseziel sagt. Für die übrigen
## älteren Dinge (Eimer, Leuchttrank, Ketchup; in Zwischenspiel 3 auch Schriftrolle, Handy,
## Kaugummi, Kugelschreiber, Diskus) fehlt noch eine eigene Zeile, dort kommt eine Ersatzzeile.
const KOMMENTAR_BLEIBT := ["Kochloeffel", "Thunfischdose", "Notizbuch", "Socke",
	"ZiegenfellVorleger", "Zeugnis", "Dosenoeffner", "Sandale", "Olivenkranz"]
const ZU_VIEL := {1: "ZS1_DACH_MAX_0610", 2: "ZS2_DACH_MAX_0600", 3: "ZS3_DACH_MAX_0600"}
const BESTAETIGT := {1: "ZS1_DACH_PIX_0620", 2: "ZS2_DACH_PIX_0610", 3: "ZS3_DACH_PIX_0610"}

var nr := 1
var auslage: Array[String] = []
var wahl: Array[String] = []
## Läuft gerade eine Zeile? Die Überlagerung nimmt dann keine Klicks an.
var beschaeftigt := false
var _kommentiert := {}


func _init(zwischenspiel: int) -> void:
	nr = zwischenspiel
	for sn in fundkiste():
		auslage.append(sn)
	for sn in C.Max.inventory.keys():
		if sn in PFLICHT or sn in auslage or not Bauplan.gegenstand(sn).get("reist_mit", false):
			continue
		auslage.append(sn)


static func fundkiste() -> Array:
	return Zustand.wert("FUNDKISTE", FUNDKISTE_START)


## Klick: einpacken oder auspacken; beim ersten Berühren Pixels Kommentar.
func beruehren(sn: String) -> void:
	if beschaeftigt:
		return
	beschaeftigt = true
	if sn in wahl:
		wahl.erase(sn)
		auslage.append(sn)
		geaendert.emit()
	elif sn in auslage:
		if wahl.size() >= WAHLFAECHER:
			await Spiel.sagen("MAX", ZU_VIEL.get(nr, ""))
		else:
			auslage.erase(sn)
			wahl.append(sn)
			geaendert.emit()
	if not _kommentiert.has(sn):
		_kommentiert[sn] = true
		await _kommentar(sn)
	beschaeftigt = false


## Rechtsklick: Pixel sagt seinen Kommentar noch einmal.
func ansehen(sn: String) -> void:
	if beschaeftigt:
		return
	beschaeftigt = true
	_kommentiert[sn] = true
	await _kommentar(sn)
	beschaeftigt = false


## Die Zeile, die Pixel zu diesem Gegenstand sagt ("" = Ersatzzeile).
func kommentar_zeile(sn: String) -> String:
	var zeile: String = KOMMENTARE.get(nr, {}).get(sn, "")
	if zeile.is_empty() and sn in KOMMENTAR_BLEIBT:
		for frueher in range(nr - 1, 0, -1):
			zeile = KOMMENTARE[frueher].get(sn, "")
			if not zeile.is_empty():
				break
	return zeile


func _kommentar(sn: String) -> void:
	var zeile := kommentar_zeile(sn)
	if zeile.is_empty():
		await Spiel.ersatz("PIX")
	else:
		await Spiel.sagen("PIX", zeile)


## Auswahl übernehmen: Inventar, Fundkiste und Wert TASCHE.
func bestaetigen() -> void:
	beschaeftigt = true
	await Spiel.sagen("PIX", BESTAETIGT.get(nr, ""))
	for sn in auslage:
		await Spiel.abgeben(sn)
	for sn in PFLICHT + wahl:
		await Spiel.geben(sn)
	Zustand.setze_wert("FUNDKISTE", auslage.duplicate())
	Zustand.setze_wert("TASCHE", wahl.duplicate())
	beschaeftigt = false
