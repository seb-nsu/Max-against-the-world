extends Node
## Autoload „Klang“: Audio-Gerüst (04-audio.md). Noch ohne Dateien: Jede Stelle, an der später
## Musik, ein Geräusch, ein Jingle oder eine Stimme kommt, ruft schon hier an. Liegt die Datei
## im Ordner, spielt sie; fehlt sie, bleibt es still, und die ID landet in fehlend (für die
## Liste in tools/audio_liste.py und für Tests).
##
## Dateien (Name = ID, Endung .ogg, .wav oder .mp3):
##   res://audio/musik/<id>          Raum-Stücke und Sonderstücke (titel, werbeblock, abspann …)
##   res://audio/jingles/<id>        kurze Stücke ohne Schleife (aufgehoben, geloest …)
##   res://audio/geraeusche/<id>     Geräusche (ui_klick, wechsel, speichern …)
##   res://audio/stimmen/<sprache>/<ZEILEN_ID>   eine Datei je Sprechblase (Kaskaden _2, _3 eigen)
##
## Busse: Musik, Geraeusche, Stimmen (default_bus_layout.tres), Lautstärken aus den Optionen.
## Ohne Stimmdatei kommt „Brabbel“ (Option brabbel, Probe für P4): je Silbe ein kurzer Ton,
## Tonhöhe und Tempo je Figur. Ohne Geräusch- oder Jingle-Datei spielt ein erzeugter Platzhalter
## (Option platzhalter_klang, skripte/platzhalter_klang.gd). Headless bleibt beides still.

const ORDNER := {
	musik = "res://audio/musik/", jingle = "res://audio/jingles/",
	geraeusch = "res://audio/geraeusche/", stimme = "res://audio/stimmen/",
}
const ENDUNGEN := ["ogg", "wav", "mp3"]
const UEBERBLENDEN := 1.0

## Jingles (04-audio.md, Jingles); die Spiel-Ereignisse rufen jingle(<id>)
const JINGLES := ["aufgehoben", "geloest", "welt_geschafft", "falsch", "lachkonserve", "gluecksrad"]
## Geräusche der Spielsysteme und der Bedienung (04-audio.md, Geräusche: Bedienung, Spielsysteme)
const GERAEUSCHE := ["ui_klick", "inventar", "seite", "kombinieren", "fehler", "wechsel",
	"hinweis", "speichern", "nahansicht", "notiz", "zappomat_sog", "werbeblock_start",
	"umschalten", "gong"]

## Brabbel: Grundton (Hz) und Silben je Sekunde je Sprecherkürzel (04-audio.md, Stimmen)
## Hauptfiguren fest (Stimmen-Tabelle in 04-audio.md); alle anderen bekommen Werte aus ihrem Kürzel.
const BRABBEL := {
	MAX = [150.0, 7.0], PIX = [120.0, 6.0], OPA = [170.0, 6.5], TOA = [420.0, 11.0],
	OMA = [230.0, 6.5], ZEL = [260.0, 8.0], MOD = [200.0, 7.5], HUM = [130.0, 6.0],
	ALW = [190.0, 5.5], GOL = [240.0, 9.0], WAL = [95.0, 5.0], SMA = [110.0, 6.0],
	TIR = [160.0, 7.0], RAM = [140.0, 6.0], CIC = [175.0, 8.0], LEO = [120.0, 7.0],
	ARC = [165.0, 8.0], HER = [210.0, 11.0], MOR = [115.0, 5.0], ORA = [240.0, 6.0],
	DEC = [135.0, 6.0], VIE = [185.0, 7.5], KAL = [200.0, 9.0], HAU = [100.0, 6.0],
	MUT = [250.0, 7.0], GER = [190.0, 10.0], KOM = [145.0, 6.5], NSP = [150.0, 7.0],
	HYA = [300.0, 10.0], GST = [450.0, 9.0], PIE = [900.0, 14.0],
}
## Figuren ohne Stimme (04-audio.md: stumm)
const STUMM := ["NAR", "TOI", "SKR", "BER"]
const BRABBEL_STANDARD := [220.0, 8.0]
const MISCHRATE := 22050.0

var aktuelle_musik := ""
## Angefragte IDs ohne Datei: "musik/w1_dorf" → true
var fehlend := {}
## Zuletzt angefragte Klänge (für Tests): ["musik/titel", "jingle/geloest", …]
var protokoll: Array[String] = []

var _musik: Array[AudioStreamPlayer] = []
var _aktiv := 0
var _geraeusche: Array[AudioStreamPlayer] = []
var _stimme: AudioStreamPlayer
var _brabbel: AudioStreamPlayer
var _tween: Tween


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	for i in 2:
		_musik.append(_spieler("Musik"))
	for i in 6:
		_geraeusche.append(_spieler("Geraeusche"))
	_stimme = _spieler("Stimmen")
	_brabbel = _spieler("Stimmen")
	var gen := AudioStreamGenerator.new()
	gen.mix_rate = MISCHRATE
	gen.buffer_length = 4.0
	_brabbel.stream = gen
	# Im Browser spielt Godot sonst als „Sample“ ab, und ein Generator lässt sich nicht sampeln
	_brabbel.playback_type = AudioServer.PLAYBACK_TYPE_STREAM


func _spieler(bus: String) -> AudioStreamPlayer:
	var p := AudioStreamPlayer.new()
	p.bus = bus if AudioServer.get_bus_index(bus) >= 0 else "Master"
	add_child(p)
	return p


