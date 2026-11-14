@tool
extends CQRaum
# Raum „Bergwerk“ (bergwerk). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_bergwerk_state.gd')

var state: Data = load("res://game/rooms/bergwerk/room_bergwerk.tres")

var _erster_besuch := false


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Die offene Rune-Tür ist ein eigenes Bild über dem Hintergrund mit geschlossener Tür: sichtbar erst
## nach Rätsel 10. Klicks gehen durch zum Ausgang darunter.
func _zustand_anwenden() -> void:
	super()
	if $Props.has_node("RuneTuerOffen"):
		var tuer: PopochiuProp = $Props.get_node("RuneTuerOffen")
		tuer.visible = Zustand.geloest("R10")
		tuer.clickable = false
	_lichtschein(Zustand.geloest("R10"))


## Violetter Lichtschein der offenen Rune-Tür auf dem Boden davor (Review P15), weich und
## leicht pulsierend.
func _lichtschein(an: bool) -> void:
	var schein := get_node_or_null("Props/Lichtschein") as Polygon2D
	if not an or Engine.is_editor_hint():
		if schein:
			schein.queue_free()
		return
	if schein:
		return
	for i in 3:
		var p := Polygon2D.new()
		var punkte := PackedVector2Array()
		var rx := 70.0 - i * 18.0
		var ry := 16.0 - i * 4.0
		for k in 24:
			var w := TAU * k / 24.0
			punkte.append(Vector2(cos(w) * rx, sin(w) * ry))
		p.polygon = punkte
		p.color = Color(0.72, 0.45, 1.0, 0.10 + i * 0.06)
		var mat := CanvasItemMaterial.new()
		mat.blend_mode = CanvasItemMaterial.BLEND_MODE_ADD
		p.material = mat
		if i == 0:
			schein = p
			p.name = "Lichtschein"
			p.position = Vector2(1120, 246)
			get_node("Props").add_child(p)
		else:
			schein.add_child(p)
	var t := schein.create_tween().set_loops()
	t.tween_property(schein, "modulate:a", 0.65, 1.4).set_trans(Tween.TRANS_SINE)
	t.tween_property(schein, "modulate:a", 1.0, 1.4).set_trans(Tween.TRANS_SINE)


## Erstes Betreten (skript/welt-1.md, Abschnitt 11): Streik. Rätsel 10 folgt nach dem Slice.
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	await Spiel.sagen("GRI", "W1_BERG_GRI_0010")


#region Rätsel 10 ##################################################################################
## Weg A, erster Teil: Licht für die Fackeln, Grimmzahn gibt den leeren Tarifvertrag.
func licht_bringen() -> void:
	await Spiel.szene([
		Spiel.z("MAX", "W1_BERG_MAX_0510"),
		Spiel.z("GRI", "W1_BERG_GRI_0520"),
		Spiel.z("GO1", "W1_BERG_GO1_0530"),
		Spiel.z("GO2", "W1_BERG_GO2_0540"),
		Spiel.z("GRI", "W1_BERG_GRI_0550"),
	])
	if not Zustand.ist("W1_GOBLIN_LICHT"):
		await Spiel.abgeben("Leuchttrank")
		await Spiel.geben("Tarifvertrag")
		Zustand.setze("W1_GOBLIN_LICHT")


## Weg A, zweiter Teil: Ketchup als Blut (0570–0590), dann das Arbeitslied.
func vertrag_unterschreiben() -> void:
	if not Zustand.ist("W1_GOBLIN_LICHT") or Zustand.geloest("R10"):
		await Spiel.ersatz()
		return
	await Spiel.szene([
		Spiel.z("MAX", "W1_BERG_MAX_0570"),
		Spiel.z("GRI", "W1_BERG_GRI_0580"),
		Spiel.z("PIX", "W1_BERG_PIX_0590"),
	])
	await Spiel.abgeben("Ketchup")
	Zustand.loese("R10a")
	await lied()


## Das Arbeitslied (0610–0700) nach Weg A oder B: Passwort-Teil „Knuddel-Puddi“, Rune-Tür offen.
func lied() -> void:
	var schritte := [
		Spiel.z("GRI", "W1_BERG_GRI_0610"),
		Spiel.z("GO1", "W1_BERG_GO1_0620"),
		Spiel.z("GO1", "W1_BERG_GO1_0630"),
		Spiel.z("MAX", "W1_BERG_MAX_0640"),
		Spiel.z("GRI", "W1_BERG_GRI_0650"),
	]
	if "zeugnis" in Zustand.nahansichten:
		schritte.append(Spiel.z("PIX", "W1_BERG_PIX_0660"))
	schritte.append_array([
		Spiel.z("MAX", "W1_BERG_MAX_0670"),
		Spiel.z("GRI", "W1_BERG_GRI_0680"),
		Spiel.z("MAX", "W1_BERG_MAX_0690"),
	])
	if has_character("Zeldina"):
		schritte.append(Spiel.z("ZEL", "W1_BERG_ZEL_0700"))
	await Spiel.szene(schritte)
	_zustand_anwenden()


#endregion
