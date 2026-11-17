extends RefCounted
## Gesten der Welt 1 (Aufbau und Arten wie in gesten_einsatz.gd, das diese Tabellen einliest):
##   ZEILE   Zeilen-ID → [Kürzel der Figur, Bewegung, Art (vor, mit, statt_talk, bleibt, halten,
##           halten_mit), Sekunden bei halten]
##   RUHE    Figur-ID → [{geste, raum, abschnitt, nach, vor}]
##   WARTEN  Figur-ID → [{gesten, abstand: [min, max], halten, raum, abschnitt, nach, vor}]
## Max und Pixel über alle Welten stehen in gesten_einsatz.gd. Was eigenen Raumcode braucht (Schmied-
## Zyklus mit Funken, Humbert in den Keller, Minka umgarnen, Besen, Toadi keucht nach dem Rennen),
## steht in den Räumen; die Regie mit Gründen in docs/grafik/gesten-regie.md.

const ZEILE := {
	# Dorfplatz
	"W1_ANK_TOA_0120": ["TOA", "auf_max_zeigen", "vor"],      # „Du! Du siehst aus wie einer!“
	"W1_DORF_MAX_1140": ["MAX", "bohne", "vor"],              # R8, Pflanzen und Gießen in einem (Entscheidung 12)
	# Wasserschloss: Toadi rennt heran und keucht
	"W1_WASS_TOA_0020": ["TOA", "keuchen", "halten_mit", 2.4],
	# Taverne
	"W1_TAV_GOL_1210": ["GOL", "ring_werfen", "mit"],         # R1c
	"W1_TAV_PIX_1470": ["HUH", "plustern", "vor"],            # Pixel übersetzt Berta
	# Zauberstab-Laden: der Kochlöffel-Zauberstab
	"W1_STAB_STA_0510": ["MAX", "kochloeffel", "vor"],        # „Er hängt an dir!“
	"W1_STAB_MAX_0590": ["MAX", "kochloeffel", "vor"],        # Schwingen ohne Ziel
	"W1_STAB_STA_0710": ["STA", "mustern", "vor"],
	# Klassenzimmer
	"W1_HOGG_ALW_0402": ["ALW", "kochbuch", "vor"],           # putzt die Brille
	# Troll-Brücke
	"W1_BRUE_WAL_0220": ["WAL", "regelbuch", "vor"],          # tippt aufs Regelbuch
	"W1_BRUE_WAL_0460": ["WAL", "regelbuch", "vor"],          # blättert im Regelbuch
	"W1_BRUE_WAL_0960": ["WAL", "fussbad", "halten", 3.2],    # R4c, setzt sich ins Fußbad (Entscheidung 4)
	"W1_BRUE_PIX_0410": ["PIX", "fauchen", "vor"],
	# Zauberwald: Waldemars Musical-Nummer
	"W1_WALD_WAL_0490": ["WAL", "musical", "statt_talk"],
	"W1_WALD_WAL_0500": ["WAL", "musical", "statt_talk"],
	# Luftschloss
	"W1_LUFT_MAK_0420": ["MAK", "notieren", "mit"],
	# Smaugis Abstellkammern, R12
	"W1_SMAU_SMA_0380": ["SMA", "schniefen", "statt_talk"],
	"W1_SMAU_SMA_0510": ["SMA", "kram_hergeben", "vor"],
	"W1_SMAU_HUM_0530": ["SMA", "kram_hergeben", "vor"],      # Schwerter
	"W1_SMAU_GRI_0550": ["SMA", "kram_hergeben", "vor"],      # Fackeln
	"W1_SMAU_ZEL_0580": ["SMA", "kram_hergeben", "vor"],      # Kronleuchter
	"W1_SMAU_SMA_0540": ["SMA", "schniefen", "statt_talk"],
	"W1_SMAU_SMA_0610": ["SMA", "schniefen", "statt_talk"],
	# Thronsaal: Zaubern und Niesen nur bis zum Niesen (Entscheidung 5)
	"W1_THRO_MOD_0050": ["MOD", "zaubern", "vor"],            # violetter Funke an die Decke
	"W1_THRO_MOD_0250": ["MOD", "niesen", "vor"],             # R13, der Stab fliegt
}

const RUHE := {
	"humbert": [{geste = "polieren", raum = "taverne"}],
	"gollo": [{geste = "ringschachtel", raum = "taverne", vor = "R1c"}],
	# xxl_ziege: „kauen“ ist eine andere Zeichnung (Dreiviertel-Ansicht, schwebt); Ruhe bleibt der Stand (Review 17.11., A-01)
	"rotkaeppchen": [{geste = "pakete"}],
	"grimmzahn": [{geste = "protest", raum = "bergwerk", vor = "R10"}],
	"goblin_1": [{geste = "pickel", raum = "bergwerk", nach = "R10"}],
	"smaugi": [{geste = "staubwedel", raum = "abstellkammern", vor = "R12"}],
}

const WARTEN := {
	"toadi": [{gesten = ["haende_ringen"], raum = ["dorfplatz", "klassenzimmer", "wasserschloss"],
		abstand = [15.0, 30.0], halten = [1.6, 2.4]}],
	"minka": [{gesten = ["putzen"], raum = "taverne", vor = "R1a", abstand = [15.0, 25.0]}],
	"huhn": [{gesten = ["plustern"], abstand = [20.0, 40.0]}],
	# Zwischen dem Hämmern (Ruhe-Schleife im Raum) wischt sich der Schmied den Schweiß ab. Der Arbeits-
	# zyklus aus Entscheidung 3 ist im Raum geprüft und bewusst nicht eingebunden: In „ins_feuer“ und
	# „zum_amboss“ läuft er im Bild von der Esse weg (die Esse liegt links vom Amboss), „abschrecken“
	# zeigt den Dampf als flache weiße Fläche, und bei „blasebalg“ steht kein Blasebalg an seinem Platz
	# (gesten-regie.md, Welt 1).
	"schmied": [{gesten = ["schweiss_abwischen"], raum = "schmiede", abstand = [15.0, 30.0]}],
	"schmiede_ziege": [{gesten = ["drehen"], abstand = [20.0, 40.0]}],
	"stabmacher": [{gesten = ["mustern"], raum = "zauberstabladen", abstand = [15.0, 30.0]}],
	"alwin": [{gesten = ["kochbuch"], raum = "klassenzimmer", abstand = [20.0, 40.0], halten = [3.8, 3.8]}],
	"waldemar": [{gesten = ["regelbuch"], raum = "trollbruecke", vor = "R4c", abstand = [15.0, 30.0]}],
	"maklerin": [{gesten = ["notieren"], raum = "luftschloss", vor = "R9", abstand = [15.0, 25.0]}],
	"zeldina": [{gesten = ["kiste_schwert"], raum = "luftschloss", abstand = [20.0, 40.0]}],
	"goblin_2": [{gesten = ["gaehnen"], raum = "bergwerk", vor = "R10", abstand = [15.0, 30.0]}],
	"moderwort": [{gesten = ["nase_putzen"], raum = "thronsaal", abstand = [15.0, 30.0]}],
	"schwan": [{gesten = ["fauchen"], abstand = [20.0, 40.0]}],
}
