extends SceneTree
## Review-Aufnahme Technical Art (nicht für CI, nicht committen): spielt wichtige Animationen im
## echten Raum ab und nimmt Bildfolgen auf (alle ~0,1 s, 640×360). Zeiten je Bild in <name>.json.
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_ta_anim.gd -- AUSGABE

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_ta/"
var S
var C


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	S = root.get_node("Spiel")
	C = root.get_node("C")
	S.testmodus = true
	root.get_node("E").settings.auto_continue_text = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	for sn in ["Notizbuch", "Thunfischdose", "Kochloeffel"]:
		await S.geben(sn)

	# ---------------- Prolog ----------------
	await _geh("dachboden")
	var mx = C.get_character("Max")
	var opa = C.get_character("Opa")
	await _echt(func(): mx.walk_to(mx.position + Vector2(-260, 0)), "p_dach_max_gehen_links", 2.6)
	await _echt(func(): mx.walk_to(mx.position + Vector2(200, 0)), "p_dach_max_gehen_rechts", 2.2)
	if opa:
		await _echt(func(): S.sagen("OPA", "P0_DACH_OPA_0030"), "p_dach_opa_erklaeren_rede", 3.5)
		await _echt(func(): opa.walk_to(opa.position + Vector2(-150, 10)), "p_dach_opa_gehen", 3.5)
		await _echt(func(): opa.geste("kopf_kratzen"), "p_dach_opa_kopf_kratzen", 2.0)
		await _echt(func(): S.sagen("OPA", "P0_DACH_OPA_0690"), "p_dach_opa_panik_rede", 3.0)
	await _echt(func(): S.sagen("MAX", "P0_DACH_MAX_0480"), "p_dach_max_benutzen_rede", 3.0)
	# Abbruch: Geste läuft, dann Klick auf den Boden
	await _echt(func(): _abbruch(mx, "benutzen", mx.position + Vector2(-160, 0), 0.45), "p_dach_max_benutzen_abbruch", 2.6)

	# ---------------- Welt 1 ----------------
	S.welt_beginnen("welt-1")
	await _warte_raum("dorfplatz")
	mx = C.get_character("Max")
	await _echt(func(): mx.walk_to(Vector2(mx.position.x + 40, 250)), "w1_dorf_max_nach_hinten", 3.0)
	await _echt(func(): mx.walk_to(Vector2(mx.position.x - 20, 345)), "w1_dorf_max_nach_vorn", 3.0)
	await _echt(func(): mx.walk_to(mx.position + Vector2(300, 0)), "w1_dorf_max_seitlich", 3.0)
	await _echt(func(): mx.geste("aufheben"), "w1_dorf_max_aufheben", 1.6)
	await _echt(func(): mx.geste("bohne"), "w1_dorf_max_bohne", 2.3)
	var toadi = C.get_character("Toadi")
	if toadi:
		await _echt(func(): toadi.laufen_zu(toadi.position + Vector2(-220, 20), 180.0), "w1_dorf_toadi_rennt", 1.8)
		await _echt(func(): toadi.geste_halten("keuchen", 2.0), "w1_dorf_toadi_keuchen", 2.4)
		await _echt(func(): toadi.geste("auf_max_zeigen"), "w1_dorf_toadi_zeigen", 1.3)

	await _geh("taverne")
	var gollo = C.get_character("Gollo")
	var humbert = C.get_character("Humbert")
	if gollo:
		await _echt(func(): gollo.geste("ring_werfen"), "w1_tav_gollo_ring_werfen", 1.6)
		await _echt(func(): S.sagen("GOL", "W1_TAV_GOL_1210"), "w1_tav_gollo_rede", 3.0)
	if humbert:
		await _echt(func(): humbert.geste("keller"), "w1_tav_humbert_keller", 2.2)
	await _geh("schmiede")
	var schmied = C.get_character("Schmied")
	if schmied:
		await _echt(func():
			schmied.idle_animation = "haemmern"
			schmied._play_idle(), "w1_schm_schmied_haemmern", 3.0)
		await _echt(func(): schmied.geste("schweiss_abwischen"), "w1_schm_schmied_schweiss", 2.6)
		await _echt(func(): S.sagen("SCH", "W1_SCHM_SCH_0710"), "w1_schm_schmied_rede_waehrend_haemmern", 3.0)
	var ziege = C.get_character("SchmiedeZiege")
	if ziege:
		await _echt(func(): ziege.geste("drehen"), "w1_schm_ziege_drehen", 2.6)
	mx = C.get_character("Max")
	await _echt(func(): mx.geste("melken"), "w1_schm_max_melken_ungenutzt", 1.5)
	await _geh("klassenzimmer")
	var r = root.get_node("R").current
	if r.has_method("_uebungsbesen_fliegt"):
		await _echt(func(): r._uebungsbesen_fliegt(), "w1_klass_uebungsbesen", 4.0)
	var alwin = C.get_character("Alwin")
	if alwin:
		await _echt(func():
			alwin.idle_animation = "ruehren"
			alwin._play_idle(), "w1_klass_alwin_ruehren", 2.4)
	await _geh("trollbruecke")
	var wal = C.get_character("Waldemar")
	if wal:
		await _echt(func(): wal.geste("regelbuch"), "w1_brue_waldemar_regelbuch", 2.0)
		await _echt(func(): wal.geste_halten("fussbad", 2.0), "w1_brue_waldemar_fussbad", 2.4)
		await _echt(func(): wal.geste_halten("musical", 2.2), "w1_brue_waldemar_musical", 2.6)
	await _geh("turmkeller")
	await _echt(func(): pass, "w1_turm_besen_patrouille", 4.0)
	await _geh("abstellkammern")
	var smaugi = C.get_character("Smaugi")
	if smaugi:
		await _echt(func(): smaugi.geste("kram_hergeben"), "w1_abst_smaugi_kram", 3.0)
	await _geh("thronsaal")
	var mod = C.get_character("Moderwort")
	if mod:
		await _echt(func(): mod.geste("niesen"), "w1_thro_moderwort_niesen", 2.8)
		await _echt(func(): mod.geste("zaubern"), "w1_thro_moderwort_zaubern", 2.8)
	await _geh("bergwerk")
	var grimm = C.get_character("Grimmzahn")
	if grimm:
		await _echt(func():
			grimm.idle_animation = "protest"
			grimm._play_idle(), "w1_berg_grimmzahn_protest", 2.4)
		await _echt(func(): S.sagen("GRI", "W1_BERG_GRI_0010"), "w1_berg_grimmzahn_rede", 3.0)

	# ---------------- Welt 2 ----------------
	S.welt_beginnen("welt-2")
	await _warte_raum("nil_delta")
	mx = C.get_character("Max")
	var W = S.regeln()
	await _echt(func(): mx.walk_to(mx.position + Vector2(280, 0)), "w2_nil_max_gehen", 2.6)
	await _echt(func(): mx.walk_to(Vector2(mx.position.x + 60, 262)), "w2_nil_max_nach_hinten", 2.4)
	var raum = root.get_node("R").current
	if raum.has_marker("Hermes"):
		var ziel: Vector2 = raum.get_marker_position("Hermes")
		S.figur_hier("Hermes", true, ziel)
		await _echt(func(): W._figur_laeuft("Hermes", Vector2(ziel.x + 380, ziel.y), ziel, 160.0, "joggen"), "w2_nil_hermes_joggen", 3.0)
	var stm = C.get_character("Steinmetz")
	if stm:
		await _echt(func():
			stm.idle_animation = "meisseln"
			stm._play_idle(), "w2_nil_steinmetz_meisseln", 2.0)
	var fae = C.get_character("Faehrmann")
	if fae:
		await _echt(func(): fae.geste("staken"), "w2_nil_faehrmann_staken", 3.0)

	await _geh("thronsaal_ramses")
	var ram = C.get_character("Ramses")
	if ram:
		await _echt(func(): ram.geste("unentschlossen"), "w2_thro_ramses_unentschlossen", 5.4)
		await _echt(func(): S.sagen("RAM", "W2_THRO_RAM_0020"), "w2_thro_ramses_rede", 3.0)
	var schr = C.get_character("Schreiber")
	if schr:
		await _echt(func(): schr.geste("schreiben"), "w2_thro_schreiber_schreiben", 3.2)
	var wed = C.get_character("Faecherwedler")
	if wed:
		await _echt(func():
			wed.idle_animation = "faecheln"
			wed._play_idle(), "w2_thro_faecherwedler_faecheln", 2.4)
	var kater = C.get_character("Hofkater")
	if kater:
		await _echt(func(): kater.geste("abziehen"), "w2_thro_hofkater_abziehen", 2.0)
		await _echt(func(): kater.laufen_zu(kater.position + Vector2(-200, 0), 55.0), "w2_thro_hofkater_weggehen", 3.6)

	await _geh("palastkueche")
	var neb = C.get_character("Nebet")
	if neb:
		await _echt(func():
			neb.idle_animation = "ruehren"
			neb._play_idle(), "w2_kueche_nebet_ruehren", 2.0)
		await _echt(func(): neb.geste("teig_kneten"), "w2_kueche_nebet_teig", 4.2)
	await _geh("agora")
	mx = C.get_character("Max")
	await _echt(func(): mx.walk_to(mx.position + Vector2(-300, 0)), "w2_agora_max_gehen", 2.8)
	var cic = C.get_character("Cicero")
	if cic:
		await _echt(func(): cic.geste("rede"), "w2_agora_cicero_rede", 5.4)
	var phi = C.get_character("Philosoph")
	if phi:
		await _echt(func(): phi.geste("schimpfen"), "w2_agora_philosoph_schimpfen", 3.8)
	var bri = C.get_character("Brian")
	if bri:
		await _echt(func(): bri.geste("abwehren"), "w2_agora_brian_abwehren", 5.3)
	await _echt(func(): mx.geste("zeigen"), "w2_agora_max_zeigen", 1.9)
	await _echt(func(): _abbruch(mx, "zeigen", mx.position + Vector2(150, 0), 0.6), "w2_agora_max_zeigen_abbruch", 2.4)
	await _geh("startbuero")
	var be2 = C.get_character("Beamter2")
	if be2:
		await _echt(func(): be2.geste("stempeln"), "w2_buer_beamter2_stempeln", 4.6)
	var be1 = C.get_character("Beamter1")
	if be1:
		await _echt(func(): be1.geste("eindoesen"), "w2_buer_beamter1_eindoesen", 5.0)
	await _geh("stadion")
	mx = C.get_character("Max")
	var leo = C.get_character("Leonidas")
	if leo:
		await _echt(func(): leo.geste("bruellen"), "w2_stad_leonidas_bruellen", 5.8)
		await _echt(func(): leo.laufen_zu(leo.position + Vector2(-300, 0), 160.0, "losrennen"), "w2_stad_leonidas_losrennen", 2.2)
	var skr = C.get_character("Schildkroete")
	if skr:
		await _echt(func(): skr.laufen_zu(skr.position + Vector2(-250, 0), 120.0, "rennen"), "w2_stad_schildkroete_rennen", 2.4)
	var p: Vector2 = mx.position
	await _echt(func(): mx.laufen_zu(Vector2(p.x - 400, p.y), 150.0, "barfuss"), "w2_stad_max_barfuss", 3.0)
	await _echt(func(): mx.geste("diskus"), "w2_stad_max_diskus", 3.4)
	await _echt(func(): mx.geste("speer"), "w2_stad_max_speer", 3.2)
	await _geh("werkstatt")
	var arc = C.get_character("Archimedes")
	if arc:
		await _echt(func(): arc.geste("zirkel"), "w2_werk_archimedes_zirkel", 4.8)
		arc.grafik_laden("archimedes_handtuch")
		await _echt(func(): arc.geste("heureka_posen"), "w2_werk_archimedes_heureka_posen", 3.9)
		var st: Vector2 = arc.position
		await _echt(func(): W._figur_laeuft("Archimedes", st, Vector2(st.x + 300, st.y), 170.0, "heureka"), "w2_werk_archimedes_heureka_lauf", 2.2)
	mx = C.get_character("Max")
	await _echt(func(): mx.geste("katapult"), "w2_werk_max_katapult", 2.8)
	# Größenvergleich hinten im Raum
	await _geh("grabhuegel")
	mx = C.get_character("Max")
	await _echt(func(): mx.walk_to(Vector2(320, 240)), "w2_grab_max_zum_sockel", 4.0)
	await _geh("sphinx")
	mx = C.get_character("Max")
	await _echt(func(): mx.walk_to(Vector2(330, 245)), "w2_sphinx_max_zum_tisch", 4.0)
	print("FERTIG")
	quit(0)


