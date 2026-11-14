@tool
extends CQRaum
# Raum „Dorfplatz“ (dorfplatz). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_dorfplatz_state.gd')

var state: Data = load("res://game/rooms/dorfplatz/room_dorfplatz.tres")

var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch
	if erster_besuch:
		_landung_vorbereiten()


## Ankunft in Welt 1 (skript/welt-1.md, Abschnitt 1): Max liest Opas Zettel, Toadi stürmt herbei.
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.szene([
		_landung,
		Spiel.z("MAX", "W1_ANK_MAX_0010"),
		_pixel_haltung.bind("idle"),   # setzt sich kerzengerade hin (0020)
		Spiel.z("PIX", "W1_ANK_PIX_0020"),
		_max_setzt_sich,
		Spiel.z("MAX", "W1_ANK_MAX_0030"),
		Spiel.z("PIX", "W1_ANK_PIX_0040"),
		_max_steht_auf,
		Spiel.z("MAX", "W1_ANK_MAX_0050"),
		Spiel.z("PIX", "W1_ANK_PIX_0051"),
		Spiel.z("MAX", "W1_ANK_MAX_0060"),
		Spiel.nahansicht_zeigen.bind("opas_zettel"),
		Spiel.z("OPA", "W1_ANK_OPA_0070"),
		Spiel.z("MAX", "W1_ANK_MAX_0080"),
		Spiel.z("PIX", "W1_ANK_PIX_0090"),
		_toadi_rennt_herbei,
		Spiel.z("TOA", "W1_ANK_TOA_0100"),
		_max_dreht_sich_um,
		Spiel.z("MAX", "W1_ANK_MAX_0110"),
		Spiel.z("TOA", "W1_ANK_TOA_0120"),
		Spiel.z("MAX", "W1_ANK_MAX_0121"),
		Spiel.z("TOA", "W1_ANK_TOA_0130"),
		Spiel.z("MAX", "W1_ANK_MAX_0140"),
		Spiel.z("TOA", "W1_ANK_TOA_0150"),
		Spiel.z("PIX", "W1_ANK_PIX_0160"),
		Spiel.z("MAX", "W1_ANK_MAX_0161"),
		Spiel.z("TOA", "W1_ANK_TOA_0170"),
		Spiel.z("MAX", "W1_ANK_MAX_0180"),
		Spiel.z("TOA", "W1_ANK_TOA_0190"),
		Spiel.z("TOA", "W1_ANK_TOA_0200"),
		Spiel.z("MAX", "W1_ANK_MAX_0210"),
		Spiel.z("PIX", "W1_ANK_PIX_0220"),
		Spiel.z("MAX", "W1_ANK_MAX_0230"),
		Spiel.z("PIX", "W1_ANK_PIX_0240"),
	])
	# Auch nach Überspringen (Esc) alle an ihrem Platz und aufrecht
	_max_lage(0.0)
	_max_pose("")
	_pixel_haltung("idle")
	if _ziel_max != Vector2.ZERO:
		C.Max.position = _ziel_max
	if _ziel_pix != Vector2.ZERO and has_character("Pixel"):
		C.Pixel.position = _ziel_pix
	if _toadi_ziel != Vector2.ZERO and has_character("Toadi"):
		C.Toadi.position = _toadi_ziel


## Der Wirbel spuckt Max aufs Pflaster (Skript Abschnitt 1): Max fällt von oben und landet auf dem
## Rücken, Pixel landet auf allen vier Pfoten daneben. Gedreht wird nur um 90 Grad, damit die Pixel
## sauber bleiben; eigene Fall-, Sitz- und Aufsteh-Bilder kommen im Aseprite-Durchgang.
var _ziel_max := Vector2.ZERO
var _ziel_pix := Vector2.ZERO


## Schon vor dem Einblenden: Max und Pixel hängen über dem Bild, Toadi wartet rechts außerhalb.
func _landung_vorbereiten() -> void:
	if not is_instance_valid(C.Max):
		return
	_ziel_max = C.Max.position
	C.Max.position = _ziel_max + Vector2(0, -400)
	_max_pose(POSE_LIEGT)
	if is_instance_valid(C.Pixel) and has_character("Pixel"):
		_ziel_pix = C.Pixel.position
		C.Pixel.position = _ziel_pix + Vector2(0, -400)
		_pixel_haltung("stehen")   # landet auf allen vier Pfoten
	if has_character("Toadi"):
		_toadi_ziel = C.Toadi.position
		C.Toadi.position = Vector2(minf(width - 20.0, _ziel_max.x + 420.0), _toadi_ziel.y)


