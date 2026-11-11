# Umsetzung der 360-Grad-Prüfung: Protokoll

Grundlage: `pruefung/360-pruefung.md` (111 Funde). Auftrag: `pruefung/umsetzung-prompt.md`.

## Stand

- Paket 1 (die drei kritischen Fehler): fertig.
- Paket 2 (Werkzeuge): fertig.
- Paket 3 (Rätseltexte und Hinweis-Lücken): fertig.
- Pakete 4 bis 9: noch nicht begonnen.
- Weiter bei: Paket 4, Widersprüche.

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
| 12 | 4 | noch nicht bearbeitet |  |
| 13 | 4 | noch nicht bearbeitet |  |
| 14 | 4 | noch nicht bearbeitet |  |
| 15 | 4 | noch nicht bearbeitet |  |
| 16 | 4 | noch nicht bearbeitet |  |
| 17 | 6 | noch nicht bearbeitet |  |
| 18 | 4 | noch nicht bearbeitet |  |
| 19 | 6 | noch nicht bearbeitet |  |
| 20 | 6 | noch nicht bearbeitet |  |
| 21 | 6 | noch nicht bearbeitet |  |
| 22 | 6 | noch nicht bearbeitet |  |
| 23 | 9 | noch nicht bearbeitet |  |
| 24 | 6 | noch nicht bearbeitet |  |
| 25 | 4 | noch nicht bearbeitet |  |
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
| 42 | 5 | noch nicht bearbeitet |  |
| 43 | 5 | noch nicht bearbeitet |  |
| 44 | 5 | noch nicht bearbeitet |  |
| 45 | 9 | noch nicht bearbeitet |  |
| 46 | 5 | noch nicht bearbeitet |  |
| 47 | 2 | umgesetzt | Teilweise anders als im Bericht: `en_eintragen.py` teilt schon an „//“. Die 793 Zeilen sind am Werkzeug vorbei in `en.csv` gekommen. Alle 793 geteilt (die Blasenzahl passte überall), dabei 124 ältere Folgeblasen durch die neuere Fassung ersetzt. Neu in `tools/pruefen.py`: Fehler bei „//“ im englischen Text, bei abweichender Blasenzahl und bei Schlüsseln, die es im Skript nicht mehr gibt. |
| 48 | 2 | umgesetzt | Bestätigt. `pruefen.py`: 102 harmlose Meldungen „Nummer nicht aufsteigend“ sind jetzt Hinweise (`--hinweise`), falscher Sprechername ist ein Fehler, jede Warnung bricht ab. `spieldaten.py --pruefen` und `godot_raeume.py --pruefen` brechen bei Warnungen ab. `abdeckung.py` zählt verdrängte Ansehen-Zeilen als fehlend. `godot_raeume.py` bricht ab, wenn eine Gesprächsoption oder ein Zuruf eine Bedingung in Worten hat, die das Spiel nicht kennt. `testbuild.yml`: zweiter Import ohne Fehlermeldung, dazu alle Durchläufe vor dem Export. **Dabei gefunden (nicht im Bericht):** In Welt 3 bot Deckert die Option zum Mensch-Test nie an und die Orakel-Oma zwei Optionen zur Vase nie. Die Welt war über die Bedienung nicht lösbar, der Test rief die Regeln direkt auf. Behoben in `cq_dialog.gd` (Regeln entscheiden zuerst), `godot_raeume.py` („startet …“ ist Anmerkung), `spiel.gd` (Zuruf „vor dem Duell“ in Welt 1 kam nie). `welt_3_anspiel.gd` prüft jetzt, dass die Optionen angeboten werden (vorher 2 Fehler). Die Prüfung der Hinweise je offenem Schritt kommt mit Fund 4 in Paket 3. |
| 49 | 9 | noch nicht bearbeitet |  |
| 50 | 9 | noch nicht bearbeitet |  |
| 51 | 9 | noch nicht bearbeitet |  |
| 52 | 9 | noch nicht bearbeitet |  |
| 53 | 9 | noch nicht bearbeitet |  |
| 54 | 4 | noch nicht bearbeitet |  |
| 55 | 4 | noch nicht bearbeitet |  |
| 56 | 4 | noch nicht bearbeitet |  |
| 57 | 4 | noch nicht bearbeitet |  |
| 58 | 4 | noch nicht bearbeitet |  |
| 59 | 4 | noch nicht bearbeitet |  |
| 60 | 4 | noch nicht bearbeitet |  |
| 61 | 4 | noch nicht bearbeitet |  |
| 62 | 4 | noch nicht bearbeitet |  |
| 63 | 4 | noch nicht bearbeitet |  |
| 64 | 4 | noch nicht bearbeitet |  |
| 65 | 4 | noch nicht bearbeitet |  |
| 66 | 4 | noch nicht bearbeitet |  |
| 67 | 4 | noch nicht bearbeitet |  |
| 68 | 4 | noch nicht bearbeitet |  |
| 69 | 4 | noch nicht bearbeitet |  |
| 70 | 4 | noch nicht bearbeitet |  |
| 71 | 4 | noch nicht bearbeitet |  |
| 72 | 4 | noch nicht bearbeitet |  |
| 73 | 4 | noch nicht bearbeitet |  |
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
| 102 | 4 | noch nicht bearbeitet |  |
| 103 | 9 | noch nicht bearbeitet |  |
| 104 | 9 | noch nicht bearbeitet |  |
| 105 | 5 | noch nicht bearbeitet |  |
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

### prolog.md

