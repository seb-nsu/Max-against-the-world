extends SceneTree
## Review 20.11. Animationen Welt 3 (nicht für CI, nicht committen). Angepasst aus _review_ta_anim.gd,
## _film_review.gd und _gesten_blick.gd: spielt Gesten (über die echten Skriptzeilen, also mit der
## Tabelle ZEILE), Reden, Gänge und Ambiente im echten Raum ab und nimmt Bildfolgen auf
## (640×360, Zeit je Bild und Fußpunkt der Zielfigur je Bild in <name>.json).
## Aufruf: godot --path game --position 6000,3000 -s res://tests/_review_an_w3_anim.gd -- AUSGABE [nur=raum]

const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
var aus := "user://review_an_w3/"
var nur := ""
var S
var C
var Z
var ziel_figur = null


func _initialize() -> void:
	_lauf.call_deferred()


func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		if a.begins_with("nur="):
			nur = a.trim_prefix("nur=")
		else:
			aus = a.trim_suffix("/") + "/"
	DirAccess.make_dir_recursive_absolute(aus)
	S = root.get_node("Spiel")
	C = root.get_node("C")
	Z = root.get_node("Zustand")
	S.testmodus = true
	root.get_node("E").settings.auto_continue_text = true
	change_scene_to_file(STARTRAUM)
	await _warte_bis(func(): return root.get_node("E").in_room, 15.0)
	S.welt_beginnen("welt-3")
	await _warte_raum("unterstadt_strasse")
	for f in ["W3_ANKUNFT", "W3_SIM_GESEHEN", "W3_TURM_GESEHEN", "W3_ERSTES_AUFWACHEN", "W3_LABOR_GESEHEN"]:
		Z.setze(f)

	if _soll("unterstadt_strasse"):
		Z.loese("R2")   # Morphäus steht dann in der Gasse
		await _geh("unterstadt_strasse")
		await _ambiente("w3_r01_ambiente", 640, 6.0)
		await _bei("HerrVier")
		await _zeile("VIE", "W3_NUD_VIE_0080", "HerrVier", "w3_r01_vier_haende_zeigen", 4.0)
		await _zeile("VIE", "W3_NUD_VIE_0010", "HerrVier", "w3_r01_vier_reden", 3.5)
		await _zeile("VIE", "W3_NUD_VIE_0310", "HerrVier", "w3_r01_vier_kochen_strahlend", 5.0)
		await _ruhe("WeinenderMann", "w3_r01_weinender_mann_ruhe", 3.0)
		await _bei("FrauRegenschirm")
		await _ruhe("FrauRegenschirm", "w3_r01_frau_ruhe", 3.0)
		await _zeile("FRA", "W3_STR_FRA_0220", "FrauRegenschirm", "w3_r01_frau_schimpfen_rede", 3.5)
		await _ruhe("StrassenmusikerW3", "w3_r01_musiker_spielen", 3.0)
		await _bei("Deckert")
		await _ruhe("Deckert", "w3_r01_deckert_regen_zaehlen", 5.0)
		await _zeile("DEC", "W3_TEST_DEC_0010", "Deckert", "w3_r01_deckert_reden", 5.0)
		await _zeile("DEC", "W3_TEST_DEC_0100", "Deckert", "w3_r01_deckert_notieren", 6.0)
		await _zeile("DEC", "W3_TEST_DEC_0310", "Deckert", "w3_r01_deckert_stempeln", 3.5)
		await _zeile("DEC", "W3_TEST_DEC_0330", "Deckert", "w3_r01_deckert_seitschritt", 2.5)
		await _bei("Morphaeus")
		await _zeile("MOR", "W3_NUD_MOR_0210", "Morphaeus", "w3_r01_morphaeus_brille", 4.0)
		await _zeile("MOR", "W3_NUD_MOR_0230", "Morphaeus", "w3_r01_morphaeus_reden", 3.5)
		await _zeile("MOR", "W3_NUD_MOR_0370", "Morphaeus", "w3_r01_morphaeus_schild_zeigen", 4.0)
		await _zeile("MOR", "W3_NUD_MOR_0610", "Morphaeus", "w3_r01_morphaeus_nicken", 2.5)
		# Gänge (im Spiel ungenutzt, hier nur zum Vergleich): je 160 px nach links
		await _gang("Morphaeus", -160, "w3_r01_morphaeus_gang")
		await _gang("Deckert", -160, "w3_r01_deckert_gang")
		var mx = C.get_character("Max")
		ziel_figur = mx
		await _echt(func(): S.sagen("MAX", "W3_ANK_MAX_0020"), "w3_r01_max_regen_wischen", 3.2)
		await _gang("Max", -300, "w3_r01_max_gang")
		await _echt(func(): _abbruch(mx, "regen_wischen", mx.position + Vector2(200, 0), 0.8), "w3_r01_max_abbruch", 2.6)

	if _soll("apothekengasse"):
		await _geh("apothekengasse")
		await _ambiente("w3_r02_ambiente_ratte", 1100, 8.0)
		await _bei("Morphaeus")
		await _zeile("MOR", "W3_APO_MOR_0420", "Morphaeus", "w3_r02_morphaeus_kekse", 4.0)
		await _zeile("MOR", "W3_APO_MOR_0610", "Morphaeus", "w3_r02_morphaeus_fangen", 4.0)
		ziel_figur = C.get_character("Max")
		await _echt(func(): S.sagen("MAX", "W3_APO_MAX_0570"), "w3_r02_max_pastille", 3.4)
		await _echt(func(): S.sagen("MAX", "W3_APO_MAX_0600"), "w3_r02_max_schlucken", 3.2)

	if _soll("widerstandsbasis"):
		await _geh("widerstandsbasis")
		await _ambiente("w3_r03_ambiente", 640, 4.0)
		await _bei("Kalle")
		await _zeile("KAL", "W3_BAS_KAL_0150", "Kalle", "w3_r03_kalle_zeigen", 3.5)
		await _zeile("KAL", "W3_BAS_KAL_0160", "Kalle", "w3_r03_kalle_kabel", 3.8)
		await _zeile("KAL", "W3_BAS_KAL_0040", "Kalle", "w3_r03_kalle_fluestern", 3.6)
		await _zeile("KAL", "W3_TERM_KAL_0060", "Kalle", "w3_r03_kalle_reden", 3.0)
		await _zeile("KAL", "W3_PIEP_KAL_0040", "Kalle", "w3_r03_kalle_entsetzt", 3.6)
		await _ruhe("Rebellin", "w3_r03_rebellin_essen", 3.0)
		await _zeile("REB", "W3_BAS_REB_0180", "Rebellin", "w3_r03_rebellin_karton", 3.2)
		await _bei("Piepsi")
		await _zeile("PIE", "W3_PIEP_NAR_0050", "Piepsi", "w3_r03_piepsi_hochfahren", 2.0)
		await _zeile("PIE", "W3_PIEP_PIE_0060", "Piepsi", "w3_r03_piepsi_piepen", 2.5)
		await _zeile("PIE", "W3_PIEP_PIE_0170", "Piepsi", "w3_r03_piepsi_drucken", 2.0)

	if _soll("laboreingang"):
		await _geh("laboreingang")
		await _ambiente("w3_r05_ambiente", 320, 4.0)
		await _ruhe("Hausmeister", "w3_r05_hausmeister_wischen", 2.5)
		await _zeile("HAU", "W3_EING_HAU_0010", "Hausmeister", "w3_r05_hausmeister_verbeugen", 3.2)
		await _zeile("HAU", "W3_EING_HAU_0030", "Hausmeister", "w3_r05_hausmeister_reden", 3.5)
		await _zeile("HAU", "W3_EING_HAU_0200", "Hausmeister", "w3_r05_hausmeister_lesen", 4.0)
		await _zeile("HAU", "W3_EING_MAX_0240", "Hausmeister", "w3_r05_hausmeister_arm_drehen", 2.0)
		ziel_figur = C.get_character("Max")
		await _echt(func(): S.sagen("MAX", "W3_EING_MAX_0160"), "w3_r05_max_gedankentrick", 3.6)

	if _soll("stadtstrasse"):
		await _geh("stadtstrasse")
		var W = S.regeln()
		S.testmodus = false
		W._katze_schleife()
		S.testmodus = true
		await _ambiente("w3_r06_ambiente_links", 320, 14.0)
		await _ambiente("w3_r06_ambiente_rechts", 960, 14.0)
		var mx = C.get_character("Max")
		ziel_figur = mx
		await _gang("Max", 400, "w3_r06_max_gang")
		await _echt(func(): mx.walk_to(Vector2(1150, 308)), "w3_r06_max_zur_glastuer", 6.0)
		await _echt(func(): S.sagen("MAX", "W3_TUER_MAX_0150"), "w3_r06_max_code_sicht", 3.0)
		await _bei("Schmidt")
		await _zeile("SCH", "W3_TUER_SCH_0220", "Schmidt", "w3_r06_schmidt_stumm", 3.6)
		await _zeile("SCH", "W3_TUER_SCH_0010", "Schmidt", "w3_r06_schmidt_reden", 4.5)
		await _gang("Schmidt", -160, "w3_r06_schmidt_gang")
		Z.loese("R5")
		await _zeile("TUR", "W3_TUER_TUR_0240", "Tuer", "w3_r06_tuer_redet", 3.0)
		# Hinken nach dem Hexenschuss
		Z.setze("W3_HEXENSCHUSS")
		W._max_gang()
		mx = C.get_character("Max")
		mx.position = Vector2(500, 340)
		await create_timer(1.0).timeout
		ziel_figur = mx
		await _gang("Max", 400, "w3_r06_max_hinken")
		Z.setze("W3_HEXENSCHUSS", false)
		W._max_gang()

	if _soll("kueche_orakel"):
		await _geh("kueche_orakel")
		await _ambiente("w3_r07_ambiente", 320, 4.0)
		await _zeile("ORA", "W3_KUCH_ORA_0010", "OrakelOma", "w3_r07_oma_ofen", 3.4)
		await _zeile("ORA", "W3_KUCH_ORA_0030", "OrakelOma", "w3_r07_oma_reden", 4.0)
		await _zeile("ORA", "W3_KUCH_ORA_0160", "OrakelOma", "w3_r07_oma_stirn", 4.0)
		await _zeile("ORA", "W3_KUCH_ORA_0170", "OrakelOma", "w3_r07_oma_sparschwein", 3.4)
		await _zeile("ORA", "W3_KUCH_ORA_0220", "OrakelOma", "w3_r07_oma_kehren", 4.2)

	if _soll("buero_50"):
		await _geh("buero_50")
		await _ambiente("w3_r08_ambiente", 320, 4.0)
		await _zeile("SCH", "W3_TURM_SCH_0030", "Schmidt", "w3_r08_schmidt_kopierer", 3.6)
		await _zeile("KLO", "W3_TURM_KLO_0070", "Klon", "w3_r08_klon_werfen", 4.0)
		ziel_figur = C.get_character("Max")
		await _echt(func(): S.sagen("NAR", "W3_TURM_NAR_0080"), "w3_r08_max_zeitlupe", 6.4)
		await _echt(func(): S.sagen("MAX", "W3_TURM_MAX_0090"), "w3_r08_max_hexenschuss", 4.2)
		await _zeile("SCH", "W3_TURM_SCH_0110", "Schmidt", "w3_r08_schmidt_hausschuh", 3.2)
		await _zeile("KLO", "W3_TURM_KLO_0120", "Klon", "w3_r08_klon_reden", 3.0)
		await _zeile("SCH", "W3_TURM_SCH_0430", "Schmidt", "w3_r08_schmidt_brille_ab", 4.5)
		await _zeile("SCH", "W3_TURM_SCH_0450", "Schmidt", "w3_r08_schmidt_akte", 3.2)
		await _gang("Klon", 120, "w3_r08_klon_gang")

	if _soll("testkammer_1"):
		await _geh("testkammer_1")
		await _zeile("BER", "W3_KAM1_BER_0170", "Bernd", "w3_r09_bernd_davonschweben", 2.5)
		ziel_figur = C.get_character("Max")
		await _echt(func(): S.sagen("MAX", "W3_KAM1_MAX_0140"), "w3_r09_max_portalgeraet", 3.2)

	if _soll("kern"):
		await _geh("kern")
		await _ambiente("w3_r12_ambiente", 320, 4.0)
		await _zeile("MUT", "W3_KERN_MUT_0180", "Mutti", "w3_r12_mutti_reden", 3.5)
		await _zeile("MUT", "W3_KERN_MUT_0200", "Mutti", "w3_r12_mutti_herunterfahren", 5.0)
		var m = C.get_character("Mutti")
		if m:
			ziel_figur = m
			await _echt(func(): m.geste("beleidigt"), "w3_r12_mutti_beleidigt", 3.0)
	print("FERTIG")
	quit(0)


