class_name CQSaveLoad
extends PopochiuSaveLoad
## Popochius Speichern und Laden mit den Couch-Quest-Spielstandplätzen (05-spielsysteme.md,
## Speichern). Ersetzt beim Start Popochius eigenes Objekt (E._saveload), damit E.save_game()
## und E.load_game() samt aller Popochiu-Signale weiter funktionieren, die Daten aber in
## user://saves/<platz>.json mit Versionsnummer und Kopfdaten landen.
##
## Was Popochiu selbst speichert und hier unverändert übernommen wird: aktueller Raum, aktive
## Figur und ihre Position, Inventar je Figur (mit Reihenfolge), Zustände von Räumen, Figuren,
## Gegenständen und Dialogen (gewählte Optionen), dazu Globals (dort hängt Zustand.speichern()).
##
## Platznummern (int, wie Popochiu sie erwartet): 1–12 manuell, 13 Schnellspeicher,
## 14–16 Autospeicher.

## Ordner der Spielstände (Tests nutzen einen eigenen, siehe tests/prolog_durchlauf.gd)
static var ordner := "user://saves/"
const VERSION := 1
const SCHNELL := 13
const AUTO := [14, 15, 16]
const MANUELL_ANZAHL := 12


static func platz_name(slot: int) -> String:
	if slot == SCHNELL:
		return "schnell"
	if slot in AUTO:
		return "auto_%d" % (AUTO.find(slot) + 1)
	return "manuell_%02d" % slot


static func platz_pfad(slot: int) -> String:
	return ordner + platz_name(slot) + ".json"


func count_saves() -> int:
	var n := 0
	for slot in range(1, MANUELL_ANZAHL + 1):
		if FileAccess.file_exists(platz_pfad(slot)):
			n += 1
	return n


## Für Popochius Speichern/Laden-Fenster: nur die manuellen Plätze.
func get_saves_descriptions() -> Dictionary:
	var out := {}
	for slot in range(1, MANUELL_ANZAHL + 1):
		var kopf := kopf_lesen(slot)
		if not kopf.is_empty():
			out[slot] = kopf.get("beschreibung", "")
	return out


func save_game(slot := 1, description := "") -> bool:
	DirAccess.make_dir_recursive_absolute(ordner)
	var datei := {
		version = VERSION,
		platz = platz_name(slot),
		beschreibung = description,
		datum = Time.get_datetime_string_from_system(false, true),
		zeitstempel = Time.get_unix_time_from_system(),
		spielzeit = _zustand().spielzeit,
		abschnitt = _zustand().abschnitt,
		raum = PopochiuUtils.r.current.script_name if PopochiuUtils.r.current else "",
		popochiu = daten_sammeln(description),
	}
	var f := FileAccess.open(platz_pfad(slot), FileAccess.WRITE)
	if not f:
		PopochiuUtils.print_error("Spielstand %s nicht schreibbar" % platz_pfad(slot))
		return false
	f.store_string(JSON.stringify(datei, "\t"))
	f.close()
	return true


# Über den Baum statt über den Autoload-Namen, damit die Klasse auch vor den Autoloads
# kompiliert (Tests mit godot -s).
static func _zustand() -> Node:
	return (Engine.get_main_loop() as SceneTree).root.get_node("Zustand")


func load_game(slot := 1) -> Dictionary:
	var datei := datei_lesen(slot)
	if datei.is_empty():
		return {}
	return daten_anwenden(datei.popochiu)


func kopf_lesen(slot: int) -> Dictionary:
	var datei := datei_lesen(slot)
	datei.erase("popochiu")
	return datei


func datei_lesen(slot: int) -> Dictionary:
	if not FileAccess.file_exists(platz_pfad(slot)):
		return {}
	var d = JSON.parse_string(FileAccess.get_file_as_string(platz_pfad(slot)))
	if not d is Dictionary or not d.has("popochiu"):
		PopochiuUtils.print_error("Spielstand %s ist beschädigt" % platz_pfad(slot))
		return {}
	return umwandeln(d)


## Alte Spielstände auf die aktuelle Version heben (05-spielsysteme.md: „übersetzt eine kleine
## Umwandlung alte Spielstände“). Jede neue Version bekommt hier einen Schritt.
static func umwandeln(d: Dictionary) -> Dictionary:
	var v := int(d.get("version", 0))
	if v > VERSION:
		push_warning("Spielstand aus neuerer Spielversion (%d > %d)" % [v, VERSION])
	# if v < 2: d = _von_1_auf_2(d)
	d.version = VERSION
	return d


