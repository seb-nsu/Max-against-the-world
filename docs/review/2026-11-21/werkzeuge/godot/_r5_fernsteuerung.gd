extends SceneTree
## Fernsteuerung für Reviews (kein CI-Test, Review 21.11.2026): spielt das Spiel OHNE Testmodus
## über echte Maus- und Tastenereignisse (push_input wie der Controller-Weg des Spiels) und wird
## von außen über Befehlsdateien gesteuert. So lässt sich das Spiel Schritt für Schritt wie von
## einem Spieler bedienen: klicken, Antwort lesen, Bild ansehen, weiterklicken.
##
## Start (aus dem Checkout, Fenster außerhalb des Bildschirms, ohne Ton):
##   godot --path game --position 6000,3000 --audio-driver Dummy -s res://tests/_r5_fernsteuerung.gd -- ORDNER [tempo=3] [lauf=name]
## Bedienung: python tools/../fs.py ORDNER "befehl" "befehl" …  (schreibt befehl_<id>.txt, wartet auf antwort_<id>.txt)
##
## Was nachgebildet ist (und nur das): Das Fenster liegt außerhalb des Bildschirms und hat keinen
## echten Mauszeiger. Drei Stellen im Spiel fragen die Zeigerposition direkt beim Betriebssystem ab
## statt aus dem Mausereignis: (1) Aufklappen der Inventarleiste, (2) Laufziel beim Klick auf freien
## Boden und auf Boden-Hotspots, (3) Lage von Zeigerbild und Objektname. Dort setzt die
## Fernsteuerung die Position des gesteuerten Zeigers ein. Alles andere (welches Objekt unter dem
## Zeiger gewinnt, Klick, Gesprächsmenü, Inventar, Menüs, Tasten) läuft über die echten Ereigniswege.

const HAUPTMENUE := "res://oberflaeche/hauptmenue.tscn"
const STARTRAUM := "res://game/rooms/wohnzimmer/room_wohnzimmer.tscn"
const FENSTER := Vector2i(1920, 1080)
const FENSTER_ORT := Vector2i(6000, 3000)
const BILD := Vector2(640, 360)
const CHECKPOINT_PLATZ := 12

var ordner := ""
var lauf := "lauf"
var frisch := false
var tempo := 1.0
var textmodus := "klick"          # klick | lesen | nie
var maus := Vector2(320, 250)
var _ereignisse: PackedStringArray = []
var _raum := ""
var _t := 0.0                      # Spielzeit in Sekunden seit Start der Fernsteuerung
var _film := ""
var _film_fps := 10.0
var _film_naechstes := 0.0
var _film_bild := 0
var _film_tempo := 1.0
var _fortschritt_t := 0.0
var _pos_merk := {}
var _ende := false
var _leiste: Control
var _zeile_t := -1.0               # Beginn der gerade gezeigten Textzeile
var _zeile_text := ""
var _verbunden := {}
var _marke := 0.0
var _zuletzt_gesagt := ""
var _zeiger_an := false


func _initialize() -> void:
	_lauf.call_deferred()


func _physics_process(_delta: float) -> bool:
	if _zeiger_an:
		_bewegung_senden()
	return false


func _process(delta: float) -> bool:
	_t += delta
	if not _film.is_empty() and _t >= _film_naechstes:
		_film_naechstes = _t + 1.0 / _film_fps
		_film_aufnehmen()
	return false


#region Zugriff ####################################################################################
func _n(name: String) -> Node:
	return root.get_node_or_null(name)


func _S() -> Node: return _n("Spiel")
func _Z() -> Node: return _n("Zustand")
func _E() -> Node: return _n("E")
func _R() -> Node: return _n("R")
func _C() -> Node: return _n("C")
func _I() -> Node: return _n("I")
func _D() -> Node: return _n("D")
func _G() -> Node: return _n("G")
func _B() -> Node: return _n("Bauplan")
func _H() -> Node: return _n("Hinweise")


func _raum_knoten() -> Node:
	var r = _R().current if _R() else null
	return r if is_instance_valid(r) else null


func _raum_id() -> String:
	var r := _raum_knoten()
	if r == null:
		return ""
	return str(r.raum_id()) if r.has_method("raum_id") else str(r.script_name)


func _spieler() -> Node:
	var p = _C().player if _C() else null
	return p if is_instance_valid(p) else null


func _echt_warten(sek: float) -> void:
	await create_timer(sek, true, false, true).timeout


func _spiel_warten(sek: float) -> void:
	var bis := _t + sek
	while _t < bis:
		await process_frame


func _ereignis(text: String) -> void:
	_ereignisse.append("[%7.1f] %s" % [_t, text])
	_fortschritt_t = _t
#endregion


#region Start ######################################################################################
func _lauf() -> void:
	await process_frame
	for a in OS.get_cmdline_user_args():
		if a.begins_with("tempo="):
			tempo = maxf(0.25, float(a.trim_prefix("tempo=")))
		elif a.begins_with("lauf="):
			lauf = a.trim_prefix("lauf=")
		elif a == "frisch":
			frisch = true
		else:
			ordner = a.replace("\\", "/").trim_suffix("/") + "/"
	if ordner.is_empty():
		print("FEHLER: Arbeitsordner fehlt")
		quit(2)
		return
	DirAccess.make_dir_recursive_absolute(ordner)
	_abschirmen()
	_fenster_weg()
	_verbinden()
	RenderingServer.frame_pre_draw.connect(_zeiger_zeichnen)
	change_scene_to_file(HAUPTMENUE)
	for i in 30:
		await process_frame
		_fenster_weg()
	Engine.time_scale = tempo
	_zeiger_an = true
	_datei_schreiben(ordner + "bereit.txt", "bereit %s\n" % Time.get_datetime_string_from_system())
	print("FERNSTEUERUNG bereit in ", ordner)
	while not _ende:
		var b := _naechste_befehlsdatei()
		if b.is_empty():
			await _echt_warten(0.05)
			continue
		await _befehlsdatei(b)
	_datei_schreiben(ordner + "beendet.txt", "beendet\n")
	quit(0)


## Eigene Spielstände, Einstellungen und Errungenschaften je Lauf: nichts davon berührt die echten
## Dateien des Spielers unter user://.
func _abschirmen() -> void:
	var basis := "user://r5/%s/" % lauf
	if frisch:
		_ordner_leeren(ProjectSettings.globalize_path(basis))
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(basis + "saves/"))
	CQSaveLoad.ordner = basis + "saves/"
	var ein := _n("Einstellungen")
	if ein:
		ein.datei = basis + "settings.cfg"
		ein.laden()
		ein.anwenden()
		ein.geaendert.connect(func(_k): _fenster_weg.call_deferred())
	var err := _n("Errungenschaften")
	if err and "datei" in err:
		err.datei = basis + "errungenschaften.cfg"
	var tel := _n("Telemetrie")
	if tel and "ordner" in tel:
		tel.ordner = basis + "telemetrie/"


func _ordner_leeren(pfad: String) -> void:
	if not pfad.contains("/r5/") or not DirAccess.dir_exists_absolute(pfad):
		return
	for f in DirAccess.get_files_at(pfad):
		DirAccess.remove_absolute(pfad.path_join(f))
	for d in DirAccess.get_directories_at(pfad):
		_ordner_leeren(pfad.path_join(d))
		DirAccess.remove_absolute(pfad.path_join(d))


func _fenster_weg() -> void:
	if DisplayServer.get_name() == "headless":
		return
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_NO_FOCUS, true)
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	if DisplayServer.window_get_size() != FENSTER:
		DisplayServer.window_set_size(FENSTER)
	if DisplayServer.window_get_position() != FENSTER_ORT:
		DisplayServer.window_set_position(FENSTER_ORT)


