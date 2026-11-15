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
		_pixel_geht_los,
		Spiel.z("MAX", "W1_ANK_MAX_0230"),
		Spiel.z("PIX", "W1_ANK_PIX_0240"),
	])
	# Auch nach Überspringen (Esc) alle an ihrem Platz und aufrecht
	_max_lage(0.0)
	_max_pose("")
	if is_instance_valid(C.Max) and C.Max.has_node("Sprite2D"):
		C.Max.get_node("Sprite2D").position.x = 0.0
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
	if E.cutscene_skipped:
		# Überspringen: sofort an Ort und Stelle, ohne auf Fall und Kamerawackeln zu warten
		C.Max.position = _ziel_max
		if _ziel_pix != Vector2.ZERO and is_instance_valid(C.Pixel):
			C.Pixel.position = _ziel_pix
		return
	# Max fällt mit der Bewegung „fallen“ und bleibt liegen (Kapuze überm Gesicht), bis er sich
	# aufsetzt; ohne die Bewegung bleibt es bei der Liegepose aus dem Posenbogen.
	var fall := 0.45
	if _max_gesten():
		await _max_pose("")
		C.Max.geste("fallen", false, CQFigur.GESTE_HALTEN)
		fall = maxf(0.3, C.Max.bild_zeit("fallen", 3))   # Bild 3: Aufprall
	var t := create_tween()
	t.tween_property(C.Max, "position", _ziel_max, fall).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	if _ziel_pix != Vector2.ZERO:
		t.parallel().tween_property(C.Pixel, "position", _ziel_pix, 0.55).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	await t.finished
	if is_instance_valid(E.camera):
		var k := create_tween()
		for d in [Vector2(0, 3), Vector2(0, -2), Vector2(0, 1), Vector2.ZERO]:
			k.tween_property(E.camera, "offset", d, 0.05)
		await k.finished


var _toadi_ziel := Vector2.ZERO


## 0220 „geht los Richtung Kneipe“: Pixel läuft wirklich ein Stück nach links zur Taverne und
## bleibt dort stehen, bis Max nachkommt (Review Fund 26).
func _pixel_geht_los() -> void:
	if not has_character("Pixel") or _ziel_pix == Vector2.ZERO:
		return
	_ziel_pix = Vector2(maxf(170.0, _ziel_pix.x - 110.0), _ziel_pix.y)
	if Spiel.testmodus or E.cutscene_skipped:
		return
	C.Pixel.walk_to(_ziel_pix)   # nicht abwarten: Max redet weiter


## 0100: Toadi rennt von rechts auf den Platz und ruft dabei (Regie „Rennen-Animation von rechts“);
## Max schaut erst noch nach links und dreht sich bei 0110 um.
var _toadi_start := Vector2.ZERO


func _toadi_rennt_herbei() -> void:
	if not has_character("Toadi") or _toadi_ziel == Vector2.ZERO:
		return
	if C.Max.has_method("schauen_zu"):
		C.Max.schauen_zu(C.Max.global_position.x - 50.0)
	C.Toadi.schauen_zu(_toadi_ziel.x)
	# Toadi rennt wirklich (Review Fund 8b): Gehzyklus doppelt so schnell, auch während er ruft
	var ap := C.Toadi.get_node("AnimationPlayer") as AnimationPlayer
	var t := create_tween()
	t.tween_method(func(k: float):
		C.Toadi.position = _toadi_start.lerp(_toadi_ziel, k)
		if ap.current_animation != "walk" and ap.has_animation("walk"):
			ap.play("walk")
		ap.speed_scale = 2.0, 0.0, 1.0, 1.3)
	t.finished.connect(func():
		ap.speed_scale = 1.0
		if C.Toadi.is_talking:
			ap.play("talk")
		else:
			C.Toadi._play_idle())
	_toadi_start = C.Toadi.position
	# nicht abwarten: Toadi ruft, während er rennt


func _max_dreht_sich_um() -> void:
	if has_character("Toadi") and _toadi_ziel != Vector2.ZERO:
		C.Toadi.position = _toadi_ziel
		# „dreht sich um“ (0110): Max schaut nach links; die Bewegung „wenden“ dreht ihn über die
		# Vorderansicht, gespiegelt also von links nach rechts zu Toadi.
		var bild := C.Max.get_node_or_null("Sprite2D") as Sprite2D
		var nach_rechts := C.Toadi.global_position.x > C.Max.global_position.x
		if _max_gesten() and bild and bild.flip_h == nach_rechts:
			await C.Max.geste("wenden", true, CQFigur.GESTE_HALTEN)
		C.Max.schauen_zu(C.Toadi.global_position.x)
		C.Max.geste_ende()
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


## Max' Gesten in der Ankunft (gesten-regie.md): fallen, vom_boden_aufstehen, wenden.
func _max_gesten() -> bool:
	return is_instance_valid(C.Max) and C.Max is CQFigur and not CQFigur.gesten_aus() 		and C.Max.hat_animation("fallen") and C.Max.hat_animation("vom_boden_aufstehen")


## Aufsetzen (0030): vom Liegen ins Sitzen, mit den ersten drei Bildern von „vom_boden_aufstehen“.
## Max liegt nach dem Fall im Sheet anders als am Anfang des Aufstehens: Das Bild wird um den
## Unterschied verschoben und gleitet beim Aufstehen zurück auf den Fußpunkt (_max_steht_auf).
func _max_setzt_sich() -> void:
	if _max_gesten() and C.Max.geste_gehalten:
		var bild := C.Max.get_node("Sprite2D") as Sprite2D
		bild.position.x = -C.Max.bild_versatz(C.Max.letztes_bild("fallen"), C.Max.sheet_bild("vom_boden_aufstehen", 0))
		await C.Max.geste("vom_boden_aufstehen", true, CQFigur.GESTE_HALTEN, 0, 2)
		return
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
	if _max_gesten() and C.Max.geste_gehalten and C.Max.get_node("AnimationPlayer").assigned_animation == "vom_boden_aufstehen":
		var bild := C.Max.get_node("Sprite2D") as Sprite2D
		var dauer: float = C.Max.get_node("AnimationPlayer").get_animation("vom_boden_aufstehen").length - C.Max.bild_zeit("vom_boden_aufstehen", 2)
		create_tween().tween_property(bild, "position:x", 0.0, maxf(0.2, dauer)).set_trans(Tween.TRANS_SINE)
		await C.Max.geste("vom_boden_aufstehen", true, "", 2)
		bild.position.x = 0.0
		return
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
	# Rotkäppchen kommt von rechts (Waldweg) und geht dorthin zurück (Review Fund 18)
	var rechts := Vector2(width - 10.0, pos.y)
	if an:
		Spiel.figur_hier("Rotkaeppchen", true, rechts)
		Spiel.figur_hier("XxlZiege", true, rechts + Vector2(48, 4))
		Zustand.setze("W1_XXL_GELIEFERT")  # ab jetzt folgt sie (skripte/welt_1.gd)
		if has_character("XxlZiege"):
			C.XxlZiege.laufen_zu(pos + Vector2(48, 4), 90.0)
		if has_character("Rotkaeppchen"):
			await C.Rotkaeppchen.laufen_zu(pos, 90.0)
	elif has_character("Rotkaeppchen"):
		await C.Rotkaeppchen.laufen_zu(rechts, 110.0)
		Spiel.figur_hier("Rotkaeppchen", false)
		_zustand_anwenden()
	else:
		_zustand_anwenden()
