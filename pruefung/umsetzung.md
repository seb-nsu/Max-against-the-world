# Umsetzung der 360-Grad-Prüfung: Protokoll

Grundlage: `pruefung/360-pruefung.md` (111 Funde). Auftrag: `pruefung/umsetzung-prompt.md`.

## Stand

- Paket 1 (die drei kritischen Fehler): fertig.
- Paket 2 (Werkzeuge): fertig.
- Paket 3 (Rätseltexte und Hinweis-Lücken): fertig.
- Paket 4 (Widersprüche): fertig.
- Paket 5 (Originalwortlaut): fertig.
- Pakete 6 bis 9: noch nicht begonnen.
- Weiter bei: Paket 6, Humor, Anspielungen und KI-Klang, beginnend mit Prolog und Welt 1.

Arbeitsweise nach einer Unterbrechung: Tabelle 1 zeigt je Fund den Status. Vor jedem Commit laufen `python3 tools/pruefen.py`, alle `--pruefen`-Läufe aus `.github/workflows/pruefen.yml` und nach Code-Änderungen die Godot-Tests.

## 1. Alle 111 Funde

Status: umgesetzt, nicht bestätigt, Entscheidung bitte prüfen, offen für Sebastian.

| Nr. | Paket | Status | Was geändert wurde und wo |
| --- | --- | --- | --- |
| 1 | 1 | umgesetzt | Bestätigt. `spiel.gd`: `wechsel_moeglich()` fragt jetzt `wechsel_frei()`. Abschnitte ohne eigenen Schalter antworten über ihre Regeln. `finale.gd`: Wechsel frei ab dem Hilferuf bis zur roten Taste, in den Zwischenspielen gesperrt. Kein neuer Schalter nötig. Test `finale_anspiel.gd` spielt Schritt C jetzt über Klicks auf Sessel und Porträts (vorher 3 Fehler, jetzt 0). |
| 2 | 1 | umgesetzt | Bestätigt. `godot_raeume.py` übernimmt Zusätze nach dem Komma als Bedingung in Worten, kennt „drittes Mal“, „viertes Mal“ und „als Pixel“ und bricht ab, wenn eine Zeile eine andere am selben Objekt verdrängt. `spiel.gd`: `eintrag_passt()` wertet die Worte über die Regeln aus (`zusatz_ok`), `ansehen()` sagt die dritte und vierte Zeile. Neue Bedingungen in `welt_2.gd` (Finaltag, Duell), `welt_3.gd` (Panzertür, zweiter Tausch, Olivenöl), `welt_4.gd` (Grusel-Sender). 27 Auslöser im Skript berichtigt (Tabelle in Abschnitt 2), vier falsche Zuordnungen in `tools/layout/welt-2.yaml` entfernt. Alle 50 Paare der Liste sind aufgelöst. Neuer Test `ansehen_zustand.gd` über Rechtsklick (vorher 7 Fehler, jetzt 0). Offen bleibt: Wann die Telefonzelle in der Simulation klingelt, hat im Spiel keinen Zustand (Liste für Sebastian). |
| 3 | 1 | umgesetzt | Bestätigt. `hinweise.gd`: Stufe und Zeit hängen am Schlüssel `<abschnitt>/<schritt>`. `zustand.gd`: alte Schlüssel ohne Abschnitt verfallen beim Laden, die Hinweise beginnen dann wieder bei Stufe 1. `welt_3.gd`, `welt_4.gd`: Errungenschaft „Ohne Pfote“ liest den neuen Schlüssel. Neuer Test `hinweise_welten.gd` über Klicks auf die Pfote (vorher 5 Fehler, jetzt 0). Nicht Teil des Fundes und unverändert: `letzter_schritt` und das Notizbuch-Ziel merken sich weiter nur die Rätselnummer. |
| 4 | 3 | umgesetzt, in Teilen nicht bestätigt | Bestätigt für Welt 4 R4, Welt 1 R10a und R10b, Finale Schritt B. Welt 4 R4: drei neue Hinweiszeilen `W4_HINT_PIX_0700` bis `0720` (Entscheidung, bitte prüfen: neuer Wortlaut). Welt 1: R10a und R10b nutzen die Zeilen von R10 (`hinweise_von` in den Spieldaten, `hinweise.gd`: `zeilen_schritt()`). Finale Schritt B: `hinweise.gd` wertet „nur …“ und „ohne …“ aus, Pixel sagt die Fassung mit oder ohne Roboter. `spieldaten.py` bricht ab, wenn ein Schritt, der offen sein kann, nicht alle drei Stufen hat oder eine Bedingung nicht lesbar ist. Nicht bestätigt für Welt 4 R5, R10, R11, R12: Diese Sammelschritte löst das Spiel im selben Zug wie ihren letzten Teilschritt, sie sind nie allein offen. Test `hinweise_welten.gd` um 6 Prüfungen erweitert (vorher 3 Fehler, jetzt 0). |
| 5 | 3 | umgesetzt | Bestätigt. `W4_SIT_SMU_0360` nach dem Vorschlag im Bericht: Der Platz der Hyäne war gestern leer. `docs/raetsel/welt-4.md` nachgezogen. |
| 6 | 3 | Entscheidung, bitte prüfen | Bestätigt. Geändert ist nur `W4_SIT_VAT_0420`: Der Vater nennt jetzt Mantel und Krawatte („Und Krawatte, nehme ich an. Chefs tragen so was.“). Der Bericht schlägt „überall Mantel“ vor. Das hätte drei Zeilen geändert, darunter `W4_SIT_VAT_0160` und `W4_SIT_MAX_0170` mit dem Krawatten-Witz. So bleiben beide Wörter richtig, und der Spieler sucht nichts Falsches. |
| 7 | 3 | umgesetzt | Bestätigt, nachgerechnet. `W2_DISK_HER_0240`: Hermes begründet jetzt mit Leonidas. Die Pointe „nicht mal mit Anlauf“ bleibt. |
| 8 | 3 | umgesetzt | Bestätigt. `P0_DACH_MAX_0630` folgt direkt auf `0620` (Auslöser „nach 0620“). Die Nahansicht öffnet beim ersten Ansehen (`hotspot_kalender.gd`). Wortlaut unverändert. Das zweite Ansehen nimmt jetzt eine Zeile aus dem allgemeinen Vorrat (Liste für Sebastian). Test `prolog_durchlauf.gd` angepasst. |
| 9 | 3 | umgesetzt | Bestätigt. `W1_DORF_MAX_0180`: Der Steckbrief nennt den Turm („Wohnhaft: Dunkler Turm, sieben Stockwerke, steht größtenteils leer“). Neue Zeile `W1_ABS_MAK_0225` („Bring mir ein Objekt, dann reden wir.“), nach dem Vorschlag im Bericht. `docs/raetsel/prolog-und-welt-1.md` nachgezogen. |
| 10 | 3 | umgesetzt | Bestätigt. `W4_STUD_MAX_0190`, `0220`, `0290`: Die Lösungssätze sind gestrichen, Max beschreibt nur noch Zappmann. Abweichung vom Bericht: Die gestrichenen Sätze sind nicht zu Hinweis Stufe 1 geworden. Stufe 1 von R13 gehört dem Sofa-Angebot, und Stufe 2 und 3 nennen Pause, Adapter und Taste schon. |
| 11 | 3 | Entscheidung, bitte prüfen | Bestätigt. Gewählt ist der kleinere Weg: `docs/raetsel/welt-3.md` verspricht keine Rätsel mehr für „Nacht“ und „Regen“. Die Tabelle der Eingriffe hat eine Spalte „Wofür“ (Gag, Gag, Zweitweg in Rätsel 11, Fehlversuch in Rätsel 7). Am Skript ist nichts geändert. Der andere Weg (kleines Rätsel für Nacht oder Regen) steht auf der Liste für Sebastian. |
| 12 | 4 | umgesetzt | Bestätigt. Neue Zeile `W1_SMAU_MAX_0645` direkt nach der Ei-Übergabe, nach dem Vorschlag im Bericht („Ich hab das Ei. Ich könnte jetzt gehen. // … Zeldina hat immer noch keine Wohnung.“). `room_abstellkammern.gd` spielt sie nach 0640, `prolog_durchlauf.gd` prüft sie. |
| 13 | 4 | umgesetzt | Bestätigt. `FI_DACH_OPA_0060` nach dem Vorschlag im Bericht („Viermal zwanzig Minuten. Ich bin selbst überrascht.“). |
| 14 | 4 | umgesetzt, Bilder offen | Bestätigt. `P0_TREP_MAX_0020`: „Draußen ist bestes Wetter.“ Die beiden Bilder (Wohnzimmer, Treppenhaus) erzeuge ich nicht neu, die Prompts dafür folgen in Paket 7. |
| 15 | 4 | umgesetzt, eine Zeile nicht bestätigt | Bestätigt für sechs der sieben Zeilen. `W3_KUCH_PIX_0535`, `W3_TURM_PIX_0235`, `W3_KAM1_PIX_0365`, `W3_KERN_PIX_0415`, `W3_INV_PIX_0045`, `W3_INV_PIX_0135` sind auf die Leitung umgeschrieben, die Pointen bleiben. Sprecher wie bei den Nachbarzeilen („aus dem Wandtelefon“, „aus dem Terminal“, „aus dem Lautsprecher“). Ofen, Topfpflanzen und kalte Kekse kommen erst, wenn Pixel auf der Leitung ist (Bedingung im Auslöser). Nicht bestätigt: `W3_INV_PIX_0115` (Gummihuhn) ist eine Erinnerung, Pixel tut dort nichts, die Zeile bleibt. |
| 16 | 4 | umgesetzt, eine Zeile Entscheidung | Bestätigt. `P0_DACH_MAX_0680` ohne das Wort „Testbild“ (Vorschlag aus Abschnitt C, die Zeitung bleibt). `W4_KELL_MAX_0175` und `W4_KAPI_MAX_0525` gestrichen, `W3_BAS_MAX_0755` ohne den Stecker-Nachsatz (alle drei laut Streichliste in Abschnitt D). Entscheidung, bitte prüfen: `W4_TEST_MAX_0255` bleibt, weil Abschnitt D sie ausdrücklich duldet („schadet nicht“). |
| 17 | 6 | noch nicht bearbeitet |  |
| 18 | 4 | umgesetzt | Bestätigt. `W1_SCHM_MAX_0770` und `W1_SCHM_SCH_0780` gestrichen, `W1_ABS_SCH_0160` heißt jetzt „Mehr hab ich nicht. Nur noch Blech.“ (Alternative aus Abschnitt C). Damit geht „Kurt war ein Missverständnis“ verloren, das Abschnitt C als gelungen wertet (Liste für Sebastian). |
| 19 | 6 | noch nicht bearbeitet |  |
| 20 | 6 | noch nicht bearbeitet |  |
| 21 | 6 | noch nicht bearbeitet |  |
| 22 | 6 | noch nicht bearbeitet |  |
| 23 | 9 | noch nicht bearbeitet |  |
| 24 | 6 | noch nicht bearbeitet |  |
| 25 | 4 | umgesetzt | Bestätigt. `W4_STUD_MAX_0160` nach dem Vorschlag in Abschnitt L: „Ich bin gerade erst aufgestanden. Ich setz mich nicht wieder hin.“ „Freiwillig.“ ist dabei entfallen, wie im Vorschlag. |
| 26 | 7 | noch nicht bearbeitet |  |
| 27 | 7 | noch nicht bearbeitet |  |
| 28 | 7 | noch nicht bearbeitet |  |
| 29 | 7 | noch nicht bearbeitet |  |
| 30 | 7 | noch nicht bearbeitet |  |
| 31 | 2 | umgesetzt | Bestätigt. `tools/prompts_zusammensetzen.py`: Kopfzeile der Baustein-Tabelle zählt nicht mehr als Baustein, unbekannter Schlüssel bricht ab statt zu raten, Zeilen ohne eigenes Konzeptbild („Keine eigene Grafik“, „Wiederverwendung“, „FIGUR-…“) fallen weg. In den Grafik-Dateien vier Schlüssel gesetzt: Flusskarte „Ägypten“, Code-Sicht „Simulation“, Rauschen „Testbild und Rauschen“, Kindersendung „Kindersendung 1977“ (neuer Baustein aus dem Bericht in `grafik/welt-4.md`). Kein Prompt endet mehr auf „Baustein.“. Weggefallen sind Bild-in-Bild, Opa vor flackernden Lampen, Opas Sofa und „Max auf der Couch“ (Figuren-Prompt, kein Konzeptbild). |
| 32 | 7 | noch nicht bearbeitet |  |
| 33 | 7 | noch nicht bearbeitet |  |
| 34 | 7 | noch nicht bearbeitet |  |
| 35 | 7 | noch nicht bearbeitet |  |
| 36 | 8 | noch nicht bearbeitet |  |
| 37 | 8 | noch nicht bearbeitet |  |
| 38 | 8 | noch nicht bearbeitet |  |
| 39 | 9 | noch nicht bearbeitet |  |
| 40 | 9 | noch nicht bearbeitet |  |
| 41 | 2 | umgesetzt | Bestätigt und nachgestellt (SCH wurde in Welt 1 und 3 zu „Schreiber“). `tools/zeilen_einfuegen.py` sucht den Namen nur noch in der Zieldatei und bricht ab, wenn das Kürzel dort noch nicht vorkommt. Geprüft: SCH wird in Welt 1 „Schmied“, in Welt 3 „Schmidt“, GRI in Welt 2 „Grieche“. Die Kürzel selbst bleiben, weil Zeilen-IDs nicht umnummeriert werden. |
| 42 | 5 | umgesetzt, in Teilen Entscheidung | Bestätigt. Eigene Sätze statt Originalwortlaut: Gollos Rätsel (`W1_TAV_GOL_0760`, `W1_TAV_MAX_0770`: Flasche statt Berg), „einzige Hoffnung“ (`W3_PIEP_OPA_0120`), Gedankentrick (`W3_EING_MAX_0160`), „Kaninchenbau“ (`W3_NUD_MOR_0420`), „Die Wahrheit ist irgendwo da draußen“ (`W4_HALL_AGE_0350`, Rätsel 8 heißt jetzt „Ein Beweis für den Agenten“). Kessel-Lauf gestrichen (`W3_BAS_MAX_0430` bis `KAL_0460`), „Gleis neundreiviertel“ gestrichen (`W1_DORF_MAX_0295`). Entscheidung, bitte prüfen: Mensch-Test Frage 1 ist jetzt das Portemonnaie im Bus (sieben Zeilen `W3_TEST_*` und `W3_HINT_PIX_0160`, Aufbau und Pointen unverändert). Die Römer-Frage und ihre Aufzählung sind neu geschrieben (`W2_AGOR_GRI_0400`, `0410`, Konter 4 in `W2_RING_MAX_0110`, `W2_RING_CIC_0120`: Kalender, Fußbodenheizung, Beton, Post). `W2_SAND_GRI_0190` heißt „Er sagt Nein! So bescheiden ist nur der Echte!“. Aus „Passierschein A38“ wird „Passierschein Vier-Strich-Ypsilon“ (fünf Zeilen). Unverändert laut Bericht: `FI_RIEG_MAX_0155`, „Die spinnen, die Griechen“, „Vielsaft“ und „Schicksalsberg“ (im Rechtscheck als „bleiben“ geführt). Unverändert bleibt auch der schlichte Satz „Ich bin nicht der Messias.“ samt Brians Schild. Rätsel-Dateien, Grafik-Tabelle Welt 3 und Englisch nachgezogen. |
| 43 | 5 | offen für Sebastian | Nichts geändert. Der Bericht empfiehlt, die Nähe von Welt 3 zur Filmvorlage rechtlich prüfen zu lassen. Das kann nur ein Anwalt entscheiden. Mit Paket 5 sind drei wortnahe Zitate aus dieser Welt weg. |
| 44 | 5 | Entscheidung, bitte prüfen | Bestätigt. Drei englische Namen rücken weiter vom Original weg, in `ui.csv`, `en.csv` und im Glossar in `05-spielsysteme.md`: „Hogwartle“ wird „Hogglewarz“, „Polyjuicy Lemonade“ wird „Manyjuice Lemonade“, „Wheel of Fortune (Shopping)“ wird „Lucky Wheel (Shopping)“. Im Englischen steht bei `W4_HALL_AGE_0350` auch nicht mehr der Serienslogan. Unverändert: „Paw and Order“ (Wortspiel wie „Tiertort“) und „Morphaeus“ (Figurenname, siehe Fund 105). |
| 45 | 9 | noch nicht bearbeitet |  |
| 46 | 5 | umgesetzt | Bestätigt. `W4_FABR_FLE_0330`: „Ein Anführer mit Laken!“ |
| 47 | 2 | umgesetzt | Teilweise anders als im Bericht: `en_eintragen.py` teilt schon an „//“. Die 793 Zeilen sind am Werkzeug vorbei in `en.csv` gekommen. Alle 793 geteilt (die Blasenzahl passte überall), dabei 124 ältere Folgeblasen durch die neuere Fassung ersetzt. Neu in `tools/pruefen.py`: Fehler bei „//“ im englischen Text, bei abweichender Blasenzahl und bei Schlüsseln, die es im Skript nicht mehr gibt. |
| 48 | 2 | umgesetzt | Bestätigt. `pruefen.py`: 102 harmlose Meldungen „Nummer nicht aufsteigend“ sind jetzt Hinweise (`--hinweise`), falscher Sprechername ist ein Fehler, jede Warnung bricht ab. `spieldaten.py --pruefen` und `godot_raeume.py --pruefen` brechen bei Warnungen ab. `abdeckung.py` zählt verdrängte Ansehen-Zeilen als fehlend. `godot_raeume.py` bricht ab, wenn eine Gesprächsoption oder ein Zuruf eine Bedingung in Worten hat, die das Spiel nicht kennt. `testbuild.yml`: zweiter Import ohne Fehlermeldung, dazu alle Durchläufe vor dem Export. **Dabei gefunden (nicht im Bericht):** In Welt 3 bot Deckert die Option zum Mensch-Test nie an und die Orakel-Oma zwei Optionen zur Vase nie. Die Welt war über die Bedienung nicht lösbar, der Test rief die Regeln direkt auf. Behoben in `cq_dialog.gd` (Regeln entscheiden zuerst), `godot_raeume.py` („startet …“ ist Anmerkung), `spiel.gd` (Zuruf „vor dem Duell“ in Welt 1 kam nie). `welt_3_anspiel.gd` prüft jetzt, dass die Optionen angeboten werden (vorher 2 Fehler). Die Prüfung der Hinweise je offenem Schritt kommt mit Fund 4 in Paket 3. |
| 49 | 9 | noch nicht bearbeitet |  |
| 50 | 9 | noch nicht bearbeitet |  |
| 51 | 9 | noch nicht bearbeitet |  |
| 52 | 9 | noch nicht bearbeitet |  |
| 53 | 9 | noch nicht bearbeitet |  |
| 54 | 4 | umgesetzt | Bestätigt. `P0_DACH_OPA_0370`: „Er kennt jede Sendung, die je gelaufen ist, und er kennt alle Antworten.“ Der zweite Satz aus dem Vorschlag fehlt, weil Pixel in `0380` auf „alle Antworten“ antwortet. |
| 55 | 4 | Entscheidung, bitte prüfen | Bestätigt. Gewählt: offen lassen. `ZS3_DACH_PIX_0020` endet nach „Jemand will, dass in diesem Haus etwas gekauft wird.“, Pixel sieht Opa nicht mehr an. Der andere Weg (Oma als Absenderin, eine neue Zeile im Finale) steht auf der Liste für Sebastian. |
| 56 | 4 | umgesetzt | Bestätigt. `FI_AUFL_OPA_0230`: „Einmal. Zum Testen. Durch alle Kanäle.“ |
| 57 | 4 | umgesetzt | Bestätigt. „zwei Wochen“ in `W4_STUD_MAX_0160`. `ZS1_DACH_MAX_0120`: „ich hab es durch den halben Turm getragen“. Der Vorschlag „runtergetragen“ stimmt nicht, der Weg mit dem Ei führt nach oben in den Thronsaal. |
| 58 | 4 | umgesetzt | Bestätigt. `FI_AUFL_PIX_0240` („Seit Kanal 42.“), `FI_DACH_PIX_0160` und `FI_AUFL_MAX_0250` („auf Kanal 999“). Dasselbe Muster steht noch in `FI_AUFL_PIX_0080` („nach Welt 2“). Die Zeile gehört zur geschützten Auszahlung von „Bäckerei“ und ist nicht Teil des Fundes, sie bleibt (Liste für Sebastian). |
| 59 | 4 | umgesetzt | Bestätigt. `FI_AUFL_MAX_0270`: „Du kennst ihn. Lange Geschichte, hast du geblinkt. Ich hab Zeit.“ `FI_HINT_PIX_0200`: „Unten“. |
| 60 | 4 | umgesetzt | Bestätigt. `FI_HINT_PIX_0200` mit dem Satz aus dem Bericht: „Dein Großvater hat es trotzdem geschafft.“ |
| 61 | 4 | umgesetzt, Maklerin Entscheidung | Bestätigt. Modell 08/15 (`W3_EING_HAU_0030`), Stabmacher (`W1_ABS_STA_0120`) und Beamter 1 (`W2_ABS_BE1_0240`) duzen jetzt durchgehend, wie in ihren übrigen Zeilen. Entscheidung, bitte prüfen: Die Maklerin siezt durchgehend (`W1_LUFT_MAK_0420`, `W1_ABS_MAK_0225`), weil zwei ihrer drei Zeilen mit Anrede schon „Sie“ sagen. |
| 62 | 4 | Entscheidung, bitte prüfen | Bestätigt. Gewählt: Die Mutter ist die Tochter von Oma und Opa. `FI_WOHN_MUT_0260` beginnt mit „Papa“ statt „Konrad“. Der andere Weg wäre „Alles Gute, Hildegard.“ in `0230`. |
| 63 | 4 | umgesetzt | Bestätigt. `W1_ABS_GOL_0220`: „Meine Worte sind weg.“ Das Gold fehlt jetzt, weil Gollo seine Münze vor Rätsel 1 noch hat. Der Vorschlag im Bericht stimmt erst nach Rätsel 1, dann schläft Gollo. `W1_SMAU_SMA_0880`: „Ein Kollege!“ |
| 64 | 4 | Entscheidung, bitte prüfen | Bestätigt. `W1_WALD_ROT_0222` steht in der Vergangenheit („Sie ist dauernd umgezogen“), Mallorca bleibt die Pointe in `0780`. `W1_LUFT_ZEL_0840`: „Der letzte Drache war mein Vermieter. Sein Turm war zu teuer.“ Damit ist ein früherer Drache gemeint, nicht Smaugi. |
| 65 | 4 | umgesetzt | Bestätigt. `W3_EING_HAU_1060` in der Reihenfolge des Auftragszettels (Alternative aus Abschnitt C). |
| 66 | 4 | umgesetzt | Bestätigt. `W3_KAM2_MUT_0250` nach dem Vorschlag im Bericht. |
| 67 | 4 | umgesetzt | Bestätigt, alle vier Stellen: `W3_KAM1_MAX_0390` („gesagt hat. Zu meinem Besten.“), `W3_APO_MAX_0295` („Strickjacke“), `W3_HINT_PIX_0350` („Vierzehn Jahre davon war ich dabei“), `W2_NIL_PIX_1070` („seit zwei Welten“). |
| 68 | 4 | umgesetzt | Bestätigt. `W4_INV_MAX_0010` nach dem Vorschlag im Bericht. |
| 69 | 4 | umgesetzt | Bestätigt. `FI_RAET_MAX_0090` gilt nur mit `FREUND_0815`, neue Zeile `FI_RAET_MAX_0095` ohne Roboter. `finale.gd` wählt die Fassung, `finale_anspiel.gd` prüft sie. |
| 70 | 4 | umgesetzt | Bestätigt. `W1_BERG_GRI_0840` mit der Alternative aus Abschnitt C. Waldemars Satz bleibt. |
| 71 | 4 | umgesetzt | Bestätigt. `W1_BRUE_WAL_1060`: „Das Bad ist Paragraf drei.“ `W1_BRUE_WAL_1000` und `ZS1_DACH_PIX_0570`: „Paragraf 14b“. `docs/test/beobachtungsbogen.md` nachgezogen. In `entscheidungen.md` steht weiter „Regel 14b“, das ist dein Protokoll. |
| 72 | 4 | umgesetzt | Bestätigt. `W1_ANK_PIX_0040`: Drehknopf statt Fernbedienung. |
| 73 | 4 | Entscheidung, bitte prüfen | Bestätigt. Das Huhn heißt jetzt Berta (`W1_TAV_PIX_1470`). Der andere Weg wäre, den Gleichklang mit Hildegard im Finale zu nutzen. |
| 74 | 6 | noch nicht bearbeitet |  |
| 75 | 6 | noch nicht bearbeitet |  |
| 76 | 6 | noch nicht bearbeitet |  |
| 77 | 6 | noch nicht bearbeitet |  |
| 78 | 6 | noch nicht bearbeitet |  |
| 79 | 6 | noch nicht bearbeitet |  |
| 80 | 7 | noch nicht bearbeitet |  |
| 81 | 6 | noch nicht bearbeitet |  |
| 82 | 6 | noch nicht bearbeitet |  |
| 83 | 7 | noch nicht bearbeitet |  |
| 84 | 7 | noch nicht bearbeitet |  |
| 85 | 7 | noch nicht bearbeitet |  |
| 86 | 7 | noch nicht bearbeitet |  |
| 87 | 7 | noch nicht bearbeitet |  |
| 88 | 7 | noch nicht bearbeitet |  |
| 89 | 7 | noch nicht bearbeitet |  |
| 90 | 8 | noch nicht bearbeitet |  |
| 91 | 9 | noch nicht bearbeitet |  |
| 92 | 9 | noch nicht bearbeitet |  |
| 93 | 9 | noch nicht bearbeitet |  |
| 94 | 9 | noch nicht bearbeitet |  |
| 95 | 3 | umgesetzt | Bestätigt. `character_gollo.gd`: Jeder Gegenstand auf Gollo startet das Rätsel, solange Max die Thunfischdose hat. Auslöser von `W1_TAV_GOL_1110` und `W1_TAV_MAX_1120` und die Rätsel-Datei nachgezogen. Wortlaut unverändert. |
| 96 | 3 | umgesetzt | Bestätigt. Neue Zeile `W3_EING_PIX_0185` („Er quietscht noch. Und du hast Öl in der Tasche.“): Pixel warnt einmal, wenn Max die Telefonbuchseite vor dem Ölen gibt, die Seite bleibt bei Max (`welt_3.gd`, Schalter `W3_OEL_WARNUNG`). Der Halbsatz „Ich sage es nur“ aus dem Vorschlag fehlt, weil Abschnitt E ihn als Muster führt. `W3_SUPP_VIE_0130`: Die Karte lag „im Leergut aus dem Labor“, damit ist ihre Herkunft kein Zufall mehr. Test `welt_3_anspiel.gd` erweitert. |
| 97 | 3 | umgesetzt | Bestätigt. `welt_2.gd`: Anklage und Ersatzweg gehen erst, wenn alle vier verhört sind. `welt_4.gd`: Wer die Mutter nach dem Abendessen fragt (`W4_MUTTER_FONDUE`), löst R4a beim Lesen der Folge um 20:15. Rätsel-Dateien nachgezogen, Tests `welt_2_anspiel.gd` und `welt_4_anspiel.gd` erweitert. |
| 98 | 3 | umgesetzt | Bestätigt. `W3_HINT_PIX_0130`, `0330`, `0730`, `1230` nennen keine Maus und keine Taste mehr („Sieh dir … an“, „Wechsel zu mir“). `UI_TASCHE_HILFE` in `docs/uebersetzung/ui.csv` ebenso, deutsch und englisch. |
| 99 | 3 | Entscheidung, bitte prüfen | Bestätigt. 20 neue Zweitzeilen für Gegenstände: 13 in der Taverne (`W1_TAV_MAX_0115` bis `0315`), 7 im Klassenzimmer (`W1_HOGG_MAX_0115` bis `0205`). Neuer Wortlaut, jede Zeile zeigt etwas Neues am Objekt. Die Figuren in beiden Räumen haben weiter keine Zweitzeile (Liste für Sebastian). |
| 100 | 9 | noch nicht bearbeitet |  |
| 101 | 9 | noch nicht bearbeitet |  |
| 102 | 4 | offen für Sebastian | Nichts geändert. Der Bericht sagt selbst: kann Absicht sein. Vorschlag aus dem Bericht steht auf der Liste. |
| 103 | 9 | noch nicht bearbeitet |  |
| 104 | 9 | noch nicht bearbeitet |  |
| 105 | 5 | offen für Sebastian | Keine Figur umbenannt, wie im Auftrag festgelegt. Fernere Fassungen für die Schublade stehen auf der Liste für Sebastian. |
| 106 | 9 | noch nicht bearbeitet |  |
| 107 | 9 | noch nicht bearbeitet |  |
| 108 | 9 | noch nicht bearbeitet |  |
| 109 | – | noch nicht bearbeitet |  |
| 110 | – | noch nicht bearbeitet |  |
| 111 | – | noch nicht bearbeitet |  |

## 2. Geänderte Skriptzeilen je Datei

### Auslöser (vierte Spalte), Wortlaut unverändert

Fund 2, wenn nichts anderes dasteht: Das Spiel konnte diese Zeilen nicht von einer anderen Zeile am selben Objekt unterscheiden. Geändert ist nur die Angabe, wann die Zeile kommt.

| Zeilen-ID | Auslöser vorher | Auslöser nachher | Grund |
| --- | --- | --- | --- |
| `W1_LUFT_PIX_0080` | Pixel schnuppert: Kritzelei | Pixel schnuppert: Kritzelei, zweites Mal | Zwei erste Pixel-Zeilen an der Kritzelei. Entscheidung, bitte prüfen: Die Schnupper-Zeile kommt jetzt als Pixels zweite. |
| `W2_NIL_PIX_0620` | Ansehen: Weizenfeld, zweites Mal; Notizbuch Seite 3: „irgendwas aus Mehl, mit Kruste“ | Ansehen: Weizenfeld, drittes Mal; Notizbuch Seite 3: „irgendwas aus Mehl, mit Kruste“ | Zweimal „zweites Mal“ am Weizenfeld (Fund 40). Entscheidung, bitte prüfen: Pixels Zeile kommt beim dritten Ansehen, wie am Wandfries. |
| `W2_THRO_RAM_0340` | nach dem Nehmen | nach 0330 | „nach dem Nehmen“ wurde als Ansehen-Zeile des Tellers gelesen. Jetzt Folgezeile von 0330. |
| `W2_DUEL_MAX_0120` | Ansehen: Fächerwedler während des Duells | Ansehen: Fächerwedler, während des Duells | Komma ergänzt, damit „während des Duells“ als Bedingung gilt. |
| `W2_DUEL_MAX_0125` | Ansehen: Fächerwedler während des Duells, zweites Mal | Ansehen: Fächerwedler, während des Duells, zweites Mal | wie 0120 |
| `W2_PARA_PIX_0290` | Ansehen: Siegel auf dem Sack | Ansehen: Goldener Sack Pharaonenkorn (Siegel auf dem Sack), Pixel | „Siegel auf dem Sack“ ist kein eigenes Objekt. Entscheidung, bitte prüfen: Pixels Zeile am Sack, wenn Pixel die Spielfigur ist. |
| `W2_PARA_PIX_0295` | Ansehen: Siegel auf dem Sack, zweites Mal | Ansehen: Goldener Sack Pharaonenkorn (Siegel auf dem Sack), Pixel, zweites Mal | wie 0290 |
| `W3_BAS_PIX_1060` | Pixel auf Max' Kapsel | Pixel auf Max' Kapsel, zweites Mal | Zwei erste Pixel-Zeilen an Max' Kapsel. Entscheidung, bitte prüfen: diese kommt als zweite. |
| `W3_BAS_PIX_0830` | Ansehen: Plakat, zweites Mal | Ansehen: Plakat, drittes Mal | Zweimal „zweites Mal“ am Plakat (Fund 40). Entscheidung, bitte prüfen: Pixels Zeile beim dritten Ansehen. |
| `W3_EING_MAX_0370` | Ansehen: geöffnete Tür, Datenanschlüsse | Ansehen: geöffnete Tür, Datenanschlüsse; Panzertür offen | Bedingung ergänzt: gilt erst, wenn die Panzertür offen ist (Schalter `W3_PANZERTUER_OFFEN`). |
| `W3_EING_MAX_0375` | Ansehen: geöffnete Tür, Datenanschlüsse, zweites Mal | Ansehen: geöffnete Tür, Datenanschlüsse, zweites Mal; Panzertür offen | wie 0370 |
| `W3_SIM_MAX_0170` | Ansehen: Schwarze Katze, zweiter Durchlauf | Ansehen: Schwarze Katze, zweites Mal; zweiter Durchlauf | „zweiter Durchlauf“ kennt das Spiel nicht. Die Zeile kommt beim zweiten Ansehen. |
| `W3_SIM_PIX_0180` | Ansehen: Schwarze Katze; Pixel auf der Leitung | Ansehen: Schwarze Katze, drittes Mal; Pixel auf der Leitung | Verdrängte Max' erste Zeile, sobald Pixel auf der Leitung ist. Entscheidung, bitte prüfen: jetzt drittes Ansehen. |
| `W3_SIM_PIX_0190` | Ansehen: Schwarze Katze, drittes Mal; Pixel auf der Leitung | Ansehen: Schwarze Katze, viertes Mal; Pixel auf der Leitung | Rückt dadurch auf das vierte Ansehen. |
| `W3_SIM_MAX_0220` | Ansehen: Telefonzelle; sie klingelt | Ansehen: klingelnde Telefonzelle | „sie klingelt“ hat im Spiel keinen Zustand. Die Zeile hängt jetzt am Hotspot „klingelnde Telefonzelle“, wie 0230. |
| `W3_EING_MAX_0520` | Ansehen: Hausmeister, vor Rätsel 8 | Ansehen: Hausmeister, vor Rätsel 8; mit Olivenöl | Verdrängte die Zeile „ohne Olivenöl“ (0280). Entscheidung, bitte prüfen: gilt jetzt nur mit Olivenöl in der Tasche. |
| `W3_EING_PIX_0525` | Ansehen: Hausmeister, vor Rätsel 8, zweites Mal | Ansehen: Hausmeister, vor Rätsel 8, zweites Mal; mit Olivenöl | wie 0520 |
| `W3_KAM2_MAX_0110` | Ansehen: Gummihuhn im Inventar, nach dem Tausch | Ansehen: Gummihuhn im Inventar (nach dem Tausch), toedlich | „nach dem Tausch“ galt nur in Kammer 2. Jetzt hängt die Zeile am Zustand „toedlich“ des Gummihuhns. |
| `W3_KAM2_MAX_0115` | Ansehen: Gummihuhn im Inventar, nach dem Tausch, zweites Mal | Ansehen: Gummihuhn im Inventar (nach dem Tausch), toedlich, zweites Mal | wie 0110 |
| `W4_GLUE_PIX_0460` | Ansehen: Preise, zweites Mal | Ansehen: Preise, drittes Mal | Zweimal „zweites Mal“ am selben Objekt (Fund 40). Entscheidung, bitte prüfen: Die spätere Zeile kommt beim dritten Ansehen. |
| `W4_SAV_PIX_0270` | Ansehen: Regenwolke, zweites Mal | Ansehen: Regenwolke, drittes Mal | Zweimal „zweites Mal“ am selben Objekt (Fund 40). Entscheidung, bitte prüfen: Die spätere Zeile kommt beim dritten Ansehen. |
| `W4_FRIE_MAX_0150` | Ansehen: Discokugel, zweites Mal | Ansehen: Discokugel, drittes Mal | Zweimal „zweites Mal“ am selben Objekt (Fund 40). Entscheidung, bitte prüfen: Die spätere Zeile kommt beim dritten Ansehen. |
| `W4_FRIE_MAX_0190` | Ansehen: Gittertor, zweites Mal | Ansehen: Gittertor, drittes Mal | Zweimal „zweites Mal“ am selben Objekt (Fund 40). Entscheidung, bitte prüfen: Die spätere Zeile kommt beim dritten Ansehen. |
| `W4_KELL_PIX_0050` | Ansehen: Röhrenfernseher, zweites Mal | Ansehen: Röhrenfernseher, drittes Mal | Zweimal „zweites Mal“ am selben Objekt (Fund 40). Entscheidung, bitte prüfen: Die spätere Zeile kommt beim dritten Ansehen. |
| `W4_KELL_MAX_0080` | Ansehen: Kassetten, zweites Mal | Ansehen: Kassetten, drittes Mal | Zweimal „zweites Mal“ am selben Objekt (Fund 40). Entscheidung, bitte prüfen: Die spätere Zeile kommt beim dritten Ansehen. |
| `W4_FABR_MAX_0050` | Ansehen: Suchscheinwerfer, zweites Mal | Ansehen: Suchscheinwerfer, drittes Mal | Zweimal „zweites Mal“ am selben Objekt (Fund 40). Entscheidung, bitte prüfen: Die spätere Zeile kommt beim dritten Ansehen. |
| `W4_ARCH_MAX_0030` | Ansehen: Auge, zweites Mal | Ansehen: Auge, drittes Mal | Zweimal „zweites Mal“ am selben Objekt (Fund 40). Entscheidung, bitte prüfen: Die spätere Zeile kommt beim dritten Ansehen. |
| `P0_DACH_MAX_0630` | Ansehen: Kalender, zweites Mal; öffnet die Nahansicht Kalender, Max kennt ab jetzt die Nummer | nach 0620; öffnet die Nahansicht Kalender, Max kennt ab jetzt die Nummer | Fund 8: Die Kanalnummer kommt jetzt beim ersten Ansehen, direkt nach 0620. |
| `W1_TAV_GOL_1110` | Thunfischdose auf Gollo vor R1a oder R1b | Thunfischdose (oder ein anderer Gegenstand) auf Gollo vor R1a oder R1b | Fund 95: Jeder Gegenstand startet das Rätsel. |
| `W1_TAV_MAX_1120` | Thunfischdose auf Gollo; nach R1a und R1b | Thunfischdose (oder ein anderer Gegenstand) auf Gollo; nach R1a und R1b | Fund 95, wie 1110 |
| `FI_RAET_MAX_0090` | Reden: Zeldina nach Schritt A | Reden: Zeldina nach Schritt A; nur FREUND\_0815 | Fund 69: Die Zeile nennt den Roboter. Ohne ihn gilt die neue Zeile 0095. |
| `W3_KUCH_PIX_0535` | Ansehen: Ofen, zweites Mal | Ansehen: Ofen, zweites Mal; Pixel auf der Leitung | Fund 15: Pixel spricht in der Simulation erst, wenn er auf der Leitung ist. Sprecher jetzt „Pixel (aus dem Wandtelefon)“. |
| `W3_TURM_PIX_0235` | Ansehen: Topfpflanzen, zweites Mal | Ansehen: Topfpflanzen, zweites Mal; Pixel auf der Leitung | Fund 15, wie 0535. Sprecher jetzt „Pixel (aus dem Terminal)“. |
| `W3_INV_PIX_0045` | Ansehen: Omas Kekse, kalt, zweites Mal | Ansehen: Omas Kekse, kalt, zweites Mal; Pixel auf der Leitung | Fund 15, wie 0535 |
| `ZS3_DACH_PIX_0020` | kommt aus dem Bildschirm, sieht Opa an | kommt aus dem Bildschirm | Fund 55: Pixel zeigt nicht mehr auf Opa. |

### prolog.md

| Zeilen-ID | vorher | nachher | Grund |
| --- | --- | --- | --- |
| `P0_TREP_MAX_0020` | Draußen wird es langsam dunkel. Drinnen ist es, wenn man sich die Tapete ansieht, ungefähr 1987. | Draußen ist bestes Wetter. Drinnen ist es, wenn man sich die Tapete ansieht, ungefähr 1987. | Fund 14: Der Prolog spielt am Nachmittag. |
| `P0_DACH_OPA_0370` | Er ist wach! Wunderbar. Pixel kommt mit dir, Max. Er kennt die Welten, und er kennt alle Antworten. | Er ist wach! Wunderbar. Pixel kommt mit dir, Max. Er kennt jede Sendung, die je gelaufen ist, und er kennt alle Antworten. | Fund 54: Pixel war nie in den Welten (0850). Vorschlag aus dem Bericht. Fund 54: Pixel war nie in den Welten (0850). „Jede Sendung“ nach dem Vorschlag im Bericht, „alle Antworten“ bleibt, weil Pixel in 0380 darauf antwortet. |
| `P0_DACH_MAX_0680` | Kanal 4. Das ist ein Testbild, und es ist das Langweiligste, was ich heute gesehen hab. Und ich hab Opas Zeitung gesehen. | Kanal 4. Bunte Streifen und ein Pfeifton. Das Langweiligste, was ich heute gesehen hab. Und ich hab Opas Zeitung gesehen. | Fund 16: Max kennt das Wort Testbild nicht (01-konzept.md). Vorschlag aus Abschnitt C, die Pointe mit der Zeitung bleibt. |

### welt-1.md

| Zeilen-ID | vorher | nachher | Grund |
| --- | --- | --- | --- |
| `W1_DORF_MAX_0180` | „Gesucht wegen Weltherrschaft. Besondere Kennzeichen: reagiert empfindlich auf Kosenamen.“ | „Gesucht wegen Weltherrschaft. Wohnhaft: Dunkler Turm, sieben Stockwerke, steht größtenteils leer. Besondere Kennzeichen: reagiert empfindlich auf Kosenamen.“ | Fund 9: Der Steckbrief nennt jetzt den Turm, den Max der Maklerin anpreist (Wortlaut aus dem Bericht). |
| `W1_ABS_MAK_0225` | (neu) | Bringen Sie mir ein Objekt, dann reden wir. | Fund 9: Ohne Steckbrief fehlte jeder Hinweis, dass der Maklerin ein Objekt fehlt. Neue Zeile nach dem Vorschlag im Bericht, in der Du-Form der Figur. Fund 61: Die Maklerin siezt jetzt durchgehend (Entscheidung, bitte prüfen). |
| `W1_TAV_MAX_0115` | (neu) | Unter dem Tresen klebt ein Zettel: „Anschreiben nur für Zwerge. Die zahlen wenigstens in Gold.“ | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0125` | (neu) | Am Topfrand ist etwas eingeritzt: „Nichts hineinwerfen, was flüstert.“ | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0165` | (neu) | Auf der Schwelle liegt Staub, und darin ist kein einziger Fußabdruck. Da war lange keiner unten. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0175` | (neu) | Darunter steht kleiner: „Bitte nicht lebend bringen. Der letzte hat die Theke angezündet.“ | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0205` | (neu) | Auf dem Sims steht ein Pokal: „Zweiter Platz, Armdrücken gegen Troll.“ Mehr als zwei Teilnehmer hatte das Turnier wohl nicht. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0215` | (neu) | Birgit hängt ein Stück höher als die anderen und ist als Einzige poliert. Über Birgit redet hier keiner schlecht. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0225` | (neu) | Auf der Rückseite von einem Schild steht mit Bleistift: „Gerhard der Dritte?“ Er plant voraus. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0245` | (neu) | Im Becher liegen zwei Knöpfe und ein Zahn. Das Publikum hier zahlt mit dem, was es übrig hat. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0255` | (neu) | An einer Ecke hängt noch ein Glöckchen. Das Fell hat früher gebimmelt. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0265` | (neu) | In einen Balken hat jemand Striche geritzt, einen pro Schlägerei. Der Balken ist fast voll. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0275` | (neu) | Hinter „auf Anfrage“ hat jemand mit Bleistift geschrieben: „Hat noch nie jemand angefragt.“ | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0295` | (neu) | Auf der Rückseite steht: „Wirkung hält eine Stunde. Der Nachgeschmack länger.“ | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_TAV_MAX_0315` | (neu) | Oben schwimmt ein Fischauge. Ich hab umgerührt, jetzt guckt es in die andere Richtung. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_HOGG_MAX_0115` | (neu) | In eine Bank ist ein Herz geritzt: „A. + Kelle“. Der Schulleiter saß hier selbst mal. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_HOGG_MAX_0125` | (neu) | Ganz unten in der Ecke steht doch was: „Nicht wegwischen!“ Drumherum ist alles weggewischt. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_HOGG_MAX_0135` | (neu) | Ich hab reingeguckt. Am Boden klebt eine Nudel. Hier wurde schon mal was anderes gekocht als Zaubertrank. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_HOGG_MAX_0145` | (neu) | Am Regalbrett kleben sechs Kleberänder. Die Etiketten gab es also mal, und jemand wollte sie nicht mehr. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_HOGG_MAX_0165` | (neu) | Draußen fliegt ein Schüler vorbei, rückwärts. Er winkt, als wäre das so geplant. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_HOGG_MAX_0185` | (neu) | Die Löcher sind rund und alle gleich groß. Motten waren das nicht, das war ein Zauber, der danebenging. | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_HOGG_MAX_0205` | (neu) | Am Stiel hängt ein Schild: „Übungsbesen. Fliegt nicht. Fegt nur, und das ungern.“ | Fund 99: Zweitzeile fehlte (Taverne und Klassenzimmer). Neue Zeile im Stil der übrigen Zweitzeilen von Welt 1, Entscheidung, bitte prüfen. |
| `W1_ANK_PIX_0040` | Auf Kanal 3, wenn ich die Fernbedienung richtig gelesen habe, und ich lese Fernbedienungen grundsätzlich richtig. // Es riecht nach Stroh, nach Bier und nach Leuten, die „Wohlan“ sagen, ohne dabei rot zu werden. | Auf Kanal 3, wenn ich den Drehknopf richtig gelesen habe, und ich lese Drehknöpfe grundsätzlich richtig. // Es riecht nach Stroh, nach Bier und nach Leuten, die „Wohlan“ sagen, ohne dabei rot zu werden. | Fund 72: Der Zapp-O-Mat hat nur einen Drehknopf, die Fernbedienung ist verloren. |
| `W1_ABS_SCH_0160` | Mehr hab ich nicht. Und wenn doch, hat es schon einen Namen. | Mehr hab ich nicht. Nur noch Blech. | Fund 18: Namen geben ist Humberts Eigenheit (entscheidungen.md). Alternative aus Abschnitt C. |
| `W1_LUFT_MAK_0420` | Vier. Feilschen kostet extra. Fünf, wenn du so weiterguckst. | Vier. Feilschen kostet extra. Fünf, wenn Sie so weitergucken. | Fund 61: Die Maklerin siezt jetzt durchgehend, wie in ihren Abschiedszeilen (Entscheidung, bitte prüfen). |
| `W1_ABS_STA_0120` | Kommen Sie wieder, wenn Sie einen Stab brauchen. Oder eine Erklärung. Ich habe keine von beiden. | Komm wieder, wenn du einen Stab brauchst. Oder eine Erklärung. Ich habe keine von beiden. | Fund 61: Der Stabmacher duzt in allen anderen Zeilen. |
| `W1_ABS_GOL_0220` | Geh, geh. Unser Gold ist weg, unsere Worte auch. Nur das Ssschätzchen bleibt. Niemand will es. | Geh, geh. Meine Worte sind weg. Nur das Ssschätzchen bleibt. Niemand will es. | Fund 63: Gollo sagt „ich“. Das Gold ist vor Rätsel 1 noch da, darum fehlt es jetzt. Der Vorschlag im Bericht („Mein Ring ist weg“) stimmt erst nach Rätsel 1, dann schläft Gollo schon. |
| `W1_SMAU_SMA_0880` | Eine Kollegin! Was bewahrst du? Nein, sag es nicht. Ich will es auch haben. | Ein Kollege! Was bewahrst du? Nein, sag es nicht. Ich will es auch haben. | Fund 63: Pixel ist ein Kater. |
| `W1_WALD_ROT_0222` | Meine. Sie zieht dauernd um, immer tiefer in den Wald. Wegen der Ruhe, sagt sie. | Meine. Sie ist dauernd umgezogen, immer tiefer in den Wald. Wegen der Ruhe, hat sie gesagt. | Fund 64: Vergangenheit, damit „Wohnt auf Mallorca“ (0780) dazu passt. Entscheidung, bitte prüfen. |
| `W1_LUFT_ZEL_0840` | Der Drache war der Vermieter. Der Turm war zu teuer. Und entführt hat mich nur die Nebenkostenabrechnung. | Der letzte Drache war mein Vermieter. Sein Turm war zu teuer. Und entführt hat mich nur die Nebenkostenabrechnung. | Fund 64: Zeldina meint einen früheren Drachen und Turm, nicht Smaugi und den Dunklen Turm. Die Pointe bleibt. Entscheidung, bitte prüfen. |
| `W1_BERG_GRI_0840` | Eins mit Zukunft. Und mit Schlüsseln. Ein Goblin ohne Schlüssel ist nur ein grüner Mann im Dunkeln. | Eins mit Zukunft. Und mit Schlüsseln. Ein Goblin ohne Schlüssel steht vor jeder Tür wie ein Kunde. | Fund 70: derselbe Satzbau wie bei Waldemar (1250). Alternative aus Abschnitt C. |
| `W1_BRUE_WAL_1060` | Wasser? Jetzt schon? Paragraf eins: Erst das Märchen, dann das Bad. Und keine deiner Ziegen hat bisher einen ganzen Satz gesagt. | Wasser? Jetzt schon? Das Bad ist Paragraf drei. Erst das Märchen, dann das Bad. Und keine deiner Ziegen hat bisher einen ganzen Satz gesagt. | Fund 71: Paragraf 1 regelt laut Satzung die Reihenfolge der Böcke, das Bad steht in Paragraf 3. |
| `W1_BRUE_WAL_1000` | Die Brücke ist frei. Und: Regel 14b. Leihgaben sind zurückzugeben. | Die Brücke ist frei. Und: Paragraf 14b. Leihgaben sind zurückzugeben. | Fund 71: Die Satzung nennt es Paragraf 14b. |
| `W1_TAV_PIX_1470` | Sie heißt Hilde. Sie legt, seit sie denken kann, und sie denkt nicht viel. // Sie sagt, das Ei riecht nach Schule, was auch immer das heißen soll. Hühner sind keine großen Erklärer. | Sie heißt Berta. Sie legt, seit sie denken kann, und sie denkt nicht viel. // Sie sagt, das Ei riecht nach Schule, was auch immer das heißen soll. Hühner sind keine großen Erklärer. | Fund 73: Das Huhn hieß Hilde, die Oma heißt Hildegard. Nur der Name ist neu (Entscheidung, bitte prüfen). |
| `W1_SCHM_MAX_0770` | Du hast deinen Schwertern Namen gegeben? | (gestrichen) | Fund 18: Der Schmied tauft keine Schwerter, das ist Humberts Eigenheit (entscheidungen.md). Frage gestrichen. |
| `W1_SCHM_SCH_0780` | Jedes Schwert hat einen Namen. Ingrid, Helga, Kurt. Kurt war ein Missverständnis. | (gestrichen) | Fund 18: Antwort zur gestrichenen Frage. Abschnitt C wertet „Kurt war ein Missverständnis“ als gelungen, die Zeile steht deshalb auf der Liste für Sebastian. |
| `W1_SMAU_MAX_0645` | (neu) | Ich hab das Ei. Ich könnte jetzt gehen. // … Zeldina hat immer noch keine Wohnung. | Fund 12: Max hatte nach der Ei-Übergabe keinen Grund für den Endkampf. Neue Zeile nach dem Vorschlag im Bericht. |
| `W1_TAV_GOL_0760` | Rätsel! Ja! Ich gewinne immer! Was hat Wurzeln, die keiner sieht, und ist höher als Bäume? | Rätsel! Ja! Ich gewinne immer! Was hat einen Hals und keinen Kopf, einen Bauch und keinen Hunger? | Fund 42: Das alte Rätsel stand fast wörtlich in einem bekannten Buch. Eigenes Rätsel aus dem Bericht (Flasche, passt zur Taverne). |
| `W1_TAV_MAX_0770` | Ein Berg. Das steht in jedem Rätselbuch auf der ersten Seite. | Eine Flasche. Das steht in jedem Rätselbuch auf der ersten Seite. | Fund 42: Antwort zum neuen Rätsel in 0760. |
| `W1_DORF_MAX_0295` | Unter dem Wegweiser steht in Kreide: „Gleis neundreiviertel ist woanders.“ Gut zu wissen. | (gestrichen) | Fund 42: „Gleis neundreiviertel“ ist ein Originalbegriff. Laut Abschnitt M und D gestrichen. |

### welt-2.md

| Zeilen-ID | vorher | nachher | Grund |
| --- | --- | --- | --- |
| `W2_DISK_HER_0240` | Wenn ich es war, hab ich zweimal die Wahrheit gesagt. Das schaff ich nicht mal mit Anlauf. | Wenn ich es war, hat Leonidas zweimal die Wahrheit gesagt. Das schafft der nicht mal mit Anlauf. | Fund 7: Hermes rechnete falsch (er selbst hätte nicht zweimal die Wahrheit gesagt, Leonidas schon). Pointe (Anlauf) bleibt. |
| `W2_NIL_PIX_1070` | Ich sitze seit drei Welten Modell, und zwar ohne jede Gage. // Wenn dieser Mann mich meißelt, ohne vorher über Thunfisch zu verhandeln, verklage ich den Nil. | Ich sitze seit zwei Welten Modell, und zwar ohne jede Gage. // Wenn dieser Mann mich meißelt, ohne vorher über Thunfisch zu verhandeln, verklage ich den Nil. | Fund 67: Es ist die zweite Welt. |
| `W2_ABS_BE1_0240` | Mein Schalter ist für Sie jetzt geschlossen. Für alle anderen auch. Er war nie offen. | Mein Schalter ist für dich jetzt geschlossen. Für alle anderen auch. Er war nie offen. | Fund 61: Der Beamte duzt in allen anderen Zeilen. |
| `W2_SAND_GRI_0190` | Nur der wahre Messias würde das leugnen! | Er sagt Nein! So bescheiden ist nur der Echte! | Fund 42: Der Satz stand fast wörtlich in einem bekannten Film. Derselbe Dreh in eigenen Worten. Entscheidung, bitte prüfen. |
| `W2_AGOR_GRI_0400` | Die Römer! Überall Römer! Sie fotografieren unsere Säulen mit Wachstafeln und fragen, wo das Kolosseum ist! Was haben die Römer je für uns getan? | Die Römer! Überall Römer! Sie fotografieren unsere Säulen mit Wachstafeln und fragen, wo das Kolosseum ist! Und was haben wir von denen? Nichts! | Fund 42: Die Frage stand wörtlich in einem bekannten Film. Eigener Satz, die Lage bleibt. Entscheidung, bitte prüfen. |
| `W2_AGOR_GRI_0410` | Na gut, die Straßen. Und das Aquädukt. Und die Thermen. Und die Post. Aber sonst? Was haben die Römer je für uns getan, außer Straßen, Aquädukt, Thermen und Post? | Na gut, den Kalender. Und die Fußbodenheizung. Und den Beton. Und die Post. Aber sonst? Was haben wir von denen, außer Kalender, Fußbodenheizung, Beton und Post? | Fund 42: eigene Aufzählung statt der aus dem Film. Entscheidung, bitte prüfen. |
| `W2_RING_MAX_0110` | Außer den Straßen, dem Aquädukt und den Thermen? | Außer dem Kalender, der Fußbodenheizung und dem Beton? | Fund 42: Konter 4 folgt der neuen Aufzählung in W2_AGOR_GRI_0410. |
| `W2_RING_CIC_0120` | Die Straßen … gut, die Straßen. Und das Aquädukt. Aber sonst? Sonst! | Der Kalender … gut, der Kalender. Und die Fußbodenheizung. Aber sonst? Sonst! | Fund 42: Antwort auf den neuen Konter 4. |
| `W2_BUER_MAX_0380` | „Rundschreiben. Ab sofort gibt es Startpass und Bürgerschein nur gegen Passierschein A38.“ Den gibt es nicht. Das ist der Trick. | „Rundschreiben. Ab sofort gibt es Startpass und Bürgerschein nur gegen Passierschein Vier-Strich-Ypsilon.“ Den gibt es nicht. Das ist der Trick. | Fund 42: „A38“ ist das Erkennungszeichen der Vorlage. Eigene Nummer nach dem Bericht. Entscheidung, bitte prüfen. |
| `W2_BUER_MAX_0430` | „Rundschreiben: Startpass nur gegen Passierschein A38.“ Jemand hatte vor mir dieselbe Idee und dann wohl keinen Mut mehr. | „Rundschreiben: Startpass nur gegen Passierschein Vier-Strich-Ypsilon.“ Jemand hatte vor mir dieselbe Idee und dann wohl keinen Mut mehr. | Fund 42: eigene Nummer statt A38. |
| `W2_BUER_BE2_0460` | Ein Rundschreiben. Ein neues. Es gilt sofort. Es verlangt … einen Passierschein A38. | Ein Rundschreiben. Ein neues. Es gilt sofort. Es verlangt … einen Passierschein Vier-Strich-Ypsilon. | Fund 42: eigene Nummer statt A38. |
| `W2_BUER_BE2_0510` | Startpass. Bürgerschein. Passierschein A38, hiermit erfunden und sofort ungültig. Und jetzt geh. Bitte. | Startpass. Bürgerschein. Passierschein Vier-Strich-Ypsilon, hiermit erfunden und sofort ungültig. Und jetzt geh. Bitte. | Fund 42: eigene Nummer statt A38. |
| `W2_INV_MAX_0505` | Passierschein A38. Den gibt es nicht, aber ich hab ihn trotzdem vorgeschrieben. So funktioniert Verwaltung. | Passierschein Vier-Strich-Ypsilon. Den gibt es nicht, aber ich hab ihn trotzdem vorgeschrieben. So funktioniert Verwaltung. | Fund 42: eigene Nummer statt A38. |

### welt-3.md

| Zeilen-ID | vorher | nachher | Grund |
| --- | --- | --- | --- |
| `W3_SUPP_VIE_0130` | Und das hier. Lag in einer Lieferung fürs Labor. Weiße Karte, vier Ecken. Ich wollte sie behalten, wegen der Ecken. Aber du hast sie verdient. | Und das hier. Lag im Leergut aus dem Labor, die beliefere ich. Weiße Karte, vier Ecken. Ich wollte sie behalten, wegen der Ecken. Aber du hast sie verdient. | Fund 96: Die Karte kam per Zufall. Jetzt beliefert Herr Vier das Labor (halber Satz). |
| `W3_HINT_PIX_0130` | Rechtsklick auf den weinenden Mann, die Frau mit dem Schirm und den Musiker. Dann stehen ihre Dummheiten in deinem Notizbuch. Dann geh zum Hut. | Sieh dir den weinenden Mann, die Frau mit dem Schirm und den Musiker an. Dann stehen ihre Dummheiten in deinem Notizbuch. Dann geh zum Hut. | Fund 98: Hinweis nannte die Maus (Rechtsklick). |
| `W3_HINT_PIX_0330` | Drück Tab und lauf als ich zweimal über den Gehweg vor dem Automaten. Dann zurück zu dir, Automat benutzen, „Déjà-vu“ wählen. Ich will dafür Fisch. | Wechsel zu mir und lauf zweimal über den Gehweg vor dem Automaten. Dann zurück zu dir, Automat benutzen, „Déjà-vu“ wählen. Ich will dafür Fisch. | Fund 98: Hinweis nannte die Taste Tab. |
| `W3_HINT_PIX_0730` | Rechtsklick auf die Streifen, dann den Farbcode nehmen, dann das Terminal mit dem Farbcode benutzen. Danach wechselst du zu mir. | Die Streifen ansehen, dann den Farbcode nehmen, dann das Terminal mit dem Farbcode benutzen. Danach wechselst du zu mir. | Fund 98: Hinweis nannte die Maus (Rechtsklick). |
| `W3_HINT_PIX_1230` | „Heiß“ von der Zelle gegen „kalt“ von den Keksen tauschen. Oder: Tab drücken und als ich das Deckenfenster in der Basis öffnen. Dann die Zelle nehmen und nach Hause. | „Heiß“ von der Zelle gegen „kalt“ von den Keksen tauschen. Oder: zu mir wechseln und als ich das Deckenfenster in der Basis öffnen. Dann die Zelle nehmen und nach Hause. | Fund 98: Hinweis nannte die Taste Tab. |
| `W3_EING_PIX_0185` | (neu) | Er quietscht noch. Und du hast Öl in der Tasche. | Fund 96: Freund 08/15 war ohne Warnung verpassbar. Neue Zeile nach dem Vorschlag im Bericht, ohne den Halbsatz „Ich sage es nur“ (laut Abschnitt E ein Muster). |
| `W3_EING_HAU_0030` | Da kommt niemand durch, Bursche. Außer mit Karte. Und außer Sahra Konner. Die suche ich. Haben Sie sie gesehen? | Da kommt niemand durch, Bursche. Außer mit Karte. Und außer Sahra Konner. Die suche ich. Hast du sie gesehen? | Fund 61: Modell 08/15 duzt in allen anderen Zeilen. |
| `W3_EING_HAU_1060` | Erstens wischen. Zweitens Sahra Konner finden. Drittens Türen halten. Ich bin seit neunzehn Jahren bei Punkt zwei. | Erstens Sahra Konner finden. Zweitens wischen. Drittens Türen halten. Ich bin seit neunzehn Jahren bei Punkt zwei. Punkt eins hebe ich mir auf. | Fund 65: Reihenfolge wie auf dem Auftragszettel (0050). Alternative aus Abschnitt C. |
| `W3_KAM2_MUT_0250` | Kammer zwei bestanden. Du bist besser als Testperson 47. Sie hat nach dem Kuchen gefragt. Du fragst nicht mehr. Das ist Fortschritt. | Kammer zwei bestanden. Du bist besser als Testperson 47. Sie hat nie nach dem Kuchen gefragt. Du fragst ständig. Das ist Fortschritt. | Fund 66: passt jetzt zur Pinnwand („zu wenig Kuchen verlangt“) und zur Option „Wo ist der Kuchen?“. |
| `W3_KAM1_MAX_0390` | Eine Ausgangstür. Zu. Sie geht auf, wenn der Schalter gedrückt ist. Das weiß ich, weil M.U.T.T.I. es dreimal gesagt hat. | Eine Ausgangstür. Zu. Sie geht auf, wenn der Schalter gedrückt ist. Das weiß ich, weil M.U.T.T.I. es gesagt hat. Zu meinem Besten. | Fund 67: Sie sagt es einmal. Alternative aus Abschnitt C. |
| `W3_APO_MAX_0295` | Er bewegt sich nicht, nur der Mantel weht. Ich wette, er hat dafür irgendwo einen kleinen Ventilator. | Er bewegt sich nicht, nur die Strickjacke weht. Ich wette, er hat dafür irgendwo einen kleinen Ventilator. | Fund 67: Morphäus trägt Strickjacke (0300). |
| `W3_HINT_PIX_0350` | Die blaue führt aufs Sofa. Da warst du schon, sechzehn Jahre lang. // Ich war die ganze Zeit dabei, und ich kann dir versichern: Es war nicht spannend. | Die blaue führt aufs Sofa. Da warst du schon, sechzehn Jahre lang. // Vierzehn Jahre davon war ich dabei, und ich kann dir versichern: Es war nicht spannend. | Fund 67: Pixel lebt seit vierzehn Jahren bei Opa. |
| `W3_KUCH_PIX_0535` | Kekse im Ofen. Ich rieche sie bis hierher, und ich darf keinen haben. // Ich habe daher beschlossen, beleidigt zu sein. Lautlos, aber mit großer Ausdauer. | Kekse im Ofen. Beschreib mir den Geruch. Langsam. // Ich habe mir die Uhrzeit gemerkt. Für die Abrechnung. | Fund 15: Pixel ist nur über die Leitung da und kann nicht riechen. Zweite Blase nach Abschnitt C („beleidigt“ als Pointe, mittel). |
| `W3_TURM_PIX_0235` | Zwölf gleiche Pflanzen. Ich würde in allen zwölf graben, nur um zu sehen, ob die Erde auch gleich ist. // Das ist keine Neugier, das ist Wissenschaft. Neugier haben Hunde. | Zwölf gleiche Pflanzen. Wäre ich da, würde ich in allen zwölf graben, nur um zu sehen, ob die Erde auch gleich ist. // Das ist keine Neugier, das ist Wissenschaft. Neugier haben Hunde. | Fund 15: Pixel ist nur über die Leitung da. „Wäre ich da“ ergänzt, Pointe bleibt. |
| `W3_KAM1_PIX_0365` | Ein Kuchen aus Pappe. // Das ist das Grausamste, was man einem Tier mit einer so feinen Nase wie meiner antun kann. Ich protestiere. Schriftlich, später. | Ein Kuchen aus Pappe, sagst du. // Das ist das Grausamste, was man einem Tier mit einer so feinen Nase wie meiner erzählen kann. Ich protestiere. Schriftlich, später. | Fund 15: Pixel hört nur über den Lautsprecher mit. |
| `W3_KERN_PIX_0415` | Das Ding glüht wie ein Heizkissen, und ich würde mich sofort drauflegen. // Ungefähr eine halbe Sekunde lang. Danach würde ich mich, glaube ich, umentscheiden. | Das Ding glüht wie ein Heizkissen, sagst du. Wäre ich da, würde ich mich sofort drauflegen. // Ungefähr eine halbe Sekunde lang. Danach würde ich mich, glaube ich, umentscheiden. | Fund 15: Pixel ist nur über den Lautsprecher da. Pointe bleibt. |
| `W3_INV_PIX_0045` | Die Tüte knistert jedes Mal, wenn du dich bewegst. Ich höre das. Ich höre alles, was knistert. Es ist eine Gabe und eine Qual. | Die Tüte knistert jedes Mal, wenn du dich bewegst. Ich höre das, sogar durch die Leitung. Ich höre alles, was knistert. Es ist eine Gabe und eine Qual. | Fund 15: Die kalten Kekse gibt es nur in der Simulation, dort ist Pixel auf der Leitung. Pointe bleibt. |
| `W3_INV_PIX_0135` | Du riechst nach Bügeleisen. Ich setze mich trotzdem auf dich. // Wärme ist Wärme, junger Mann, und ich bin gerade nicht in der Position, wählerisch zu sein. | Du klingst nach Bügeleisen. Wenn du zurück bist, setze ich mich trotzdem auf dich. // Wärme ist Wärme, junger Mann, und ich bin gerade nicht in der Position, wählerisch zu sein. | Fund 15: Die glühende Zelle gibt es nur im Labor, dort ist Pixel nur zu hören. Das Bügeleisen bleibt. |
| `W3_BAS_MAX_0755` | Er summt das Kinderlied immer langsamer. Falls er gleich anfängt, mit mir über seine Gefühle zu reden, zieh ich keinen Stecker. | Er summt das Kinderlied immer langsamer. | Fund 16: Der Nachsatz mit dem Stecker spielt auf einen alten Film an, den Max nicht kennt. Laut Abschnitt D gestrichen. |
| `W3_TEST_DEC_0100` | Du gehst durch die Wüste. Eine Schildkröte liegt auf dem Rücken. Sie kommt nicht hoch. Was tust du? | Du findest im Bus ein Portemonnaie. Darin ist ein Foto von dir. Was tust du? | Fund 42: Die Schildkröte in der Wüste stand fast wörtlich in einem bekannten Film. Eigene Lage aus dem Bericht. Entscheidung, bitte prüfen (geschützte Szene). |
| `W3_TEST_MAX_0110` | Ich dreh sie um. | Ich geb es beim Fahrer ab. | Fund 42: logische Antwort zur neuen Frage 1. |
| `W3_TEST_MAX_0130` | Ich streite erst mal mit ihr. Sie hätte wissen müssen, dass es windig wird. | Ich streite erst mal mit ihm. Es hätte wissen müssen, dass ich das Foto nicht mag. | Fund 42: menschliche Antwort zur neuen Frage 1, gebaut wie die Frau mit dem Schirm („er hätte das wissen müssen“). |
| `W3_TEST_DEC_0140` | Nachtragend. Unfair. Gegenüber einem Reptil. Das ist ein Mensch. Weiter. | Nachtragend. Unfair. Gegenüber einem Portemonnaie. Das ist ein Mensch. Weiter. | Fund 42: „Reptil“ durch „Portemonnaie“ ersetzt. |
| `W3_TEST_MAX_0150` | Ich frag sie nach dem WLAN-Passwort. | Ich frag es nach dem WLAN-Passwort. | Fund 42: „sie“ durch „es“ ersetzt. |
| `W3_TEST_DEC_0160` | Die Schildkröte hat kein WLAN. Niemand hier hat WLAN. Das war keine Antwort, das war Heimweh. Durchgefallen. | Das Portemonnaie hat kein WLAN. Niemand hier hat WLAN. Das war keine Antwort, das war Heimweh. Durchgefallen. | Fund 42: „Die Schildkröte“ durch „Das Portemonnaie“ ersetzt. |
| `W3_HINT_PIX_0160` | Schildkröte: mit ihr streiten. Regen: Synthesizer spielen. Suppe: reinheulen. Ich sage das nur einmal. Ich habe es jetzt einmal gesagt. | Portemonnaie: mit ihm streiten. Regen: Synthesizer spielen. Suppe: reinheulen. Ich sage das nur einmal. Ich habe es jetzt einmal gesagt. | Fund 42: Hinweis an die neue Frage 1 angepasst. |
| `W3_PIEP_OPA_0120` | Hilf mir, Max. Du bist meine einzige Hoffnung. Der Kern muss weich bleiben. Außen hart, innen weich. Sonst ist alles verloren. | Hilf mir, Max. Du bist der Einzige, der gerade Zeit hat. Der Kern muss weich bleiben. Außen hart, innen weich. Sonst ist alles verloren. | Fund 42: „meine einzige Hoffnung“ ist wortnah ein Filmzitat. Vorschlag aus dem Bericht. |
| `W3_EING_MAX_0160` | Das ist nicht der Junge, den du suchst. | Du hast mich nie gesehen. Du suchst jemand anderen. | Fund 42: wortnahes Filmzitat. Erster Satz aus dem Bericht, der zweite hält die Antwort in 0170 („Ich suche nur Dreck.“). |
| `W3_NUD_MOR_0420` | Die blaue Pastille: Du wachst auf, glaubst, was du willst, und alles bleibt bequem. Die rote: Du siehst, wie tief der Kaninchenbau geht. | Die blaue Pastille: Du wachst auf, glaubst, was du willst, und alles bleibt bequem. Die rote: Du siehst, wie tief das hier wirklich geht. | Fund 42: „Kaninchenbau“ ist wortnah ein Filmzitat. Vorschlag aus dem Bericht. |
| `W3_BAS_MAX_0430` | Was ist das für ein Wrack? | (gestrichen) | Fund 42: Frage zur gestrichenen Antwort 0440. |
| `W3_BAS_KAL_0440` | Die alte Kiste hat den Kessel-Lauf in unter zwölf Parsec geschafft. | (gestrichen) | Fund 42: wörtliches Filmzitat. Laut Abschnitt M und D gestrichen. |
| `W3_BAS_MAX_0450` | Parsec ist eine Strecke, keine Zeit. | (gestrichen) | Fund 42: gehört zu 0440. |
| `W3_BAS_KAL_0460` | Sag ich doch. Kurze Strecke. | (gestrichen) | Fund 42: gehört zu 0440. |

### welt-4.md

| Zeilen-ID | vorher | nachher | Grund |
| --- | --- | --- | --- |
| `W4_SIT_SMU_0360` | Alle lachen. Immer. Außer der gefleckten Dame in Reihe drei. Die saß da wie beim Zahnarzt. | Alle lachen. Immer. Außer der gefleckten Dame in Reihe drei. Die sitzt da sonst wie beim Zahnarzt. Gestern war ihr Platz leer. | Fund 5: Die Hyäne saß laut dieser Zeile zur Tatzeit im Publikum, ihr falsches Alibi wäre wahr. Pointe (Zahnarzt) bleibt. |
| `W4_SIT_VAT_0420` | Mein neuer Chef wollte mal vorbeischauen. Irgendwann. Ich habe ihn nie gesehen. Ich weiß nur: Er trägt Mantel. | Mein neuer Chef wollte mal vorbeischauen. Irgendwann. Ich habe ihn nie gesehen. Ich weiß nur: Er trägt Mantel. Und Krawatte, nehme ich an. Chefs tragen so was. | Fund 6: Krawatte (0160, 0170) und Mantel (0420, Hinweis 0070) verbunden, Vorschlag aus Abschnitt B. Entscheidung, bitte prüfen. |
| `W4_STUD_MAX_0190` | Er hört nicht mehr zu. Er sendet. Ich muss die Show anhalten, sonst erreiche ich ihn nicht. | Er hört nicht mehr zu. Er sendet. | Fund 10: Max nannte vor der Taste die Lösung (Pause). Lösungssatz gestrichen, Beobachtung bleibt. |
| `W4_STUD_MAX_0220` | Er prahlt mit seiner Karriere. Ich habe den Anfang davon in der Tasche. Zwei Bilder nebeneinander. Das kann der Adapter. | Er prahlt mit seiner Karriere. Ich habe den Anfang davon in der Tasche. | Fund 10: Lösungssätze (Adapter) gestrichen, Beobachtung bleibt. |
| `W4_STUD_MAX_0290` | Er schweigt, zum ersten Mal. Ich wüsste gern, was da drin gerade passiert, und ich hab eine Taste dafür. | Er schweigt, zum ersten Mal. Ich wüsste gern, was da drin gerade passiert. | Fund 10: Lösungshalbsatz (Taste dafür) gestrichen, Beobachtung bleibt. |
| `W4_HINT_PIX_0700` | (neu) | Drei Alibis halten, eins nicht. Jemand hat dir von einem Abendessen erzählt, das es nie gab. | Fund 4: Der letzte Schritt von Rätsel 4 hatte keine Hinweise. Neue Zeile, Entscheidung, bitte prüfen. |
| `W4_HINT_PIX_0710` | (neu) | Die Hyäne hat Lasagne gesehen. Es gab Fondue. Sag es ihr, aber nicht mit leeren Händen. | Fund 4, wie oben. |
| `W4_HINT_PIX_0720` | (neu) | Zieh die Programmzeitschrift auf die Hyäne. Das Notizbuch geht auch. // Danach lacht sie. Einmal. Das reicht für ein Geständnis. | Fund 4, wie oben. |
| `W4_STUD_MAX_0160` | Nein. Ich habe eine Woche lang Dinge getan. Ich habe eine Hyäne überführt und getanzt. Freiwillig. Ich kann nicht zurück auf ein Sofa, auf dem ich schon sitze. | Nein. Ich habe zwei Wochen lang Dinge getan. Ich habe eine Hyäne überführt und getanzt. // Ich bin gerade erst aufgestanden. Ich setz mich nicht wieder hin. | Fund 25 und 57: Schlüsselsatz nach dem Vorschlag im Bericht, „zwei Wochen“ statt „eine Woche“. |
| `W4_INV_MAX_0010` | Ein Bettlaken mit zwei Löchern. Ein Geist hat es mir überlassen. Darunter war nichts. Nicht mal ein Geist. | Ein Bettlaken mit zwei Löchern. Der erste Entwurf vom Fledermann. Zwei Löcher, null Schirme. | Fund 68: Das Laken kommt vom Fledermann (W4_KAPI_FLE_0350). |
| `W4_KELL_MAX_0175` | Wenn die gleich einen Song über sich anfangen und ich wen anrufen soll, weiß ich nicht, wen. Ich hab nur Pixel. | (gestrichen) | Fund 16: Anspielung auf einen alten Film, den Max nicht kennt. Laut Abschnitt D gestrichen. |
| `W4_KAPI_MAX_0525` | An einem Fenster lehnt ein Mann mit Brille und Krawatte. Wenn der gleich in eine Telefonzelle rennt, weiß ich Bescheid. | (gestrichen) | Fund 16: Anspielung auf einen alten Film, den Max nicht kennt. Laut Abschnitt D gestrichen. |
| `W4_HALL_AGE_0350` | Das sagen sie alle. Die Wahrheit ist irgendwo da draußen. Und ich habe sie noch nie gefunden. Zeigen Sie mir einen Beweis, und ich glaube Ihnen alles. | Das sagen sie alle. Die Wahrheit ist da draußen. Irgendwo. Ich habe die Adresse verlegt. Zeigen Sie mir einen Beweis, und ich glaube Ihnen alles. | Fund 42: wörtlicher Slogan einer Fernsehserie. Vorschlag aus dem Bericht. |
| `W4_FABR_FLE_0330` | Ein Führer mit Laken! Ich folge ihm! Vom Kopfstand aus! | Ein Anführer mit Laken! Ich folge ihm! Vom Kopfstand aus! | Fund 46: „Führer“ mit weißem Laken liest sich unglücklich. Vorschlag aus dem Bericht. |

### zwischenspiele-und-finale.md

| Zeilen-ID | vorher | nachher | Grund |
| --- | --- | --- | --- |
| `FI_DACH_OPA_0060` | Das Werk. Ich habe es aufgebaut, während du weg warst. Zwanzig Minuten Fernsehzeit sind drei Stunden Werkbank. | Das Werk. Ich habe es aufgebaut, während du weg warst. Viermal zwanzig Minuten. Ich bin selbst überrascht. | Fund 13: Zeitrechnung wie in Zwischenspiel 2 (drüben Tage, hier Minuten). |
| `ZS3_DACH_PIX_0020` | Dreimal Milch. Das ist keine Werbung mehr, das ist eine Botschaft. // Jemand will, dass in diesem Haus etwas gekauft wird. Ich ahne auch, wer. Ich sehe nur ganz zufällig in seine Richtung. | Dreimal Milch. Das ist keine Werbung mehr, das ist eine Botschaft. // Jemand will, dass in diesem Haus etwas gekauft wird. | Fund 55: Pixel zeigt nicht mehr auf Opa, der Absender bleibt offen. Entscheidung, bitte prüfen. |
| `FI_AUFL_OPA_0230` | Ich war schon mal drin. Im Zapp-O-Mat. Einmal. Zum Testen. // Auf Kanal 999 ist sie mir aus der Tasche gefallen, direkt in Zappmanns Studio. Und ich wollte nicht zugeben, wo sie liegt. Vor dem Kater schon gar nicht. | Ich war schon mal drin. Im Zapp-O-Mat. Einmal. Zum Testen. Durch alle Kanäle. // Auf Kanal 999 ist sie mir aus der Tasche gefallen, direkt in Zappmanns Studio. Und ich wollte nicht zugeben, wo sie liegt. Vor dem Kater schon gar nicht. | Fund 56: Opa hat Spuren in drei Welten. „Zum Testen“ bleibt. |
| `ZS1_DACH_MAX_0120` | Komisch. Drüben war es größer. Und goldener. Und es hatte Schuppen, ich schwör's, ich hatte es drei Tage im Arm. | Komisch. Drüben war es größer. Und goldener. Und es hatte Schuppen, ich schwör's, ich hab es durch den halben Turm getragen. | Fund 57: Max hat das Ei erst am Ende von Welt 1. „Runtergetragen“ aus dem Bericht stimmt nicht, der Weg führt nach oben in den Thronsaal. |
| `FI_AUFL_PIX_0240` | Ich hab's gewusst. Seit Welt 3. // Das Hologramm. „Hilf mir, Max.“ Wer hinterlässt eine Notfall-Nachricht in einer Welt, in der er angeblich nie war? | Ich hab's gewusst. Seit Kanal 42. // Das Hologramm. „Hilf mir, Max.“ Wer hinterlässt eine Notfall-Nachricht in einer Welt, in der er angeblich nie war? | Fund 58: Die Figuren kennen Kanäle, keine Weltnummern. |
| `FI_DACH_PIX_0160` | Ei. Mehl. Batterie. Fernbedienung. // In Welt 4 habe ich das schon einmal laut gesagt, und dann kam ein Amboss. // Jetzt sage ich es noch einmal, ganz leise. Ohne Amboss, wenn ich bitten darf. | Ei. Mehl. Batterie. Fernbedienung. // Auf Kanal 999 habe ich das schon einmal laut gesagt, und dann kam ein Amboss. // Jetzt sage ich es noch einmal, ganz leise. Ohne Amboss, wenn ich bitten darf. | Fund 58: Kanal statt Weltnummer. |
| `FI_AUFL_MAX_0250` | Du hast es in Welt 4 laut gesagt. Und dann kam der Amboss. | Du hast es auf Kanal 999 laut gesagt. Und dann kam der Amboss. | Fund 58: Kanal statt Weltnummer. |
| `FI_AUFL_MAX_0270` | Und Zappmann? Die Lichterkette hat geblinkt, du kennst ihn. Lange Geschichte. | Und Zappmann? Du kennst ihn. Lange Geschichte, hast du geblinkt. Ich hab Zeit. | Fund 59: Es klang, als beantworte Max seine Frage selbst. Vorschlag aus dem Bericht. |
| `FI_HINT_PIX_0200` | Oben hat jemand Geburtstag. Das steht seit Wochen im Kalender. Mit leeren Händen geht man da nicht hin. Sagt man. | Unten hat jemand Geburtstag. Das steht seit Wochen im Kalender. Dein Großvater hat es trotzdem geschafft. Mit leeren Händen geht man da nicht hin. Sagt man. | Fund 59 und 60: Oma steht unter dem Dachboden. Der Kalender und das Vergessen passen jetzt zusammen. |
| `FI_WOHN_MUT_0260` | Konrad, das ist deine Einkaufsliste. Du hast nichts davon gekauft, oder? | Papa, das ist deine Einkaufsliste. Du hast nichts davon gekauft, oder? | Fund 62: Die Mutter ist die Tochter von Oma und Opa („Mama“ in 0230). Entscheidung, bitte prüfen. |
| `ZS1_DACH_PIX_0570` | Der Eimer. Waldemar hat ihn zurückgegeben, nach Regel 14b. // Am Nil allerdings gibt es Wasser genug, und Krokodile auch. Einen Eimer braucht man dort höchstens zum Weglaufen. | Der Eimer. Waldemar hat ihn zurückgegeben, nach Paragraf 14b. // Am Nil allerdings gibt es Wasser genug, und Krokodile auch. Einen Eimer braucht man dort höchstens zum Weglaufen. | Fund 71: Die Satzung nennt es Paragraf 14b. |
| `FI_RAET_MAX_0095` | (neu) | Zeldina, Opa und ich. Wenn wir jetzt die Luke aufkriegen, kommt Oma rein, und das Ding läuft noch. | Fund 69: Fassung ohne Roboter. 0090 gilt jetzt nur mit FREUND_0815. |

## 3. Musterzahlen vorher und nachher

Folgt mit Paket 6.

## 4. Liste für Sebastian

### Entscheidungen, bitte prüfen

- Fund 2 und 40: Wo zwei Zeilen „zweites Mal“ am selben Objekt standen, kommt die spätere jetzt beim dritten Ansehen. Alle Fälle stehen in der Auslöser-Tabelle in Abschnitt 2.
- Fund 4: Drei neue Hinweiszeilen für den letzten Schritt von Rätsel 4 in Welt 4 (`W4_HINT_PIX_0700` bis `0720`).
- Fund 6: Der Vater sagt jetzt „Mantel. Und Krawatte, nehme ich an.“ Die Krawatten-Zeilen `W4_SIT_VAT_0160` und `W4_SIT_MAX_0170` bleiben.
- Fund 11: Die Rätsel-Datei von Welt 3 nennt „Nacht“ und „Regen“ jetzt Gags. Wenn du lieber ein kleines Rätsel dafür willst, ist das neue Arbeit.
- Fund 99: 20 neue Zweitzeilen in Taverne und Klassenzimmer. Wortlaut steht in Abschnitt 2 unter welt-1.md.
- Fund 9 und 96: zwei neue Zeilen, `W1_ABS_MAK_0225` und `W3_EING_PIX_0185`.
- Fund 12 und 69: zwei neue Zeilen, `W1_SMAU_MAX_0645` (Max entscheidet sich nach dem Ei für Zeldinas Wohnung) und `FI_RAET_MAX_0095` (Fassung ohne Roboter).
- Fund 16: `W4_TEST_MAX_0255` (das kleine Mädchen im Rauschen) bleibt. Abschnitt B führt die Zeile als Regelbruch, Abschnitt D duldet sie.
- Fund 18: Mit der Schwert-Frage an den Schmied ist auch „Kurt war ein Missverständnis“ gestrichen. Abschnitt C fand den Satz gelungen. Wenn du ihn behalten willst, passt er zu Humbert.
- Fund 55: Die Milchwerbung bleibt ohne Absender, Pixel verdächtigt niemanden mehr. Der andere Weg aus dem Bericht: Oma sagt im Finale „Ich habe dreimal angerufen und aufs Band gesprochen. Milch, Konrad.“
- Fund 61: Die Maklerin siezt durchgehend.
- Fund 62: Die Mutter sagt „Papa“ zu Opa. Sie ist damit die Tochter der Großeltern.
- Fund 64: Rotkäppchens Oma „ist dauernd umgezogen“ (Vergangenheit). Zeldinas Vermieter war „der letzte Drache“.
- Fund 73: Das Huhn heißt Berta statt Hilde.
- Fund 42: Mensch-Test, Frage 1: Portemonnaie im Bus statt Schildkröte in der Wüste. Die Szene ist geschützt, geändert sind nur die Wörter, die an der Schildkröte hingen.
- Fund 42: Die Römer-Aufzählung der Griechen heißt jetzt Kalender, Fußbodenheizung, Beton und Post. Der Bericht schlug Fähre, Passierschein und Fusionsküche vor. Die kommen im Spiel aber nicht von den Römern.
- Fund 42: „Passierschein Vier-Strich-Ypsilon“ statt „A38“. Das Wort Passierschein bleibt, damit der Rätselname stimmt.
- Fund 42: „Er sagt Nein! So bescheiden ist nur der Echte!“ statt des wörtlichen Messias-Satzes.
- Fund 42: Rätsel 8 in Welt 4 heißt „Ein Beweis für den Agenten“.
- Fund 44: drei englische Namen geändert (Hogglewarz, Manyjuice Lemonade, Lucky Wheel).

### Kann Absicht sein, nicht geändert

- Wann die Telefonzelle in der Simulation klingelt, hat im Spiel keinen Zustand. Die Zeile `W3_SIM_MAX_0220` hängt jetzt am Hotspot „klingelnde Telefonzelle“.
- „Die Nase … mit einem Teller“ fällt, egal womit Max wirft.
- Der Kalender im Prolog hat nach Fund 8 keine eigene Zweitzeile mehr. Beim zweiten Ansehen kommt eine Zeile aus dem allgemeinen Vorrat. Eine eigene Gag-Zeile wäre möglich.
- Die Figuren in Taverne und Klassenzimmer haben keine Zweitzeile beim Ansehen. Der Bericht nennt „rund 20“ Zeilen, die 20 Gegenstände sind erledigt.
- Fund 58: `FI_AUFL_PIX_0080` sagt noch „nach Welt 2“. Die Zeile zahlt „Bäckerei“ aus und ist geschützt. „Nach Kanal 7“ wäre die passende Fassung.
- Fund 102: Opa bedankt sich nie. Vorschlag aus dem Bericht, falls gewünscht: ganz am Ende „Max. // … Bring Quittung mit.“
- Fund 71: In `docs/entscheidungen.md` steht weiter „Regel 14b“. Im Spiel heißt es jetzt überall „Paragraf 14b“.

### Fernere Fassungen für die Schublade (Fund 105)

Nichts davon ist eingebaut. Es sind Vorschläge für den Fall, dass ein Anwalt einen Namen beanstandet.

| Jetzt | Fernere Fassung | Woher |
| --- | --- | --- |
| Morphäus | Hypnos (griechischer Gott des Schlafs, frei) | eigener Vorschlag |
| Sahra Konner | Sandra Kenner | eigener Vorschlag |
| Zeldina | Zerlina | eigener Vorschlag |
| Toadi | Knolli | eigener Vorschlag |
| Gollo | Grummo | eigener Vorschlag |
| Glücksrad-Shopping | Glücksdreh-Shopping | Bericht, Abschnitt M |
| Vielsaft-Limo | Vielfrucht-Limo | Bericht, Abschnitt M |
| Jahrgang Schicksalsberg | Jahrgang Schicksalshügel | Bericht, Abschnitt M |
| Morphaeus (englisch) | folgt dem deutschen Namen | Fund 44 |

### Offen laut Bericht

- Fund 43: Welt 3 folgt einem bekannten Film Station für Station. Der Bericht rät, das vor der Steam-Seite von einem Medienanwalt prüfen zu lassen.

Folgt mit den Funden 109 bis 111.
