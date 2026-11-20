extends RefCounted
## Gesten der Welt 3 (Aufbau und Arten wie in gesten_einsatz.gd, das diese Tabellen einliest):
##   ZEILE   Zeilen-ID → [Kürzel der Figur, Bewegung, Art (vor, mit, statt_talk, bleibt, halten,
##           halten_mit), Sekunden bei halten]
##   RUHE    Figur-ID → [{geste, raum, abschnitt, nach, vor, schalter}]
##   WARTEN  Figur-ID → [{gesten, abstand: [min, max], halten, raum, abschnitt, nach, vor, schalter}]
## Zugeordnet nach den Regie-Angaben in docs/skript/welt-3.md. Die Bewegungen kommen aus den
## Figuren-Sheets von tools/grafik_w3/figuren_einbau.py. M.U.T.T.I. und Pixel in den Testkammern
## sprechen aus dem Lautsprecher; Gesten unsichtbarer Figuren werden still übergangen.

const ZEILE := {
	# Ankunft und Unterstadt
	"W3_ANK_MAX_0020": ["MAX", "regen_wischen", "vor"],       # wischt sich Regen aus dem Gesicht
	"W3_ANK_MAX_0100": ["MAX", "handy", "vor"],               # Handy raus, Handy wieder rein
	"W3_STR_FRA_0220": ["FRA", "schimpfen", "mit"],           # sie meint den Schirm
	# Nudelbude (Rätsel 2)
	"W3_NUD_VIE_0080": ["VIE", "haende_zeigen", "mit"],
	"W3_NUD_VIE_0270": ["VIE", "kopf_schuetteln", "mit"],
	"W3_NUD_VIE_0310": ["VIE", "kochen_strahlend", "vor"],
	"W3_NUD_VIE_0380": ["VIE", "schale_hinstellen", "vor"],
	"W3_NUD_MOR_0210": ["MOR", "brille_hochschieben", "mit"], # aus dem Schatten, Brille auf der Stirn
	"W3_NUD_MOR_0370": ["MOR", "schild_zeigen", "vor"],       # hebt das Pappschild
	"W3_NUD_MOR_0420": ["MOR", "leere_hand", "vor"],          # öffnet die Hand: leer
	"W3_NUD_MOR_0430": ["MOR", "schild_umdrehen", "vor"],
	"W3_NUD_MOR_0610": ["MOR", "nicken", "mit"],              # nickt zur Straße
	# Deckerts Test (Rätsel 1)
	"W3_TEST_DEC_0100": ["DEC", "notieren", "mit"],           # Notizblock raus
	"W3_TEST_DEC_0140": ["DEC", "notieren", "mit"],
	"W3_TEST_DEC_0210": ["DEC", "notieren", "mit"],
	"W3_TEST_DEC_0310": ["DEC", "stempeln", "vor"],           # Stempel auf Max' Handrücken
	"W3_TEST_MAX_0320": ["MAX", "stempel_ansehen", "vor"],
	"W3_TEST_DEC_0330": ["DEC", "seitschritt", "mit"],        # tritt zur Seite
	# Apothekengasse (Rätsel 3)
	"W3_APO_MOR_0420": ["MOR", "kekse_reichen", "vor"],
	"W3_APO_MOR_0440": ["MOR", "schulterzucken", "mit"],
	"W3_APO_MAX_0570": ["MAX", "pastille", "vor"],            # sieht auf die rote Pastille
	"W3_APO_MAX_0600": ["MAX", "schlucken", "vor"],
	"W3_APO_MOR_0610": ["MOR", "fangen", "vor"],              # fängt Pixel auf
	"W3_SOFA_MAX_0500": ["MAX", "handy", "vor"],              # starrt aufs Handy
	# Tür und Schmidt (Rätsel 5)
	"W3_TUER_MAX_0150": ["MAX", "code_sicht", "vor"],         # Code-Sicht einschalten
	"W3_TUER_SCH_0220": ["SCH", "stumm", "mit"],              # zeigt auf seinen Hals
	# Küche der Orakel-Oma (Rätsel 4)
	"W3_KUCH_ORA_0010": ["ORA", "ofen", "mit"],               # Backblech in den Ofenhandschuhen
	"W3_KUCH_ORA_0050": ["ORA", "zum_regal", "mit"],
	"W3_KUCH_ORA_0160": ["ORA", "stirn", "halten_mit", 2.0],  # lange Pause, Handschuh an der Stirn
	"W3_KUCH_ORA_0170": ["ORA", "sparschwein", "vor"],        # seufzt, reicht das Sparschwein
	"W3_KUCH_ORA_0220": ["ORA", "kehren", "mit"],
	# Büroturm (Rätsel 6)
	"W3_TURM_SCH_0030": ["SCH", "kopierer", "vor"],
	"W3_TURM_KLO_0070": ["KLO", "werfen", "vor"],             # Locher in Zeitlupe
	"W3_TURM_NAR_0080": ["MAX", "zeitlupe", "vor"],           # Zeitlupen-Ausweichen
	"W3_TURM_MAX_0090": ["MAX", "hexenschuss", "mit"],        # hält sich den Rücken
	"W3_TURM_SCH_0110": ["SCH", "hausschuh", "mit"],          # alle heben ein Bein mit Hausschuh
	"W3_TURM_MAX_0380": ["MAX", "hochhalten", "mit"],         # hebt die Tasse
	"W3_TURM_SCH_0430": ["SCH", "brille_ab", "vor"],
	"W3_TURM_SCH_0450": ["SCH", "akte", "mit"],               # hält Max die Akte hin
	# Basis und Terminal (Rätsel 7, 13)
	"W3_TERM_MAX_0080": ["MAX", "tippen", "vor"],
	"W3_TERM_MAX_0120": ["MAX", "tippen", "vor"],
	"W3_TERM_MAX_0150": ["MAX", "tippen", "vor"],
	"W3_TERM_PIX_0130": ["PIX", "morse", "vor"],              # Miau-Morse am Terminal der Basis
	"W3_TERM_PIX_0220": ["PIX", "kabel", "vor"],
	"W3_TERM_PIX_0230": ["PIX", "kabel", "vor"],
	"W3_TERM_PIX_0240": ["PIX", "kabel", "vor"],
	"W3_TERM_PIX_0250": ["PIX", "kabel", "vor"],
	"W3_TERM_PIX_0300": ["PIX", "kabel", "vor"],
	"W3_BAS_KAL_0040": ["KAL", "fluestern", "statt_talk"],    # Schraubenzieher im Mund
	"W3_BAS_MAX_0060": ["MAX", "tasche", "vor"],
	"W3_BAS_KAL_0110": ["KAL", "lachen", "mit"],
	"W3_BAS_KAL_0150": ["KAL", "zeigen", "mit"],              # zeigt aufs Terminal
	"W3_BAS_KAL_0160": ["KAL", "kabel", "vor"],               # Kabel an Pixels Halsband
	"W3_BAS_REB_0180": ["REB", "karton", "mit"],
	"W3_PIEP_PIX_0010": ["PIX", "tasse", "vor"],              # Tasse vom Tisch schieben
	"W3_PIEP_KAL_0040": ["KAL", "entsetzt", "mit"],           # starrt auf die Pfütze
	"W3_PIEP_NAR_0050": ["PIE", "hochfahren", "vor"],
	"W3_PIEP_PIE_0060": ["PIE", "piepen", "mit"],
	"W3_PIEP_PIE_0170": ["PIE", "drucken", "vor"],
	"W3_PIEP_KAL_0190": ["KAL", "tabelle", "vor"],            # sortiert dreimal um
	"W3_PIEP_KAL_0210": ["KAL", "fluestern", "statt_talk"],
	"W3_ENDE_KAL_0030": ["KAL", "jubel", "mit"],              # am Terminal, aufgeregt
	"W3_ENDE_MAX_0120": ["MAX", "hochhalten", "mit"],         # Zelle fest in der Hand
	# Laboreingang (Rätsel 8)
	"W3_EING_HAU_0010": ["HAU", "verbeugen", "vor"],
	"W3_EING_MAX_0020": ["MAX", "zeigen", "mit"],             # zeigt auf die Panzertür
	"W3_EING_HAU_0150": ["HAU", "wischen", "mit"],
	"W3_EING_MAX_0160": ["MAX", "gedankentrick", "vor"],
	"W3_EING_HAU_0200": ["HAU", "lesen", "vor"],              # nimmt die Seite mit beiden Händen
	"W3_EING_MAX_0240": ["HAU", "arm_drehen", "vor"],         # geölt: der Arm dreht wieder
	# Suppe (Rätsel 12)
	"W3_SUPP_VIE_0020": ["VIE", "glueckskeks", "vor"],        # bricht ihn auf
	"W3_SUPP_VIE_0030": ["VIE", "zettel_lesen", "vor"],
	"W3_SUPP_VIE_0060": ["VIE", "kochen_weinend", "mit"],
	"W3_SUPP_VIE_0100": ["VIE", "schale_hinstellen", "vor"],
	"W3_SUPP_MAX_0110": ["MAX", "nudeln", "vor"],             # isst
	"W3_SUPP_WEI_0120": ["WEI", "weinen", "mit"],             # weint lauter
	"W3_SUPP_VIE_0130": ["VIE", "karte_reichen", "vor"],
	# Testkammern und Kern
	"W3_KAM1_MAX_0140": ["MAX", "portalgeraet", "vor"],
	"W3_KAM1_BER_0170": ["BER", "davonschweben", "vor"],
	"W3_KERN_MUT_0200": ["MUT", "herunterfahren", "vor"],
}