func _verbinden() -> void:
	var S := _S()
	S.zeile_gesagt.connect(func(k: String):
		_zuletzt_gesagt = k
		var teile := k.split("_")
		var wer := teile[2] if teile.size() > 3 else "?"
		_ereignis("SAGT %s | %s: %s" % [k, wer, tr(k)]))
	S.ersatz_gesagt.connect(func(k: String, z: String): _ereignis("ERSATZZEILE (%s) %s" % [k, z]))
	S.figur_gewechselt.connect(func(neu): _ereignis("FIGUR jetzt %s" % (neu.script_name if is_instance_valid(neu) else "?")))
	_Z().geaendert.connect(func(n: String): _ereignis("ZUSTAND %s%s" % [n, _zustand_wert(n)]))
	_I().item_added.connect(func(item, wer): _ereignis("INVENTAR + %s (%s)" % [_gegenstand_id(item), wer.script_name if is_instance_valid(wer) else "?"]))
	_I().item_removed.connect(func(item, wer): _ereignis("INVENTAR - %s (%s)" % [_gegenstand_id(item), wer.script_name if is_instance_valid(wer) else "?"]))
	_D().dialog_started.connect(func(d): _ereignis("GESPRÄCH beginnt: %s" % (d.script_name if is_instance_valid(d) else "?")))
	_D().dialog_finished.connect(func(d): _ereignis("GESPRÄCH endet: %s" % (d.script_name if is_instance_valid(d) else "?")))
	var H := _H()
	if H and H.has_signal("hinweis_gegeben"):
		H.hinweis_gegeben.connect(func(schritt, stufe, neu, wartezeile, quelle):
			_ereignis("HINWEIS Schritt %s, Stufe %s%s%s (%s)" % [schritt, stufe, "" if neu else ", Wiederholung", ", Wartezeile" if wartezeile else "", quelle]))
	_G().system_text_shown.connect(func(m): _ereignis("SYSTEMTEXT %s" % tr(str(m))))
	var sp := _n("Spielstand")
	if sp:
		sp.gespeichert.connect(func(slot): _ereignis("GESPEICHERT Platz %s" % slot))
		sp.geladen.connect(func(slot): _ereignis("GELADEN Platz %s" % slot))


func _zustand_wert(n: String) -> String:
	var Z := _Z()
	if Z.schalter.has(n):
		return " = %s" % Z.schalter[n]
	if Z.werte.has(n):
		return " = %s" % str(Z.werte[n])
	return ""


func _gegenstand_id(item) -> String:
	if not is_instance_valid(item):
		return "?"
	var g: Dictionary = _B().gegenstand(item.script_name)
	return str(g.get("id", item.script_name))
#endregion


#region Befehlsdateien #############################################################################
func _naechste_befehlsdatei() -> String:
	var d := DirAccess.open(ordner)
	if d == null:
		return ""
	var namen: Array = []
	for f in d.get_files():
		if f.begins_with("befehl_") and f.ends_with(".txt"):
			namen.append(f)
	namen.sort()
	return namen[0] if not namen.is_empty() else ""


func _befehlsdatei(datei: String) -> void:
	var kennung := datei.trim_prefix("befehl_").trim_suffix(".txt")
	var text := FileAccess.get_file_as_string(ordner + datei)
	DirAccess.remove_absolute(ordner + datei)
	var aus: PackedStringArray = []
	for zeile in text.split("\n"):
		zeile = zeile.strip_edges()
		if zeile.is_empty() or zeile.begins_with("#"):
			continue
		aus.append("> " + zeile)
		var antwort: String = await _befehl(zeile)
		if not antwort.is_empty():
			aus.append(antwort)
		if _ende:
			break
	var alles := "\n".join(aus) + "\n"
	var v := FileAccess.open(ordner + "verlauf.txt", FileAccess.READ_WRITE if FileAccess.file_exists(ordner + "verlauf.txt") else FileAccess.WRITE)
	if v:
		v.seek_end()
		v.store_string(alles)
		v.close()
	_datei_schreiben(ordner + "antwort_%s.tmp" % kennung, alles)
	DirAccess.rename_absolute(ordner + "antwort_%s.tmp" % kennung, ordner + "antwort_%s.txt" % kennung)


func _datei_schreiben(pfad: String, inhalt: String) -> void:
	var f := FileAccess.open(pfad, FileAccess.WRITE)
	if f:
		f.store_string(inhalt)
		f.close()
#endregion


#region Befehle ####################################################################################
func _befehl(zeile: String) -> String:
	var teile := zeile.split(" ", false)
	var b := teile[0].to_lower()
	var rest := zeile.substr(teile[0].length()).strip_edges()
	_ereignisse.clear()
	var t0 := _t
	var kopf := ""
	_spieler_verbinden()
	match b:
		"hilfe":
			return HILFE
		"status":
			return _status()
		"objekte":
			return _objekte_liste()
		"maus":
			var z: Dictionary = await _ziel(rest, false)
			if z.has("fehler"):
				return "FEHLER " + z.fehler
			await _bewege(z.punkt)
			return "%sZEIGER (%d,%d) über: %s" % [z.get("info", ""), maus.x, maus.y, _unter_zeiger()]
		"klick", "rklick", "dklick":
			var z: Dictionary = await _ziel(rest, true)
			if z.has("fehler"):
				return "FEHLER " + z.fehler
			await _bewege(z.punkt)
			kopf = "%s%s (%d,%d) auf: %s\n" % [z.get("info", ""), b.to_upper(), maus.x, maus.y, _unter_zeiger()]
			await _klick(MOUSE_BUTTON_RIGHT if b == "rklick" else MOUSE_BUTTON_LEFT, b == "dklick")
			await _ruhe()
		"drueck", "los":
			# Maustaste halten bzw. loslassen (Minispiele): drueck x y / los x y
			var z: Dictionary = await _ziel(rest, false)
			if z.has("fehler"):
				return "FEHLER " + z.fehler
			await _bewege(z.punkt)
			_maustaste(MOUSE_BUTTON_LEFT, b == "drueck")
			await physics_frame
			await process_frame
		"rad":
			# rad x y hoch|runter [n]
			var z: Dictionary = await _ziel("%s %s" % [teile[1], teile[2]] if teile.size() > 2 else "", false)
			if z.has("fehler"):
				return "FEHLER " + z.fehler
			await _bewege(z.punkt)
			var n := int(teile[4]) if teile.size() > 4 else 1
			for i in n:
				_maustaste(MOUSE_BUTTON_WHEEL_UP if teile.size() > 3 and teile[3] == "hoch" else MOUSE_BUTTON_WHEEL_DOWN, true)
				_maustaste(MOUSE_BUTTON_WHEEL_UP if teile.size() > 3 and teile[3] == "hoch" else MOUSE_BUTTON_WHEEL_DOWN, false)
				await process_frame
		"inv":
			return await _inventar_liste()
		"optionen":
			return _optionen_liste()
		"option":
			var f: String = await _option_waehlen(rest)
			if not f.is_empty():
				return f
			await _ruhe()
		"knoepfe":
			return _knoepfe_liste()
		"knopf":
			var f: String = await _knopf_druecken(rest)
			if f.begins_with("FEHLER"):
				return f
			kopf = f + "\n"
			await _ruhe(120.0, true)
		"portraet":
			var hud = _S().hud
			var k: Control = hud._pixel if rest.to_lower().begins_with("p") else hud._max
			await _bewege(k.get_global_rect().get_center())
			kopf = "KLICK Porträt %s (%d,%d)%s\n" % [rest, maus.x, maus.y, " (ausgegraut)" if k.disabled else ""]
			await _klick(MOUSE_BUTTON_LEFT)
			await _ruhe()
		"pfote":
			var hud = _S().hud
			var k: Control = hud._pfote
			await _bewege(k.get_global_rect().get_center())
			kopf = "KLICK Pfote (%d,%d)%s%s\n" % [maus.x, maus.y, " (ausgegraut)" if k.disabled else "", " (leuchtet)" if _H().leuchtet() else ""]
			await _klick(MOUSE_BUTTON_LEFT)
			await _ruhe()
		"taste":
			var f := await _taste(teile)
			if not f.is_empty():
				return f
			await _ruhe(120.0, true)
		"warte":
			# warte          : bis das Spiel auf Eingabe wartet (Text wird nach Textmodus weitergeklickt)
			# warte 31       : 31 Spielsekunden abwarten, ohne zu klicken (Zurufe, Wecker, Warte-Gesten)
			if teile.size() > 1:
				await _spiel_warten(float(teile[1]))
				await _ruhe(120.0, true)
			else:
				await _ruhe()
		"weiter":
			# ein einzelner Klick zum Weiterschalten von Text (Textmodus nie)
			await _klick(MOUSE_BUTTON_LEFT)
			await _spiel_warten(0.2)
		"textmodus":
			if rest in ["klick", "lesen", "nie"]:
				textmodus = rest
			return "Textmodus: %s" % textmodus
		"tempo":
			if teile.size() > 1:
				tempo = clampf(float(teile[1]), 0.25, 8.0)
				Engine.time_scale = tempo
			return "Tempo: %s" % tempo
		"marke":
			_marke = _t
			return "Marke gesetzt bei Spielzeit %.1f s" % _t
		"zeit":
			return "Spielzeit seit Marke: %.1f s (gesamt %.1f s, Tempo %s)" % [_t - _marke, _t, tempo]
		"foto":
			return await _foto(teile)
		"film":
			return _film_befehl(teile)
		"start":
			var f: String = await _start(teile)
			if not f.is_empty():
				return f
			await _ruhe()
		"stand":
			return await _stand(teile)
		"lies":
			return _lies(rest)
		"ende":
			_ende = true
			return "Fernsteuerung beendet."
		_:
			return "FEHLER unbekannter Befehl „%s“ (hilfe zeigt alle)" % b
	return kopf + _bericht(t0)


