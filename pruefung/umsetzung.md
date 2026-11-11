# Umsetzung der 360-Grad-Prüfung: Protokoll

Grundlage: `pruefung/360-pruefung.md` (111 Funde). Auftrag: `pruefung/umsetzung-prompt.md`.

## Stand

- Paket 1 (die drei kritischen Fehler): fertig.
- Paket 2 (Werkzeuge): fertig.
- Pakete 3 bis 9: noch nicht begonnen.
- Weiter bei: Paket 3, Rätseltexte und Hinweis-Lücken.

Arbeitsweise nach einer Unterbrechung: Tabelle 1 zeigt je Fund den Status. Vor jedem Commit laufen `python3 tools/pruefen.py`, alle `--pruefen`-Läufe aus `.github/workflows/pruefen.yml` und nach Code-Änderungen die Godot-Tests.

## 1. Alle 111 Funde

Status: umgesetzt, nicht bestätigt, Entscheidung bitte prüfen, offen für Sebastian.

| Nr. | Paket | Status | Was geändert wurde und wo |
| --- | --- | --- | --- |
| 1 | 1 | umgesetzt | Bestätigt. `spiel.gd`: `wechsel_moeglich()` fragt jetzt `wechsel_frei()`. Abschnitte ohne eigenen Schalter antworten über ihre Regeln. `finale.gd`: Wechsel frei ab dem Hilferuf bis zur roten Taste, in den Zwischenspielen gesperrt. Kein neuer Schalter nötig. Test `finale_anspiel.gd` spielt Schritt C jetzt über Klicks auf Sessel und Porträts (vorher 3 Fehler, jetzt 0). |
| 2 | 1 | umgesetzt | Bestätigt. `godot_raeume.py` übernimmt Zusätze nach dem Komma als Bedingung in Worten, kennt „drittes Mal“, „viertes Mal“ und „als Pixel“ und bricht ab, wenn eine Zeile eine andere am selben Objekt verdrängt. `spiel.gd`: `eintrag_passt()` wertet die Worte über die Regeln aus (`zusatz_ok`), `ansehen()` sagt die dritte und vierte Zeile. Neue Bedingungen in `welt_2.gd` (Finaltag, Duell), `welt_3.gd` (Panzertür, zweiter Tausch, Olivenöl), `welt_4.gd` (Grusel-Sender). 27 Auslöser im Skript berichtigt (Tabelle in Abschnitt 2), vier falsche Zuordnungen in `tools/layout/welt-2.yaml` entfernt. Alle 50 Paare der Liste sind aufgelöst. Neuer Test `ansehen_zustand.gd` über Rechtsklick (vorher 7 Fehler, jetzt 0). Offen bleibt: Wann die Telefonzelle in der Simulation klingelt, hat im Spiel keinen Zustand (Liste für Sebastian). |
| 3 | 1 | umgesetzt | Bestätigt. `hinweise.gd`: Stufe und Zeit hängen am Schlüssel `<abschnitt>/<schritt>`. `zustand.gd`: alte Schlüssel ohne Abschnitt verfallen beim Laden, die Hinweise beginnen dann wieder bei Stufe 1. `welt_3.gd`, `welt_4.gd`: Errungenschaft „Ohne Pfote“ liest den neuen Schlüssel. Neuer Test `hinweise_welten.gd` über Klicks auf die Pfote (vorher 5 Fehler, jetzt 0). Nicht Teil des Fundes und unverändert: `letzter_schritt` und das Notizbuch-Ziel merken sich weiter nur die Rätselnummer. |
| 4 | 3 | noch nicht bearbeitet |  |
| 5 | 3 | noch nicht bearbeitet |  |
| 6 | 3 | noch nicht bearbeitet |  |
| 7 | 3 | noch nicht bearbeitet |  |
| 8 | 3 | noch nicht bearbeitet |  |
| 9 | 3 | noch nicht bearbeitet |  |
| 10 | 3 | noch nicht bearbeitet |  |
| 11 | 3 | noch nicht bearbeitet |  |
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
| 95 | 3 | noch nicht bearbeitet |  |
| 96 | 3 | noch nicht bearbeitet |  |
| 97 | 3 | noch nicht bearbeitet |  |
| 98 | 3 | noch nicht bearbeitet |  |
| 99 | 3 | noch nicht bearbeitet |  |
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

Fund 2: Das Spiel konnte diese Zeilen nicht von einer anderen Zeile am selben Objekt unterscheiden. Geändert ist nur die Angabe, wann die Zeile kommt.

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

### prolog.md

Noch keine Änderung am Wortlaut.

### welt-1.md

Noch keine Änderung am Wortlaut.

### welt-2.md

Noch keine Änderung am Wortlaut.

### welt-3.md

Noch keine Änderung am Wortlaut.

### welt-4.md

Noch keine Änderung am Wortlaut.

### zwischenspiele-und-finale.md

Noch keine Änderung am Wortlaut.

## 3. Musterzahlen vorher und nachher

Folgt mit Paket 6.

## 4. Liste für Sebastian

Folgt laufend.
