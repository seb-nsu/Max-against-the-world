extends SceneTree
## Review GS (nicht committen): klickt in jedem Raum jedes sichtbare, klickbare Objekt an
## (Rechtsklick = Ansehen auf alles; Linksklick = Benutzen auf Hotspots und Props, nicht auf
## Ausgänge und Figuren) und protokolliert, welche Zeilen kamen. Testmodus: Zeilen werden nur
## protokolliert. Hängt eine Aktion länger als 4 s (Auswahl, Minispiel), wird das vermerkt.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_gs_klicks.gd -- AUSGABE welt [ende]

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_gs/"
var welt := "prolog"
var modus := "anfang"

const WELTEN := {
	"prolog": ["wohnzimmer", "treppenhaus", "dachboden"],
	"welt-1": ["dorfplatz", "taverne", "schmiede", "zauberstabladen", "klassenzimmer", "trollbruecke",
		"wasserschloss", "zauberwald", "luftschloss", "bergwerk", "turmkeller", "abstellkammer_1",
		"abstellkammern", "thronsaal"],
	"welt-2": ["nil_delta", "thronsaal_ramses", "palastkueche", "sphinx", "faehrsteg_olympia", "agora",
		"startbuero", "stadion", "hafen_syrakus", "werkstatt", "grabhuegel"],
}
var log_zeilen: Array = []
var fehler_zahl := 0


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		if a == "ende":
			modus = "ende"
		elif a in WELTEN:
			welt = a
		else:
			aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	var S = root.get_node("Spiel")
	var Z = root.get_node("Zustand")
	S.testmodus = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	if welt != "prolog":
		S.welt_beginnen(welt)
		await _warte_raum(WELTEN[welt][0])
	if modus == "ende":
		for r in _raetsel(welt):
			Z.loese(r)
	for rid in WELTEN[welt]:
		await _geh(rid)
		await _klicken(rid)
	var f := FileAccess.open(aus + "klicks_%s_%s.txt" % [welt, modus], FileAccess.WRITE)
	f.store_string("\n".join(log_zeilen))
	f.close()
	print("FERTIG")
	quit(0)


func _raetsel(w: String) -> Array:
	var ids := []
	var pfad := "res://daten/welten/%s.json" % w
	if not FileAccess.file_exists(pfad):
		return ids
	var d: Variant = JSON.parse_string(FileAccess.get_file_as_string(pfad))
	if typeof(d) == TYPE_DICTIONARY and d.has("raetsel"):
		var r = d.raetsel
		if typeof(r) == TYPE_DICTIONARY:
			ids = r.keys()
		else:
			for e in r:
				ids.append(e.id)
	return ids


var _fertig := false


func _aktion(obj: Object, art: String) -> Array:
	var S = root.get_node("Spiel")
	S.protokoll.clear()
	_fertig = false
	_ausfuehren(obj, art)
	var ok := await _warte_bis(func(): return _fertig, 4.0)
	var zeilen: Array = S.protokoll.duplicate()
	if not ok:
		zeilen.append("<HAENGT>")
	return zeilen


func _ausfuehren(obj: Object, art: String) -> void:
	if art == "ansehen":
		await obj.on_right_click()
	else:
		await obj.on_click()
	_fertig = true


func _klicken(rid: String) -> void:
	var raum = root.get_node("R").current
	var ausg: Array = []
	for a in raum.bauplan().get("ausgaenge", []):
		ausg.append(a.script_name)
	var objekte: Array = []
	for h in raum.get_hotspots():
		objekte.append(["H", h])
	for p in raum.get_props():
		if p.name != "Background":
			objekte.append(["P", p])
	for c in raum.get_characters():
		if c != root.get_node("C").player:
			objekte.append(["F", c])
	var namen: Array = objekte.map(func(e): return [e[0], str(e[1].script_name)])
	for e in namen:
		raum = root.get_node("R").current
		var obj = _finde(raum, e[0], e[1])
		if not is_instance_valid(obj) or not obj.visible or not obj.get("clickable"):
			continue
		var art: String = e[0]
		if art != "F" and obj.script_name in ausg:
			art = "A"
		var z1 := await _aktion(obj, "ansehen")
		var z2: Array = []
		var nehmen: bool = art == "P" and obj.has_method("bauplan") and obj.bauplan().get("nehmen")
		if art in ["H", "P"] and not nehmen:
			z2 = await _aktion(obj, "benutzen")
		var zeile := "%s\t%s\t%s\tANSEHEN=%s\tBENUTZEN=%s" % [rid, art, obj.script_name, ",".join(z1), ",".join(z2) if not z2.is_empty() else ("(nehmen)" if nehmen else ("-" if art in ["H", "P"] else ""))]
		log_zeilen.append(zeile)
		print(zeile)
		if root.get_node("R").current != raum:
			log_zeilen.append("%s\t!!\tRaumwechsel nach %s" % [rid, obj.script_name])
			await _geh(rid)
			raum = root.get_node("R").current


func _finde(raum, art: String, sn: String):
	var liste: Array = raum.get_hotspots() if art == "H" else (raum.get_props() if art == "P" else raum.get_characters())
	for o in liste:
		if str(o.script_name) == sn:
			return o
	return null


func _geh(rid: String) -> void:
	root.get_node("Spiel").herkunft_raum = ""
	root.get_node("R").goto_room(root.get_node("Bauplan").raum_script_name(rid))
	await _warte_raum(rid)


func _warte_raum(rid: String) -> void:
	await _warte_bis(func():
		var r = root.get_node("R").current
		return r != null and r.has_method("raum_id") and r.raum_id() == rid and root.get_node("E").in_room and r.is_current, 15.0)
	await _warte_bis(func(): return root.get_node("Spiel").in_szene == 0, 30.0)
	for i in 10:
		await process_frame


func _warte_bis(bed: Callable, max_s: float) -> bool:
	var ende := Time.get_ticks_msec() + int(max_s * 1000)
	while not bed.call():
		if Time.get_ticks_msec() > ende:
			return false
		await process_frame
	return true