func _bericht(t0: float) -> String:
	var aus: PackedStringArray = []
	for e in _ereignisse:
		aus.append(e)
	aus.append(_lage_zeile(_t - t0))
	return "\n".join(aus)


func _lage_zeile(dauer := -1.0) -> String:
	var p := _spieler()
	var wer := "-"
	if p and p.is_inside_tree():
		wer = "%s (%d,%d) Skala %.2f" % [p.script_name, p.global_position.x, p.global_position.y, absf(p.scale.y)]
	var hand := "-"
	var I := _I()
	if I and is_instance_valid(I.active):
		hand = _gegenstand_id(I.active)
	var extra := ""
	var lage := _lage()
	if lage == "menue":
		extra = " | %d Optionen (Befehl optionen)" % _optionen().size()
	return "LAGE %s | Raum %s | %s | Kamera x=%d | Hand: %s%s%s" % [lage, _raum_id() if not _raum_id().is_empty() else "-", wer, _kamera_x(), hand, extra, (" | Dauer %.1f s" % dauer) if dauer >= 0.0 else ""]


func _kamera_x() -> int:
	return int(round(-root.get_canvas_transform().origin.x))


const HILFE := """Befehle (Koordinaten immer im Spielbild 640×360):
  status | objekte | inv | optionen | knoepfe      Zustand, Objekte im Raum, Inventar, Gesprächsoptionen, Knöpfe
  maus X Y | maus @id                              Zeiger bewegen, meldet was darunter liegt
  klick X Y | rklick X Y | dklick X Y              Links-/Rechts-/Doppelklick an einer Bildstelle
  klick @id | rklick @id                           … auf ein Objekt im Raum (sucht eine Stelle, an der es unter dem Zeiger gewinnt)
  klick inv:id | rklick inv:id                     … auf einen Gegenstand in der Inventarleiste (klappt sie vorher auf)
  option N | option ID | option "Text"             Gesprächs- oder Auswahlzeile anklicken
  knopf "Text"                                     Knopf einer Oberfläche anklicken (Menü, Überlagerung)
  portraet max|pixel | pfote                       Porträt bzw. Hilfe-Pfote anklicken
  taste esc|tab|leer|enter|f5|f9|hoch|…            Taste drücken; taste halten shift / taste los shift
  drueck X Y | los X Y | rad X Y hoch|runter [n]   Maustaste halten/loslassen, Mausrad
  warte | warte SEK | weiter                       auf Eingabebereitschaft warten | Spielsekunden abwarten | ein Textklick
  textmodus klick|lesen|nie   tempo N              Text sofort weiterklicken | nach Lesezeit | gar nicht; Spieltempo
  marke | zeit                                     Stoppuhr in Spielsekunden
  foto NAME [voll] [x y w h]                       Bildschirmfoto nach ORDNER/fotos/NAME.png (640×360, voll = Fenstergröße, Ausschnitt in Spielpixeln)
  film an NAME [fps] | film aus                    Bildfolge nach ORDNER/filme/NAME/ (läuft in Tempo 1)
  start hauptmenue|prolog|welt-N|zs N              Abschnitt beginnen (Herstellen eines Startzustands, kein Rätselschritt)
  stand sichern NAME | stand holen NAME | stand liste   Kontrollpunkt aus echtem Spielstand
  lies AUSDRUCK                                    Wert lesen, z. B. lies Z.geloest("R1") (S, Z, E, R, C, I, D, G, B, H)
  ende"""
#endregion


#region Zeiger und Klick ###########################################################################
func _bewege(p: Vector2) -> void:
	maus = p.clamp(Vector2.ZERO, BILD - Vector2.ONE)
	_bewegung_senden()
	_leiste_nachfuehren()
	await physics_frame
	await physics_frame
	await process_frame


## Ein Bewegungsereignis am gesteuerten Zeiger. Läuft zusätzlich in jeder Physik-Runde
## (_physics_process): Godot erzeugt sonst in jeder Runde ohne Mausereignis selbst eines an der
## Position des Betriebssystem-Zeigers (Viewport::_process_picking, „passive hover“), und der liegt
## außerhalb des Fensters; das Objekt unter dem gesteuerten Zeiger verlöre sofort wieder den Zeiger.
func _bewegung_senden() -> void:
	# Die Leiste des Spiels schaltet ihre eigene Zeigerabfrage immer wieder ein (nach Sperren der
	# Oberfläche, nach neuen Gegenständen). Sie bleibt aus; _leiste_nachfuehren() wendet dieselbe
	# Regel mit dem gesteuerten Zeiger an, solange die Oberfläche nicht gesperrt ist.
	if is_instance_valid(_leiste) and _leiste.is_processing_input():
		_leiste.set_process_input(false)
	var m := InputEventMouseMotion.new()
	var w: Vector2 = root.get_final_transform() * maus
	m.position = w
	m.global_position = w
	root.push_input(m)


func _maustaste(knopf: MouseButton, gedrueckt: bool, doppelt := false) -> void:
	var k := InputEventMouseButton.new()
	k.button_index = knopf
	k.pressed = gedrueckt
	k.double_click = doppelt and gedrueckt
	var w: Vector2 = root.get_final_transform() * maus
	k.position = w
	k.global_position = w
	if gedrueckt:
		k.button_mask = MOUSE_BUTTON_MASK_LEFT if knopf == MOUSE_BUTTON_LEFT else MOUSE_BUTTON_MASK_RIGHT
	root.push_input(k)


func _klick(knopf: MouseButton, doppelt := false) -> void:
	_maustaste(knopf, true, doppelt)
	await physics_frame
	await process_frame
	_maustaste(knopf, false)
	await physics_frame
	await process_frame


func _welt(p: Vector2) -> Vector2:
	return root.get_canvas_transform().affine_inverse() * p


## Inventarleiste: Das Spiel entscheidet in _input über get_global_mouse_position() (Zeiger des
## Betriebssystems), ob sie auf- oder zuklappt. Hier dieselbe Regel mit dem gesteuerten Zeiger.
func _leiste_finden() -> Control:
	if is_instance_valid(_leiste):
		return _leiste
	var kandidaten := root.find_children("*", "Control", true, false)
	for k in kandidaten:
		var s: Script = k.get_script()
		if s and s.resource_path.ends_with("simple_click_bar_custom.gd") or (s and s.resource_path.ends_with("simple_click_bar.gd")):
			_leiste = k
			return _leiste
	return null


