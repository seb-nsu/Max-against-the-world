extends Control
## Optionen (05-spielsysteme.md, Optionen) in fünf Reitern wie in üblichen PC-Spielen: Audio,
## Anzeige, Spiel, Steuerung, Barrierefreiheit. Jede Änderung gilt sofort und wird in
## user://settings.cfg gespeichert (skripte/einstellungen.gd). Aus Haupt- und Pausemenü.

signal zurueck

const S := preload("res://oberflaeche/menue_stil.gd")
const REITER := ["UI_OPT_AUDIO", "UI_OPT_ANZEIGE", "UI_OPT_SPIEL", "UI_OPT_STEUERUNG", "UI_OPT_BARRIEREFREI"]

var _reiter: TabContainer
## Aktion, die gerade auf eine neue Taste wartet ("" = keine)
var _belegt_wird := ""
var _tasten_knoepfe := {}


func _ready() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	_aufbauen()


func _aufbauen() -> void:
	for k in get_children():
		k.queue_free()
	_tasten_knoepfe.clear()
	var p := S.panel(Vector2(24, 9), Vector2(432, 252))
	add_child(p)
	var titel := S.label(tr("UI_MENUE_OPTIONEN"), 12)
	titel.position = Vector2(12, 4)
	p.add_child(titel)
	_reiter = TabContainer.new()
	_reiter.position = Vector2(8, 24)
	_reiter.size = Vector2(416, 196)
	_reiter.theme = S.thema()
	_reiter.add_theme_font_size_override("font_size", Einstellungen.schrift(9))
	_reiter.add_theme_stylebox_override("panel", S.flaeche(S.DUNKEL, S.AKTIV, 1))
	_reiter.add_theme_stylebox_override("tab_selected", S.flaeche(S.AKTIV, S.GELB, 1))
	_reiter.add_theme_stylebox_override("tab_unselected", S.flaeche(S.FELD, S.RAND, 1))
	_reiter.add_theme_stylebox_override("tab_hovered", S.flaeche(S.AKTIV, S.RAND, 1))
	p.add_child(_reiter)
	for i in REITER.size():
		var seite := GridContainer.new()
		seite.columns = 2
		seite.add_theme_constant_override("h_separation", 12)
		seite.add_theme_constant_override("v_separation", 4)
		seite.name = tr(REITER[i])
		_reiter.add_child(seite)
		match i:
			0: _audio(seite)
			1: _anzeige(seite)
			2: _spiel(seite)
			3: _steuerung(seite)
			4: _barrierefrei(seite)
	var reset := S.knopf(tr("UI_OPT_ZURUECKSETZEN"))
	reset.position = Vector2(8, 226)
	reset.pressed.connect(func():
		Einstellungen.zuruecksetzen()
		_aufbauen.call_deferred())
	p.add_child(reset)
	var zu := S.knopf(tr("UI_MENUE_ZURUECK"))
	zu.position = Vector2(352, 226)
	zu.custom_minimum_size = Vector2(72, 0)
	zu.pressed.connect(func(): zurueck.emit())
	p.add_child(zu)
	zu.grab_focus.call_deferred()


#region Reiter #####################################################################################
func _audio(g: GridContainer) -> void:
	for k in ["gesamt", "musik", "geraeusche", "stimmen"]:
		_regler(g, "UI_OPT_" + k.to_upper(), k)
	_schalter(g, "UI_OPT_STUMM_HINTERGRUND", "stumm_im_hintergrund")


func _anzeige(g: GridContainer) -> void:
	_wahl(g, "UI_OPT_FENSTERMODUS", "fenstermodus",
		Einstellungen.FENSTERMODI.map(func(m): return [m, "UI_OPT_MODUS_" + m.to_upper()]))
	var b := int(ProjectSettings.get_setting("display/window/size/viewport_width"))
	var h := int(ProjectSettings.get_setting("display/window/size/viewport_height"))
	_wahl(g, "UI_OPT_FENSTERGROESSE", "fenster_stufe",
		Einstellungen.FENSTER_STUFEN.map(func(f): return [f, "%d × %d" % [b * f, h * f]]))
	_schalter(g, "UI_OPT_VSYNC", "vsync")
	_wahl(g, "UI_OPT_BILDRATE", "bildrate",
		Einstellungen.BILDRATEN.map(func(r): return [r, str(r) if r > 0 else "UI_OPT_UNBEGRENZT"]))


