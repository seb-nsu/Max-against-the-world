extends CQMinispiel
## Spielfläche des Zombie-Tanzes (raetsel/welt-4.md, Rätsel 5: Das Zombie-Video; Regeln in
## skripte/minispiele/zombie_tanz.gd). Oben der Friedhof: sechs Zombies treten auf jeden Schlag,
## die Leuchtfliesen blinken mit. Darunter der Taktbalken: Ein Zeiger läuft von Schlag zu Schlag,
## das markierte Mittelstück ist „gegen den Takt“. Max tritt mit Klick, Leertaste, Enter oder A
## auf. Jeder Gegenschritt füllt die Anzeige „Durcheinander“, jeder Schritt im Takt leert sie.
##
## Barrierefreiheit: Treffer und Fehler haben Zeichen und Text, nicht nur Farben. Mit „Flackern
## reduzieren“ pulsieren die Fliesen weich statt hart zu blinken (unter 2 Hz). Mit
## „Bildschirmwackeln aus“ entfällt das Wackeln beim Zusammenstoß. Nach zwei Fehlversuchen bietet
## Flimmer an, die Zombies abzuschalten (skripte/welt_4.gd).

signal runde_vorbei(gewonnen: bool)

const FENSTER := Rect2(40, 6, 560, 348)
const BILD := Rect2(8, 22, 544, 200)
const BALKEN := Rect2(40, 244, 480, 22)
const NACHT := Color("3a2a50")
const FLIESE := Color("5a4a80")
const FLIESE_AN := Color("f6d743")
const ZOMBIE := Color("6f8f6a")
const GUT := Color("63c74d")
const SCHLECHT := Color("e43b44")
const ZOMBIES := 6
const BODEN := 168.0

var tanz: CQZombieTanz

var _fenster: Panel
var _bild: Control
var _leiste: Control
var _rueckmeldung: Label
var _laeuft := false
## Sekunden seit dem ersten Schlag der Runde; negativ beim Einzählen
var _t := 0.0
var _schlag := -99
## Kurzes Aufleuchten nach einem Schritt: 1 bis 0
var _schritt_blitz := 0.0
var _schritt_gut := false
var _haufen := 0.0


func zeigen(t: CQZombieTanz) -> void:
	tanz = t
	_fenster = STIL.panel(FENSTER.position, FENSTER.size)
	add_child(_fenster)
	var titel := STIL.label(tr("UI_MS_TANZ_TITEL"), 9, STIL.GELB)
	titel.position = Vector2(8, 1)
	_fenster.add_child(titel)
	_bild = Control.new()
	_bild.position = BILD.position
	_bild.size = BILD.size
	_bild.clip_contents = true
	_bild.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bild.draw.connect(_bild_zeichnen)
	_fenster.add_child(_bild)
	_leiste = Control.new()
	_leiste.position = Vector2(0, 226)
	_leiste.size = Vector2(FENSTER.size.x, 80)
	_leiste.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_leiste.draw.connect(_leiste_zeichnen)
	_fenster.add_child(_leiste)
	_rueckmeldung = STIL.label("", 10)
	_rueckmeldung.position = Vector2(40, 300)
	_rueckmeldung.size = Vector2(480, 18)
	_rueckmeldung.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_fenster.add_child(_rueckmeldung)
	var hilfe := STIL.label(tr("UI_MS_TANZ_HILFE"), 8, STIL.GRAU)
	hilfe.position = Vector2(12, 322)
	hilfe.size = Vector2(536, 20)
	hilfe.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_fenster.add_child(hilfe)
	blase("Max", FENSTER.position + BILD.position + Vector2(70, BODEN - 66))
	blase("Zombie", FENSTER.position + BILD.position + Vector2(300, BODEN - 66))