func _leiste_nachfuehren() -> void:
	var l := _leiste_finden()
	if l == null or not l.is_visible_in_tree() or l.always_visible or _G().is_blocked:
		return
	var rect: Rect2 = l.panel_container.get_rect()
	rect.size += Vector2(0.0, l.input_zone_height)
	var drin := rect.has_point(maus)
	l._is_mouse_hover = drin
	if l._is_hidden and drin:
		l._open()
	elif not l._is_hidden and not drin:
		l._close()


## Laufziel: Raum und Boden-Hotspots laufen zu get_local/global_mouse_position() (Zeiger des
## Betriebssystems). Erkennt genau diese Läufe und schickt die Figur zum gesteuerten Zeiger.
func _spieler_verbinden() -> void:
	var C := _C()
	if C == null:
		return
	for name in ["Max", "Pixel", "Opa"]:
		var c = C.get_character(name) if C.has_method("get_character") else null
		if is_instance_valid(c) and not _verbunden.has(c.get_instance_id()):
			_verbunden[c.get_instance_id()] = true
			c.started_walk_to.connect(_lauf_begonnen)


var _korrigiere := false


func _lauf_begonnen(c, _start: Vector2, ziel: Vector2) -> void:
	if _korrigiere:
		return
	var r := _raum_knoten()
	if r == null or c != _spieler():
		return
	var falsch_lokal: Vector2 = r.get_local_mouse_position()
	var falsch_global: Vector2 = r.get_global_mouse_position()
	if ziel.distance_to(falsch_lokal) < 3.0 or ziel.distance_to(falsch_global) < 3.0:
		_lauf_korrigieren.call_deferred(c, r.to_local(_welt(maus)))


func _lauf_korrigieren(c, ziel: Vector2) -> void:
	if not is_instance_valid(c):
		return
	_korrigiere = true
	if c.is_moving:
		c.movement_ended.emit()
	c.walk(ziel)
	_korrigiere = false
	_ereignis("LÄUFT zum Zeiger, Raumpunkt (%d,%d)" % [ziel.x, ziel.y])


## Zeigerbild und Objektname sitzen im Spiel am Zeiger des Betriebssystems; für die Aufnahmen an
## den gesteuerten Zeiger setzen (nur Darstellung).
func _zeiger_zeichnen() -> void:
	var cur = Engine.get_singleton(&"Cursor") if Engine.has_singleton(&"Cursor") else null
	if cur and is_instance_valid(cur) and "main_cursor" in cur:
		cur.main_cursor.position = maus
		cur.secondary_cursor.position = maus
	for h in root.find_children("*", "Control", true, false):
		var s: Script = h.get_script()
		if s and s.resource_path.ends_with("hover_text_custom.gd") and h.visible and "label" in h:
			var p: Vector2 = maus + Vector2(0, 14)
			p.x = clampf(p.x - 100.0, 0.0, BILD.x - 200.0)
			p.y = minf(p.y, BILD.y - h.label.size.y - 2.0)
			h.label.position = p
			break


func _unter_zeiger() -> String:
	var teile: PackedStringArray = []
	var E := _E()
	var h = E.hovered if E else null
	if is_instance_valid(h):
		teile.append("%s „%s“" % [_objekt_kennung(h), tr(str(h.description))])
	var c := root.gui_get_hovered_control()
	if is_instance_valid(c) and c.mouse_filter != Control.MOUSE_FILTER_IGNORE:
		teile.append("Oberfläche %s" % _control_name(c))
	if teile.is_empty():
		return "nichts (freie Fläche)"
	return ", ".join(teile)


func _control_name(c: Control) -> String:
	if c is Button and not (c as Button).text.is_empty():
		return "Knopf „%s“" % (c as Button).text
	if "option" in c and c.option != null:
		return "Option „%s“" % str(c.option.text)
	if c.get_class() == "TextureRect" and "script_name" in c:
		return "Gegenstand %s" % str(c.script_name)
	return "%s (%s)" % [c.name, c.get_class()]
#endregion


#region Ziele ######################################################################################
## Ziel aus dem Befehlstext: "X Y", "@objekt" oder "inv:gegenstand". suchen = eine Stelle finden,
## an der das Objekt unter dem Zeiger gewinnt.
func _ziel(text: String, suchen: bool) -> Dictionary:
	text = text.strip_edges()
	if text.begins_with("@"):
		return await _objekt_ziel(text.substr(1).strip_edges(), suchen)
	if text.begins_with("inv:"):
		return await _inventar_ziel(text.substr(4).strip_edges())
	var z := text.split(" ", false)
	if z.size() >= 2 and z[0].is_valid_float() and z[1].is_valid_float():
		return {"punkt": Vector2(float(z[0]), float(z[1]))}
	return {"fehler": "Ziel fehlt: X Y, @objekt oder inv:gegenstand"}


func _objekt_kennung(o) -> String:
	if not is_instance_valid(o):
		return "?"
	if o.has_method("objekt_id"):
		return str(o.objekt_id())
	return str(o.script_name).to_snake_case()


func _objekt_art(o) -> String:
	if o is PopochiuCharacter:
		return "Figur"
	if o is PopochiuProp:
		return "Prop"
	var s: Script = o.get_script()
	if s and s.resource_path.contains("ausgang"):
		return "Ausgang"
	var b = s.get_base_script() if s else null
	if b and b.resource_path.contains("ausgang"):
		return "Ausgang"
	return "Hotspot"


func _klickbare() -> Array:
	var aus := []
	var r := _raum_knoten()
	if r == null:
		return aus
	for c in get_nodes_in_group("PopochiuClickable"):
		if c is PopochiuClickable and r.is_ancestor_of(c):
			aus.append(c)
	return aus


func _objekt_suchen(kennung: String) -> Array:
	var k := kennung.to_lower()
	var genau := []
	var aehnlich := []
	for c in _klickbare():
		var ids := [_objekt_kennung(c).to_lower(), str(c.script_name).to_lower(), str(c.script_name).to_snake_case()]
		if k in ids:
			genau.append(c)
		elif tr(str(c.description)).to_lower() == k:
			aehnlich.append(c)
	return genau if not genau.is_empty() else aehnlich


func _polygon_bild(o) -> PackedVector2Array:
	var pn := o.get_node_or_null("InteractionPolygon") as CollisionPolygon2D
	var aus := PackedVector2Array()
	if pn == null or pn.polygon.is_empty():
		return aus
	var xf: Transform2D = pn.get_global_transform_with_canvas()
	for p in pn.polygon:
		aus.append(xf * p)
	return aus


func _rechteck(poly: PackedVector2Array) -> Rect2:
	if poly.is_empty():
		return Rect2()
	var r := Rect2(poly[0], Vector2.ZERO)
	for p in poly:
		r = r.expand(p)
	return r


