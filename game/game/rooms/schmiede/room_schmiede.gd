@tool
extends CQRaum
# Raum „Schmiede“ (schmiede). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_schmiede_state.gd')

var state: Data = load("res://game/rooms/schmiede/room_schmiede.tres")


var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Erstes Betreten (skript/welt-1.md, Schmiede 0710–0740): der Schmied und seine Ziege.
func _erste_szene() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.szene([
		Spiel.z("SCH", "W1_SCHM_SCH_0710"),
		Spiel.z("MAX", "W1_SCHM_MAX_0720"),
		Spiel.z("SCH", "W1_SCHM_SCH_0730"),
		Spiel.z("ZIE", "W1_SCHM_ZIE_0740"),
	])


func _nach_uebergang() -> void:
	await _erste_szene()


## Der Schmied hämmert im Stand auf das Hufeisen in der Zange (Sebastian, 14. November 2026):
## Animation „haemmern“ (Arm nach den Winkeln gedreht, Skript schmied_haemmern.py), beim Aufschlag
## sprühen Funken vom glühenden Eisen.
const AUFSCHLAG_BILD := 10          # Bild in „haemmern“, in dem der Hammer das Hufeisen trifft
const EISEN := Vector2(266, 182)    # glühendes Hufeisen auf dem Amboss
var _letztes_bild := -1


func _zustand_anwenden() -> void:
	super()
	if has_character("Schmied") and not Engine.is_editor_hint():
		var ap := C.Schmied.get_node("AnimationPlayer") as AnimationPlayer
		if ap and ap.has_animation("haemmern"):
			C.Schmied.idle_animation = "haemmern"
			if not C.Schmied.is_talking and not Spiel.testmodus:
				C.Schmied._play_idle()


func _process(delta: float) -> void:
	super(delta)
	if Engine.is_editor_hint() or not has_character("Schmied") or Spiel.testmodus:
		return
	var ap := C.Schmied.get_node("AnimationPlayer") as AnimationPlayer
	if not ap or ap.current_animation != "haemmern":
		_letztes_bild = -1
		return
	var bild := int(ap.current_animation_position / 0.11)
	if bild == AUFSCHLAG_BILD and _letztes_bild != AUFSCHLAG_BILD:
		_funken()
	_letztes_bild = bild


func _funken() -> void:
	for i in 7:
		var f := Polygon2D.new()
		f.polygon = PackedVector2Array([Vector2(-1, -1), Vector2(1, -1), Vector2(1, 1), Vector2(-1, 1)])
		f.color = Color("feae34") if i % 2 == 0 else Color("fee761")
		f.position = EISEN
		f.z_index = 60
		var mat := CanvasItemMaterial.new()
		mat.blend_mode = CanvasItemMaterial.BLEND_MODE_ADD
		f.material = mat
		add_child(f)
		var ziel := EISEN + Vector2(randf_range(-26, 18), randf_range(-26, 4))
		var t := f.create_tween().set_parallel()
		t.tween_property(f, "position", ziel, 0.32).set_ease(Tween.EASE_OUT)
		t.tween_property(f, "modulate:a", 0.0, 0.32)
		t.chain().tween_callback(f.queue_free)
