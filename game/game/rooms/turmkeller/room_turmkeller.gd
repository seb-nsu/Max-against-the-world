@tool
extends CQRaum
# Raum „Turmkeller“ (turmkeller). Angelegt vom Godot-Bau nach dem Bauplan; ab hier handgeschrieben.
# CQRaum stellt Spieler und Figuren auf, wendet den Zustand an und speichert automatisch.
# Eigene Szenen: _raum_betreten() und _nach_uebergang() überschreiben.

const Data := preload('room_turmkeller_state.gd')

var state: Data = load("res://game/rooms/turmkeller/room_turmkeller.tres")


var _erster_besuch := false

## Pixels Haarspuren an den Kreuzungen: Zeile nach der Anzahl der Spuren (0200, 0210, 0220)
const SPUR_ZEILEN := ["W1_TURM_PIX_0200", "W1_TURM_PIX_0210", "W1_TURM_PIX_0220"]


func _raum_betreten(erster_besuch: bool) -> void:
	_erster_besuch = erster_besuch


## Die Besen patrouillieren bis Rätsel 11b, danach fegen sie in Abstellkammer 1.
func _zustand_anwenden() -> void:
	super()
	var besen := get_hotspot("Besen")
	if is_instance_valid(besen):
		besen.visible = not Zustand.geloest("R11b")
	_patrouille_anpassen()


## Drei Zauberbesen fegen sichtbar ihre Routen ab (Review Fund 17; vorher lehnten nur gemalte
## Besen an der Wand): gerade Route hin und her, Zickzack, Schleife. Eigene Sprites aus
## grafik/figuren/zauberbesen.png (Gehbilder), Fußpunkt auf der Route, Größe wie Figuren dort.
const BESEN_BILD := "res://grafik/figuren/zauberbesen.png"
const BESEN_ZELLE := Vector2(52, 104)
const BESEN_GEHEN := [8, 9, 10, 11]
var _besen_zeit := 0.0
## Route → Zeitpunkt, ab dem ihr Besen zur Kammertür abbiegt (nach Pixels Haarspur, Review Fund 17)
var _abbiegen := {}
const KAMMERTUER := Vector2(556, 236)


func _besen_ort(n: int, t: float) -> Vector2:
	match n:
		0:  # gerade Route: hin und her
			var k := absf(fposmod(t * 0.18, 2.0) - 1.0)
			return Vector2(150, 342).lerp(Vector2(228, 286), k)
		1:  # Zickzack
			var punkte := [Vector2(286, 352), Vector2(356, 326), Vector2(288, 298), Vector2(356, 270), Vector2(300, 252)]
			var weg := fposmod(t * 0.25, 2.0 * (punkte.size() - 1))
			var i := int(weg)
			if i >= punkte.size() - 1:
				i = 2 * (punkte.size() - 1) - i - 1
				return punkte[i + 1].lerp(punkte[i], weg - floor(weg))
			return punkte[i].lerp(punkte[i + 1], weg - i)
		_:  # Schleife
			var w := t * 0.55
			return Vector2(478 + cos(w) * 80.0, 278 + sin(w) * 26.0)


func _patrouille_anpassen() -> void:
	if Engine.is_editor_hint() or not has_node("Props"):
		return
	var an := not Zustand.geloest("R11b") and ResourceLoader.exists(BESEN_BILD)
	for n in 3:
		var name := "Patrouille_%d" % n
		var sp := get_node("Props").get_node_or_null(name) as Sprite2D
		if not an:
			if sp:
				sp.queue_free()
			continue
		if sp:
			continue
		sp = Sprite2D.new()
		sp.name = name
		sp.texture = load(BESEN_BILD)
		sp.hframes = int(sp.texture.get_width() / BESEN_ZELLE.x)
		sp.centered = false
		sp.offset = Vector2(-BESEN_ZELLE.x / 2.0, -BESEN_ZELLE.y)
		sp.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		get_node("Props").add_child(sp)
		_schatten_unter(sp, BESEN_ZELLE.x * 0.8, 0.0)