Noch keine Änderung am Wortlaut.

### welt-1.md

| Zeilen-ID | vorher | nachher | Grund |
| --- | --- | --- | --- |
| `W1_DORF_MAX_0180` | „Gesucht wegen Weltherrschaft. Besondere Kennzeichen: reagiert empfindlich auf Kosenamen.“ | „Gesucht wegen Weltherrschaft. Wohnhaft: Dunkler Turm, sieben Stockwerke, steht größtenteils leer. Besondere Kennzeichen: reagiert empfindlich auf Kosenamen.“ | Fund 9: Der Steckbrief nennt jetzt den Turm, den Max der Maklerin anpreist (Wortlaut aus dem Bericht). |
| `W1_ABS_MAK_0225` | (neu) | Bring mir ein Objekt, dann reden wir. | Fund 9: Ohne Steckbrief fehlte jeder Hinweis, dass der Maklerin ein Objekt fehlt. Neue Zeile nach dem Vorschlag im Bericht, in der Du-Form der Figur. |
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

### welt-2.md

| Zeilen-ID | vorher | nachher | Grund |
| --- | --- | --- | --- |
| `W2_DISK_HER_0240` | Wenn ich es war, hab ich zweimal die Wahrheit gesagt. Das schaff ich nicht mal mit Anlauf. | Wenn ich es war, hat Leonidas zweimal die Wahrheit gesagt. Das schafft der nicht mal mit Anlauf. | Fund 7: Hermes rechnete falsch (er selbst hätte nicht zweimal die Wahrheit gesagt, Leonidas schon). Pointe (Anlauf) bleibt. |

### welt-3.md

| Zeilen-ID | vorher | nachher | Grund |
| --- | --- | --- | --- |
| `W3_SUPP_VIE_0130` | Und das hier. Lag in einer Lieferung fürs Labor. Weiße Karte, vier Ecken. Ich wollte sie behalten, wegen der Ecken. Aber du hast sie verdient. | Und das hier. Lag im Leergut aus dem Labor, die beliefere ich. Weiße Karte, vier Ecken. Ich wollte sie behalten, wegen der Ecken. Aber du hast sie verdient. | Fund 96: Die Karte kam per Zufall. Jetzt beliefert Herr Vier das Labor (halber Satz). |
| `W3_HINT_PIX_0130` | Rechtsklick auf den weinenden Mann, die Frau mit dem Schirm und den Musiker. Dann stehen ihre Dummheiten in deinem Notizbuch. Dann geh zum Hut. | Sieh dir den weinenden Mann, die Frau mit dem Schirm und den Musiker an. Dann stehen ihre Dummheiten in deinem Notizbuch. Dann geh zum Hut. | Fund 98: Hinweis nannte die Maus (Rechtsklick). |
| `W3_HINT_PIX_0330` | Drück Tab und lauf als ich zweimal über den Gehweg vor dem Automaten. Dann zurück zu dir, Automat benutzen, „Déjà-vu“ wählen. Ich will dafür Fisch. | Wechsel zu mir und lauf zweimal über den Gehweg vor dem Automaten. Dann zurück zu dir, Automat benutzen, „Déjà-vu“ wählen. Ich will dafür Fisch. | Fund 98: Hinweis nannte die Taste Tab. |
| `W3_HINT_PIX_0730` | Rechtsklick auf die Streifen, dann den Farbcode nehmen, dann das Terminal mit dem Farbcode benutzen. Danach wechselst du zu mir. | Die Streifen ansehen, dann den Farbcode nehmen, dann das Terminal mit dem Farbcode benutzen. Danach wechselst du zu mir. | Fund 98: Hinweis nannte die Maus (Rechtsklick). |
| `W3_HINT_PIX_1230` | „Heiß“ von der Zelle gegen „kalt“ von den Keksen tauschen. Oder: Tab drücken und als ich das Deckenfenster in der Basis öffnen. Dann die Zelle nehmen und nach Hause. | „Heiß“ von der Zelle gegen „kalt“ von den Keksen tauschen. Oder: zu mir wechseln und als ich das Deckenfenster in der Basis öffnen. Dann die Zelle nehmen und nach Hause. | Fund 98: Hinweis nannte die Taste Tab. |
| `W3_EING_PIX_0185` | (neu) | Er quietscht noch. Und du hast Öl in der Tasche. | Fund 96: Freund 08/15 war ohne Warnung verpassbar. Neue Zeile nach dem Vorschlag im Bericht, ohne den Halbsatz „Ich sage es nur“ (laut Abschnitt E ein Muster). |

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

### zwischenspiele-und-finale.md

Noch keine Änderung am Wortlaut.

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

### Kann Absicht sein, nicht geändert

- Wann die Telefonzelle in der Simulation klingelt, hat im Spiel keinen Zustand. Die Zeile `W3_SIM_MAX_0220` hängt jetzt am Hotspot „klingelnde Telefonzelle“.
- „Die Nase … mit einem Teller“ fällt, egal womit Max wirft.
- Der Kalender im Prolog hat nach Fund 8 keine eigene Zweitzeile mehr. Beim zweiten Ansehen kommt eine Zeile aus dem allgemeinen Vorrat. Eine eigene Gag-Zeile wäre möglich.
- Die Figuren in Taverne und Klassenzimmer haben keine Zweitzeile beim Ansehen. Der Bericht nennt „rund 20“ Zeilen, die 20 Gegenstände sind erledigt.

### Offen laut Bericht

Folgt mit den Funden 109 bis 111.
