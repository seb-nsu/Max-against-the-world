class_name CQEffekte
extends RefCounted
## Effekte, die die Barrierefreiheits-Optionen beachten (05-spielsysteme.md, Optionen). Wer im
## Spiel wackeln, flackern oder mit Farben codieren will, geht über diese Funktionen, damit die
## Schalter überall gleich wirken:
## - wackeln(): Bildschirmwackeln, entfällt bei „Bildschirmwackeln aus“
## - zeilen_wackeln(): Wackeln, das an einer Skriptzeile hängt (Tabelle WACKELN; Spiel.sagen)
## - wackeln_ebene(): dasselbe für eine Überlagerung (Minispiele liegen über der Kamera)
## - flackern_erlaubt(): false bei „Flackern reduzieren“; dann die weiche Variante zeigen
##   (Lampe dimmt langsam statt zu flackern, Umschalt-Störung als kurze Blende)
## - weich_blinken(): Helligkeit für eine flackernde Lichtquelle, mit der Option als sanftes Pulsieren
## - farbsymbol(): Zeichen zu einer Farbe für die Farbenblind-Hilfe (Welt 3, Rätsel 7: Kreis auf
##   Rot, Dreieck auf Grün, Quadrat auf Gelb), leer, solange die Hilfe aus ist
## - mit_sprecher(): setzt mit der Farbenblind-Hilfe den Namen der Figur vor ihre Sprechblase.
##   Wer spricht, zeigt sonst nur die Farbe der Schrift.
## - lied_text(): Liedzeilen kursiv mit einer Note davor (Untertitel, die immer erscheinen)
## - schriften_einrichten(): hängt die Zeichen an, die den beiden Schriften fehlen, und gibt dem
##   Thema eine kursive Schrift

## Wie im Kabelrätsel von Welt 3 (raetsel/welt-3.md, R7); Blau hat dort keine Buchse.
const SYMBOLE := {rot = "●", gruen = "▲", gelb = "■", blau = "◆"}

## Wackeln, das an einer Skriptzeile hängt: Zeilen-ID → [Stärke, Dauer in Sekunden]. Es beginnt
## mit der Zeile. tools/audio_liste.py prüft die IDs gegen das Skript.
const WACKELN := {
	"W4_KAPI_NAR_0050": [2.0, 0.4],   # der Amboss trifft Pixel
	"W4_WERB_NAR_0230": [2.0, 0.4],   # der Amboss schlägt neben Werbepause ein
	"W4_FABR_NAR_0190": [1.5, 0.3],   # Max kracht auf den Deckel
	"W4_ARCH_MAX_0060": [1.0, 0.6],   # die Wände der Müllpresse rücken vor
	"FI_DACH_NAR_0190": [1.0, 0.8],   # die Maschine brummt an
	"FI_RAET_NAR_0290": [1.5, 0.8],   # die Maschine wird viel lauter
	"FI_RAET_NAR_0350": [1.5, 0.4],   # die Ofentür fliegt auf
}

## Schriften des Spiels und die Zeichen, die ihnen fehlen (tools/symbolschrift.py baut die Datei)
const SCHRIFTEN := ["res://schriften/nunito-extrabold.ttf", "res://schriften/pixelify-sans.ttf"]
const SYMBOLSCHRIFT := "res://schriften/symbole.ttf"
const SYMBOL_ZEICHEN := "✓✗♪●▲■◆↔"
const NOTE := "♪"
const THEMA := "res://game/gui/resources/gui_theme.tres"

## Zeilen, bei denen es gewackelt hat (für Tests), neueste zuletzt
static var gewackelt: Array[String] = []
## Die Schriften mit angehängter Symbolschrift. Die Liste hält sie im Speicher: Eine Schrift, die
## gerade niemand braucht (Pixelify Sans, solange kein Titel sie setzt), würde sonst entladen und
## käme beim nächsten Laden ohne die Symbole zurück.
static var _schriften: Array[Font] = []


## Liefert false, wenn die Option das Wackeln abgeschaltet hat oder es keine Kamera gibt.
static func wackeln(staerke := 1.0, dauer := 0.5) -> bool:
	if Einstellungen.wert("wackeln_aus") or not is_instance_valid(E) or not E.camera:
		return false
	E.camera.shake_bg(staerke, dauer)
	return true


## Wackeln zu einer Skriptzeile (Spiel.sagen ruft das zu Beginn jeder Zeile).
static func zeilen_wackeln(zeile: String) -> bool:
	if not WACKELN.has(zeile):
		return false
	var w: Array = WACKELN[zeile]
	if not wackeln(w[0], w[1]):
		return false
	gewackelt.append(zeile)
	return true


## Eine Überlagerung (CanvasLayer) wackeln lassen: Die Kamera des Raums erreicht sie nicht.
## Liefert false, wenn die Option das Wackeln abgeschaltet hat.
static func wackeln_ebene(ebene: CanvasLayer, staerke := 3.0, dauer := 0.4) -> bool:
	if Einstellungen.wert("wackeln_aus") or not is_instance_valid(ebene) or not ebene.is_inside_tree():
		return false
	var t := ebene.create_tween()
	var schritte := maxi(2, int(dauer / 0.04))
	for i in schritte:
		var rest := 1.0 - float(i) / schritte
		t.tween_property(ebene, "offset",
			Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)) * staerke * rest, 0.04)
	t.tween_property(ebene, "offset", Vector2.ZERO, 0.04)
	return true


