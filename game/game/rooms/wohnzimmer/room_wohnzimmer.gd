@tool
extends CQRaum
# Raum „Wohnzimmer“ (wohnzimmer). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_wohnzimmer_state.gd')

var state: Data = load("res://game/rooms/wohnzimmer/room_wohnzimmer.tres")

var _intro := false


## Geburtstagsdeko nur im Finale (skripte/finale.gd)
func _zustand_anwenden() -> void:
	super()
	for sn in ["Kuchen", "Girlande", "Geschenke"]:
		var h := get_hotspot(sn)
		if is_instance_valid(h):
			h.visible = Zustand.ist("FINALE")


func _raum_betreten(erster_besuch: bool) -> void:
	# Spielbeginn: Einstieg und Szene „Kein WLAN“ (skript/prolog.md, Abschnitt 1)
	# (nicht, wenn das Hauptmenü gleich einen Spielstand lädt)
	_intro = erster_besuch and not Zustand.war_in("dachboden") and Spiel.start_platz < 0
	if _intro:
		_schwarz_an()


#region Einstieg ###################################################################################
## Einstieg: Das Bild ist schwarz, Max spricht aus dem Off (0002–0006), dann blendet das Wohnzimmer
## ein. Die schwarze Fläche liegt über dem Raum und unter Sprechblasen (Ebene 10) und HUD (11).
const AUFBLENDEN := 1.5
## Wo Max' Sprechblasen stehen, solange das Bild schwarz ist (Bildmitte)
const OFF_PLATZ := Vector2(320, 350)

var _schwarz: CanvasLayer
var _max_platz := Vector2.INF


func einstieg_laeuft() -> bool:
	return is_instance_valid(_schwarz)


func _schwarz_an() -> void:
	_schwarz = CanvasLayer.new()
	_schwarz.layer = 8
	var flaeche := ColorRect.new()
	flaeche.color = Color.BLACK
	flaeche.set_anchors_preset(Control.PRESET_FULL_RECT)
	flaeche.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_schwarz.add_child(flaeche)
	add_child(_schwarz)
	if is_instance_valid(Spiel.hud):
		Spiel.hud.visible = false
	_max_platz = C.player.position
	C.player.position = OFF_PLATZ
	_liegen_an()


## Max zurück an seinen Platz, HUD wieder an, Schwarz ausblenden. Auch nach dem Überspringen.
func _aufblenden() -> void:
	if not is_instance_valid(_schwarz):
		return
	var ebene := _schwarz
	_schwarz = null
	if _max_platz != Vector2.INF:
		C.player.position = _max_platz
	if is_instance_valid(Spiel.hud):
		Spiel.hud.visible = true
	if not Spiel.testmodus and not E.cutscene_skipped:
		var t := create_tween()
		t.tween_property(ebene.get_child(0), "color:a", 0.0, AUFBLENDEN)
		await t.finished
	ebene.queue_free()


## Max liegt zu Beginn auf dem Sofa, das Handy über dem Gesicht (skript/prolog.md, Einstieg), und
## steht vor 0070 auf. Solange er liegt, ist sein eigenes Bild unsichtbar; er spricht von seinem
## Platz vor dem Sofa aus, die Sprechblasen stehen damit über dem Liegenden.
const LIEGEN_BILD := "res://grafik/props/max_liegend.png"
const SITZEN_BILD := "res://grafik/props/max_sitzend.png"
## Max liegt in der Sitzmulde, Kopf auf der hinteren (rechten) Armlehne, Knie hoch; die vordere
## Armlehne mit der Decke liegt als Ausschnitt des Hintergrunds vor ihm (Sebastian, 14. November 2026).
const LEHNE_BILD := "res://grafik/props/sofa_lehne_vorn.png"
const LEHNE_PLATZ := Vector2(35, 212)
## Unterkante des Liegenden auf der Sitzfläche, Füße des Sitzenden vor dem Sofa
const LIEGEN_UNTEN := Vector2(72, 240)
const SITZEN_FUESSE := Vector2(205, 310)
## Größe wie Max vor dem Sofa (Tiefe), beide Bilder aus Gemini-Posen (14. November 2026)
const POSE_SKALA := 0.95

var _liegend: Sprite2D
var _lehne: Sprite2D


func _pose(bild: String) -> Sprite2D:
	var sp := Sprite2D.new()
	sp.texture = load(bild)
	sp.centered = false
	sp.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	sp.scale = Vector2(POSE_SKALA, POSE_SKALA)
	return sp