## Datei zu einer ID, "" wenn es keine gibt (die ID wird als fehlend gemerkt).
func datei(art: String, id: String) -> String:
	var basis: String = ORDNER.get(art, "") + id
	for e in ENDUNGEN:
		if ResourceLoader.exists(basis + "." + e):
			return basis + "." + e
	fehlend["%s/%s" % [art, id]] = true
	return ""


#region Musik ######################################################################################
## Raum-Stück aus der Welt-Tabelle (Feld musik beim Raum); ohne Angabe läuft das alte weiter.
func raum_musik(raum_id: String) -> void:
	var id := musik_fuer_raum(raum_id)
	if not id.is_empty():
		musik(id)


func musik_fuer_raum(raum_id: String) -> String:
	var abschnitte: Array = [Zustand.abschnitt]
	abschnitte.append_array(Bauplan.welten.keys())
	for ab in abschnitte:
		for r in Bauplan.welten.get(ab, {}).get("raeume", []):
			if r.get("id", "") == raum_id and r.has("musik"):
				return str(r.musik)
	return ""


## Stück wechseln (überblenden). Dasselbe Stück läuft einfach weiter.
func musik(id: String) -> void:
	if id == aktuelle_musik:
		return
	aktuelle_musik = id
	protokoll.append("musik/" + id)
	var pfad := datei("musik", id)
	var alt := _musik[_aktiv]
	_aktiv = 1 - _aktiv
	var neu := _musik[_aktiv]
	if is_instance_valid(_tween):
		_tween.kill()
	_tween = null
	if not alt.playing and pfad.is_empty():
		return
	# Neues Stück ein- und altes gleichzeitig ausblenden, das alte danach anhalten
	_tween = create_tween().set_parallel()
	if not pfad.is_empty():
		neu.stream = load(pfad)
		neu.volume_db = -40.0
		neu.play()
		_tween.tween_property(neu, "volume_db", 0.0, UEBERBLENDEN)
	if alt.playing:
		_tween.tween_property(alt, "volume_db", -40.0, UEBERBLENDEN)
		_tween.chain().tween_callback(alt.stop)


func musik_stopp() -> void:
	aktuelle_musik = ""
	for m in _musik:
		m.stop()


#endregion

#region Geräusche und Jingles ######################################################################
func geraeusch(id: String) -> void:
	_kurz("geraeusch", id)


func jingle(id: String) -> void:
	_kurz("jingle", id)


func _kurz(art: String, id: String) -> void:
	protokoll.append("%s/%s" % [art, id])
	var pfad := datei(art, id)
	var strom: AudioStream = null
	if not pfad.is_empty():
		strom = load(pfad)
	elif Einstellungen.wert("platzhalter_klang") and not _headless():
		strom = CQPlatzhalterKlang.klang(id)   # bis die Datei da ist: erzeugter Platzhalter
	if strom == null:
		return
	for p in _geraeusche:
		if not p.playing:
			p.stream = strom
			p.play()
			return


## Ohne Ausgabe (Tests, Server) nichts erzeugen: spart Rechenzeit bei tausenden Zeilen.
static func _headless() -> bool:
	return DisplayServer.get_name() == "headless"


#endregion

#region Stimmen ####################################################################################
## Eine Sprechblase beginnt (Spiel.sagen). Stimmdatei der aktuellen Sprache, sonst Brabbel
## (wenn eingeschaltet), sonst nichts.
func zeile(kuerzel: String, schluessel: String, text: String) -> void:
	if kuerzel in STUMM:
		return
	_stimme.stop()
	var pfad := datei("stimme", "%s/%s" % [TranslationServer.get_locale().left(2), schluessel])
	if not pfad.is_empty():
		_stimme.stream = load(pfad)
		_stimme.play()
	elif Einstellungen.wert("brabbel") and not _headless():
		brabbeln(kuerzel, text)


## Silben grob zählen: Gruppen von Selbstlauten.
static func silben(text: String) -> int:
	var re := RegEx.new()
	re.compile("[aeiouäöüyAEIOUÄÖÜY]+")
	return maxi(1, re.search_all(text).size())


## Grundton und Tempo einer Figur: fest aus BRABBEL, sonst aus dem Kürzel abgeleitet (gleich bei
## jedem Start, damit eine Figur immer gleich klingt).
static func stimme(kuerzel: String) -> Array:
	if BRABBEL.has(kuerzel):
		return BRABBEL[kuerzel]
	if kuerzel.is_empty():
		return BRABBEL_STANDARD
	var h := absi(hash(kuerzel))
	return [120.0 + float(h % 260), 6.0 + float((h / 7) % 5)]


func brabbeln(kuerzel: String, text: String) -> void:
	var p: Array = stimme(kuerzel)
	var n := mini(silben(text), 40)
	if not _brabbel.playing:
		_brabbel.play()
	var puffer := _brabbel.get_stream_playback() as AudioStreamGeneratorPlayback
	if puffer == null:
		return
	var dauer := 1.0 / float(p[1])
	var zufall := RandomNumberGenerator.new()
	zufall.seed = hash(text)
	for s in n:
		var hz: float = p[0] * zufall.randf_range(0.85, 1.25)
		var proben := int(MISCHRATE * dauer)
		var frames := PackedVector2Array()
		frames.resize(proben)
		for i in proben:
			var t := float(i) / MISCHRATE
			var huelle := minf(1.0, minf(t * 60.0, (dauer - t) * 30.0)) if t < dauer * 0.7 else 0.0
			var w := sin(TAU * hz * t) * 0.25 * maxf(huelle, 0.0)
			frames[i] = Vector2(w, w)
		if puffer.can_push_buffer(proben):
			puffer.push_buffer(frames)


#endregion
