@tool
class_name CQRaum
extends PopochiuRoom
## Basisklasse der Räume.
##
## Beim Betreten: Raum als besucht merken, Spieler an den Ankunfts-Marker „Von<Herkunft>“
## stellen, ab Welt 1 die zweite Spielfigur danebenstellen, den Zustand anwenden
## (_zustand_anwenden(): Props, Ausgänge, Figuren), nach dem Übergang automatisch speichern
## und die eigene Szene des Raums starten (_nach_uebergang()). Nach dem Laden eines Spielstands
## wird nur der Zustand angewendet.


## Regeln eines Abschnitts, die mehrere Räume betreffen (Begleiter). Siehe skripte/welt_1.gd.
const ABSCHNITT_REGELN := {"welt-1": preload("res://skripte/welt_1.gd")}


func bauplan() -> Dictionary:
	return Bauplan.raum(script_name)


func raum_id() -> String:
	return bauplan().get("id", script_name.to_snake_case())


## Breite Räume (Dorfplatz, Zauberwald): Popochiu setzt die Kameragrenzen so, als läge der Raum
## mittig um den Bildschirm (von -(Breite-640)/2 bis 640+(Breite-640)/2). Unsere Hintergründe
## liegen aber von 0 bis Breite. Ohne diese Korrektur zeigte die Kamera links graue Fläche und
## erreichte das rechte Drittel nie (gefunden 13. November 2026 beim breiten Zauberwald).
func setup_camera() -> void:
	var vp_w: int = ProjectSettings.get_setting(PopochiuResources.DISPLAY_WIDTH)
	var vp_h: int = ProjectSettings.get_setting(PopochiuResources.DISPLAY_HEIGHT)
	if width > vp_w:
		PopochiuUtils.e.camera.limit_left = 0
		PopochiuUtils.e.camera.limit_right = width
	if height > vp_h:
		PopochiuUtils.e.camera.limit_top = 0
		PopochiuUtils.e.camera.limit_bottom = height


## Leichte Tiefe (Entscheidung vom 10. November 2026, Mittelweg): Steht im Layout des Raums
## „tiefe: 0.85“, werden alle Figuren von 100 Prozent am unteren Rand des Laufbereichs auf diesen
## Wert an seiner Hinterkante verkleinert, laufen dort auch entsprechend langsamer (Popochius
## Skalierung über scaling_region). Ohne Eintrag bleibt alles in Originalgröße.
func tiefe_aktiv() -> bool:
	return bauplan().has("tiefe") and not Engine.is_editor_hint()


func tiefe_anwenden() -> void:
	if Engine.is_editor_hint():
		return
	var ys: Array = bauplan().get("laufbereich", []).map(func(p): return float(p[1]))
	for c in get_characters():
		var chr := c as PopochiuCharacter
		if chr == null:
			continue
		if not tiefe_aktiv() or ys.is_empty():
			if not chr.scaling_region.is_empty():
				chr.scaling_region = {}
				chr.update_scale()
			continue
		var oben := float(bauplan().tiefe)
		chr.scaling_region = {
			region_description = "Tiefe", scale_top = oben, scale_bottom = 1.0,
			scale_max = maxf(oben, 1.0), scale_min = minf(oben, 1.0),
			polygon_top_y = ys.min(), polygon_bottom_y = ys.max(), target_scale = 1.0,
		}
		chr.update_scale()


func _process(_delta: float) -> void:
	# Auch Figuren, die ohne Laufen versetzt werden (Marker, Szenen), bekommen ihre Größe
	if tiefe_aktiv():
		tiefe_anwenden()


func _on_room_entered() -> void:
	# Der Raum bestimmt den Abschnitt, außer er gehört auch zum aktuellen (Dachboden im
	# Zwischenspiel: Bauplan aus dem Prolog, Welt-Tabelle „finale“).
	var ab := Bauplan.raum_abschnitt(script_name)
	if not ab.is_empty() and not _im_abschnitt(Zustand.abschnitt):
		Zustand.abschnitt = ab
	Klang.raum_musik(raum_id())
	Klang.raum_atmo(raum_id())
	var erster_besuch := not Zustand.war_in(raum_id())
	Telemetrie.raum_betreten(raum_id())
	Zustand.besuche(raum_id())
	if not Spiel.herkunft_raum.is_empty() and has_marker("Von" + Spiel.herkunft_raum):
		C.player.position = get_marker_position("Von" + Spiel.herkunft_raum)
	elif erster_besuch and has_marker("Start"):
		C.player.position = get_marker_position("Start")
	partner_aufstellen(true)
	_zustand_anwenden()
	tiefe_anwenden()
	blicke_anpassen()
	ambiente_starten()
	vordergrund_setzen()
	await _raum_betreten(erster_besuch)
	await Spiel.regel("raum_betreten", self, erster_besuch)
	Spiel.pixel_feld_pruefen()


func _on_room_transition_finished() -> void:
	# Start aus dem Hauptmenü mit „Fortsetzen“ oder „Laden“: gleich den Spielstand laden
	if Spiel.start_platz >= 0:
		var platz := Spiel.start_platz
		Spiel.start_platz = -1
		await Spielstand.laden(platz)
		return
	var war_wechsel := not Spiel.herkunft_raum.is_empty()
	Spiel.herkunft_raum = ""
	if war_wechsel:
		Spielstand.autospeichern()
	if await Spiel.regel("nach_uebergang", self):
		return
	await _nach_uebergang()


func _on_restore_from_savegame() -> void:
	Spiel.herkunft_raum = ""
	Telemetrie.raum_betreten(raum_id())
	Klang.raum_musik(raum_id())
	Klang.raum_atmo(raum_id())
	partner_aufstellen()
	_zustand_anwenden()
	tiefe_anwenden()
	blicke_anpassen()
	ambiente_starten()
	vordergrund_setzen()
	Spiel.pixel_feld_pruefen()
	await Spiel.regel("nach_laden", self)
	await _nach_laden()