## Dieselben Daten wie PopochiuSaveLoad.save_game(), nur als Dictionary statt Datei.
func daten_sammeln(description := "") -> Dictionary:
	var data := {
		description = description,
		player = {
			room = PopochiuUtils.r.current.script_name,
			inventory = _build_legacy_inventory_save_data(),
		},
		rooms = {},
		characters = {},
		inventory_items = {},
		dialogs = {},
		globals = {},
	}
	if PopochiuUtils.c.player:
		data.player.id = PopochiuUtils.c.player.script_name
		data.player.position = {
			x = PopochiuUtils.c.player.global_position.x,
			y = PopochiuUtils.c.player.global_position.y
		}
	for type in ["rooms", "characters", "inventory_items", "dialogs"]:
		_store_data(type, data)
	data["character_inventories"] = _build_character_inventories_save_data()
	for prop in PopochiuUtils.globals.get_script().get_script_property_list():
		if not prop.type in PopochiuResources.VALID_TYPES:
			continue
		if prop.usage == PROPERTY_USAGE_SCRIPT_VARIABLE or prop.usage == (
			PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE
		):
			data.globals[prop.name] = PopochiuUtils.globals[prop.name]
	if PopochiuUtils.globals.has_method("on_save"):
		data.globals.custom_data = PopochiuUtils.globals.on_save()
	if data.globals.is_empty():
		data.erase("globals")
	# Einmal durch JSON schicken, damit Speichern und Laden dieselben Typen sehen.
	return JSON.parse_string(JSON.stringify(json_fest(data)))


## Dieselbe Wiederherstellung wie PopochiuSaveLoad.load_game(), aus einem Dictionary.
func daten_anwenden(loaded_data: Dictionary) -> Dictionary:
	loaded_data = aus_json(loaded_data)
	var player_data = loaded_data.get("player", {})
	PopochiuUtils.i.is_restoring = true
	var character_inventories = loaded_data.get("character_inventories", {})
	if character_inventories is Dictionary and not character_inventories.is_empty():
		for character_name: String in character_inventories:
			for entry in character_inventories[character_name]:
				_restore_inventory_entry(_ganzzahlig(entry), character_name)
	elif player_data is Dictionary:
		for entry in player_data.get("inventory", []):
			_restore_inventory_entry(_ganzzahlig(entry))
	PopochiuUtils.i.is_restoring = false

	for type in ["rooms", "characters", "inventory_items", "dialogs"]:
		if loaded_data.has(type):
			_load_state(type, loaded_data)

	if loaded_data.has("globals"):
		for prop in loaded_data.globals:
			if typeof(PopochiuUtils.globals.get(prop)) == TYPE_NIL:
				continue
			PopochiuUtils.globals[prop] = loaded_data.globals[prop]
		if loaded_data.globals.has("custom_data") and PopochiuUtils.globals.has_method("on_load"):
			PopochiuUtils.globals.on_load(loaded_data.globals.custom_data)
	return loaded_data


## Vektoren überleben JSON nicht (Popochiu speichert z. B. die Polygone der Laufbereiche als
## Array[PackedVector2Array]); sie werden als {"__v2": [x, y]} bzw. {"__v2a": [[x, y], …]} abgelegt.
static func json_fest(v: Variant) -> Variant:
	if v is Vector2:
		return {__v2 = [v.x, v.y]}
	if v is PackedVector2Array:
		return {__v2a = Array(v).map(func(p): return [p.x, p.y])}
	if v is Dictionary:
		var out := {}
		for k in v:
			out[k] = json_fest(v[k])
		return out
	if v is Array:
		return v.map(json_fest)
	return v


static func aus_json(v: Variant) -> Variant:
	if v is Dictionary:
		if v.size() == 1 and v.has("__v2"):
			return Vector2(v.__v2[0], v.__v2[1])
		if v.size() == 1 and v.has("__v2a"):
			return PackedVector2Array(v.__v2a.map(func(p): return Vector2(p[0], p[1])))
		var out := {}
		for k in v:
			out[k] = aus_json(v[k])
		return out
	if v is Array:
		return v.map(aus_json)
	return v


# JSON liefert Zahlen als float; Popochiu verlangt für Mengen int.
func _ganzzahlig(entry):
	if entry is Dictionary and entry.has("qty"):
		entry = entry.duplicate()
		entry.qty = int(entry.qty)
	return entry
