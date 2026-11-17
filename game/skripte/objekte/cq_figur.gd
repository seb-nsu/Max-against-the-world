@tool
class_name CQFigur
extends PopochiuCharacter
## Basisklasse der Figuren. Aus dem Bauplan:
## - Rechtsklick: Ansehen-Zeile (Pixel-Variante, wenn Pixel spielt)
## - Linksklick mit Max: das gleichnamige Gespräch; bei Tieren (Layout „_tiere“) versteht Max
##   nur Miau (WECH „max_tier“); sonst Ersatzzeile
## - Linksklick mit Pixel: Tiere reden mit ihm („Pixel redet mit …“ samt Übersetzung), Menschen
##   kommentieren den Kater („Pixel auf …“), sonst WECH „pixel_figur“
## - Pixel-Feld auf die Figur: wie Linksklick mit Pixel
## - Gegenstand auf die Figur: Kombinationszeile („Thunfischdose auf Grimmzahn“), sonst Ersatz
## Rätsellogik in den Skripten der Figuren: _on_click(), _on_item_used(), _pixel_auf(); betrifft
## ein Rätsel mehrere Figuren, im Raum: figur_benutzt(figur, item) -> bool (true = erledigt).


## Ohne Sprachaufnahme bewegt sich der Mund so lange, wie der Satz gesprochen etwa dauert; danach
## steht die Figur still, bis der Text weggeklickt ist. Mit Aufnahme bestimmt deren Länge.
const ZEICHEN_JE_SEKUNDE := 14.0
const REDEN_MINDESTENS := 0.6

## Zählt die Sätze, damit ein alter Zeitgeber keinen neuen Satz beendet.
var _satz_nr := 0


func _ready() -> void:
	super()
	if not Engine.is_editor_hint():
		grafik_laden()


## Überdeckung mit Hotspots und Props entscheidet Spiel.zeiger_betritt (Größe und Rang).
func _on_mouse_entered() -> void:
	if not Spiel.zeiger_betritt(self):
		super()


func say(dialog: String, params: Variant = null) -> void:
	_satz_nr += 1
	# Wer mit Max (oder Pixel) redet, dreht sich zu ihm, außer der Raum legt die Richtung fest
	if not Engine.is_editor_hint() and self != C.player and is_instance_valid(C.player) 			and C.player.get_parent() == get_parent() and blick_fest.is_empty():
		schauen_zu(C.player.global_position.x)
	if not Engine.is_editor_hint() and is_inside_tree() and not PopochiuUtils.e.cutscene_skipped:
		_mund_schliessen(_satz_nr, redezeit(PopochiuUtils.e.translate(dialog, params)))
	# Eine Warte-Geste (Kulisse) bricht ab, sobald die Figur spricht
	if geste_laeuft and _geste_unterbrechbar:
		geste_ende()
	# Redegeste (rede_geste()): eine Bewegung statt talk, nur für diesen Satz
	var talk_vorher := ""
	if not _rede_ersatz.is_empty():
		if hat_animation(_rede_ersatz) and not gesten_aus():
			talk_vorher = talk_animation
			talk_animation = _rede_ersatz
		_rede_ersatz = ""
	await super(dialog, params)
	if not talk_vorher.is_empty():
		talk_animation = talk_vorher


## Geschätzte Sprechdauer eines Satzes in Sekunden (BBCode zählt nicht mit).
static func redezeit(text: String) -> float:
	var rein := RegEx.create_from_string("\\[[^\\]]*\\]").sub(text, "", true)
	return maxf(REDEN_MINDESTENS, rein.strip_edges().length() / ZEICHEN_JE_SEKUNDE)


func _mund_schliessen(nr: int, sekunden: float) -> void:
	var vo := _get_vo_cue(emotion)
	var cue = PopochiuUtils.a.get(vo) if not vo.is_empty() else null
	if cue and cue.audio:
		sekunden = cue.audio.get_length()  # eingesprochen: so lange wie die Aufnahme
	await get_tree().create_timer(sekunden).timeout
	if nr == _satz_nr and is_talking and is_instance_valid(self):
		_play_idle()