## Blickrichtung der Figuren: fest aus dem Layout („blick:“), sonst zu Max hin. Die Begleiter
## (Max, Pixel) bleiben, wie sie sind. Beim Reden drehen sich Figuren ohne feste Richtung zu Max.
func blicke_anpassen() -> void:
	var fest := {}
	for f: Dictionary in bauplan().get("figuren", []):
		if f.get("blick"):
			fest[f.script_name] = f.blick
	for c in get_characters():
		if not c is CQFigur or c == C.player or c.script_name in ["Max", "Pixel"]:
			continue
		c.blick_fest = fest.get(c.script_name, "")
		if not c.blick_fest.is_empty():
			c.blick_setzen(c.blick_fest)
		elif is_instance_valid(C.player):
			c.schauen_zu(C.player.global_position.x)


## Ausgeschnittene Teile des Hintergrunds, hinter denen Figuren stehen können (Tresen, Baum):
## Layout „vordergrund: {name: {bild, rect: [x, y, w, h], baseline: y}}“. Wer weiter oben steht als
## die Baseline, wird verdeckt. Nicht klickbar; die Hotspots darunter bleiben.
func vordergrund_setzen() -> void:
	var teile: Dictionary = bauplan().get("vordergrund", {})
	if teile.is_empty() or Engine.is_editor_hint():
		return
	for teil_name: String in teile:
		var knoten := "Vordergrund_" + teil_name
		if get_node("Props").has_node(knoten):
			continue
		var t: Dictionary = teile[teil_name]
		var sp := Sprite2D.new()
		sp.name = knoten
		sp.texture = load(t.bild)
		sp.centered = false
		sp.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		sp.position = Vector2(t.rect[0], t.baseline)
		sp.offset = Vector2(0, float(t.rect[1]) - float(t.baseline))
		get_node("Props").add_child(sp)


## Lebendiger Hintergrund (P16): Vögel, Windstöße usw., wenn der Bauplan „ambiente“ hat.
## Liegt über den Figuren (Vögel am Himmel, Blätter im Vordergrund).
func ambiente_starten() -> CQAmbiente:
	var da := get_node_or_null("Ambiente") as CQAmbiente
	var cfg: Dictionary = bauplan().get("ambiente", {})
	if da or cfg.is_empty() or Engine.is_editor_hint():
		return da
	da = CQAmbiente.new(cfg)
	add_child(da)
	return da


func _im_abschnitt(ab: String) -> bool:
	return Bauplan.welten.get(ab, {}).get("raeume", []).any(func(r): return r.id == raum_id())


## Zusätzliche Ansehen-Zeilen eines Objekts (Zwischenspiel auf dem Dachboden); Räume
## überschreiben das. Die Einträge haben die Form des Bauplans ({zeile, sprecher, mal …}) und
## gewinnen bei gleichem „mal“ gegen die Zeilen des Bauplans.
func ansehen_zusatz(_objekt: String) -> Array:
	return []


func has_marker(name: String) -> bool:
	return $Markers.has_node(name)


## Ab Welt 1 (Pixel spielbar) stehen Max und Pixel immer zusammen im Raum: die nicht aktive
## Figur kommt neben die aktive, wenn sie noch nicht hier ist.
## neben_spieler: auch eine schon vorhandene Figur neben die aktive stellen (beim Betreten).
func partner_aufstellen(neben_spieler := false) -> void:
	if not Bauplan.figur_spielbar(Zustand.abschnitt, "pixel") or not is_instance_valid(C.player):
		return
	# get_character legt die Figur an, falls sie in diesem Lauf noch in keinem Raum stand
	# (Spielstand mitten in einer Welt geladen)
	var partner: PopochiuCharacter = C.get_character("Max" if C.player.script_name == "Pixel" else "Pixel")
	if not is_instance_valid(partner):
		return
	# Welt 3: Max in der Simulation, Pixel in der Realität (skripte/welt_3.gd)
	if Spiel.regel_wert("partner_getrennt", self) == true:
		if has_character(partner.script_name):
			Spiel.figur_hier(partner.script_name, false)
		return
	var x := C.player.position.x + (-20.0 if C.player.position.x > width / 2.0 else 20.0)
	var pos := Vector2(x, C.player.position.y)
	if not has_character(partner.script_name):
		Spiel.figur_hier(partner.script_name, true, pos)
	elif neben_spieler:
		partner.position = pos


## Bild, Sichtbarkeit und Positionen aus Schaltern und Werten ableiten (nie speichern).
func _zustand_anwenden() -> void:
	for h in get_hotspots():
		if h is CQAusgang:
			h.sichtbar_anpassen()
	for p in get_props():
		if p is CQProp:
			var g: String = p.bauplan().get("gegenstand", "") if p.bauplan().get("gegenstand") else ""
			if not g.is_empty():
				var sn := Bauplan.gegenstand_script_name(g)
				p.visible = not I.has_item_been_collected(sn)
	var regeln = ABSCHNITT_REGELN.get(Zustand.abschnitt)
	if regeln:
		regeln.figuren_anwenden(self)
	Spiel.regel_wert("zustand_anwenden", self)  # Welt 2 ff.: Begleiter, Figuren, Props


## Vor dem Einblenden (Figuren stellen). erster_besuch: Raum zum ersten Mal betreten.
func _raum_betreten(_erster_besuch: bool) -> void:
	pass


## Nach dem Einblenden: Szenen beim Betreten.
func _nach_uebergang() -> void:
	pass


## Nach dem Laden eines Spielstands.
func _nach_laden() -> void:
	pass
