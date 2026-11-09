@tool
extends RefCounted
## Baut Popochiu-Objekte aus den Bauplänen (res://daten/raeume/<abschnitt>.json).
##
## Regeln (siehe game/README.md, „Generiert und handgeschrieben“):
## - Ein Objekt (Raum, Figur, Gegenstand, Dialog, Hotspot, Prop, Marker, Laufbereich) wird nur
##   angelegt, wenn es fehlt. Bestehende Szenen und Skripte werden nie verändert, denn Umrisse,
##   Positionen und Rätsellogik gehören ab dem ersten Anlegen Godot und dem Rätselcode.
## - Angelegt wird mit Popochius Factories (dieselben Dateien wie über das Popochiu-Dock).
##   Danach bekommt das neue Skript eine Couch-Quest-Basisklasse (CQRaum, CQHotspot …), die
##   Ansehen-Zeilen, Nehmen und Gespräche aus dem Bauplan liest.
## - Objekte, die in Popochiu stehen, aber in keinem Bauplan, werden nur gemeldet.

const BAUPLAENE := "res://daten/raeume/"
const START_RAUM := "Wohnzimmer"
const SPIELER := "Max"
const GUI_VORLAGE := "SimpleClick"
const PopochiuGuiTemplatesHelper := preload(
	"res://addons/popochiu/editor/helpers/popochiu_gui_templates_helper.gd"
)
const INPUT_ACTIONS := preload("res://addons/popochiu/engine/others/input_actions.gd")

## Eigene Autoloads in dieser Reihenfolge, nach den Popochiu-Autoloads.
const AUTOLOADS := [
	["Bauplan", "res://skripte/bauplan.gd"],
	["Zustand", "res://skripte/zustand.gd"],
	["Spielstand", "res://skripte/spielstand.gd"],
	["Hinweise", "res://skripte/hinweise.gd"],
	["Spiel", "res://skripte/spiel.gd"],
]
## Eigene Eingaben (05-spielsysteme.md, Steuerung).
const EINGABEN := [
	["cq_figur_wechseln", KEY_TAB],
	["cq_schnellspeichern", KEY_F5],
	["cq_schnellladen", KEY_F9],
	["cq_hotspots_zeigen", KEY_SHIFT],
	["cq_text_weiter", KEY_SPACE],
	["cq_text_weiter", KEY_ENTER],
	["cq_notizbuch", KEY_N],
]

var fehler := 0
var _angelegt: Array[String] = []


func bauen() -> int:
	await _grundeinrichtung()

	var gesehen := {"rooms": [], "characters": [], "inventory_items": [], "dialogs": []}
	for datei in DirAccess.get_files_at(BAUPLAENE):
		if not datei.ends_with(".json"):
			continue
		var plan: Dictionary = JSON.parse_string(FileAccess.get_file_as_string(BAUPLAENE + datei))
		print("[CQ-Bau] Bauplan %s" % datei)
		for g in plan.gegenstaende:
			_gegenstand(g)
			gesehen.inventory_items.append(g.script_name)
		for f in plan.figuren:
			_figur(f)
			gesehen.characters.append(f.script_name)
		for d in plan.dialoge:
			_dialog(d)
			gesehen.dialogs.append(d.script_name)
		for r in plan.raeume:
			_raum(r)
			gesehen.rooms.append(r.script_name)

	# Pixel-Feld: Pixel als Gegenstand in Max' Inventarleiste (05-spielsysteme.md, UI). Steht in
	# keiner Welt-Tabelle, weil es kein Fundstück ist; das Spiel legt es ab P1 selbst hinein.
	_gegenstand({
		script_name = "PixelFeld", id = "pixel_feld", name_key = "UI_OBJ_PIXEL_FELD",
		icon = "res://grafik/platzhalter/ui_pixel_feld.png",
	})
	gesehen.inventory_items.append("PixelFeld")

	for abschnitt in gesehen:
		for script_name in PopochiuResources.get_section_keys(abschnitt):
			if not script_name in gesehen[abschnitt]:
				print("[CQ-Bau] Hinweis: %s/%s steht in keinem Bauplan (bleibt unverändert)" % [
					abschnitt, script_name
				])

	PopochiuResources.update_autoloads(true)
	var err := ProjectSettings.save()
	if err != OK:
		_fehler("Projekteinstellungen nicht gespeichert (%d)" % err)
	print("[CQ-Bau] neu angelegt: %d Objekte" % _angelegt.size())
	for a in _angelegt:
		print("  + " + a)
	return fehler