func _landung() -> void:
	if not is_instance_valid(C.Max) or _ziel_max == Vector2.ZERO:
		return
	var t := create_tween()
	t.tween_property(C.Max, "position", _ziel_max, 0.45).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	if _ziel_pix != Vector2.ZERO:
		t.parallel().tween_property(C.Pixel, "position", _ziel_pix, 0.55).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	await t.finished
	if is_instance_valid(E.camera):
		var k := create_tween()
		for d in [Vector2(0, 3), Vector2(0, -2), Vector2(0, 1), Vector2.ZERO]:
			k.tween_property(E.camera, "offset", d, 0.05)
		await k.finished


var _toadi_ziel := Vector2.ZERO


## 0100: Toadi rennt von rechts auf den Platz und ruft dabei (Regie „Rennen-Animation von rechts“);
## Max schaut erst noch nach links und dreht sich bei 0110 um.
func _toadi_rennt_herbei() -> void:
	if not has_character("Toadi") or _toadi_ziel == Vector2.ZERO:
		return
	if C.Max.has_method("schauen_zu"):
		C.Max.schauen_zu(C.Max.global_position.x - 50.0)
	C.Toadi.schauen_zu(C.Toadi.global_position.x - 50.0)
	var t := create_tween()
	t.tween_property(C.Toadi, "position", _toadi_ziel, 1.3)
	# nicht abwarten: Toadi ruft, während er rennt


func _max_dreht_sich_um() -> void:
	if has_character("Toadi") and _toadi_ziel != Vector2.ZERO:
		C.Toadi.position = _toadi_ziel
		C.Max.schauen_zu(C.Toadi.global_position.x)
		C.Toadi.schauen_zu(C.Max.global_position.x)


## Max liegt (-90) oder steht (0).
## Posen aus Sebastians Gemini-Bogen (14. November 2026): liegt mit Kapuze überm Gesicht (0010),
## sitzt auf dem Pflaster (0030), kniet kurz und steht auf (0050).
const POSE_LIEGT := "res://grafik/figuren/max_posen/liegt_kapuze.png"
const POSE_SITZT := "res://grafik/figuren/max_posen/sitzt_boden.png"
const POSE_KNIET := "res://grafik/figuren/max_posen/kniet.png"


func _max_pose(bild: String, blende := 0.0) -> void:
	if is_instance_valid(C.Max) and C.Max.has_method("pose_zeigen"):
		await C.Max.pose_zeigen(bild, blende)


## Aufsetzen (0030): vom Liegen weich ins Sitzen.
func _max_setzt_sich() -> void:
	await _max_pose(POSE_SITZT, 0.4)


## Pixel steht (Bewegung „stehen“) oder sitzt (Ruhepose „idle“).
func _pixel_haltung(name: String) -> void:
	if not is_instance_valid(C.Pixel) or not has_character("Pixel"):
		return
	var player: AnimationPlayer = C.Pixel.get_node_or_null("AnimationPlayer")
	if player == null or not player.has_animation(name):
		return
	C.Pixel.idle_animation = name
	if not C.Pixel.is_talking:
		C.Pixel._play_idle()


## Aufstehen (0050): Sitzen, kurz auf ein Knie, dann stehen, jeweils überblendet (Sebastian: „zu plötzlich“).
func _max_steht_auf() -> void:
	await _max_pose(POSE_KNIET, 0.35)
	if not Spiel.testmodus and not E.cutscene_skipped:
		await get_tree().create_timer(0.45).timeout
	await _max_pose("", 0.35)


func _max_lage(grad: float) -> void:
	if is_instance_valid(C.Max):
		C.Max.rotation_degrees = grad


## Rätsel 3, zweite Ziege (0910–1010): Bestellzettel ans Dorfbrett, Rotkäppchen liefert.
func xxl_liefern() -> void:
	await Spiel.abgeben("Bestellzettel")
	await Spiel.szene([
		Spiel.z("MAX", "W1_DORF_MAX_0910"),
		Spiel.z("NAR", "W1_DORF_NAR_0920"),
		_lieferung.bind(true),
		Spiel.z("ROT", "W1_DORF_ROT_0930"),
		Spiel.z("XXL", "W1_DORF_XXL_0940"),
		Spiel.z("MAX", "W1_DORF_MAX_0950"),
		Spiel.z("ROT", "W1_DORF_ROT_0960"),
		Spiel.z("PIX", "W1_DORF_PIX_0970"),
		Spiel.z("ROT", "W1_DORF_ROT_0980"),
		_lieferung.bind(false),
	])
	_lieferung(false)
	if Zustand.ist("W1_ZIEGE_FOLGT"):
		await Spiel.sagen("MAX", "W1_DORF_MAX_1010")


func _lieferung(an: bool) -> void:
	var pos := get_marker_position("Lieferung")
	if an:
		Spiel.figur_hier("Rotkaeppchen", true, pos)
		Spiel.figur_hier("XxlZiege", true, pos + Vector2(48, 4))
		Zustand.setze("W1_XXL_GELIEFERT")  # ab jetzt folgt sie (skripte/welt_1.gd)
	else:
		Spiel.figur_hier("Rotkaeppchen", false)
		_zustand_anwenden()
