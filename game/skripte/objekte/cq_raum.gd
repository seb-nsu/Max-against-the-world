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
		# „skala“ im Layout verkleinert alle Figuren im Raum zusätzlich (weite Außenräume wie der Dorfplatz)
		var vorn := float(bauplan().get("skala", 1.0))
		var oben := float(bauplan().tiefe) * vorn
		chr.scaling_region = {
			region_description = "Tiefe", scale_top = oben, scale_bottom = vorn,
			scale_max = maxf(oben, vorn), scale_min = minf(oben, vorn),
			polygon_top_y = float(bauplan().get("tiefe_oben_y", ys.min())), polygon_bottom_y = ys.max(), target_scale = 1.0,
		}
		chr.update_scale()


## Raumlicht (Layout „licht: "#b9b4d0"“): Figuren nehmen die Tönung dunkler Räume an und leuchten
## nicht mehr gegen den Hintergrund (Review Fund 20). Nur die Farbe, die Deckkraft bleibt.
func licht_anwenden() -> void:
	var l := Color(String(bauplan().licht))
	for c in get_characters():
		var chr := c as Node2D
		if chr:
			chr.modulate = Color(l.r, l.g, l.b, chr.modulate.a)


func _process(_delta: float) -> void:
	# Auch Figuren, die ohne Laufen versetzt werden (Marker, Szenen), bekommen ihre Größe
	if tiefe_aktiv():
		tiefe_anwenden()
	if bauplan().has("licht") and not Engine.is_editor_hint():
		licht_anwenden()
	if not _effekte.is_empty():
		_effekte_bewegen(_delta)
	if bauplan().has("stufen") and not Engine.is_editor_hint():
		stufen_anwenden()
	if not _bedingte_teile.is_empty() or not _hg_wechsel.is_empty():
		_bedingte_anpassen()


## Treppe in Seitenansicht (Layout „stufen: [[x, y], …]“, vordere Oberkanten der Trittflächen von
## unten nach oben): Der Laufweg ist eine glatte Schräge, die Füße sollen aber auf den Stufen stehen.
## Das Bild der Figur wird dafür senkrecht auf die Trittfläche unter ihr versetzt; in den ersten
## Pixeln nach einer Stufenkante hebt es sich weich auf die neue Stufe (Schritt statt Rutschen).
const STUFE_UEBERGANG := 9.0
## Auf der Treppe geht man langsamer und bedächtiger als auf ebenem Boden.
const STUFE_TEMPO := 0.7


func stufen_anwenden() -> void:
	var st: Array = bauplan().stufen
	for c in get_characters():
		var bild := c.get_node_or_null("Sprite2D") as Node2D
		if bild == null:
			continue
		var p: Vector2 = c.position
		var dy := 0.0
		if p.y < float(st[0][1]) and p.x >= float(st[0][0]):
			var k := 0
			while k + 1 < st.size() and p.x >= float(st[k + 1][0]):
				k += 1
			var ziel := float(st[k][1])
			if k > 0:
				var t := clampf((p.x - float(st[k][0])) / STUFE_UEBERGANG, 0.0, 1.0)
				ziel = lerpf(float(st[k - 1][1]), ziel, t * t * (3.0 - 2.0 * t))
			dy = ziel - p.y
			if k > 0:
				# Beim Hochsteigen hebt sich der Körper kurz etwas über die neue Stufe (Schwung)
				var t2 := clampf((p.x - float(st[k][0])) / STUFE_UEBERGANG, 0.0, 1.0)
				dy -= 2.0 * sin(t2 * PI)
		var s := maxf(absf(c.scale.y), 0.01)
		bild.position.y = dy / s
		if "walk_speed_override" in c:
			c.walk_speed_override = c.walk_speed * STUFE_TEMPO if dy != 0.0 else 0.0
		# Eigene Treppen-Bewegung („treppe_walk“, Knie hoch), wenn die Figur eine hat
		var auf_treppe := dy != 0.0 and p.y < float(st[0][1])
		var praefix := "treppe_" if auf_treppe and _hat_animation(c, "treppe_walk") else ""
		if c.animation_prefix != praefix:
			c.animation_prefix = praefix
			if c.is_moving:
				c._play_walk(c.position)


