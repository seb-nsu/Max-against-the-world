extends Node
## Autoload „Controller“: Spielen mit Gamepad und Steam Deck (05-spielsysteme.md, Controller).
##
## Zwei Arten, je nachdem, was gerade offen ist:
## - Menüs (Hauptmenü, Pausemenü, Optionen, Spielstände, Errungenschaften): Godots Fokus.
##   Steuerkreuz und linker Stick wählen, A bestätigt, B geht zurück, LB/RB wechseln Reiter.
## - Im Spiel ein Zeiger: Der linke Stick bewegt ihn, über Hotspots wird er langsamer und rastet
##   beim Loslassen auf dem nächsten ein; das Steuerkreuz springt zum nächsten Hotspot in der
##   Richtung. A wie Linksklick (benutzen, gehen, reden, Text weiter), B wie Rechtsklick
##   (ansehen, Gegenstand ablegen), LB Figur wechseln, RB Inventarleiste und zurück,
##   X oder linker Trigger halten: Hotspots zeigen, Y Hilfe-Pfote, Start Pausemenü und
##   Zwischensequenz überspringen.
##
## Der Zeiger ist die Maus: Er wird mit warp_mouse bewegt, Klicks gehen als Mausereignisse an
## den Viewport. So gilt für Popochiu, Inventar, Gespräche und Überlagerungen dieselbe Logik wie
## mit der Maus, und eine echte Mausbewegung schaltet sofort zurück.

## Tasten für vorhandene Aktionen (bleiben bei neu belegten Tasten erhalten, Einstellungen
## ersetzt nur Tastatur-Tasten)
const BELEGUNG := {
	"cq_pause": [JOY_BUTTON_START],
	"popochiu-skip": [JOY_BUTTON_START],
	"cq_figur_wechseln": [JOY_BUTTON_LEFT_SHOULDER],
	"cq_hotspots_zeigen": [JOY_BUTTON_X],
	"cq_reiter_zurueck": [JOY_BUTTON_LEFT_SHOULDER],
	"cq_reiter_vor": [JOY_BUTTON_RIGHT_SHOULDER],
}
## Achsen (Trigger), die wie ein Knopf wirken
const ACHSEN := {"cq_hotspots_zeigen": [JOY_AXIS_TRIGGER_LEFT]}
## Zeiger: Pixel je Sekunde bei vollem Ausschlag (Grundauflösung 640×360)
const TEMPO := 253.0
## Über einem Hotspot so viel langsamer
const BREMSE := 0.45
## Einrasten im Umkreis (Pixel)
const MAGNET := 24.0
const TOTZONE := 0.2
## Inventarleiste oben (05-spielsysteme.md, Bildschirmaufbau)
const LEISTE_HOEHE := 64.0

## Controller zuletzt benutzt (sonst Maus und Tastatur)
var aktiv := false
## Zeigerposition in Viewport-Koordinaten
var zeiger := Vector2(320, 213)

## Gerätenummer der eigenen Mausereignisse (eine echte Maus hat 0)
const GERAET := 99

var _vor_inventar := Vector2(-1, -1)
var _stick_bewegt := false
var _ziele: Array = []
var _ziele_alter := INF
var _warp_ms := -100000


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	belegen()
	# Zurücksetzen der Optionen lädt die Eingaben neu aus project.godot
	Einstellungen.geaendert.connect(func(_k): belegen())


## Ergänzt die Controller-Tasten in der InputMap; mehrfacher Aufruf schadet nicht.
func belegen() -> void:
	for aktion in BELEGUNG:
		if not InputMap.has_action(aktion):
			InputMap.add_action(aktion, 0.5)
		for taste in BELEGUNG[aktion]:
			var knopf := InputEventJoypadButton.new()
			knopf.button_index = taste
			_ergaenzen(aktion, knopf)
		for a in ACHSEN.get(aktion, []):
			var achse := InputEventJoypadMotion.new()
			achse.axis = a
			achse.axis_value = 1.0
			_ergaenzen(aktion, achse)


func _ergaenzen(aktion: String, e: InputEvent) -> void:
	e.device = -1
	if not InputMap.action_has_event(aktion, e):
		InputMap.action_add_event(aktion, e)


