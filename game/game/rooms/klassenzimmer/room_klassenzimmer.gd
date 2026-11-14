@tool
extends CQRaum
# Raum „Klassenzimmer“ (klassenzimmer). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_klassenzimmer_state.gd')

var state: Data = load("res://game/rooms/klassenzimmer/room_klassenzimmer.tres")

var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Die sechs Flaschen sind eigene Sprites (Vordergrund „flasche_1“ bis „flasche_6“): Die Flasche,
## die Max gerade trägt, fehlt im Regal; Flasche 3 ist nach dem Trank (R6b) aufgebraucht.
func _process(delta: float) -> void:
	super(delta)
	if Engine.is_editor_hint() or not has_node("Props"):
		return
	var getragen := int(Zustand.wert("W1_FLASCHE", 0))
	if getragen > 0 and not I.is_item_in_inventory("Flasche"):
		getragen = 0
	for n in range(1, 7):
		var k := get_node_or_null("Props/Vordergrund_flasche_%d" % n)
		if k:
			k.visible = n != getragen and not (n == 3 and Zustand.geloest("R6b"))


## Erstes Betreten (skript/welt-1.md, Abschnitt 6): der Übungsbesen, dann Alwin.
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.szene([
		_uebungsbesen_fliegt,
		Spiel.z("NAR", "W1_HOGG_NAR_0010"),
		Spiel.z("PIX", "W1_HOGG_PIX_0020"),
		Spiel.z("ALW", "W1_HOGG_ALW_0030"),
		Spiel.z("MAX", "W1_HOGG_MAX_0040"),
		Spiel.z("ALW", "W1_HOGG_ALW_0050"),
	])
	await C.get_character("Alwin").call("stab_pruefen")


## Der Übungsbesen saust einmal quer durchs Bild in den Schrank (NAR 0010, Review Fund 17).
func _uebungsbesen_fliegt() -> void:
	var bild := "res://grafik/figuren/uebungsbesen.png"
	if Spiel.testmodus or E.cutscene_skipped or not ResourceLoader.exists(bild):
		return
	var daten: Dictionary = JSON.parse_string(FileAccess.get_file_as_string("res://daten/figuren/uebungsbesen.json"))
	var sp := Sprite2D.new()
	sp.texture = load(bild)
	sp.hframes = int(sp.texture.get_width() / float(daten.bild[0]))
	sp.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	sp.position = Vector2(-30, 250)
	sp.scale = Vector2(0.9, 0.9)
	get_node("Props").add_child(sp)
	var walk: Dictionary = daten.animationen.get("walk", daten.animationen.get("idle"))
	var t := create_tween()
	t.tween_method(func(k: float):
		sp.position = Vector2(lerpf(-30.0, 556.0, k), 250.0 - sin(k * PI * 3.0) * 14.0 - k * 40.0)
		sp.frame = int(walk.von) + int(k * 24.0) % int(walk.bilder), 0.0, 1.0, 1.4)
	t.tween_property(sp, "modulate:a", 0.0, 0.25)
	await t.finished
	sp.queue_free()


## Aus, bis die gemalten Schlüsselposen da sind (Sebastian, 14. November 2026: Alwin soll sich über
## den Kessel beugen, die Handhaltung passt nicht)
const RUEHREN_AN := false

## Alwin rührt im Stand im Kessel (Sebastian, 14. November 2026): Animation „ruehren“ (Hand und
## Kelle aus dem gemalten Sprite auf einer kleinen Kreisbahn, Skript alwin_ruehren.py).
func _zustand_anwenden() -> void:
	super()
	if has_character("Alwin") and not Engine.is_editor_hint():
		var ap := C.Alwin.get_node("AnimationPlayer") as AnimationPlayer
		if RUEHREN_AN and ap and ap.has_animation("ruehren"):
			C.Alwin.idle_animation = "ruehren"
			if not C.Alwin.is_talking and not Spiel.testmodus:
				C.Alwin._play_idle()
