class_name CQMinispiel
extends CanvasLayer
## Gemeinsamer Rahmen der Minispiele (05-spielsysteme.md, Nachsicht bei Minispielen). Die Regeln
## stehen ohne Oberfläche in skripte/minispiele/, die Spielflächen erben von hier:
## minispiel_ringen.gd, minispiel_hebel.gd, minispiel_tanz.gd.
##
## Eigene Überlagerung auf Ebene 9 wie die Reisetasche: Popochius Sprechblasen (Ebene 10) bleiben
## darüber sichtbar. Die Regeln des Abschnitts führen den Ablauf und fragen die Spielfläche mit
## zug() nach dem nächsten Zug des Spielers; Knöpfe melden ihn mit zug_melden(). Bedient wird mit
## Maus, Tastatur oder Controller (Knöpfe sind Ziele des Zeigers, skripte/controller.gd).
##
## Tests: Im Testmodus kommen die Züge aus Spiel.vorgabe_auswahl (automatik()). Mit
## Spiel.minispiel_von_hand wartet die Spielfläche auch im Testmodus auf echte Knöpfe
## (tests/minispiele.gd drückt sie).

signal zug_gemacht(zug: Array)

const STIL := preload("res://oberflaeche/menue_stil.gd")
## Platzhalter-Figuren wie in den Graubox-Räumen (tools/godot_raeume.py)
const FIGUR := Color("8b8b8b")
const FIGUR_RAND := Color("262b44")
const PIXEL_FARBE := Color("3a7d74")

## Wartet die Spielfläche gerade auf einen Zug?
var wartet := false
var _blasen := {}


func _ready() -> void:
	layer = 9
	# Fängt Klicks neben den Knöpfen ab, damit Max im Raum dahinter nicht losläuft
	var sperre := Control.new()
	sperre.set_anchors_preset(Control.PRESET_FULL_RECT)
	sperre.mouse_filter = Control.MOUSE_FILTER_STOP
	add_child(sperre)


func _exit_tree() -> void:
	blasen_zurueck()


## Züge aus den Vorgaben statt von Knöpfen (Testmodus ohne Spiel.minispiel_von_hand).
func automatik() -> bool:
	return Spiel.testmodus and not Spiel.minispiel_von_hand


## Wartet auf den nächsten Zug des Spielers (ein Knopf meldet ihn mit zug_melden()).
func zug() -> Array:
	wartet = true
	_wartet_geaendert()
	var z: Array = await zug_gemacht
	wartet = false
	_wartet_geaendert()
	return z


## Ein Knopf wurde gedrückt. Zählt nur, solange das Spiel auf einen Zug wartet (nicht während
## eine Zeile läuft).
func zug_melden(z: Array) -> void:
	if wartet:
		zug_gemacht.emit(z)


## Für die Spielflächen: Knöpfe an- oder ausgrauen, wenn sich wartet ändert.
func _wartet_geaendert() -> void:
	pass


## Kurze Pause für eine Bewegung; im Testmodus sofort weiter.
func pause(sekunden: float) -> void:
	if Spiel.testmodus:
		return
	await get_tree().create_timer(sekunden, true).timeout


## Sprechblase einer Figur an einen Punkt des Bildes legen, solange das Minispiel offen ist: Die
## Figur steht im Raum dahinter, gezeichnet wird sie auf der Spielfläche.
func blase(script_name: String, bildpunkt: Vector2) -> void:
	var c: PopochiuCharacter = C.get_character(script_name)
	if not is_instance_valid(c) or not c.is_inside_tree():
		return
	var welt: Vector2 = c.get_viewport().get_canvas_transform().affine_inverse() * bildpunkt
	c.dialog_pos_override = (welt - c.global_position) / c.scale
	_blasen[script_name] = c


func blasen_zurueck() -> void:
	for c in _blasen.values():
		if is_instance_valid(c):
			c.reset_dialog_pos_override()
	_blasen.clear()


## Schrift für gezeichneten Text (Namen der Platzhalter-Figuren)
static func schrift() -> Font:
	var thema := STIL.thema()
	if thema != null and thema.default_font != null:
		return thema.default_font
	return ThemeDB.fallback_font


## Platzhalter-Figur zeichnen: Kasten mit Kürzel, Füße bei fuss (Mitte unten).
static func figur_zeichnen(auf: CanvasItem, fuss: Vector2, groesse: Vector2, kuerzel: String,
		farbe := FIGUR, drehung := 0.0) -> void:
	auf.draw_set_transform(fuss, drehung, Vector2.ONE)
	var r := Rect2(Vector2(-groesse.x / 2.0, -groesse.y), groesse)
	auf.draw_rect(r, farbe)
	auf.draw_rect(r, FIGUR_RAND, false, 1.0)
	auf.draw_string(schrift(), r.position + Vector2(2, 10), kuerzel, HORIZONTAL_ALIGNMENT_LEFT, -1,
		8, Color.WHITE)
	auf.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)
