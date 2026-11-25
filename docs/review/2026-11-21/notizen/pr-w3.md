# Notiz pr-w3: Welt 3 „Neo-Neustadt 2099“ bis zum Anfang von Welt 4

**Rolle:** Welt-Prüfer (ein Durchgang aus fünf Blickwinkeln: Durchspieler, Level-Design, Game-Design, Technical Art, Gameplay-Skript). **Umfang:** Welt 3 vollständig (12 Räume, alle Zustände, Code-Sicht, Rätsel R1a bis R13), Welt-Ende, Übergang, Zwischenspiel 3 im Spielfluss, erster freier Moment in Welt 4; dazu Stichprobe R5-W4-11 in Welt 4. **Geprüfter Commit:** `04c5a79f` (main nach PR #46), Checkout `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s`.

**Wie geprüft:** Fernsteuerung (`werkzeuge/cloud/fs`) ohne Testmodus, echte Maus- und Tastenereignisse. Läufe unter `/home/user/lauf/pr-w3-*`. Kontrollpunkte unter `kontrollpunkte/welt-3/` mit `liste.md`. Lösungsweg: `belege/pr-w3/loesungsweg.txt`. Alle Belegpfade relativ zu `docs/review/2026-11-21/`.

**Anfangsstand:** Der Hauptteil der Prüfung begann mit `start welt-3` (Schnellstart: Inventar nur das Pixel-Feld), weil `kontrollpunkte/welt-2/welt2_ende.json` erst am 25.11. um 14:06 UTC kam. Zum Schluss ist die ganze Welt 3 noch einmal vom Stand `welt2_ende` aus mit echten Klicks durchgespielt (Abschnitt „Lauf vom Stand `welt2_ende`“), und `kontrollpunkte/welt-3/welt3_ende.json` stammt jetzt aus diesem Lauf. `welt2_ende` ist laut `pr-w2` kein voller Endstand der Welt 2 (Inventar echt, Schalter R7, R10, R11, R13 der Welt 2 offen); `welt2_ende_umgangen.json` lag bis zum Schluss nicht vor.

**Stand der Notiz:** abgeschlossen am 25.11.2026.

## Hauptfrage: Ist Welt 3 mit echten Klicks durchspielbar?

**Ja, in einem Zug; nein, sobald man an der falschen Stelle aufhört.**

- **Selbst im laufenden Spiel bestätigt:** Vom ersten freien Moment in der Unterstadt (`start welt-3`) bis zum ersten freien Moment in Welt 4 (Raum `testbild`) mit echten Klicks durchgespielt, alle 20 Rätselschritte (R1a bis R13), Welt-Ende, Zwischenspiel 3 mit Packen und Abreise; kein Hänger, kein Absturz. 17 Proben auf Sackgassen (andere Reihenfolgen, leere Budgets, Lösung B, Fehltausche): keine Sackgasse im Spielablauf. Die Pfote hat an jedem abgefragten Schritt drei Stufen.
- **Kritisch (im Spiel bestätigt, zweimal nachgestellt):** R5-W3-22. Wer das Spiel während der Schluss-Szene beendet und „Fortsetzen“ wählt, steht mit der Zelle in der Basis, und das Welt-Ende startet nie mehr. Die Szene dauert in Lesetempo 6 min 40 s ohne Eingabe (R5-W3-25), das Fenster für diesen Fehler ist also groß.
- **Kritisch aus anderen Notizen, in Welt 3 im Spiel bestätigt:** R5-W1-34 (nach Neustart und Laden hängt Deckerts Gespräch, R1b wird unlösbar), R5-P-01 (älteren Stand in derselben Sitzung laden: Huhn oder Tasse fehlen, R9c und R6 unlösbar; Inventar aus der Zukunft bleibt).
- **Vom echten Inventar der Welt 2 aus** (`welt2_ende`) ein zweites Mal bis Welt 4 durchgespielt, im Spiel bestätigt: Olivenöl am Hausmeister (`W3_FREUND_0815`, eigene Zeile des Hausmeisters im Welt-Ende), dritter Tausch mit der Sandale in Kammer 3, Reisetasche, Abreise.

**Funde in dieser Notiz:** 1 kritisch (R5-W3-22), 17 wichtig (R5-W3-01, -03, -04, -07, -10, -14, -15, -16, -19, -20, -23, -24, -25, -26, GD-W3-01, -04, -05), 14 kosmetisch (R5-W3-02, -05, -06, -08, -09, -11, -12, -13, -17, -18, -21, GD-W3-02, -03, -06). Alle im laufenden Spiel gesehen; wo eine Ursache aus dem Code gelesen ist, steht es in der Zeile dabei.

Befehle des geraden Wegs: `belege/pr-w3/loesungsweg.txt` (13 Blöcke), Kontrollpunkte unter `kontrollpunkte/welt-3/` (`liste.md`).

## Rätselübersicht (Klickweg)

Alles mit echten Klicks im Lauf `pr-w3-haupt` (Tempo 4, Textmodus `klick`), Befehle in `belege/pr-w3/loesungsweg.txt`.

| Rätsel | per Klick gelöst | Schritte | Bemerkung |
| --- | --- | --- | --- |
| R1a Beobachtungen | ja | drei Rechtsklicks (Frau, Musiker, weinender Mann) | weinender Mann zur Hälfte von Herrn Vier überdeckt (GD-W3-03) |
| R2 Nudelbude | ja | Herr Vier: 0090, dann „Die Nummer vier.“ | Morphäus flüstert „hinter der Säule“ |
| R1b Mensch-Test | ja | Deckert: 0090, dreimal die mittlere Antwort | dritte Antwort jeweils halb abgeschnitten (GD-W3-01) |
| R3a Déjà-vu | ja | Morphäus 0450, 0480; Gasse: Klick auf Pixel, Klick auf Automat, „Déjà-vu“ | |
| R3b Wahl | ja | Pastille in der Leiste zweimal anklicken (GD-W3-04); blaue zuerst probiert: Sofa-Traum, zurück zur Wahl | blaue Pastille wird nach der roten mit abgegeben (W3-R02-03 behoben) |
| R4 Sparschwein | ja | Oma: 0130 (Absage), 0110, dann erst erscheint 0150 | Regel 2 erst nach der Nahansicht Kochbuch (`W3_REGEL_2`) |
| R5 Glastür | ja | Tür zweimal ansehen, Code-Sicht öffnet von selbst, „verschlossen“ und „gesprächig“ anklicken | |
| R13 Morse-Tabelle | ja | Wechsel zu Pixel, Klick auf Kalles Tasse | Pixel bleibt dabei bei x 922 stehen, Tasse bei x 1064, Piepsi bei x 1245 am Bildrand (noch in Tempo 1 zu filmen) |
| R12 vierte Zutat | ja | Glückskeks (Rezeptkarte) auf Herrn Vier | Max läuft nicht hin (R5-W3-03) |
| R8 Hausmeister | ja | Telefonbuchseite auf den Hausmeister | ohne Olivenöl (Schnellstart) |
| R9a Leitung | ja | Zugangskarte auf Kartenleser, Klick auf Datenanschluss | Kalle spricht, steht aber nicht im Raum (noch zu filmen) |
| R6a Original/Kopie | ja | Tasse am Wasserspender nehmen, Klick auf Schmidt (Code-Sicht), „Original“ und „Kopie“ der Tasse | Etiketten am linken Bildrand ohne Namen (R5-W3-06) |
| R6b Mittagspause | ja | Tasse in der Leiste zweimal anklicken | gleiche Bedienung wie die Pastille (GD-W3-04); Brille und Akte kommen aus 280 px Entfernung |
| R7a Farbcode | ja | Akte ansehen (Regel 1), Klick auf den Farbcode (Zettel), Zettel aufs Terminal | |
| R7b Kabel | ja | Wechsel zu Pixel, Patch-Panel, drei Buchsen | Lösung = die drei Zeilen von oben nach unten (R5-W3-04) |
| R9b Kammer 1 | ja | Portalgerät (Gag), Klick auf Bernd, „schwer“ und „leicht“ | Tür geht schon beim Tausch auf, Max steht nicht auf dem Schalter (R5-W3-07) |
| R9c Kammer 2 | ja | Kritzelei lesen (Regel 3), Huhn nehmen, Klick auf Laser, „tödlich“ und „harmlos“ | |
| R9d Kammer 3 | ja | Klick auf Tür, „verschlossen“/„gesprächig“; Klick auf Bernd, „schwer“/„leicht“ | Code-Sicht schließt nach jedem Tausch |
| R10 Paradoxon | ja | M.U.T.T.I.: Regel 1, 2, 3 vorhalten | Lösung = die drei obersten Zeilen in Reihenfolge (R5-W3-05) |
| R11 Kern | ja | Klick auf die Zelle, „heiß“ und „kalt“ (Kekse) | Max nennt die Lösung beim Öffnen selbst (`W3_KERN_MAX_0430`) |
| Welt-Ende | ja | läuft nach R11 von selbst: Basis, Telefonzelle, Dachboden | kein freier Moment mehr in Welt 3 |
| Zwischenspiel 3 | ja | Opa (eine Frage), Drehknopf, Tasche (2 Wahlfächer), „Fertig gepackt“, Drehknopf | Ankunft in Welt 4, Raum `testbild` |

## Funde

Im laufenden Spiel beobachtet, außer wo „aus dem Code“ dabeisteht. „Verlauf“ meint `/home/user/lauf/pr-w3-haupt/verlauf.txt` (nicht im Repo), die Zahl davor ist die Spielzeit in Sekunden.

### Unterstadt, Straße

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W3-01 | unterstadt_strasse und alle Gespräche | wichtig | Sonstiges (Oberfläche) | **Bestätigt** (derselbe Fund wie R5-P-13, GD-W1-01, GD-W2-01): Die letzte Menüzeile ist abgeschnitten und laut Fernsteuerung „erst nach Rollen sichtbar“: Herr Vier (6 Optionen, „Ich geh dann mal.“), Bestellung (4), Deckert (4, „Ich schau mich erst mal um.“), Mensch-Test Frage 2 und 3 (je 3 Antworten, die dritte), Morphäus (5 und 7), Automat (4), Orakel-Oma (7 und 5). Beim Hausmeister (5 Optionen) meldet die Fernsteuerung die **erste** Zeile als nicht sichtbar. | `belege/pr-w3/str_deckert_menue_vierte_zeile_abgeschnitten.png`, `belege/pr-w3/eing_hausmeister_menue.png`; `optionen` in Verlauf 91, 113, 117, 190, 322, 704, 1532 | wie R5-P-13 |
| GD-W3-02 | unterstadt_strasse | kosmetisch | Humor (Text gegen Zustand) | **Bestätigt:** Morphäus' Abschiedsoption heißt nach bestandenem Mensch-Test weiter „Ich geh mal zum Detektiv.“, er rät dann, wie man Deckert antworten soll (`W3_NUD_MAX_0600`, `W3_NUD_MOR_0610`, `W3_NUD_MAX_0620`). | Verlauf 223.8 (Stand `w3_03_nach_R1b`: `klick @morphaeus`, `option 0600`) | wie gd-w3 |
| GD-W3-03 | unterstadt_strasse | kosmetisch | Klickflächen | **Bestätigt:** Der weinende Mann gewinnt an 19 von 36 Probestellen, an 17 Herr Vier. | `rklick @weinender_mann`, Verlauf 133 | wie gd-w3 |
| R5-W3-03 | unterstadt_strasse | wichtig | Positionierung | **Die Übergabe in R12 läuft aus 200 px Entfernung.** Glückskeks in der Hand, Klick auf Herrn Vier: Max bleibt am linken Bildrand stehen (52, 335), schaut von der Bude weg, und die ganze Szene (Keks, Suppe, Zugangskarte) spielt so; Herr Vier ist bei x 246. Beim Ansprechen ohne Gegenstand geht Max hin (246, 302). Vermutung aus dem Verhalten: „Gegenstand auf Figur“ löst kein Hingehen aus. Beim Hausmeister (R8) fiel es nicht auf, weil Max vom Gespräch davor schon neben ihm stand. | `belege/pr-w3/str_R12_uebergabe_max_steht_200px_weg_blick_abgewandt.png`; Stand `w3_13_nach_R13`: bis an den linken Rand laufen, `klick inv:rezeptkarte`, `klick @herr_vier` → `LAGE … Max (52,335)` | Vor „Gegenstand auf Figur“ zum Gehe-Punkt der Figur laufen und sie ansehen (wie beim Ansprechen). |
| R5-W3-23 | unterstadt_strasse (R8) | wichtig | Klickflächen, Rätsel (Bedienung) | **Die Telefonbuchseite ist ein 18 × 12 px großes Prop mitten im Hotspot „Telefonbuch in der Zelle“, und das Buch selbst gibt beim Benutzen eine Ersatzzeile.** Das Buch gewinnt an 27 von 36 Probestellen seiner Fläche, die Seite an 9 (x 156–174, y 184–196 im Bild). Ansehen des Buchs: „Ein Telefonbuch aus Papier. Da stehen alle Namen der Stadt drin …“ (`W3_STR_MAX_0060`). Benutzen des Buchs: „Das ist eine Idee. Keine gute …“ (`SYS_ERS_MAX_0070`). Die Pfote schickt den Spieler in Stufe 2 genau dorthin („In der Telefonzelle liegt ein Telefonbuch. Da steht sie drin.“, `W3_HINT_PIX_0820`), und wer dann auf das Buch klickt, bekommt in drei von vier Fällen die Absage. Erst der Klick auf das Eselsohr nimmt die Seite. | Abtast-Lauf (`werkzeuge/pr-w3_abtasten.py`, Stand `w3_00_anfang`): `klick telefonbuch_in_der_zelle … SYS_ERS_MAX_0070 … 27/36 (sonst: telefonbuchseite 9)`; `objekte` in der Unterstadt | Benutzen des Telefonbuchs nimmt die Seite (oder schlägt „Konner“ auf, solange der Hausmeister den Namen noch nicht genannt hat, mit einer eigenen Zeile). |

### Apothekengasse

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W3-04 | apothekengasse | wichtig | Rätsel (Bedienung) | **Bestätigt:** Die Pastille lässt sich nur schlucken, indem man sie in der Leiste zweimal anklickt. Rote Pastille auf Max: `SYS_ERS_MAX_0230`; auf den Automaten: `SYS_ERS_MAX_0120`. Pfote Stufe 1 (`W3_HINT_PIX_0340`) sagt nicht, wie. | Stand `w3_06_pastillenwahl`: `klick inv:rote_pastille`, `klick @max`; `klick inv:rote_pastille`, `klick @automat`; Verlauf 401.9, 414.9 | wie gd-w3 |
| GD-W3-05 | apothekengasse | wichtig | Rätsel (Text gegen Zustand) | **Bestätigt:** Ansehen von Omas Keksen direkt nach dem Erhalt in der Gasse: „Hundekuchen. Knochenförmig. Drüben waren das Kekse. Ich hab die Verwandlung gesehen …“ (`W3_BAS_MAX_0870`). Max war noch nie drüben. | Stand `w3_06_pastillenwahl`: `rklick inv:omas_kekse`, Verlauf 383.0 | wie gd-w3 |
| GD-W3-06 | apothekengasse | kosmetisch | Hinweise | **Bestätigt:** Der Zuruf „Wenn du noch länger auf die Pastillen starrst, wählt der Automat für dich. Er würde Beige nehmen.“ (`W3_APO_PIX_0920`) kommt bei offenem R3a, bevor es Pastillen gibt. | Pfoten-Lauf `pr-w3-pfote`: `stand holen w3_05_gasse_anfang`, Pfote, `warte 31`, Pfote, `warte 61` → Zuruf bei 1357.9 | wie gd-w3 |
| R5-W3-26 | apothekengasse (R3a) | wichtig | Animation, Rätsel | **Das Déjà-vu, um das sich Rätsel 3a dreht, ist nicht zu sehen.** Max bittet Pixel, zweimal genau gleich am Automaten vorbeizugehen; Pixel sagt „Gehen. Würdevoll. Schwanz hoch, Blick geradeaus …“ und „Und noch einmal. Dieselbe Pfote zuerst …“ und sitzt dabei 49 s lang an derselben Stelle (x 196–214 in allen 197 Bildern). Der Automat reagiert danach auf eine Bewegung, die es im Bild nie gab. Im Skript ist die Stelle eine reine Textfolge (`welt_3.gd` Z. 869, nur gelesen). | `belege/pr-w3/film02_dejavu_pixel_sitzt_49s_still.png` (20 Bilder aus Film `02_dejavu`); Befehle: Stand `w3_05_gasse_anfang`, `film an 02_dejavu 4`, `klick @pixel` | Pixel bei `W3_APO_PIX_0180` und `0190` je einmal am Automaten vorbeilaufen lassen (gleicher Weg, zweites Mal mit kurzem Bildflackern des Automaten). Der Trab ist vorhanden. |

### Stadtstraße (Simulation)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W3-01 | stadtstrasse | wichtig | Klickflächen, Laufwege | **Der Hotspot „Gehweg“ liegt als 600 px breiter Streifen (Raum-x 300–900, y 330–354) auf dem unteren Teil der Lauffläche.** Ein Linksklick dort schickt Max nicht zur Klickstelle, sondern zum Gehe-Punkt des Hotspots (639, 344), und er sagt eine Ablehnungszeile aus dem Ersatzpool („Opa würde jetzt sagen: Früher ging das …“, `SYS_ERS_MAX_0130`). Der Spieler will dort nur laufen; die Straße ist 1280 px breit und der Weg Wecker–Glastür führt genau über diesen Streifen. Beim ersten Versuch (Max bei x 240) geschah auf den Klick gar nichts. | Stand `w3_07_sim_anfang`: `klick 600 345` → keine Bewegung; `maus 600 345` → „gehweg“; `klick 600 345` → `ERSATZZEILE SYS_ERS_MAX_0130`, Max (639,344); Verlauf 620.7 | Gehweg-Hotspot nur für Rechtsklick (Ansehen) oder ganz streichen; Linksklick läuft zur Klickstelle. |
| R5-W3-02 | stadtstrasse | kosmetisch | Timing, Zustandswechsel | Pixels Zuruf in der Simulation kommt, bevor Pixel „auf der Leitung“ ist und bevor Max Kalle kennt: „Kalle sagt, die Katze läuft schon wieder vorbei …“ (`W3_SIM_PIX_0920`) beim ersten Aufenthalt, `W3_PIXEL_AUF_LEITUNG` wird erst 90 s später beim ersten Aufwachen gesetzt. Max hat kurz davor gesagt, es sei „zu leise“, weil keiner meckert. Der Zuruf hat außerdem den Klick auf den klingelnden Wecker geschluckt (R5-P-08). Gleiche Art wie GD-W3-06. | Verlauf 998.7 (Zuruf), 1088.1 (`W3_PIXEL_AUF_LEITUNG`) | Zurufe in der Simulation an `W3_PIXEL_AUF_LEITUNG` binden. |

### Widerstandsbasis, Büroturm, Labor (aus dem geraden Durchlauf; Raum-für-Raum-Prüfung folgt)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W3-04 | widerstandsbasis (R7b) | wichtig | Rätsel | **Das Kabelrätsel ist „drei Zeilen von oben nach unten“.** Das Menü am Patch-Panel bietet „Buchse Rot (Kreis)“, „Buchse Grün (Dreieck)“, „Buchse Gelb (Quadrat)“, „Doch nicht“ in genau der Lösungsreihenfolge. Welches Kabel gerade gesteckt wird, sagt das Menü nicht; der Farbcode aus dem 50. Stock und Kalles Übersetzung werden nicht gebraucht, weil jede Zeile Farbe und Symbol zusammen nennt. Eine falsche Wahl (zuerst Gelb) gibt die Enten-Zeilen und danach dasselbe Menü. Die Ente selbst ist nicht zu sehen: Man ist bei Pixel in der Basis, Max sagt nur „Quak.“ (`W3_TERM_MAX_0260`). Gleiche Art wie R5-W1-29 (Geheimtür) und GD-W2-07 (Kacheln). | `belege/pr-w3/bas_R7b_patchpanel_menue_loesung_in_reihenfolge.png`; Stand `w3_24_nach_R7a`: `portraet pixel`, `klick @patch_panel`, `option 3` (Ente), `option 1`, `option 2`, `option 3`; Verlauf 2354–2447 | Zwei Stufen: erst das Kabel wählen (Kreis, Dreieck, Quadrat), dann die Buchse nur mit Farbe („die rote“); Reihenfolge der Zeilen mischen. Für die Ente kurz zu Max in den Turm schneiden. |
| R5-W3-05 | kern (R10) | kosmetisch | Rätsel | Die drei Regeln stehen im Menü in Lösungsreihenfolge obenan („Regel 1 vorhalten“, „Regel 2 …“, „Regel 3 …“). Dreimal die jeweils nächste Zeile löst das schwerste Rätsel der Welt; nach jeder Antwort bleibt die Liste unverändert stehen, auch die schon benutzte Regel. Die Stichwort-Kette aus der Rätseldoku funktioniert im Text gut (`W3_KERN_MUT_0120`, `0140`), sie wird aber nicht gebraucht. | Stand `w3_32_kern_anfang`: `klick @mutti`, `option 1`, `option "Regel 2 vorhalten"`, `option "Regel 3 vorhalten"`; Verlauf 3029–3072 | Regeln mit ihrem Wortlaut statt der Nummer anbieten und mischen. |
| R5-W3-06 | buero_50 | kosmetisch | Grafik (Code-Sicht) | In der Code-Sicht des Büros hängen die Wörter von Klon, Schmidt und Klonen als drei Zeilen ohne Namen am linken Bildrand („Kopie“, „Original Hausschuhe“, „gleich“), weil die Figuren außerhalb des Bildausschnitts stehen (Max steht am Wasserspender). Wozu welches Wort gehört, ist nicht zu erkennen; nur die Tasse trägt ihren Namen („Kaffeetasse: Kopie leer“). Außerdem liegt die Stelle der Tasse-Etiketten mitten auf dem Farbcode. | `belege/pr-w3/buero_codesicht_etiketten_am_rand.png` | Rand-Etiketten mit Namen („Schmidt: Original“), wie bei Gegenständen in der Tasche. |
| R5-W3-07 | testkammer_1 (R9b) | wichtig | Rätsel, Animation | **Kammer 1 löst sich beim Tausch von selbst.** Nach „schwer“ ↔ „leicht“ steht Max weiter bei (212, 306) neben der Halterung; der Bodenschalter (x 270–362) wird nie betreten. Der Erzähler sagt „Klick. Die Tür gleitet auf.“ Der zweite Schritt des Rätsels (sich auf den Schalter stellen) entfällt, und was man sieht, passt nicht zum Text. Ein Klick auf den Schalter danach wiederholt die Erzählzeile `W3_KAM1_NAR_0460` („Klick. Die Tür gleitet auf. Bernd dreht sich weg …“), obwohl beides schon geschehen ist. In Tempo 1 noch zu filmen. | Stand `w3_26_kammer1_anfang`: `klick @bernd`, `knopf schwer`, `knopf leicht` → `W3_KAMMER_1_GELOEST`, `LAGE … Max (212,306)`; `klick @bodenschalter` → `W3_KAM1_NAR_0460`; Verlauf 2687–2715 | Nach dem Tausch nur „Ich bin schwer“; gelöst erst, wenn Max auf den Schalter geht (Klick auf den Schalter). Nach dem Lösen eigene Zeile für den Schalter. |
| R5-W3-08 | testkammer_2 | kosmetisch | Klickflächen | Nach R9c liegt der harmlose Laser weiter über dem Ausgang zu Kammer 3: Der Ausgang gewinnt an 14 von 36 Probestellen, an 22 der Laser. Wer auf die Tür klickt, bekommt meist die Laser-Zeile. | `klick @ausgang_testkammer_3` nach `W3_KAMMER_2_GELOEST`: „gewinnt an 14 von 36 (sonst: laser 22)“, Verlauf 2855 | Laser-Hotspot nach dem Lösen verkleinern (nur die Pfosten) oder unter den Ausgang ordnen. |
| R5-W3-09 | laboreingang | kosmetisch | Zustandswechsel | Pixels Zuruf „Er wischt im Kreis. Du stehst im Kreis. …“ (`W3_EING_PIX_0910`) kommt, nachdem der Hausmeister längst fort ist (`W3_HAUSMEISTER_WEG`, R9a gelöst). | Verlauf 1894.1 (Stand `w3_18_nach_R9a`, 45 s warten) | Zuruf an „Hausmeister da“ binden. |

| R5-W3-10 | buero_50, widerstandsbasis | wichtig | Hilfe-Pfote | **Wer nach R5 gleich in den Turm geht (der naheliegende Weg: die Tür ist gerade aufgegangen), bekommt von der Pfote einen Hinweis, dem er nicht folgen kann.** Im Turm nach R6b, Farbcode abgeschrieben, Terminal meldet „ohne tabelle ist das nur miau“ (`W3_TERM_KAL_0100`): Die Pfote bei Max gibt den Hinweis zu R12 („Herr Vier sucht seit elf Jahren eine Zutat …“, `W3_HINT_PIX_1310`), obwohl Max den Turm nicht verlassen kann und der nächste Schritt R13 bei Pixel ist. „Offene Rätselschritte“ nennt nur R12; R13 erscheint erst, wenn Pixel die Basis betreten hat. Bei Pixel in der Basis stimmt der Hinweis (R13, `W3_HINT_PIX_1410`), nennt aber „Kalle“ und „seine Tabelle“ auch dann, wenn der Spieler Kalle noch nie gesehen und das Terminal noch nicht benutzt hat. Vor R6a stimmt die Pfote im Turm (`W3_HINT_PIX_0610`). | Stand `w3_10_nach_R5` (frischer Prozess): `klick @ausgang_buero_50`, Tasse, R6a, R6b, `klick @farbcode_an_der_wand`, `klick inv:farbcode_zettel`, `klick @terminal`, `pfote` → `HINWEIS Schritt R12, Stufe 1`; zweite Sitzung Verlauf 181–221 | Solange Max im Turm festsitzt, nur Schritte anbieten, die von dort oder von Pixel aus gehen; nach `W3_TERM_KAL_0100` bei Max „Wechsle zu Pixel“ als Stufe 1. |
| R5-W3-11 | widerstandsbasis | kosmetisch | Humor (Text gegen Zustand) | Pixel an „Max' Kapsel“, während Max wach neben ihm in der Basis steht: „Er liegt da, lächelt und sabbert ein wenig. Ich habe ihn fotografiert.“ (`W3_BAS_PIX_0530`). Die Zeile gehört zum Zustand „Max liegt in der Kapsel“. | zweite Sitzung, Verlauf 1273.8; `status` davor: Max bei Raum (349,335), `W3_EBENE=realitaet` | Zeile an `W3_EBENE` binden; für die leere Kapsel eine eigene. |
| R5-W3-12 | kuehlung | kosmetisch | Positionierung, Zustandswechsel | Pixel kippt den Eimer aus 300 px Entfernung: Er bleibt am Schacht stehen (150, 320), der Eimer steht bei x 456–502 und liegt danach um. Ein zweiter Klick auf den umgekippten Eimer wiederholt „Ich kippe den Eimer über die Kühlung …“ (`W3_BAS_PIX_0650`). Außer dem Eimer hat der Raum keine Klickfläche (Aggregat, Rohre, Mopp). Dass es „drüben“ nicht regnet, ist W3-11 (weiterhin offen). | Fotos `081_kuehlung`, `082_kuehlung_eimer_um` im Lauf; Verlauf 1461.2, 1475.0 | Erst zum Eimer laufen; nach dem Kippen eigene Zeile; zwei, drei Ansehen-Flächen. |
| R5-W3-13 | widerstandsbasis (R13) | kosmetisch | Rätsel (Logik) | R13 lässt sich lösen, während Max in der Simulation im Turm steht und die Basis noch nie gesehen hat. Max spricht dann trotzdem in der Szene, als stünde er daneben („Das war Opa. In Blau und auf den Knien …“, `W3_PIEP_MAX_0140`), und die Morse-Tabelle, die Kalle in der Basis sortiert, landet bei Max im Turm im Inventar. Spielerisch ist das gut (die Reihenfolge trägt, siehe „Gut gelöst“), nur Max' zwei Zeilen passen nicht. | zweite Sitzung, Verlauf 828–866 (erste Probe) und 228–283 | Max' Zeilen in diesem Fall weglassen oder als „über die Leitung gehört“ fassen; die Tabelle Pixel geben oder Kalle am Terminal „hab sie wieder“ sagen lassen (das tut `W3_TERM_KAL_0090` schon). |
| R5-W3-14 | testkammer_1 (R9b) | wichtig | Rätsel, Zustandswechsel | **Kammer 1 lässt sich vom Eingang aus lösen, ohne das Portalgerät zu nehmen; Bernds Vorstellung kommt dann nach der Lösung.** Bernd steht beim Betreten schon bei (425, 306) und ist anklickbar. `klick @bernd` öffnet die Code-Sicht, „schwer“ ↔ „leicht“ löst die Kammer; Max steht dabei weiter am Eingang (113, 306), 160 px vor dem Bodenschalter (verschärft R5-W3-07). Max ruft „Bernd. Bernd, ich hab's nicht so gemeint“, obwohl ihm den Würfel niemand vorgestellt hat. Nimmt und benutzt man das Portalgerät danach, läuft die ganze Einführung: Opa im Portal, dann M.U.T.T.I.: „Kammer eins. Der Bodenschalter öffnet die Tür. Er braucht Gewicht. … Das ist dein Begleitwürfel. Er heißt Bernd.“ (`W3_KAM1_MUT_0160`, `0180`), während die Tür offen ist und Bernd an der Decke hängt. Wer das Gerät liegen lässt, sieht Opa im Portal nie (der einzige Blick auf Opa in dieser Welt außer dem Hologramm). Aus dem Code: Die Vorstellung hängt an `benutzen_inventar_portalgeraet` (`W3_BERND_VORGESTELLT`), die Code-Sicht an nichts davon. | `belege/pr-w3/kam1_geloest_vom_eingang_ohne_portalgeraet.png`; Stand `w3_26_kammer1_anfang`: `klick @bernd`, `knopf schwer`, `knopf leicht` → `W3_KAMMER_1_GELOEST`, `Max (113,306)`; danach `klick @portalgeraet_in_der_halterung`, zweimal `klick inv:portalgeraet` → `W3_KAM1_MUT_0160`; dritte Sitzung, Verlauf 546–714 | Bernd erst mit der Vorstellung erscheinen lassen (er „schwebt heran“), oder die Code-Sicht in Kammer 1 erst nach `W3_BERND_VORGESTELLT` öffnen; die Vorstellung an das Betreten hängen, das Portal als freien Gag lassen. |
| R5-W3-15 | testkammer_3 (R9d) | wichtig | Rätsel (Text gegen Zustand) | **Die Zeilen zum Tausch „schwer“ ↔ „leicht“ hängen am Wortpaar, nicht an dem, was geschieht.** (a) Andere Reihenfolge, erst Bernd, dann die Tür: Max sagt nach dem ersten Tausch „Bernd schwebt weg. Das Huhn liegt am Boden und quietscht. Die Tür redet. Es ist das schönste Chaos …“ (`W3_KAM3_MAX_0160`), die Tür ist da noch verschlossen und stumm. (b) Nach dem Fehltausch „verschlossen“ ↔ „schwer“ (Tür ist schwer, Bernd verschlossen) erzählt der Tausch „schwer“ (jetzt an der Tür) ↔ „leicht“ (Huhn): „Bernd steigt auf und schwebt aus dem Spalt. Das Huhn plumpst zu Boden …“ (`W3_KAM3_NAR_0150`, `MAX_0160`), gleich danach „Zwei Tausche weg. Tür zu.“ (`W3_KAM3_MAX_0250`); Bernd steht laut `status` weiter im Spalt (480, 290). Der Spieler liest eine Erfolgsmeldung und steht vor der geschlossenen Tür. | Stand `w3_30_kammer3_anfang`: (b) `klick @bernd`, `knopf verschlossen`, `knopf schwer`, `klick @bernd`, `knopf schwer`, `knopf leicht`; (a) nach Raus-und-Rein `klick @bernd`, `knopf schwer`, `knopf leicht`; dritte Sitzung, Verlauf 1090–1119 und 1221–1228 | Zeilen nach Zustand wählen: „Die Tür redet“ nur, wenn sie redet; beim Tausch Tür ↔ Huhn eigene Fehltausch-Zeile. |
| R5-W3-16 | testkammer_2, testkammer_3, unterstadt_strasse | wichtig | Sonstiges (Texte an Pflichtstellen) | **Die gesperrten Türen der Rätsel antworten mit Zufallszeilen aus dem Ersatzpool.** Klick auf den Ausgang zu Kammer 3, solange der Laser tödlich ist: „Das steht in keiner Komplettlösung, und das hat bestimmt einen Grund.“ (`SYS_ERS_MAX_0200`). Klick auf den Ausgang zum Kern vor R9d: „Opa würde jetzt sagen: Früher ging das …“ (`SYS_ERS_MAX_0130`). Tür zur Widerstandsbasis in der Unterstadt am Weltanfang: „Das wäre ein Cliffhanger, und zwar einer ohne Fortsetzung.“ (`SYS_ERS_MAX_0120`). An genau diesen Stellen sucht der Spieler den Grund, warum es nicht weitergeht. Weitere Ersatzzeilen dieser Art stehen unter W3-13 (weiterhin offen). Gut dagegen: die Gasse („Nicht so schnell, Junge …“, `W3_STR_DEC_0290`), Kartenleser und Panzertür. | dritte Sitzung, Verlauf 915.3 (Kammer 2), 1049.2 (Kammer 3), 163.8 (Unterstadt) | Je eine eigene Zeile („Durch den Laser? Ich bin sechzehn, nicht lebensmüde.“ o. ä.) über die Texte-Runde. |
| R5-W3-17 | kern, testkammern | kosmetisch | Positionierung | Im Kern spielt alles vom Eingang aus: Max bleibt bei (120, 316) stehen, während er M.U.T.T.I. (455, 300) die drei Regeln vorhält, die Zelle „fast berührt“ (`W3_KERN_MAX_0420`) und in der Code-Sicht tauscht. In Kammer 1 ebenso (Code-Sicht an Bernd aus 310 px). In Kammer 3 läuft er dagegen zu Bernd und stellt sich in ihn (475, 300 gegen 480, 290; der Würfel und sein Wort „schwer“ sind verdeckt). | `belege/pr-w3/kam3_codesicht_max_steht_in_bernd.png`; Foto `089_kern_menue_max_am_eingang` im Lauf; `LAGE menue … kern … Max (120,316)` | Gehe-Punkte für M.U.T.T.I., Zelle und Bernd (40 bis 50 px daneben), wie in AP-04 für andere Figuren. |
| R5-W3-18 | testkammern, kern | kosmetisch | Hilfe-Pfote | Zwischen den Kammern hat die Pfote nichts: Nach R9b (Tür zu Kammer 2 offen) sagt sie „Mir fällt gerade nichts ein, was du tun müsstest. Genieß es.“ (`W3_HINT_PIX_0010`), „Offene Rätselschritte“ ist leer, bis man den nächsten Raum betritt; ebenso nach R9d. Im Kern, wenn die Zelle über das Fenster schon kalt ist, erklärt Stufe 2 weiter beide Wege zum Kühlen (`W3_HINT_PIX_1220`) statt „Nimm sie“. | dritte Sitzung, Verlauf 744.0 und 1598.0 | „Geh durch die Tür“ als Hinweis, solange der nächste Pflichtraum unbesucht ist; R11-Hinweis für die kalte Zelle. |
| R5-W3-19 | widerstandsbasis, stadtstrasse | wichtig | Zustandswechsel, Humor (Enthüllung) | **Ein Klick auf Pixels Porträt in der Simulation zeigt die Widerstandsbasis, bevor Max je aufgewacht ist.** Gleich nach der roten Pastille (Stand `w3_07_sim_anfang`) ist der Figurenwechsel frei. Pixel steht dann ohne ein Wort in der Basis: Kapseln, Kalle, Rebellen, Piepsi, alles anklickbar, die Pfote erklärt R13 („Kalle kann nichts übersetzen, weil er seine Tabelle verloren hat“). Die Szene „erstes Aufwachen“ („Ein Wrack voller Kapseln und Kabel, und ein Typ mit Headset“, `W3_BAS_MAX_0030`; Kalle stellt sich vor) kommt erst später und erzählt dem Spieler, was er schon gesehen hat. Die Pointe „die Vorstadt ist nicht echt“ fällt damit beim ersten neugierigen Porträt-Klick, ohne Text. Spielerisch folgt daraus nichts Schlimmes (R13 und der ganze Turm gehen in dieser Reihenfolge, siehe Sackgassen-Suche). | Pfoten-Lauf `pr-w3-pfote`: `stand holen w3_07_sim_anfang`, `portraet pixel` → `RAUM widerstandsbasis`, `Offene Rätselschritte: R5, R13`, keine Zeile; Foto `071_basis_pixel_vor_erstem_aufwachen` im Lauf `pr-w3-haupt` | Bis `W3_ERSTES_AUFWACHEN` den Wechsel in der Simulation sperren (Pixels Porträt grau, Zeile „Er ist … nicht hier“), oder beim ersten Wechsel eine kurze eigene Szene für Pixel in der Basis (Kalle, Kapsel) und das erste Aufwachen kürzen. |
| R5-W3-20 | testkammer_1 | wichtig | Grafik, Zustandswechsel | **Das Portalgerät ist in der Halterung nicht zu sehen.** Die Klickfläche heißt „Portalgerät in der Halterung“, im Bild hängt aber vor und nach dem Nehmen dieselbe leere weiße Halterung (die Grundaufnahmen `testkammer_1_anfang.png` und `testkammer_1_var_r9b_w3_portal_genommen.png` sind an der Stelle pixelgleich). Zusammen mit R5-W3-14 heißt das: Nichts im Bild lädt dazu ein, das Gerät zu nehmen, und die Kammer geht ohne. | `belege/pr-w3/kam1_halterung_vor_und_nach_dem_nehmen_gleich.png` (links Anfang, rechts genommen, sechsfach vergrößert; Vergleich der Grundaufnahmen aus `belege/raeume/welt-3/`), im Spiel dasselbe Bild: `belege/pr-w3/kam1_geloest_vom_eingang_ohne_portalgeraet.png` | Gerät als Prop in die Halterung (Inventarbild verkleinert), nach dem Nehmen ausblenden. |
| R5-W3-21 | Inventarleiste, Reisetasche | kosmetisch | Grafik | Das Symbol „Agent Schmidts Sonnenbrille“ ist schwarz auf dem dunkelblauen Grund von Leiste und Reisetasche kaum zu erkennen. | `belege/pr-w3/zs3_tasche_erspieltes_inventar_sonnenbrille_kaum_sichtbar.png` (fünftes Feld unter „Daneben liegt“) | Heller Rand oder Glanzlicht auf Gestell und Gläsern. |
| **R5-W3-22** | widerstandsbasis (Welt-Ende) | **kritisch** | Durchspielbarkeit (Speichern/Laden), Zustandswechsel | **Wer das Spiel während des Welt-Endes beendet und fortsetzt, kann Welt 3 nicht mehr abschließen.** Nach R11 wechselt das Spiel in die Basis und speichert dort automatisch („Autospeicher“, Raum Widerstandsbasis); erst danach beginnt die Schluss-Szene (rund 100 s in der Basis und auf der Straße), der nächste Autospeicher kommt auf dem Dachboden. Lädt man den Stand aus der Basis, steht Max mit der Energiezelle im Inventar frei in der Basis, und die Schluss-Szene startet nie: 120 Spielsekunden gewartet, gelaufen, Kalle angesprochen, über das Terminal ins Labor und per Kapsel-Schütteln zurück, auf die Straße. Die Pfote sagt „Mir fällt gerade nichts ein, was du tun müsstest.“ (`W3_HINT_PIX_0010`), „Offene Rätselschritte“ ist leer. Ansehen der Telefonzelle: „Die Telefonzelle klingelt wieder. Und ich hab das Gefühl, diesmal ist es für mich.“ (`W3_STR_MAX_0330`), Benutzen: Ersatzzeile („Hab ich mal in einer Serie gesehen …“), Zelle auf die Telefonzelle: „Ich könnte. Aber warum sollte ich?“, Zelle auf Kalle: „Das wäre ein Cliffhanger, und zwar einer ohne Fortsetzung.“ Zweimal nachgestellt: (1) Programm neu gestartet, Hauptmenü „Laden“, „Autospeicher 1 · Widerstandsbasis“; (2) realistischer Fall: Prozess beendet, während die erste Zeile der Schluss-Szene stand, neu gestartet, **„Fortsetzen“** → derselbe Stand in der Basis. Vermutung aus dem Verhalten: Die Schluss-Szene hängt am Ablauf nach R11 und an keinem gespeicherten Zustand; beim Betreten der Basis mit gelöstem R11 prüft sie niemand nach. | `belege/pr-w3/R5-W3-22_fortsetzen_nach_abbruch_im_weltende_basis_zelle_kein_ende.png`, `belege/pr-w3/R5-W3-22_lademenue_autospeicher_1_widerstandsbasis.png`; Befehle: frischer Prozess, `stand holen w3_alt_kern_loesung_b_zelle_kalt`, `klick @energiezelle`, warten bis `RAUM widerstandsbasis` und `LAGE text`, Prozess beenden, `start`, `knopf "1   Fortsetzen"`, `warte 90`, `status` → `LAGE frei | widerstandsbasis`, `inv` → `energiezelle`; vierte und fünfte Sitzung des Laufs `pr-w3-haupt` | Schluss-Szene an den Zustand hängen: beim Betreten der Basis (und nach dem Laden) mit gelöstem R11 und ohne `ZWISCHENSPIEL=3` starten. Den Autospeicher zwischen R11 und Schluss-Szene weglassen oder erst nach der Szene schreiben. |
| R5-W3-24 | widerstandsbasis (R13) | wichtig | Positionierung, Animation | **Opas Nachricht, der Wendepunkt der Welt, spielt am Bildrand und ohne Bild.** In der Szene nach dem Tassen-Schubser (133 s in Tempo 1) steht der Putzroboter Piepsi ganz rechts, vom Bildrand halb abgeschnitten (nur das blaue Auge ist bei x ≈ 630 zu sehen). Der Erzähler beschreibt, was dort geschieht („Der Kaffee fließt zäh über den Boden, genau in Piepsis Gelenke“, „Piepsi zuckt. Richtet sich auf. Das Auge leuchtet blau, der Hut springt hoch“), zu sehen ist davon nichts; Opas Nachricht („Hilf mir, Max. Du bist meine einzige Hoffnung. Der Kern muss weich bleiben …“) steht als gelber Text oben rechts ohne Hologramm. Die Tasse bleibt die ganze Szene aufrecht auf dem Tisch, Pixel sitzt die ganze Zeit neben Max und geht nie zum Tisch. Max, Kalle und der Rebell stehen dabei in 80 px ineinander (Max halb in Kalle; R5-P-12). | `belege/pr-w3/r13_szene_piepsi_am_bildrand_tasse_bleibt_max_in_kalle.png` (drei Bilder aus dem Film `06_r13`, Bild 100, 145, 282); Befehle: Stand `w3_12_vor_R13`, `film an 06_r13 4`, `klick @kalles_tasse` | Piepsi 60 bis 80 px nach links setzen oder die Kamera für die Szene nach rechts fahren; Tasse nach dem Schubser umgekippt zeigen (Zustandsbild), Pixel vorher zum Tisch laufen lassen; für Opas Nachricht ein blaues Flackerbild über Piepsi. |
| R5-W3-25 | kern, widerstandsbasis, unterstadt_strasse, dachboden | wichtig | Timing | **Vom Klick auf die Energiezelle bis zum nächsten eigenen Klick vergehen 6 min 40 s.** Gemessen in Tempo 1 mit `textmodus lesen`: Kern 88 s, Abschied in der Basis 59 s, Telefonzelle 51 s, Ankunft auf dem Dachboden 200 s, zusammen 399,6 Spielsekunden ohne eine Eingabe; Esc überspringt nichts. In den 200 s auf dem Dachboden stehen Max, Opa und Pixel unverändert da (auch bei „Opa hält die Zelle ins Licht“ und „Pixel springt in die Kiste, wühlt, taucht mit der Zelle im Maul wieder auf“). Dazu das erste Aufwachen (162 s) und R13 (133 s). Dasselbe Muster wie R5-P-30 im Zwischenspiel 1; W3-R01-02 und W3-R03-05 vom 20.11. sind damit weiterhin offen. Im selben Stück liegt der Autospeicher aus R5-W3-22. | `belege/pr-w3/film19_r11_weltende_zs3_ankunft_400s_kontaktbogen.png` (25 Bilder aus 1435, 4 Bilder je Sekunde); Befehle: Stand `w3_32_kern_anfang`, R10, `marke`, `klick @energiezelle`, `knopf heiß`, `knopf kalt`, `warte` … `zeit` → „Spielzeit seit Marke: 399.6 s“ | Die Dachboden-Ankunft in zwei Teile mit einem Klick dazwischen (Zelle selbst auf die Werkbank legen), Pixels Kisten-Sprung als Bewegung; Abschied in der Basis kürzen; ein Überspringen für gesehene Szenen. |

## Raum für Raum: Grafik, Perspektive, Größen, Positionierung, Laufwege, Klickflächen

Grundlage: jeder Raum in jedem Zustand im Spielfluss gesehen (gerader Durchlauf, Sackgassen-Suche, 19 Filme), dazu die Raumaufnahmen `belege/raeume/welt-3/*_mitmax.png` (alle Zustände nebeneinander) und der Abtast-Lauf für die Klickflächen. Code-Sicht geöffnet in Stadtstraße (Glastür), Büro, Kammer 1, 2, 3 und Kern. Laufwege nur im Spiel begangen, kein Laufgitter (siehe „Nicht geprüft“).

| Raum | Zustände gesehen | Grafik, Perspektive, Größen | Positionierung, Laufwege | Klickflächen | Funde |
| --- | --- | --- | --- | --- | --- |
| Unterstadt, Straße (1280 px) | Anfang, nach R1b, nach R12, Welt-Ende | Stimmig, Figuren passen zu Zelle, Bude und Vordach; Regen, Dampf, Neon laufen. Einhorn klein und dunkel (W3-R01-03 behoben). | Durchquerung in zwei Klicks, rund 9 s. Übergabe an Herrn Vier aus 200 px (R5-W3-03). Pixel sitzt bei der Ankunft dicht an der Frau mit Schirm. | Telefonbuchseite 18 × 12 px im Telefonbuch (R5-W3-23); weinender Mann gegen Herrn Vier (GD-W3-03) | R5-W3-03, -16, -23, GD-W3-01 bis -03 |
| Apothekengasse (1280 px) | Anfang, Pastillen in der Ausgabe | Stimmig; Automat mit zwei Pastillen als Zustand gut lesbar | kurzer Weg, Automat mittig | ohne Befund | GD-W3-04 bis -06 |
| Stadtstraße (1280 px) | Tag, Nacht, Wecker still und klingelnd, Tür redet | Tag sauber; Autos auf der Fahrbahn, Nachttisch vorn (W3-R06-02 behoben). **Nacht:** Max, Schmidt, Katze, Auto und Vögel in Tagesfarben (W3-06/W3-7 offen). Max ist auf dem Gehweg so hoch wie die Häuser dahinter samt Dach (W3-R06-03 unverändert, liest sich als Vordergrund). | Gehweg-Hotspot schluckt Laufklicks (R5-W3-01) | Sonne 0/36 unter den Porträts | R5-W3-01, -02, -19 |
| Küche der Orakel-Oma | Anfang, nach R4 (Schwein fort, Scherben), Eieruhr | Tisch auf Hüfthöhe (W3-R07-01 behoben), Scherben als Zustand, alles lesbar | Max stellt sich beim Reden dicht vor die Oma, ohne Überdeckung | ohne Befund; Eieruhr weckt | – |
| Widerstandsbasis (1280 px) | Anfang, Schnee, nach R13, nach R7b, Welt-Ende | Stimmig; Rebell und Rebellin getrennt (W3-R03-02 behoben), Schnee auf der Kapsel | Max wacht in Pixel auf (326/322), in R13 steht Max in Kalle; Piepsi am Rand (R5-W3-24) | Ausgang Kühlung 14/36 gegen den Lüftungsschacht | R5-W3-04, -11, -13, -19, -22, -24 |
| Kühlung | vereist, getaut (Eimer gekippt) | Stimmig; Pixel wirkt hier etwas größer als in der Basis (W3-NS-02-Nebensatz, nicht nachgemessen) | Eimer aus 300 px gekippt (R5-W3-12) | ohne Befund | R5-W3-12 |
| Laboreingang | Hausmeister da, fort (Pfütze), Tür zu, Tür offen | Stimmig; Mopp richtig herum (W3-R05-02 behoben), offene Tür als Datenwand gut | Hausmeister rollt nach links ab, dicht an Max vorbei | ohne Befund | R5-W3-09 |
| Büro 50 (1280 px) | Anfang, Code-Sicht, nach R6a (Klone fort), nach R6b, Farbfelder | Flur mit Fluchtpunkt sauber, drei getrennte Farbfelder (W3-R08-05 behoben). Im Flur stehen nur Schmidt und ein Klon, der Text spricht von vielen (W3-R08-06 offen). | Code-Sicht und Tausch vom Terminal aus, 250 px von Schmidt | Brille und Akte vor R6 unsichtbar und nicht nehmbar (W3-R08-03 behoben) | R5-W3-06, -10 |
| Testkammer 1 | Anfang, Portalgerät genommen, gelöst (Tür offen, Bernd fort) | Sauber. Die Halterung sieht vor und nach dem Nehmen gleich aus (R5-W3-20). | Max geht zur Halterung; den Bodenschalter betritt er nie (R5-W3-07) | Portalgerät 36/36 | R5-W3-07, -14, -20 |
| Testkammer 2 | Anfang, Laser harmlos (rosa, wabbelig), Huhn fort | Sauber, Laser quer vor der Tür (W3-R10-01 behoben), Etiketten der Code-Sicht überdecken sich nicht mehr (W3-R10-02 behoben) | Max geht zum Laser | Ausgang Kammer 3 14/36 hinter dem Laser (R5-W3-08) | R5-W3-08, -16 |
| Testkammer 3 | Anfang (Schloss, Bernd im Spalt), Tür offen | Sauber, Bernd im Spalt (W3-R11-01 behoben); Lautsprecher leuchtet beim Sprechen | Alles vom Eingang aus; in der Code-Sicht steht Max in Bernds Etikett; Bernd und Tür wechseln erst nach dem Text | ohne Befund | R5-W3-15, -16, -17 |
| Kern | Zelle heiß, kalt (vereist), fort; M.U.T.T.I. an und aus | Sauber, M.U.T.T.I. als hängende Küchenmaschine, Auge dunkel nach R10, Zelle in drei Zuständen (W3-R12-03 behoben) | Regeln vom Eingang aus, zur Zelle geht Max hin | M.U.T.T.I. 25/36 (W3-R12-04 behoben) | R5-W3-05, -17 |
| Dachboden (Zwischenspiel 3) | Ankunft, frei, gepackt | Abendlicht; Opa und Pixel in Tagesfarben (R5-P-25) | Max stellt sich in Opa (R5-P-12); `klick @opa` verfehlt | Opas Fläche neben der Figur | siehe Zwischenspiel 3 |

## Raum für Raum: Ansehen und Benutzen (Abtast-Lauf)

Mit `werkzeuge/pr-w3_abtasten.py` in jedem Raum jedes sichtbare Objekt angesehen (Rechtsklick) und jeden Hotspot benutzt (Linksklick), nur echte Klicks, Tempo 4, von den Kontrollpunkten aus (Protokoll: Lauf `pr-w3-pfote`, `abtasten.txt`). Gezählt sind Zeilen aus dem Ersatzpool (`SYS_ERS_…`).

| Raum (Stand) | Objekte | Ersatzzeilen | Wo |
| --- | --- | --- | --- |
| Unterstadt, rechte Hälfte (`w3_00_anfang`) | 16 | 6 | Benutzen: Himmel, **Telefonbuch in der Zelle** (R5-W3-23), Dampfgitter, Vordach, Pizza-Plakat, Pfützen |
| Apothekengasse (`w3_05`) | 6 | 3 | Benutzen: Kisten, tropfendes Rohr, Wandlampe |
| Stadtstraße (`w3_07`) | 11 | 3 | Benutzen: Häuser, Himmel, **Sprechanlage** (Ansehen schaltet die Code-Sicht frei, Benutzen gibt „…“ aus dem Pool) |
| Küche (`w3_08`) | abgebrochen | mind. 5 | Benutzen: Kehrblech, Tapete, Tisch, Gardinen, Kochbuch. Der Lauf brach ab, weil die Eieruhr Max weckt (Raumwechsel); das ist richtig so. |
| Widerstandsbasis (`w3_11`) | 21 | 7 | Benutzen: **Max' Kapsel** (`SYS_ERS_MAX_0020`, obwohl sie der Weg zurück in die Stadt ist; das Terminal übernimmt das), Kapseln, Plakat, Steuerpult, Pizzakartons, Lüftungsschacht; **Ansehen** des Ausgangs zur Kühlung (`SYS_ERS_MAX_0050`) |
| Laboreingang (`w3_15`) | 10 | 3 | Benutzen: Warnstreifen, Pinnwand, Deckenlampe |
| Büro 50 (`w3_20`) | 11 | 1 | Benutzen: Topfpflanzen |
| Testkammer 1 (`w3_26`) | 8 | 2 | Benutzen: Wandplatten, Lautsprecher |
| Testkammer 2 (`w3_28`) | 7 | 1 | Benutzen: Lautsprecher |
| Testkammer 3 (`w3_30`) | 5 | 0 | – |
| Kern (`w3_32`) | 6 | 3 | Benutzen: Streifen, Kabel, Sockel |

Lesart: **Ansehen hat überall eine eigene Zeile** (eine Ausnahme, der Ausgang zur Kühlung). Beim Benutzen von Kulisse kommt der Pool, das ist vertretbar; störend ist er an den drei fett gesetzten Stellen, weil dort ein Rätsel hängt, und an den gesperrten Türen (R5-W3-16). W3-13 ist damit zum größeren Teil erledigt, der Rest steht hier.

Klickflächen aus demselben Lauf (Anteil der 36 Probestellen, an denen das Objekt gewinnt):

- **Sonne** (Stadtstraße): 0 von 36. Die Fläche (x 20–76 oben links) liegt ganz unter den beiden Porträts; die Sonne ist mit der Maus nicht erreichbar. Sie trägt kein Rätsel (der Schattenfehler ist nur Hinweis), aber `W3-R06-06` / W3-6 ist damit weiterhin offen.
- **Ausgang zur Kühlung** (Basis): 14 von 36, der Lüftungsschacht gewinnt an den übrigen 22. W3-R03-04 weiterhin offen; als Pixel kommt man trotzdem hinein (`klick @ausgang_kuehlung` trifft).
- **Schwarze Katze** (Stadtstraße): 1 von 36 im Augenblick der Probe, weil sie läuft; kein Fund.
- **Ausgang Kammer 3** (Kammer 2): 14 von 36, der Laser liegt davor (R5-W3-08).
- **M.U.T.T.I.** 25 von 36, **Portalgerät in der Halterung** 36 von 36 (W3-R09-01 behoben; sichtbar ist es trotzdem nicht, R5-W3-20), **Telefonzelle** 32 von 36, **Radiowecker** ohne Befund.
- Nicht abgetastet: die linke Hälfte der Unterstadt (Nudelbude, Herr Vier, weinender Mann, Morphäus); das Skript läuft nur nach rechts. Diese Objekte sind im geraden Durchlauf und in der Sackgassen-Suche einzeln angeklickt worden.

## Nahansichten auf Deutsch und Englisch

Welt 3 hat fünf Nahansichten. Jede auf Deutsch und Englisch geöffnet und mit `foto NAME voll` aufgenommen; Sprache über Pause → Optionen → Spiel → Sprache umgestellt (echte Klicks). Beleg: `belege/pr-w3/nahansichten_de_en_kochbuch_akte_kritzelei_seite_morse.png` (links DE, rechts EN).

| Nahansicht | Aufruf | Deutsch | Englisch | Befund |
| --- | --- | --- | --- | --- |
| Kochbuch (Regel 2) | Küche, `rklick @kochbuch` | „Regel 2 · Nach jedem Rührgang gibt es Kuchen.“ und Warnzettel | „Rule 2 · After every mixing cycle there is cake.“ | sauber, gut lesbar, beides übersetzt; der Zettel ist zur Hälfte leer, stört nicht |
| Schmidts Akte (Regel 1) | `rklick inv:schmidts_akte` | „Regel 1 · Testpersonen sind zu beschützen. Vor allem. Vor allen. Vor sich selbst.“, Bericht, Stempel „M.U.T.T.I. Fürsorge + Verfolgung“ | „Rule 1 …“, Stempel „M.O.T.H.E.R. Care + Pursuit“ | sauber; Text liegt schräg in der Perspektive und bleibt lesbar; auch der Stempel ist übersetzt |
| Kritzelei Kammer 2 (Regel 3) | `rklick @kritzelei` | „DER KUCHEN EXISTIERT NICHT.“, daneben klein Regel 3 | „THE CAKE DOES NOT EXIST.“, „Rule 3 … Signed, M.O.T.H.E.R.“ | sauber |
| Telefonbuchseite | `rklick inv:telefonbuchseite` oder Telefonbuch ansehen | „Konner, Sahra“ zwölfmal, rot „… 47×“ | gleich (Namen) | sauber, stimmungsvoll |
| Morse-Tabelle | `rklick inv:morse_tabelle` | „Miau · heißt“, Pfoten kurz/lang, E T I N A S, „Thunfisch“, „Schnurren heißt OK“ | „Meow · means“, „Tuna“, „Purring means OK“ | **W3-N-01 behoben** (öffnet als Nahansicht); die Fußzeile „Schnurren heißt OK“ ist sehr klein und punktiert unterlegt, gerade noch lesbar |

Dazu auf Englisch gesehen: die Wörter der Code-Sicht in Kammer 2 („deadly“, „red“, „harmless“, „yellow“, „solid“, „true“; `belege/pr-w3/en_codesicht_kammer2_woerter_uebersetzt.png`), die Inventarnamen („Phone book page“, „Granny's biscuits“, „Access card“, „Rubber chicken“ …) und rund zehn gesprochene Zeilen. Kein roher Schlüssel, kein deutscher Rest in dieser Stichprobe. Nicht auf Englisch gespielt: Gespräche, Menüs der Rätsel, Pfote. In allen Nahansichten liegt der Zeiger als Hand mit Auge mitten im Bild (kein Fund).

## Sackgassen-Suche

Jede Zeile im laufenden Spiel mit echten Klicks, von Kontrollpunkten aus (ältere Stände nur im frischen Prozess, wegen R5-P-01).

| Probe | Befehle (Kern) | Ergebnis |
| --- | --- | --- |
| **Turm vor dem ersten Aufwachen, ohne Tasse** | Stand `w3_10_nach_R5`, `klick @ausgang_buero_50`, `klick @schmidt` → Code-Sicht zeigt nur „Original“, „Hausschuhe“, „Kopie“, „gleich“; `knopf Original` + `knopf Kopie` (Fehltausch: `W3_TURM_MAX_0490`, `KLO_0500`), `knopf Original` + `knopf gleich` (`W3_TURM_MAX_0520`) | Kein Festsitzen. Nach zwei Fehltauschen sagt Max, wie es weitergeht: „Keine Tausche mehr. Und raus komm ich hier nicht. Aber wenn ich kurz zu Pixel wechsle und zurück, ist alles zurückgesetzt.“ (`W3_TURM_MAX_0530`). `portraet pixel`, `portraet max` → `W3_FEHLTAUSCHE = []`, Schmidt: „Sie wieder, wir wieder, alles wieder“ (`W3_TURM_SCH_0540`), Code-Sicht geht wieder auf. **W3-R08-01 ist behoben.** |
| **Ganzer Turm vor dem ersten Aufwachen** (R6a, R6b, R13, R7a, R7b in dieser Reihenfolge, Max war noch nie in der Basis) | wie oben, dann Tasse, `knopf Original`, `klick 336 130`, zweimal `klick inv:kaffeetasse`, Farbcode, Terminal; `portraet pixel`, `klick @kalles_tasse`; `portraet max`, Farbcode-Zettel auf Terminal; `portraet pixel`, `klick @patch_panel`, `option 1`, `2`, `3` | **Trägt.** Kalle meldet sich am Terminal („hier kalle. du steckst fest, oder …“), R13 und R7 gehen, und nach R7b wacht Max in der Basis auf und die Szene „erstes Aufwachen“ (Hundekuchen, Pixel auf die Leitung) wird nachgeholt (`W3_ERSTES_AUFWACHEN` bei 358.5). Stand danach: `w3_alt_turm_zuerst_nach_R7b`. Schwächen dabei: R5-W3-10 (Pfote), R5-W3-13 (Max spricht in R13 mit). |
| Terminal im Turm ohne Morse-Tabelle | Farbcode-Zettel auf das Terminal vor R13 | Klare Absage mit Richtung: „ich hab meine tabelle verloren. ohne tabelle ist das nur miau. kannst du ihm sagen, er soll sie suchen.“ (`W3_TERM_KAL_0100`), Zettel bleibt im Inventar. |
| „Ins Labor“ ohne offene Panzertür | Stand `w3_alt_turm_zuerst_nach_R7b`, `klick @terminal`, `option 2` | „Keine Leitung ins Labor. Noch nicht. Die Panzertür muss erst auf.“ (`W3_BAS_MAX_0570`). Kein Wechsel, kein Festsitzen. |
| „Zurück in die Stadt“, ohne je von einem Wecker geweckt worden zu sein | derselbe Stand, `option 1` | Max kommt am Radiowecker in der Stadtstraße an (Foto `083` im Lauf). |
| Kapsel schütteln | Max in der Stadt, `portraet pixel`, `klick @max_kapsel` | Pixel schüttelt (`W3_BAS_PIX_0540`), Max wacht in der Basis auf, Figur wechselt zu Max. Im Turm verweigert: „Er liegt zu tief im Turm …“ (`W3_BAS_PIX_0545`; **W3-R08-02 behoben**). |
| Pixels Eingriffe von der Basis aus | `klick @fenster` (zweimal), `klick @stromkasten` (Max wach und Max drüben), Kühlung: `klick @wassereimer` | Fenster: `W3_SCHNEE` an und wieder aus, Basis mit Schnee auf der Kapsel (Foto `079`). Strom, Max drüben: `W3_NACHT`, Stadtstraße bei Nacht (Fotos `084`, `085`; Max, Schmidt, Auto und Vögel in Tagesfarben = W3-7, weiterhin offen). Eimer: Kühlung taut (R5-W3-12). Nichts davon sperrt etwas. |
| 200 Sekunden nichts tun (Basis, Tempo 1, `textmodus lesen`) | `warte 50` viermal, je ein Foto, dann `klick 600 316` | Alle 45 s ein Zuruf; die erste Hälfte bleibt stehen, bis geklickt wird (auch im Lese-Modus; `LAGE text`). Der erste Klick danach löst vier zweite Hälften im selben Augenblick aus (`W3_BAS_PIX_1330_2`, `1330_2`, `1310_2`, `1330_2` bei 1074.9) und wird selbst geschluckt, Max bleibt stehen. Das ist R5-P-08, mit Stau. Fotos `074`–`077` im Lauf. |
| Mensch-Test ohne Beobachtungen | Stand `w3_00_anfang`, `klick @deckert`, `option 0090` | Nur zwei Antworten („Ich dreh sie um.“, „Ich frag sie nach dem WLAN-Passwort.“), beide fallen durch, mit eigener Pointe. Der Test lässt sich beliebig oft neu beginnen (0090 bleibt, **W3-R01-01 behoben**). Beim dritten Ansprechen sagt Deckert von selbst: „Sieh dich um, Junge. Die Straße ist voller Antworten.“ (`W3_TEST_DEC_0390`). |
| Ausgänge am Weltanfang | `klick @ausgang_apothekengasse`, `@ausgang_widerstandsbasis`, `@ausgang_laboreingang` | Gasse: Deckert hält auf (`W3_STR_DEC_0290`). Basis: Ersatzzeile (R5-W3-16). Laboreingang ist von Anfang an offen; Hausmeister, Kartenleser („Ich halt meine Hand mit dem Stempel dran …“), Panzertür und Gang haben eigene Zeilen (**W3-R05-03 behoben**), die Pfote nennt dort R8. |
| Kammer 1: Fehltausche | Stand `w3_26_kammer1_anfang`, „schwer“ ↔ „Pappe“, „treu“ ↔ „müde“ | Nach zwei Fehltauschen: „Keine Tausche mehr. Du darfst gehen und wiederkommen …“ und Pixel: „Gehen? Durch welche Tür denn? Wechsel kurz zu mir und zurück …“ (`W3_KAM1_MUT_0570`, `PIX_0575`). `portraet pixel`, `portraet max` setzt zurück (`W3_KAM1_MUT_0560`). Kein Festsitzen. |
| Kammer 2: Fehltausche, Laser ungelöst | Stand `w3_28_kammer2_anfang`, „tödlich“ ↔ „wahr“, „rot“ ↔ „fest“; Ausgang zu Kammer 3 | Beide Tausche: „… keins der beiden Wörter passt an sein neues Ding. Der Versuch ist trotzdem weg.“ (`W3_TUER_MAX_0390`). Danach „Keine Tausche mehr. Du darfst gehen und wiederkommen.“; raus in Kammer 1 und zurück setzt zurück (`W3_KAM2_MUT_0220`). Der Ausgang durch den tödlichen Laser gibt eine Ersatzzeile (R5-W3-16). |
| Kammer 3: Fehltausch, andere Reihenfolge | Stand `w3_30_kammer3_anfang` | Lösbar in beiden Reihenfolgen; Zurücksetzen über Raus-und-Rein (`W3_KAM3_MUT_0260`). Texte dabei falsch: R5-W3-15. Der dritte Tausch mit Hermes' Sandale funktioniert (siehe „Lauf vom Stand `welt2_ende`“). |
| Kern: Regeln in falscher Reihenfolge | Stand `w3_32_kern_anfang`, `option 2`, `option 3`, Nebenfragen, `option 1`, `option 3`, `option 2`, `option 3` | Jede falsche Regel bekommt eine eigene Abfuhr („Meintest du: Gehorsam?“), die Kette beginnt erst mit Regel 1 und läuft dann 1, 2, 3. Nichts geht verloren. |
| Kern: Fehltausch an der Zelle, dann Lösung B | nach R10: `klick @energiezelle`, `knopf heiß`, `knopf müde` | „Heiß auf mich? … Das ist ein Tausch für Leute ohne Plan B.“, dann „Kein Tausch mehr übrig, und die Zelle glüht. Also brauch ich Wetter. Pixel. Fenster. Jetzt.“ (`W3_KERN_MAX_0470`). `portraet pixel`, `klick @fenster`, `portraet max` → Schnee im Kern, `W3_ZELLE_KALT`, `W3_ZELLE_SCHNEE` (`W3_KERN_NAR_0480`). **Lösung B trägt** (W3-R03-06 behoben). Stand: `w3_alt_kern_loesung_b_zelle_kalt`. |
| F5 und Esc in der Code-Sicht | Kammer 2, Code-Sicht offen: `taste f5`, `taste esc` | F5 speichert (Platz 13), Esc schließt die Code-Sicht; ohne Code-Sicht öffnet Esc das Pausemenü. Laden bei offener Code-Sicht lässt das Spiel nicht zu. |

## Hilfe-Pfote an jedem Schritt

Eigener Lauf `pr-w3-pfote` (Tempo 4, ein Prozess, Kontrollpunkte in aufsteigender Reihenfolge): je Kontrollpunkt `pfote`, `warte 31`, `pfote`, `warte 61`, `pfote` als Max, dann dasselbe als Pixel. Alle 34 Stände von `w3_00_anfang` bis `w3_33_nach_R10`. Ausgabe: `/home/user/lauf/pr-w3-pfote/ausgabe.txt` (nicht im Repo).

| Schritt | Stufe 1 | Stufe 2 | Stufe 3 | Bemerkung |
| --- | --- | --- | --- | --- |
| R1a | `0110` | `0120` | `0130` | passt |
| R1b | `0140` | `0150` | `0160` | Stufe 3 nennt die drei Antworten |
| R2 | (nicht einzeln abgefragt) | | | R1a/R1b hatten in den Ständen Vorrang |
| R3a | `0310` | `0320` | `0330` | „Benutz mich hier in der Gasse“ passt zum Klick auf Pixel |
| R3b | `0340` | `0350` | `0360` | sagt nicht, **wie** man schluckt (GD-W3-04) |
| R4 | `0410` | `0420` | (im Lauf nicht erreicht, Pixel bekam R13) | |
| R5 | `0510` | `0520` | (ebenso) | |
| R13 | `1410` | `1420` | `1430` | nennt Kalle und die Tabelle auch vor dem ersten Aufwachen (R5-W3-10, R5-W3-19) |
| R12 | `1310` | `1320` | `1330` | Wartezeile `9995` („Ich rechne noch. Bitte warten.“) kommt, wenn man zu früh klickt |
| R8 | `0810` | `0820` | `0830` | Stufe 3 erwähnt das Öl |
| R9a | `0910` | `0920` | `0930` | Stufe 2 erklärt, wie man an die Karte kommt, auch wenn man sie schon hat (Stand `w3_16_nach_R8`) |
| R6a | `0610` | `0620` | `0630` | passt |
| R6b | `0640` | `0650` | `0660` | passt |
| R7a | `0710` | `0720` | `0730` | Stufe 3: „Die Streifen ansehen“, der Hotspot heißt „Farbcode an der Wand“ |
| R7b | `0740` | `0750` | `0760` | passt (das Menü macht den Hinweis überflüssig, R5-W3-04) |
| R9b | `0940` | `0950` | `0960` | Stufe 3: „… dann auf den Schalter stellen“; die Kammer löst sich schon beim Tausch (R5-W3-07) |
| R9c | `0970` | `0980` | `0990` | passt |
| R9d | `1000` | `1010` | `1020` | passt |
| R10 | `1110` | `1120` | `1130` | passt |
| R11 | `1210` | `1220` | `1230` | beide Lösungen genannt; nach kalter Zelle unverändert (R5-W3-18) |

- **Alle abgefragten Schritte haben drei verschiedene Stufen**, die Wartezeiten (30 s, 60 s) greifen, eine vierte Anfrage wiederholt Stufe 3. Die IDs oben sind `W3_HINT_PIX_<Nummer>`.
- **„Nichts offen“ ist ortsbezogen (W3-05 behoben):** nach R1b „Der Mann mit dem Hut hat die Gasse freigegeben …“ (`0020`), nach R12 und nach R9a „Die Tür am Glaseingang redet jetzt mit jedem …“ (`0030`), nach R7b „Kalles Leitung liegt. Das Labor ist jetzt nur noch ein Nickerchen entfernt.“ (`0060`). Lücke: zwischen den Kammern nur `0010` (R5-W3-18).
- **Der dritte Pfoten-Klick als Max wurde in fast jedem Stand von einem Zuruf geschluckt** (R5-P-08): Der Zuruf kommt 45 s nach der letzten Eingabe, also genau in die 60 s Wartezeit bis Stufe 3; der Klick auf die Pfote klickt dann nur die erste Zuruf-Hälfte weiter. Wer auf Stufe 3 wartet, muss zweimal klicken. In den Kammern 2 und 3 und im Kern gab es im Lauf keinen Zuruf, dort kam Stufe 3 beim ersten Klick.
- Nach dem Laden bleiben die erreichten Stufen erhalten (Stand `w3_13_nach_R13`: R12 stand schon auf Stufe 1, die Pfote ging mit Stufe 2 weiter).

## Zwischenspiel 3 im Spielfluss

Zweimal gespielt: im geraden Durchlauf (Stände `w3_34_zs3_dachboden_frei`, `w3_35_zs3_gepackt`) und nach dem Nebenweg mit Lösung B (Stände `w3_alt_zs3_dachboden_frei_echtes_inventar`, `w3_alt_zs3_gepackt_tasse_akte`, `w3_alt_welt4_anfang_tasse_akte`). Beide Male begann die Welt mit `start welt-3`; das Pflichtfach und die Werkbank entsprechen deshalb nicht einem echten Spielstand aus Welt 1 und 2.

- **Übergang:** Nach R11 wechselt das Spiel von selbst in die Basis, spielt das Welt-Ende (Kalle, Rebellen, Pixel), wechselt auf die Unterstadt-Straße (Telefonzelle klingelt, Deckert) und dann auf den Dachboden. Der Spieler hat dazwischen nichts zu tun. In Tempo 1 mit `textmodus lesen`: vom Klick auf die Zelle bis zum Verlassen der Unterstadt 166 s (davon Welt-Ende ab der Basis rund 100 s).
- **Ankunft auf dem Dachboden:** Opa nimmt die Zelle, sie schrumpft, Kiste mit Fernbedienungen, Pixel legt sie auf die Werkbank, „Kuchen123“, Einkaufsliste Eintrag 3. Mit Lösung B sagt Max „Sie war eiskalt. Im Fernseher ist sie wieder warm geworden.“ (`ZS3_DACH_MAX_0050`; W3-N-05 ist damit im Text behoben). Auf der Werkbank erscheint die Zelle nicht (R5-P-24).
- **Frei auf dem Dachboden:** Opa ansprechen (Fragen `zs3_0450`, `zs3_0460`), Hotspots mit den Prolog-Zeilen (`P0_DACH_…`), Drehknopf öffnet die Reisetasche („Letztes Packen. Zwei Fächer.“, `ZS3_DACH_OPA_0510`).
- **Reisetasche:** Im Pflichtfach Notizbuch, Thunfischdose, Kochlöffel; zwei Wahlfächer; daneben lag, was Max aus Welt 3 mitbrachte (Kekse, Morse-Tabelle, Tasse, Sonnenbrille, Akte, Portalgerät) und der Dosenöffner. Pixel kommentiert Brille, Kekse, Akte und Tasse (`ZS3_DACH_PIX_0520`–`0570`); ein drittes Teil lehnt Max ab (`ZS3_DACH_MAX_0600`). Nach „Fertig gepackt“ bleiben genau das Pflichtfach und die zwei gewählten Teile im Inventar, alles andere bleibt zurück. Nach einem Klick verschieben sich die Kacheln nach links.
- **Platzhalter:** Notizbuch, Thunfischdose, Kochlöffel und Dosenöffner erscheinen als grüne Kacheln mit „Not“, „Thu“, „Koc“, „Dos“ (`belege/pr-w3/zs3_tasche_schnellstart_pflichtfach_platzhalter.png`). Ob das am Schnellstart liegt oder auch im echten Durchlauf so ist, war ohne Welt-2-Endstand nicht zu klären (siehe „Nicht geprüft“).
- **Speichern und Laden:** F5 bei offener Tasche speichert nicht (kein kaputter Stand möglich). Nach dem Packen: `taste f5`, drei Hotspots ansehen, `taste f9` → derselbe Stand, Inventar unverändert (Tasse, Akte, Notizbuch, Thunfischdose, Kochlöffel).
- **Esc:** Während der Abreise (`ZS3_DACH_MAX_0660` „Kanal 999.“) zweimal `taste esc`: keine Wirkung, die Zeile bleibt stehen, kein Überspringen, kein Pausemenü.
- **Abreise:** zweiter Klick auf den Drehknopf, Ankunft in Welt 4 (`testbild`), Flimmer erklärt R1. Erster freier Moment in Welt 4 erreicht; Autospeicher greift.
- **Figuren:** Opa steht laut `status` bei (520, 332), seine Klickfläche meldet `objekte` bei x 436–483; `klick @opa` verfehlt ihn (Ohrensessel und Staubsauger gewinnen), `klick 520 240` trifft. Max stellt sich beim Ansprechen in ihn (466, 332; R5-P-12).

## Lauf vom Stand `welt2_ende` (echtes Inventar aus Welt 2)

Ausgang: `kontrollpunkte/welt-2/welt2_ende.json` (Thunfischdose, Notizbuch, Kochlöffel, Olivenöl, geflügelte Sandale; laut `pr-w2` kein voller Endstand). Lauf `pr-w3-echt`, Tempo 4, echte Klicks. Stände `w3e_*` und der neue `welt3_ende` unter `kontrollpunkte/welt-3/` (siehe `liste.md`).

| Stück | Ergebnis |
| --- | --- |
| Blöcke 1 bis 4 des Lösungswegs (R1a, R2, R1b, Seite, Morphäus, R3a, R3b) | laufen ohne Änderung durch |
| Block 5 (Küche) | Der Lösungsweg lief hier aus dem Tritt (der Ausgang zur Küche lag nach den zwei Laufklicks außerhalb des Bildes); in `loesungsweg.txt` berichtigt. R4, Kochbuch, R5 danach von Hand, ohne Befund. |
| Wecker | Bei Tempo 4 klingelt der Radiowecker erst nach 30 s Echtzeit, also 120 Spielsekunden; der Lösungsweg war schneller dort. Kein Spielfehler, in `loesungsweg.txt` vermerkt. |
| Zurufe | Zweimal schluckte ein Zuruf den nächsten Klick (Ausgang der Basis, Gegenstand in der Leiste am Laboreingang): R5-P-08. |
| Notizbuch | Ziele-Seite zeigt `UI_ZIEL_W3_R4`, `UI_ZIEL_W3_R5` (R5-W2-31, oben) |
| Mitgebrachte Gegenstände auf die Orakel-Oma | vier Ersatzzeilen, kein Hänger |
| **Olivenöl** | Seite auf den Hausmeister mit Öl in der Tasche: Pixel warnt einmal („Er quietscht noch. Und du hast Öl in der Tasche.“, `W3_EING_PIX_0185`), die Seite bleibt. Öl auf den Hausmeister: eigene Szene (`W3_EING_MAX_0240` bis `PIX_0270`), `W3_FREUND_0815 = true`. Das geht auch, bevor man je mit ihm gesprochen hat. **Das Öl bleibt danach im Inventar**; ein zweites Ölen gibt eine Ersatzzeile („Das überspring ich. So wie jedes Intro.“, `SYS_ERS_MAX_0180`) – kosmetisch, eine eigene Zeile („Er glänzt schon.“) wäre schöner. |
| R8 nach dem Ölen | Seite geht über, Hausmeister rollt ab, `W3_FREUND_0815` bleibt gesetzt. (Ein erster Versuch blieb ohne Reaktion; nicht wiederholbar, vermutlich ein geschluckter Klick nach einem Zuruf, kein Fund.) |
| R9a, Turm (R6a, R6b, Akte, R7a, R7b), Labor, Kammer 1 und 2 | wie im Lösungsweg, ohne Befund |
| **Sandale in Kammer 3** | Beim Betreten: „Die Sandale an meinem Fuß zuckt. Ein dritter Tausch. Danke, Hermes …“ (`W3_KAM3_MAX_0270`, `PIX_0280`). Drei Tausche gespielt: Fehltausch „gesprächig“ ↔ „leicht“ („Das Huhn redet … Der Lautsprecher ist leicht und schwebt an der Decke“), dann „verschlossen“ ↔ „gesprächig“, dann „schwer“ ↔ „leicht“ → `W3_KAMMER_3_GELOEST`. **Der dritte Tausch funktioniert.** Nebenbefund zu R5-W3-15: Nach dem Fehltausch stehen in der Code-Sicht alle vier Wörter wieder an ihrem alten Platz, und der Erzähler sagt beim nächsten Tausch „Der Lautsprecher knackt und schweigt“, obwohl er eben noch „an der Decke schwebte“. Der Fehltausch kostet also nur den Versuch, der Text behauptet mehr. |
| Regel 3, Kern, R10, R11, Welt-Ende | ohne Befund; im Welt-Ende meldet sich der geölte Hausmeister („Wenn du mich brauchst: Ich komme …“, `W3_ENDE_HAU_0070`) |
| **Reisetasche im Zwischenspiel 3** | Pflichtfach mit Bildern (Notizbuch, Dose, Kochlöffel). **Zehn der zwanzig Kacheln unter „Daneben liegt“ sind grüne Platzhalter mit drei Buchstaben** („Opa“, „Eim“, „Zie“, „Mod“, „Sor“, „Dos“, „Han“, „Sch“, „Sch“, „Wur“ – die Fundkiste aus Welt 1 und 2), `belege/pr-w3/zs3_tasche_echter_stand_zehn_platzhalter_kacheln.png`. Gehört zum weltübergreifenden Fund der Reisetasche (für `pr-p`); wichtig, weil der Spieler hier wählen soll und zwei Kacheln gleich heißen. Gepackt: Sonnenbrille, Omas Kekse. |
| Abreise, Welt 4 | erster freier Moment im Raum `testbild`, Inventar: Thunfischdose, Notizbuch, Kochlöffel, Omas Kekse, Sonnenbrille. Stand: `welt3_ende` |

## Weltübergreifende Funde, in Welt 3 bestätigt / nicht bestätigt

Nicht neu gemeldet, nur in Welt 3 gegengeprüft. Alles im laufenden Spiel, Lauf `pr-w3-haupt`.

| Fund | In Welt 3 | Woran gesehen (Befehle, Beleg) |
| --- | --- | --- |
| **R5-W1-34** (kritisch; nach Programmneustart und Laden haben schon geführte Gespräche keine Optionen, Spiel hängt) | **bestätigt, zweimal, mit Folge für Welt 3: R1b wird unlösbar.** | (1) Frischer Prozess, Tempo 1, `stand holen w3_03_nach_R1b`, `klick @deckert` → kein Menü, `lies D.current_dialog.options.size()` = 0, `STEHT … G.blocked=true dialog=Deckert`, Esc ohne Wirkung (`belege/pr-w3/R5-W1-34_deckert_haengt_nach_neustart_und_laden.png`). (2) **Über das echte Lade-Menü:** Stand `w3_02_nach_R2`, zu Deckert, `klick @deckert`, `option 0420` („Ich schau mich erst mal um.“), `taste f5`, Programm beendet und neu gestartet, `knopf "3   Laden"`, `klick 119 285` (Schnellspeicher), `klick @deckert` → dasselbe: `STEHT …`, `Offene Rätselschritte: R1b` (`belege/pr-w3/R5-W1-34_deckert_haengt_nach_f5_neustart_lademenue_R1b_offen.png`). Wer Deckert einmal anspricht, ohne den Test zu machen, das Spiel beendet und später weiterspielt, kann den Mensch-Test nie mehr beginnen; ohne Stempel gibt es keine Pastillen. Dasselbe ist für Herrn Vier (R2), Morphäus (Symptom, R3a) und die Orakel-Oma (R4) zu erwarten (gleiche Gesprächsart; nicht einzeln nachgestellt). |
| **R5-P-01 / GD-W2-03** (kritisch; älteren Stand in derselben Sitzung laden: seither aufgehobene Gegenstände fehlen) | **bestätigt an zwei Stellen, beide Male unlösbar.** | Ein Prozess, nacheinander `stand holen w3_31_nach_R9d` (später Stand), dann `stand holen w3_28_kammer2_anfang`: Gummihuhn `(unsichtbar)` und nicht im Inventar; die Code-Sicht am Laser zeigt nur „tödlich“, „rot“, „fest“, „wahr“, das Wort „harmlos“ fehlt, R9c ist nicht lösbar (`belege/pr-w3/R5-P-01_kammer2_ruecksprung_sockel_leer_huhn_fehlt.png`, `R5-P-01_kammer2_codesicht_ohne_harmlos.png`). Danach `stand holen w3_20_turm_anfang`: Kaffeetasse `(unsichtbar)`, nicht im Inventar (`belege/pr-w3/R5-P-01_turm_ruecksprung_tasse_fehlt.png`). Ohne Tasse ist R6a nicht lösbar, und der Turm hat keinen Ausweg: Ausgang gesperrt, Pixel an der Kapsel: „Er liegt zu tief im Turm …“ (`W3_BAS_PIX_0545`). In Welt 3 ist der Fehler damit schärfer als in Welt 1: Der Spieler sitzt fest und kann nicht einmal woanders weiterspielen. |
| **R5-P-19** (wichtig; nach Neustart und Laden liegen verbrauchte Gegenstände wieder im Raum) | **bestätigt an zwei Stellen.** | Frischer Prozess, `stand holen w3_18_nach_R9a` (Seite ist beim Hausmeister): In der Telefonzelle liegt die Telefonbuchseite wieder, `klick @telefonbuchseite` → `INVENTAR + telefonbuchseite` (`belege/pr-w3/R5-P-19_telefonbuchseite_nach_neustart_laden_wieder_da.png`). `stand holen w3_31_nach_R9d` (Huhn liegt in Kammer 3 am Boden): In Kammer 2 sitzt das Gummihuhn wieder auf dem Sockel, `klick @gummihuhn` → `INVENTAR + gummihuhn`. Folgen in Welt 3 gering (die Seite hat keinen Abnehmer mehr), aber sichtbar. |
| **R5-P-09** (wichtig unter Vorbehalt; erstes Menü einer Sitzung bei Tempo 4 über dem Bildrand) | bestätigt (Tempo 4), auch für Auswahlmenüs | Frischer Prozess, `stand holen w4_nach_R2`, Fernbedienung: Senderliste liegt bei y −21 (`OPTION [3] „Kapitolis“ angeklickt bei (316,-21)`), nichts zu sehen, kein Ausweg (`belege/pr-w3/R5-P-09_erstes_menue_tempo4_ueber_dem_bildrand.png`). In Tempo 1 nie gesehen (fünf Sitzungsanfänge). |
| **R5-P-08 / GD-W1-04** (Zuruf schluckt den nächsten Klick) | bestätigt, dreimal im geraden Durchlauf | Klick auf den klingelnden Wecker (Verlauf 998.7), Klick auf den Ausgang am Laboreingang (1894.1), Bodenklick in der Stadtstraße (erster Versuch bei R5-W3-01 vermutlich ebenso). |
| **R5-P-13 / GD-W1-01** (letzte Menüzeile abgeschnitten) | bestätigt | = GD-W3-01 |
| **R5-P-12 / R5-W1-04** (Max stellt sich in Figuren) | bestätigt | Zwischenspiel 3: Max (466, 332), Opa (520, 332); weitere Stellen folgen in der Raumprüfung (W3-14 weiterhin offen) |
| **R5-P-24** (Werkbank und Kalender im Zwischenspiel unverändert) | bestätigt im Spielfluss für die Zelle | Nach `ZS3_DACH_NAR_0130_2` („Er legt sie auf die Werkbank, genau neben Ei und Mehl.“) liegt auf der Werkbank nichts Neues (`belege/pr-w3/zs3_dachboden_ankunft_werkbank_ohne_zelle.png`; Ei und Mehl fehlen in diesem Lauf ohnehin, weil er mit `start welt-3` begann) |
| **R5-P-25** (Figuren ohne Lichtstimmung im Zwischenspiel) | bestätigt | dasselbe Bild: Opas Hose und Pixel in Tagesfarben im Abendrot |
| **R5-W1-33** (Sanduhr-Zeiger im Pack-Fenster) | bestätigt | Zwischenspiel 3, Reisetasche |
| **R5-P-04** (Lade-Seite: letzte Zeile abgeschnitten) | bestätigt | „Autospeicher 3“ läuft unten aus dem Bild (Foto `064_laden_menue` im Lauf) |
| **R5-W2-31** (wichtig; Ziele-Seite des Notizbuchs zeigt Textschlüssel) | **bestätigt für Welt 3** | Lauf `pr-w3-echt` vom Stand `welt2_ende` (mit Notizbuch): in der Küche `klick inv:notizbuch` → unter „Ziele“ stehen `UI_ZIEL_W3_R4` und `UI_ZIEL_W3_R5` (`belege/pr-w3/R5-W2-31_notizbuch_welt3_ziele_als_schluessel.png`). In `game/lokalisierung/texte.csv` gibt es 21 Schlüssel `UI_ZIEL_W1_…` und keinen für Welt 2, 3 oder 4 (gezählt, aus der Datei). Mit `start welt-3` fällt das nicht auf, weil dort das Notizbuch fehlt. |
| **R5-P-05** (Ansehen des Notizbuchs gibt eine Ersatzzeile) | bestätigt | derselbe Lauf: `rklick inv:notizbuch` → „Das wäre ein Cliffhanger, und zwar einer ohne Fortsetzung.“ (`SYS_ERS_MAX_0120`) |
| **R5-P-09**, zweite Stelle | bestätigt für Auswahlmenüs in Welt 3 | Frischer Prozess, Tempo 4, Stand `w3_24_nach_R7a`, als Pixel `klick @patch_panel`: Optionen liegen bei y −55, nichts zu sehen, kein Ausweg (`belege/pr-w3/R5-P-09_patchpanel_menue_tempo4_unsichtbar.png`). In Tempo 1 geöffnet stimmt die Lage. |
| **R5-P-08**, mit Stau | bestätigt | 200 s Nichtstun in der Basis: vier Zurufe stauen sich, der erste Klick löst vier zweite Hälften aus und wird geschluckt (siehe Sackgassen-Suche). Der Zuruf fällt außerdem genau in die Wartezeit der dritten Pfoten-Stufe. |
| **R5-P-12**, weitere Stellen | bestätigt | Nach dem Aufwachen Max (326) und Pixel (322) ineinander (`belege/pr-w3/bas_zuruf_bleibt_stehen_max_steht_in_pixel.png`); Unterstadt: Pixel steht in der Frau mit Schirm (894/880); Kammer 3, Code-Sicht: Max steht in Bernd (`belege/pr-w3/kam3_codesicht_max_steht_in_bernd.png`); R13: Max in Kalle (R5-W3-24). W3-14 bleibt offen. |
| **Esc in Szenen** (kein Überspringen) | bestätigt | In den geprüften Szenen (Welt-Ende, Ankunft im Zwischenspiel 3; siehe dort) `taste esc` ohne Wirkung, solange Text steht; es gibt kein Überspringen ganzer Szenen. |
| **Zeigertext während Szenen** | bestätigt | Während laufender Szenen steht das Hover-Etikett weiter im Bild („Widerstandsbasis“, „Blaue Pastille“, „Himmel“, „Tisch mit Kalles Tasse“; in den Filmen `03`, `04`, `06` zu sehen). |
| **GD-P-02 / R5-W1-35** (wichtig; „Use … with UI_OBJ_…“ unter dem Zeiger) | **bestätigt, zweimal** | Mit einem Gegenstand in der Hand steht im deutschen Spiel „Use Omas Rezeptkarte with UI_OBJ_HERR_VIER“ (R12) und „Use Zugangskarte with UI_OBJ_KARTENLESER“ (Laboreingang), und der Satz bleibt während der Szene stehen (R5-P-29). `belege/pr-w3/GD-P-02_r12_use_omas_rezeptkarte_with_UI_OBJ_HERR_VIER.png` (Film `07_r12_suppe`, Bild 264; Film `09_r9a`, Bild 16). |
| **R5-P-01**, zweite Seite desselben Fehlers | bestätigt | Beim Laden eines älteren Stands in derselben Sitzung wird das Inventar nicht geleert: Nach `stand holen w3_33_nach_R10`, `w3_29_nach_R9c` und anderen, dann `stand holen w3_09_nach_R4` (Küche, eigentlich nur Seite, Kekse, Rezeptkarte) zeigt `inv` zusätzlich Morse-Tabelle, Zugangskarte, Kaffeetasse, Sonnenbrille, Akte, Portalgerät, Gummihuhn und Farbcode-Zettel (Lauf `pr-w3-echt`, Befehl `inv` im Verlauf). Wer im Spiel einen älteren Stand lädt, hat also Gegenstände aus der Zukunft (Zugangskarte vor R12) und findet die zugehörigen Props nicht mehr. Für `pr-p`. |
| **Figuren außerhalb des Raums nach Abgängen** (Muster R5-W2-24/-28, Rotkäppchen) | **nicht bestätigt in Welt 3** | `status` in 14 Ständen nach jeder Szene mit Abgang (Morphäus nach der Pastille, Hausmeister nach R8, Klone nach R6b, Bernd nach R9b und R9d, M.U.T.T.I. nach R10): Alle Figuren im Raum stehen innerhalb der Raumbreite; wer abgeht, ist aus der Figurenliste verschwunden und wird nicht mehr gebraucht. Einzige Randlage: Piepsi bei x 1245 in der 1280 px breiten Basis (R5-W3-24). Lauf `pr-w3-echt`, `sweep.log`. |
| **Cross-Welt-Gegenstände** (Ersatzzeilen) | bestätigt, kein eigener Fund | Thunfischdose, Kochlöffel, Olivenöl und Sandale auf die Orakel-Oma: vier Ersatzzeilen (`SYS_ERS_MAX_0170`, `0250`, `0020`, `0140`). Erwartbar; schön wäre je eine Zeile für die Dose („Thunfisch hab ich selbst, Jungchen“) – Texte-Runde. |

## Stichprobe Welt 4: R5-W4-11 (Gespräche ohne Ausstieg) mit echten Klicks

Auftrag: den aus Code und Daten geschlossenen Fund R5-W4-11 (`notizen/w4.md`) im laufenden Spiel nachstellen, sonst nichts von Welt 4. Dauer rund 12 Minuten. Ausgang: `welt3_ende` (Raum `testbild`).

**Ergebnis: bestätigt, bei beiden Figuren.** Wer den Sitcom-Vater oder Wonder-Wilma anspricht, kommt aus dem Gespräch nicht mehr heraus; das Spiel lässt sich nur noch beenden.

| Figur | Befehlsfolge | Was geschieht |
| --- | --- | --- |
| Weg dorthin | `portraet pixel`, `klick @balken`, `option 1` („Von hell nach dunkel sortieren“) → Glücksrad; Quiz `option 1`, `option 2`, `option 3` (A, B, C) → Fernbedienung; `klick inv:billig_fernbedienung` zweimal, Sender wählen (Stand `w4_nach_R2`) | R1 und R2 von Welt 4 gehen mit echten Klicks |
| Sitcom-Vater | `klick @sitcom_vater` → 2 Optionen (0390 „Was ist in der Dose?“, 0410 „Erwarten Sie Besuch?“); `option 0390`, `option 0410` → Menü zeigt nur noch 0410 (schon gewählt); `option 0410` → dieselben vier Zeilen (`W4_SIT_MAX_0410`, `VAT_0420`, `MAX_0720`, `VAT_0730`), Menü wieder mit 0410 | Kein Ausstieg: `taste esc`, `rklick 500 300`, `klick 500 200`, `taste f5`, `taste f9` ohne Wirkung (`LAGE menue … 1 Optionen` bleibt). `taste tab` wechselt bei offenem Menü zu Pixel, das Menü bleibt; die Pfote antwortet (`W4_HINT_PIX_0070`), das Menü bleibt. Speichern geht nicht mehr, also ist alles seit dem letzten Autospeicher verloren. |
| Wonder-Wilma | Neustart, `stand holen w4_nach_R2`, nach Kapitolis umschalten, `klick @wonder_wilma` → 3 Optionen (0380, 0440, 0460); alle drei gewählt → Menü zeigt nur noch 0440 „Wie werde ich ein Held?“ (schon gewählt); erneut gewählt → Menü wieder da | wie beim Vater: `taste esc`, `rklick 300 200` ohne Wirkung |

Belege: `belege/pr-w3/w4_sitcom_vater_menue_nur_eine_option_kein_ausstieg.png`, `belege/pr-w3/w4_wilma_menue_nur_eine_option_kein_ausstieg.png`; Lauf `pr-w3-haupt`, Verlauf 4105–4190 (Vater), zweite Sitzung 90–160 (Wilma). Sohn, Fledermann und FBI-Agent wurden nicht angesprochen (Zeitgrenze).

Nebenbeobachtungen aus diesen 12 Minuten (für `w4`, nicht weiter untersucht):

- **Das erste Umschalten wechselt den Sender nicht.** Erster Gebrauch der Fernbedienung (Flimmer erklärt die Regel, `W4_RAU_FLI_0050`), Sender gewählt, Erzähler: „Rauschen wischt übers Bild. Der neue Sender steht.“ (`W4_FERN_NAR_0060`), Max steht weiter im Glücksrad-Studio. Erst der zweite Gebrauch bringt ihn in den beim ersten Mal gewählten Sender. Zweimal gesehen (Sitcom-Küche in der ersten Sitzung, Kapitolis nach Neustart und `stand holen w4_nach_R2`).
- Die Graubox-Räume von Welt 4 haben Hotspots als Raster oben im Bild (`objekte`: y 40–104 und 120–184), wie erwartet ohne Grafik.

## Animationen

Grundlage: 19 Bildfolgen im laufenden Spiel (`film an … 4`, Tempo 1, `textmodus lesen`, 4 Bilder je Sekunde, zusammen rund 7400 Bilder; Lauf `pr-w3-haupt`, `filme/01_ankunft` bis `19_r11_weltende`), als Kontaktbögen und Ausschnitte gesichtet, sechs davon als GIF unter `belege/pr-w3/anim_*.gif`. Mit 4 Bildern je Sekunde sieht man, **ob** etwas läuft und wann, aber nicht, wie flüssig; Fußrutschen und Mundbewegungen sind damit nicht beurteilbar (siehe „Nicht geprüft“).

**Bestand.** `game/skripte/gesten_welt_3.gd` ordnet 90 Textzeilen eine Geste zu (38 Einträge „vor“, 47 „mit“; W3-18 sprach von 47 „vor“, das ist also umgestellt), dazu Ruhe-Schleifen für 6 Figuren und Warte-Schleifen für 10. 123 Bilddateien `w3_*` im Spiel. Offene Grafik laut `status-alle-shots.md`: Max in der Pfütze (F21), Locher und Konfetti (G06), schmollender Lautsprecher Kammer 3 (B36), Morphäus hält den Kater (P30), Pixels Handtuch.

**Ablauf und Einbau, Szene für Szene.**

| Film | Szene | Dauer | Läuft und sitzt | Fehlt oder sitzt falsch |
| --- | --- | --- | --- | --- |
| 01 | Ankunft Unterstadt | 107 s | Handy-Geste, Regen, Neon | Max steht von Anfang an da, keine Ankunft (F21 offen) |
| 02 | R3a, Déjà-vu in der Gasse | 49 s | Regen, Dampf | **Pixel geht nicht**, er sitzt die ganze Szene (R5-W3-26) |
| 03 | blaue Pastille | 67 s | Sofa-Traumbild, Pixels Ohrfeige (Pointe aus W3-07 ist da) | – |
| 04 | rote Pastille, Ankunft Simulation | 98 s | Passanten, Takt-Autos, Vogelschwarm | Schlucken und Auffangen nicht zu sehen: Morphäus bleibt stehen, harte Blende (P30 offen); drei gleiche Passanten sind Absicht |
| 05 | erstes Aufwachen | 162 s | **Max kommt aus der Kapsel: Kopf, Sitzen, Aufstehen, etwa 2 s** (`anim_kapsel_aufstehen_4fps.gif`; W3-10 behoben); Kalle bewegt Hand und Headset | Erzähler: „Auf seiner Brust sitzt ein nasser Kater“, Pixel sitzt am Boden. Danach 150 s zwei stehende Figuren; „Max zieht die Tüte heraus“ ohne Geste |
| 06 | R13, Piepsi, Opas Nachricht | 133 s | Kalle redet mit Geste | Tasse bleibt stehen, Pixel geht nicht zum Tisch, Piepsi am Bildrand, kein Hologramm (R5-W3-24) |
| 07 | R12, Suppe | 103 s | Herr Vier löffelt | Max 200 px entfernt (R5-W3-03); „Er weint in die Suppe“ ohne Bild; Zeigertext mit Schlüssel im Bild |
| 08 | R8, Hausmeister | 47 s | Hausmeister nimmt die Seite, **rollt nach links ab**, Pfütze bleibt (`anim_hausmeister_rollt_ab_4fps.gif`) | – |
| 09 | R9a, Karte und Leitung | 55 s | Tür wird zur Datenwand | Kalle sagt „Bin da! Trommel dabei“ und ist nicht im Bild |
| 10 | Eintritt in den Turm | 88 s | **Zeitlupen-Pose** (Max biegt sich nach hinten; `anim_zeitlupe_locher_4fps.gif`), Handy | Locher und Konfetti nicht zu sehen (G06 offen) |
| 12 | R6a, R6b | 111 s | Code-Sicht als grünes Drahtbild, **ein Klon geht durchs Bild ab** (W3-17 für die Klone behoben) | Alles vom Terminal aus, Schmidt steht halb am linken Bildrand |
| 13 | R7b, Ente | 128 s | **Einblendung oben rechts: erst eine Ente im Hoodie, dann Max am Terminal** (`anim_ente_einblendung_4fps.gif`) – die beste Bildlösung der Welt | – |
| 14 | ins Labor | 68 s | Max geht zur Kapsel, Blende, Kammer 1 | Hinlegen nicht zu erkennen (Blende setzt ein, sobald er an der Kapsel steht) |
| 15 | Kammer 1, Portal | ≥ 100 s | Schuss-Pose, rundes Portal mit Opas Wohnzimmer, Bernd rückt heran (W3-R09-02 behoben) | **Portal erscheint erst rund 8 s nach „Ein schimmerndes rundes Loch öffnet sich“**, nämlich bei Opas „Hast du an die Milch gedacht?“ (`anim_portal_kommt_8s_nach_dem_erzaehler_4fps.gif`) |
| 16 | Kammer 2 | 94 s | Max geht zum Laser, Laser wird rosa und wabbelt, Lautsprecher leuchtet beim Sprechen (W3-08 für die Kammern behoben) | – |
| 17 | Kammer 3 | 64 s | Lautsprecher leuchtet | **Tür und Bernd wechseln erst, nachdem der Text „Die Tür … springt auf“ und „Bernd steigt auf und schwebt aus dem Spalt“ durch ist**; bis dahin Schloss und Würfel unverändert (`anim_kammer3_bernd_und_tuer_erst_nach_dem_text_4fps.gif`); Huhn am Boden nicht zu sehen |
| 18 | R10 | 89 s | Max hält die Akte vor, M.U.T.T.I.s Auge erlischt, Antennen sinken | – |
| 19 | R11, Welt-Ende, Dachboden | 400 s | Max geht zur Zelle, Zelle fort | Dachboden 200 s Standbild (R5-W3-25) |

**Sinn.** Wo die Geste die Pointe ist, ist sie jetzt da (Ohrfeige, Zeitlupe, Ente, Portal, Kapsel, Hausmeister). Was noch fehlt, sind die Stellen, an denen der Erzähler eine Handlung beschreibt und das Bild stillsteht oder nachhinkt; dort liest der Spieler einen Satz über etwas, das er gleichzeitig nicht sieht.

### Kandidaten für bessere Animationen

| Rang | Stelle | Heute | Vorschlag | Aufwand |
| --- | --- | --- | --- | --- |
| 1 | R3a: Pixel geht zweimal am Automaten vorbei | sitzt still (R5-W3-26) | zwei gleiche Läufe mit dem vorhandenen Trab | klein |
| 1 | R13: Tasse, Piepsi, Opas Nachricht | nichts davon im Bild (R5-W3-24) | Pixel läuft zum Tisch, Tasse kippt (zwei Zustandsbilder), Piepsi ins Bild rücken, blaues Flackerbild für die Nachricht | mittel; Hologramm-Bilder gibt es laut W3-07 schon |
| 2 | Kammer 3: Tür springt auf, Bernd schwebt weg | Zustand wechselt nach dem Text | Zustandswechsel an den Anfang der jeweiligen Erzählzeile ziehen | klein (Reihenfolge im Skript) |
| 3 | Kammer 1: Portal | 8 s nach dem Erzähler | Portal mit der Zeile „Max drückt ab“ öffnen | klein |
| 4 | Übergaben und Tausche aus der Ferne (R12, Büro, Kammer 1 und 3, Kern, Eimer) | Max bleibt 200 bis 300 px weg | Gehe-Punkt vor der Aktion | klein je Stelle |
| 5 | Kammer 1: Bodenschalter | Max betritt ihn nie (R5-W3-07) | nach dem Tausch auf den Schalter laufen, Schalter-Zustand „gedrückt“ | klein bis mittel |
| 6 | Dachboden-Ankunft | 200 s Standbild | Opa hebt die Zelle (eine Pose), Pixel springt in die Kiste (vorhandener Sprung), Zelle auf die Werkbank | mittel |
| 7 | rote Pastille | harte Blende | Morphäus fängt den Kater (P30) oder wenigstens eine Schluck-Geste von Max | mittel (Grafik offen) |
| 8 | Ankunft Unterstadt | Max steht einfach da | F21 (Max in der Pfütze) | Grafik offen |
| 9 | erstes Aufwachen | Pixel sitzt am Boden statt auf Max' Brust; Tüte ohne Geste | Pixel springt von der Kapsel; vorhandene „gibt“-Geste für die Tüte | klein |
| 10 | R9a | Kalle spricht aus dem Off | Kalle mit Trommel kurz ins Bild oder die Zeile als Funkspruch kennzeichnen | klein |
| 11 | Turm: Locher, Konfetti | nur Text | G06 | Grafik offen |

## Zeitmessungen (Tempo 1, `textmodus lesen`)

Dauer ohne Eingriff des Spielers, aus `marke`/`zeit` oder aus der Bildzahl der Filme (4 Bilder je Sekunde).

| Abschnitt | Dauer | Quelle |
| --- | --- | --- |
| Ankunft Unterstadt bis zum ersten Klick | 107 s | Film 01, 428 Bilder |
| R3a, Déjà-vu in der Gasse (Klick auf Pixel) | 49 s | Film 02, 197 Bilder |
| blaue Pastille (Schleife zurück) | 67 s | Film 03 |
| rote Pastille bis frei in der Simulation | 98 s | Film 04 |
| erstes Aufwachen | 162 s | Film 05, 647 Bilder |
| R13 (Tasse bis frei) | 133 s | Film 06 |
| R12 (Rezeptkarte bis Zugangskarte) | 103 s | Film 07 |
| R8 (Seite bis Hausmeister fort) | 47 s | Film 08 |
| R9a (Karte, Tür, Leitung) | 55 s | Film 09 |
| Eintritt in den Büroturm | 88 s | Film 10 |
| R6a und R6b zusammen | 111 s | Film 12 |
| R7b mit einem falschen Kabel | 128 s | Film 13 |
| „Ins Labor“ bis frei in Kammer 1 | 68 s | Film 14 |
| Kammer 1: Portalgerät und erster Blick auf Bernd | über 100 s (Aufnahme bei 400 Bildern abgebrochen) | Film 15 |
| Kammer 2 (Tausch, Durchgang) | 94 s | `zeit` |
| Kammer 3 (zwei Tausche) | 64 s | `zeit` |
| R10 (drei Regeln in richtiger Reihenfolge) | 89 s | `zeit` |
| R11 bis frei auf dem Dachboden | **400 s** (Kern 88, Basis 59, Straße 51, Dachboden 200) | `zeit`, Film 19 |
| Summe dieser Szenen | rund 33 Minuten | – |
| Gerader Durchlauf der ganzen Welt bis Welt 4 | 3640 Spielsekunden (61 min) mit `textmodus klick` und Nebenwegen | erster Lauf |
| Wege | 1280 px breiter Raum in zwei Klicks, rund 9 s; Radiowecker ↔ Glaseingang 7 bis 8 s | Verlauf |
| Radiowecker | klingelt 30 s nach dem Einschlafen, auch wenn man dazwischen in der Küche war (1,3 s nach dem Wiederbetreten; W3-R06-04 behoben). Die Uhr läuft in Echtzeit (`Time.get_ticks_msec`, aus dem Code), also auch im Pausemenü weiter. | Lauf `pr-w3-echt`, Tempo 1 |
| Zurufe | alle 45 s Nichtstun | 200-s-Probe |

Lesart: Welt 3 besteht in Lesetempo zu mehr als einer halben Stunde aus Szenen, in denen der Spieler nichts tun kann und nichts überspringen darf. Die fünf längsten (Welt-Ende mit Dachboden 400 s, erstes Aufwachen 162 s, R13 133 s, R7b 128 s, R6 111 s) sind die ersten Kandidaten zum Kürzen oder Teilen.

## Frühere Funde, Stand heute (Kontrolltabelle vom 20.11., AP-01 bis AP-09)

„Im Spiel“ heißt: heute mit echten Klicks gesehen. „Datei“ heißt: nur in `texte.csv` oder im Skript nachgelesen.

| Paket | Fund | Stand heute | Woran gesehen |
| --- | --- | --- | --- |
| AP-01 | W3-01 (Pixel-Klicks), W3-R01-01 (Mensch-Test wiederholbar), W3-R08-02 (Kapsel im Turm gesperrt) | **behoben** | im Spiel: ganzer Lauf als Pixel und Max; Sackgassen-Suche Zeilen 1, 6, 9 |
| AP-02 | W3-02, W3-03 (Code-Sicht zweistufig, Bild am Hintergrund) | **behoben** | im Spiel, alle fünf Räume mit Code-Sicht |
| AP-02 | W3-R06-01 (Sprechanlage schaltet frei) | **behoben** | Abtast-Lauf: `rklick sprechanlage` |
| AP-02 | W3-R08-01 (leeres Budget) | **behoben** | Sackgassen-Suche |
| AP-02 | W3-R10-02 (Etiketten überdecken sich) | **behoben** in Kammer 2; im Büro hängen Etiketten am Bildrand (R5-W3-06) | im Spiel, `belege/pr-w3/en_codesicht_kammer2_woerter_uebersetzt.png` |
| AP-03 | W3-04 (Pfote ortsbezogen) | **behoben mit einer Ausnahme** (R5-W3-10: Turm zuerst) | Pfoten-Lauf |
| AP-03 | W3-05 („nichts offen“-Zeile) | **behoben**; zwischen den Kammern zu allgemein (R5-W3-18) | Pfoten-Lauf |
| AP-03 | W3-R01-04 (Kekse an Herrn Vier) | **behoben** | im Spiel: `klick inv:omas_kekse`, `klick @herr_vier` → `W3_SUPP_MAX_0170` |
| AP-03 | W3-R02-02, W3-R02-03 (Déjà-vu, blaue Pastille) | **behoben**; neue Schwächen GD-W3-04 bis -06 | im Spiel, Filme 02 und 03 |
| AP-03 | W3-R03-06 (Lösung B) | **behoben** | Sackgassen-Suche |
| AP-03 | W3-R06-04 (Wecker einmal je Traum) | **behoben** | im Spiel, Tempo 1 (siehe Zeitmessungen) |
| AP-03 | W3-R12-02 (ungelesene Akte im Kern) | bewusst anders entschieden; **heute nicht geprüft** | – |
| AP-03 | W3-N-01 (Morse-Tabelle als Nahansicht) | **behoben** | im Spiel, DE und EN |
| AP-04 | W3-12 (orange Platzhalter) | **behoben** bis auf das Portalgerät in der Halterung (R5-W3-20) und die winzige Telefonbuchseite (R5-W3-23) | im Spiel, Raumaufnahmen |
| AP-04 | W3-14 (Max kommt in Figuren an) | **weiterhin offen** | R5-P-12-Zeile oben, R5-W3-24 |
| AP-04 | W3-19 (schmale Ausgänge, Flächen unter den Porträts) | **teilweise**: Ausgänge treffen; Sonne 0/36, Ausgang Kammer 3 14/36 | Abtast-Lauf |
| AP-04 | W3-R02-01, W3-R03-01, W3-R05-01, W3-R05-03, W3-R06-05, W3-R09-01 | **behoben** | im Spiel (Gasse 1280 px, Ausgänge, Laboreingang von Anfang an offen mit eigenen Zeilen, Portalgerät 36/36) |
| AP-04 | W3-R03-02 (Rebell fehlt), W3-R03-03 (Graubox-Streifen „Rebellen“) | **behoben** | `status`: Rebell (962) und Rebellin (414); Abtast-Lauf ohne Streifen |
| AP-04 | W3-R03-04 (Ausgang Kühlung) | **weiterhin offen** | 14/36 gegen den Lüftungsschacht, Ansehen gibt Ersatzzeile |
| AP-04 | W3-R12-04 (M.U.T.T.I.s Klickfläche) | **behoben** (25/36); Lauf durch den Sockel nicht geprüft | Abtast-Lauf |
| AP-05 | W3-07 (Bild-Pointen) | **weitgehend behoben**: Sofa-Bild, Ohrfeige, Ente, Portal, Zeitlupe, Hausmeister; offen: Hologramm und Tasse (R5-W3-24), Locher, Morphäus fängt | Filme 03, 06, 10, 13, 15 |
| AP-05 | W3-08 (Lautsprecher, Radio, Tür bewegen sich nicht) | **behoben für die Lautsprecher** (leuchten beim Sprechen); Küchenradio und Tür in Kammer 3 nicht geprüft | Filme 16, 17 |
| AP-05 | W3-09 (Reden ohne Mund) | **nicht beurteilbar** bei 4 Bildern je Sekunde; Hausmeister hält beim Reden still und wischt nicht weiter | Film 08 |
| AP-05 | W3-10 (Kapsel-Bewegungen) | **behoben** fürs Aufstehen; Hinlegen geht in der Blende unter | Filme 05, 14 |
| AP-05 | W3-17 (keine Nebenfigur geht) | **teilweise**: Klon geht ab, Hausmeister rollt; Morphäus und Kalle kommen nicht | Filme 08, 09, 12 |
| AP-05 | W3-18 (Gesten „vor“) | umgestellt (38 „vor“, 47 „mit“), Wirkung im Spiel nicht gemessen | Datei |
| AP-05 | W3-R08-03 (Brille und Akte vor R6 nehmbar) | **behoben** | im Spiel, frischer Prozess, Stand `w3_20`: beide `(unsichtbar)`, Tasse sichtbar |
| AP-05 | W3-R08-04 (hinkender Max gleitet) | **nicht beurteilbar** (Film 11 hat 28 Bilder bei 4 je Sekunde) | – |
| AP-05 | W3-R09-02 (Bernd schwebt heran) | **behoben** (Bernd rückt rund 100 px) | Film 15 |
| AP-05 | W3-R12-01 | **behoben** (M.U.T.T.I. fährt sichtbar herunter) | Film 18 |
| AP-06 | W3-15, W3-16 (Sprünge zwischen Stand und Geste, 2 px Absacken) | **nicht geprüft** (Sheet-Ebene) | – |
| AP-06 | W3-R05-02 (Mopp verkehrt) | **behoben** | Film 08, Ausschnitt |
| AP-06 | W3-NS-01 bis -04 (Autos, Pixels Trab, Schmidt, Frau) | **nicht geprüft** (braucht 10 Bilder je Sekunde und Vergrößerung); in den Filmen 04 und 07 fiel nichts davon auf | – |
| AP-07 | W3-11, W3-R01-02, W3-R03-05 (lange Texte, lange Szenen) | **weiterhin offen**, jetzt gemessen (R5-W3-25) | Zeitmessungen |
| AP-07 | W3-13 (Ansehen-Zeilen) | **behoben fürs Ansehen** (eine Ausnahme); Benutzen und gesperrte Türen mit Ersatzzeilen (R5-W3-16, -23) | Abtast-Lauf |
| AP-07 | W3-R07-02 (Kuckuck) | **weiterhin offen**: „Milch! Milch! Milch!“ ist weiter eine Erzählzeile (`W3_KUCH_NAR_0615`), jetzt nach „Die Tür der Uhr klappt auf.“ | Abtast-Lauf, Datei |
| AP-07 | W3-R12-05 (`W3_KERN_MAX_0590`) | **behoben** (gekürzt) | Datei; im Spiel nicht gehört |
| AP-07 | W3-N-04 (Englisch: „Servus“, „Hexenschuss“) | **behoben** („Servus, lad“, „Put my back out. At sixteen.“) | Datei |
| AP-07 | W3-N-05 (Zelle kalt, dann „glüht“; Handtuch) | **Text behoben** („Sie war eiskalt. Im Fernseher ist sie wieder warm geworden.“), Handtuch offen | Film 19 |
| AP-08 | W3-N-02, W3-N-03 (Morse-T, verzerrte Schrift, Akte magenta) | **behoben** | Nahansichten DE und EN |
| AP-09 | W3-06 (Raumlicht) | **behoben in der Realität, offen in der Stadtstraße bei Nacht und auf dem Dachboden** | `belege/pr-w3/sim_nacht_figuren_in_tagesfarben.png` |
| AP-09 | W3-R01-03 (Einhorn), W3-R06-02 (Autos, Nachttisch), W3-R07-01, W3-R08-05, W3-R10-01, W3-R11-01, W3-R12-03 | **behoben** | Raum-Tabelle |
| AP-09 | W3-R03-07 (Plakat-Text, Fenster) | **nicht geprüft** | – |
| AP-09 | W3-R06-03 (Max so groß wie die Häuser) | **unverändert** | Raumaufnahme Stadtstraße |
| AP-09 | W3-R06-06 (Sonne/Mond unter den Porträts) | **weiterhin offen** | Abtast-Lauf 0/36 |
| AP-09 | W3-R08-06 (viele Klone im Text, einer im Bild) | **weiterhin offen** | Raumaufnahme Büro |

Restpunkte W3-1 bis W3-14 aus `docs/offene-punkte.md`: **weiterhin offen**; heute berührt und bestätigt offen sind W3-6 (Sonne), W3-7 (Nacht), W3-11 (Eimer-Regen ohne Wirkung drüben). Keiner davon hat sich im Spiel als erledigt gezeigt.

## Nicht bestätigt

- **Figuren außerhalb des Raums nach Abgängen** (Muster aus Welt 1 und 2): in Welt 3 nicht gefunden (siehe weltübergreifende Tabelle).
- **Sackgasse durch Reihenfolge:** keine gefunden (17 Proben, siehe Sackgassen-Suche). Die einzige echte Sackgasse hängt am Speichern (R5-W3-22).
- **„Ente unsichtbar“** (eigene Vermutung aus dem ersten Durchlauf bei Tempo 4): falsch, die Einblendung zeigt sie.
- **Freier Moment auf der Straße mitten im Welt-Ende:** `stand sichern` wurde abgelehnt, das Spiel war beschäftigt; kein Fund.
- **R5-P-09 in Tempo 1:** in keinem von sieben Sitzungsanfängen aufgetreten.

## Nicht geprüft

- **Voller Endstand der Welt 2.** Gespielt ist vom Stand `welt2_ende` (Inventar echt, Schalter R7, R10, R11, R13 der Welt 2 offen); `welt2_ende_umgangen.json` lag nicht vor. Ob ein Schalter aus dem Finale der Welt 2 in Welt 3 etwas ändert, ist damit offen (im Skript der Welt 3 nicht gesucht).
- **Laufgitter:** kein systematisches Abklopfen der Böden; Laufwege nur aus dem Spielen.
- **Feinheiten der Animation** (Fußrutschen, Münder, 2-px-Sprünge, Autos, W3-09, W3-15, W3-16, W3-R08-04, W3-NS-01 bis -04): die Filme haben 4 Bilder je Sekunde.
- **Englisch:** nur Nahansichten, Code-Sicht-Wörter, Inventarnamen und rund zehn Zeilen; keine Gespräche, keine Rätselmenüs, keine Pfote.
- **Pfote Stufe 3 bei R2, R4, R5** (nur bis Stufe 2 abgefragt).
- **Unterstadt links** im Abtast-Lauf; **Küche** im Abtast-Lauf nur bis zur Eieruhr.
- **Kern mit ungelesener Akte** (W3-R12-02), **Küchenradio und Tür in Kammer 3 beim Sprechen**, Plakat-Texte (W3-R03-07), Lauf durch den Sockel im Kern.
- **Auswahlmenüs nach Neustart und Laden** (Patch-Panel, M.U.T.T.I.) auf den Fehler R5-W1-34; geprüft sind nur Gespräche (Deckert).
- **Welt 4** über die Stichprobe hinaus.

## Gut gelöst

- **Die Reihenfolge ist frei und trägt trotzdem.** Turm vor dem ersten Aufwachen, R13 vor oder nach R12, R8 gleich am Weltanfang, Kammer 3 in beiden Reihenfolgen, Regeln im Kern in falscher Reihenfolge: nichts davon führt in eine Sackgasse, und fast überall gibt es dafür eigene Zeilen. Das erste Aufwachen wird nach R7b nachgeholt, „Ins Labor“ erklärt, was noch fehlt.
- **Leere Budgets sind kein Festsitzen mehr.** Büro, Kammer 1, 2, 3 und Kern sagen, wie man zurücksetzt (Pixel-Wechsel, Raus-und-Rein, Fenster), und es funktioniert (W3-R08-01 behoben).
- **Die Code-Sicht** ist als Bild klar (grüne Umrisse, Etiketten als Knöpfe, Fußzeile „ein Wort anklicken · Rechtsklick schließt“), zweistufig, und Fehltausche haben oft eine eigene Pointe („Der Pappkuchen ist jetzt schwer. Er steht in der Ecke und wiegt eine Tonne.“, „Die Tür ist jetzt schwer. … Und Bernd ist verschlossen.“ – „Endlich.“).
- **Lösung B im Kern** (Pixel öffnet das Fenster) ist sauber angekündigt („Also brauch ich Wetter. Pixel. Fenster. Jetzt.“) und hat eine eigene Folgezeile im Zwischenspiel („Sie war eiskalt …“).
- **Der Mensch-Test** lässt sich beliebig wiederholen; ohne Beobachtungen gibt es zwei falsche Antworten mit Pointe, und Deckert schickt einen beim dritten Mal von selbst auf die Straße.
- **Die Hilfe-Pfote** hat an jedem abgefragten Schritt drei sauber gestufte Zeilen in Pixels Ton; „nichts offen“ zeigt auf den nächsten Ort.
- **Pixel hat an fast jedem Hotspot der Basis eine eigene Zeile** (Steuerpult, Großrechner, Plakat, Terminal, Kalle, Rebellin), und seine drei Eingriffe (Fenster, Strom, Eimer) verändern sichtbar etwas.
- **Die blaue Pastille** als Schleife statt Sackgasse, das Sparschwein („dann bring ich's hinter mich“), die falschen Bestellungen bei Herrn Vier, der Stempel am Kartenleser („Mensch, vorläufig.“ – Rot).
- **Die neuen Hintergründe** tragen die Rätsel: Laser quer vor der Tür, Bernd im Spalt vor der Tür, drei getrennte Farbfelder im Büro, M.U.T.T.I. als hängende Küchenmaschine, Zelle glühend, vereist und fort; die Kühlung mit umgekipptem Eimer.
- **M.U.T.T.I. fährt sichtbar herunter** (Auge erlischt, Antennen sinken) und ist nach dem Laden des Stands weiter aus (Stand `w3_33_nach_R10`, Foto `sw_w3_33_nach_R10` im Lauf `pr-w3-echt`).
- **Die Ente als Einblendung** oben rechts, während Pixel unten am Patch-Panel steckt: Ursache und Wirkung in einem Bild.
- **Speichern und Laden mitten in den Ketten** (F5/F9 in Turm, Kammer, Code-Sicht, Zwischenspiel 3) hat in derselben Sitzung nach vorn nie etwas zerstört; die Reisetasche lässt kein Speichern zu.

## Vorschläge für die Lessons Learned

- **Jede Szene, die nach einem Rätsel „von selbst“ weiterläuft, braucht einen Zustand, an dem sie beim Laden wieder anspringt.** Das erste Aufwachen hängt an `W3_ERSTES_AUFWACHEN` und wird nachgeholt; das Welt-Ende hängt am Ablauf und ist nach „Fortsetzen“ weg (R5-W3-22). Prüfregel für jede Welt: bei jedem Autospeicher einmal das Programm beenden, „Fortsetzen“, und schauen, ob das Spiel weitergeht.
- **Kein Autospeicher zwischen Rätsellösung und Folgeszene.** Erst speichern, wenn der Spieler wieder dran ist.
- **Anspieltests in mehreren Reihenfolgen.** Der gerade Weg nach der Rätseldoku war sauber; die Schwächen lagen im naheliegenden anderen Weg (Turm zuerst, Kammer ohne Portalgerät, Bernd vor der Tür). Je Welt zwei, drei „falsche“ Reihenfolgen als feste Klick-Tests.
- **Texte an Zustände hängen, nicht an Wortpaare oder Objekte.** „Die Tür redet“, „Er liegt da und sabbert“, „Bin da!“ und Bernds Vorstellung kamen in Zuständen, in denen sie nicht stimmen. Beim Schreiben je Zeile die Bedingung dazuschreiben und in `pruefen.py` abfragen (Zeile ohne Bedingung an einem Objekt mit mehreren Zuständen = Warnung).
- **Pflichtgegenstände nie als winziges Prop in einem größeren Hotspot.** Telefonbuchseite (18 × 12 px im Telefonbuch) und Portalgerät (unsichtbar in der Halterung): Der Klick auf das große Ding muss dasselbe tun.
- **Gesperrte Rätsel-Türen bekommen eine eigene Zeile**, die Ersatzzeilen sind für Unsinn da. Prüfung: Ausgang mit Bedingung, aber ohne eigene Absage = Fehler.
- **„Gegenstand auf Figur“ und Fern-Aktionen brauchen den Gehe-Punkt.** Übergaben und Code-Sicht aus 200 bis 300 px Entfernung sehen wie ein Fehler aus und machen Folgeschritte (Bodenschalter) unsichtbar.
- **Zurufe:** ein Zuruf darf den nächsten Klick nicht schlucken und muss von selbst verschwinden; sonst trifft er genau die Wartezeit der dritten Hinweisstufe.
- **Fernsteuerung:** Die Ereignisse stehen erst nach dem nächsten Befehl im Verlauf; auf eine Szene warten heißt `warte`, nicht die Datei beobachten. `LAGE frei` zwischen zwei Teilen einer Kette kann eine halbe Sekunde Lücke sein, vor einem Fund mit `stand sichern` prüfen (wird abgelehnt, wenn das Spiel beschäftigt ist).

## Werkzeug

- Fernsteuerung `werkzeuge/cloud/fs` über den Kurzaufruf `werkzeuge/pr-w3_k.sh` (filtert Klick- und Schalterzeilen; `CUT=` Zeilenlänge, `ALLES=1` ungefiltert).
- `werkzeuge/pr-w3_abtasten.py LAUF STAND [lauf_y] [figur]`: lädt einen Kontrollpunkt, sieht jedes sichtbare Objekt an (`rklick`) und benutzt jeden Hotspot (`klick`), schließt Überlagerungen und Menüs, zählt Ersatzzeilen und meldet, wer an den Probestellen gewinnt. Nur echte Klicks.
- `werkzeuge/pr-w3_raumbogen.py ZIEL.png SPALTEN BILDER…`: Kontaktbogen aus Raumaufnahmen mit Dateinamen.
- Pfoten-Lauf und Film-Lauf als Befehlsdateien im Lauf-Ordner (`/home/user/lauf/pr-w3-pfote/lauf.sh`, `/home/user/lauf/pr-w3-haupt/film.txt`; nicht im Repo, Inhalt in dieser Notiz beschrieben).
- `werkzeuge/pr-w3_filmbogen.py FILMORDNER ZIEL.png [ANZAHL] [SPALTEN] [VON BIS] [x y w h] [FAKTOR]`: Kontaktbogen aus einer Bildfolge, mit Ausschnitt und Bildnummern.
- Läufe: `/home/user/lauf/pr-w3-haupt` (Hauptlauf und Filme, mehrere Sitzungen), `/home/user/lauf/pr-w3-pfote` (Pfote, danach Abtasten), `/home/user/lauf/pr-w3-echt` (Nahansichten, Gegenproben, Lauf vom Stand `welt2_ende`).
- Befehlsdateien (`fs ORDNER -f datei`): Die Ausgabe kommt erst am Ende, nach 900 s Echtzeit bricht die Fernsteuerung ab (die Zeitwerte der ersten 15 Filme gingen so verloren; Dauer dort aus der Bildzahl). Nach mehr als 45 s Leerlauf schluckt ein Zuruf den ersten Klick der nächsten Datei; jede Datei mit einem Bodenklick beginnen. Der Radiowecker läuft in Echtzeit und ist bei Tempo 4 erst nach 120 Spielsekunden so weit. Zeitweise liefen zwei eigene Godot-Prozesse neben dem von `pr-w2`.
- Fallen der Fernsteuerung, die Zeit gekostet haben: `klick @opa` und Koordinaten aus `knoepfe` (Mittelpunkte); erstes Menü einer Sitzung nur in Tempo 1 (R5-P-09); nach einem Hänger hilft nur `stop` und `start`.

FERTIG