func _hat_animation(c: Node, name: String) -> bool:
	var player := c.get_node_or_null("AnimationPlayer") as AnimationPlayer
	return player != null and player.has_animation(name)


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
	props_schatten()
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
	props_schatten()
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
## die Baseline, wird verdeckt. Nicht klickbar; die Hotspots darunter bleiben. Stumme Deko-Figuren
## und kleine Deko-Sprites: „{bild, pos: [x, y], skala, blick}“ mit dem Fußpunkt als pos. Dazu „nach: R8“ oder „vor: R7“.
func vordergrund_setzen() -> void:
	_hg_wechsel = bauplan().get("hintergrund_nach", {})
	_hg_grund = ""
	if has_node("Props/Background"):
		var bg = get_node("Props/Background")
		if bg.get("texture"):
			_hg_grund = bg.texture.resource_path
	_bedingte_anpassen()
	_leuchten_setzen()
	_effekte_setzen()
	var teile: Dictionary = bauplan().get("vordergrund", {})
	if teile.is_empty() or Engine.is_editor_hint():
		return
	for teil_name: String in teile:
		var knoten := "Vordergrund_" + teil_name
		if get_node("Props").has_node(knoten):
			continue
		var t: Dictionary = teile[teil_name]
		if not ResourceLoader.exists(t.bild):
			continue
		var sp := Sprite2D.new()
		sp.name = knoten
		sp.texture = load(t.bild)
		sp.centered = false
		sp.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		if t.has("pos"):
			# Deko-Figur: Fußpunkt unten in der Mitte, Größe wie Figuren an dieser Stelle (skala)
			var s: float = t.get("skala", 1.0)
			sp.scale = Vector2(s, s)
			sp.position = Vector2(t.pos[0] - sp.texture.get_width() * s / 2.0, t.pos[1])
			sp.offset = Vector2(0, -sp.texture.get_height())
			sp.flip_h = t.get("blick", "rechts") == "links"
			if t.has("baseline"):
				# Zeichenreihenfolge nach einer eigenen Baseline (Hufeisen auf dem Amboss vor dem Schmied)
				sp.position.y = float(t.baseline)
				sp.offset.y -= (float(t.baseline) - float(t.pos[1])) / s
		else:
			sp.position = Vector2(t.rect[0], t.baseline)
			sp.offset = Vector2(0, float(t.rect[1]) - float(t.baseline))
		get_node("Props").add_child(sp)
		if t.has("wandschatten"):
			# Schlagschatten an der Wand dahinter (Flaschen im Regal, Review P15): dunkle Kopie, versetzt
			var ws := Sprite2D.new()
			ws.texture = sp.texture
			ws.centered = false
			ws.offset = sp.offset + Vector2(float(t.wandschatten[0]), float(t.wandschatten[1]))
			ws.modulate = Color(0.08, 0.06, 0.12, 0.45)
			ws.show_behind_parent = true
			ws.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
			sp.add_child(ws)
		if t.has("pos") and t.get("schatten", true):
			_schatten_unter(sp, sp.texture.get_width(), 0.0)
		if t.has("nach") or t.has("vor"):
			_bedingte_teile.append([sp, t.get("nach", ""), t.get("vor", "")])
	_bedingte_anpassen()