func _soll(rid: String) -> bool:
	return nur == "" or nur == rid


## Max neben die Figur stellen, damit die Kamera sie zeigt (breite Räume).
func _bei(sn: String) -> void:
	var c = C.get_character(sn)
	var mx = C.get_character("Max")
	if c == null or mx == null:
		return
	var dx := 150.0 if c.position.x < 640 else -150.0
	mx.position = Vector2(c.position.x + dx, mx.position.y)
	await create_timer(1.2).timeout


## Kamera an x stellen (Max dorthin) und den Raum mit allen Effekten und Ruhe-Schleifen aufnehmen.
func _ambiente(name: String, x: float, sek: float) -> void:
	var mx = C.get_character("Max")
	if mx:
		mx.position = Vector2(x, mx.position.y)
	var raum = root.get_node("R").current
	S.testmodus = false
	raum._effekte_setzen()
	raum.ruhe_anwenden()
	await create_timer(1.0).timeout
	ziel_figur = null
	await _bilder(name, sek)
	S.testmodus = true


func _ruhe(sn: String, name: String, sek: float) -> void:
	var c = C.get_character(sn)
	if c == null:
		print("FEHLT ", sn)
		return
	ziel_figur = c
	var raum = root.get_node("R").current
	await _echt(func():
		raum.ruhe_anwenden()
		if not c.is_talking:
			c._play_idle(), name, sek)


