class_name CQKlangEinsatz
extends RefCounted
## Wo welches Geräusch spielt (04-audio.md, Tabellen „Geräusche“, Spalte Einsatz). Die Tabellen
## hier hängen Geräusche an Skriptzeilen, Objekte, Gegenstände, Sprecher und Böden, ohne dass die
## Regeln der Welten jeden Aufruf einzeln kennen müssen:
##   ZEILE       spielt, wenn die Skriptzeile beginnt (Spiel.sagen)
##   LAUT        Figuren, die statt einer Stimme einen Laut haben (Spiel.sagen)
##   LAUT_DAZU   Laut zusätzlich zur Stimme, je Abschnitt (Opas Hologramm in Welt 3)
##   OBJEKT      spielt, wenn Max das Objekt benutzt (Spiel.regel, Art „benutzen“)
##   GEGENSTAND  spielt, wenn der Gegenstand benutzt wird: im Inventar, auf etwas, kombiniert
##   SCHRITT_MAX, SCHRITT_PIXEL   Schritte je Raum, solange die Figur läuft (Spiel._process)
##   MUSIK       Stück, das mit einer Skriptzeile einsetzt; „raum“ = zurück zum Stück des Raums
##   LIED        gesungene Zeilen: Ihr Text erscheint immer, auch bei „Untertitel aus“
## Ein Wert „jingle/<id>“ spielt den Jingle statt eines Geräuschs. Einzelne Ereignisse ohne Zeile
## und ohne Objekt (Abfahrt der Zeitfähre, Code-Sicht, Tausch) rufen Klang.geraeusch() direkt in
## den Regeln auf. tools/audio_liste.py liest diese Tabellen mit und prüft sie gegen 04-audio.md
## und gegen das Skript (jede Zeilen-ID muss es geben).

const ZEILE := {
	# Gegenwart
	"P0_DACH_MAX_0280": "dosenoeffner",        # „Und … Zisch.“
	"P0_DACH_OPA_0500": "fernseher_an",        # „Das Bild ist da!“
	"P0_DACH_MAX_0213": "pixel_schnurren",     # „Er schnurrt im Schlaf.“
	"FI_ABSP_NAR_0010": "kanal_rauschen",      # Max dreht im Vorbeigehen am Knopf
	"FI_SUPM_NAR_0050": "tuergong",            # Schnitt vor die Ladentür
	"FI_SUPM_NAR_0090": "tuergong",            # „Die Tür gleitet auf.“
	# Welt 1
	"W1_DORF_MAX_0270": "amboss",              # „Da drin hämmert jemand“
	"W1_SCHM_MAX_0110": "amboss",              # „Klong.“
	"W1_STAB_MAX_0590": "zauberfunken",        # „Schwing.“
	"W1_HOGG_NAR_0790": "zauberfunken",        # der Kessel leuchtet auf
	"FI_RAET_NAR_0030": "zauberfunken",        # Zeldina am Riegel
	"W1_HOGG_MAX_0630": "korken",
	"W1_HOGG_PIX_0640": "korken",
	"W1_HOGG_PIX_0650": "korken",
	"W1_HOGG_PIX_0660": "korken",
	"W1_HOGG_MAX_0770": "korken",
	"W1_TAV_MIN_0910": "pixel_fauchen",        # Minka: „Chhh!“
	"W1_TAV_MIN_0940": "pixel_miau",
	"W1_TAV_MIN_0960": "pixel_schnurren",
	"W1_TAV_MIN_0980": "pixel_miau",
	"W1_WASS_MAX_0105": "schnarchen",          # die Beule im Teppich
	# Welt 2
	"W2_NIL_NAR_0110": "krokodil_platschen",
	"W2_THRO_HOF_0030": "pixel_fauchen",       # Hofkater: „Fsssch.“
	"W2_DUEL_HOF_0020": "pixel_fauchen",
	"W2_DUEL_HOF_0350": "pixel_fauchen",
	"W2_GRAB_STM_0020": "stein_schleifen",     # der Steinmetz macht den Grabstein
	"W2_KRON_MAX_0070": "badewanne",
	"W2_KRON_MAX_0090": "badewanne",
	"W2_TAG1_NAR_0080": "stadion_jubel",       # Ziellinie
	"W2_FINA_NAR_0160": "diskus",
	"W2_FINA_NAR_0170": "diskus",
	"W2_FINA_NAR_0180": "diskus",
	"W2_RING_NAR_0190": "schnarchen",          # Ciceros Rede im Zeitraffer
	# Welt 3
	"W3_STR_MAX_0330": "telefonzelle",
	"W3_ENDE_NAR_0090": "telefonzelle",
	"W3_EING_MAX_0350": "schleusentor",
	"W3_KAM1_NAR_0090": "portalgeraet",
	"W3_KAM2_NAR_0090": "gummihuhn",
	"W3_KAM3_NAR_0150": "gummihuhn",
	# Welt 4
	"W4_SIT_MAX_0030": "jingle/lachkonserve",  # „Jemand lacht“
	"W4_GLUE_GER_0180": "jingle/gluecksrad",   # „Drei von drei!“
	"W4_KAPI_NAR_0050": "comic_schlag",        # der Amboss trifft Pixel
	"W4_WERB_NAR_0230": "amboss",
	"W4_ARCH_MAX_0060": "muellpresse",
	"W4_ARCH_MAX_0120": "muellpresse",
}

