extends Node
## Autoload „Klang“: Audio-Gerüst (04-audio.md). Noch ohne Dateien: Jede Stelle, an der später
## Musik, ein Geräusch, ein Jingle oder eine Stimme kommt, ruft schon hier an. Liegt die Datei
## im Ordner, spielt sie; fehlt sie, bleibt es still, und die ID landet in fehlend (für die
## Liste in tools/audio_liste.py und für Tests).
##
## Dateien (Name = ID, Endung .ogg, .wav oder .mp3):
##   res://audio/musik/<id>          Raum-Stücke und Sonderstücke (titel, werbeblock, abspann …)
##   res://audio/jingles/<id>        kurze Stücke ohne Schleife (aufgehoben, geloest …)
##   res://audio/geraeusche/<id>     Geräusche (ui_klick, wechsel, speichern …), auch die Schleifen
##                                   der Atmosphäre (w1_atmo, regen_strasse, uhr_ticken …)
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

## Kennung „kein Stück“ im Feld musik eines Raums (Supermarkt im Finale): Die Musik blendet aus.
const STILLE := "stille"
## Kennung „keine Atmosphäre“ im Feld atmo eines Raums
const KEINE_ATMO := "keine"
## Lautstärke der Schleifen (Atmosphäre) in dB: leise unter der Musik
const ATMO_DB := -14.0
## Tupfer (einzelne Laute zur Atmosphäre, Feld tupfer): Abstand in Sekunden, von bis
const TUPFER_ABSTAND := [14.0, 32.0]

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

## Stimmen ohne Datei, nur für Tests: Schlüssel der Sprechblase → AudioStream
var probe_stimmen := {}

var _musik: Array[AudioStreamPlayer] = []
var _aktiv := 0
var _geraeusche: Array[AudioStreamPlayer] = []
var _stimme: AudioStreamPlayer
var _brabbel: AudioStreamPlayer
var _tween: Tween
## Atmosphäre: eine leise Schleife je Raum (Feld atmo der Welt-Tabelle), dazu ein Tupfer
var aktuelle_atmo := ""
var aktueller_tupfer := ""
var _atmo: AudioStreamPlayer
var _tupfer_in := 0.0


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	for i in 2:
		_musik.append(_spieler("Musik"))
	for i in 6:
		_geraeusche.append(_spieler("Geraeusche"))
	_atmo = _spieler("Geraeusche")
	_atmo.volume_db = ATMO_DB
	_atmo.finished.connect(_atmo_weiter)
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
## Die Regeln des Abschnitts dürfen ein anderes Stück nennen (Wert „musik“: Finale, solange die
## Maschine läuft). „stille“ heißt: kein Stück, die Musik blendet aus.
func raum_musik(raum_id: String) -> void:
	var id := musik_fuer_raum(raum_id)
	var eigene = Spiel.regel_wert("musik", raum_id)
	if eigene is String and not eigene.is_empty():
		id = eigene
	if id == STILLE:
		musik_aus()
	elif not id.is_empty():
		musik(id)


func musik_fuer_raum(raum_id: String) -> String:
	return _raum_feld(raum_id, "musik")


## Feld eines Raums aus der Welt-Tabelle: erst der aktuelle Abschnitt, dann alle anderen.
func _raum_feld(raum_id: String, feld: String) -> String:
	var abschnitte: Array = [Zustand.abschnitt]
	abschnitte.append_array(Bauplan.welten.keys())
	for ab in abschnitte:
		for r in Bauplan.welten.get(ab, {}).get("raeume", []):
			if r.get("id", "") == raum_id and r.has(feld):
				return str(r[feld])
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


## Das laufende Stück von einer Stelle (Sekunden) neu starten: Das Rhythmus-Minispiel legt seinen
## ersten Schlag auf den Takt der Musik (skripte/minispiele/zombie_tanz.gd, VERSATZ). Ohne Datei
## passiert nichts.
func musik_von_vorn(ab := 0.0) -> void:
	protokoll.append("musik_von_vorn/" + aktuelle_musik)
	var p := _musik[_aktiv]
	if p.stream != null and p.playing:
		p.play(maxf(0.0, ab))


func musik_stopp() -> void:
	aktuelle_musik = ""
	for m in _musik:
		m.stop()


## Kein Stück: Das laufende blendet aus (Supermarkt im Finale, nur Kühlregal und Türgong).
func musik_aus() -> void:
	if aktuelle_musik.is_empty():
		return
	aktuelle_musik = ""
	protokoll.append("musik/" + STILLE)
	if is_instance_valid(_tween):
		_tween.kill()
	_tween = null
	for m in _musik:
		if m.playing:
			var t := create_tween()
			t.tween_property(m, "volume_db", -40.0, UEBERBLENDEN)
			t.tween_callback(m.stop)


#endregion

#region Geräusche und Jingles ######################################################################
## tonhoehe: 1.0 = wie aufgenommen, kleiner = tiefer und länger.
func geraeusch(id: String, tonhoehe := 1.0) -> void:
	_kurz("geraeusch", id, tonhoehe)


func jingle(id: String) -> void:
	_kurz("jingle", id)


func _kurz(art: String, id: String, tonhoehe := 1.0) -> void:
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
			p.pitch_scale = tonhoehe
			p.play()
			return


## Klang zu einem Tabelleneintrag aus CQKlangEinsatz: „<id>“ ist ein Geräusch, „jingle/<id>“ ein
## Jingle.
func einsatz(eintrag: String) -> void:
	if eintrag.is_empty():
		return
	if eintrag.begins_with("jingle/"):
		jingle(eintrag.trim_prefix("jingle/"))
	else:
		geraeusch(eintrag)


