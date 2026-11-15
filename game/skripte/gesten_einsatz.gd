class_name CQGestenEinsatz
extends RefCounted
## Wann welche Geste spielt (docs/grafik/gesten-regie.md, Entscheidungen in
## gesten-regie-entscheidungen.md). Nach dem Muster von klang_einsatz.gd hängen die Tabellen
## Bewegungen aus den Figuren-Sheets an Skriptzeilen, Ruhe-Schleifen und zufällige Warte-Gesten,
## ohne dass die Regeln der Welten jeden Aufruf einzeln kennen müssen:
##   ZEILE   Zeilen-ID → [Kürzel der Figur, Bewegung, Art]. Spiel.sagen() ruft zeile() direkt neben
##           Klang.zeilen_klang() auf. Arten:
##             vor         Geste abwarten, dann die Sprechblase
##             mit         Geste und Sprechblase gleichzeitig
##             statt_talk  die Bewegung ist die Redebewegung dieses Satzes (CQFigur.rede_geste)
##             bleibt      Geste abwarten und auf dem letzten Bild stehen bleiben, bis die nächste
##                         Geste kommt, die Figur losläuft oder die Szene endet (Max sitzt auf dem Hebel)
##             halten      Schleife so viele Sekunden (4. Eintrag, Standard 2) abwarten, dann der Satz
##             halten_mit  Schleife so viele Sekunden, gleichzeitig mit dem Satz
##   RUHE    Figur-ID → Liste von {geste, Bedingungen}: Ruhe-Schleife statt idle (CQRaum wendet sie
##           in _zustand_anwenden() an). Die erste passende gilt.
##   WARTEN  Figur-ID → Liste von {gesten, abstand: [min, max] Sekunden, Bedingungen}: zufällige
##           Warte-Gesten, getaktet in CQRaum._process(). Die erste passende gilt.
##           spieler_ruhe: nur, wenn die Figur gerade gesteuert wird und der Spieler so viele
##           Sekunden nichts getan hat (Max ist die Spielfigur).
##           halten: [min, max] Sekunden: Schleife so lange halten statt eines Durchgangs.
## Bedingungen: raum (ID oder Liste), abschnitt, nach (Rätsel gelöst), vor (Rätsel offen).
## Die Tabellen der Welten stehen in gesten_welt_1.gd und gesten_welt_2.gd (gleicher Aufbau), damit
## parallel daran gearbeitet werden kann; hier stehen der Prolog, die Zwischenspiele und Max und
## Pixel über alle Welten. Im Testmodus und in übersprungenen Szenen spielt nichts davon
## (CQFigur.gesten_aus()).

const WELTEN := [preload("res://skripte/gesten_welt_1.gd"), preload("res://skripte/gesten_welt_2.gd")]
## Standardabstand der Warte-Gesten in Sekunden
const ABSTAND := [15.0, 45.0]
## Frühestens so viele Sekunden nach dem letzten Satz im Raum
const NACH_SATZ := 4.0