## Einzelne Posen außerhalb des Sprite-Sheets (liegen, sitzen, knien aus Gemini-Posenbögen):
## ein eigenes Bild an Stelle des normalen, Fußpunkt unten in der Mitte, Größe und Blickrichtung wie
## die Figur. Leerer Pfad oder pose_ende() zeigt wieder das normale Bild.
func pose_zeigen(bild: String, blende := 0.0) -> void:
	if bild.is_empty() or not ResourceLoader.exists(bild):
		await pose_ende(blende)
		return
	var haupt := get_node_or_null("Sprite2D") as Sprite2D
	var alt := get_node_or_null("Pose") as Sprite2D
	var sp := Sprite2D.new()
	sp.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	sp.texture = load(bild)
	sp.centered = true
	sp.offset = Vector2(0, -sp.texture.get_height() / 2.0)
	if haupt:
		sp.flip_h = haupt.flip_h
	if alt:
		alt.name = "PoseAlt"
	add_child(sp)
	sp.name = "Pose"
	var ueberblenden := blende > 0.0 and not PopochiuUtils.e.cutscene_skipped and not Spiel.testmodus
	if ueberblenden:
		sp.modulate.a = 0.0
		var t := create_tween().set_parallel()
		t.tween_property(sp, "modulate:a", 1.0, blende)
		if alt:
			t.tween_property(alt, "modulate:a", 0.0, blende)
		elif haupt:
			t.tween_property(haupt, "modulate:a", 0.0, blende)
		await t.finished
	if alt:
		alt.queue_free()
	if haupt:
		haupt.visible = false
		haupt.modulate.a = 1.0


func pose_ende(blende := 0.0) -> void:
	var sp := get_node_or_null("Pose") as Sprite2D
	var haupt := get_node_or_null("Sprite2D") as Sprite2D
	if haupt:
		haupt.visible = true
	if sp and haupt and blende > 0.0 and not PopochiuUtils.e.cutscene_skipped and not Spiel.testmodus:
		haupt.modulate.a = 0.0
		var t := create_tween().set_parallel()
		t.tween_property(sp, "modulate:a", 0.0, blende)
		t.tween_property(haupt, "modulate:a", 1.0, blende)
		await t.finished
	if sp:
		sp.queue_free()
	if haupt:
		haupt.modulate.a = 1.0


## Sprung im Bogen zu ziel (Fußpunkt), mit Ducken, Strecken in der Luft und Abfedern bei der
## Landung (Pixel auf den Dachbalken). bogen: wie hoch über der höheren der beiden Stellen.
func springen_zu(ziel: Vector2, bogen := 30.0, dauer := 0.42) -> void:
	var bild := get_node_or_null("Sprite2D") as Node2D
	if PopochiuUtils.e.cutscene_skipped or Spiel.testmodus:
		position = ziel
		sync_buffered_position()
		return
	if bild:
		schauen_zu(ziel.x)
	if bild is Sprite2D and _echte_grafik and hat_animation("springen"):
		await _springen_mit_bildern(ziel, bogen, dauer)
		return
	var start := position
	var t := create_tween()
	if bild:
		t.tween_property(bild, "scale", Vector2(1.08, 0.82), 0.14)   # ducken
		t.tween_property(bild, "scale", Vector2(0.92, 1.1), 0.06)    # abstoßen
	var spitze := minf(start.y, ziel.y) - bogen
	t.tween_method(func(k: float):
		var x := lerpf(start.x, ziel.x, k)
		# Parabel durch Start, Spitze und Ziel
		var y := (1 - k) * (1 - k) * start.y + 2 * (1 - k) * k * (2 * spitze - (start.y + ziel.y) / 2.0) + k * k * ziel.y
		position = Vector2(x, y)
		sync_buffered_position(), 0.0, 1.0, dauer)   # sonst setzt Popochius Anti-Gleiten die alte Stelle zurück
	if bild:
		t.tween_property(bild, "scale", Vector2(1.1, 0.85), 0.07)    # abfedern
		t.tween_property(bild, "scale", Vector2.ONE, 0.12)
	await t.finished