## Geste ohne Warten starten, nach „nach“ Sekunden auf den Boden klicken (walk_to).
func _abbruch(f, anim: String, ziel: Vector2, nach: float) -> void:
	f.geste(anim, false)
	await create_timer(nach).timeout
	f.walk_to(ziel)


## Testmodus aus, Aktion starten (nicht abwarten), Bildfolge aufnehmen, Testmodus wieder an.
func _echt(aktion: Callable, name: String, sek: float) -> void:
	S.testmodus = false
	aktion.call()
	await _bilder(name, sek)
	# Rest abwarten, damit nichts in die nächste Aufnahme läuft
	await create_timer(0.6).timeout
	S.testmodus = true
	print("AUFNAHME ", name)


func _bilder(name: String, sek: float, abstand := 0.1) -> void:
	var t0 := Time.get_ticks_msec()
	var zeiten := []
	var i := 0
	var figuren := {}
	while Time.get_ticks_msec() - t0 < int(sek * 1000):
		await create_timer(abstand).timeout
		await process_frame
		var img := root.get_texture().get_image()
		img.resize(640, 360, Image.INTERPOLATE_NEAREST)
		img.save_png(aus + "%s_%03d.png" % [name, i])
		zeiten.append(Time.get_ticks_msec() - t0)
		i += 1
	var raum = root.get_node("R").current
	for c in raum.get_characters():
		var ap = c.get_node_or_null("AnimationPlayer")
		figuren[c.script_name] = {"pos": [c.position.x, c.position.y], "anim": ap.current_animation if ap else "",
			"skala": c.scale.x, "flip": c.get_node("Sprite2D").flip_h if c.get_node_or_null("Sprite2D") else false,
			"walk_speed": c.get("walk_speed")}
	var f := FileAccess.open(aus + "%s.json" % name, FileAccess.WRITE)
	f.store_string(JSON.stringify({"zeiten": zeiten, "figuren_ende": figuren, "raum": raum.raum_id() if raum.has_method("raum_id") else ""}))
	f.close()


func _geh(rid: String) -> void:
	S.testmodus = true
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
