extends CQMinispiel
## Spielfläche von Archimedes' Hebel (raetsel/welt-2.md, Wettkampftage, Disziplin 2; Regeln in
## skripte/minispiele/hebel.gd). Oben links der Hebel von der Seite: hinten der Korb, vorne Max,
## dazwischen der Winkel. Rechts die Knöpfe für Winkel, Absprung, Ausräumen und Später. Unten
## Max' Taschen und der Korb: Ein Klick legt etwas hinein oder holt es wieder heraus, Archimedes
## kommentiert jedes Gewicht. Kein Zeitdruck.
##
## Züge an die Regeln des Abschnitts (skripte/welt_2.gd): ["rein", id], ["raus", id],
## ["winkel", stufe], ["sprung"], ["leeren"], ["zu"].

const FENSTER := Rect2(40, 6, 560, 348)
## Hebel-Bild im Fenster
const BILD := Rect2(8, 22, 316, 150)
const DREHPUNKT := Vector2(96, 88)
const ARM := 74.0
## Neigung des Balkens je Winkelstufe (Grad): Der Korb hinten steht höher, je steiler
const NEIGUNG := [10.0, 22.0, 34.0]
const FELD := 40
const ABSTAND := 43
const JE_ZEILE := 12
const SAND := Color("d6b46a")
const GRUBE := Color("c49a52")
const HOLZ := Color("8b5a2b")

var hebel: CQHebel
## Gegenstand-IDs, die in Max' Taschen liegen und ein Gewicht haben (ohne den Korb)
var taschen: Array = []

var _fenster: Panel
var _bild: Control
var _name: Label
var _felder: Array[Control] = []
## Gegenstand-ID → Feld (Taschen und Korb)
var _feld_je_id := {}
var _winkel_knoepfe: Array[Button] = []
var _knoepfe := {}
## Flug nach dem Absprung: 0 bis 1, -1 = Max steht noch auf dem Hebel
var _flug := -1.0
var _flug_ziel := 0.0


func zeigen(h: CQHebel, in_taschen: Array) -> void:
	hebel = h
	taschen = in_taschen.duplicate()
	_fenster = STIL.panel(FENSTER.position, FENSTER.size)
	add_child(_fenster)
	var titel := STIL.label(tr("UI_MS_HEBEL_TITEL"), 9, STIL.GELB)
	titel.position = Vector2(8, 1)
	_fenster.add_child(titel)
	var hilfe := STIL.label(tr("UI_MS_HEBEL_HILFE"), 7, STIL.GRAU)
	hilfe.position = Vector2(150, 4)
	_fenster.add_child(hilfe)
	_bild = Control.new()
	_bild.position = BILD.position
	_bild.size = BILD.size
	_bild.clip_contents = true
	_bild.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_bild.draw.connect(_zeichnen)
	_fenster.add_child(_bild)
	# Knöpfe rechts: Winkel in drei Stufen, darunter Absprung, Ausräumen, Später
	var wl := STIL.label(tr("UI_MS_HEBEL_WINKEL"), 8)
	wl.position = Vector2(336, 24)
	_fenster.add_child(wl)
	for i in CQHebel.WINKEL.size():
		var w := STIL.knopf(tr("UI_MS_WINKEL_" + str(CQHebel.WINKEL_NAMEN[i]).to_upper()), 8)
		w.toggle_mode = true
		w.pressed.connect(zug_melden.bind(["winkel", i]))
		_fenster.add_child(w)  # erst im Baum gilt die Schrift des Themas
		w.position = Vector2(336 + i * 72, 42)
		w.size = Vector2(68, 22)
		_winkel_knoepfe.append(w)
	_knopf("sprung", "UI_W2_HEBEL_ZIEHEN", Vector2(336, 74), Vector2(212, 34), 10)
	_knopf("leeren", "UI_W2_KORB_LEEREN", Vector2(336, 116), Vector2(212, 24), 8)
	_knopf("zu", "UI_MS_SPAETER", Vector2(336, 146), Vector2(212, 24), 8)
	var tl := STIL.label(tr("UI_MS_HEBEL_TASCHEN"), 8)
	tl.position = Vector2(12, 176)
	_fenster.add_child(tl)
	var kl := STIL.label(tr("UI_MS_HEBEL_KORB"), 8)
	kl.position = Vector2(12, 284)
	_fenster.add_child(kl)
	_name = STIL.label("", 8, STIL.GELB)
	_name.position = Vector2(120, 176)
	_fenster.add_child(_name)
	aktualisieren()
	if not Spiel.testmodus:
		_knoepfe["sprung"].grab_focus.call_deferred()
	# Archimedes steht im Raum dahinter; seine Kommentare kommen über dem Hebel
	blase("Archimedes", FENSTER.position + BILD.position + Vector2(BILD.size.x / 2.0, 64))
	blase("Max", FENSTER.position + BILD.position + Vector2(BILD.size.x / 2.0, 72))