func _liegen_an() -> void:
	if not ResourceLoader.exists(LIEGEN_BILD) or not has_node("Props"):
		return
	_liegend = _pose(LIEGEN_BILD)
	_liegend.name = "MaxLiegend"
	_liegend.flip_h = true
	_liegend.position = LIEGEN_UNTEN - Vector2(0, _liegend.texture.get_height() * POSE_SKALA)
	get_node("Props").add_child(_liegend)
	if ResourceLoader.exists(LEHNE_BILD):
		_lehne = Sprite2D.new()
		_lehne.name = "SofaLehneVorn"
		_lehne.texture = load(LEHNE_BILD)
		_lehne.centered = false
		_lehne.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		_lehne.position = LEHNE_PLATZ
		get_node("Props").add_child(_lehne)
	_max_bild_alpha(0.0)


func _max_bild_alpha(a: float) -> void:
	var bild := C.player.get_node_or_null("Sprite2D") as CanvasItem
	if bild:
		bild.modulate.a = a


## Max steht auf: vom Liegen über das Sitzen auf der Sofakante zum Stehen vor dem Sofa, jeweils kurz
## überblendet. Nach dem Überspringen (oder im Testmodus) gleich stehend.
func _aufstehen() -> void:
	if not is_instance_valid(_liegend):
		_max_bild_alpha(1.0)
		return
	var liegend := _liegend
	_liegend = null
	var lehne := _lehne
	_lehne = null
	if Spiel.testmodus or E.cutscene_skipped or not ResourceLoader.exists(SITZEN_BILD):
		if is_instance_valid(lehne):
			lehne.queue_free()
		liegend.queue_free()
		_max_bild_alpha(1.0)
		return
	var sitzend := _pose(SITZEN_BILD)
	sitzend.name = "MaxSitzend"
	var groesse := Vector2(sitzend.texture.get_size()) * POSE_SKALA
	sitzend.position = SITZEN_FUESSE - Vector2(groesse.x / 2.0, groesse.y)
	sitzend.modulate.a = 0.0
	sitzend.z_index = 1   # vor der Armlehne, solange die noch da ist
	get_node("Props").add_child(sitzend)
	var t := create_tween()
	t.set_parallel()
	t.tween_property(liegend, "modulate:a", 0.0, 0.3)
	t.tween_property(sitzend, "modulate:a", 1.0, 0.3)
	t.chain().tween_callback(_weg.bind(lehne))   # Armlehne verschwindet mit dem Liegenden
	t.tween_interval(0.45)
	var bild := C.player.get_node_or_null("Sprite2D") as CanvasItem
	t.chain().tween_property(sitzend, "modulate:a", 0.0, 0.3)
	if bild:
		t.parallel().tween_property(bild, "modulate:a", 1.0, 0.3)
	await t.finished
	liegend.queue_free()
	sitzend.queue_free()


func _weg(knoten: Node) -> void:
	if is_instance_valid(knoten):
		knoten.queue_free()


#endregion

func _nach_uebergang() -> void:
	if not _intro:
		return
	_intro = false
	await Spiel.szene([
		Spiel.z("MAX", "P0_WOHN_MAX_0002"),
		Spiel.z("MAX", "P0_WOHN_MAX_0004"),
		Spiel.z("MAX", "P0_WOHN_MAX_0006"),
		_aufblenden,
		Spiel.z("MAX", "P0_WOHN_MAX_0010"),
		Spiel.z("MAX", "P0_WOHN_MAX_0020"),
		Spiel.z("OPA", "P0_WOHN_OPA_0030"),
		Spiel.z("MAX", "P0_WOHN_MAX_0040"),
		Spiel.z("OPA", "P0_WOHN_OPA_0042"),
		Spiel.z("MAX", "P0_WOHN_MAX_0044"),
		Spiel.z("OPA", "P0_WOHN_OPA_0050"),
		Spiel.z("MAX", "P0_WOHN_MAX_0060"),
		_aufstehen,
		Spiel.z("MAX", "P0_WOHN_MAX_0070"),
	])
	await _aufblenden()  # falls die Szene übersprungen wurde
	await _aufstehen()
	# Autospeicher „Anfang Welt“ (05-spielsysteme.md, Speichern)
	Spielstand.autospeichern()