const ZEILE := {
	# Prolog: Opas Auftrag (erklaeren als Redebewegung), Panik, Kopfkratzen
	"P0_DACH_OPA_0030": ["OPA", "erklaeren", "statt_talk"],   # dramatisch
	"P0_DACH_OPA_0040": ["OPA", "erklaeren", "statt_talk"],   # zeigt auf den Fernseher
	"P0_DACH_OPA_0060": ["OPA", "erklaeren", "statt_talk"],
	"P0_DACH_OPA_0070": ["OPA", "erklaeren", "statt_talk"],   # zählt an den Fingern
	"P0_DACH_OPA_0080": ["OPA", "erklaeren", "statt_talk"],
	"P0_DACH_OPA_0110": ["OPA", "erklaeren", "statt_talk"],
	"P0_DACH_OPA_0130": ["OPA", "erklaeren", "statt_talk"],
	"ZS1_DACH_OPA_0100": ["OPA", "erklaeren", "statt_talk"],  # „Für Spezialzwecke“
	"P0_DACH_OPA_0690": ["OPA", "panik", "statt_talk"],       # „Halt! Erst die Tasche!“
	"P0_DACH_OPA_1676": ["OPA", "panik", "statt_talk"],       # „Nicht den Hebel!“
	"P0_DACH_OPA_1140": ["OPA", "panik", "statt_talk"],       # „Nicht am Knopf drehen“
	"P0_DACH_OPA_0610": ["OPA", "kopf_kratzen", "vor"],       # „Ich hab ihn mir aufgeschrieben“
	"P0_DACH_OPA_1364": ["OPA", "kopf_kratzen", "vor"],       # weicht aus
	# Prolog: Max
	"P0_WOHN_MAX_1220": ["MAX", "gaehnen", "vor"],            # „Ohne WLAN vergeht die Zeit langsamer“
	"P0_DACH_MAX_0480": ["MAX", "benutzen", "vor"],           # Antenne auf den Zapp-O-Mat
	"P0_DACH_MAX_0670": ["MAX", "benutzen", "vor"],           # Drehknopf auf Kanal 3
	# Max über alle Welten
	"W1_LUFT_MAX_0570": ["MAX", "kopf_kratzen", "vor"],       # fällt ihm erst jetzt ein
	"W2_TAG1_MAX_0130": ["MAX", "schulterzucken", "mit"],     # „Letzter … aber im Ziel“
	"W2_DISK_MAX_0210": ["MAX", "zeigen", "vor"],             # „Du warst es.“
	"W2_DISK_MAX_0230": ["MAX", "zeigen", "vor"],
	"W2_DISK_MAX_0250": ["MAX", "zeigen", "vor"],
	"W2_DISK_MAX_0270": ["MAX", "zeigen", "vor"],
	"W2_NIL_MAX_0400": ["MAX", "zeigen", "vor"],              # „Dann nimm halt Pixel als Fahrkarte“
	"FI_DACH_MAX_0050": ["MAX", "zeigen", "vor"],
	"FI_AUFL_MAX_0320": ["MAX", "zeigen", "vor"],
	"W2_TRAI_MAX_0040": ["MAX", "hinsetzen", "bleibt"],       # setzt sich auf den Hebel
	"W2_TRAI_MAX_0130": ["MAX", "hinsetzen", "bleibt"],
	"W2_TRAI_MAX_0110": ["MAX", "vom_boden_aufstehen", "vor"],  # „steht von selbst auf“
	"W2_KRON_MAX_0040": ["MAX", "benutzen", "vor"],           # Waage und Wanne
	"W2_KRON_MAX_0050": ["MAX", "benutzen", "vor"],
	"W2_KRON_MAX_0070": ["MAX", "benutzen", "vor"],
	"W2_KRON_MAX_0080": ["MAX", "benutzen", "vor"],
	"W2_KRON_MAX_0090": ["MAX", "benutzen", "vor"],
	"W2_GRAB_MAX_0160": ["MAX", "benutzen", "vor"],           # Stein auf den Sockel
	# Pixel über alle Welten
	"W1_ANK_PIX_0040": ["PIX", "schnuppern", "vor"],
	"W2_DISK_PIX_0070": ["PIX", "schnuppern", "vor"],
	"W2_DISK_PIX_0110": ["PIX", "schnuppern", "vor"],
	"W2_DISK_PIX_0150": ["PIX", "schnuppern", "vor"],
	"W2_DISK_PIX_0200": ["PIX", "schnuppern", "vor"],
	"W2_PARA_PIX_0300": ["PIX", "schnuppern", "vor"],
	"W2_THRO_PIX_0040": ["PIX", "schwanz_zucken", "mit"],     # „Schwanz zuckt“
	"W2_TRAI_PIX_0140": ["PIX", "fauchen", "vor"],            # Schwanz gesträubt
	"W2_KRON_PIX_0220": ["PIX", "fauchen", "vor"],
	"W2_DUEL_PIX_0080": ["PIX", "fauchen", "vor"],
	"W1_BRUE_PIX_0410": ["PIX", "fauchen", "vor"],
}