func _knopf(zug_name: String, text_key: String, pos: Vector2, groesse: Vector2, schrift_groesse: int) -> void:
	var k := STIL.knopf(tr(text_key), schrift_groesse)
	k.pressed.connect(zug_melden.bind([zug_name]))
	_fenster.add_child(k)
	k.position = pos
	k.size = groesse
	_knoepfe[zug_name] = k


## Nächster Zug. Im Testmodus aus Spiel.vorgabe_auswahl: 0 = abspringen, 1 = Korb ausräumen;
## ohne Vorgabe wird abgesprungen.
func naechster_zug() -> Array:
	if automatik():
		var w := int(Spiel.vorgabe_auswahl.pop_front()) if not Spiel.vorgabe_auswahl.is_empty() else 0
		Telemetrie.auswahl("UI_W2_HEBEL_ZIEHEN" if w == 0 else "UI_W2_KORB_LEEREN", w)
		return ["sprung"] if w == 0 else (["leeren"] if w == 1 else ["zu"])
	return await zug()


## Taschen, Korb und Winkel neu zeichnen (nach jedem Zug).
func aktualisieren() -> void:
	for f in _felder:
		f.queue_free()
	_felder.clear()
	_feld_je_id.clear()
	var i := 0
	for id in taschen:
		if id in hebel.korb:
			continue
		_feld(id, Vector2(12 + (i % JE_ZEILE) * ABSTAND, 194 + (i / JE_ZEILE) * ABSTAND), "rein")
		i += 1
	for j in hebel.korb.size():
		_feld(hebel.korb[j], Vector2(12 + j * ABSTAND, 302), "raus")
	for w in _winkel_knoepfe.size():
		_winkel_knoepfe[w].set_pressed_no_signal(w == hebel.winkel)
	if _knoepfe.has("leeren"):
		_knoepfe["leeren"].disabled = hebel.korb.is_empty()
	if is_instance_valid(_bild):
		_bild.queue_redraw()


## Feld eines Gegenstands in den Taschen oder im Korb (für Tests), sonst null.
func feld_knopf(id: String) -> Button:
	return _feld_je_id.get(id)


## Knopf "sprung", "leeren", "zu" oder "winkel_0" bis "winkel_2" (für Tests).
func knopf(name: String) -> Button:
	if name.begins_with("winkel_"):
		return _winkel_knoepfe[int(name.trim_prefix("winkel_"))]
	return _knoepfe.get(name)


## Lage der Felder (für Tests: Kein Feld liegt auf einem anderen, alle im Fenster).
func felder() -> Array:
	var out := []
	for f in _felder:
		if not f.is_queued_for_deletion():
			out.append(Rect2(f.position, f.size))
	return out


func _feld(id: String, pos: Vector2, zug_name: String) -> void:
	var f := Button.new()
	f.position = pos
	f.size = Vector2(FELD, FELD)
	f.focus_mode = Control.FOCUS_ALL
	f.add_theme_stylebox_override("normal", STIL.flaeche(STIL.FELD, STIL.AKTIV, 1))
	f.add_theme_stylebox_override("hover", STIL.flaeche(STIL.AKTIV, STIL.GELB, 1))
	f.add_theme_stylebox_override("focus", STIL.flaeche(STIL.AKTIV, STIL.GELB, 1))
	f.add_theme_stylebox_override("pressed", STIL.flaeche(STIL.HOVER, STIL.ORANGE, 1))
	_fenster.add_child(f)
	_felder.append(f)
	_feld_je_id[id] = f
	var sn := Spiel.PIXEL_FELD if id == "pixel" else Bauplan.gegenstand_script_name(id)
	var name_key := "UI_OBJ_PIXEL" if id == "pixel" else str(Bauplan.gegenstand(sn).get("name_key", sn))
	var bild := TextureRect.new()
	bild.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	var item := I.get_item_instance(sn) if not sn.is_empty() else null
	if is_instance_valid(item):
		bild.texture = item.texture
	bild.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	bild.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	bild.position = Vector2(3, 3)
	bild.size = Vector2(FELD - 6, FELD - 6)
	bild.mouse_filter = Control.MOUSE_FILTER_IGNORE
	f.add_child(bild)
	f.tooltip_text = tr(name_key)
	f.mouse_entered.connect(func(): _name.text = tr(name_key))
	f.focus_entered.connect(func(): _name.text = tr(name_key))
	f.mouse_exited.connect(func(): _name.text = "")
	f.pressed.connect(zug_melden.bind([zug_name, id]))