const RUHE := {
	"strassenmusiker_w3": [{geste = "spielen", raum = "unterstadt_strasse"}],
	"weinender_mann": [{geste = "weinen", raum = "unterstadt_strasse"}],
	"deckert": [{geste = "regen_zaehlen", raum = "unterstadt_strasse"}],   # W3-P32: zählt den Regen
	"rebell": [{geste = "essen", raum = "widerstandsbasis"}],
	"rebellin": [{geste = "essen", raum = "widerstandsbasis"}],
	"hausmeister": [{geste = "wischen", raum = "laboreingang", vor = "R8"}],
}

const WARTEN := {
	# Max: Rücken nach dem Hexenschuss steht in gesten_einsatz.gd (vor seinem allgemeinen Eintrag)
	"herr_vier": [{gesten = ["kopf_schuetteln", "vier_finger"], raum = "unterstadt_strasse", abstand = [20.0, 40.0]}],
	"morphaeus": [{gesten = ["haende_falten", "brille_hochschieben"], abstand = [20.0, 35.0]}],
	"orakel_oma": [{gesten = ["haende_falten"], raum = "kueche_orakel", abstand = [20.0, 35.0]}],
	"kalle": [{gesten = ["tippen", "tippen", "lachen"], raum = "widerstandsbasis", abstand = [15.0, 30.0]}],
	"klon": [{gesten = ["umsehen"], raum = "buero_50", abstand = [15.0, 30.0]}],
	"hausmeister": [{gesten = ["warten"], raum = "laboreingang", nach = "R8", abstand = [20.0, 40.0]}],
	"frau_regenschirm": [{gesten = ["schimpfen"], raum = "unterstadt_strasse", abstand = [20.0, 40.0]}],
	"mutti": [{gesten = ["beleidigt"], raum = "kern", abstand = [20.0, 40.0]}],
}