static func flackern_erlaubt() -> bool:
	return not Einstellungen.wert("flackern_reduzieren")


## Helligkeit 0 bis 1 zur Zeit t (Sekunden): hartes Flackern oder, mit „Flackern reduzieren“,
## ein langsames Pulsieren unter einmal je Sekunde (weit unter den kritischen 3 Hz).
static func weich_blinken(t: float, takt := 8.0) -> float:
	if flackern_erlaubt():
		return 1.0 if fmod(t * takt, 1.0) < 0.5 else 0.3
	return 0.65 + 0.35 * cos(t * TAU * 0.6)


static func farbsymbol(farbe: String) -> String:
	return SYMBOLE.get(farbe, "") if Einstellungen.wert("farbenblind") else ""


## Auswahl mit dem Zeichen der Farbe davor („● Buchse Rot (Kreis)“), solange die Farbenblind-Hilfe
## an ist: dann der fertige Text, sonst der Schlüssel unverändert (Spiel.auswahl übersetzt ihn).
static func mit_farbsymbol(farbe: String, schluessel: String) -> String:
	var z := farbsymbol(farbe)
	if z.is_empty():
		return schluessel
	return "%s %s" % [z, TranslationServer.translate(schluessel)]


## Sprechblase mit dem Namen der Figur davor („Opa: …“), solange die Farbenblind-Hilfe an ist.
static func mit_sprecher(name: String, text: String) -> String:
	if name.is_empty() or not Einstellungen.wert("farbenblind"):
		return text
	return "%s: %s" % [name, text]


## Eine Liedzeile als Untertitel: kursiv mit einer Note davor (04-audio.md, gesungene Stücke).
static func lied_text(text: String) -> String:
	return "[i]%s %s[/i]" % [NOTE, text]


## Hängt die Symbolschrift als Ersatz an beide Schriften: Haken, Kreuz, Note, die Formen der
## Farbenblind-Hilfe und der Tauschpfeil fehlen in Nunito und Pixelify Sans. Am Rechner springt
## dafür eine Schrift des Systems ein, im Browser-Build gibt es keine.
static func symbolschrift_anhaengen() -> void:
	if not ResourceLoader.exists(SYMBOLSCHRIFT):
		return
	var symbole: Font = load(SYMBOLSCHRIFT)
	for pfad in SCHRIFTEN:
		if not ResourceLoader.exists(pfad):
			continue
		var schrift: Font = load(pfad)
		if not symbole in schrift.fallbacks:
			var ersatz: Array[Font] = schrift.fallbacks.duplicate()
			ersatz.append(symbole)
			schrift.fallbacks = ersatz
		if not schrift in _schriften:
			_schriften.append(schrift)


## Beim Start (Einstellungen._ready): Symbolschrift anhängen und dem Thema eine kursive Schrift
## für Liedzeilen geben.
static func schriften_einrichten() -> void:
	symbolschrift_anhaengen()
	if ResourceLoader.exists(THEMA) and ResourceLoader.exists(SCHRIFTEN[0]):
		var thema: Theme = load(THEMA)
		thema.set_font("italics_font", "RichTextLabel", kursiv(load(SCHRIFTEN[0])))


## Kursive Fassung einer Schrift (schräg gestellt): Nunito hat keinen eigenen kursiven Schnitt.
static func kursiv(schrift: Font) -> FontVariation:
	var k := FontVariation.new()
	k.base_font = schrift
	k.variation_transform = Transform2D(Vector2(1.0, 0.2), Vector2(0.0, 1.0), Vector2.ZERO)
	return k


## Rauchwolke an einer Stelle im Raum (Verwandlung, Fluch), Review Fund 18: fünf weiche Kreise,
## die aufquellen und verblassen. Wartet, bis die Wolke am dichtesten ist (dann tauscht man das
## Bild darunter), und räumt danach selbst auf.
static func rauchwolke(raum: Node, ort: Vector2, groesse := 34.0) -> void:
	if not is_instance_valid(raum) or PopochiuUtils.e.cutscene_skipped or Spiel.testmodus:
		return
	var wolke := Node2D.new()
	wolke.position = ort
	wolke.z_index = 50
	raum.add_child(wolke)
	var t := wolke.create_tween().set_parallel()
	for i in 5:
		var kreis := Polygon2D.new()
		var punkte := PackedVector2Array()
		for k in 14:
			var w := TAU * k / 14.0
			punkte.append(Vector2(cos(w), sin(w) * 0.85) * groesse * 0.5)
		kreis.polygon = punkte
		kreis.color = Color("c0cbdc") if i % 2 == 0 else Color("8b9bb4")
		kreis.position = Vector2(cos(i * 1.3) * groesse * 0.45, -groesse * 0.4 + sin(i * 1.7) * groesse * 0.35)
		kreis.scale = Vector2(0.3, 0.3)
		wolke.add_child(kreis)
		t.tween_property(kreis, "scale", Vector2(1.2, 1.2), 0.35).set_ease(Tween.EASE_OUT)
		t.tween_property(kreis, "position", kreis.position + Vector2(0, -10), 0.9)
	await wolke.get_tree().create_timer(0.35).timeout
	var aus := wolke.create_tween()
	aus.tween_property(wolke, "modulate:a", 0.0, 0.55)
	aus.tween_callback(wolke.queue_free)