## Läuft mit Gehzyklus zu ziel, ohne Wegfindung (hinter den Tresen, aus dem Bild, über Stellen
## außerhalb des Laufbereichs). tempo in Pixeln je Sekunde. Beim Überspringen sofort dort.
## Für Szenen, in denen das Skript eine Bewegung beschreibt (Review Fund 18). anim: eigene Lauf-Animation
## (etwa „joggen“ bei Hermes, „barfuss“ bei Max), sonst „walk“.
func laufen_zu(ziel: Vector2, tempo := 70.0, anim := "walk") -> void:
	if PopochiuUtils.e.cutscene_skipped or Spiel.testmodus or not is_inside_tree():
		position = ziel
		return
	# Gangart der Figur (walk_animation: Sondergänge wie „joggen“ oder „gehen“ der Ziegen), mit
	# Richtung (walk_d nach vorn, walk_u nach hinten). Hat die Figur gar keinen Gang, gleitet sie
	# nicht, sondern bleibt stehen (Entscheidung 16, gesten-regie-entscheidungen.md).
	# anim: eigene Lauf-Animation für diesen Weg (Hermes „joggen“), sonst die Gangart der Figur
	var wunsch := anim if anim != "walk" else walk_animation
	var gang := wunsch if hat_animation(wunsch) else ("walk" if hat_animation("walk") else "")
	if gang.is_empty() and _echte_grafik:
		push_warning("%s hat keinen Gang (%s): bleibt stehen" % [script_name, wunsch])
		return
	if not gang.is_empty():
		var vorher := walk_animation
		walk_animation = gang
		face_direction(ziel)
		schauen_zu(ziel.x)
		_play_walk(ziel)
		walk_animation = vorher
	else:
		schauen_zu(ziel.x)
	var t := create_tween()
	t.tween_property(self, "position", ziel, maxf(0.2, position.distance_to(ziel) / tempo))
	await t.finished
	sync_buffered_position()
	_play_idle()


## Blendet die Figur aus (Abgang durch eine Tür) und nimmt sie aus dem Raum.
func ausblenden_und_weg(dauer := 0.35) -> void:
	if not PopochiuUtils.e.cutscene_skipped and not Spiel.testmodus and is_inside_tree():
		var t := create_tween()
		t.tween_property(self, "modulate:a", 0.0, dauer)
		await t.finished
	Spiel.figur_hier(script_name, false)
	modulate.a = 1.0


## Popochius Laufgeschwindigkeit folgt der Tiefe auch außerhalb der Grenzen (oben auf der Treppe
## im Treppenhaus kröche Max sonst). Hier bleibt sie im selben Rahmen wie die Größe.
func update_scale():
	super()
	if not scaling_region.is_empty() and default_scale.x != 0.0:
		_walk_scale_factor = clampf(_walk_scale_factor, scaling_region.scale_min / default_scale.x,
			scaling_region.scale_max / default_scale.x)


## Blickrichtung aus dem Layout („links“ oder „rechts“); leer: die Figur schaut zu Max.
var blick_fest := ""
var _echte_grafik := false


## Dreht die Figur nach links oder rechts zur Stelle x (die Bilder schauen nach rechts).
func schauen_zu(x: float) -> void:
	# Platzhalter (Kasten mit Namen) nicht spiegeln, sonst steht die Schrift verkehrt
	if not _echte_grafik or absf(x - global_position.x) < 4.0:
		return
	face_direction(Vector2(x, global_position.y))
	if has_node("Sprite2D"):
		$Sprite2D.flip_h = x < global_position.x


func blick_setzen(richtung: String) -> void:
	schauen_zu(global_position.x + (-10.0 if richtung == "links" else 10.0))


## Echte Grafik statt Platzhalter: gibt es res://grafik/figuren/<id>.png samt
## res://daten/figuren/<id>.json (beides aus tools/figur.py paket), wird das Sprite-Sheet gesetzt und
## je Bewegung (idle, walk, talk …) eine Animation angelegt. Die Bilder schauen nach rechts; nach
## links spiegelt Popochiu. Der Fußpunkt liegt unten in der Bildmitte.
## variante: anderes Bild derselben Figur (etwa „pixel_ziege“ für Pixel im Ziegenfell).
var grafik_variante := ""
## Sondergänge, die bei Figuren ohne walk als Gang dienen (Hermes, Sobek an Land, Schildkröte,
## Hofkater, Leonidas, Archimedes im Handtuch), in dieser Reihenfolge
const ERSATZ_GAENGE := ["joggen", "kriechen", "laufen", "weggehen", "losrennen", "heureka"]


