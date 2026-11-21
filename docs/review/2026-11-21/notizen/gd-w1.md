# gd-w1: Game Designer und Durchspieler, Welt 1 „Schwurbelstein“

**Stand: in Arbeit (Zwischenstand nach R1, R2, R3, R4, R5, R8; wird nach jedem Block gespeichert).**

- Rolle: Game Designer und Durchspieler. Kürzel `gd-w1`.
- Umfang: Welt 1 vollständig (14 Räume, R1 bis R13, Max und Pixel), von der Ankunft bis zum Beginn des Zwischenspiels 1.
- Geprüfter Commit: `04c5a79f` (Prüf-Checkout `cq-r5`).
- Wie geprüft: Fernsteuerung (`fs.py`) ohne Testmodus, echte Klicks. Hauptlauf im Arbeitsordner `cq-r5-lauf\gd-w1-haupt` (Tempo 4, Textmodus `klick`), Varianten und Nachstellen in Tempo 1 im Lauf `cq-r5-lauf\gd-w1-var`. Kontrollpunkte liegen zusätzlich unter `cq-r5-lauf\kontrollpunkte\welt-1\` mit `liste.md`. Alle Befehle des Hauptlaufs: `cq-r5-lauf\gd-w1-haupt\befehle.log`, Antworten `verlauf.txt`.
- Ausgangslage: **nicht** `start welt-1`, sondern „Neues Spiel“ und der Prolog mit echten Klicks, weil `start welt-1` aus dem Hauptmenü Max nur das Pixel-Feld gibt (siehe „Werkzeug“). Alle Stände ab `00_ankunft` stammen aus diesem echten Lauf.

## Funde

### Kritisch

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-K1 | zauberwald (Ursache dorfplatz) | kritisch | Durchspielbarkeit | **Rotkäppchen steht im Zauberwald außerhalb des Raums, Weg A der Goblin-Frage (R10a) ist auf dem Klickweg nicht lösbar.** Nach der Lieferung der XXL-Ziege läuft Rotkäppchen auf dem Dorfplatz nach rechts aus dem Bild (`room_dorfplatz.gd` Z. 279, Ziel x 1270) und wird ausgeblendet. Ihre Position bleibt (1270, 290). Der Zauberwald ist nur 1066 px breit, die Kamera endet bei x 426, sichtbar ist also bis x 1066. Rotkäppchen steht 204 px rechts davon (Soll laut Grundaufnahme: 914, 272). Sie spricht beim Betreten aus dem Off (`W1_WALD_ROT_0740`), ist aber nie zu sehen und nicht anklickbar. Klick auf den Ketchup: „Das gehört Rotkäppchen, da frag ich lieber“ (`W1_WALD_MAX_0730`); die Erlaubnis (`W1_KETCHUP_FREI`) gibt es nur im Gespräch mit ihr. Betrifft **jeden** Spieler: Der Zauberwald öffnet erst nach R4, R4 braucht R3, R3 braucht die Lieferung. Bleibt auch nach Raumwechsel, nach Speichern und Laden und nach Neustart mit Laden so. Die Welt bleibt über Weg B (Zeldina) lösbar; Leuchttrank, Ketchup und Tarifvertrag haben dann keinen Nutzen. Die Tests merken es vermutlich nicht, weil im Testmodus die Laufwege entfallen. | Hauptlauf: `status` im Zauberwald „Rotkaeppchen bei Raum (1270,290) … Raumbreite 1066 px“, `belege/gd-w1/K1_wald_hauptlauf.png` (Lieferkarren ohne Rotkäppchen). Nachgestellt in Tempo 1 in frischem Prozess ab `13_vor_bestellung`: vor der Bestellung `lies C.get_character("Rotkaeppchen").position` = (0, 0), nach der Lieferszene (1270, 290), nach dem ersten Betreten des Zauberwalds weiter (1270, 290), `belege/gd-w1/K1_wald_ohne_rotkaeppchen.png`; Befehlsfolge in `belege/gd-w1/loesungsweg.txt`, Abschnitt K1 | Im Zauberwald Rotkäppchen beim Betreten immer auf ihren Platz stellen (Marker oder feste Position 914, 272 in `_zustand_anwenden`), oder am Ende der Lieferszene die Position zurücksetzen. Dazu einen Klick-Test „Ketchup holen“ ohne Testmodus. |

### Übergreifend / Oberfläche

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-01 | alle Gespräche und Auswahlmenüs | wichtig | Sonstiges (Oberfläche) | **Das Gesprächsmenü ist immer etwa eine Zeile zu niedrig: weiterhin offen (Fund 11 vom 14.11., dort als „erledigt, sechs Zeilen“ geführt).** Bei 5 Optionen sind 4 ganz und eine halb zu sehen (Toadi, Stabmacher), bei 4 Optionen 3 und eine halbe (Gollo), bei 3 Optionen 2 und eine halbe (Brunnen: die **richtige** Antwort „Etwas, das hoch hinaus will.“ ist die abgeschnittene), bei 2 Optionen eine und ein Pixelrest (Toadi: „Ich muss weiter.“), bei einer einzigen Option fand die Fernsteuerung nach 40 Rollschritten keine sichtbare Stelle (Schmied: „Bis dann.“). Welche Zeile abgeschnitten ist, hängt vom Rollstand ab; die Liste öffnet nicht immer am Anfang (Gollo, Stabmacher, Humbert: die **erste** Option war abgeschnitten). | `belege/gd-w1/01_toadi_optionen.png` (5), `01_gollo_optionen.png` (4), `01_brunnen_3optionen.png` (3), `01_toadi_2optionen.png` (2); Verlauf: `option 0310` beim Schmied „angeklickt bei (316,355) nach 40 Rollschritten“ | Höhe des Menüs = Zahl der Optionen × Zeilenhöhe plus Rand (bis 6 Zeilen ohne Rollen), beim Öffnen an den Anfang rollen. Danach mit 1, 2, 3 und 5 Optionen im Spiel nachsehen. |
| GD-W1-03 | alle | kosmetisch | Sonstiges (Oberfläche) | Mit 12 Gegenständen (ab der Taverne normal) rutscht die Inventarleiste nach links unter das Pixel-Porträt: Vom Pixel-Feld „PIX“ ist nur „IX“ zu sehen. | `belege/gd-w1/06_leiste_12_gegenstaende.png`; `inv`: „inv:PixelFeld bei (111,24)“, Porträt Pixel bei (80,28) 48 px breit | Leiste rechts vom Porträt beginnen lassen und bei vielen Gegenständen blättern oder Abstände verkleinern. |
| GD-W1-04 | alle | kosmetisch | Sonstiges (Bedienung) | Zurufe von Pixel (nach 45 s ohne Eingabe) sind stehender Text: Der nächste Klick schaltet nur den Zuruf weiter und geht als Aktion verloren. Im Hauptlauf verschwanden so mehrfach der erste Klick auf einen Ausgang und ein Klick auf die Pfote (statt des Hinweises kam nur die zweite Hälfte des Zurufs). | Verlauf Hauptlauf: `klick @zauberstab_laden_von_aussen` ohne Wirkung, danach beim zweiten Klick Raumwechsel; `warte 61` im Stabladen → `LAGE text` mit `W1_STAB_PIX_0620`, folgendes `pfote` zeigt nur `W1_STAB_PIX_0620_2` | Zurufe als nicht blockierende Sprechblase zeigen, die beim nächsten Klick verschwindet, ohne ihn zu verbrauchen. |
| GD-W1-05 | alle | kosmetisch | Hinweise | Rechtsklick auf das Notizbuch in der Leiste gibt eine Ersatzzeile („Hab ich mal in einer Serie gesehen …“, `SYS_ERS_MAX_0080`) statt einer Beschreibung. | Verlauf: `rklick inv:notizbuch` → `ERSATZZEILE (MAX) SYS_ERS_MAX_0080` | Eigene Ansehen-Zeile oder Rechtsklick öffnet es wie der Linksklick. |
| GD-W1-06 | trollbruecke (Notizbuch) | wichtig | Hinweise | Das Notizbuch führt die Märchen-Satzung nur als Überschrift („- Märchen-Satzung“ auf der Seite „Regeln und Passwort-Teile“). Die Paragrafen stehen nicht drin, und der Eintrag lässt sich nicht anklicken. Wer die Sätze oder Paragraf 3 noch einmal braucht, muss zum Schild zurück. Die Seite „Ziele“ nennt nur das eine gerade offene Rätsel des schon besuchten Raums, kein übergeordnetes Ziel (Ei, Prinzessin, Turm). | `belege/gd-w1/05_notizbuch_nach_satzung.png` (drei Seiten nebeneinander) | Eintrag anklickbar machen (öffnet die Nahansicht) oder die Kernsätze darunter schreiben; auf „Ziele“ das Weltziel als erste Zeile. |

### Dorfplatz

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-07 | dorfplatz | kosmetisch | Hinweise | Eimer mit Wasser auf den Erdfleck, bevor die Bohne drin ist: Ersatzzeile („Das lade ich lieber nicht herunter“). Die naheliegende falsche Reihenfolge hat keine eigene Zeile. | Verlauf: `klick inv:eimer`, `klick @erdfleck` → `SYS_ERS_MAX_0100` | Eigene Zeile, z. B. „Erst muss was rein, das wachsen will. Wasser allein macht hier nur Matsch.“ |
| GD-W1-08 | dorfplatz | kosmetisch | Hinweise | XXL-Ziege: Rechtsklick gibt eine Ersatzzeile (auch an der Brücke nach R4), Linksklick mit Max die allgemeine Tierzeile „Miau? Miau. Ich glaube, es hat Nein gesagt.“ (`W1_WECH_MAX_0100`), dieselbe bei der Schmiede-Ziege und beim Schwan. | Verlauf: `rklick @xxl_ziege` → `SYS_ERS_MAX_0130` bzw. `_0110`; `klick @schwan` → `W1_WECH_MAX_0100` | Ansehen-Zeile für die XXL-Ziege; Tierzeile je Tierart („Mäh?“) oder neutral formulieren. |

### Taverne (R1)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-02 | taverne | kosmetisch | Humor / Zustandswechsel | Texte kennen den Zustand nicht: (a) Pixels Zuruf `W1_TAV_PIX_1620` („Humbert poliert, Gollo zittert, Minka starrt“) kommt auch, nachdem Minka draußen ist; Bedingung ist nur „vor R1“. (b) Humbert sagt nach R1a weiter „Nicht, solange Minka danebensitzt“ (`W1_TAV_HUM_0522`) und „Minka? Bewacht den Topf.“ (`_0630`). | Verlauf nach `04_nach_R1a`: Zurufe 1620; `option 0510`, `option 0620` bei Humbert nach R1a | Zuruf an „vor R1a und vor R1b“ binden; bei Humbert nach R1a eine Variante („Minka? Eben war sie noch da.“). |
| GD-W1-09 | taverne | kosmetisch | Hinweise | Wenn Minka und Humbert weg sind, gibt der Klick auf den Fondue-Topf nur eine Ersatzzeile („Lädt. Lädt immer noch.“). Genau jetzt erwartet der Spieler, selbst an den Topf zu dürfen. | Verlauf ab `05_vor_R1c`: `klick @fondue_topf` → `SYS_ERS_MAX_0140` | Eigene Zeile, die auf Gollo zeigt: „Käse pur bringt mir nichts. Erst muss Gollos Ring da rein.“ |

### Schmiede, Troll-Brücke (R3, R4)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-10 | schmiede, trollbruecke, dorfplatz | wichtig | Positionierung | Die XXL-Ziege als Begleiterin verdeckt das Wichtige. Schmiede: Sie füllt den halben Raum, verdeckt Kochgeschirr, den Krug (Rätselgegenstand für R6a) und halb den Schmied. Brücke beim Betreten: Sie steht vor dem Schild mit der Satzung (Schild gewinnt nur an 22 von 36 Probestellen). Brücke nach R4a und nach R4: Max und Pixel stehen vollständig hinter ihr, Waldemar halb; die Spielfigur ist nicht zu sehen. Dorfplatz: Sie steht vor dem Waldweg (7 von 36 Probestellen gehen an die Ziege). | `belege/gd-w1/03_schmiede_xxl_verdeckt.png`, `04_bruecke_xxl_vor_schild.png`, `04_bruecke_max_verdeckt.png` | Eigener Platz für die XXL-Ziege je Raum (Marker abseits von Schild, Krug, Ausgängen); auf der Brücke Max und Pixel links vor die Ziegen stellen; nach R4 die Ziege neben die Brücke ins Gras. |
| GD-W1-11 | trollbruecke | wichtig | Hinweise | Pfote zu R3, Stufe 1: „Der Troll will drei Ziegen, und wir haben null.“, obwohl zwei Ziegen schon hinter Max stehen. Auch Stufe 2 und 3 schicken zum Schmied und zum Dorfbrett. Die Hinweise zu R3 kennen den Teilstand nicht; offen war nur noch „Fell auf Pixel“. | Verlauf ab `16_bruecke_erstmals`: `pfote` → `W1_HINT_PIX_0310`; `status`: SchmiedeZiege und XxlZiege im Raum | Hinweis nach Teilstand wählen (keine Ziege / eine / zwei; fehlt nur die kleine: „Zwei Ziegen, und die kleinste fehlt. Ich ahne, wer klein und pelzig ist.“). |
| GD-W1-12 | trollbruecke | wichtig | Rätsel / Hinweise | R4b führt in die falsche Richtung. Pixel sagt „Ich spreche fließend Ziegisch“. Wechselt der Spieler deshalb zu Pixel und klickt eine Ziege an, bevor Max vorgelesen hat, kommt die Menschen-Zeile „Ich rede nicht mit Menschen … Wechsel zu Max, wenn du Wörter brauchst.“ (`W1_WECH_PIX_0110`). Klickt Max die Ziege an: „Miau? Miau.“ Der eigentliche Schritt ist ein Linksklick von Max auf das Schild, das er schon gelesen hat. Die Pfote sagt Stufe 2 „Lies den Text aus der Satzung vor, ich übersetze“ auch dann noch, wenn schon vorgelesen ist und nur der Wechsel zu Pixel fehlt. | Verlauf ab `19_vor_R4b`: `portraet pixel`, `klick @schmiede_ziege` → `W1_WECH_PIX_0110`; nach `klick @schild` (Vorlesen) `pfote` → `W1_HINT_PIX_0422` | Pixel auf Ziege vor dem Vorlesen: „Ich übersetze gern. Aber erst muss mir jemand den Text vorlesen. Vom Schild.“ Pfote nach dem Vorlesen: „Vorgelesen ist. Jetzt wechsel zu mir und stell mich den Ziegen vor.“ |
| GD-W1-13 | trollbruecke | kosmetisch | Timing / Zustandswechsel | Max sagt „Da sitzt ein Troll mit Regelbuch. Da geh ich nicht einfach drüber …“ (`W1_BRUE_MAX_0190`) bei jeder Annäherung an Waldemar vor R4: zu Beginn jedes Gesprächs mit ihm, doppelt bei Klick auf die Ausgänge, und auch, wenn Pixel die Spielfigur ist (gleichzeitig mit Waldemars „Katzen queren die Brücke jederzeit“). Ursache: Sperre in `_process` (`room_trollbruecke.gd` Z. 227–240) greift 40 px vor Waldemar, der Gesprächsplatz liegt dahinter. | Verlauf: `klick @waldemar` (Max) → `GESPRÄCH beginnt` + `W1_BRUE_MAX_0190`; `klick @waldemar` (Pixel) → `W1_BRUE_WAL_0180` und `W1_BRUE_MAX_0190` mit gleicher Zeit; `klick @waldweg` → Zeile zweimal | Sperrzeile nur sagen, wenn das Ziel des Klicks hinter Waldemar liegt (Ausgänge, Brücke), nicht beim Ansprechen, und nicht bei Pixel. |
| GD-W1-14 | trollbruecke | kosmetisch | Zustandswechsel | Nach R4 bietet Waldemar weiter „Lass mich rüber.“ an und antwortet „Niemand überquert die Brücke, bevor das Märchen abgelaufen ist … Lies das Schild.“ Ein leerer Eimer auf Waldemar nach R4 bringt „Ein leerer Eimer ist kein Wasser“ statt der Zeile für danach (`W1_BRUE_WAL_1050` kommt nur mit vollem Eimer). | Verlauf ab `21_nach_R4`: `option 0210` → `W1_BRUE_WAL_0220`; `klick inv:eimer`, `klick @waldemar` → `W1_BRUE_WAL_0940` | Optionen 0210/0230/0270 nach R4 ausblenden oder umformulieren; in `_eimer_auf_waldemar` zuerst auf „R4c gelöst“ prüfen. |
| GD-W1-15 | schmiede, trollbruecke | kosmetisch | Hinweise | Fell auf Pixel außerhalb der Brücke (Schmiede, über das Pixel-Feld) und Fell auf die XXL-Ziege geben Ersatzzeilen. Dass das Fell nur an der Brücke umgelegt wird, sagt das Spiel nicht. | Verlauf: `klick inv:ziegenfell_vorleger`, `klick inv:PixelFeld` in der Schmiede → `SYS_ERS_MAX_0070` | Eigene Zeile: „Erst an der Brücke. Vorher zerreißt er es mir.“ |

(weitere Blöcke folgen: Zauberwald, Hoggelwarz, Luftschloss, Bergwerk, Turm, Thronsaal, Übergang)

## Rätselübersicht (wird laufend ergänzt)

| Rätsel | auf dem Klickweg gelöst | Schritte (Klicks ohne Wege) | Schwierigkeit | Hinweise |
| --- | --- | --- | --- | --- |
| R1a Minka | ja | 2 (Porträt Pixel, Minka) | leicht | Porträt blinkt, Pfote Stufe 1 „einer fängt mit P an“: gut |
| R1b Schicksalsberg | ja | 3 (Humbert, „Habt ihr Wein?“, „Dann nehm ich den Schicksalsberg“) | leicht | Weinkarte (Max und Pixel), Humbert nennt Dauer; keine falsche Wahl möglich |
| R1c Rätselspiel | ja | 2 (Gollo, Option „Was hab ich in meiner Tasche?“) | leicht | Gollo sagt selbst, wann er verliert; die Lösung steht als Gesprächsoption da, die Dose muss man nicht benutzen |
| R2 Zauberstab | ja | 3 (Kochlöffel nehmen, Fondue, Kochlöffel) | leicht | Stabmacher („kleben blieb“), Pfote 1 bis 3 passend |
| R3 Drei Ziegen | ja | 5 (Zettel aufs Brett, Ziege, Fell, Pixel) | leicht | Pfote kennt den Teilstand nicht (GD-W1-11) |
| R4a Reihenfolge | ja | 3 | leicht | Satzung, Waldemar korrigiert mit Begründung; gut |
| R4b Ziegisch | ja | 6 (Schild, Tab, je 2× beide Ziegen) | mittel | irreführende Zeilen (GD-W1-12) |
| R4c Ins Wasser | ja | 2 (Eimer, Waldemar) | leicht bis mittel | Max sagt die Lücke beim Lesen selbst an; Bach hat eigene Abfuhr; gut |
| R5 Brunnen | ja | 3 (Münze, Brunnen, Wunsch) | leicht | falsche Wünsche geben die Münze zurück, wiederholbar; richtige Antwort im Menü abgeschnitten (GD-W1-01) |
| R8 Bohnenranke | ja | 4 (Bohne, Erdfleck, Eimer, Erdfleck) | leicht | Erdfleck-Zeilen und Toadi zeigen den Weg |

## Frühere Funde, Stand heute

- Fund 11 (14.11., Gesprächsmenü, „erledigt“): **weiterhin offen**, siehe GD-W1-01.

(weitere folgen)

## Gut gelöst

(folgt)

## Nicht geprüft

(folgt)

## Vorschläge für die Lessons Learned

(folgt)

## Werkzeug

- `start welt-1` direkt aus dem Hauptmenü stellt nicht den Weltanfang eines echten Spielers her: `Spiel.welt_beginnen()` (`game/skripte/spiel.gd` Z. 1189–1207) behält nur, was Max schon hat, und gibt das Pflichtfach nicht selbst. Max hatte danach nur das Pixel-Feld. Ohne Thunfischdose und Notizbuch wären R1c und R11a nicht prüfbar gewesen. Abhilfe: „Neues Spiel“ und Prolog spielen.
- Nach `start hauptmenue` aus einem laufenden Spiel reagierte der Knopf „Neues Spiel“ nicht mehr (Lage blieb `hauptmenue`), dazu `SCRIPT ERROR … get_character … _r5_fernsteuerung.gd:562` im `godot.log`. Fehler der Fernsteuerung, kein Fund am Spiel. Abhilfe: Godot neu starten.
- In Tempo 4 vergehen zwischen zwei Aufrufen schnell 45 Spielsekunden; dann steht ein Zuruf und schluckt den ersten Klick (siehe GD-W1-04). Abhilfe: jeden Aufruf mit `warte` beginnen.
- `stand holen` in einem Prozess, der vorher einen späteren Stand geladen hatte, setzt Figuren nicht zurück, die im geladenen Raum nicht stehen (Rotkäppchen behielt ihre Position). Für saubere Nachstellungen den Prozess neu starten.
- Zweimal kam auf einen Aufruf gar keine Ausgabe, die Befehle wurden nicht ausgeführt (kein Eintrag im Verlauf); beim Wiederholen ging es. Ursache unklar.
- Die Unterbrechung um 17:30 Uhr ließ das Spiel etwa 38 000 Spielsekunden in der Taverne stehen; die Spielzeit des Hauptlaufs wird deshalb je Raum aus den Zeitmarken des Verlaufs bestimmt.