## Stücke, die mitten in einer Szene einsetzen (04-audio.md, Musik: Finale und gesungene Stücke)
const MUSIK := {
	"W1_BERG_GO1_0620": "lied_goblin",       # das Arbeitslied
	"W1_BERG_MAX_0640": "raum",
	"W1_WALD_WAL_0490": "lied_waldemar",     # Waldemars Nummer im Zauberwald
	"W1_WALD_WAL_0550": "raum",
	"FI_DACH_NAR_0190": "finale_maschine",   # „Die Maschine brummt an.“
	"FI_AUFL_NAR_0010": "finale_geburtstag", # „Die Maschine seufzt.“
	"FI_SUPM_NAR_0090": "titel",             # Schwarzblende
	"FI_ABSP_NAR_0100": "abspann",           # die Abspann-Fotos
	"FI_ABSP_WAL_0160": "lied_waldemar",     # Waldemars Nummer im Abspann
}

## Gesungene Zeilen (04-audio.md, gesungene Stücke; 05-spielsysteme.md, Untertitel): Der Text
## erscheint kursiv mit einer Note davor und bleibt auch bei „Untertitel aus“ stehen, damit kein
## Rätsel an einer verschluckten Silbe hängt. Der Werbejingle hat keine gesungene Zeile im Skript.
const LIED := [
	"W1_BERG_GO1_0620", "W1_BERG_GO1_0630",       # das Arbeitslied der Goblins (Passwort-Teil)
	"W1_WALD_WAL_0490", "W1_WALD_WAL_0500",       # Waldemars Nummer im Zauberwald
	"FI_ABSP_WAL_0160", "FI_ABSP_WAL_0170", "FI_ABSP_WAL_0180", "FI_ABSP_WAL_0190",  # Abspann
]

## Laute statt Stimme (04-audio.md, Nebenstimmen: „Laute als Geräusch“)
const LAUT := {
	"ZIE": "ziege", "XXL": "ziege", "HUH": "huhn", "SWA": "pixel_fauchen",
	"PIE": "piepsi", "ZOM": "zombie", "LOE": "loewe",
}

## Tonhöhe eines Lauts je Kürzel (1.0 = wie aufgenommen): Die XXL-Ziege meckert tiefer und länger.
const LAUT_TONHOEHE := {"XXL": 0.65}

## Laut zusätzlich zur Stimme: Abschnitt → Kürzel → Kennung
const LAUT_DAZU := {
	"welt-3": {"OPA": "hologramm"},
}

