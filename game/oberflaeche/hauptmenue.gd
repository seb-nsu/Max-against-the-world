extends CanvasLayer
## Hauptmenü (05-spielsysteme.md, Bildschirme): Startszene des Spiels. Links der Zapp-O-Mat als
## Fernseher, rechts fünf Kanäle zum Durchschalten: 1 Fortsetzen, 2 Neues Spiel, 3 Laden,
## 4 Optionen, 5 Beenden. Die Zifferntasten schalten direkt, Pfeiltasten und Maus gehen auch.
## Beim allerersten Start kommt vorher der Epilepsie-Hinweis.
##
## Noch ohne Grafik: Fernseher, Bildrauschen und Drehknopf sind gezeichnete Platzhalter.
## Vom Pausemenü kommt man über einen Neustart des Spiels hierher (Spiel.zum_hauptmenue).

const S := preload("res://oberflaeche/menue_stil.gd")
const SPIELSTAENDE := preload("res://oberflaeche/spielstaende.gd")
const OPTIONEN := preload("res://oberflaeche/optionen.gd")
## Kanal → [Text-Schlüssel des Knopfs, Text-Schlüssel auf dem Bildschirm]
const KANAELE := [
	["UI_MENUE_FORTSETZEN", "UI_KANAL_FORTSETZEN"],
	["UI_MENUE_NEUES_SPIEL", "UI_KANAL_NEUES_SPIEL"],
	["UI_MENUE_LADEN", "UI_KANAL_LADEN"],
	["UI_MENUE_OPTIONEN", "UI_KANAL_OPTIONEN"],
	["UI_MENUE_BEENDEN", "UI_KANAL_BEENDEN"],
]
const BILDSCHIRM := Rect2(40, 84, 184, 120)

var _haupt: Control
var _unter: Control
var _hinweis: Control
var _knoepfe: Array[Button] = []
var _kanal_nr: Label
var _kanal_text: Label
var _kanal_info: Label
var _rauschen: Control
var _knopf_dreh: Control
var _kanal := 0
var _neuester := -1
var _zeit := 0.0


func _ready() -> void:
	layer = 30
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = false
	_spiel_ebenen_zeigen(false)
	_neuester = Spielstand.neuester_platz()
	_aufbauen()
	Klang.musik("titel")
	if Einstellungen.erster_start():
		_epilepsie_hinweis()
	else:
		_kanal_waehlen(0 if _neuester >= 0 else 1, true)


func _exit_tree() -> void:
	_spiel_ebenen_zeigen(true)


## HUD und Popochiu-Oberfläche gehören nicht ins Menü.
func _spiel_ebenen_zeigen(an: bool) -> void:
	if is_instance_valid(Spiel.hud):
		Spiel.hud.visible = an
	var gui_ebene := E.get_node_or_null("GraphicInterfaceLayer") as CanvasLayer
	if gui_ebene:
		gui_ebene.visible = an


func _aufbauen() -> void:
	var grund := ColorRect.new()
	grund.color = S.DUNKEL
	grund.set_anchors_preset(Control.PRESET_FULL_RECT)
	grund.mouse_filter = Control.MOUSE_FILTER_STOP
	add_child(grund)
	_haupt = Control.new()
	_haupt.set_anchors_preset(Control.PRESET_FULL_RECT)
	_haupt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_haupt)

	var titel := S.label(tr("UI_SPIELTITEL"), 24, S.GELB)
	titel.position = Vector2(0, 14)
	titel.size = Vector2(480, 32)
	titel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_haupt.add_child(titel)
	var unter := S.label(tr("UI_SPIELUNTERTITEL"), 10, S.ORANGE)
	unter.position = Vector2(0, 46)
	unter.size = Vector2(480, 14)
	unter.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_haupt.add_child(unter)

	_fernseher()

	var liste := VBoxContainer.new()
	liste.position = Vector2(286, 92)
	liste.size = Vector2(150, 140)
	liste.add_theme_constant_override("separation", 6)
	_haupt.add_child(liste)
	for i in KANAELE.size():
		var k := S.knopf("%d   %s" % [i + 1, tr(KANAELE[i][0])])
		k.alignment = HORIZONTAL_ALIGNMENT_LEFT
		k.pressed.connect(_ausloesen.bind(i))
		k.focus_entered.connect(_kanal_waehlen.bind(i))
		k.mouse_entered.connect(func(): if not k.disabled: k.grab_focus())
		liste.add_child(k)
		_knoepfe.append(k)
	_knoepfe[0].disabled = _neuester < 0

	var version := S.label(str(ProjectSettings.get_setting("application/config/version", "")), 7, S.GRAU)
	version.position = Vector2(440, 256)
	_haupt.add_child(version)


