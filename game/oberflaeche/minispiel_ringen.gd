extends CQMinispiel
## Spielfläche des Rede-Ringens (raetsel/welt-2.md, Rede-Ringen in der Sandgrube; Regeln in
## skripte/minispiele/rede_ringen.gd). Oben die Sandgrube von der Seite: fünf Schrittlinien, Max
## links, Cicero auf der Linie seiner Beleidigung, rechts die niedrige Mauer. Unten das
## Konter-Panel mit allen gesammelten Kontern; ein falscher Konter bleibt für die Beleidigung, bei
## der er danebenging, ausgegraut. Kein Zeitdruck.
##
## Graubox: Figuren und Grube sind gezeichnete Platzhalter, bis es die Grafik gibt
## (grafik/welt-2.md, Sandgrube).

const ARENA := Rect2(40, 4, 560, 152)
const PANEL := Rect2(40, 158, 560, 198)
## Im Arena-Feld: Boden, erste Linie, Abstand der Linien, Mauer, Max, Pixel
const BODEN := 120.0
const LINIE_X := 176.0
const LINIE_AB := 74.0
const MAUER_X := 508.0
const MAX_X := 92.0
const PIXEL_X := 40.0
const FIGUR_GROESSE := Vector2(28, 58)
const GOLD := Color("fee761")
const HIMMEL := Color("9fd3e8")
const SAND := Color("d6b46a")
const GRUBE := Color("c49a52")
const RAENGE := Color("fff08a")
const KOEPFE := 28

var ringen: CQRedeRingen
## Konter-Nummer → Zeilen-ID des Konters
var texte := {}

var _arena: Control
var _knoepfe := {}
var _cicero_x := LINIE_X
## Linie (1 bis 5, 6 = Mauer) → Stärke des goldenen Leuchtens (1 bis 0)
var _gold := {}
## Stand der Sonne im Zeitraffer (0 bis 1), -1 = normaler Tag
var _sonne := -1.0
var _schlaf := false
var _jubel := 0.0


func zeigen(r: CQRedeRingen, konter_texte: Dictionary) -> void:
	ringen = r
	texte = konter_texte
	_cicero_x = _x_der_linie(r.linie)
	_arena = Control.new()
	_arena.position = ARENA.position
	_arena.size = ARENA.size
	_arena.clip_contents = true
	_arena.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_arena.draw.connect(_zeichnen)
	add_child(_arena)
	var p := STIL.panel(PANEL.position, PANEL.size)
	add_child(p)
	var titel := STIL.label(tr("UI_MS_RINGEN_TITEL"), 9, STIL.GELB)
	titel.position = Vector2(8, 1)
	p.add_child(titel)
	var hilfe := STIL.label(tr("UI_MS_RINGEN_HILFE"), 7, STIL.GRAU)
	hilfe.position = Vector2(120, 4)
	p.add_child(hilfe)
	var hoehe := minf(25.0, (PANEL.size.y - 22.0) / maxf(1.0, r.konter.size()))
	for i in r.konter.size():
		var k: int = r.konter[i]
		var knopf := STIL.knopf(tr(texte.get(k, "")), 8)
		knopf.alignment = HORIZONTAL_ALIGNMENT_LEFT
		knopf.clip_text = true
		knopf.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		knopf.pressed.connect(zug_melden.bind([k]))
		p.add_child(knopf)  # erst im Baum gilt die Schrift des Themas, sonst wird der Knopf zu hoch
		knopf.position = Vector2(8, 21 + i * hoehe)
		knopf.size = Vector2(PANEL.size.x - 16, hoehe - 2)
		_knoepfe[k] = knopf
	_knoepfe_setzen()
	blasen_setzen()


## Sprechblasen von Max und Cicero über ihre Figuren in der Grube legen.
func blasen_setzen() -> void:
	var kopf := ARENA.position.y + BODEN - FIGUR_GROESSE.y - 4.0
	blase("Max", Vector2(ARENA.position.x + MAX_X, kopf))
	blase("Cicero", Vector2(ARENA.position.x + _cicero_x, kopf))