## Eine Runde tanzen: true, wenn die Zombies übereinander liegen. Im Testmodus kommt der Ausgang
## aus Spiel.vorgabe_auswahl (1 = gegen den Takt, 0 = im Takt) und wird über die Regeln
## durchgespielt: je Schlag ein Schritt genau dazwischen oder genau darauf.
func runde() -> bool:
	if automatik():
		var w := int(Spiel.vorgabe_auswahl.pop_front()) if not Spiel.vorgabe_auswahl.is_empty() else 1
		Telemetrie.auswahl("UI_W4_TANZ_GEGEN" if w == 1 else "UI_W4_TANZ_TAKT", w)
		for s in CQZombieTanz.SCHLAEGE:
			tanz.schritt((s + (0.5 if w == 1 else 0.0)) * tanz.abstand)
		return tanz.fertig()
	_t = -CQZombieTanz.EINZAEHLEN * tanz.abstand
	_schlag = -99
	_haufen = 0.0
	_rueckmeldung.text = tr("UI_MS_TANZ_EINZAEHLEN")
	_rueckmeldung.add_theme_color_override("font_color", Color.WHITE)
	Klang.musik_von_vorn(CQZombieTanz.VERSATZ)  # erster Schlag des Einzählens = erster Schlag des Stücks
	_laeuft = true
	var gewonnen: bool = await runde_vorbei
	_laeuft = false
	if gewonnen:
		# Zusammenstoß: Die Zombies laufen ineinander und bleiben als Haufen liegen
		Klang.geraeusch("zombie")
		CQEffekte.wackeln_ebene(self, 4.0, 0.5)
		if not Spiel.testmodus:
			var t := create_tween()
			t.tween_property(self, "_haufen", 1.0, 0.6)
			await t.finished
		_haufen = 1.0
	return gewonnen


## Max tritt auf (Klick, Leertaste, Enter oder A).
func auftreten() -> void:
	if not _laeuft or _t < 0.0:
		return
	var e := tanz.schritt(_t)
	if e == "doppelt" or e == "vorbei":
		return
	_schritt_gut = e == "gegen"
	_schritt_blitz = 1.0
	_rueckmeldung.text = ("✓ " if _schritt_gut else "✗ ") + tr("UI_W4_TANZ_GEGEN" if _schritt_gut else "UI_W4_TANZ_TAKT")
	_rueckmeldung.add_theme_color_override("font_color", GUT if _schritt_gut else SCHLECHT)
	Klang.geraeusch("tanz_schritt" if _schritt_gut else "fehler")
	_pruefen()


func _pruefen() -> void:
	if not _laeuft:
		return
	if tanz.fertig():
		_laeuft = false
		runde_vorbei.emit(true)
	elif tanz.vorbei(_t):
		_laeuft = false
		runde_vorbei.emit(false)


func _input(event: InputEvent) -> void:
	if not _laeuft:
		return
	var klick: bool = event is InputEventMouseButton and event.pressed \
		and event.button_index == MOUSE_BUTTON_LEFT
	var taste: bool = event.is_action_pressed("ui_accept") and not event.is_echo()
	if klick or taste:
		get_viewport().set_input_as_handled()
		auftreten()


func _process(delta: float) -> void:
	_schritt_blitz = maxf(0.0, _schritt_blitz - delta * 3.0)
	if _laeuft:
		_t += delta
		var schlag := floori(_t / tanz.abstand)
		if schlag != _schlag:
			_schlag = schlag
			Klang.geraeusch("takt")
			if _t >= 0.0 and _rueckmeldung.text == tr("UI_MS_TANZ_EINZAEHLEN"):
				_rueckmeldung.text = ""
		_pruefen()
	if is_instance_valid(_bild):
		_bild.queue_redraw()
		_leiste.queue_redraw()


## Wie stark der letzte Schlag noch nachwirkt (1 direkt auf dem Schlag, 0 kurz vor dem nächsten)
func _puls() -> float:
	if not _laeuft:
		return 0.0
	var ph := fposmod(_t / tanz.abstand, 1.0)
	if CQEffekte.flackern_erlaubt():
		return maxf(0.0, 1.0 - ph * 2.5)
	return 0.5 + 0.5 * cos(ph * TAU)  # weiches Pulsieren