func _process(delta: float) -> void:
	super(delta)
	if Engine.is_editor_hint() or not has_node("Props"):
		return
	_besen_zeit += delta
	for n in 3:
		var sp := get_node("Props").get_node_or_null("Patrouille_%d" % n) as Sprite2D
		if not sp:
			continue
		var t := _besen_zeit + n * 3.1
		var ort := _besen_ort(n, t)
		var vorher := _besen_ort(n, t - 0.05)
		if _abbiegen.has(n):
			# hin zur Tür (1,2 s), kurz dort, zurück auf die Route (1,2 s)
			var k := _besen_zeit - float(_abbiegen[n])
			if k < 3.0:
				var f := clampf(k / 1.2, 0.0, 1.0) if k < 1.6 else clampf((3.0 - k) / 1.2, 0.0, 1.0)
				vorher = ort.lerp(KAMMERTUER, clampf(f - 0.04, 0.0, 1.0))
				ort = ort.lerp(KAMMERTUER, f)
			else:
				_abbiegen.erase(n)
		sp.position = ort
		var s := 0.55 + 0.3 * clampf((ort.y - 222.0) / 137.0, 0.0, 1.0)
		sp.scale = Vector2(s, s)
		if absf(ort.x - vorher.x) > 0.01:
			sp.flip_h = ort.x < vorher.x
		sp.frame = BESEN_GEHEN[int(_besen_zeit * 6.0 + n) % BESEN_GEHEN.size()]


## Ankunft durch die Rune-Tür (TURM 0010–0040)
func _nach_uebergang() -> void:
	if not _erster_besuch:
		return
	_erster_besuch = false
	var schritte := [Spiel.z("MAX", "W1_TURM_MAX_0010"), Spiel.z("PIX", "W1_TURM_PIX_0020")]
	if has_character("Zeldina"):
		schritte.append(Spiel.z("ZEL", "W1_TURM_ZEL_0030"))
	if Zustand.geloest("R10b") and has_character("Grimmzahn"):
		schritte.append(Spiel.z("GRI", "W1_TURM_GRI_0040"))
	await Spiel.szene(schritte)


func spuren() -> int:
	return [1, 2, 3].filter(func(n): return Zustand.ist("W1_KREUZUNG_%d" % n)).size()


## Pixel schüttelt sich an einer Kreuzung (Rätsel 11b): jede Kreuzung einmal.
func kreuzung_pixel(n: int) -> void:
	if Zustand.ist("W1_KREUZUNG_%d" % n) or Zustand.geloest("R11b"):
		await Spiel.ersatz("PIX")
		return
	var zeile: String = SPUR_ZEILEN[spuren()]
	Zustand.setze("W1_KREUZUNG_%d" % n)
	_abbiegen[n - 1] = _besen_zeit   # der Besen dieser Route biegt sichtbar zur Kammertür ab
	await Spiel.sagen("PIX", zeile)


## Max auf einer Kreuzung: keine Haare (0140, Hinweis 0150).
func kreuzung_max() -> void:
	await Spiel.sagen("MAX", "W1_TURM_MAX_0140")
	await Spiel.sagen("PIX", "W1_TURM_PIX_0150")


## Ein Besen erwischt Max und fegt ihn zur Treppe (0160, dann 0170 bzw. 0180).
func gefegt() -> void:
	var n := Zustand.ansehen_zaehlen("Turmkeller/gefegt")
	await Spiel.sagen("NAR", "W1_TURM_NAR_0160")
	await Spiel.sagen("PIX", "W1_TURM_PIX_0170" if n == 1 else "W1_TURM_PIX_0180")
	if has_marker("VonBergwerk"):
		C.Max.position = get_marker_position("VonBergwerk")