## Wartet auf den Konter des Spielers und liefert seine Nummer. Im Testmodus kommt die Antwort
## aus Spiel.vorgabe_auswahl: der Index in den wählbaren (nicht ausgegrauten) Kontern.
func konter_wahl() -> int:
	var frei := ringen.angebot()
	_knoepfe_setzen()
	if automatik():
		var w := int(Spiel.vorgabe_auswahl.pop_front()) if not Spiel.vorgabe_auswahl.is_empty() else 0
		var k: int = frei[clampi(w, 0, frei.size() - 1)]
		Telemetrie.auswahl(str(texte.get(k, "")), w)
		return k
	if not Spiel.testmodus and not _knoepfe.is_empty():
		for k in frei:
			if _knoepfe.has(k):
				_knoepfe[k].grab_focus.call_deferred()
				break
	var wahl := -1
	while not wahl in frei:  # ein ausgegrauter Konter zählt nicht
		var z: Array = await zug()
		wahl = int(z[0])
	Telemetrie.auswahl(str(texte.get(wahl, "")), frei.find(wahl))
	return wahl


## Treffer: Cicero stolpert auf die nächste Linie (oder über die Mauer), die Linie leuchtet
## golden, das Publikum jubelt. ringen.linie ist schon weitergezählt.
func treffer() -> void:
	Klang.geraeusch("stadion_jubel")
	_gold[ringen.linie] = 1.0
	_jubel = 1.0
	_knoepfe_setzen()
	await _cicero_nach(_x_der_linie(ringen.linie), 0.45)


## Fehlversuch: Ciceros dreistündige Rede im Zeitraffer. Die Sonne wandert, alle schlafen ein.
func zeitraffer() -> void:
	_schlaf = true
	_sonne = 0.0
	if not Spiel.testmodus:
		var t := create_tween()
		t.tween_property(self, "_sonne", 1.0, 2.6)
		await t.finished
	_sonne = -1.0


## Nach dem Zeitraffer: alle wachen auf, Cicero rückt eine Linie zurück (nie hinter Linie 1).
func zurueck() -> void:
	_schlaf = false
	_knoepfe_setzen()
	await _cicero_nach(_x_der_linie(ringen.linie), 0.6)


func _cicero_nach(x: float, dauer: float) -> void:
	if Spiel.testmodus:
		_cicero_x = x
	else:
		var t := create_tween()
		t.tween_property(self, "_cicero_x", x, dauer).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		await t.finished
	blasen_setzen()


func _x_der_linie(l: int) -> float:
	if l > CQRedeRingen.LINIEN:
		return MAUER_X + 34.0  # hinter der Mauer
	return LINIE_X + (l - 1) * LINIE_AB


func _wartet_geaendert() -> void:
	_knoepfe_setzen()


## Ausgegraut ist, was bei der aktuellen Beleidigung schon danebenging.
func _knoepfe_setzen() -> void:
	if ringen == null:
		return
	for k in _knoepfe:
		_knoepfe[k].disabled = ringen.ist_gesperrt(k) and not ringen.gewonnen()


func _process(delta: float) -> void:
	for l in _gold.keys():
		# Mit „Flackern reduzieren“ klingt das Leuchten langsamer ab
		_gold[l] -= delta * (1.2 if CQEffekte.flackern_erlaubt() else 0.6)
		if _gold[l] <= 0.0:
			_gold.erase(l)
	_jubel = maxf(0.0, _jubel - delta)
	if is_instance_valid(_arena):
		_arena.queue_redraw()