#region Eingabe ####################################################################################
func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton or (event is InputEventJoypadMotion and absf(event.axis_value) > 0.5):
		if not aktiv:
			aktiv = true
			zeiger = get_viewport().get_mouse_position()
	elif event is InputEventMouseMotion and event.device != GERAET:
		# Das Echo von warp_mouse kann einen Frame später kommen: kurz nach dem Bewegen zählt
		# nur eine deutliche Bewegung als echte Maus.
		var spanne := 4.0 if Time.get_ticks_msec() - _warp_ms > 150 else 12.0
		if aktiv and event.position.distance_to(zeiger) > spanne:
			aktiv = false
		return
	else:
		return
	if menue_offen() or not (event is InputEventJoypadButton):
		return
	var b: InputEventJoypadButton = event
	match b.button_index:
		JOY_BUTTON_A:
			_klick(MOUSE_BUTTON_LEFT, b.pressed)
		JOY_BUTTON_B:
			# Rechtsklick, und als ui_cancel schließt B zugleich Notizbuch und Nahansicht
			_klick(MOUSE_BUTTON_RIGHT, b.pressed)
			return
		JOY_BUTTON_DPAD_UP:
			if b.pressed: springen(Vector2.UP)
		JOY_BUTTON_DPAD_DOWN:
			if b.pressed: springen(Vector2.DOWN)
		JOY_BUTTON_DPAD_LEFT:
			if b.pressed: springen(Vector2.LEFT)
		JOY_BUTTON_DPAD_RIGHT:
			if b.pressed: springen(Vector2.RIGHT)
		JOY_BUTTON_RIGHT_SHOULDER:
			if b.pressed: inventar_umschalten()
		JOY_BUTTON_Y:
			if b.pressed and is_instance_valid(Spiel.hud) and Spiel.hud.has_method("pfote_druecken"):
				Spiel.hud.pfote_druecken()
		_:
			return
	get_viewport().set_input_as_handled()


func _process(delta: float) -> void:
	_ziele_alter += delta
	if not aktiv or menue_offen():
		return
	# Nur der Stick bewegt; das Steuerkreuz springt (siehe _input)
	var stick := Vector2.ZERO
	for geraet in Input.get_connected_joypads():
		var s := Vector2(Input.get_joy_axis(geraet, JOY_AXIS_LEFT_X), Input.get_joy_axis(geraet, JOY_AXIS_LEFT_Y))
		if s.length() > stick.length():
			stick = s
	if stick.length() < TOTZONE:
		if _stick_bewegt:
			_stick_bewegt = false
			var nah := naechstes_ziel(zeiger, MAGNET)
			if nah.x >= 0:
				zeiger_setzen(nah)
		return
	_stick_bewegt = true
	var staerke := (stick.length() - TOTZONE) / (1.0 - TOTZONE)
	var tempo := TEMPO * staerke * staerke
	if naechstes_ziel(zeiger, 6.0).x >= 0:
		tempo *= BREMSE
	zeiger_setzen(zeiger + stick.normalized() * tempo * delta)


## Menüs mit Fokus bedienen sich über Godots ui_*-Aktionen, nicht über den Zeiger.
func menue_offen() -> bool:
	var f := get_viewport().gui_get_focus_owner()
	if f == null or not f.is_visible_in_tree():
		return false
	if get_tree().paused:
		return true
	var ebene := _ebene(f)
	return ebene != null and ebene.layer >= 20


func _ebene(n: Node) -> CanvasLayer:
	while n != null:
		if n is CanvasLayer:
			return n
		n = n.get_parent()
	return null


#endregion

#region Zeiger #####################################################################################
func zeiger_setzen(pos: Vector2) -> void:
	var groesse := get_viewport().get_visible_rect().size
	zeiger = pos.clamp(Vector2.ZERO, groesse - Vector2.ONE)
	if DisplayServer.get_name() != "headless":
		get_viewport().warp_mouse(zeiger)
	var m := InputEventMouseMotion.new()
	m.position = zeiger
	m.global_position = zeiger
	_senden(m)
	_warp_ms = Time.get_ticks_msec()


func _klick(knopf: MouseButton, gedrueckt: bool) -> void:
	var k := InputEventMouseButton.new()
	k.button_index = knopf
	k.pressed = gedrueckt
	k.position = zeiger
	k.global_position = zeiger
	if gedrueckt:
		k.button_mask = MOUSE_BUTTON_MASK_LEFT if knopf == MOUSE_BUTTON_LEFT else MOUSE_BUTTON_MASK_RIGHT
	_senden(k)


## Erst nach der laufenden Eingabe, damit die Ereignisse nicht ineinander laufen.
func _senden(e: InputEventMouse) -> void:
	e.device = GERAET
	get_viewport().push_input.call_deferred(e, true)


