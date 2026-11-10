extends Control
## Speichern und Laden (05-spielsysteme.md, Bildschirme): zwölf Plätze mit Vorschaubild, Ort,
## Welt, Spielzeit und Datum. Beim Laden stehen darunter auch Schnellspeicher und die drei
## Autospeicher. Ein belegter Platz wird erst beim zweiten Klick überschrieben.

signal zurueck
## Ein Platz wurde gewählt: Laden übernimmt der Aufrufer (Menüs schließen, dann laden)
signal geladen_werden(slot: int)
signal gespeichert(slot: int)

const S := preload("res://oberflaeche/menue_stil.gd")
const KACHEL := Vector2(136, 38)
const BILD := Vector2(48, 27)

var modus := "laden"   # oder "speichern"
var _hinweis: Label
var _gewaehlt := -1


func _ready() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	_aufbauen()


func _aufbauen() -> void:
	for k in get_children():
		k.queue_free()
	var p := S.panel(Vector2(12, 6), Vector2(456, 258))
	add_child(p)
	var titel := S.label(tr("UI_MENUE_SPEICHERN" if modus == "speichern" else "UI_MENUE_LADEN"), 12)
	titel.position = Vector2(10, 3)
	p.add_child(titel)
	var plaetze: Array = range(1, CQSaveLoad.MANUELL_ANZAHL + 1)
	if modus == "laden":
		plaetze.append(CQSaveLoad.SCHNELL)
		plaetze.append_array(CQSaveLoad.AUTO)
	for i in plaetze.size():
		var pos := Vector2(10 + (i % 3) * (KACHEL.x + 10), 24 + (i / 3) * (KACHEL.y + 3))
		p.add_child(_kachel(plaetze[i], pos))
	_hinweis = S.label("", 8, S.GELB)
	_hinweis.position = Vector2(10, 236)
	p.add_child(_hinweis)
	var zu := S.knopf(tr("UI_MENUE_ZURUECK"))
	zu.position = Vector2(372, 232)
	zu.custom_minimum_size = Vector2(72, 0)
	zu.pressed.connect(func(): zurueck.emit())
	p.add_child(zu)
	zu.grab_focus.call_deferred()


func _kachel(slot: int, pos: Vector2) -> Control:
	var kopf: Dictionary = Spielstand.saveload.kopf_lesen(slot)
	var k := Button.new()
	k.position = pos
	k.size = KACHEL
	k.add_theme_stylebox_override("normal", S.flaeche(S.FELD, S.AKTIV, 1))
	k.add_theme_stylebox_override("hover", S.flaeche(S.AKTIV, S.GELB, 1))
	k.add_theme_stylebox_override("focus", S.flaeche(S.AKTIV, S.GELB, 1))
	k.add_theme_stylebox_override("pressed", S.flaeche(S.HOVER, S.ORANGE, 1))
	k.add_theme_stylebox_override("disabled", S.flaeche(S.DUNKEL, S.RAND, 1))
	k.disabled = modus == "laden" and kopf.is_empty()
	k.pressed.connect(_gewaehlt_von.bind(slot, not kopf.is_empty()))
	var bild := TextureRect.new()
	bild.position = Vector2(3, 5)
	bild.size = BILD
	bild.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	bild.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	bild.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var tex := Spielstand.vorschau_laden(slot)
	if tex:
		bild.texture = tex
	else:
		var leer := ColorRect.new()
		leer.color = S.DUNKEL
		leer.position = bild.position
		leer.size = BILD
		leer.mouse_filter = Control.MOUSE_FILTER_IGNORE
		k.add_child(leer)
	k.add_child(bild)
	var zeilen := VBoxContainer.new()
	zeilen.position = Vector2(55, 2)
	zeilen.size = Vector2(KACHEL.x - 58, KACHEL.y - 4)
	zeilen.add_theme_constant_override("separation", -2)
	zeilen.mouse_filter = Control.MOUSE_FILTER_IGNORE
	k.add_child(zeilen)
	zeilen.add_child(S.label(platz_titel(slot), 8, S.GELB))
	if kopf.is_empty():
		zeilen.add_child(S.label(tr("UI_PLATZ_LEER"), 8, S.GRAU))
	else:
		zeilen.add_child(S.label(ort(kopf), 8))
		zeilen.add_child(S.label("%s · %s" % [spielzeit(kopf), str(kopf.get("datum", "")).left(16)], 7, S.GRAU))
	for l in zeilen.get_children():
		(l as Label).clip_text = true
		(l as Label).custom_minimum_size.x = KACHEL.x - 58
	return k


static func platz_titel(slot: int) -> String:
	if slot == CQSaveLoad.SCHNELL:
		return TranslationServer.translate("UI_PLATZ_SCHNELL")
	if slot in CQSaveLoad.AUTO:
		return TranslationServer.translate("UI_PLATZ_AUTO") % (CQSaveLoad.AUTO.find(slot) + 1)
	return TranslationServer.translate("UI_PLATZ_NR") % slot


## Ort und Welt aus dem Kopf eines Spielstands: „Taverne · Schwurbelstein“.
static func ort(kopf: Dictionary) -> String:
	var raum: String = TranslationServer.translate(Bauplan.raum(str(kopf.get("raum", ""))).get("name_key", ""))
	var welt: String = Bauplan.welten.get(str(kopf.get("abschnitt", "")), {}).get("name", "")
	return "%s · %s" % [raum, welt] if not welt.is_empty() else raum


static func spielzeit(kopf: Dictionary) -> String:
	var s := int(float(kopf.get("spielzeit", 0.0)))
	return "%d:%02d h" % [s / 3600, (s / 60) % 60]


func _gewaehlt_von(slot: int, belegt: bool) -> void:
	if modus == "laden":
		geladen_werden.emit(slot)
		return
	if belegt and _gewaehlt != slot:
		_gewaehlt = slot
		_hinweis.text = tr("UI_UEBERSCHREIBEN")
		return
	_gewaehlt = -1
	if Spielstand.speichern(slot):
		gespeichert.emit(slot)
		_aufbauen()
		_hinweis.text = tr("UI_GESPEICHERT")