func grafik_laden(variante := "") -> bool:
	var id := variante if not variante.is_empty() else objekt_id()
	var bild := "res://grafik/figuren/%s.png" % id
	var daten_pfad := "res://daten/figuren/%s.json" % id
	if not ResourceLoader.exists(bild) or not FileAccess.file_exists(daten_pfad):
		return false
	var daten: Variant = JSON.parse_string(FileAccess.get_file_as_string(daten_pfad))
	if typeof(daten) != TYPE_DICTIONARY:
		push_error("Figur %s: %s nicht lesbar" % [id, daten_pfad])
		return false
	var sprite: Sprite2D = get_node("Sprite2D")
	var anims: Dictionary = daten.animationen
	var gesamt := 0
	for a: Dictionary in anims.values():
		gesamt = maxi(gesamt, int(a.von) + int(a.bilder))
	sprite.texture = load(bild)
	# „spalten“ (optional): große Sheets liegen in mehreren Reihen (Texturgrenze 16384 px);
	# die Bildnummern laufen zeilenweise weiter, die Animationen bleiben gleich
	var spalten := int(daten.get("spalten", gesamt))
	sprite.hframes = spalten
	sprite.vframes = ceili(float(gesamt) / spalten)
	sprite.frame = 0
	sprite.centered = true
	sprite.offset = Vector2(0, -float(daten.bild[1]) / 2.0)
	sprite.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	flips_when = FlipsWhen.LOOKING_LEFT
	var lib := AnimationLibrary.new()
	for name: String in anims:
		var a: Dictionary = anims[name]
		var anim := Animation.new()
		var spur := anim.add_track(Animation.TYPE_VALUE)
		anim.track_set_path(spur, "Sprite2D:frame")
		anim.value_track_set_update_mode(spur, Animation.UPDATE_DISCRETE)
		var dauer := float(a.ms) / 1000.0
		# „folge“ (optional): Reihenfolge der gespeicherten Bilder; Wiederholungen halten eine Pose,
		# ohne dass das Bild mehrfach im Sheet liegt
		var folge: Array = a.get("folge", range(int(a.bilder)))
		for i in folge.size():
			anim.track_insert_key(spur, i * dauer, int(a.von) + int(folge[i]))
		anim.length = folge.size() * dauer
		anim.loop_mode = Animation.LOOP_LINEAR if a.get("schleife", true) else Animation.LOOP_NONE
		lib.add_animation(name, anim)
	# Nach vorn und nach hinten (gesten-regie.md, Gehvarianten): Popochiu sucht die Richtungsendungen
	# vor dem Namen ohne Endung, darum braucht es dann auch walk_r und walk_l, sonst liefe die Figur
	# seitwärts mit walk_d. Vorn und hinten gilt nur bei fast senkrechten Wegen (67,5 bis 112,5 Grad).
	var richtungen := {"gehen_vorn": "walk_d", "gehen_hinten": "walk_u"}
	for quelle: String in richtungen:
		if lib.has_animation(quelle) and lib.has_animation("walk"):
			lib.add_animation(richtungen[quelle], lib.get_animation(quelle))
			for seite in ["walk_r", "walk_l"]:
				if not lib.has_animation(seite):
					lib.add_animation(seite, lib.get_animation("walk"))
	# Hauptgang (Entscheidungen 8 und 16): Die neuen Gänge der Ziegen („gehen“) ersetzen walk; Figuren
	# ohne walk laufen mit ihrer Sondergangart, damit auch Popochius Wegfindung einen Gang hat.
	if lib.has_animation("gehen") and lib.has_animation("walk") and not lib.has_animation("gehen_vorn"):
		lib.remove_animation("walk")
		lib.add_animation("walk", lib.get_animation("gehen"))
	if not lib.has_animation("walk"):
		for ersatz in ERSATZ_GAENGE:
			if lib.has_animation(ersatz):
				lib.add_animation("walk", lib.get_animation(ersatz))
				break
	var player: AnimationPlayer = get_node("AnimationPlayer")
	if player.has_animation_library(""):
		player.remove_animation_library("")
	player.add_animation_library("", lib)
	grafik_variante = variante
	_echte_grafik = true
	_bild_lagen.clear()
	geste_laeuft = false
	geste_gehalten = false
	_play_idle()
	return true


func bauplan() -> Dictionary:
	return Bauplan.figur(script_name)


func ansehen() -> String:
	Hinweise.objekt_beruehrt(bauplan().get("id", ""))
	return await Spiel.ansehen(bauplan().get("ansehen", []), "Figur/" + script_name)


func objekt_id() -> String:
	return bauplan().get("id", script_name.to_snake_case())


func on_click() -> void:
	Telemetrie.aktion_beginnen(objekt_id(), "benutzen")
	await _klick()
	Telemetrie.aktion_beenden()