func _objekt_ziel(kennung: String, suchen: bool) -> Dictionary:
	var treffer := _objekt_suchen(kennung)
	if treffer.is_empty():
		return {"fehler": "kein Objekt „%s“ im Raum %s (Befehl objekte zeigt alle)" % [kennung, _raum_id()]}
	var o = treffer[0]
	for t in treffer:
		if t.is_visible_in_tree() and t.clickable:
			o = t
			break
	if not o.is_visible_in_tree():
		return {"fehler": "Objekt %s ist unsichtbar" % kennung}
	if not o.clickable:
		return {"fehler": "Objekt %s ist nicht anklickbar (clickable aus)" % kennung}
	var poly := _polygon_bild(o)
	if poly.is_empty():
		return {"fehler": "Objekt %s hat keine Klickfläche" % kennung}
	var r := _rechteck(poly)
	var sicht := Rect2(Vector2(1, 1), BILD - Vector2(2, 2))
	if not r.intersects(sicht):
		return {"fehler": "Objekt %s liegt außerhalb des Bildes (Bild-x %d bis %d, y %d bis %d; Kamera x=%d). Erst hinlaufen: Klick auf den Boden am Bildrand." % [kennung, r.position.x, r.end.x, r.position.y, r.end.y, _kamera_x()]}
	# Probepunkte: Mitte des Polygons, dann ein Raster über das Rechteck
	var punkte: Array = []
	var mitte := Vector2.ZERO
	for p in poly:
		mitte += p
	mitte /= poly.size()
	punkte.append(mitte)
	for iy in 5:
		for ix in 7:
			punkte.append(r.position + Vector2((ix + 0.5) / 7.0 * r.size.x, (iy + 0.5) / 5.0 * r.size.y))
	var gueltig: Array = []
	for p in punkte:
		if sicht.has_point(p) and Geometry2D.is_point_in_polygon(p, poly):
			gueltig.append(p)
	if gueltig.is_empty():
		return {"fehler": "Objekt %s: keine Stelle der Klickfläche liegt im Bild" % kennung}
	if not suchen:
		return {"punkt": gueltig[0]}
	var erster := Vector2.INF
	var zaehler := {}
	var eigene := 0
	var treffer_punkte: Array = []
	# Zone, in der die Inventarleiste aufklappt und sich über das Objekt legt (oberer Bildrand)
	var zone := Rect2()
	var l := _leiste_finden()
	if l != null and l.is_visible_in_tree() and not l.always_visible and not _G().is_blocked:
		zone = Rect2(Vector2(0, 0), Vector2(BILD.x, l.panel_container.size.y / 2.0 if l._is_hidden else l.panel_container.size.y))
		if l._is_hidden:
			zone.size.y = float(l.input_zone_height)
	await _bewege(Vector2(maus.x, maxf(maus.y, zone.size.y + 30.0)))
	if l != null and not l._is_hidden:
		await _spiel_warten(0.4)
	for p in gueltig:
		if zone.has_point(p):
			zaehler["Inventarleiste klappt auf"] = int(zaehler.get("Inventarleiste klappt auf", 0)) + 1
			continue
		await _bewege(p)
		var h = _E().hovered
		var c := root.gui_get_hovered_control()
		var ui: bool = is_instance_valid(c) and c.mouse_filter == Control.MOUSE_FILTER_STOP
		if h == o and not ui:
			eigene += 1
			treffer_punkte.append(p)
			if erster == Vector2.INF:
				erster = p
		else:
			var name := ("Oberfläche " + str(c.name)) if ui else (_objekt_kennung(h) if is_instance_valid(h) else "nichts")
			zaehler[name] = int(zaehler.get(name, 0)) + 1
	var info := "ZIEL @%s (%s „%s“), Klickfläche im Bild x %d–%d, y %d–%d; gewinnt an %d von %d Probestellen" % [
		_objekt_kennung(o), _objekt_art(o), tr(str(o.description)), r.position.x, r.end.x, r.position.y, r.end.y, eigene, gueltig.size()]
	if not zaehler.is_empty():
		var teile: PackedStringArray = []
		for k in zaehler:
			teile.append("%s %d" % [k, zaehler[k]])
		info += " (sonst: %s)" % ", ".join(teile)
	info += "\n"
	if erster == Vector2.INF:
		return {"fehler": info + "Objekt %s gewinnt an keiner Probestelle unter dem Zeiger: so nicht anklickbar." % kennung}
	# Die Trefferstelle noch einmal anfahren (der Zeiger kommt jetzt von der letzten Probestelle):
	# Gewinnt dann ein anderes Objekt, hängt das Ergebnis von der Mausrichtung ab.
	var wechsel: PackedStringArray = []
	for p in treffer_punkte:
		await _bewege(p)
		var h2 = _E().hovered
		if h2 == o:
			if not wechsel.is_empty():
				info += "ACHTUNG Mausrichtung: beim zweiten Anfahren gewann an %d Trefferstelle(n) ein anderes Objekt (%s)
" % [wechsel.size(), ", ".join(wechsel)]
			return {"punkt": p, "info": info}
		wechsel.append("(%d,%d): %s" % [p.x, p.y, _objekt_kennung(h2) if is_instance_valid(h2) else "nichts"])
	return {"fehler": info + "Objekt %s gewinnt beim zweiten Anfahren an keiner Trefferstelle mehr (%s): Ergebnis hängt von der Mausrichtung ab." % [kennung, ", ".join(wechsel)]}


func _inventar_knoten() -> Array:
	var aus := []
	for k in root.find_children("*", "Control", true, false):
		if k is PopochiuInventoryItem and k.is_visible_in_tree():
			aus.append(k)
	return aus


func _leiste_oeffnen() -> void:
	var l := _leiste_finden()
	if l == null:
		return
	if l._is_hidden:
		await _bewege(Vector2(320, 3))
		await _spiel_warten(0.7)


func _inventar_ziel(kennung: String) -> Dictionary:
	await _leiste_oeffnen()
	var k := kennung.to_lower()
	for n in _inventar_knoten():
		if _gegenstand_id(n).to_lower() == k or str(n.script_name).to_lower() == k or str(n.script_name).to_snake_case() == k:
			var r: Rect2 = n.get_global_rect()
			if not Rect2(Vector2.ZERO, BILD).has_point(r.get_center()):
				return {"fehler": "Gegenstand %s liegt außerhalb des sichtbaren Teils der Leiste (bei x %d)" % [kennung, r.get_center().x]}
			return {"punkt": r.get_center(), "info": "GEGENSTAND %s „%s“ in der Leiste bei (%d,%d)\n" % [_gegenstand_id(n), tr(str(n.description)), r.get_center().x, r.get_center().y]}
	return {"fehler": "Gegenstand „%s“ liegt nicht in der Leiste der aktiven Figur (Befehl inv)" % kennung}


func _inventar_liste() -> String:
	await _leiste_oeffnen()
	var aus: PackedStringArray = []
	var p := _spieler()
	aus.append("Inventarleiste (%s):" % (p.script_name if p else "-"))
	for n in _inventar_knoten():
		var r: Rect2 = n.get_global_rect()
		aus.append("  inv:%s  „%s“  bei (%d,%d) %dx%d" % [_gegenstand_id(n), tr(str(n.description)), r.get_center().x, r.get_center().y, r.size.x, r.size.y])
	var C := _C()
	for name in ["Max", "Pixel"]:
		var c = C.get_character(name)
		if is_instance_valid(c):
			var ids: PackedStringArray = []
			for sn in c.inventory.keys() if c.inventory is Dictionary else c.inventory:
				ids.append(str(_B().gegenstand(str(sn)).get("id", sn)))
			aus.append("  Besitz %s: %s" % [name, ", ".join(ids) if not ids.is_empty() else "-"])
	var I := _I()
	aus.append("  In der Hand: %s" % (_gegenstand_id(I.active) if is_instance_valid(I.active) else "-"))
	return "\n".join(aus)
#endregion


#region Gespräche und Knöpfe #######################################################################
func _optionen() -> Array:
	var aus := []
	for k in root.find_children("*", "Control", true, false):
		if "option" in k and "handler" in k and k.is_visible_in_tree() and k.option != null:
			aus.append(k)
	return aus


func _menue_feld(k: Control) -> Rect2:
	# sichtbarer Bereich des Menüs (Rollbereich), damit erkennbar ist, ob eine Option erst nach Rollen sichtbar wird
	var n: Node = k.get_parent()
	while n != null:
		if n is ScrollContainer:
			return (n as Control).get_global_rect()
		n = n.get_parent()
	return Rect2(Vector2.ZERO, BILD)