func _zeichnen() -> void:
	var a := _arena
	var breite := ARENA.size.x
	# Himmel: im Zeitraffer wird es Abend und wieder Tag
	var himmel := HIMMEL
	if _sonne >= 0.0:
		himmel = HIMMEL.lerp(Color("f08a4b"), sin(_sonne * PI))
	a.draw_rect(Rect2(0, 0, breite, 36), himmel)
	var s := _sonne if _sonne >= 0.0 else 0.25
	a.draw_circle(Vector2(30 + 500 * s, 28 - 18 * sin(PI * s)), 8, GOLD)
	# Zuschauerränge mit Köpfen; beim Jubel hüpfen sie
	a.draw_rect(Rect2(0, 36, breite, 28), RAENGE)
	a.draw_rect(Rect2(0, 36, breite, 28), FIGUR_RAND, false, 1.0)
	for i in KOEPFE:
		var hoch := 0.0
		if _jubel > 0.0:
			hoch = absf(sin((_jubel * 9.0) + i)) * 5.0
		a.draw_circle(Vector2(12 + i * 20, 53 - hoch + (4.0 if _schlaf else 0.0)), 5, Color("b0895a"))
	if _schlaf:
		for x in [90.0, 250.0, 410.0]:
			a.draw_string(schrift(), Vector2(x, 47), "z z z", HORIZONTAL_ALIGNMENT_LEFT, -1, 10, FIGUR_RAND)
	# Boden, Grube, Schrittlinien, Mauer
	a.draw_rect(Rect2(0, 64, breite, ARENA.size.y - 64), SAND)
	a.draw_rect(Rect2(LINIE_X - 44, BODEN - 12, MAUER_X - LINIE_X + 44, 30), GRUBE)
	for l in range(1, CQRedeRingen.LINIEN + 1):
		var x := _x_der_linie(l)
		var gold: float = _gold.get(l, 0.0)
		if gold > 0.0:  # goldenes Band, breiter als die Figur davor
			a.draw_rect(Rect2(x - 24, BODEN - 12, 48, 30), Color(GOLD, minf(1.0, gold * 1.5)))
		var farbe := Color.WHITE.lerp(GOLD, minf(1.0, gold * 2.0))
		a.draw_line(Vector2(x, BODEN - 12), Vector2(x, BODEN + 18), farbe, 2.0)
		a.draw_string(schrift(), Vector2(x - 3, BODEN + 28), str(l), HORIZONTAL_ALIGNMENT_LEFT, -1, 8,
			GOLD if l == ringen.linie else FIGUR_RAND)
	var mauer := Color("8b7355").lerp(GOLD, minf(1.0, float(_gold.get(CQRedeRingen.LINIEN + 1, 0.0)) * 2.0))
	a.draw_rect(Rect2(MAUER_X, BODEN - 26, 12, 44), mauer)
	a.draw_rect(Rect2(MAUER_X, BODEN - 26, 12, 44), FIGUR_RAND, false, 1.0)
	# Figuren: Pixel am Rand, Max links, Cicero auf seiner Linie
	figur_zeichnen(a, Vector2(PIXEL_X, BODEN + 14), Vector2(30, 16), "PIX", PIXEL_FARBE)
	if _schlaf:
		a.draw_string(schrift(), Vector2(PIXEL_X - 6, BODEN - 8), "z z", HORIZONTAL_ALIGNMENT_LEFT, -1, 9, FIGUR_RAND)
	figur_zeichnen(a, Vector2(MAX_X, BODEN + 4), FIGUR_GROESSE, "MAX")
	var kippt := 0.0
	if absf(_cicero_x - _x_der_linie(ringen.linie)) > 1.0:
		kippt = 0.25 * signf(_x_der_linie(ringen.linie) - _cicero_x)  # stolpert in Laufrichtung
	figur_zeichnen(a, Vector2(_cicero_x, BODEN + 4), FIGUR_GROESSE, "CIC", FIGUR, kippt)
	a.draw_rect(Rect2(Vector2.ZERO, ARENA.size), FIGUR_RAND, false, 2.0)
