class_name CQPlatzhalterKlang
extends RefCounted
## Platzhalter-Töne für Geräusche und Jingles, solange es keine Datei gibt (04-audio.md,
## Platzhalter). Jeder Klang ist eine kurze Folge von Abschnitten, zur Laufzeit als 16-Bit-PCM
## erzeugt und je ID zwischengespeichert. Unbekannte IDs bekommen einen kurzen Ton, dessen Höhe
## aus der ID folgt, damit verschiedene Ereignisse verschieden klingen.

const RATE := 22050

## Abschnitt: [Welle, Frequenz Anfang, Frequenz Ende, Dauer in s, Lautstärke, Abklingen]
## Welle: sin, rechteck, rauschen, glocke (Sinus mit unharmonischen Obertönen)
const REZEPTE := {
	"ui_klick": [["sin", 1800, 1800, 0.03, 0.5, true]],
	"inventar": [["rauschen", 0, 0, 0.12, 0.25, true]],
	"seite": [["rauschen", 0, 0, 0.08, 0.15, false], ["rauschen", 0, 0, 0.14, 0.2, true]],
	"kombinieren": [["sin", 600, 600, 0.07, 0.4, true], ["sin", 900, 900, 0.12, 0.4, true]],
	"fehler": [["rechteck", 140, 120, 0.25, 0.25, true]],
	"wechsel": [["sin", 300, 900, 0.2, 0.3, false], ["glocke", 2000, 2000, 0.25, 0.25, true]],
	"hinweis": [["glocke", 1300, 1300, 0.45, 0.35, true]],
	"speichern": [["rauschen", 0, 0, 0.05, 0.25, true], ["rauschen", 0, 0, 0.05, 0.25, true],
		["sin", 700, 1000, 0.12, 0.3, true]],
	"nahansicht": [["rauschen", 0, 0, 0.25, 0.2, true]],
	"notiz": [["rauschen", 0, 0, 0.07, 0.2, true], ["rauschen", 0, 0, 0.09, 0.2, true]],
	"zappomat_sog": [["sin", 100, 1200, 1.4, 0.35, false], ["rauschen", 0, 0, 0.3, 0.25, true]],
	"werbeblock_start": [["sin", 523, 523, 0.1, 0.3, true], ["sin", 659, 659, 0.1, 0.3, true],
		["sin", 784, 784, 0.1, 0.3, true], ["rauschen", 0, 0, 0.3, 0.3, true]],
	"umschalten": [["rechteck", 900, 900, 0.02, 0.3, true], ["rauschen", 0, 0, 0.15, 0.25, true]],
	"gong": [["glocke", 110, 110, 2.5, 0.5, true]],
	"aufgehoben": [["sin", 523, 523, 0.09, 0.35, true], ["sin", 784, 784, 0.18, 0.35, true]],
	"geloest": [["sin", 523, 523, 0.1, 0.35, true], ["sin", 659, 659, 0.1, 0.35, true],
		["sin", 784, 784, 0.1, 0.35, true], ["sin", 1047, 1047, 0.35, 0.35, true]],
	"welt_geschafft": [["sin", 392, 392, 0.15, 0.35, true], ["sin", 523, 523, 0.15, 0.35, true],
		["sin", 659, 659, 0.15, 0.35, true], ["sin", 784, 784, 0.15, 0.35, true],
		["glocke", 1047, 1047, 0.8, 0.35, true]],
	"falsch": [["rechteck", 392, 392, 0.15, 0.2, true], ["rechteck", 311, 311, 0.3, 0.2, true]],
	"lachkonserve": [["rauschen", 0, 0, 0.18, 0.3, true], ["rauschen", 0, 0, 0.16, 0.25, true],
		["rauschen", 0, 0, 0.2, 0.3, true], ["rauschen", 0, 0, 0.35, 0.2, true]],
	"gluecksrad": [["rechteck", 1200, 1200, 0.03, 0.25, true], ["sin", 0, 0, 0.05, 0.0, false],
		["rechteck", 1200, 1200, 0.03, 0.25, true], ["sin", 0, 0, 0.09, 0.0, false],
		["rechteck", 1200, 1200, 0.03, 0.25, true], ["sin", 0, 0, 0.16, 0.0, false],
		["rechteck", 1200, 1200, 0.03, 0.25, true]],
}

static var _cache := {}


static func klang(id: String) -> AudioStreamWAV:
	if not _cache.has(id):
		_cache[id] = _bauen(REZEPTE.get(id, _standard(id)), hash(id))
	return _cache[id]


static func _standard(id: String) -> Array:
	var hz := 400.0 + float(absi(hash(id)) % 800)
	return [["sin", hz, hz * 1.2, 0.12, 0.3, true]]


static func _bauen(rezept: Array, saat: int) -> AudioStreamWAV:
	var zufall := RandomNumberGenerator.new()
	zufall.seed = saat
	var daten := PackedByteArray()
	for a in rezept:
		var welle: String = a[0]
		var f0 := float(a[1])
		var f1 := float(a[2])
		var dauer := float(a[3])
		var laut := float(a[4])
		var abklingen: bool = a[5]
		var n := int(RATE * dauer)
		var phase := 0.0
		var start := daten.size()
		daten.resize(start + n * 2)
		for i in n:
			var t := float(i) / RATE
			var anteil := float(i) / maxf(1.0, float(n))
			var hz := lerpf(f0, f1, anteil)
			phase += TAU * hz / RATE
			var w := 0.0
			match welle:
				"sin":
					w = sin(phase)
				"rechteck":
					w = 1.0 if sin(phase) >= 0.0 else -1.0
				"rauschen":
					w = zufall.randf_range(-1.0, 1.0)
				"glocke":
					w = sin(phase) * 0.6 + sin(phase * 2.76) * 0.25 + sin(phase * 5.4) * 0.15
			# kurzer Anstieg gegen Knacksen, dann Abklingen oder kurzes Ausblenden am Ende
			var huelle := minf(1.0, t * 400.0)
			huelle *= pow(1.0 - anteil, 2.0) if abklingen else minf(1.0, (1.0 - anteil) * 20.0)
			daten.encode_s16(start + i * 2, int(clampf(w * laut * huelle, -1.0, 1.0) * 32000.0))
	var s := AudioStreamWAV.new()
	s.format = AudioStreamWAV.FORMAT_16_BITS
	s.mix_rate = RATE
	s.stereo = false
	s.data = daten
	return s