## Pulsierendes Leuchten (Layout „leuchten: [{pos: [x, y], r: [rx, ry], farbe: "#7fffd4", takt: 2.0}]“):
## weiche, addierte Lichtflecken über leuchtenden Dingen im Bild (Leuchtpilze, Review P15).
func _leuchten_setzen() -> void:
	if Engine.is_editor_hint() or not has_node("Props"):
		return
	var liste: Array = bauplan().get("leuchten", [])
	for i in liste.size():
		var name := "Leuchten_%d" % i
		if get_node("Props").has_node(name):
			continue
		var l: Dictionary = liste[i]
		var wurzel := Node2D.new()
		wurzel.name = name
		wurzel.position = Vector2(l.pos[0], l.pos[1])
		var farbe := Color(String(l.get("farbe", "#7fffd4")))
		for k in 3:
			var p := Polygon2D.new()
			var punkte := PackedVector2Array()
			var f := 1.0 - k * 0.3
			for j in 20:
				var w := TAU * j / 20.0
				punkte.append(Vector2(cos(w) * float(l.r[0]) * f, sin(w) * float(l.r[1]) * f))
			p.polygon = punkte
			p.color = Color(farbe.r, farbe.g, farbe.b, 0.14 + k * 0.08)
			var mat := CanvasItemMaterial.new()
			mat.blend_mode = CanvasItemMaterial.BLEND_MODE_ADD
			p.material = mat
			wurzel.add_child(p)
		wurzel.z_index = 1
		get_node("Props").add_child(wurzel)
		var takt := float(l.get("takt", 2.0))
		if Spiel.testmodus:
			continue   # Bildvergleich: ohne Pulsieren
		var t := wurzel.create_tween().set_loops()
		t.tween_property(wurzel, "modulate:a", 0.35, takt / 2.0).set_trans(Tween.TRANS_SINE)
		t.tween_property(wurzel, "modulate:a", 1.0, takt / 2.0).set_trans(Tween.TRANS_SINE)


## Lebendige Hintergründe (P16, Review): kleine Schleifen über gemalten Stellen. Layout „effekte“:
## {art: flackern, pos, r: [rx, ry]} Feuer, Glut, Fackeln (warmes, unruhiges Licht);
## {art: blasen, pos, breite} Blasen steigen und platzen (Kessel); {art: dampf, pos, breite} Dampf
## steigt auf (Fondue, Kessel); {art: glitzern, bereich: [x, y, w, h]} Lichtpunkte auf Wasser.
## Im Testmodus ohne Bewegung (Bildvergleich).
var _effekte: Array = []
var _effekt_zeit := 0.0


func _effekte_setzen() -> void:
	if Engine.is_editor_hint() or Spiel.testmodus or not has_node("Props") or not _effekte.is_empty():
		return
	for e: Dictionary in bauplan().get("effekte", []):
		var n := Node2D.new()
		n.z_index = 2
		get_node("Props").add_child(n)
		if e.art == "flackern":
			n.position = Vector2(e.pos[0], e.pos[1])
			for k in 2:
				var p := Polygon2D.new()
				var punkte := PackedVector2Array()
				var f := 1.0 - k * 0.45
				for j in 18:
					var w := TAU * j / 18.0
					punkte.append(Vector2(cos(w) * float(e.r[0]) * f, sin(w) * float(e.r[1]) * f))
				p.polygon = punkte
				p.color = Color(String(e.get("farbe", "#ffb347")), 0.16 + k * 0.12)
				var mat := CanvasItemMaterial.new()
				mat.blend_mode = CanvasItemMaterial.BLEND_MODE_ADD
				p.material = mat
				n.add_child(p)
		_effekte.append([e, n, 0.0])