func _klick() -> void:
	# Rätsel, die mehrere Figuren betreffen (Ziegen an der Brücke), regelt der Raum.
	if C.player != self and is_instance_valid(R.current) and R.current.has_method("figur_benutzt") \
			and await R.current.call("figur_benutzt", self, null):
		return
	if C.player != self and await Spiel.regel("pixel" if Spiel.ist_pixel() else "benutzen", self):
		return
	if Spiel.ist_pixel() and C.player != self:
		await _pixel_auf()
		return
	await super.on_click()


func on_right_click() -> void:
	Telemetrie.aktion_beginnen(objekt_id(), "ansehen")
	await super()
	Telemetrie.aktion_beenden()


func on_item_used(item: PopochiuInventoryItem) -> void:
	Telemetrie.aktion_beginnen(objekt_id(), "gegenstand", Telemetrie.gegenstand_id(item))
	await _gegenstand_benutzt(item)
	Telemetrie.aktion_beenden()


func _gegenstand_benutzt(item: PopochiuInventoryItem) -> void:
	if is_instance_valid(R.current) and R.current.has_method("figur_benutzt") \
			and await R.current.call("figur_benutzt", self, item):
		I.active = null
		return
	if item.script_name == Spiel.PIXEL_FELD:
		I.active = null
		if await Spiel.regel("pixel", self):
			return
		await _pixel_auf()
		return
	if await Spiel.regel("gegenstand", self, item):
		I.active = null
		return
	await super.on_item_used(item)


func _on_click() -> void:
	if C.player == self:
		return
	if bauplan().get("tier", false):
		await Spiel.wechsel_regel("max_tier")
		return
	if not Bauplan.dialog(script_name).is_empty():
		await reden()
		return
	await Spiel.ersatz()


func _on_double_click() -> void:
	await _on_click()


func _on_right_click() -> void:
	if C.player == self:
		return
	if await Spiel.regel("ansehen", self):
		return
	await ansehen()


func _on_middle_click() -> void:
	pass


func _on_item_used(item: PopochiuInventoryItem) -> void:
	var e := Spiel.gegenstand_zeile(bauplan().get("gegenstand_auf", []),
		Bauplan.gegenstand(item.script_name).get("id", ""))
	if e.is_empty():
		await Spiel.ersatz()
	else:
		await Spiel.max_geste("benutzen", true, e.zeile)   # Gegenstand auf etwas (Entscheidung 2)
		await Spiel.sagen_eintrag(e)


## Gespräch mit dieser Figur (Dialog mit gleichem Namen).
func reden() -> void:
	await Spiel.hingehen(self)
	var d: PopochiuDialog = D.get_instance(script_name)
	if not is_instance_valid(d):
		return
	if d is CQDialog and d.plauder_erschoepft() \
			and Zustand.ansehen_zaehlen("Plauder/" + script_name) == 1:
		# Alle Plauderoptionen weg: Max sagt einmalig eine Zeile aus SYS_PLA_MAX_*.
		var pla := Spiel.pool_zeile(Bauplan.plauder.get("MAX", []), "PLA_MAX")
		if not pla.is_empty():
			await Spiel.sagen("MAX", pla)
	if d is CQDialog and d.erschoepft():
		var zeile: String = d.abschied()
		if not zeile.is_empty():
			# Gespräch erschöpft: kein Menü, sondern die Abschiedszeilen im Wechsel
			await Spiel.sagen(zeile.split("_")[2], zeile)
			return
	await d.start()


## Pixel mit dieser Figur: reden (Tiere), kommentieren lassen (Menschen) oder WECH-Zeile.
func _pixel_auf() -> void:
	await Spiel.hingehen(self)
	for art in ["pixel_redet", "pixel_auf"]:
		for e in bauplan().get(art, []):
			if Spiel.eintrag_passt(e):
				await Spiel.sagen_eintrag(e)
				return
	if Zustand.abschnitt == "prolog":
		await Spiel.ersatz("PIX")
	else:
		await Spiel.wechsel_regel("pixel_figur")