#region Grundeinrichtung ###########################################################################
## Entspricht dem Popochiu-Einrichtungsassistenten (Retro, eigene Auflösung 320×180, GUI
## „Simple Click“) plus den Projekteinstellungen aus 03-produktion.md und 05-spielsysteme.md.
func _grundeinrichtung() -> void:
	# Pixel-Einstellungen (03-produktion.md, System 1): 320×180, Stretch „viewport“,
	# ganzzahlig, Nearest.
	ProjectSettings.set_setting("display/window/size/viewport_width", 320)
	ProjectSettings.set_setting("display/window/size/viewport_height", 180)
	ProjectSettings.set_setting("display/window/size/window_width_override", 1280)
	ProjectSettings.set_setting("display/window/size/window_height_override", 720)
	ProjectSettings.set_setting("display/window/stretch/mode", "viewport")
	ProjectSettings.set_setting("display/window/stretch/aspect", "keep")
	ProjectSettings.set_setting("display/window/stretch/scale_mode", "integer")
	ProjectSettings.set_setting("rendering/textures/canvas_textures/default_texture_filter", 0)
	PopochiuConfig.set_pixel_art_textures(true)

	# Übersetzung (05-spielsysteme.md, Dialog-Skript): texte.csv → de/en
	ProjectSettings.set_setting("internationalization/locale/translations", PackedStringArray([
		"res://lokalisierung/texte.de.translation", "res://lokalisierung/texte.en.translation"
	]))
	ProjectSettings.set_setting("internationalization/locale/fallback", "de")

	# Eingaben: Popochius drei Aktionen (wie beim Aktivieren des Plugins) und die eigenen
	for d in INPUT_ACTIONS.ACTIONS:
		var event: InputEvent
		if d.has("button"):
			event = InputEventMouseButton.new()
			event.button_index = d.button
		else:
			event = InputEventKey.new()
			event.keycode = d.key
		_eingabe("input/" + d.name, [event])
	var eigene := {}
	for e in EINGABEN:
		var ev := InputEventKey.new()
		ev.keycode = e[1]
		eigene.get_or_add(e[0], []).append(ev)
	for name in eigene:
		_eingabe("input/" + name, eigene[name])

	# Eigene Autoloads
	for a in AUTOLOADS:
		if not ProjectSettings.has_setting("autoload/" + a[0]):
			ProjectSettings.set_setting("autoload/" + a[0], "*" + a[1])

	# Popochiu-Einrichtung (Assistent): GUI-Vorlage kopieren
	if not PopochiuResources.is_setup_done() or not PopochiuResources.is_gui_set():
		print("[CQ-Bau] Popochiu-Einrichtung: GUI-Vorlage %s" % GUI_VORLAGE)
		PopochiuResources.set_data_value("setup", "done", true)
		await PopochiuGuiTemplatesHelper.copy_gui_template(
			GUI_VORLAGE,
			func(wert: int, text: String): print("  GUI %3d %% %s" % [wert, text]),
			func(): pass
		)
		PopochiuResources.set_data_value("ui", "template", GUI_VORLAGE)
	ProjectSettings.save()


func _eingabe(setting: String, events: Array) -> void:
	if ProjectSettings.has_setting(setting):
		return
	ProjectSettings.set_setting(setting, {deadzone = 0.5, events = events})