## Zum nächsten Ziel in Richtung r (Steuerkreuz). Bevorzugt nahe Ziele, die genau in der
## Richtung liegen.
func springen(r: Vector2) -> void:
	_ziele_alter = INF  # die Inventarleiste kann inzwischen auf- oder zugeklappt sein
	var bestes := Vector2(-1, -1)
	var beste_wertung := INF
	for z in ziele():
		var v: Vector2 = z - zeiger
		if v.length() < 2.0:
			continue
		var winkel := v.normalized().dot(r)
		if winkel < 0.4:
			continue
		var wertung := v.length() * (1.0 + 2.5 * (1.0 - winkel))
		if wertung < beste_wertung:
			beste_wertung = wertung
			bestes = z
	if bestes.x >= 0:
		zeiger_setzen(bestes)


## RB: in die Inventarleiste (sie klappt auf, sobald der Zeiger oben ist) und wieder zurück.
func inventar_umschalten() -> void:
	_ziele_alter = INF
	if zeiger.y > LEISTE_HOEHE:
		_vor_inventar = zeiger
		var oben := ziele().filter(func(z): return z.y < LEISTE_HOEHE and z.x > 107 and z.x < 573)
		oben.sort_custom(func(a, b): return a.x < b.x)
		zeiger_setzen(oben[0] if not oben.is_empty() else Vector2(160, LEISTE_HOEHE / 2))
	else:
		zeiger_setzen(_vor_inventar if _vor_inventar.x >= 0 else Vector2(320, 213))


func naechstes_ziel(pos: Vector2, umkreis: float) -> Vector2:
	var bestes := Vector2(-1, -1)
	var abstand := umkreis
	for z in ziele():
		var d := pos.distance_to(z)
		if d <= abstand:
			abstand = d
			bestes = z
	return bestes


## Alles, was man gerade anklicken kann, als Punkte in Viewport-Koordinaten:
## - Gesprächsauswahl offen: nur deren Zeilen
## - sonst Knöpfe und Gegenstände der Oberflächen (Leiste, Porträts, Pfote, Überlagerungen)
## - und, solange keine Überlagerung offen ist, die Hotspots, Props und Figuren des Raums
## Für das Einrasten beim Bewegen höchstens fünfmal je Sekunde neu gesammelt.
func ziele() -> Array:
	if _ziele_alter > 0.2:
		_ziele = ziele_sammeln()
		_ziele_alter = 0.0
	return _ziele


func ziele_sammeln() -> Array:
	var optionen := []
	var knoepfe := []
	_sammeln(get_tree().root, optionen, knoepfe)
	if not optionen.is_empty():
		return optionen
	var out := []
	var sicht := get_viewport().get_visible_rect()
	for ctrl in knoepfe:
		var p: Vector2 = ctrl.get_global_rect().get_center()
		if sicht.has_point(p):
			out.append(p)
	if Spiel.in_szene == 0 and is_instance_valid(R.current):
		out.append_array(hotspot_punkte())
	return out


## Sichtbare Gesprächszeilen und anklickbare Oberflächen-Teile (Knöpfe, Inventar-Gegenstände).
func _sammeln(n: Node, optionen: Array, knoepfe: Array) -> void:
	for k in n.get_children():
		if (k is CanvasItem and not k.visible) or (k is CanvasLayer and not k.visible):
			continue
		if k is PopochiuDialogMenuOption:
			optionen.append((k as Control).get_global_rect().get_center())
			continue
		if (k is BaseButton and not k.disabled) or k is PopochiuInventoryItem:
			if (k as Control).mouse_filter != Control.MOUSE_FILTER_IGNORE:
				knoepfe.append(k)
		_sammeln(k, optionen, knoepfe)


## Mittelpunkte der Klickflächen aller anklickbaren Objekte im Raum (wie die Hotspot-Punkte
## im HUD), ohne die aktive Figur.
func hotspot_punkte() -> Array:
	var out := []
	var xf := get_viewport().get_canvas_transform()
	for c in get_tree().get_nodes_in_group("PopochiuClickable"):
		if c is PopochiuClickable and c.is_visible_in_tree() and c.clickable and c != C.player:
			out.append(xf * punkt(c))
	return out


## Mittelpunkt der Klickfläche eines Objekts in Weltkoordinaten.
static func punkt(c: PopochiuClickable) -> Vector2:
	var poly := c.interaction_polygon
	var mitte := Vector2.ZERO
	if not poly.is_empty():
		for p in poly:
			mitte += p
		mitte /= poly.size()
	return c.global_position + c.interaction_polygon_position + mitte



#endregion
