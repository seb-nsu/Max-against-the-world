extends RefCounted
## Gesten der Welt 2 (Aufbau und Arten wie in gesten_einsatz.gd, das diese Tabellen einliest):
##   ZEILE   Zeilen-ID → [Kürzel der Figur, Bewegung, Art (vor, mit, statt_talk, bleibt, halten,
##           halten_mit), Sekunden bei halten]
##   RUHE    Figur-ID → [{geste, raum, abschnitt, nach, vor}]
##   WARTEN  Figur-ID → [{gesten, abstand: [min, max], halten, raum, abschnitt, nach, vor}]
## Max und Pixel über alle Welten stehen in gesten_einsatz.gd. Abgänge mit Sondergang (Hofkater,
## Archimedes im Handtuch) stehen in welt_2.gd; die Regie mit Gründen in docs/grafik/gesten-regie.md.

const ZEILE := {
	# Max: Tag 1 und Finaltag
	"W2_TAG1_MAX_0110": ["MAX", "heisser_sand", "mit"],       # „Heiß. Heiß. Heiß. Heiß!“
	"W2_TRAI_NAR_0050": ["MAX", "katapult", "vor"],           # R5, Training: katapultiert
	"W2_TRAI_NAR_0090": ["MAX", "katapult", "vor"],
	"W2_TRAI_NAR_0150": ["MAX", "katapult", "vor"],
	"W2_FINA_NAR_0040": ["MAX", "speer", "vor"],              # bestochen
	"W2_FINA_NAR_0070": ["MAX", "speer", "vor"],              # nicht bestochen
	"W2_FINA_NAR_0120": ["MAX", "diskus", "vor"],             # Probewurf
	"W2_FINA_MAX_0130": ["MAX", "wackeln", "vor"],            # „Das wird noch Probleme machen“
	"W2_FINA_NAR_0160": ["MAX", "diskus", "vor"],
	"W2_FINA_NAR_0170": ["MAX", "diskus", "vor"],
	"W2_FINA_NAR_0180": ["MAX", "diskus", "vor"],
	# Nil-Delta und Fähre
	"W2_NIL_FAE_0490": ["FAE", "muenze", "vor"],              # prüft die Dose
	"W2_NIL_MAX_0470": ["FAE", "muenze", "vor"],              # Kaugummi als Fahrgeld
	"W2_FAHR_FAE_0030": ["FAE", "staken", "vor"],             # jede Abfahrt
	"W2_NIL_HER_0910": ["HER", "tasche", "vor"],              # kramt im Beutel
	# Thronsaal
	"W2_THRO_RAM_0020": ["RAM", "unentschlossen", "mit"],
	"W2_AUDI_RAM_0050": ["RAM", "unentschlossen", "mit"],
	"W2_THRO_RAM_0340": ["RAM", "zepter_tauschen", "mit"],    # „Nimm ihn. Oder nicht.“
	"W2_THRO_FAW_0160": ["FAW", "bauch", "vor"],              # „Für Feigen würden wir besser wedeln“
	"W2_HIER_SCH_0260": ["SCH", "schreiben", "vor"],          # R2a, „Ich trag's rein“
	"W2_DUEL_SOB_0200": ["SOB", "hut_zurechtruecken", "mit"], # glückliches Schnauben (an Land)
	"W2_DUEL_HOF_0290": ["HOF", "abziehen", "vor"],           # R2b, steht auf, Schwanz hoch
	# Palastküche
	"W2_KUCH_NEB_0280": ["NEB", "probieren", "vor"],          # nimmt, kaut, kaut, kaut
	"W2_KUCH_NEB_0410": ["NEB", "probieren", "vor"],          # R4, kostet den Fladen
	# Werkstatt
	"W2_WERK_ARC_0420": ["ARC", "zirkel", "vor"],             # gibt den Entwurf
	"W2_KRON_ARC_0060": ["ARC", "kopf_kratzen", "vor"],       # „Die Waage ist nutzlos!“
	"W2_WERK_HIE_0480": ["HIE", "ungeduld", "mit"],           # löst die Arme und zeigt
	# Agora
	"W2_AGOR_CIC_0240": ["CIC", "raeuspern", "vor"],
	"W2_RING_CIC_0010": ["CIC", "rede", "vor"],
	"W2_PARA_CIC_0100": ["CIC", "rede", "vor"],
	"W2_GRAB_CIC_0190": ["CIC", "toga_zupfen", "vor"],        # „Wie passend!“
	"W2_AGOR_PHI_0460": ["PHI", "schimpfen", "mit"],          # R9, Laterne schwankt
	"W2_AGOR_PHI_0530": ["PHI", "schimpfen", "mit"],
	"W2_AGOR_MAX_0450": ["PHI", "laterne_spaehen", "mit"],
	"W2_AGOR_TOU_0140": ["TOI", "faecheln_mustern", "mit"],   # ihr Mann liest vor
	"W2_SAND_BRI_0060": ["BRI", "abwehren", "mit"],           # „Ich bin nicht der Messias“
	"W2_SAND_BRI_0230": ["BRI", "schild_richten", "vor"],     # hängt Max das Schild um
	"W2_DISK_TIR_0130": ["TIR", "umsehen", "vor"],            # R7, räuspert sich
	"W2_DISK_TIR_0280": ["TIR", "tafel_glaetten", "mit"],     # „Ich brauchte eine Unterlage“
	# Startbüro: der Stempel geht an Beamter 2 (Entscheidung 11)
	"W2_BUER_BE1_0470": ["BE1", "eindoesen", "vor"],          # schreckt hoch
	"W2_BUER_BE1_0550": ["BE2", "stempeln", "vor"],
	"W2_BUER_BE2_0240": ["BE2", "brille_putzen", "vor"],
	"W2_BUER_BE2_0510": ["BE2", "stempeln", "vor"],           # R3, gibt den Startpass
	# Stadion und Parade
	"W2_STAD_LEO_0130": ["LEO", "bruellen", "mit"],           # „WER BIST DU?“
	"W2_DISK_LEO_0010": ["LEO", "bruellen", "mit"],           # „DER DISKUS IST WEG!“
	"W2_FINA_LEO_0050": ["LEO", "bruellen", "mit"],           # „MEIN EINTOPF!“
	"W2_PARA_VOL_0010": ["VOL", "schulterzucken", "vor"],     # „Ein Kranz. Aus Blättern.“
	"W2_PARA_VOL_0230": ["VOL", "klatschen", "mit"],          # Volk jubelt
	"W2_PARA_ZER_0040": ["ZER", "ankuendigen", "mit"],
	"W2_PARA_ZER_0150": ["ZER", "ankuendigen", "mit"],        # „Das ist eine Parade“
	"W2_PARA_HER_0340": ["HER", "tasche", "vor"],             # „Noch ein Brief!“
	# Grabhügel
	"W2_GRAB_STM_0020": ["STM", "staub_pusten", "vor"],       # gibt den Grabstein
}