## Platzhalter-Fernseher: Gehäuse, Bildschirm mit Kanalnummer und Rauschen, Drehknopf.
func _fernseher() -> void:
	var gehaeuse := Panel.new()
	gehaeuse.position = BILDSCHIRM.position - Vector2(14, 12)
	gehaeuse.size = BILDSCHIRM.size + Vector2(52, 24)
	gehaeuse.add_theme_stylebox_override("panel", S.flaeche(Color("733e39"), Color("3e2731"), 3))
	gehaeuse.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_haupt.add_child(gehaeuse)
	var schirm := ColorRect.new()
	schirm.position = BILDSCHIRM.position
	schirm.size = BILDSCHIRM.size
	schirm.color = Color("124e89")
	schirm.mouse_filter = Control.MOUSE_FILTER_IGNORE
	schirm.clip_contents = true
	_haupt.add_child(schirm)
	_rauschen = Control.new()
	_rauschen.size = BILDSCHIRM.size
	_rauschen.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_rauschen.draw.connect(_rauschen_zeichnen)
	schirm.add_child(_rauschen)
	_kanal_nr = S.label("", 10, S.GELB)
	_kanal_nr.position = Vector2(8, 4)
	schirm.add_child(_kanal_nr)
	_kanal_text = S.label("", 14)
	_kanal_text.position = Vector2(0, 40)
	_kanal_text.size = Vector2(BILDSCHIRM.size.x, 20)
	_kanal_text.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	schirm.add_child(_kanal_text)
	_kanal_info = S.label("", 8, S.GRAU)
	_kanal_info.position = Vector2(8, 66)
	_kanal_info.size = Vector2(BILDSCHIRM.size.x - 16, 44)
	_kanal_info.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_kanal_info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	schirm.add_child(_kanal_info)
	_knopf_dreh = Control.new()
	_knopf_dreh.position = Vector2(BILDSCHIRM.end.x + 19, BILDSCHIRM.position.y + 26)
	_knopf_dreh.size = Vector2(1, 1)
	_knopf_dreh.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_knopf_dreh.draw.connect(func():
		_knopf_dreh.draw_circle(Vector2.ZERO, 10, Color("3e2731"))
		_knopf_dreh.draw_circle(Vector2.ZERO, 8, Color("c28569"))
		_knopf_dreh.draw_line(Vector2.ZERO, Vector2(0, -8), Color("3e2731"), 2))
	_haupt.add_child(_knopf_dreh)
	for y in [80, 98]:
		var punkt := ColorRect.new()
		punkt.position = Vector2(BILDSCHIRM.end.x + 15, BILDSCHIRM.position.y + y)
		punkt.size = Vector2(8, 4)
		punkt.color = Color("3e2731")
		punkt.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_haupt.add_child(punkt)


func _rauschen_zeichnen() -> void:
	# Leichtes Bildrauschen: ein paar helle Zeilen. Bei „Flackern reduzieren“ steht das Bild still.
	var zufall := RandomNumberGenerator.new()
	zufall.seed = 7 if Einstellungen.wert("flackern_reduzieren") else int(_zeit * 12.0)
	for i in 14:
		var y := zufall.randf_range(0, BILDSCHIRM.size.y)
		var b := zufall.randf_range(10, BILDSCHIRM.size.x)
		_rauschen.draw_rect(Rect2(zufall.randf_range(0, BILDSCHIRM.size.x - b), y, b, 1),
			Color(1, 1, 1, zufall.randf_range(0.03, 0.12)))


func _process(delta: float) -> void:
	_zeit += delta
	if is_instance_valid(_rauschen) and not Einstellungen.wert("flackern_reduzieren"):
		_rauschen.queue_redraw()