const OBJEKT := {
	# Gegenwart
	"fernseher": "fernseher_an", "drehknopf": "kanal_rauschen",
	# Welt 2
	"sanduhr": "sanduhr", "sanduhr_olympia": "sanduhr", "sanduhr_syrakus": "sanduhr",
	"badewanne": "badewanne",
	# Welt 3
	"telefonzelle": "telefonzelle", "radiowecker": "radiowecker",
	"klingelnder_radiowecker": "radiowecker", "eieruhr": "eieruhr",
	"terminal": "terminal", "automat": "terminal", "kartenleser": "terminal",
	"datenanschluss": "terminal", "laser": "laser",
	# Welt 4
	"gluecksrad": "gluecksrad_ticken", "lachkonserven_maschine": "jingle/lachkonserve",
	"lichtroehre": "lichtroehre", "lichtroehre_in_der_savanne": "lichtroehre",
	"lichtroehre_im_comic_kanal": "lichtroehre", "muellpresse": "muellpresse",
}

const GEGENSTAND := {
	"portalgeraet": "portalgeraet", "gummihuhn": "gummihuhn",
	"lichtroehre_deluxe": "lichtroehre", "taste_rueckspulen": "rueckspulen",
	"taste_pause": "pause",
}

## Schritte: Raum → Kennung. Räume ohne Eintrag bleiben ohne Schritte.
const SCHRITT_MAX := {
	"wohnzimmer": "schritt_teppich",
	"turmkeller": "schritt_stein", "abstellkammer_1": "schritt_stein",
	"abstellkammern": "schritt_stein", "thronsaal": "schritt_stein",
	"nil_delta": "sand_schritte", "sphinx": "sand_schritte",
	"thronsaal_ramses": "schritt_stein", "palastkueche": "schritt_stein",
	"faehrsteg_olympia": "schritt_stein", "agora": "schritt_stein",
	"startbuero": "schritt_stein", "stadion": "schritt_stein",
	"hafen_syrakus": "schritt_stein", "werkstatt": "schritt_stein",
}
const SCHRITT_PIXEL := {
	"dachboden": "pfoten_holz", "treppenhaus": "pfoten_holz",
	"nil_delta": "sand_schritte", "sphinx": "sand_schritte",
}
## Sekunden zwischen zwei Schritten
const SCHRITT_TAKT_MAX := 0.34
const SCHRITT_TAKT_PIXEL := 0.2


## Klang zu einer Skriptzeile: [Kennungen]. Laute stehen vor den Zeilen-Geräuschen.
static func fuer_zeile(kuerzel: String, zeile: String, abschnitt: String) -> Array:
	var k := []
	if LAUT.has(kuerzel):
		k.append(LAUT[kuerzel])
	var dazu: Dictionary = LAUT_DAZU.get(abschnitt, {})
	if dazu.has(kuerzel):
		k.append(dazu[kuerzel])
	if ZEILE.has(zeile):
		k.append(ZEILE[zeile])
	return k


## Klang zu einem Ereignis der Regeln (Spiel.regel): "" wenn keiner.
static func fuer_ereignis(art: String, objekt_id: String, gegenstand_id: String) -> String:
	match art:
		"benutzen":
			return OBJEKT.get(objekt_id, "")
		"gegenstand":
			return GEGENSTAND.get(gegenstand_id, "")
		"benutzen_inventar":
			return GEGENSTAND.get(objekt_id, "")
		"kombinieren":
			return GEGENSTAND.get(objekt_id, GEGENSTAND.get(gegenstand_id, ""))
	return ""


static func schritt(raum_id: String, pixel: bool) -> String:
	return (SCHRITT_PIXEL if pixel else SCHRITT_MAX).get(raum_id, "")


## Ist die Zeile gesungen?
static func ist_lied(zeile: String) -> bool:
	return zeile in LIED


## Hat die Figur einen Laut statt einer Stimme? Dann brabbelt sie nicht.
static func hat_laut(kuerzel: String) -> bool:
	return LAUT.has(kuerzel)
