# Notiz pr-w3: Welt 3 „Neo-Neustadt 2099“ bis zum Anfang von Welt 4

**Rolle:** Welt-Prüfer (ein Durchgang aus fünf Blickwinkeln: Durchspieler, Level-Design, Game-Design, Technical Art, Gameplay-Skript). **Umfang:** Welt 3 vollständig (12 Räume, alle Zustände, Code-Sicht, Rätsel R1a bis R13), Welt-Ende, Übergang, Zwischenspiel 3 im Spielfluss, erster freier Moment in Welt 4; dazu Stichprobe R5-W4-11 in Welt 4. **Geprüfter Commit:** `04c5a79f` (main nach PR #46), Checkout `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s`.

**Wie geprüft:** Fernsteuerung (`werkzeuge/cloud/fs`) ohne Testmodus, echte Maus- und Tastenereignisse. Läufe unter `/home/user/lauf/pr-w3-*`. Kontrollpunkte unter `kontrollpunkte/welt-3/` mit `liste.md`. Lösungsweg: `belege/pr-w3/loesungsweg.txt`. Alle Belegpfade relativ zu `docs/review/2026-11-21/`.

**Anfangsstand:** zunächst `start welt-3` (Schnellstart: Inventar nur das Pixel-Feld; Olivenöl, Hermes' Sandale, Thunfischdose, Notizbuch und Reisetasche fehlen), weil `kontrollpunkte/welt-2/welt2_ende.json` am 25.11. noch nicht vorlag. Was daran hängt, steht unter „Nicht geprüft“ bzw. wird am Schluss vom echten Endstand aus nachgeholt.

**Stand der Notiz:** in Arbeit, angelegt 25.11.2026. Wird blockweise fortgeschrieben.

## Hauptfrage: Ist Welt 3 mit echten Klicks durchspielbar?

(offen; Zwischenstand 25.11.: R1a, R1b, R2, R3a, R3b, R4, R5, R13, R12, R8, R9a auf dem Klickweg gelöst, kein Hänger. Offen: R6, R7, R9b–d, R10, R11, Welt-Ende, Zwischenspiel 3.)

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