#endregion

#region Hauptobjekte ###############################################################################
func _gegenstand(g: Dictionary) -> void:
	var sn: String = g.script_name
	if PopochiuResources.has_data_value("inventory_items", sn):
		return
	var f := PopochiuInventoryItemFactory.new()
	if f.create(sn) != ResultCodes.SUCCESS:
		return _fehler("Gegenstand %s nicht angelegt" % sn)
	var pfad := f.get_scene_path()
	_skript_basis(pfad.replace(".tscn", ".gd"), "PopochiuInventoryItem", "CQGegenstand", [
		"# Gegenstand „%s“ (%s). Angelegt vom Godot-Bau; ab hier handgeschrieben." % [sn, g.id],
		"# Kombinieren und Benutzen: _on_item_used(item) und _on_click() überschreiben.",
	])
	var szene: Node = load(pfad).instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	szene.description = g.name_key
	szene.texture = load(g.icon)
	_szene_speichern(szene, pfad)
	_angelegt.append("Gegenstand " + sn)


func _figur(fd: Dictionary) -> void:
	var sn: String = fd.script_name
	if PopochiuResources.has_data_value("characters", sn):
		return
	var f := PopochiuCharacterFactory.new()
	if f.create(sn, sn == SPIELER) != ResultCodes.SUCCESS:
		return _fehler("Figur %s nicht angelegt" % sn)
	if sn == SPIELER:
		PopochiuResources.set_data_value("setup", "pc", sn)
	var pfad := f.get_scene_path()
	_skript_basis(pfad.replace(".tscn", ".gd"), "PopochiuCharacter", "CQFigur", [
		"# Figur „%s“ (%s). Angelegt vom Godot-Bau; ab hier handgeschrieben." % [sn, fd.id],
		"# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.",
	])
	var szene: Node = load(pfad).instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	var tex: Texture2D = load(fd.sprite)
	var sprite: Sprite2D = szene.get_node("Sprite2D")
	sprite.texture = tex
	sprite.offset = Vector2(0, -tex.get_height() / 2.0)
	sprite.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	var w := tex.get_width() / 2.0
	var h := float(tex.get_height())
	var poly := PackedVector2Array([Vector2(-w, -h), Vector2(w, -h), Vector2(w, 0), Vector2(-w, 0)])
	szene.interaction_polygon = poly
	szene.get_node("InteractionPolygon").polygon = poly
	szene.description = fd.name_key
	szene.text_color = Color(fd.textfarbe)
	szene.dialog_pos = Vector2(0, -h - 4)
	szene.walk_speed = 90.0
	_szene_speichern(szene, pfad)
	_angelegt.append("Figur " + sn)


func _dialog(d: Dictionary) -> void:
	var sn: String = d.script_name
	if PopochiuResources.has_data_value("dialogs", sn):
		return
	var f := PopochiuDialogFactory.new()
	if f.create(sn) != ResultCodes.SUCCESS:
		return _fehler("Dialog %s nicht angelegt" % sn)
	var res: Resource = f.get_obj_resource()
	_skript_basis(res.resource_path.replace(".tres", ".gd"), "PopochiuDialog", "CQDialog", [
		"# Gespräch „%s“. Angelegt vom Godot-Bau; ab hier handgeschrieben." % sn,
		"# Optionen und Antworten kommen aus dem Bauplan (Abschnitt „Gespräche“ im Skript).",
		"# Sonderfälle (Hinweisstufen, Bedingungen ohne Rätsel) hier überschreiben.",
	])
	_angelegt.append("Dialog " + sn)


#endregion