func _optionen_liste() -> String:
	var opts := _optionen()
	if opts.is_empty():
		return "Keine Gesprächs- oder Auswahlzeilen offen."
	var aus: PackedStringArray = []
	var d = _D().current_dialog
	aus.append("Optionen%s:" % ((" im Gespräch " + str(d.script_name)) if is_instance_valid(d) else " (Auswahl)"))
	var i := 1
	for k in opts:
		var r: Rect2 = k.get_global_rect()
		var feld := _menue_feld(k)
		var sichtbar := feld.grow(1.0).encloses(r)
		aus.append("  %d  [%s]%s%s  „%s“" % [i, str(k.option.id), " (schon gewählt)" if k.option.used else "", "" if sichtbar else " (erst nach Rollen sichtbar)", tr(str(k.option.text))])
		i += 1
	return "\n".join(aus)


func _option_waehlen(text: String) -> String:
	var opts := _optionen()
	if opts.is_empty():
		return "FEHLER keine Optionen offen (LAGE %s)" % _lage()
	var wahl: Control = null
	var t := text.strip_edges().trim_prefix("\"").trim_suffix("\"")
	if t.is_valid_int() and int(t) >= 1 and int(t) <= opts.size():
		wahl = opts[int(t) - 1]
	for k in opts:
		if wahl == null and str(k.option.id).to_lower() == t.to_lower():
			wahl = k
	for k in opts:
		if wahl == null and tr(str(k.option.text)).to_lower().contains(t.to_lower()):
			wahl = k
	if wahl == null:
		return "FEHLER Option „%s“ nicht gefunden\n%s" % [t, _optionen_liste()]
	var gerollt := 0
	var feld := _menue_feld(wahl)
	while not feld.grow(1.0).encloses(wahl.get_global_rect()) and gerollt < 40:
		await _bewege(feld.get_center())
		var runter: bool = wahl.get_global_rect().position.y >= feld.position.y
		_maustaste(MOUSE_BUTTON_WHEEL_DOWN if runter else MOUSE_BUTTON_WHEEL_UP, true)
		_maustaste(MOUSE_BUTTON_WHEEL_DOWN if runter else MOUSE_BUTTON_WHEEL_UP, false)
		await process_frame
		await process_frame
		gerollt += 1
	var r := wahl.get_global_rect()
	_ereignis("OPTION [%s] „%s“ angeklickt bei (%d,%d)%s" % [str(wahl.option.id), tr(str(wahl.option.text)), r.get_center().x, r.get_center().y, (" nach %d Rollschritten" % gerollt) if gerollt > 0 else ""])
	await _bewege(r.get_center())
	await _klick(MOUSE_BUTTON_LEFT)
	return ""


func _knoepfe() -> Array:
	var aus := []
	for k in root.find_children("*", "BaseButton", true, false):
		if not k.is_visible_in_tree() or k.disabled or "option" in k or (k.get_parent() != null and "option" in k.get_parent()):
			continue
		if k is PopochiuInventoryItem:
			continue
		var r: Rect2 = k.get_global_rect()
		if not Rect2(Vector2.ZERO, BILD).intersects(r):
			continue
		aus.append(k)
	return aus


func _knopf_text(k: BaseButton) -> String:
	if k is Button and not (k as Button).text.is_empty():
		return (k as Button).text
	if not k.tooltip_text.is_empty():
		return k.tooltip_text
	return str(k.name)


func _knoepfe_liste() -> String:
	var aus: PackedStringArray = ["Sichtbare Knöpfe:"]
	for k in _knoepfe():
		var r: Rect2 = k.get_global_rect()
		aus.append("  „%s“  bei (%d,%d) %dx%d%s" % [_knopf_text(k), r.get_center().x, r.get_center().y, r.size.x, r.size.y, " [Fokus]" if k.has_focus() else ""])
	return "\n".join(aus)


func _knopf_druecken(text: String) -> String:
	var t := text.strip_edges().trim_prefix("\"").trim_suffix("\"").to_lower()
	var wahl: BaseButton = null
	for k in _knoepfe():
		if _knopf_text(k).to_lower() == t:
			wahl = k
	for k in _knoepfe():
		if wahl == null and _knopf_text(k).to_lower().contains(t):
			wahl = k
	if wahl == null:
		return "FEHLER Knopf „%s“ nicht gefunden\n%s" % [text, _knoepfe_liste()]
	var r := wahl.get_global_rect()
	await _bewege(r.get_center().clamp(Vector2(1, 1), BILD - Vector2(2, 2)))
	var c := root.gui_get_hovered_control()
	var info := "KLICK Knopf „%s“ bei (%d,%d)" % [_knopf_text(wahl), maus.x, maus.y]
	if c != wahl and not (is_instance_valid(c) and wahl.is_ancestor_of(c)):
		info += " (unter dem Zeiger liegt aber: %s)" % (_control_name(c) if is_instance_valid(c) else "nichts")
	await _klick(MOUSE_BUTTON_LEFT)
	return info


const TASTEN := {
	"esc": KEY_ESCAPE, "tab": KEY_TAB, "leer": KEY_SPACE, "enter": KEY_ENTER, "f5": KEY_F5, "f9": KEY_F9,
	"hoch": KEY_UP, "runter": KEY_DOWN, "links": KEY_LEFT, "rechts": KEY_RIGHT, "shift": KEY_SHIFT,
	"a": KEY_A, "d": KEY_D, "w": KEY_W, "s": KEY_S, "x": KEY_X, "y": KEY_Y, "n": KEY_N, "j": KEY_J,
	"1": KEY_1, "2": KEY_2, "3": KEY_3, "4": KEY_4, "f1": KEY_F1, "f11": KEY_F11, "punkt": KEY_PERIOD,
}


func _taste(teile: PackedStringArray) -> String:
	if teile.size() < 2:
		return "FEHLER Taste fehlt"
	var art := "tipp"
	var name := teile[1].to_lower()
	if name in ["halten", "los"] and teile.size() > 2:
		art = name
		name = teile[2].to_lower()
	if not TASTEN.has(name):
		return "FEHLER Taste „%s“ unbekannt (%s)" % [name, ", ".join(TASTEN.keys())]
	if art != "los":
		_tastenereignis(TASTEN[name], true)
		await process_frame
		await process_frame
	if art != "halten":
		_tastenereignis(TASTEN[name], false)
		await process_frame
	return ""


func _tastenereignis(code: Key, gedrueckt: bool) -> void:
	var e := InputEventKey.new()
	e.keycode = code
	e.physical_keycode = code
	e.pressed = gedrueckt
	Input.parse_input_event(e)
#endregion


#region Warten #####################################################################################
func _ueberlagerung() -> String:
	var S := _S()
	for k in S.get_children():
		if not (k is CanvasLayer) or k == S.hud or not k.visible:
			continue
		var s: Script = k.get_script()
		var pfad := s.resource_path if s else ""
		if pfad.contains("nahansicht"):
			return "nahansicht"
		if pfad.contains("notizbuch") or k.name == "Notizbuch":
			return "notizbuch"
		if pfad.contains("reisetasche"):
			return "reisetasche"
		if k.name == "Minispiel" or pfad.contains("minispiel"):
			return "minispiel"
		if pfad.contains("pausemenue"):
			return "pause"
	var r = S.regeln() if S.has_method("regeln") else null
	if r != null and "_code_wahl" in r and r._code_wahl != null and is_instance_valid(r._code_wahl):
		return "code_sicht"
	var tel := _n("Telemetrie")
	if tel and "_frage" in tel and is_instance_valid(tel._frage):
		return "telemetrie_frage"
	return ""


func _systemtext_offen() -> bool:
	for k in root.find_children("*", "Control", true, false):
		var s: Script = k.get_script()
		if s and s.resource_path.contains("system_text") and k.is_visible_in_tree():
			return true
	return false