const RUHE := {}

const WARTEN := {
	# Max ist die Spielfigur: nur, wenn der Spieler eine Weile nichts tut (Zurufe kommen nach 45 s)
	"max": [{gesten = ["kopf_kratzen", "gaehnen"], abstand = [15.0, 30.0], spieler_ruhe = 25.0}],
	# Pixel im Sitzen (character_pixel.gd, warte_geste_erlaubt)
	"pixel": [{gesten = ["putzen", "schwanz_zucken", "schwanz_zucken"], abstand = [10.0, 25.0]}],
	"opa": [{gesten = ["kopf_kratzen"], raum = "dachboden", abstand = [20.0, 40.0]}],
}


## Hat die Figur die Warte-Geste g (Name) oder alle Schritte der Folge g (Array aus Namen und
## [Name, Sekunden])?
static func folge_da(c: CQFigur, g) -> bool:
	if g is String:
		return c.hat_animation(g)
	for schritt in g:
		if not c.hat_animation(schritt[0] if schritt is Array else schritt):
			return false
	return true


## Eintrag der Tabelle ZEILE (auch aus den Welt-Tabellen), sonst leer.
static func zeilen_eintrag(id: String) -> Array:
	if ZEILE.has(id):
		return ZEILE[id]
	for w in WELTEN:
		if w.ZEILE.has(id):
			return w.ZEILE[id]
	return []


static func hat_zeile(id: String) -> bool:
	return not zeilen_eintrag(id).is_empty()


## Mit dem Beginn einer Skriptzeile (Spiel.sagen): Geste vor, mit oder statt der Redebewegung.
static func zeile(id: String) -> void:
	var e := zeilen_eintrag(id)
	if e.is_empty() or CQFigur.gesten_aus():
		return
	var c = Spiel.figur(e[0])
	if not c is CQFigur or not c.is_inside_tree() or not c.hat_animation(e[1]):
		return
	match e[2]:
		"vor":
			await c.geste(e[1])
		"mit":
			c.geste(e[1], false)
		"statt_talk":
			c.rede_geste(e[1])
		"bleibt":
			await c.geste(e[1], true, CQFigur.GESTE_HALTEN)
		"halten":
			await c.geste_halten(e[1], float(e[3]) if e.size() > 3 else 2.0)
		"halten_mit":
			c.geste_halten(e[1], float(e[3]) if e.size() > 3 else 2.0, false)


## Ruhe-Schleife dieser Figur im Raum, sonst "".
static func ruhe_fuer(figur_id: String, raum: String) -> String:
	for e in _liste("RUHE", figur_id):
		if passt(e, raum):
			return e.geste
	return ""


## Warte-Gesten dieser Figur im Raum ({gesten, abstand …}), sonst leer.
static func warten_fuer(figur_id: String, raum: String) -> Dictionary:
	for e in _liste("WARTEN", figur_id):
		if passt(e, raum):
			return e
	return {}


static func _liste(tabelle: String, figur_id: String) -> Array:
	var out: Array = []
	var eigene: Dictionary = RUHE if tabelle == "RUHE" else WARTEN
	out.append_array(eigene.get(figur_id, []))
	for w in WELTEN:
		var t: Dictionary = w.RUHE if tabelle == "RUHE" else w.WARTEN
		out.append_array(t.get(figur_id, []))
	return out


static func passt(e: Dictionary, raum: String) -> bool:
	if e.has("raum"):
		var r = e.raum
		if (r is String and r != raum) or (r is Array and not raum in r):
			return false
	if e.has("abschnitt") and e.abschnitt != Zustand.abschnitt:
		return false
	if e.has("nach") and not Zustand.geloest(e.nach):
		return false
	if e.has("vor") and Zustand.geloest(e.vor):
		return false
	return true
