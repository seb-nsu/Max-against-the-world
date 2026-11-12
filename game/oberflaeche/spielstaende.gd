extends Control
## Speichern und Laden (05-spielsysteme.md, Bildschirme): zwölf Plätze mit Vorschaubild, Ort,
## Welt, Spielzeit und Datum. Beim Laden stehen darunter auch Schnellspeicher und die drei
## Autospeicher. Ein belegter Platz wird erst beim zweiten Klick überschrieben.
## „Löschen“ schaltet in den Löschmodus: Platz wählen, zum Bestätigen noch mal klicken.

signal zurueck
## Ein Platz wurde gewählt: Laden übernimmt der Aufrufer (Menüs schließen, dann laden)
signal geladen_werden(slot: int)
signal gespeichert(slot: int)
signal geloescht(slot: int)

const S := preload("res://oberflaeche/menue_stil.gd")
const KACHEL := Vector2(181, 51)
const BILD := Vector2(64, 36)

var modus := "laden"   # oder "speichern"
var _hinweis: Label
var _gewaehlt := -1
## Löschmodus: ein Klick auf einen belegten Platz fragt nach, der zweite löscht
var _loeschen := false
var _loeschen_knopf: Button


func _ready() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	_aufbauen()


func _aufbauen(fokus_loeschen := false) -> void:
	for k in get_children():
		k.queue_free()
	_loeschen_knopf = null
	var p := S.panel(Vector2(16, 8), Vector2(608, 344))
	add_child(p)
	var titel := S.label(tr("UI_MENUE_SPEICHERN" if modus == "speichern" else "UI_MENUE_LADEN"), 12)
	titel.position = Vector2(13, 4)
	p.add_child(titel)
	var plaetze: Array = range(1, CQSaveLoad.MANUELL_ANZAHL + 1)
	if modus == "laden":
		plaetze.append(CQSaveLoad.SCHNELL)
		plaetze.append_array(CQSaveLoad.AUTO)
	for i in plaetze.size():
		var pos := Vector2(13 + (i % 3) * (KACHEL.x + 13), 32 + (i / 3) * (KACHEL.y + 4))
		p.add_child(_kachel(plaetze[i], pos))
	_hinweis = S.label(tr("UI_LOESCHEN_WAEHLEN") if _loeschen else "", 8, S.GELB)
	_hinweis.position = Vector2(13, 315)
	p.add_child(_hinweis)
	if _loeschen or _belegte(plaetze) > 0:
		_loeschen_knopf = S.knopf(tr("UI_LOESCHEN_ABBRECHEN" if _loeschen else "UI_LOESCHEN"))
		_loeschen_knopf.position = Vector2(384, 309)
		_loeschen_knopf.custom_minimum_size = Vector2(104, 0)
		_loeschen_knopf.pressed.connect(_loeschmodus.bind(not _loeschen))
		p.add_child(_loeschen_knopf)
	var zu := S.knopf(tr("UI_MENUE_ZURUECK"))
	zu.position = Vector2(496, 309)
	zu.custom_minimum_size = Vector2(96, 0)
	zu.pressed.connect(func(): zurueck.emit())
	p.add_child(zu)
	if fokus_loeschen and _loeschen_knopf:
		_loeschen_knopf.grab_focus.call_deferred()
	else:
		zu.grab_focus.call_deferred()


func _belegte(plaetze: Array) -> int:
	return plaetze.filter(func(s): return FileAccess.file_exists(CQSaveLoad.platz_pfad(s))).size()


func _kachel(slot: int, pos: Vector2) -> Control:
	var kopf: Dictionary = Spielstand.saveload.kopf_lesen(slot)
	var k := Button.new()
	k.position = pos
	k.size = KACHEL
	# Im Löschmodus orange umrandet, damit der Modus nicht übersehen wird
	var hervor := S.ORANGE if _loeschen else S.GELB
	k.add_theme_stylebox_override("normal", S.flaeche(S.FELD, S.ORANGE if _loeschen and not kopf.is_empty() else S.AKTIV, 1))
	k.add_theme_stylebox_override("hover", S.flaeche(S.AKTIV, hervor, 1))
	k.add_theme_stylebox_override("focus", S.flaeche(S.AKTIV, hervor, 1))
	k.add_theme_stylebox_override("pressed", S.flaeche(S.HOVER, S.ORANGE, 1))
	k.add_theme_stylebox_override("disabled", S.flaeche(S.DUNKEL, S.RAND, 1))
	k.disabled = (modus == "laden" or _loeschen) and kopf.is_empty()
	k.pressed.connect(_gewaehlt_von.bind(slot, not kopf.is_empty()))
	var bild := TextureRect.new()
	bild.position = Vector2(4, 7)
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
	zeilen.position = Vector2(73, 3)
	zeilen.size = Vector2(KACHEL.x - 77, KACHEL.y - 5)
	zeilen.add_theme_constant_override("separation", -2)
	zeilen.mouse_filter = Control.MOUSE_FILTER_IGNORE
	k.add_child(zeilen)
	zeilen.add_child(S.label(platz_titel(slot), 8, S.GELB))
	if kopf.is_empty():
		zeilen.add_child(S.label(tr("UI_PLATZ_LEER"), 8, S.GRAU))
	else:
		# Ort in 7 Punkt, damit „Raum · Welt“ auch auf Englisch in die Kachel passt
		zeilen.add_child(S.label(ort(kopf), 7))
		zeilen.add_child(S.label("%s · %s" % [spielzeit(kopf), str(kopf.get("datum", "")).left(10)], 7, S.GRAU))
	for l in zeilen.get_children():
		(l as Label).clip_text = true
		(l as Label).text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS  # zu lang: „…“ statt abgeschnitten
		(l as Label).custom_minimum_size.x = KACHEL.x - 77
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
	var ab := str(kopf.get("abschnitt", ""))
	var welt: String = Bauplan.welten.get(ab, {}).get("name", "")
	var schluessel := "UI_WELTNAME_" + ab.to_upper().replace("-", "_")
	if not ab.is_empty() and TranslationServer.translate(schluessel) != schluessel:
		welt = TranslationServer.translate(schluessel)  # Weltname in der Spielsprache
	return "%s · %s" % [raum, welt] if not welt.is_empty() else raum


static func spielzeit(kopf: Dictionary) -> String:
	var s := int(float(kopf.get("spielzeit", 0.0)))
	return "%d:%02d h" % [s / 3600, (s / 60) % 60]


func _gewaehlt_von(slot: int, belegt: bool) -> void:
	if _loeschen:
		_loeschen_von(slot, belegt)
		return
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


## Löschmodus an oder aus; die Kacheln werden neu gebaut (leere Plätze gesperrt, belegte orange).
func _loeschmodus(an: bool) -> void:
	_loeschen = an
	_gewaehlt = -1
	_aufbauen(true)


func _loeschen_von(slot: int, belegt: bool) -> void:
	if not belegt:
		return
	if _gewaehlt != slot:
		_gewaehlt = slot
		_hinweis.text = tr("UI_LOESCHEN_SICHER")
		return
	_gewaehlt = -1
	_loeschen = false
	var ok: bool = Spielstand.loeschen(slot)
	_aufbauen()
	if ok:
		geloescht.emit(slot)
		_hinweis.text = tr("UI_GELOESCHT")