func _lage() -> String:
	if paused:
		return "pause"
	var cs := current_scene
	if is_instance_valid(cs) and cs.scene_file_path == HAUPTMENUE:
		return "hauptmenue"
	var E := _E()
	var G := _G()
	if G and is_instance_valid(G.gui) and G.gui.is_showing_dialog_line:
		return "text"
	if _raum_knoten() == null or not E.in_room:
		return "beschaeftigt"
	if _systemtext_offen():
		return "text"
	var ue := _ueberlagerung()
	if not ue.is_empty():
		return "ueberlagerung:" + ue
	if not _optionen().is_empty():
		return "menue"
	var p := _spieler()
	if E.playing_queue or _S().in_szene > 0 or G.is_blocked or is_instance_valid(_D().current_dialog) \
			or E.clicked != null or (p and p.is_moving):
		return "beschaeftigt"
	return "frei"


func _lage_diagnose() -> String:
	var E := _E()
	var p := _spieler()
	return "in_room=%s playing_queue=%s in_szene=%s G.blocked=%s dialog=%s clicked=%s laeuft=%s zuletzt gesagt=%s" % [
		E.in_room, E.playing_queue, _S().in_szene, _G().is_blocked,
		str(_D().current_dialog.script_name) if is_instance_valid(_D().current_dialog) else "-",
		_objekt_kennung(E.clicked) if E.clicked != null else "-", p.is_moving if p else "-", _zuletzt_gesagt]


func _bewegung_merken() -> void:
	var r := _raum_knoten()
	if r == null:
		return
	for c in r.get_characters() if r.has_method("get_characters") else []:
		var id: int = c.get_instance_id()
		if not _pos_merk.has(id) or (_pos_merk[id] as Vector2).distance_to(c.global_position) > 0.5:
			_pos_merk[id] = c.global_position
			_fortschritt_t = _t


## Wartet, bis das Spiel wieder auf den Spieler wartet (frei, Menü, Überlagerung) oder hängt.
## Textzeilen werden je nach Textmodus weitergeklickt (klick: sofort, lesen: nach Lesezeit).
func _ruhe(max_s := 180.0, ohne_textklick := false) -> void:
	var t0 := _t
	_fortschritt_t = _t
	var art_vorher := ""
	var stabil_seit := _t
	var bilder_stabil := 0
	var raum_vorher := _raum
	while true:
		await process_frame
		var rid := _raum_id()
		if rid != _raum and not rid.is_empty():
			_ereignis("RAUM %s (vorher %s)" % [rid, _raum if not _raum.is_empty() else "-"])
			_raum = rid
		_bewegung_merken()
		var art := _lage()
		if art != art_vorher:
			art_vorher = art
			stabil_seit = _t
			bilder_stabil = 0
			if art == "text":
				_zeile_t = _t
		bilder_stabil += 1
		if art == "text":
			_fortschritt_t = maxf(_fortschritt_t, _zeile_t)
			if not ohne_textklick and textmodus != "nie":
				var warte := 0.12
				if textmodus == "lesen":
					var n := tr(_zuletzt_gesagt).length()
					warte = n * float(_E().text_speed) + clampf(n * 0.055, 1.2, 7.0)
				if _t - _zeile_t >= warte and bilder_stabil >= 3:
					await _klick(MOUSE_BUTTON_LEFT)
					_zeile_t = _t
					bilder_stabil = 0
					_fortschritt_t = _t
			elif _t - stabil_seit > 0.4 and bilder_stabil >= 8 and (ohne_textklick or textmodus == "nie"):
				return
		elif art != "beschaeftigt":
			if _t - stabil_seit >= 0.35 and bilder_stabil >= 8:
				return
		if _t - t0 > max_s:
			_ereignis("ZEITÜBERSCHREITUNG nach %.0f Spielsekunden: %s" % [max_s, _lage_diagnose()])
			return
		if art == "beschaeftigt" and _t - _fortschritt_t > 20.0:
			_ereignis("STEHT seit 20 Spielsekunden ohne Fortschritt (kein Text, keine Bewegung, kein Ereignis): %s" % _lage_diagnose())
			return
#endregion


#region Auskunft ###################################################################################
func _status() -> String:
	var aus: PackedStringArray = []
	aus.append(_lage_zeile())
	var Z := _Z()
	aus.append("Abschnitt %s | Spielzeit %.0f s | Sprache %s | Textmodus %s | Tempo %s" % [Z.abschnitt, Z.spielzeit, TranslationServer.get_locale(), textmodus, tempo])
	var r := _raum_knoten()
	if r:
		var figs: PackedStringArray = []
		for c in r.get_characters():
			var b := _rechteck(_polygon_bild(c))
			figs.append("%s bei Raum (%d,%d) Bild-x %d, Skala %.2f%s" % [c.script_name, c.global_position.x, c.global_position.y, (c.get_global_transform_with_canvas().origin).x, absf(c.scale.y), "" if c.visible else " (unsichtbar)"])
			if b.size == Vector2.ZERO:
				pass
		aus.append("Figuren im Raum: " + "; ".join(figs))
		aus.append("Raumbreite %s px" % str(r.width if "width" in r else "?"))
	aus.append("Pfote: %s%s" % ["aktiv" if _H().pfote_aktiv() else "aus", ", leuchtet" if _H().leuchtet() else ""])
	aus.append("Wechsel möglich: %s" % _S().wechsel_moeglich())
	var offen: PackedStringArray = []
	for s in Z.offene_schritte():
		offen.append(str(s))
	aus.append("Offene Rätselschritte (laut Spiel): %s" % (", ".join(offen) if not offen.is_empty() else "-"))
	var an: PackedStringArray = []
	for k in Z.schalter:
		if Z.schalter[k]:
			an.append(str(k))
	an.sort()
	aus.append("Gesetzte Schalter: %s" % ", ".join(an))
	var w: PackedStringArray = []
	for k in Z.werte:
		w.append("%s=%s" % [k, str(Z.werte[k])])
	aus.append("Werte: %s" % ", ".join(w))
	if not _optionen().is_empty():
		aus.append(_optionen_liste())
	return "\n".join(aus)


func _objekte_liste() -> String:
	var aus: PackedStringArray = []
	var sicht := Rect2(Vector2.ZERO, BILD)
	aus.append("Objekte im Raum %s (Kamera x=%d). Bildkoordinaten der Klickfläche:" % [_raum_id(), _kamera_x()])
	var liste := _klickbare()
	liste.sort_custom(func(a, b): return _rechteck(_polygon_bild(a)).position.x < _rechteck(_polygon_bild(b)).position.x)
	for c in liste:
		var r := _rechteck(_polygon_bild(c))
		var wo := "x %d–%d, y %d–%d" % [r.position.x, r.end.x, r.position.y, r.end.y]
		var zusatz := ""
		if not c.is_visible_in_tree():
			zusatz += " (unsichtbar)"
		if not c.clickable:
			zusatz += " (nicht anklickbar)"
		if not r.intersects(sicht):
			zusatz += " (außerhalb des Bildes)"
		if c == _spieler():
			zusatz += " (Spielfigur)"
		aus.append("  @%s  %s  „%s“  %s%s" % [_objekt_kennung(c), _objekt_art(c), tr(str(c.description)), wo, zusatz])
	return "\n".join(aus)


func _lies(ausdruck: String) -> String:
	var ex := Expression.new()
	var namen := ["S", "Z", "E", "R", "C", "I", "D", "G", "B", "H", "T"]
	var f := ex.parse(ausdruck, namen)
	if f != OK:
		return "FEHLER Ausdruck: %s" % ex.get_error_text()
	var w = ex.execute([_S(), _Z(), _E(), _R(), _C(), _I(), _D(), _G(), _B(), _H(), self], self)
	if ex.has_execute_failed():
		return "FEHLER beim Auswerten: %s" % ex.get_error_text()
	return "= %s" % str(w)
#endregion


#region Bilder #####################################################################################
func _bild_holen() -> Image:
	await RenderingServer.frame_post_draw
	var img := root.get_texture().get_image()
	return img