const RUHE := {
	"faecherwedler": [{geste = "faecheln"}],
	"hermes": [{geste = "joggen"}],                           # Entscheidung 8: joggen ist die Haupt-Animation
	"hofkater": [{geste = "schwanz_zucken", vor = "R2b"}],
	"nebet": [{geste = "ruehren", raum = "palastkueche"}],
	"steinmetz": [{geste = "meisseln", raum = "nil_delta"}],
	"sobek": [{geste = "schwanz_wedeln"}],                    # nur an Land (Variante sobek_land hat sie)
}

const WARTEN := {
	"aegypter": [{gesten = ["fuss_tippen"], raum = "stadion", abstand = [15.0, 25.0]}],
	"archimedes": [{gesten = ["zirkel", "gruebeln", "gruebeln", "kopf_kratzen"], raum = "werkstatt",
		abstand = [15.0, 30.0]}],
	"beamter_1": [{gesten = ["eindoesen", "gaehnen"], raum = "startbuero", abstand = [15.0, 30.0]}],
	"beamter_2": [{gesten = ["stempel_anhauchen", "brille_putzen", "haare_richten"], raum = "startbuero",
		abstand = [15.0, 30.0]}],
	"brian": [{gesten = ["schild_richten", "seufzen"], raum = "agora", vor = "R6a", abstand = [15.0, 30.0]}],
	"cicero": [{gesten = ["rede", "rede", "raeuspern", "toga_zupfen", "armreif"], raum = "agora",
		abstand = [8.0, 15.0]},
		{gesten = ["armreif"], raum = "stadion", abstand = [20.0, 35.0]}],
	"faecherwedler": [{gesten = ["arm_ausschuetteln", "bauch"], abstand = [20.0, 35.0]}],
	"faehrmann": [{gesten = ["gaehnen", "gaehnen_stab", "bart_kratzen"], abstand = [20.0, 40.0]}],
	"hieron": [{gesten = ["bart_streichen", "finger_trommeln"], raum = "werkstatt", vor = "R5",
		abstand = [15.0, 30.0]},
		{gesten = ["bart_streichen"], raum = "werkstatt", abstand = [15.0, 30.0]}],
	"hofkater": [{gesten = ["putzen"], vor = "R2b", abstand = [15.0, 30.0]}],
	"leonidas": [{gesten = ["dehnen", "pfeife_drehen"], raum = "stadion", abstand = [15.0, 30.0]}],
	"nebet": [{gesten = ["abschmecken", "teig_kneten", "mehl_wischen"], raum = "palastkueche",
		abstand = [15.0, 30.0]}],
	"philosoph": [{gesten = ["laterne_spaehen", "laterne_putzen", "bart_kratzen"], raum = "agora",
		abstand = [15.0, 30.0]}],
	"ramses": [{gesten = ["unentschlossen", "zepter_tauschen", "zepter_wiegen", "kopftuch"],
		raum = ["thronsaal_ramses", "stadion"], abstand = [20.0, 35.0]}],
	"schildkroete": [{gesten = ["kopf_einziehen"], abstand = [20.0, 40.0]}],
	"schreiber": [{gesten = ["schreiben", "schreiben", "schreiben", "stift_kauen", "einnicken",
		"strecken_gaehnen"], raum = "thronsaal_ramses", abstand = [6.0, 12.0]}],
	"sobek": [{gesten = ["gaehnen", "hut_zurechtruecken"], abstand = [20.0, 40.0]}],
	"steinmetz": [{gesten = ["staub_pusten", "stirn_wischen"], raum = "nil_delta", abstand = [15.0, 30.0]}],
	"strassenmusiker": [{gesten = ["lyra", "lyra", "stimmen"], raum = "agora", abstand = [8.0, 15.0]}],
	"tiro": [{gesten = ["schreiben", "schreiben", "kritzeln", "tafel_glaetten"], raum = "agora",
		abstand = [10.0, 20.0]}],
	"tourist": [{gesten = ["hut_faecheln", "stirn_wischen"], raum = "agora", abstand = [15.0, 30.0]}],
	"touristin": [{gesten = ["faecheln_mustern", "brille_putzen", "amphore"], raum = "agora",
		abstand = [15.0, 30.0]}],
	"zeremonienmeister": [{gesten = ["federkrone"], raum = "stadion", abstand = [15.0, 30.0]}],
}