#region Gesten ######################################################################################
## Einmalige Bewegungen aus dem Sprite-Sheet (docs/grafik/gesten-regie.md, Gemeinsame Mechanik).
## geste() spielt eine Bewegung genau einen Durchgang und kehrt danach zur Ruhe zurück (oder zur
## Redebewegung, wenn die Figur gerade spricht). Gewartet wird die Länge der Animation, nicht auf
## animation_finished; so laufen auch Schleifen (Melken, Putzen) genau einen Durchgang. Solange eine
## Geste läuft, lassen _play_idle() und _play_talk() sie in Ruhe; Laufen bricht sie ab.
## Im Testmodus und in übersprungenen Szenen passiert nichts (feste Bilder für den Bildvergleich);
## eine Bewegung, die die Figur nicht hat, wird still übergangen.
## danach: "" = zurück zur Ruhe; GESTE_HALTEN = auf dem letzten Bild stehen bleiben, bis
## geste_ende() kommt (Max liegt nach dem Fall); sonst der Name der neuen Ruhe-Bewegung
## (idle_animation), etwa „schlafen“ nach „hinlegen“. Die neue Ruhe gilt auch, wenn die Geste
## übersprungen wird.
## ab_bild, bis_bild: nur ein Teil der Bewegung, gezählt in Bildern der Bewegung (0 = erstes Bild
## im Sheet), etwa Max' Aufstehen vom Boden erst ab dem Sitzen.
const GESTE_HALTEN := "<halten>"

var geste_laeuft := false
## Auf dem letzten Bild gehalten (GESTE_HALTEN); Spiel.szene() löst das am Ende der Szene
var geste_gehalten := false
var _geste_nr := 0
var _geste_unterbrechbar := false
var _rede_ersatz := ""


## Gesten aus: Testmodus (Bildvergleich, Durchspieltests) oder übersprungene Szene.
static func gesten_aus() -> bool:
	return Spiel.testmodus or PopochiuUtils.e.cutscene_skipped


func hat_animation(anim: String) -> bool:
	var ap := get_node_or_null("AnimationPlayer") as AnimationPlayer
	return ap != null and not anim.is_empty() and ap.has_animation(anim)


func geste(anim: String, warten := true, danach := "", ab_bild := -1, bis_bild := -1) -> void:
	await _geste_spielen(anim, -1.0, warten, danach, ab_bild, bis_bild)


## Eine Schleife (Melken, Fußbad, Werkbank) für eine feste Zeit, danach Ruhe (oder danach, wie oben).
func geste_halten(anim: String, sekunden: float, warten := true, danach := "") -> void:
	await _geste_spielen(anim, sekunden, warten, danach)


## Zufällige Warte-Geste (Kulisse, CQRaum): wie geste(), bricht aber ab, sobald die Figur spricht.
## sekunden > 0: Schleife so lange halten.
func warte_geste(anim: String, sekunden := -1.0) -> void:
	await _geste_spielen(anim, sekunden, false, "")
	if geste_laeuft:
		_geste_unterbrechbar = true


## Warte-Folge (Kulisse, CQRaum): mehrere Gesten nacheinander, etwa der Arbeitszyklus des Schmieds
## (ins Feuer, Blasebalg, zum Amboss). Einträge sind Namen oder [Name, Sekunden] für gehaltene
## Schleifen. Spricht die Figur, läuft sie los oder kommt eine andere Geste, bricht die Folge ab.
func warte_folge(folge: Array) -> void:
	for schritt in folge:
		var anim: String = schritt[0] if schritt is Array else schritt
		var sek: float = float(schritt[1]) if schritt is Array else -1.0
		if is_talking or is_moving or not hat_animation(anim):
			return
		var nr := _geste_nr + 1
		await _geste_spielen(anim, sek, false, "")
		if _geste_nr != nr:
			return
		_geste_unterbrechbar = true
		while geste_laeuft and _geste_nr == nr and is_inside_tree():
			await get_tree().process_frame
		if _geste_nr != nr or is_talking or is_moving:
			return


## Statt talk spielt beim nächsten Satz dieser Figur diese Bewegung (Opa „panik“).
func rede_geste(anim: String) -> void:
	_rede_ersatz = anim


## Beendet eine gehaltene Geste (GESTE_HALTEN) oder bricht eine laufende ab.
func geste_ende() -> void:
	if not geste_laeuft:
		return
	_geste_nr += 1
	geste_laeuft = false
	geste_gehalten = false
	_zur_ruhe()


