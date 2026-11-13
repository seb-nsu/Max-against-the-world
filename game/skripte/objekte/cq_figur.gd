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


func say(dialog: String, params: Variant = null) -> void:
	_satz_nr += 1
	if not Engine.is_editor_hint() and is_inside_tree() and not PopochiuUtils.e.cutscene_skipped:
		_mund_schliessen(_satz_nr, redezeit(PopochiuUtils.e.translate(dialog, params)))
	await super(dialog, params)


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


## Echte Grafik statt Platzhalter: gibt es res://grafik/figuren/<id>.png samt
## res://daten/figuren/<id>.json (beides aus tools/figur.py paket), wird das Sprite-Sheet gesetzt und
## je Bewegung (idle, walk, talk …) eine Animation angelegt. Die Bilder schauen nach rechts; nach
## links spiegelt Popochiu. Der Fußpunkt liegt unten in der Bildmitte.
## variante: anderes Bild derselben Figur (etwa „pixel_ziege“ für Pixel im Ziegenfell).
var grafik_variante := ""


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
	sprite.hframes = gesamt
	sprite.vframes = 1
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
		for i in int(a.bilder):
			anim.track_insert_key(spur, i * dauer, int(a.von) + i)
		anim.length = int(a.bilder) * dauer
		anim.loop_mode = Animation.LOOP_LINEAR if a.get("schleife", true) else Animation.LOOP_NONE
		lib.add_animation(name, anim)
	var player: AnimationPlayer = get_node("AnimationPlayer")
	if player.has_animation_library(""):
		player.remove_animation_library("")
	player.add_animation_library("", lib)
	grafik_variante = variante
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