func _zeile(k: String, zeile: String, sn: String, name: String, sek: float) -> void:
	var c = C.get_character(sn)
	if c == null:
		print("FEHLT ", sn)
		return
	ziel_figur = c
	await _echt(func(): S.sagen(k, zeile), name, sek)


func _gang(sn: String, dx: float, name: String) -> void:
	var c = C.get_character(sn)
	if c == null:
		print("FEHLT ", sn)
		return
	ziel_figur = c
	var ziel := Vector2(c.position.x + dx, c.position.y)
	var t := absf(dx) / 120.0 + 1.0
	await _echt(func(): c.walk_to(ziel), name, t, 0.04)


func _abbruch(f, anim: String, ziel: Vector2, nach: float) -> void:
	f.geste(anim, false)
	await create_timer(nach).timeout
	f.walk_to(ziel)


func _echt(aktion: Callable, name: String, sek: float, abstand := 0.1) -> void:
	S.testmodus = false
	aktion.call()
	await _bilder(name, sek, abstand)
	await create_timer(0.8).timeout
	# laufende Sätze und Gesten beenden
	S.testmodus = true
	print("AUFNAHME ", name)


func _bilder(name: String, sek: float, abstand := 0.1) -> void:
	var t0 := Time.get_ticks_msec()
	var zeiten := []
	var fuss := []
	var anims := []
	var i := 0
	var extra := {}
	if ziel_figur and is_instance_valid(ziel_figur):
		var sp = ziel_figur.get_node_or_null("Sprite2D")
		if sp and sp.texture:
			extra = {"h": sp.texture.get_height() / float(sp.vframes) * ziel_figur.scale.y,
				"w": sp.texture.get_width() / float(sp.hframes) * ziel_figur.scale.x, "skala": ziel_figur.scale.x}
	while Time.get_ticks_msec() - t0 < int(sek * 1000):
		await create_timer(abstand).timeout
		await process_frame
		var img := root.get_texture().get_image()
		img.resize(640, 360, Image.INTERPOLATE_NEAREST)
		img.save_png(aus + "%s_%03d.png" % [name, i])
		zeiten.append(Time.get_ticks_msec() - t0)
		if ziel_figur and is_instance_valid(ziel_figur):
			var p: Vector2 = ziel_figur.get_global_transform_with_canvas().origin
			fuss.append([p.x, p.y, ziel_figur.position.x, ziel_figur.position.y])
			var ap = ziel_figur.get_node_or_null("AnimationPlayer")
			anims.append(ap.current_animation if ap else "")
		i += 1
	var f := FileAccess.open(aus + "%s.json" % name, FileAccess.WRITE)
	f.store_string(JSON.stringify({"zeiten": zeiten, "fuss": fuss, "anims": anims, "figur": extra,
		"raum": root.get_node("R").current.raum_id()}))
	f.close()


func _geh(rid: String) -> void:
	S.testmodus = true
	S.herkunft_raum = ""
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