func _geste_spielen(anim: String, sekunden: float, warten: bool, danach: String,
		ab_bild := -1, bis_bild := -1) -> void:
	_gang_tempo(1.0)
	var neue_ruhe := not danach.is_empty() and danach != GESTE_HALTEN and hat_animation(danach)
	if gesten_aus() or not is_inside_tree() or not _echte_grafik or not hat_animation(anim):
		if neue_ruhe:
			idle_animation = danach
			if not geste_laeuft and not is_talking and not is_moving:
				_play_idle()
		return
	var ap: AnimationPlayer = get_node("AnimationPlayer")
	var a := ap.get_animation(anim)
	var start := _bild_zeit(a, ab_bild, true)
	var ende := a.length if bis_bild < 0 else _bild_zeit(a, bis_bild, false)
	var dauer := sekunden if sekunden > 0.0 else maxf(0.05, ende - start)
	_geste_nr += 1
	var nr := _geste_nr
	geste_laeuft = true
	geste_gehalten = false
	_geste_unterbrechbar = false
	ap.play(anim)
	ap.seek(start, true)
	if warten:
		await _geste_abwarten(nr, dauer, danach, ap)
	else:
		_geste_abwarten(nr, dauer, danach, ap)


## Zeit des ersten (anfang) oder das Ende des letzten Schritts, der Bild nr der Bewegung zeigt.
func _bild_zeit(a: Animation, nr: int, anfang: bool) -> float:
	if nr < 0 or a.get_track_count() == 0 or a.track_get_key_count(0) == 0:
		return 0.0 if anfang else a.length
	var schluessel := a.track_get_key_count(0)
	var erstes := 1 << 30
	for k in schluessel:
		erstes = mini(erstes, int(a.track_get_key_value(0, k)))
	var schritt := a.length / schluessel
	var treffer := -1
	for k in schluessel:
		if int(a.track_get_key_value(0, k)) == erstes + nr:
			treffer = k
			if anfang:
				break
	if treffer < 0:
		return 0.0 if anfang else a.length
	return a.track_get_key_time(0, treffer) + (0.0 if anfang else schritt)


func _geste_abwarten(nr: int, dauer: float, danach: String, ap: AnimationPlayer) -> void:
	var zeit := 0.0
	while zeit < dauer:
		await get_tree().process_frame
		if nr != _geste_nr or not is_inside_tree():
			return
		if PopochiuUtils.e.cutscene_skipped:
			break
		zeit += get_process_delta_time()
	if nr != _geste_nr:
		return
	if danach == GESTE_HALTEN:
		ap.pause()   # letztes Bild bleibt, bis geste_ende() kommt
		geste_gehalten = true
		return
	geste_laeuft = false
	if not danach.is_empty() and hat_animation(danach):
		idle_animation = danach
	_zur_ruhe()


func _zur_ruhe() -> void:
	if not is_inside_tree() or is_moving:
		return
	if is_talking:
		_play_talk()
	else:
		_play_idle()


func _play_idle() -> void:
	_gang_tempo(1.0)
	if geste_laeuft:
		return
	super()


func _play_talk() -> void:
	_gang_tempo(1.0)
	if geste_laeuft:
		return
	super()


func _play_walk(target_pos: Vector2) -> void:
	if geste_laeuft:
		_geste_nr += 1
		geste_laeuft = false
		geste_gehalten = false
	super(target_pos)
	_gang_tempo(float(get_meta("gang_tempo", 1.0)))


## Läuft die Figur im Raum schneller als ihre Größe (CQRaum.tiefe_anwenden, Raum-„skala“), laufen
## die Beine mit, damit die Füße nicht rutschen.
func _gang_tempo(faktor: float) -> void:
	var ap := get_node_or_null("AnimationPlayer") as AnimationPlayer
	if ap:
		ap.speed_scale = faktor


## Nummer im Sheet von Bild nr der Bewegung anim (-1, wenn es die Bewegung nicht gibt).
func sheet_bild(anim: String, nr: int) -> int:
	if not hat_animation(anim):
		return -1
	var a := (get_node("AnimationPlayer") as AnimationPlayer).get_animation(anim)
	var von := 1 << 30
	for k in a.track_get_key_count(0):
		von = mini(von, int(a.track_get_key_value(0, k)))
	return von + nr


## Letztes Bild der Bewegung (nach der Abspielfolge).
func letztes_bild(anim: String) -> int:
	if not hat_animation(anim):
		return -1
	var a := (get_node("AnimationPlayer") as AnimationPlayer).get_animation(anim)
	return int(a.track_get_key_value(0, a.track_get_key_count(0) - 1))


