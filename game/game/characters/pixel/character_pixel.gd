@tool
extends CQFigur
# Figur „Pixel“ (pixel). Angelegt vom Godot-Bau; ab hier handgeschrieben.
# Ansehen kommt aus dem Bauplan; Reden, Benutzen und Gegenstände hier überschreiben.

const Data := preload('character_pixel_state.gd')
var state: Data = load("res://game/characters/pixel/character_pixel.tres")


## Ruhehaltung (Sebastian, 14. November 2026): Pixel steht oder läuft und setzt sich erst, wenn
## Max eine Weile nichts tut. „idle“ (Sitzen) ist damit die Ruhe nach dem Warten; im Stehen spielt
## „stehen“. In Szenen gilt die Haltung, die der Raum setzt; abseits des Laufbereichs (Balken,
## Werkbank) sitzt er. „schlafen“ bleibt, wie der Raum es setzt.
const SITZEN_NACH := 12.0
var _warten := 0.0
var _sitzt := false
const TAKT := 0.25


func _play_idle() -> void:
	_takt_sichern()
	if not _automatisch() or not animation_player or not animation_player.has_animation("stehen"):
		super()
	elif _sitzt or _abseits():
		play_animation("idle")
	else:
		play_animation("stehen")


## Außerhalb von Szenen entscheidet Pixel selbst zwischen Stehen und Sitzen.
func _automatisch() -> bool:
	return ((idle_animation == "idle" or idle_animation == "stehen") and not Engine.is_editor_hint()
		and not Spiel.testmodus and Spiel.in_szene == 0)


## Sitzt Pixel abseits des Laufbereichs (Balken, Werkbank)?
func _abseits() -> bool:
	if not is_instance_valid(R.current) or not R.current.has_method("get_navigation_path"):
		return false
	var weg: PackedVector2Array = R.current.get_navigation_path(position, position + Vector2(1, 0))
	return weg.is_empty() or weg[0].distance_to(position) > 4.0


## Popochiu schaltet _process der Figuren an und aus, darum ein eigener Takt. Pixel wandert von
## Raum zu Raum (verlässt den Baum), also bei jeder Ruhepose prüfen, ob er läuft.
var _takt: Timer


func _ready() -> void:
	super()
	_takt_sichern()


func _takt_sichern() -> void:
	if Engine.is_editor_hint() or not is_inside_tree():
		return
	if _takt == null:
		_takt = Timer.new()
		_takt.wait_time = TAKT
		_takt.timeout.connect(_ruhe_takt)
		add_child(_takt)
	if _takt.is_stopped():
		_takt.start()


func _ruhe_takt() -> void:
	var schritt := TAKT
	if Spiel.in_szene > 0:
		_sitzt = idle_animation == "idle"   # sitzt er in der Szene, bleibt er sitzen, bis Max losgeht
		_warten = 0.0
		return
	if not _automatisch() or is_talking:
		_warten = 0.0
		return
	var max_figur: PopochiuCharacter = C.player if is_instance_valid(C.player) and C.player != self else null
	var unruhe := is_moving or (max_figur != null and (max_figur.is_moving or max_figur.is_talking))
	if unruhe:
		_warten = 0.0
		if _sitzt:
			_sitzt = false
			if not is_moving:
				_play_idle()
		return
	_warten += schritt
	if not _sitzt and _warten >= SITZEN_NACH:
		_sitzt = true
		_play_idle()


## Liegt Pixel (Bewegung „schlafen“), redet er im Liegen weiter statt kurz aufzustehen.
func _play_talk() -> void:
	if idle_animation == "schlafen":
		play_animation("schlafen")
	else:
		super()


## Vor P1 schläft Pixel: Benutzen (0220), nach zwei Versuchen kommentiert Opa (0230).
## Nach P1 startet Linksklick das Gespräch.
func _on_click() -> void:
	if Zustand.abschnitt != "prolog":
		await Spiel.ersatz()  # ab Welt 1: Rätsel mit Pixel regelt der Raum (figur_benutzt)
		return
	if Zustand.geloest("P1"):
		await super()
		return
	await Spiel.hingehen(self)
	var n: int = int(Zustand.wert("P0_PIXEL_WECKVERSUCHE", 0)) + 1
	Zustand.setze_wert("P0_PIXEL_WECKVERSUCHE", n)
	await Spiel.sagen("MAX", "P0_DACH_MAX_0220")
	if n == 2:
		await Spiel.sagen("OPA", "P0_DACH_OPA_0230")


func _on_item_used(item: PopochiuInventoryItem) -> void:
	if Zustand.abschnitt != "prolog":
		await super(item)
		return
	await Spiel.hingehen(self)
	match item.script_name:
		"Thunfischdose":
			if not Zustand.geloest("P1"):
				if not Zustand.ist("P0_DOSE_OFFEN"):
					await Spiel.sagen("MAX", "P0_DACH_MAX_0270")  # noch zu
				elif Zustand.ist("P0_PIXEL_GEWECKT"):
					await Spiel.sagen("PIX", "P0_DACH_PIX_1170")  # er will Porzellan
				elif is_instance_valid(R.current) and R.current.has_method("p1_wecken"):
					await R.current.call("p1_wecken")  # offene Dose unter Pixels Nase
				return
		"Teetasse":
			if not Zustand.geloest("P1"):
				if not Zustand.ist("P0_TASSE_GEFUELLT"):
					await Spiel.sagen("MAX", "P0_DACH_MAX_1180")  # nur kalter Tee
				elif is_instance_valid(R.current) and R.current.has_method("p1_loesen"):
					await R.current.call("p1_loesen")  # Thunfisch in Porzellan
				return
		"Drahtkleiderbuegel":
			await Spiel.sagen("MAX", "P0_DACH_MAX_1110")
			return
	await Spiel.ersatz()