#region Räume ######################################################################################
func _raum(r: Dictionary) -> void:
	var sn: String = r.script_name
	var snake := sn.to_snake_case()
	var pfad := "res://game/rooms/%s/room_%s.tscn" % [snake, snake]
	if not PopochiuResources.has_data_value("rooms", sn):
		var f := PopochiuRoomFactory.new()
		if f.create(sn, sn == START_RAUM) != ResultCodes.SUCCESS:
			return _fehler("Raum %s nicht angelegt" % sn)
		_raum_skript(pfad.replace(".tscn", ".gd"), sn, r.id)
		_angelegt.append("Raum " + sn)
	if sn == START_RAUM:
		ProjectSettings.set_setting(PopochiuResources.MAIN_SCENE, pfad)

	var raum: PopochiuRoom = load(pfad).instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	var vorher := _angelegt.size()
	raum.width = r.groesse[0]
	raum.height = r.groesse[1]

	# Hintergrund: Prop „Background“ (Popochiu-Konvention: z_index -1, Baseline oben)
	if not raum.get_node("Props").has_node("Background"):
		var p := PopochiuPropFactory.PopochiuPropFactoryParam.new()
		var bg: PopochiuProp = _raum_objekt(PopochiuPropFactory.new(), p, raum, "Background", "Props")
		if bg:
			bg.texture = load(r.hintergrund)
			bg.position = Vector2(r.groesse[0], r.groesse[1]) / 2.0
			bg.clickable = false
			bg.description = r.name_key

	# Laufbereich
	if raum.get_node("WalkableAreas").get_child_count() == 0:
		var p := PopochiuWalkableAreaFactory.PopochiuWalkableAreaFactoryParam.new()
		var wa: PopochiuWalkableArea = _raum_objekt(
			PopochiuWalkableAreaFactory.new(), p, raum, "Boden", "WalkableAreas"
		)
		if wa:
			wa.position = Vector2.ZERO
			var umriss := _punkte(r.laufbereich)
			var nav := NavigationPolygon.new()
			nav.agent_radius = 0.0
			nav.add_outline(umriss)
			NavigationServer2D.bake_from_source_geometry_data(nav, NavigationMeshSourceGeometryData2D.new())
			wa.get_node("Perimeter").navigation_polygon = nav
			var umrisse: Array[PackedVector2Array] = [umriss]
			wa.interaction_polygon = umrisse
			# Popochiu liest den Laufbereich unbesuchter Räume aus der eigenen Szene des
			# Laufbereichs (PopochiuRoomData.save_children_states), nicht aus der Raumszene:
			# ohne das bleibt der Raum nach einem Raumwechsel ohne Wege.
			var eigene: Node = load(wa.scene_file_path).instantiate()
			eigene.interaction_polygon = umrisse.duplicate()
			eigene.get_node("Perimeter").navigation_polygon = nav.duplicate()
			PopochiuEditorHelper.pack_scene(eigene, wa.scene_file_path)
			eigene.free()

	# Marker
	for m in r.marker:
		var name := (m as String).to_pascal_case()
		if raum.get_node("Markers").has_node(name):
			continue
		var p := PopochiuRoomObjFactory.PopochiuRoomObjFactoryParam.new()
		var mk: Marker2D = _raum_objekt(PopochiuMarkerFactory.new(), p, raum, name, "Markers")
		if mk:
			mk.position = Vector2(r.marker[m][0], r.marker[m][1])

	# Hotspots und Ausgänge
	for h in r.hotspots:
		_hotspot(raum, h, "CQHotspot")
	for a in r.ausgaenge:
		_hotspot(raum, a, "CQAusgang")

	# Props
	for pd in r.props:
		if raum.get_node("Props").has_node(pd.script_name):
			continue
		_skript_vorlage(raum, "props", pd.script_name, "prop", "CQProp", pd.id)
		var p := PopochiuPropFactory.PopochiuPropFactoryParam.new()
		p.is_interactive = true
		p.should_create_script = false
		var rect := _rect(pd.rect)
		p.interaction_polygon = _rechteck_um_mitte(rect)
		var prop: PopochiuProp = _raum_objekt(PopochiuPropFactory.new(), p, raum, pd.script_name, "Props")
		if prop:
			var tex: Texture2D = load(pd.textur)
			prop.texture = tex
			if tex.get_width() > rect.size.x * 1.5:
				prop.frames = int(round(tex.get_width() / rect.size.x))
			prop.position = rect.get_center()
			prop.description = pd.name_key
			prop.walk_to_point = Vector2(pd.gehe[0], pd.gehe[1]) - rect.get_center()
			prop.baseline = int(rect.size.y / 2.0)

	# Figuren im Raum (wie „+ Add character to room“ im Dock)
	for fd in r.figuren:
		var knoten := "Character%s *" % fd.script_name
		var schon := false
		for c in raum.get_node("Characters").get_children():
			if c.name.begins_with("Character" + fd.script_name):
				schon = true
		if schon:
			continue
		var cpfad := "res://game/characters/%s/character_%s.tscn" % [
			(fd.script_name as String).to_snake_case(), (fd.script_name as String).to_snake_case()
		]
		var c: Node2D = (load(cpfad) as PackedScene).instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
		raum.get_node("Characters").add_child(c)
		c.owner = raum
		c.name = knoten
		c.position = Vector2(fd.pos[0], fd.pos[1])
		_angelegt.append("  Figur %s in %s" % [fd.script_name, sn])

	if _angelegt.size() != vorher:
		_szene_speichern(raum, pfad)
	raum.free()