## Der Absprung im Bild: Der Balken schlägt um, Max fliegt. ergebnis wie CQHebel.ergebnis().
func sprung(ergebnis: String) -> void:
	_flug_ziel = {"leicht": 0.3, "treffer": 0.72, "schwer": 1.3}.get(ergebnis, 0.3)
	_flug = 0.0
	if Spiel.testmodus:
		_flug = 1.0
		return
	var t := create_tween()
	t.tween_property(self, "_flug", 1.0, 0.9)
	await t.finished
	if ergebnis != "treffer":
		CQEffekte.wackeln_ebene(self, 3.0, 0.3)
	await pause(0.4)


## Max steht wieder auf dem Hebel (nach einem Fehlversuch).
func neu_aufstellen() -> void:
	_flug = -1.0
	aktualisieren()


func _process(_delta: float) -> void:
	if _flug >= 0.0 and is_instance_valid(_bild):
		_bild.queue_redraw()


func _zeichnen() -> void:
	var b := _bild
	b.draw_rect(Rect2(Vector2.ZERO, BILD.size), Color("9fd3e8"))
	var boden := DREHPUNKT.y + 46.0
	b.draw_rect(Rect2(0, boden, BILD.size.x, BILD.size.y - boden), SAND)
	# Sandgrube mit der Markierung, hinter der Max landen soll
	b.draw_rect(Rect2(196, boden, 110, 8), GRUBE)
	b.draw_line(Vector2(256, boden - 16), Vector2(256, boden + 8), Color.WHITE, 2.0)
	b.draw_colored_polygon(PackedVector2Array([Vector2(256, boden - 16), Vector2(268, boden - 12),
		Vector2(256, boden - 8)]), Color("e43b44"))
	# Balken: vor dem Absprung steht der Korb hinten hoch, danach schlägt er um
	var grad: float = NEIGUNG[hebel.winkel]
	if _flug >= 0.0:
		grad = lerpf(grad, -grad, minf(1.0, _flug * 4.0))
	var richtung := Vector2.from_angle(deg_to_rad(grad))  # nach vorne (rechts), vor dem Absprung abwärts
	var hinten := DREHPUNKT - richtung * ARM
	var vorne := DREHPUNKT + richtung * ARM
	b.draw_line(hinten, vorne, HOLZ, 5.0)
	b.draw_colored_polygon(PackedVector2Array([DREHPUNKT, Vector2(DREHPUNKT.x - 12, boden),
		Vector2(DREHPUNKT.x + 12, boden)]), FIGUR_RAND)
	# Korb hinten mit der Zahl der Gewichte
	var korb := Rect2(hinten + Vector2(-16, -22), Vector2(32, 22))
	b.draw_rect(korb, Color("b0895a"))
	b.draw_rect(korb, FIGUR_RAND, false, 1.0)
	b.draw_string(schrift(), korb.position + Vector2(4, 15), "×%d" % hebel.korb.size(),
		HORIZONTAL_ALIGNMENT_LEFT, -1, 10, Color.WHITE)
	# Max vorne auf dem Balken oder im Flug
	var max_pos := vorne
	if _flug >= 0.0:
		var start := DREHPUNKT + Vector2.from_angle(deg_to_rad(-NEIGUNG[hebel.winkel])) * ARM  # oberes Ende nach dem Umschlagen
		var ziel_x := lerpf(start.x, 196 + 110 * _flug_ziel, _flug)
		var hoehe := sin(PI * _flug) * (6.0 + 22.0 * _flug_ziel)
		max_pos = Vector2(ziel_x, lerpf(start.y, boden, _flug) - hoehe)
	figur_zeichnen(b, max_pos, Vector2(18, 40), "MAX")
	b.draw_rect(Rect2(Vector2.ZERO, BILD.size), FIGUR_RAND, false, 1.0)