func _foto(teile: PackedStringArray) -> String:
	if teile.size() < 2:
		return "FEHLER Name fehlt"
	var name := teile[1]
	var voll := false
	var zahlen: Array = []
	for i in range(2, teile.size()):
		if teile[i] == "voll":
			voll = true
		elif teile[i].is_valid_float():
			zahlen.append(float(teile[i]))
	var img: Image = await _bild_holen()
	if img == null or img.is_empty():
		return "FEHLER kein Bild (headless?)"
	var f := float(img.get_width()) / BILD.x
	if zahlen.size() == 4:
		var aus := Rect2i(int(zahlen[0] * f), int(zahlen[1] * f), int(zahlen[2] * f), int(zahlen[3] * f)).intersection(Rect2i(0, 0, img.get_width(), img.get_height()))
		img = img.get_region(aus)
	if not voll and f > 1.0:
		img.resize(int(round(img.get_width() / f)), int(round(img.get_height() / f)), Image.INTERPOLATE_LANCZOS)
	var pfad := ordner + "fotos/" + name + ".png"
	DirAccess.make_dir_recursive_absolute(pfad.get_base_dir())
	img.save_png(pfad)
	return "FOTO %s (%dx%d)" % [pfad, img.get_width(), img.get_height()]


func _film_befehl(teile: PackedStringArray) -> String:
	if teile.size() >= 3 and teile[1] == "an":
		_film = teile[2]
		_film_fps = float(teile[3]) if teile.size() > 3 else 10.0
		_film_bild = 0
		_film_naechstes = _t
		_film_tempo = tempo
		Engine.time_scale = 1.0
		DirAccess.make_dir_recursive_absolute(ordner + "filme/" + _film)
		return "FILM läuft: %s mit %s Bildern je Sekunde, Tempo 1" % [_film, _film_fps]
	if teile.size() >= 2 and teile[1] == "aus":
		var name := _film
		_film = ""
		Engine.time_scale = _film_tempo
		_datei_schreiben(ordner + "filme/" + name + "/fps.txt", str(_film_fps))
		return "FILM aus: %d Bilder in %sfilme/%s/ (GIF mit gif_bauen.py)" % [_film_bild, ordner, name]
	return "FEHLER film an NAME [fps] | film aus"


func _film_aufnehmen() -> void:
	var img := root.get_texture().get_image()
	if img == null or img.is_empty():
		return
	var f := float(img.get_width()) / BILD.x
	if f > 1.0:
		img.resize(int(BILD.x), int(BILD.y), Image.INTERPOLATE_BILINEAR)
	_film_bild += 1
	img.save_png(ordner + "filme/%s/b_%04d.png" % [_film, _film_bild])
#endregion


#region Start und Kontrollpunkte ###################################################################
func _im_spiel() -> bool:
	return _raum_knoten() != null and _E().in_room


func _spiel_laden_raum() -> void:
	if _im_spiel():
		return
	change_scene_to_file(STARTRAUM)
	var bis := Time.get_ticks_msec() + 20000
	while not _im_spiel() and Time.get_ticks_msec() < bis:
		await process_frame


func _start(teile: PackedStringArray) -> String:
	if teile.size() < 2:
		return "FEHLER start hauptmenue|prolog|welt-1|welt-2|welt-3|welt-4|zs N"
	var ziel := teile[1].to_lower()
	var S := _S()
	match ziel:
		"hauptmenue":
			change_scene_to_file(HAUPTMENUE)
			await _echt_warten(0.5)
			return ""
		"prolog":
			if _im_spiel():
				return "FEHLER Prolog nur aus dem Hauptmenü (start hauptmenue, dann Knopf „Neues Spiel“ oder start prolog)"
			S.start_platz = -1
			change_scene_to_file(STARTRAUM)
			_ereignis("START Prolog (wie „Neues Spiel“)")
			await _echt_warten(0.5)
			return ""
		"zs":
			if teile.size() < 3:
				return "FEHLER zs 1|2|3"
			await _vorlauf_ueberspringen()
			_ereignis("START Zwischenspiel %s (Spiel.zwischenspiel_beginnen)" % teile[2])
			S.zwischenspiel_beginnen(int(teile[2]))
			await _echt_warten(0.5)
			return ""
		_:
			if not _B().plaene.has(ziel) or ziel == "prolog":
				return "FEHLER Abschnitt „%s“ unbekannt" % ziel
			await _vorlauf_ueberspringen()
			_ereignis("START %s (Spiel.welt_beginnen, Inventar wie vom Spiel für den Weltanfang vorgesehen)" % ziel)
			S.welt_beginnen(ziel)
			await _echt_warten(0.5)
			return ""


## Für den direkten Start einer Welt: Startraum laden und die Prolog-Eröffnung im Testmodus
## durchlaufen lassen, damit keine Prolog-Szene in die Welt hineinläuft. Danach Testmodus aus.
func _vorlauf_ueberspringen() -> void:
	var S := _S()
	if not _im_spiel():
		S.testmodus = true
		S.start_platz = -1
		change_scene_to_file(STARTRAUM)
		var bis := Time.get_ticks_msec() + 20000
		while not _im_spiel() and Time.get_ticks_msec() < bis:
			await process_frame
		bis = Time.get_ticks_msec() + 20000
		while (S.in_szene > 0 or _E().playing_queue) and Time.get_ticks_msec() < bis:
			await process_frame
		for i in 10:
			await process_frame
		S.in_szene = 0
		S.testmodus = false
		S.protokoll.clear()
		_ereignisse.clear()


func _stand(teile: PackedStringArray) -> String:
	var sp := _n("Spielstand")
	var ablage := ordner + "staende/"
	DirAccess.make_dir_recursive_absolute(ablage)
	if teile.size() >= 2 and teile[1] == "liste":
		var namen: PackedStringArray = []
		for f in DirAccess.get_files_at(ablage):
			if f.ends_with(".json"):
				namen.append(f.trim_suffix(".json"))
		return "Kontrollpunkte: %s" % (", ".join(namen) if not namen.is_empty() else "-")
	if teile.size() < 3:
		return "FEHLER stand sichern NAME | stand holen NAME | stand liste"
	var name := teile[2]
	var quelle := ProjectSettings.globalize_path(CQSaveLoad.platz_pfad(CHECKPOINT_PLATZ))
	if teile[1] == "sichern":
		if not _im_spiel():
			return "FEHLER kein Raum offen"
		if sp.beschaeftigt():
			return "FEHLER Spiel ist beschäftigt (Szene, Gespräch): %s" % _lage_diagnose()
		if not sp.speichern(CHECKPOINT_PLATZ, "r5 " + name):
			return "FEHLER Speichern abgelehnt"
		await process_frame
		DirAccess.copy_absolute(quelle, ablage + name + ".json")
		return "KONTROLLPUNKT %s gesichert (Raum %s, über Spielstand.speichern auf Platz %d)" % [name, _raum_id(), CHECKPOINT_PLATZ]
	if teile[1] == "holen":
		if not FileAccess.file_exists(ablage + name + ".json"):
			return "FEHLER Kontrollpunkt %s fehlt" % name
		DirAccess.make_dir_recursive_absolute(quelle.get_base_dir())
		DirAccess.copy_absolute(ablage + name + ".json", quelle)
		var S := _S()
		if _im_spiel() and sp.beschaeftigt():
			return "FEHLER Spiel ist beschäftigt (%s). Das Spiel selbst lässt Laden jetzt nicht zu. Für einen sauberen Stand: Fernsteuerung beenden und neu starten (fs.py stop / start), dann im Hauptmenü stand holen %s." % [_lage_diagnose(), name]
		if not _im_spiel():
			S.start_platz = CHECKPOINT_PLATZ
			change_scene_to_file(STARTRAUM)
		else:
			sp.laden(CHECKPOINT_PLATZ)
		await _echt_warten(1.0)
		var bis := Time.get_ticks_msec() + 30000
		while (not _im_spiel() or sp.beschaeftigt()) and Time.get_ticks_msec() < bis:
			await process_frame
		_raum = ""
		await _ruhe(60.0)
		return "KONTROLLPUNKT %s geladen\n%s" % [name, _bericht(_t)]
	return "FEHLER stand sichern NAME | stand holen NAME | stand liste"
#endregion