## Geräusche und Laute zu einer Skriptzeile (Spiel.sagen ruft das zu Beginn jeder Zeile).
func zeilen_klang(kuerzel: String, zeile: String) -> void:
	for k in CQKlangEinsatz.fuer_zeile(kuerzel, zeile, Zustand.abschnitt):
		if k == CQKlangEinsatz.LAUT.get(kuerzel, ""):
			geraeusch(k, CQKlangEinsatz.LAUT_TONHOEHE.get(kuerzel, 1.0))
		else:
			einsatz(k)
	var stueck: String = CQKlangEinsatz.MUSIK.get(zeile, "")
	if stueck == "raum":
		if is_instance_valid(R.current) and R.current.has_method("raum_id"):
			raum_musik(R.current.raum_id())
	elif not stueck.is_empty():
		musik(stueck)


## Ohne Ausgabe (Tests, Server) nichts erzeugen: spart Rechenzeit bei tausenden Zeilen.
static func _headless() -> bool:
	return DisplayServer.get_name() == "headless"


#endregion

#region Atmosphäre #################################################################################
## Atmosphäre des Raums aus der Welt-Tabelle: Feld atmo (eine Schleife, „keine“ = still) und Feld
## tupfer (ein Laut, der alle paar Sekunden dazukommt). Die Regeln dürfen eine andere Schleife
## nennen (Wert „atmo“).
func raum_atmo(raum_id: String) -> void:
	var id := _raum_feld(raum_id, "atmo")
	var eigene = Spiel.regel_wert("atmo", raum_id)
	if eigene is String and not eigene.is_empty():
		id = eigene
	atmo("" if id == KEINE_ATMO else id)
	aktueller_tupfer = _raum_feld(raum_id, "tupfer")
	_tupfer_in = randf_range(TUPFER_ABSTAND[0], TUPFER_ABSTAND[1])


## Schleife wechseln. Dieselbe läuft weiter, "" hält sie an.
func atmo(id: String) -> void:
	if id == aktuelle_atmo:
		return
	aktuelle_atmo = id
	protokoll.append("atmo/" + (id if not id.is_empty() else KEINE_ATMO))
	_atmo.stop()
	if id.is_empty():
		return
	var pfad := datei("geraeusch", id)
	var strom: AudioStream = null
	if not pfad.is_empty():
		strom = load(pfad)
	elif Einstellungen.wert("platzhalter_klang") and not _headless():
		strom = CQPlatzhalterKlang.schleife(id)
	if strom == null:
		return
	_atmo.stream = strom
	_atmo.play()


## Die Datei muss keine Schleife sein: Am Ende beginnt sie von vorn.
func _atmo_weiter() -> void:
	if not aktuelle_atmo.is_empty() and _atmo.stream != null:
		_atmo.play()


func _process(delta: float) -> void:
	if aktueller_tupfer.is_empty() or get_tree().paused:
		return
	_tupfer_in -= delta
	if _tupfer_in <= 0.0:
		_tupfer_in = randf_range(TUPFER_ABSTAND[0], TUPFER_ABSTAND[1])
		geraeusch(aktueller_tupfer)


#endregion

#region Stimmen ####################################################################################
## Eine Sprechblase beginnt (Spiel.sagen). Stimmdatei der aktuellen Sprache, sonst Brabbel
## (wenn eingeschaltet), sonst nichts.
func zeile(kuerzel: String, schluessel: String, text: String) -> void:
	if kuerzel in STUMM:
		return
	if CQKlangEinsatz.hat_laut(kuerzel):
		return  # Laut statt Stimme: kommt über zeilen_klang()
	_stimme.stop()
	var aufnahme := stimme_zu(schluessel)
	if aufnahme != null:
		_stimme.stream = aufnahme
		_stimme.play()
	elif Einstellungen.wert("brabbel") and not _headless():
		brabbeln(kuerzel, text)


## Aufnahme zu einer Sprechblase in der aktuellen Sprache, null wenn es keine gibt.
func stimme_zu(schluessel: String) -> AudioStream:
	if probe_stimmen.has(schluessel):
		return probe_stimmen[schluessel]
	var pfad := datei("stimme", "%s/%s" % [TranslationServer.get_locale().left(2), schluessel])
	return load(pfad) if not pfad.is_empty() else null


## Gibt es zu dieser Sprechblase eine Aufnahme? Nur dann darf ihr Text bei „Untertitel aus“
## wegbleiben (Spiel.blase_zeigen).
func hat_stimme(schluessel: String) -> bool:
	return stimme_zu(schluessel) != null


## Wartet, bis die laufende Aufnahme zu Ende ist (Sprechblase ohne Text bei „Untertitel aus“).
## Ein Klick, „Text weiter“ oder das Überspringen der Szene beendet die Zeile vorher.
func stimme_abwarten() -> void:
	var rest := 0.0
	if _stimme.stream != null:
		rest = _stimme.stream.get_length()
	if rest <= 0.0:
		rest = 2.0  # Länge unbekannt (Stream ohne Dauer)
	var gedrueckt := true  # der Klick, der die vorige Zeile beendet hat, zählt nicht
	while rest > 0.0 and _stimme.playing:
		if is_instance_valid(E) and E.cutscene_skipped:
			break
		var jetzt := Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) \
			or Input.is_action_pressed("cq_text_weiter")
		if jetzt and not gedrueckt:
			break
		gedrueckt = jetzt
		await get_tree().process_frame
		rest -= get_process_delta_time()
	_stimme.stop()


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
