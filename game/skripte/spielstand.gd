extends Node
## Autoload „Spielstand“: Speicherplätze nach 05-spielsysteme.md, Speichern.
##
## | Art             | Wann                                  | Plätze                        |
## | Autospeicher    | jeder Raumwechsel, Anfang/Ende Welt   | 3, der älteste wird ersetzt   |
## | Schnellspeicher | F5, Laden mit F9                      | 1                             |
## | Manuell         | Pausemenü                             | 12                            |
##
## Während einer Zwischensequenz, eines Gesprächs oder eines Minispiels wird der Wunsch gemerkt
## und direkt danach gespeichert. Die Dateien schreibt CQSaveLoad (user://saves/*.json).

signal gespeichert(slot: int)
signal geladen(slot: int)

var saveload := CQSaveLoad.new()
## Gemerkter Speicherwunsch (Platz) während einer Szene, -1 = keiner
var _ausstehend := -1


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_einhaengen.call_deferred()


## Popochius Speicherobjekt ersetzen, damit E.save_game()/E.load_game() unsere Plätze nutzen.
func _einhaengen() -> void:
	E._saveload = saveload


func _process(_delta: float) -> void:
	if _ausstehend >= 0 and not beschaeftigt():
		var slot := _ausstehend
		_ausstehend = -1
		_speichern_jetzt(slot)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cq_schnellspeichern"):
		get_viewport().set_input_as_handled()
		speichern(CQSaveLoad.SCHNELL)
	elif event.is_action_pressed("cq_schnellladen"):
		get_viewport().set_input_as_handled()
		laden(CQSaveLoad.SCHNELL)


## Läuft gerade etwas, das nicht unterbrochen werden darf?
func beschaeftigt() -> bool:
	return (
		not E.in_room
		or E.playing_queue
		or Spiel.in_szene > 0
		or is_instance_valid(D.current_dialog)
		or not is_instance_valid(R.current)
	)


func speichern(slot: int, beschreibung := "") -> bool:
	if beschaeftigt():
		_ausstehend = slot
		Spiel.melden("UI_SPEICHERN_GLEICH")
		return false
	return _speichern_jetzt(slot, beschreibung)


func _speichern_jetzt(slot: int, beschreibung := "") -> bool:
	if beschreibung.is_empty():
		beschreibung = "%s – %s" % [
			tr(Bauplan.raum(R.current.script_name).get("name_key", "")),
			Time.get_datetime_string_from_system(false, true)
		]
	var ok := saveload.save_game(slot, beschreibung)
	if ok:
		E.game_saved.emit()
		gespeichert.emit(slot)
		if slot == CQSaveLoad.SCHNELL or slot <= CQSaveLoad.MANUELL_ANZAHL:
			Spiel.melden("UI_GESPEICHERT")
	return ok


## Autospeicher: der älteste der drei Plätze wird ersetzt.
func autospeichern() -> void:
	var slot: int = CQSaveLoad.AUTO[0]
	var aeltestes := INF
	for s in CQSaveLoad.AUTO:
		var kopf := saveload.kopf_lesen(s)
		if kopf.is_empty():
			slot = s
			break
		if float(kopf.get("zeitstempel", 0.0)) < aeltestes:
			aeltestes = float(kopf.get("zeitstempel", 0.0))
			slot = s
	speichern(slot)


func laden(slot: int) -> bool:
	if saveload.datei_lesen(slot).is_empty():
		Spiel.melden("UI_KEIN_SPIELSTAND")
		return false
	await E.load_game(slot)
	geladen.emit(slot)
	return true


## „Fortsetzen“ im Hauptmenü: neuester Stand, egal welcher Art.
func neuester_platz() -> int:
	var bester := -1
	var zeit := -1.0
	for slot in range(1, CQSaveLoad.AUTO.back() + 1):
		var kopf := saveload.kopf_lesen(slot)
		if not kopf.is_empty() and float(kopf.get("zeitstempel", 0.0)) > zeit:
			zeit = float(kopf.get("zeitstempel", 0.0))
			bester = slot
	return bester