func _effekte_bewegen(delta: float) -> void:
	_effekt_zeit += delta
	for eintrag in _effekte:
		var e: Dictionary = eintrag[0]
		var n: Node2D = eintrag[1]
		if not is_instance_valid(n):
			continue
		eintrag[2] -= delta
		match e.art:
			"flackern":
				if eintrag[2] <= 0.0:
					eintrag[2] = randf_range(0.06, 0.16)
					n.modulate.a = randf_range(0.45, 1.0)
					n.scale = Vector2.ONE * randf_range(0.9, 1.1)
			"blasen", "dampf":
				if eintrag[2] <= 0.0:
					var blase: bool = e.art == "blasen"
					eintrag[2] = randf_range(0.25, 0.6) if blase else randf_range(0.5, 0.9)
					var p := Polygon2D.new()
					var r := randf_range(1.0, 2.0) if blase else randf_range(4.0, 7.0)
					var punkte := PackedVector2Array()
					for j in 10:
						var w := TAU * j / 10.0
						punkte.append(Vector2(cos(w) * r, sin(w) * r * 0.8))
					p.polygon = punkte
					p.color = Color(String(e.get("farbe", "#b6f2a0" if blase else "#f2ece4")), 0.85 if blase else 0.28)
					p.position = Vector2(e.pos[0] + randf_range(-0.5, 0.5) * float(e.get("breite", 20)), e.pos[1])
					n.add_child(p)
					var t := p.create_tween().set_parallel()
					var hoch := 8.0 if blase else 26.0
					t.tween_property(p, "position:y", p.position.y - hoch, 0.7 if blase else 1.8)
					t.tween_property(p, "modulate:a", 0.0, 0.7 if blase else 1.8).set_ease(Tween.EASE_IN)
					if not blase:
						t.tween_property(p, "scale", Vector2(1.8, 1.8), 1.8)
					t.chain().tween_callback(p.queue_free)
			"glitzern":
				if eintrag[2] <= 0.0:
					eintrag[2] = randf_range(0.08, 0.2)
					var b: Array = e.bereich
					var p := Polygon2D.new()
					p.polygon = PackedVector2Array([Vector2(0, 0), Vector2(2, 0), Vector2(2, 1), Vector2(0, 1)])
					p.color = Color(1, 1, 1, 0.75)
					p.position = Vector2(randf_range(b[0], b[0] + b[2]), randf_range(b[1], b[1] + b[3]))
					n.add_child(p)
					var t := p.create_tween()
					t.tween_property(p, "position:x", p.position.x + 3.0, 0.5)
					t.parallel().tween_property(p, "modulate:a", 0.0, 0.5)
					t.tween_callback(p.queue_free)


## Kleiner weicher Schatten unter einem Sprite oder Prop, damit es auf dem Boden oder Tisch steht
## statt zu schweben (Sebastian, 13. November 2026). y_unten: Unterkante in lokalen Koordinaten.
func _schatten_unter(knoten: Node2D, breite: float, y_unten: float) -> void:
	if knoten.has_node("Schatten"):
		return
	var sh := Polygon2D.new()
	sh.name = "Schatten"
	var punkte := PackedVector2Array()
	var rx := maxf(breite * 0.45, 3.0)
	var ry := maxf(breite * 0.08, 1.5)
	var mx := breite / 2.0 if knoten is Sprite2D and not (knoten as Sprite2D).centered else 0.0
	for i in 16:
		var w := TAU * i / 16.0
		punkte.append(Vector2(mx + cos(w) * rx, y_unten - 1.0 + sin(w) * ry))
	sh.polygon = punkte
	sh.color = Color(0.08, 0.06, 0.1, 0.35)
	sh.show_behind_parent = true
	knoten.add_child(sh)
	knoten.move_child(sh, 0)


## Props mit „schatten: true“ im Layout bekommen einen Kontaktschatten unter ihr Bild.
func props_schatten() -> void:
	for p in get_props():
		if not p is CQProp or not p.bauplan().get("schatten", false):
			continue
		var r: Array = p.bauplan().get("rect", [0, 0, 16, 16])
		_schatten_unter(p, float(r[2]), float(r[3]) / 2.0)


## Teile, die erst nach (oder nur vor) einem Rätsel zu sehen sind („nach: R8“, „vor: R7“).
var _bedingte_teile: Array = []
## Zweite Fassung des Hintergrunds nach einem Rätsel: Layout „hintergrund_nach: {R12: res://…}“
## (Smaugis Kammer aufgeräumt, Turmkeller mit geschlossener Tür).
var _hg_wechsel: Dictionary = {}
var _hg_grund := ""


func _bedingte_anpassen() -> void:
	if not _hg_wechsel.is_empty() and has_node("Props/Background") and not _hg_grund.is_empty():
		var soll := _hg_grund
		for r: String in _hg_wechsel:
			if Zustand.geloest(r):
				soll = _hg_wechsel[r]
		var bg = get_node("Props/Background")
		if bg.texture == null or bg.texture.resource_path != soll:
			bg.texture = load(soll)
	for b in _bedingte_teile:
		if is_instance_valid(b[0]):
			b[0].visible = (b[1].is_empty() or Zustand.geloest(b[1])) and (b[2].is_empty() or not Zustand.geloest(b[2]))


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
	var x := C.player.position.x + (-45.0 if C.player.position.x > width / 2.0 else 45.0)   # 45 statt 20: Pixel stand Max auf den Beinen (Review Fund 24)
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