func _kanal_waehlen(i: int, still := false) -> void:
	if i != _kanal and not still:
		Klang.geraeusch("wechsel")
	_kanal = i
	_kanal_nr.text = "%s %d" % [tr("UI_KANAL"), i + 1]
	_kanal_text.text = tr(KANAELE[i][0])
	_kanal_info.text = tr(KANAELE[i][1])
	if i == 0 and _neuester >= 0:
		var kopf: Dictionary = Spielstand.saveload.kopf_lesen(_neuester)
		_kanal_info.text = "%s\n%s · %s" % [SPIELSTAENDE.ort(kopf), SPIELSTAENDE.spielzeit(kopf),
			str(kopf.get("datum", "")).left(16)]
	_knopf_dreh.rotation = TAU * float(i) / KANAELE.size()
	if not _knoepfe[i].has_focus() and _haupt.visible:
		_knoepfe[i].grab_focus()


func _ausloesen(i: int) -> void:
	match i:
		0:
			if _neuester >= 0:
				starten(_neuester)
		1:
			starten(-1)
		2:
			_unter_zeigen("laden")
		3:
			_unter_zeigen("optionen")
		4:
			get_tree().quit()


## Spiel beginnen: -1 = neues Spiel, sonst diesen Platz laden (der Startraum lädt ihn gleich).
func starten(platz: int) -> void:
	Spiel.start_platz = platz
	Telemetrie.ereignis("hauptmenue_start", {platz = platz})
	get_tree().change_scene_to_file(Spiel.STARTRAUM)


#region Unterseiten ################################################################################
func _unter_zeigen(art: String) -> void:
	_haupt.hide()
	if art == "optionen":
		_unter = OPTIONEN.new()
	else:
		_unter = SPIELSTAENDE.new()
		_unter.modus = art
		_unter.geladen_werden.connect(starten)
	_unter.zurueck.connect(_unter_schliessen)
	add_child(_unter)


func _unter_schliessen() -> void:
	if is_instance_valid(_unter):
		_unter.queue_free()
	_unter = null
	_haupt.show()
	_knoepfe[_kanal].grab_focus.call_deferred()


func unter_offen() -> Control:
	return _unter if is_instance_valid(_unter) else null


#endregion

#region Epilepsie-Hinweis ##########################################################################
func _epilepsie_hinweis() -> void:
	_haupt.hide()
	_hinweis = Control.new()
	_hinweis.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(_hinweis)
	var p := S.panel(Vector2(60, 50), Vector2(360, 170))
	_hinweis.add_child(p)
	var titel := S.label(tr("UI_EPILEPSIE_TITEL"), 12, S.GELB)
	titel.position = Vector2(12, 6)
	p.add_child(titel)
	var text := S.label(tr("UI_EPILEPSIE"), 9)
	text.position = Vector2(12, 30)
	text.custom_minimum_size = Vector2(336, 0)
	text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	p.add_child(text)
	var ok := S.knopf(tr("UI_VERSTANDEN"))
	ok.position = Vector2(256, 136)
	ok.custom_minimum_size = Vector2(92, 0)
	ok.pressed.connect(_hinweis_schliessen)
	p.add_child(ok)
	ok.grab_focus.call_deferred()


func _hinweis_schliessen() -> void:
	Einstellungen.speichern()
	if is_instance_valid(_hinweis):
		_hinweis.queue_free()
	_hinweis = null
	_haupt.show()
	_kanal_waehlen(0 if _neuester >= 0 else 1, true)


func hinweis_offen() -> bool:
	return is_instance_valid(_hinweis)


#endregion

func _unhandled_input(event: InputEvent) -> void:
	if is_instance_valid(_hinweis):
		return
	if is_instance_valid(_unter):
		if event.is_action_pressed("ui_cancel") or event.is_action_pressed("cq_pause"):
			get_viewport().set_input_as_handled()
			_unter_schliessen()
		return
	if event is InputEventKey and event.pressed and not event.echo:
		var i: int = event.keycode - KEY_1
		if i >= 0 and i < KANAELE.size() and not _knoepfe[i].disabled:
			get_viewport().set_input_as_handled()
			_knoepfe[i].grab_focus()
			_ausloesen(i)
