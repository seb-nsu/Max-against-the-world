extends CanvasLayer
## Leiste über dem Spiel (05-spielsysteme.md, Bildschirmaufbau), Graubox-Fassung:
## Porträts von Max und Pixel oben links (aktive Figur hell, andere grau), Hilfe-Pfote oben
## rechts (ausgegraut, normal, leuchtend), Meldungen unten, Hotspot-Punkte bei gehaltener
## Umschalttaste. Die endgültige Oberfläche entsteht nach dem freigegebenen Mockup.

const PLATZHALTER := "res://grafik/platzhalter/"
const THEMA := "res://game/gui/resources/gui_theme.tres"

var _max: TextureButton
var _pixel: TextureButton
var _pfote: TextureButton
var _meldung: Label
var _ende: Label
var _punkte: Control
var _meldung_zeit := 0.0


func _ready() -> void:
	layer = 11
	var wurzel := Control.new()
	wurzel.set_anchors_preset(Control.PRESET_FULL_RECT)
	wurzel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if ResourceLoader.exists(THEMA):
		wurzel.theme = load(THEMA)
	add_child(wurzel)

	_punkte = _HotspotPunkte.new()
	_punkte.set_anchors_preset(Control.PRESET_FULL_RECT)
	_punkte.mouse_filter = Control.MOUSE_FILTER_IGNORE
	wurzel.add_child(_punkte)

	_max = _knopf(wurzel, "portraet_max.png", Vector2(3, 3), "UI_OBJ_MAX")
	_pixel = _knopf(wurzel, "portraet_pixel.png", Vector2(42, 3), "UI_OBJ_PIXEL")
	_pfote = _knopf(wurzel, "ui_pfote.png", Vector2(441, 3), "UI_PFOTE")
	_max.pressed.connect(func(): if C.player != C.Max: Spiel.figur_wechseln())
	_pixel.pressed.connect(Spiel.pixel_portraet_geklickt)
	_pfote.pressed.connect(_pfote_geklickt)

	_meldung = Label.new()
	_meldung.position = Vector2(0, 246)
	_meldung.size = Vector2(480, 21)
	_meldung.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_meldung.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_meldung.visible = false
	wurzel.add_child(_meldung)

	_ende = Label.new()
	_ende.set_anchors_preset(Control.PRESET_FULL_RECT)
	_ende.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_ende.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_ende.autowrap_mode = TextServer.AUTOWRAP_WORD
	_ende.visible = false
	wurzel.add_child(_ende)

	Hinweise.leuchten_geaendert.connect(func(_l): aktualisieren())
	Zustand.geaendert.connect(func(_n): aktualisieren())
	C.player_changed.connect(func(_a, _b): aktualisieren())
	aktualisieren.call_deferred()


func _process(delta: float) -> void:
	if _meldung.visible:
		_meldung_zeit -= delta
		if _meldung_zeit <= 0.0:
			_meldung.visible = false
	var zeigen := Input.is_action_pressed("cq_hotspots_zeigen")
	if zeigen != _punkte.visible:
		_punkte.visible = zeigen
	if zeigen:
		_punkte.queue_redraw()


func aktualisieren() -> void:
	if not is_instance_valid(_max):
		return
	var ist_max := not is_instance_valid(C.player) or C.player.script_name == "Max"
	_max.modulate = Color.WHITE if ist_max else Color(0.45, 0.45, 0.45)
	# Pixel als Gegenstand geht über das Pixel-Feld der Inventarleiste (05-spielsysteme.md, UI);
	# das Porträt wechselt nur die Figur.
	_pixel.modulate = Color.WHITE if not ist_max else Color(0.45, 0.45, 0.45)
	_pixel.disabled = not Spiel.pixel_wach()
	var bild := "ui_pfote_aus.png"
	if Hinweise.pfote_aktiv():
		bild = "ui_pfote_leuchtet.png" if Hinweise.leuchtet() else "ui_pfote.png"
	_pfote.texture_normal = load(PLATZHALTER + bild)
	_pfote.disabled = not Hinweise.pfote_aktiv()


func melden(text: String, sekunden := 2.0) -> void:
	_meldung.text = text
	_meldung.visible = true
	_meldung_zeit = sekunden


func ende_zeigen(text: String) -> void:
	_ende.text = text
	_ende.visible = true


func _pfote_geklickt() -> void:
	if Spiel.in_szene > 0 or E.playing_queue:
		return
	await Hinweise.pfote_geklickt()
	aktualisieren()


func _knopf(eltern: Control, bild: String, pos: Vector2, name_key: String) -> TextureButton:
	var k := TextureButton.new()
	k.texture_normal = load(PLATZHALTER + bild)
	k.position = pos
	k.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	k.mouse_entered.connect(func(): G.show_hover_text(name_key))
	k.mouse_exited.connect(func(): G.show_hover_text())
	eltern.add_child(k)
	return k


## Kleine Punkte auf allen anklickbaren Objekten des Raums (Umschalttaste halten).
class _HotspotPunkte extends Control:
	func _draw() -> void:
		if not is_instance_valid(R.current):
			return
		var xf := get_viewport().get_canvas_transform()
		for c in get_tree().get_nodes_in_group("PopochiuClickable"):
			if c is PopochiuClickable and c.visible and c.clickable and c != C.player:
				var p: Vector2 = xf * (c.global_position + c.interaction_polygon_position)
				draw_circle(p, 2.5, Color(0.15, 0.17, 0.27))
				draw_circle(p, 1.5, Color(0.99, 0.9, 0.38))