func _hotspot(raum: PopochiuRoom, h: Dictionary, basis: String) -> void:
	if raum.get_node("Hotspots").has_node(h.script_name):
		return
	_skript_vorlage(raum, "hotspots", h.script_name, "hotspot", basis, h.id, h.get("ziel", ""))
	var p := PopochiuHotspotFactory.PopochiuHotspotFactoryParam.new()
	p.should_create_script = false
	var rect := _rect(h.rect)
	p.interaction_polygon = _rechteck_um_mitte(rect)
	var hs: PopochiuHotspot = _raum_objekt(PopochiuHotspotFactory.new(), p, raum, h.script_name, "Hotspots")
	if hs:
		hs.position = rect.get_center()
		hs.description = h.name_key
		hs.walk_to_point = Vector2(h.gehe[0], h.gehe[1]) - rect.get_center()
		hs.baseline = int(rect.size.y / 2.0)
		if basis == "CQAusgang":
			hs.cursor = PopochiuResources.CURSOR_TYPE.UP


## Legt ein Raum-Objekt mit seiner Factory an und hängt es (wie das Dock) in den Raum.
func _raum_objekt(f, p, raum: PopochiuRoom, name: String, gruppe: String) -> Node:
	p.room = raum
	p.obj_name = name
	p.should_add_to_room = false
	if f.create(p) != ResultCodes.SUCCESS:
		_fehler("%s/%s in %s nicht angelegt" % [gruppe, name, raum.script_name])
		return null
	var knoten: Node = f.get_obj_scene()
	raum.get_node(gruppe).add_child(knoten)
	knoten.owner = raum
	for kind in knoten.get_children():
		if kind.has_meta(PopochiuRoomObjFactory.CHILD_VISIBLE_IN_ROOM_META):
			kind.owner = raum
			kind.remove_meta(PopochiuRoomObjFactory.CHILD_VISIBLE_IN_ROOM_META)
	if f._register_for_translation:
		PopochiuConfig.add_to_pot_files(f._path_script)
	_angelegt.append("  %s %s in %s" % [gruppe, name, raum.script_name])
	return knoten


#endregion