func _bild_zeichnen() -> void:
	var b := _bild
	var puls := _puls()
	b.draw_rect(Rect2(Vector2.ZERO, BILD.size), NACHT)
	b.draw_circle(Vector2(470, 40), 22, Color("e8e4c9"))
	for i in 5:  # Grabsteine
		b.draw_rect(Rect2(150 + i * 80, 96, 22, 30), Color("4a4466"))
	# Leuchtfliesen: blinken auf jeden Schlag
	for i in 10:
		var an := FLIESE.lerp(FLIESE_AN, puls * (0.9 if i % 2 == (_schlag & 1) else 0.35))
		b.draw_rect(Rect2(22 + i * 50, BODEN, 48, 18), an)
		b.draw_rect(Rect2(22 + i * 50, BODEN, 48, 18), FIGUR_RAND, false, 1.0)
	# Zombies: hüpfen auf den Schlag; je Punkt gerät einer mehr aus dem Tritt
	var wirr := int(floor(float(tanz.punkte) * ZOMBIES / CQZombieTanz.ZIEL))
	for i in ZOMBIES:
		var x := 190.0 + i * 58.0
		var hoch := puls * 8.0
		var dreh := 0.0
		if i < wirr:
			dreh = 0.3 * (1.0 if i % 2 == 0 else -1.0)
			hoch = (1.0 - puls) * 8.0  # tritt jetzt auch daneben
			if _haufen <= 0.0:
				b.draw_string(schrift(), Vector2(x - 6, BODEN - 70), "?!", HORIZONTAL_ALIGNMENT_LEFT, -1, 10, FLIESE_AN)
		if _haufen > 0.0:
			x = lerpf(x, 335.0 + (i - 2.5) * 8.0, _haufen)
			dreh = lerpf(dreh, PI / 2.0 * (1.0 if i % 2 == 0 else -1.0), _haufen)
			hoch = _haufen * i * 5.0
		figur_zeichnen(b, Vector2(x, BODEN + 2 - hoch), Vector2(26, 58), "ZOM", ZOMBIE, dreh)
	# Max links: springt bei jedem eigenen Schritt
	figur_zeichnen(b, Vector2(70, BODEN + 2 - _schritt_blitz * 10.0), Vector2(26, 58), "MAX")
	b.draw_rect(Rect2(Vector2.ZERO, BILD.size), FIGUR_RAND, false, 1.0)


func _leiste_zeichnen() -> void:
	var l := _leiste
	var r := Rect2(BALKEN.position - _leiste.position, BALKEN.size)
	# Taktbalken: links und rechts ein Schlag, dazwischen das Feld „gegen den Takt“
	l.draw_rect(r, STIL.FELD)
	var mitte := Rect2(r.position.x + r.size.x * (0.5 - CQZombieTanz.FENSTER), r.position.y,
		r.size.x * CQZombieTanz.FENSTER * 2.0, r.size.y)
	l.draw_rect(mitte, Color(GUT, 0.35 + 0.4 * (_schritt_blitz if _schritt_gut else 0.0)))
	l.draw_rect(mitte, GUT, false, 1.0)
	l.draw_string(schrift(), Vector2(mitte.get_center().x - 4, r.position.y + 15), "◆",
		HORIZONTAL_ALIGNMENT_LEFT, -1, 10, Color.WHITE)
	for x in [r.position.x, r.end.x]:
		l.draw_line(Vector2(x, r.position.y - 4), Vector2(x, r.end.y + 4), FLIESE_AN, 3.0)
	l.draw_rect(r, STIL.AKTIV, false, 1.0)
	if _laeuft:
		var ph := fposmod(_t / tanz.abstand, 1.0)
		var x := r.position.x + r.size.x * ph
		l.draw_line(Vector2(x, r.position.y - 6), Vector2(x, r.end.y + 6), Color.WHITE, 3.0)
	# Anzeige „Durcheinander“ und verbleibende Schläge
	l.draw_string(schrift(), Vector2(r.position.x, r.end.y + 20), tr("UI_MS_TANZ_ZAEHLER"),
		HORIZONTAL_ALIGNMENT_LEFT, -1, Einstellungen.schrift(8), Color.WHITE)
	for i in CQZombieTanz.ZIEL:
		var p := Vector2(r.position.x + 150 + i * 16, r.end.y + 15)
		if i < tanz.punkte:
			l.draw_circle(p, 5, FLIESE_AN)
		l.draw_arc(p, 5, 0, TAU, 16, Color.WHITE, 1.0)
	var rest := 1.0
	if _laeuft and _t > 0.0:
		rest = clampf(1.0 - _t / tanz.dauer(), 0.0, 1.0)
	var zeit := Rect2(r.position.x + 300, r.end.y + 11, 180, 8)
	l.draw_rect(Rect2(zeit.position, Vector2(zeit.size.x * rest, zeit.size.y)), STIL.GRAU)
	l.draw_rect(zeit, STIL.AKTIV, false, 1.0)