## Sekunden bis zum ersten Schritt, der Bild nr der Bewegung zeigt.
func bild_zeit(anim: String, nr: int) -> float:
	if not hat_animation(anim):
		return 0.0
	return _bild_zeit((get_node("AnimationPlayer") as AnimationPlayer).get_animation(anim), nr, true)


## Waagrechter Versatz im Bild (nach Blickrichtung), um den die Figur in Sheet-Bild b gegenüber
## Sheet-Bild a liegt: so lassen sich zwei Bewegungen aneinanderfügen, deren Posen im Sheet
## verschieden ausgerichtet sind (Max liegt nach dem Fall anders als beim Aufstehen).
func bild_versatz(a: int, b: int) -> float:
	var sp := get_node("Sprite2D") as Sprite2D
	return (bild_lage(b).x - bild_lage(a).x) * (-1.0 if sp.flip_h else 1.0)


## Lage jedes Bilds im Sheet (Unterkante über dem Fußpunkt, waagrechte Mitte), für Sprünge mit
## eingemalter Höhe. Einmal je Bild gemessen.
var _bild_lagen := {}


func bild_lage(bild_nr: int) -> Vector2:
	return _bild_lage(bild_nr)


func _bild_lage(bild_nr: int) -> Vector2:
	if _bild_lagen.has(bild_nr):
		return _bild_lagen[bild_nr]
	var sp := get_node("Sprite2D") as Sprite2D
	var lage := Vector2.ZERO
	var img := sp.texture.get_image() if sp.texture else null
	if img:
		if img.is_compressed():
			img.decompress()
		var w := img.get_width() / sp.hframes
		var h := img.get_height() / sp.vframes
		var x0 := (bild_nr % sp.hframes) * w
		var y0 := (bild_nr / sp.hframes) * h
		var rect := img.get_region(Rect2i(x0, y0, w, h)).get_used_rect()
		if rect.size.x > 0:
			lage = Vector2(rect.position.x + rect.size.x / 2.0 - w / 2.0, h - rect.end.y)
	_bild_lagen[bild_nr] = lage
	return lage


## Sprung mit den Bildern der Bewegung „springen“ (Pixel): Ducken und Aufrichten am Platz, in der
## Luft die Flugbilder, Landung. Die Höhe und der Vorschub, die in den Flugbildern schon eingemalt
## sind, werden herausgerechnet; die Flugbahn macht allein der Bogen (Entscheidung 13).
func _springen_mit_bildern(ziel: Vector2, bogen: float, dauer: float) -> void:
	var sp := get_node("Sprite2D") as Sprite2D
	var ap := get_node("AnimationPlayer") as AnimationPlayer
	var a := ap.get_animation("springen")
	var von := 1 << 30
	for k in a.track_get_key_count(0):
		von = mini(von, int(a.track_get_key_value(0, k)))
	_geste_nr += 1
	var nr := _geste_nr
	geste_laeuft = true
	ap.stop()
	var lage_vorher := sp.position
	var bezug := _bild_lage(von)
	var zeige := func(n: int):
		var l := _bild_lage(von + n)
		var dx := (l.x - bezug.x) * (-1.0 if not sp.flip_h else 1.0)
		sp.frame = von + n
		sp.position = lage_vorher + Vector2(dx, l.y - bezug.y)
	var start := position
	var spitze := minf(start.y, ziel.y) - bogen
	var t := create_tween()
	t.tween_callback(zeige.bind(1))      # ducken
	t.tween_interval(0.12)
	t.tween_callback(zeige.bind(3))      # abstoßen
	t.tween_interval(0.08)
	t.tween_callback(zeige.bind(4))
	t.tween_method(func(k: float):
		if k > 0.45 and sp.frame == von + 4:
			zeige.call(5)
		var x := lerpf(start.x, ziel.x, k)
		var y := (1 - k) * (1 - k) * start.y + 2 * (1 - k) * k * (2 * spitze - (start.y + ziel.y) / 2.0) + k * k * ziel.y
		position = Vector2(x, y)
		sync_buffered_position(), 0.0, 1.0, dauer)
	t.tween_callback(zeige.bind(6))      # Landung
	t.tween_interval(0.1)
	t.tween_callback(zeige.bind(0))
	t.tween_interval(0.06)
	await t.finished
	sp.position = lage_vorher
	if nr == _geste_nr:
		geste_laeuft = false
		_zur_ruhe()

#endregion