#region Skripte ####################################################################################
## Raum-Skript: wie Popochius Vorlage (State-Ressource), aber mit Basisklasse CQRaum.
func _raum_skript(pfad: String, sn: String, raum_id: String) -> void:
	var basis := pfad.get_basename()
	var text := "\n".join([
		"@tool",
		"extends CQRaum",
		"# Raum „%s“ (%s). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben." % [
			sn, raum_id
		],
		"# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.",
		"# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.",
		"",
		"const Data := preload('%s_state.gd')" % basis.get_file(),
		"",
		"var state: Data = load(\"%s.tres\")" % basis,
		"",
	])
	_skript_schreiben(pfad, text)


## Basisklasse in ein frisch von der Factory erzeugtes Skript setzen (Rumpf der Vorlage
## entfällt, weil die Basisklasse die Popochiu-Methoden schon sinnvoll belegt).
func _skript_basis(pfad: String, popochiu_klasse: String, basis: String, kopf: Array) -> void:
	var alt: String = (load(pfad) as Script).source_code
	var state := ""
	for zeile in alt.split("\n"):
		if zeile.begins_with("const Data") or zeile.begins_with("var state"):
			state += zeile + "\n"
	var text := "@tool\nextends %s\n%s\n" % [basis, "\n".join(kopf)]
	if not state.is_empty():
		text += "\n" + state
	_skript_schreiben(pfad, text)


## Skript für Hotspots, Props und Ausgänge vor der Factory anlegen (should_create_script = false).
func _skript_vorlage(
	raum: PopochiuRoom, gruppe: String, sn: String, art: String, basis: String, id: String,
	ziel := ""
) -> void:
	var snake := sn.to_snake_case()
	var ordner := raum.scene_file_path.get_base_dir().path_join("%s/%s" % [gruppe, snake])
	DirAccess.make_dir_recursive_absolute(ordner)
	var pfad := ordner.path_join("%s_%s.gd" % [art, snake])
	if FileAccess.file_exists(pfad):
		return
	var zeilen := [
		"@tool",
		"extends %s" % basis,
		"# %s „%s“ (%s) im Raum %s. Angelegt vom Godot-Bau; ab hier handgeschrieben." % [
			art.capitalize(), sn, id, raum.script_name
		],
	]
	match basis:
		"CQAusgang":
			zeilen.append("# Führt nach: %s. Gehen und Raumwechsel macht CQAusgang." % ziel)
			zeilen.append("# Gesperrt? _darf_gehen() überschreiben.")
		_:
			zeilen.append("# Ansehen (Rechtsklick) kommt aus dem Bauplan res://daten/raeume/.")
			zeilen.append("# Rätsellogik: _on_click() und _on_item_used(item) überschreiben.")
	_skript_schreiben(pfad, "\n".join(zeilen) + "\n")


func _skript_schreiben(pfad: String, text: String) -> void:
	var s: Script
	if ResourceLoader.exists(pfad):
		s = load(pfad)
	else:
		s = GDScript.new()
	s.source_code = text
	if ResourceSaver.save(s, pfad) != OK:
		_fehler("Skript %s nicht gespeichert" % pfad)
		return


#endregion

#region Hilfen #####################################################################################
func _szene_speichern(knoten: Node, pfad: String) -> void:
	var ps := PackedScene.new()
	var err := ps.pack(knoten)
	if err == OK:
		err = ResourceSaver.save(ps, pfad)
	if err != OK:
		_fehler("Szene %s nicht gespeichert (%d)" % [pfad, err])


func _rect(a: Array) -> Rect2:
	return Rect2(a[0], a[1], a[2], a[3])


func _rechteck_um_mitte(r: Rect2) -> PackedVector2Array:
	var h := r.size / 2.0
	return PackedVector2Array([Vector2(-h.x, -h.y), Vector2(h.x, -h.y), h, Vector2(-h.x, h.y)])


func _punkte(a: Array) -> PackedVector2Array:
	var out := PackedVector2Array()
	for p in a:
		out.append(Vector2(p[0], p[1]))
	return out


func _fehler(text: String) -> void:
	fehler += 1
	push_error("[CQ-Bau] " + text)


#endregion
