# Notiz pr-w3: Welt 3 „Neo-Neustadt 2099“ bis zum Anfang von Welt 4

**Rolle:** Welt-Prüfer (ein Durchgang aus fünf Blickwinkeln: Durchspieler, Level-Design, Game-Design, Technical Art, Gameplay-Skript). **Umfang:** Welt 3 vollständig (12 Räume, alle Zustände, Code-Sicht, Rätsel R1a bis R13), Welt-Ende, Übergang, Zwischenspiel 3 im Spielfluss, erster freier Moment in Welt 4; dazu Stichprobe R5-W4-11 in Welt 4. **Geprüfter Commit:** `04c5a79f` (main nach PR #46), Checkout `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s`.

**Wie geprüft:** Fernsteuerung (`werkzeuge/cloud/fs`) ohne Testmodus, echte Maus- und Tastenereignisse. Läufe unter `/home/user/lauf/pr-w3-*`. Kontrollpunkte unter `kontrollpunkte/welt-3/` mit `liste.md`. Lösungsweg: `belege/pr-w3/loesungsweg.txt`. Alle Belegpfade relativ zu `docs/review/2026-11-21/`.

**Anfangsstand:** zunächst `start welt-3` (Schnellstart: Inventar nur das Pixel-Feld; Olivenöl, Hermes' Sandale, Thunfischdose, Notizbuch und Reisetasche fehlen), weil `kontrollpunkte/welt-2/welt2_ende.json` am 25.11. noch nicht vorlag. Was daran hängt, steht unter „Nicht geprüft“ bzw. wird am Schluss vom echten Endstand aus nachgeholt.

**Stand der Notiz:** in Arbeit, angelegt 25.11.2026. Wird blockweise fortgeschrieben.

## Hauptfrage: Ist Welt 3 mit echten Klicks durchspielbar?

**Zwischenstand 25.11. (gerader Durchlauf fertig): Ja.** Vom ersten freien Moment in der Unterstadt (`start welt-3`) bis zum ersten freien Moment in Welt 4 (Raum `testbild`) in einem Zug mit echten Klicks durchgespielt, alle 20 Rätselschritte gelöst (R1a bis R13), Welt-Ende, Zwischenspiel 3 mit Packen und Abreise. Kein Hänger, kein Absturz, 3640 Spielsekunden in Tempo 4 mit Nebenwegen. Befehle: `belege/pr-w3/loesungsweg.txt` (13 Blöcke), 37 Kontrollpunkte unter `kontrollpunkte/welt-3/`. Noch offen: Sackgassen-Suche, Speichern/Laden, Lösung B (Fenster), andere Reihenfolgen, Wiederholung vom echten Endstand der Welt 2.

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

### Apothekengasse

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W3-04 | apothekengasse | wichtig | Rätsel (Bedienung) | **Bestätigt:** Die Pastille lässt sich nur schlucken, indem man sie in der Leiste zweimal anklickt. Rote Pastille auf Max: `SYS_ERS_MAX_0230`; auf den Automaten: `SYS_ERS_MAX_0120`. Pfote Stufe 1 (`W3_HINT_PIX_0340`) sagt nicht, wie. | Stand `w3_06_pastillenwahl`: `klick inv:rote_pastille`, `klick @max`; `klick inv:rote_pastille`, `klick @automat`; Verlauf 401.9, 414.9 | wie gd-w3 |
| GD-W3-05 | apothekengasse | wichtig | Rätsel (Text gegen Zustand) | **Bestätigt:** Ansehen von Omas Keksen direkt nach dem Erhalt in der Gasse: „Hundekuchen. Knochenförmig. Drüben waren das Kekse. Ich hab die Verwandlung gesehen …“ (`W3_BAS_MAX_0870`). Max war noch nie drüben. | Stand `w3_06_pastillenwahl`: `rklick inv:omas_kekse`, Verlauf 383.0 | wie gd-w3 |

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