func _spiel(g: GridContainer) -> void:
	_wahl(g, "UI_OPT_SPRACHE", "sprache", [["de", "Deutsch"], ["en", "English"]])
	_wahl(g, "UI_OPT_TEXTTEMPO", "text_tempo",
		Einstellungen.TEXT_TEMPI.keys().map(func(t): return [t, "UI_OPT_TEMPO_" + t.to_upper()]))
	_wahl(g, "UI_OPT_TEXT_WEITER", "text_auto", [[false, "UI_OPT_PER_KLICK"], [true, "UI_OPT_AUTOMATISCH"]])
	_schalter(g, "UI_OPT_UNTERTITEL", "untertitel")
	_schalter(g, "UI_OPT_BRABBEL", "brabbel")


func _steuerung(g: GridContainer) -> void:
	for aktion in Einstellungen.BELEGBAR:
		g.add_child(S.label(tr("UI_TASTE_" + aktion.trim_prefix("cq_").to_upper())))
		var k := S.knopf(_tasten_name(aktion), 9)
		k.custom_minimum_size = Vector2(120, 0)
		k.pressed.connect(func(): _belegen_starten(aktion))
		_tasten_knoepfe[aktion] = k
		g.add_child(k)
	g.add_child(S.label(tr("UI_OPT_MAUS_GEHT_IMMER"), 8, S.GRAU))


func _barrierefrei(g: GridContainer) -> void:
	for k in ["grosse_schrift", "hotspots_dauerhaft", "wackeln_aus", "flackern_reduzieren", "farbenblind"]:
		_schalter(g, "UI_OPT_" + k.to_upper(), k)


#endregion

#region Bausteine ##################################################################################
func _regler(g: GridContainer, text_key: String, schluessel: String) -> void:
	g.add_child(S.label(tr(text_key)))
	var zeile := HBoxContainer.new()
	var r := HSlider.new()
	r.min_value = 0
	r.max_value = 100
	r.step = 5
	r.value = float(Einstellungen.wert(schluessel))
	r.custom_minimum_size = Vector2(150, 12)
	r.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var zahl := S.label(str(int(r.value)), 9, S.GRAU)
	zahl.custom_minimum_size = Vector2(24, 0)
	r.value_changed.connect(func(v):
		zahl.text = str(int(v))
		Einstellungen.setze(schluessel, int(v)))
	r.drag_ended.connect(func(_c): if schluessel != "musik": Klang.geraeusch("ui_klick"))
	zeile.add_child(r)
	zeile.add_child(zahl)
	g.add_child(zeile)


func _schalter(g: GridContainer, text_key: String, schluessel: String) -> void:
	g.add_child(S.label(tr(text_key)))
	var c := CheckButton.new()
	c.button_pressed = bool(Einstellungen.wert(schluessel))
	c.toggled.connect(func(an):
		Klang.geraeusch("ui_klick")
		Einstellungen.setze(schluessel, an)
		if schluessel in ["grosse_schrift", "sprache"]:
			_aufbauen.call_deferred())
	g.add_child(c)


func _wahl(g: GridContainer, text_key: String, schluessel: String, eintraege: Array) -> void:
	g.add_child(S.label(tr(text_key)))
	var o := S.auswahl(eintraege, Einstellungen.wert(schluessel), 9)
	o.custom_minimum_size = Vector2(150, 0)
	o.item_selected.connect(func(i):
		Klang.geraeusch("ui_klick")
		Einstellungen.setze(schluessel, o.get_item_metadata(i))
		if schluessel == "sprache":
			_aufbauen.call_deferred())
	g.add_child(o)


func _tasten_name(aktion: String) -> String:
	var t := Einstellungen.taste(aktion)
	return OS.get_keycode_string(t) if t != 0 else "–"


func _belegen_starten(aktion: String) -> void:
	_belegt_wird = aktion
	_tasten_knoepfe[aktion].text = tr("UI_OPT_TASTE_DRUECKEN")


func _input(event: InputEvent) -> void:
	if _belegt_wird.is_empty() or not (event is InputEventKey and event.pressed and not event.echo):
		return
	get_viewport().set_input_as_handled()
	var aktion := _belegt_wird
	_belegt_wird = ""
	if event.keycode != KEY_ESCAPE or aktion == "cq_pause":
		Einstellungen.taste_belegen(aktion, event.keycode)
	_tasten_knoepfe[aktion].text = _tasten_name(aktion)


#endregion
