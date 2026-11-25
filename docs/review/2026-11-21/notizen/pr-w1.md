# pr-w1: Welt-Prüfer Welt 1 „Schwurbelstein“ (Fortsetzung in der Cloud, ab 25.11.2026)

**Stand: in Arbeit (25.11., gerader Durchlauf fertig, Sackgassen-Suche, Filme und Zeitmessung stehen aus). Wird nach jedem Block ergänzt und gesichert.**

- Rolle: Welt-Prüfer (Durchspieler, Level-, Game-Designer, Technical Artist, Gameplay-Scripter in einem Durchgang). Kürzel `pr-w1`.
- Umfang: Welt 1 vollständig, vom ersten freien Moment auf dem Dorfplatz bis zum ersten freien Moment in Welt 2 (einschließlich Welt-Ende, Übergang, Zwischenspiel 1).
- Geprüfter Commit: `04c5a79f` (Checkout `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s`).
- Wie geprüft: Fernsteuerung (`werkzeuge/cloud/fs`) ohne Testmodus, echte Klicks, Standard Tempo 4 und Textmodus `klick`. Lauf `/home/user/lauf/pr-w1-haupt` (Verlauf, Fotos, Stände). Anfang: echter Prolog-Endstand `kontrollpunkte/prolog/prolog_ende.json`.
- Kontrollpunkte: `kontrollpunkte/welt-1/` (`w00` bis `w44`, `welt1_ende.json`), Liste in `kontrollpunkte/welt-1/liste.md`.
- Vorgänger: `gd-w1.md` (Zwischenstand nach R1, R2, R3, R4, R5, R8). Dessen Funde stehen hier mit alter ID und sind neu nachgestellt.
- Alles in den Tabellen ist im laufenden Spiel beobachtet, außer wo „aus dem Code“ dabeisteht. „Verlauf“ meint `/home/user/lauf/pr-w1-haupt/verlauf.txt` (liegt nicht im Repo; die Befehlsfolge steht jeweils dabei).

## Was noch aussteht (Plan, wird abgearbeitet)

1. Sackgassen-Suche von den Kontrollpunkten: andere Reihenfolge, andere Figur, falsche Gegenstände, R1c über Option 0785, R7 ohne Socke in der Hand, Weg B ohne vorher abgegebenen Leuchttrank (bleibt die Pfote dann auch auf R10 stehen?), Geheimtür mit fehlenden Teilen, Thronsaal ohne Pollen, F5/F9 und Menü-Speichern mitten in Ketten, Laden in derselben Sitzung (GD-W2-03 / R5-P-01) an zwei Stellen.
2. Pfote: alle drei Stufen an Stichproben.
3. Filme in Tempo 1: R7-Gesangsszene (ab `w24`), Fußbad R4c (ab `w20`), Lieferszene (ab `w13`), Melken (ab `w27`), Pilz-Verwandlung (ab `w29`), Kreuzungen und Besen (ab `w34`), Thronsaal (ab `w40`).
4. Zeitmessung Tempo 1 mit `textmodus lesen`.
5. Frühere Funde 14.11. und 17.11. vollständig durchgehen (bisher nur ein Teil), GD-W1-05, -06, -15 nachstellen.
6. Englische Nahansichten.
7. Lösungsweg als Befehlsdatei (`belege/pr-w1/loesungsweg.txt`) und Wiederholung vom Prolog-Endstand.

## Rätselübersicht des Klickwegs (so gespielt, alles echte Klicks)

| Schritt | Wie gelöst | Ergebnis im Spiel | Stand |
| --- | --- | --- | --- |
| R1a | Wechsel zu Pixel, Klick auf Minka | `W1_R01_A_GELOEST` | geht |
| R1b | Humbert auf den Schicksalsberg ansprechen | `W1_R01_B_GELOEST` | geht |
| R1c | Thunfischdose auf Gollo | Goldmünze, Käsefondue | geht (Option 0785 noch offen) |
| R2 | Fondue auf Kochlöffel im Laden | Kochlöffel-Zauberstab, Socke | geht |
| R5 | Münze in den Brunnen, Wunsch „Etwas, das hoch hinaus will.“ | Bohne | geht; richtige Antwort ist die abgeschnittene Zeile (GD-W1-01) |
| R8 | Bohne, dann voller Eimer auf den Erdfleck | Bohnenranke | geht |
| R3 | Schmied, Bestellzettel aufs Dorfbrett, Fell auf Pixel an der Brücke | drei Ziegen | geht; Fell über das Pixel-Feld der Leiste ging nicht (GD-W1-03), nur über die Figur |
| R4a | Reihenfolge klein, mittel, groß | `W1_R04_A_GELOEST` | geht |
| R4b | Max klickt das Schild (vorlesen), Pixel je zweimal beide Ziegen | `W1_R04_B_GELOEST` | geht, Weg dahin unklar (GD-W1-12) |
| R4c | voller Eimer auf Waldemar | `W1_R04_C_GELOEST` | geht |
| R7 | Waldemar Option 0290, dann Zauberwald betreten | Socke voller Pollen | geht; Szene lief ohne sichtbare Akteure (R5-W1-17, Film steht aus) |
| R6a | Ei (Laute spielen), Leuchtpilz, Krug an der Schmiede-Ziege füllen, alles in den Kessel | `W1_R06_A_GELOEST` | geht; leerer Krug täuscht Erfolg vor (R5-W1-20) |
| R6b | Flasche 3 auf den Kessel | Leuchttrank, Zeugnis | geht |
| R9 | Zeldina nach der Maklerin fragen, dann Maklerin „Ich hätte da ein Objekt.“ | `W1_R09_GELOEST`, Zeldina folgt | geht |
| R10 Weg A | Leuchttrank auf Grimmzahn → Tarifvertrag; Ketchup | **nicht lösbar** (GD-W1-K1) | blockiert |
| R10 Weg B | Grimmzahn Option 0390 mit Zeldina | `W1_R10_B_GELOEST`, Lied | geht (auch nach abgegebenem Leuchttrank) |
| R11b | Pixel klickt drei Kreuzungen, Max die Kammertür | `W1_R11_B_GELOEST` | geht |
| R12 | Schwerter→Humbert, Fackeln→Grimmzahn, Kronleuchter→Zeldina | Drachenei | geht |
| R11a | Geheimtür: Mo, Knuddel, Puddi, Bärchen | `W1_R11_A_GELOEST` | geht; Optionen stehen schon in Lösungsreihenfolge (R5-W1-29) |
| R13 | Socke, dann Kochlöffel auf Moderwort, dann Klick auf Moderwort | `W1_R13_GELOEST`, Zwischenspiel 1 | geht |
| ZS1 | Drehknopf → Packen (Socke, Dosenöffner) → „Fertig gepackt“ → Drehknopf | Welt 2, Nil-Delta | geht |

Spielzeit des geraden Durchlaufs mit allen Nebenproben: rund 10 000 Spielsekunden bei Tempo 4 (keine Zeitmessung, die folgt in Tempo 1).

## Funde: übergreifend (alle Räume)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-K1 | zauberwald (Ursache dorfplatz) | kritisch | Durchspielbarkeit | **Bestätigt mit echtem Stand ab Prolog-Ende.** Vor der Bestellung steht Rotkäppchen bei (0, 0), nach der Lieferszene bei (1270, 290). Der Zauberwald ist 1066 px breit; bei größter Kamera (x 426) liegt ihre Klickfläche bei Bild-x 829–858, also außerhalb. Sie spricht aus dem Off (`W1_WALD_ROT_0740`), Klick auf den Ketchup bringt `W1_WALD_MAX_0730`. Folge: Nach „Leuchttrank auf Grimmzahn“ hat Max den Tarifvertrag, kann ihn aber nie unterschreiben. Weg B (Zeldina) funktioniert, die Welt ist also durchspielbar; Weg A ist tot. | `belege/pr-w1/GD-W1-K1_wald_rechter_rand_ohne_rotkaeppchen.png`; `lies C.get_character("Rotkaeppchen").position` vor/nach Lieferung; `status` im Zauberwald: „Rotkaeppchen bei Raum (1270,290) … Raumbreite 1066“; `objekte`: „x 829–858 (außerhalb des Bildes)“; Stand `w33_bergwerk_vor_R10`, dann `klick inv:leuchttrank`, `klick @grimmzahn` → `+ tarifvertrag` | Rotkäppchen beim Betreten des Zauberwalds auf einen festen Platz am Lieferkarren setzen (Raum-x um 800) statt die Dorfplatz-Position zu behalten. |
| R5-W1-34 | alle (Speichern und Laden) | kritisch | Durchspielbarkeit / Technik | **Nach Beenden und Laden hängt jedes Gespräch, das vor dem Speichern schon einmal geöffnet war.** Echter Rundlauf: Stand `w00_anfang`, mit Toadi reden (5 Optionen, „Ich muss weiter.“), F5, Spiel beenden, neu starten, Hauptmenü → Laden → Schnellspeicher, Toadi anklicken: „GESPRÄCH beginnt: Toadi“, dann kein Menü, Zeiger bleibt Sanduhr, `G.blocked=true`, Esc und Klicks wirkungslos. Dasselbe mit Platz 12 (Bergwerk, Stand `w33`): Grimmzahn und Zeldina hängen, R10 ist damit nach einem Neustart nicht mehr lösbar. Im selben Programmlauf geladen tritt es nicht auf, deshalb fiel es bisher nicht auf. Aus dem Code und dem Speicherstand: Der Spielstand speichert je Gespräch `_has_done_init: true` (z. B. `popochiu.dialogs.Grimmzahn`), weil `PopochiuResources.store_properties` alle Skript-Variablen sichert (`addons/popochiu/popochiu_resources.gd` Z. 497–518). Beim Laden setzt `_load_state` (`popochiu_save_load.gd` Z. 213–224) den Wert auf die frische Ressource, deren `options` noch leer sind; `build_options()` (`popochiu_dialog.gd` Z. 204–212) kehrt dann sofort zurück, das Menü bekommt eine leere Liste (`lies D.current_dialog.options` = `[]`). Auch die gespeicherten „schon gewählt“-Marken gehen so verloren (`_load_dialog_options` läuft über die leere Liste). | `belege/pr-w1/R5-W1-K2_dorf_toadi_gespraech_haengt_nach_f5_neustart_laden.png`, `belege/pr-w1/R5-W1-K2_bergwerk_gespraech_ohne_optionen_nach_laden.png`; Befehlsfolge: `stand holen w00_anfang`, `klick @toadi`, `option 0610`, `taste f5`, `fs stop`, `fs start`, `knopf "3   Laden"`, `klick 119 285`, `klick @toadi` → `STEHT seit 20 Spielsekunden … G.blocked=true dialog=Toadi`; `lies D.current_dialog._has_done_init` = true, `…options.size()` = 0; Speicherstand `kontrollpunkte/welt-1/w33_bergwerk_vor_R10.json` (Schlüssel `popochiu.dialogs.*._has_done_init`) | `_has_done_init` nicht speichern (in `_load_state` für Gespräche überspringen wie `options`) und beim Laden `build_options()` vor `_load_dialog_options` erzwingen; zusätzlich das Sicherheitsnetz aus `cq_dialog.gd` (leeres Menü beendet das Gespräch) schon beim ersten Anzeigen anwenden. Test: speichern, Prozess neu starten, laden, jedes Gespräch öffnen. |
| GD-W1-01 | alle Gespräche und Auswahlmenüs | wichtig | Sonstiges (Oberfläche) | **Weiterhin offen, in Tempo 1 nachgestellt.** 5 Optionen: 4 ganz, eine halb (Toadi). 4 Optionen: die vierte halb (Geheimtür: „Bärchen“). 3 Optionen: die dritte halb (Toadi, Maklerin, Grimmzahn). 1 Option (Schmied „Bis dann.“, Maklerin 0470): Feld bleibt so hoch wie vorher, die Zeile ist „erst nach Rollen sichtbar“ (einmal 40 Rollschritte). Am Brunnen braucht die **richtige** Antwort zwei Rollschritte. Das Menü verdeckt außerdem die Füße der Sprecher. Aus dem Code: `dialog_menu.gd` setzt die Höhe 0,1 s nach dem Aufbau auf `min(Summe der Zeilenhöhen, max_height = 112)`, ohne die Ränder (4 + 4 px) mitzuzählen, und `remove_options` setzt die alte Höhe erst ein Bild später zurück. | `belege/pr-w1/GD-W1-01_toadi_5optionen_tempo1.png`, `…_toadi_3optionen_tempo1.png`, `…_schmied_1option_feld_zu_hoch.png`, `…_grimmzahn_3optionen.png`, `belege/pr-w1/R5-W1_geheimtuer_optionen_in_loesungsreihenfolge.png`; `optionen` meldet „(erst nach Rollen sichtbar)“ bei Humbert, Gollo, Grimmzahn, Waldemar, Zeldina, Maklerin | Höhe = Zeilen + Ränder, bis sechs Zeilen ohne Rollen; nach jedem Neuaufbau zuerst zurücksetzen. |
| GD-W1-03 | alle | wichtig (vorher kosmetisch) | Sonstiges (Oberfläche) | **Bestätigt und schwerer als gemeldet.** Ab 12 Gegenständen liegt das Pixel-Feld der Leiste bei (72–92, 24) unter dem Pixel-Porträt. `klick inv:PixelFeld` mit dem Fell in der Hand traf das Porträt: „FIGUR jetzt Pixel“ statt „Fell auf Pixel“. R3 ließ sich so nur über die Figur im Raum lösen. Bei 13 Gegenständen ist das Feld ganz verdeckt. | `belege/pr-w1/GD-W1-03_leiste_13_gegenstaende_pixelfeld_verdeckt.png`; Verlauf: `klick inv:ziegenfell_vorleger`, `klick inv:PixelFeld` → „Oberfläche @TextureButton@16“, „FIGUR jetzt Pixel“; `inv`: „inv:PixelFeld bei (72,24)“ | Leiste rechts neben den Porträts beginnen, bei vielen Gegenständen blättern. |
| GD-W1-04 | alle | kosmetisch (tritt oft auf) | Sonstiges (Bedienung) | **Bestätigt, im Durchlauf über zwanzigmal.** Pixels Zuruf nach 45 Spielsekunden ohne Eingabe ist stehender Text; der nächste Klick (Ausgang, Gegenstand in der Leiste, Pfote, Porträt) schaltet nur weiter und geht verloren. Folgefehler: Der Klick auf den Krug in der Leiste ging verloren, der nächste Klick auf den Kessel lief ohne Gegenstand (Ersatzzeile). | Verlauf Spielzeit 6381–6385: `klick inv:krug` → nur `W1_HOGG_PIX_0920_2`, `klick 196 200` → `SYS_ERS_MAX_0240`; ebenso 8323 (`klick` Schwerter-Bündel → nur `W1_SMAU_PIX_0800_2`) | Zuruf nicht blockierend zeigen (Sprechblase läuft aus) oder Klick zugleich als Aktion werten. |
| R5-W1-01 | bergwerk bis thronsaal | wichtig | Hinweise | **Die Pfote bleibt nach R10 auf R10 stehen.** Nach „Leuchttrank auf Grimmzahn“ und Lösung über Weg B führt das Spiel R10a weiter als offen (`status`: „Offene Rätselschritte: R10a, R11b“, später „R10a, R13“). Die Pfote gibt im Bergwerk, im Turmkeller (R11b offen) und im Thronsaal (R13 offen) nur R10-Hinweise, bis Stufe 3: „Gib Grimmzahn den Leuchttrank und unterschreib den Vertrag mit Ketchup. Oder biete ihm … den Hausmeisterposten an.“ Zu den Besen, zur Geheimtür und zu Moderwort kommt kein Hinweis. Ob das auch ohne abgegebenen Leuchttrank so ist, wird noch geprüft. | Verlauf 7856 (Bergwerk, `W1_HINT_PIX_1010`, dreimal Stufe 1), 8112 (Turmkeller, `W1_HINT_PIX_1020`), 8760–8768 (Thronsaal, `W1_HINT_PIX_1030` dreimal); Stände `w34`, `w35`, `w40` | R10 als Ganzes schließen, sobald ein Weg gelöst ist; offene Schritte nach Raum und Fortschritt ordnen. |
| R5-W1-02 | dorfplatz, alle | wichtig | Hinweise | Die Pfote sagt „Gerade ist nichts offen. Geh irgendwohin, wo du noch nicht warst …“ (`W1_HINT_PIX_0010`), wenn kein Rätsel eines **besuchten** Raums offen ist: direkt bei Weltbeginn, nach R8, nach R4. Gerade dann weiß ein Spieler nicht weiter. Ein Ziel (Ei, Turm, Prinzessin) nennt sie nie. | Verlauf 19.2 (Weltbeginn), 2618 (nach R8); `status`: „Offene Rätselschritte (laut Spiel): -“ | Statt „nichts offen“ das Weltziel und einen noch nicht besuchten Ort nennen („Wir brauchen ein Ei. Frag im Dorf herum, die Taverne hat offen.“). |
| R5-W1-03 | trollbruecke, klassenzimmer | kosmetisch | Hinweise | Hinweise kennen den Teilstand nicht (gleiches Muster wie GD-W1-11): R4a Stufe 1 „Lies das Brückenschild. Ganz.“ kommt, nachdem es gelesen ist; R6a Stufe 1 nennt Ei, Milch und Leuchtpilz, bevor Alwin das Rezept verraten hat; R7 Stufe 2 sagt „Mit der Socke in der Hand“, die Socke muss aber nicht in der Hand sein. | Verlauf: `W1_HINT_PIX_0411` nach `NAHANSICHT` der Satzung; `W1_HINT_PIX_0611` vor `W1_REZEPT_BEKANNT`; `W1_HINT_PIX_0720`, R7 gelöst mit `H:-` | Je Schritt eine Bedingung „schon erledigt“ prüfen und die nächste Stufe nehmen. |
| R5-W1-04 | taverne, schmiede, dorfplatz, luftschloss, abstellkammern | wichtig | Positionierung | Max stellt sich beim Ansprechen in oder hinter die Figuren. Luftschloss, Gespräch mit der Maklerin: Max steht bei (1006, 262) genau hinter Zeldina (1010, 268), von der Spielfigur ist nur das Haar zu sehen. Taverne nach R1c: Max und Pixel am selben Punkt (247, 264), über Gollo. Schmiede: Max (376, 241) halb hinter dem Schmied (330, 242). Dorfplatz: Max (691) in Toadi (720). Abstellkammern nach R12: Max (332, 324) in Grimmzahn (312, 324). | `belege/pr-w1/R5-W1_luftschloss_max_hinter_zeldina_menue_3optionen.png`, `belege/pr-w1/R5-W1-02_taverne_max_pixel_gollo_uebereinander.png`; `status`-Zeilen „Figuren im Raum“ | Gesprächsplätze je Figur so setzen, dass Max frei steht (mindestens halbe Figurenbreite Abstand, nicht hinter einer zweiten Figur). |
| R5-W1-05 | bergwerk, luftschloss, thronsaal | kosmetisch | Timing / Positionierung | Figuren sprechen von außerhalb des Bildes oder ohne im Raum zu sein. Bergwerk: Grimmzahns „STREIK!“ beim Betreten (er steht bei x 960, Kamera 0). Luftschloss: „Besichtigung läuft!“ der Maklerin (x 965, Kamera 0). Bergwerk R10: Zeldina bürgt („Ich.“) von x 148 bei Kamera 596. Luftschloss nach R9 und Thronsaal am Ende: Toadi spricht (`W1_LUFT_TOA_0600`–`0640`, `W1_THRO_TOA_0540`), ist aber laut `status` nicht im Raum (`C.get_character("Toadi").room` = freigegeben). Ob er in der Szene kurz eingeblendet wird, zeigt erst der Film in Tempo 1. | Verlauf 6918 (Maklerin), 7806 (Zeldina), 7252–7257 und 8890 (Toadi); `status` jeweils ohne Toadi | Kamera vor der Zeile zum Sprecher fahren oder die Zeile erst auslösen, wenn er im Bild ist; Toadi in beiden Szenen wirklich hereinlaufen lassen. |
| R5-W1-06 | Nahansichten (Satzung, Hinweiszettel, Zeugnis) | wichtig | Nahansicht | Die Schrift der Nahansichten ist bei B, Z und 5 nicht lesbar: „Zeugnis“ liest sich „2eugnis“, „Besenflug“ „6esenflug“, „Bosheit“ „6osheit“, die Note 5 wie „S“. Auf dem Zeugnis ist die rätselwichtige Zeile „Für meinen Mo-Knuddel, stolz!“ die kleinste und läuft rechts über den Rahmen. Der Hinweiszettel setzt die Verse als Fließtext mit zufälligen Umbrüchen und nutzt dasselbe Papierbild wie Opas Zettel. | `belege/pr-w1/R5-W1_zeugnis_de_schrift.png`, `…_zeugnis_de_mo_knuddel_ausschnitt.png`, `belege/pr-w1/R5-W1_satzung_de_schrift.png` | Schrift mit eindeutigem B, Z, 5 (oder die drei Zeichen in der Schriftdatei nachzeichnen); Mutti-Zeile größer und in den Rahmen; Hinweiszettel in Verszeilen setzen. |
| R5-W1-07 | viele | kosmetisch | Hinweise | Naheliegende Klicks ohne eigene Zeile (Ersatzzeile): Toadi ansehen; Pixel anklicken oder ansehen (X-08 weiterhin offen); Ring-Laden benutzen (W1-02 weiterhin offen); Dorfbrett, Stall, Kochgeschirr, Kellertür, Lieferkarren, Goblin 1 und 2, Streikposten benutzen; Alter Baum benutzen (W1-12 weiterhin offen); Flasche 1 ansehen; Kessel ohne Gegenstand; Fondue auf den Stabmacher; Zeldina ansehen außerhalb des Luftschlosses; Kram in Kammer 1 benutzen; Drachenei vor R12 nehmen. | Verlauf: jeweils `ERSATZZEILE (MAX) SYS_ERS_MAX_…` nach dem Klick, z. B. 7515 (`rklick @zeldina` auf dem Dorfplatz), 8233 (Kram), 8462 (Drachenei) | Wenigstens für Drachenei („Smaugi sitzt drauf. Erst muss hier Platz werden.“), Kessel, Goblins und Zeldina eigene Zeilen. |

## Funde: Dorfplatz

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-07 | dorfplatz | kosmetisch | Hinweise | Bestätigt: leerer oder voller Eimer auf den Erdfleck vor der Bohne → Ersatzzeile. | Verlauf: `klick inv:eimer`, `klick @erdfleck` → `SYS_ERS_MAX_0200` bzw. `_0080` | wie gd-w1 |
| GD-W1-08 | dorfplatz, trollbruecke, wasserschloss | kosmetisch | Hinweise | Bestätigt: Linksklick mit Max auf XXL-Ziege oder Schwan → „Miau? Miau.“ (`W1_WECH_MAX_0100`). | Verlauf: `klick @xxl_ziege` → `W1_WECH_MAX_0100` | wie gd-w1 |
| GD-W1-10 | dorfplatz, trollbruecke | wichtig | Positionierung | Bestätigt: Die XXL-Ziege steht auf dem Dorfplatz vor dem Schmiede-Eingang; an der Brücke verdeckt sie bei der Ankunft das Schild ganz (Schild gewinnt 22 von 36 Probestellen), nach R4a und nach R4 steht sie mitten auf der Brücke und verdeckt Max ganz und Waldemar zum größten Teil. | `belege/pr-w1/GD-W1-10_dorf_xxl_vor_schmiede.png`, `…_bruecke_xxl_verdeckt_schild.png`, `…_bruecke_max_hinter_xxl.png` | Ziege kleiner skalieren oder feste Plätze neben Schild und Brücke. |
| R5-W1-08 | dorfplatz, trollbruecke | wichtig | Klickflächen | Die XXL-Ziege ist nur auf einem 29 px breiten Streifen anklickbar (`objekte`: x 433–462), das Bild ist rund 160 px breit. `maus 385 210` und `maus 500 240` mitten auf der Ziege treffen „Schmiede“. Für R4a und R4b muss man sie anklicken. | Verlauf: `objekte` auf dem Dorfplatz nach der Lieferung; `maus 385 210` → „schmiede_von_aussen“ | Klickfläche auf die Bildbreite der Ziege bringen. |
| R5-W1-09 | dorfplatz | kosmetisch | Grafik | Tavernenschild und Aufsteller vor dem Ring-Laden sind leer (leere Holzfläche). Nach R1a sagt Pixel, Minka sitze im Stall; im Stall ist nur Stroh und ein Huhn. | `belege/pr-w1/R5-W1_dorf_tavernenschild_leer_stall_ohne_minka.png` | Schild beschriften oder mit Bild (Krug); Minka als kleines Prop in den Stall. |
| R5-W1-10 | dorfplatz | kosmetisch | Zustandswechsel | Die Bestellung der XXL-Ziege geht, bevor Max je an der Brücke war; Max sagt trotzdem „Der Troll will aber drei“ (`W1_DORF_MAX_1010`). Die Nehmen-Zeile des Eimers ist dieselbe wie die Ansehen-Zeile (`W1_DORF_MAX_0350`). | Verlauf: Stand `w13_vor_bestellung`, Bestellzettel aufs Dorfbrett vor dem ersten Brückenbesuch | Zeile an „Brücke besucht“ binden, sonst neutral („Eine Ziege hab ich. Schaden kann eine zweite nicht.“). |
| R5-W1-11 | zauberstab_laden | wichtig | Positionierung / Technik | Beim zweiten Betreten des Zauberstab-Ladens stand Pixel bei (769, 267), der Raum ist 640 px breit: Der Kater ist nicht zu sehen und bleibt dort. Erst nach Wechsel zu Pixel bringt ihn ein Bodenklick herein. Ursache noch nicht untersucht (Verdacht: Pixel wird relativ zu Max' Ankunftspunkt gesetzt, ohne Raumgrenze). Wird noch einmal nachgestellt. | Verlauf: Raumwechsel in den Laden, `status`: „Pixel bei Raum (769,267)“, `objekte`: „(außerhalb des Bildes)“ | Pixels Ankunftsplatz auf die begehbare Fläche klemmen. |
| R5-W1-12 | dorfplatz, trollbruecke, bergwerk | kosmetisch | Zustandswechsel | Zeldina „folgt“ nach R9 als feste Figur je Raum. Auf dem Dorfplatz: Ansehen → Ersatzzeile; Ansprechen → „Wir haben alles besprochen. Ich muss packen.“ (`W1_ABS_ZEL_0010`), obwohl sie eben „Du vorne. Ich trage.“ gesagt hat. An der Brücke steht sie vor dem Schild. Toadi steht zugleich weiter auf dem Dorfplatz und im Klassenzimmer, auch nachdem er Zeldina im Luftschloss „gefunden“ hat. | Verlauf 7515–7527; `belege/pr-w1/` folgt (Foto `w54`, `w55`) | Zeile für unterwegs („Geh ruhig vor. Der Karton wird nicht leichter.“); Toadi nach R9 neben Zeldina oder weg. |

## Funde: Taverne

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-02 | taverne | kosmetisch | Humor / Zustandswechsel | (b) bestätigt und erweitert: Nach R1 bietet Humbert weiter die Schicksalsberg-Option 0570 an und wiederholt 0580–0582, obwohl er eben gesagt hat, den Wein habe es nie gegeben. (a) Zuruf 1620 nach R1a nicht eigens geprüft. | Verlauf: Humbert nach `w06_nach_R1`, `option 0570` | wie gd-w1; Option 0570 nach R1b ausblenden. |
| GD-W1-09 | taverne | kosmetisch | Hinweise | Bestätigt: Fondue-Topf nach R1a und R1b → Ersatzzeile „Nein.“ (`SYS_ERS_MAX_0010`). | Verlauf ab `w05_vor_R1c`: `klick @fondue_topf` | wie gd-w1 |
| R5-W1-13 | taverne | kosmetisch | Zustandswechsel | Ansehen des Eis, solange Berta noch im Korb sitzt: „Berta zetert vom Dachbalken. Ich hab's verdient.“ (`W1_TAV_MAX_1430`) und Pixel „… nicht mit Kesseln“ (`_1450`). Die Zeile gehört zum Zustand nach der Laute. | Verlauf: `rklick @ei` vor `W1_BERTA_WEG` | Ansehen-Zeile an `W1_BERTA_WEG` binden; vorher: „Ein Ei. Mit Huhn drauf. Das Huhn sieht mich an.“ |

## Funde: Schmiede

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-15 | schmiede, trollbruecke | kosmetisch | Hinweise | noch nicht nachgestellt | | |

Melken: zweiter Versuch bringt eine eigene Zeile (`W1_SCHM_MAX_0490`), gut. Ob beim Melken etwas zu sehen ist, zeigt erst der Film.

## Funde: Troll-Brücke

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-11 | trollbruecke | wichtig | Hinweise | Bestätigt: Pfote R3 Stufe 1 „… und wir haben null“ mit zwei Ziegen im Raum. | Verlauf ab `w15_bruecke_erstmals`: `pfote` → `W1_HINT_PIX_0310`; `status`: SchmiedeZiege und XxlZiege im Raum | wie gd-w1 |
| GD-W1-12 | trollbruecke | wichtig | Rätsel / Hinweise | Bestätigt: Pixel auf eine Ziege vor dem Vorlesen → `W1_WECH_PIX_0110` („Ich rede nicht mit Menschen …“); Pfote danach `W1_HINT_PIX_0412`, nach dem Vorlesen weiter Stufe 2 `W1_HINT_PIX_0422`. | Verlauf ab `w18_nach_R4a` | wie gd-w1 |
| GD-W1-13 | trollbruecke | kosmetisch | Timing / Zustandswechsel | Bestätigt: `W1_BRUE_MAX_0190` zu Beginn jedes Gesprächs mit Waldemar und bei „leerer Eimer auf Waldemar“. Zusatz: Die Zeile sagt „Da sitzt ein Troll“, Waldemar steht. | Verlauf ab `w16_vor_R3_fell` | wie gd-w1; „Da steht ein Troll“. |
| GD-W1-14 | trollbruecke | kosmetisch | Zustandswechsel | Bestätigt: nach R4 bleiben 0210/0230/0270; 0210 → `W1_BRUE_WAL_0220`. | Verlauf ab `w21_nach_R4` | wie gd-w1 |
| R5-W1-14 | trollbruecke | kosmetisch | Humor / Timing | Waldemar sagt „Ich lese es dir nicht vor“ (`W1_BRUE_WAL_1230`) und sagt dann, sobald die Nahansicht zu ist, die Paragrafen selbst auf (`W1_BRUE_WAL_0040`–`0060`). | Verlauf: Klick auf das Schild, `taste esc` | Eine der beiden Stellen streichen oder verbinden („Ich lese es dir nicht vor. … Na gut. Paragraf eins.“). |

## Funde: Zauberwald und Wasserschloss

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W1-15 | zauberwald | kosmetisch | Zustandswechsel | Leuchtpilz ansehen oder nehmen, bevor Max bei Alwin war: „Alwin hat ‚ein Leuchtpilz‘ gesagt“ (`W1_WALD_MAX_0030`). | Verlauf: Stand `w22_wald_erstmals`, Klick Leuchtpilze, `W1_REZEPT_BEKANNT` nicht gesetzt | Vor dem Rezept: „Die leuchten. Einen nehm ich mit, so was braucht man hier bestimmt.“ |
| R5-W1-16 | zauberwald | kosmetisch | Positionierung | Beim Betreten von links steht Pixel bei (292, 220) mit Skala 0,50, weit weg von Max (20, 268) und oberhalb des Wegs. | `status` nach dem Raumwechsel (Spielzeit 8294) | Pixels Ankunftsplatz neben Max. |
| R5-W1-17 | zauberwald | wichtig | Timing / Positionierung | **R7, die Gesangsnummer, findet außerhalb des Bildes statt (in Tempo 1 gefilmt).** Nach Option 0290 ist Waldemar sofort von der Brücke weg. Beim Betreten des Zauberwalds läuft die ganze Szene, während Max am Eingang (20, 268) steht und die Kamera bei x 0 bleibt: Waldemars Lied, „Die Rosen öffnen sich eine nach der anderen. Eine rosa Wolke steigt auf.“, Max' „Rotkäppchen klatscht, und Toadi weint“. Zu sehen sind nur Max, der alte Baum und Pilze; Niesrosen (Raum-x 674–754), Waldemar, Rotkäppchen und Toadi liegen rechts außerhalb. Waldemars Liedzeilen kleben am rechten Bildrand. Danach sind nur Rotkäppchen, Max und Pixel im Raum. Die Socke muss nicht in der Hand sein. | `belege/pr-w1/R5-W1-17_R7_gesang_bogen.png` (12 Bilder aus 598, 5 Bilder/s, Tempo 1, `textmodus lesen`); Befehle: `stand holen w24_waldemar_singt`, `film an r7 5`, `klick 615 210` | Zu Beginn der Szene Max zu den Niesrosen laufen lassen (Kamera folgt), Waldemar und Toadi dort sichtbar aufstellen, Bewegung `musical` und das Öffnen der Rosen zeigen, erst danach die Zeilen. |

## Funde: Hoggelwarz (Klassenzimmer)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W1-20 | klassenzimmer | wichtig | Rätsel / Technik | **Der leere Krug täuscht Erfolg vor.** Leerer Krug auf den Kessel: Max sagt „Milch rein. Der ganze Krug.“ (`W1_HOGG_MAX_0520`), Pixel beschwert sich über die verschüttete Milch (`W1_HOGG_PIX_0530`), aber `W1_KESSEL_MILCH` wird nicht gesetzt und der Krug bleibt leer im Inventar. Der Spieler glaubt, die Zutat sei drin. Aus dem Code: `hotspot_kessel.gd` Z. 25 lässt den leeren Krug an `super(item)` durchfallen, und der Bauplan-Eintrag `gegenstand_auf` für den Krug (`daten/raeume/welt-1.json`, um Z. 3365) hat keine Zustandsbedingung. | Verlauf: Stand `w27_kessel_ei_pilz`, `klick inv:krug`, `klick 196 200` → 0520, 0530, kein `ZUSTAND`; `inv` danach mit krug | Eigene Zeile für den leeren Krug („Leer. Alwin will Milch, keine Luft.“) und die Milch-Zeilen nur mit `mit_ziegenmilch`. |
| R5-W1-21 | klassenzimmer | wichtig | Grafik / Positionierung | Im Raum stehen zwei Kessel: einer gemalt im Hintergrund (grüner Sud, Feuer) und einer in Alwins Figurenbild, den er rührt. Max stellt sich zum Benutzen bei (195, 249) genau in Alwins Kessel: Der Kessel liegt über seinen Beinen, in manchen Bildern scheinen die Jeans durch. | `belege/pr-w1/R5-W1_klasse_max_im_kessel_zwei_kessel.png` | Einen Kessel streichen (den im Hintergrund), Max' Benutzen-Platz links neben den Kessel. |
| R5-W1-22 | klassenzimmer | kosmetisch | Timing | Nach der richtigen Flasche stehen Leuchttrank und Zeugnis schon im Inventar, bevor Alwin sagt, dass er das Zeugnis holt (`INVENTAR + zeugnis` vor `W1_HOGG_ALW_0820`). Pixel beschnuppert Flaschen, ohne hinzulaufen (noch zu filmen). | Verlauf 6763–6773 | Zeugnis erst nach Alwins Zeile übergeben. |

Gut hier: falsche Flasche (Pilz, „Familie?“), Flasche zurückstellen und tauschen, Pixels zwei Schnupperproben mit Lüge bei Flasche 4 und die Sperre nach zwei Proben haben eigene Zeilen.

## Funde: Luftschloss

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W1-23 | luftschloss | wichtig | Technik / Humor | Am Ende der R9-Szene sagt Pixel seinen Hinweis auf die Kritzelei zweimal hintereinander (`W1_LUFT_PIX_0485` und `_0485_2` bei 7258 und noch einmal bei 7261). | Verlauf 7258.4–7262.7 | Doppelten Aufruf entfernen (einmal in der Szene, einmal im Gesprächsende). |
| R5-W1-24 | luftschloss | kosmetisch | Nahansicht | Pixel sagt „Wo die Maklerin stand, hat jemand an die Wand gekritzelt“. Die Kritzelei ist von Anfang an links neben der Maklerin zu sehen und hat ihre Klickfläche (Raum-x 866–928, Maklerin 946–983). In der Nahansicht liegt der Torbogen rechts von der Kritzelei, im Raum links. | `belege/pr-w1/R5-W1_kritzelei_nahansicht_bogen_rechts.png`; `objekte` im Luftschloss vor R9 | Maklerin vor die Kritzelei stellen oder die Zeile ändern; Nahansicht spiegeln. |
| R5-W1-25 | luftschloss | kosmetisch | Rätsel | Eine falsche Antwort bei der Maklerin beendet das Gespräch; für jeden Versuch muss man sie neu anklicken. Vor der Freischaltung durch Zeldina sagt die Maklerin bei jedem Klick nur „Besichtigung läuft!“ (kein Hinweis, dass Zeldina der Weg ist; den gibt nur Max' Ansehen-Zeile nicht). | Verlauf 6991, 7178–7181 | Nach einer falschen Antwort im Menü bleiben. |

## Funde: Bergwerk

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W1-26 | bergwerk | wichtig | Rätsel / Zustandswechsel | Weg A hinterlässt Reste: Der Leuchttrank ist abgegeben, der leere Tarifvertrag bleibt bis zum Ende im Inventar (er verschwindet erst beim Drehknopf im Zwischenspiel), und Grimmzahn sagt nach Weg B nichts mehr zum Vertrag. Zusammen mit GD-W1-K1 heißt das: Wer zuerst den naheliegenden Weg A geht, steht vor einer Aufgabe, die das Spiel nie auflöst. | Verlauf 7716–7724, `inv` bis `w44` mit tarifvertrag | Nach Weg B den Vertrag zurücknehmen lassen („Den brauch ich nicht mehr. Ich hab jetzt einen Schlüsselbund.“). |

Weiterhin offen aus früheren Reviews: alle Figuren auf einer Bodenlinie (W1-17).

## Funde: Dunkler Turm (Turmkeller, Abstellkammern, Thronsaal)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W1-27 | turmkeller | wichtig (Verdacht, Film steht aus) | Animation | R11b: Nach Pixels Klick auf eine Kreuzung steht Pixel im Foto weiter neben Max an der Kammertür (510, 239), nicht an der Kreuzung; Haare am Boden sind nicht zu sehen, die Besen laufen weiter ihre Routen. Nach dem Türklick sind die Besen weg. Ob Pixel hinläuft und die Besen sichtbar in die Kammer fegen, wird in Tempo 1 gefilmt. Max läuft vorher quer durch die Besen, ohne dass etwas passiert, obwohl er sagt „Er fegt alles, was sich bewegt“. | Fotos `w61_kreuzung1`, `w62_nach_kreuzungen`, `w63_nach_tuer` (Lauf-Ordner); `belege/pr-w1/R5-W1_turmkeller_anfang.png` | Pixel zur Kreuzung laufen und sich schütteln lassen, Haarbüschel als Prop, Besen laufen der Spur nach in die Tür. |
| W1-20 | abstellkammer_1 | wichtig | Grafik / Klickflächen | **Weiterhin offen (W1-20 vom 17.11.).** In Abstellkammer 1 sind keine Besen zu sehen. Die Klickfläche „Besen“ (x 290–520, y 246–300) liegt auf leerem Boden; Max sagt „Die Besen fegen Smaugis Kram zu Stapeln und ignorieren mich“. Auch das Schild „Eigentum Smaugi, Kammer 1 von 6“ ist eine leere Holztafel. | `belege/pr-w1/R5-W1_kammer1_keine_besen_sichtbar.png`; Verlauf 8221 | Drei Besen als Props (gern mit Fege-Schleife) und Schrift aufs Schild. |
| R5-W1-29 | abstellkammern | wichtig | Rätsel | Die Geheimtür bietet die vier Passwort-Teile schon in der richtigen Reihenfolge an (Mo, Knuddel, Puddi, Bärchen). Viermal die oberste Zeile klicken löst das Rätsel; die vier Fundorte muss niemand kombinieren. Während der Eingabe sieht man nicht, was schon gewählt ist. Eine falsche Reihenfolge wird erst nach dem vierten Teil abgelehnt (`W1_SMAU_TUE_0730`). | `belege/pr-w1/R5-W1_geheimtuer_optionen_in_loesungsreihenfolge.png`; Verlauf 8640–8654 | Teile mischen (fest, nicht zufällig), gewählte Teile als Zeile über dem Menü zeigen („Mo-Puddi-…“). |
| R5-W1-30 | abstellkammern | wichtig | Positionierung | Humbert, Grimmzahn und Zeldina stehen in einer Reihe vor Smaugi und den Haufen. Smaugi ist zur Hälfte verdeckt, „Schwert im Stein“, Okarina und Goldhaufen liegen hinter Humbert und Grimmzahn. Humbert ist mit Skala 0,93 die größte Figur im Bild. | `belege/pr-w1/R5-W1_kammern_figuren_verdecken_smaugi.png` | Abnehmer links und rechts an die Wände, Smaugi frei in der Mitte. |
| R5-W1-31 | thronsaal | wichtig | Hinweise | Ein Klick auf Moderwort, den Endgegner, gibt vor und nach dem Niesen nur Ersatzzeilen („Ich könnte. Aber warum sollte ich?“, „Nicht mal mit Cheatcode.“). Erst nach Socke und Kochlöffel löst derselbe Klick das Ende aus. Mit GD-W1-K1-Folge R5-W1-01 gibt auch die Pfote hier keinen Hinweis. | Verlauf 8726 (`SYS_ERS_MAX_0040`), 8835 (`SYS_ERS_MAX_0160`), 8875 (Auflösung) | Gesprächszeilen je Phase („Er zaubert. Erst muss der Stab weg.“ / „Jetzt der Löffel.“). |

## Funde: Welt-Ende und Zwischenspiel 1

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W1-32 | dachboden (ZS1, Packen) | wichtig | Grafik | Der Dosenöffner hat im Pack-Fenster ein Platzhalterbild: grünes Feld mit „Dos“. | `belege/pr-w1/R5-W1_zs1_packen_dosenoeffner_platzhalter_reisetasche.png` | Inventarbild für den Dosenöffner. |
| R5-W1-33 | dachboden (ZS1, Packen) | kosmetisch | Sonstiges (Oberfläche) | Unter „Daneben liegt“ steht „Opas Reisetasche“ selbst als packbarer Gegenstand (Pixel dazu: Ersatzzeile `SYS_ERS_PIX_0130`). Der Zeiger ist im Pack-Fenster eine Sanduhr. Opas Zettel und der Tarifvertrag stehen nicht in der Liste und verschwinden erst beim Drehen. | Bild wie oben; Verlauf 9272, 9389–9390 | Reisetasche aus der Liste nehmen, normalen Zeiger zeigen. |

Gut hier: Pixels Pack-Kommentare zu Socke, Zeugnis, Eimer, Fell und Dosenöffner geben klare Hinweise; ein drittes Stück wird mit eigener Zeile abgelehnt; die Pfote sagt „Tasche packen, Knopf drehen“.

## Frühere Funde, Stand heute (bisher geprüfter Teil)

| Alte ID | Stand | Nachweis |
| --- | --- | --- |
| 14.11. Fund 6 (Gollo-Rätsel) | über die Thunfischdose lösbar; Option 0785 noch offen | Verlauf R1c |
| 14.11. Fund 7 (Minka am Topf) | behoben: Minka sitzt bei (192, 292) unter dem Topf, Text passt | `status` Taverne |
| 14.11. Fund 11 (Menü sechs Zeilen) | **weiterhin offen** → GD-W1-01 | siehe oben |
| 14.11. Fund 13 (Flasche tauschen) | behoben: `W1_HOGG_MAX_0946` / `0945` | Verlauf Klassenzimmer |
| 14.11. Fund 19 („anderes Schloss“) | behoben: Zeile im Wasserschloss vorhanden | Verlauf Wasserschloss |
| 14.11. Fund 21 (Leuchtpilze nehmen) | behoben: Klick nimmt einen Pilz | Stand `w23_wald_pilz` |
| 14.11. Fund 23 (Ankunft überspringen) | behoben: Esc überspringt, Zustand danach richtig, Nachtrag kommt später | Verlauf Weltbeginn |
| 17.11. W1-02 (Ring-Laden) | **weiterhin offen** → R5-W1-07 | Ersatzzeile |
| 17.11. W1-08 (Toadi in der Tür) | behoben: Toadi steht bei (470, 262) | `status` Klassenzimmer |
| 17.11. W1-12 (Alter Baum) | **weiterhin offen** → R5-W1-07 | Ersatzzeile |
| 17.11. W1-10 (Zeldina steckt in der XXL-Ziege) | behoben: an der Brücke Zeldina (158, 196), XXL-Ziege (338, 178); Zeldina steht jetzt aber vor dem Schild (R5-W1-12) | `status` Brücke, Spielzeit 8265 |
| 17.11. W1-17 (Bergwerk, eine Bodenlinie) | **weiterhin offen** | `status` Bergwerk: Goblins y 285–292 |
| 17.11. W1-20 (Besen-Hotspot auf leerem Boden) | **weiterhin offen**, siehe Tabelle Turm | `belege/pr-w1/R5-W1_kammer1_keine_besen_sichtbar.png` |
| 17.11. W1-21 (Rundbogen neben der Geheimtür ohne Klickfläche) | **weiterhin offen**: `objekte` in den Abstellkammern kennt rechts nur „Geheimtür“ (x 508–570) | `objekte`, Spielzeit 8948 |
| 17.11. W1-23 (Waldemar neben der Brücke) | behoben: Waldemar bei (395, 168) auf der Brücke | `status` Brücke |
| 17.11. X-08 (Pixel anklicken) | **weiterhin offen** → R5-W1-07 | Ersatzzeile |

Noch nicht nachgeprüft: 14.11. übrige Nummern; 17.11. W1-01, -03 bis -07, -09 bis -11, -13 bis -16, -18 bis -22, X-01 bis X-07, A-01 bis A-08; GD-W1-05, -06, -15.

## Nicht bestätigt

(noch leer)

## Gut gelöst

- Falsche Wünsche am Brunnen geben die Münze mit Gag zurück; kein Verlust möglich.
- Eigene Zeilen für viele falsche Versuche: Bach mit leerem Eimer, Zahnstocher und Fondue, Dose auf Gollo zu früh, zweites Melken, falsche Abnehmer bei Smaugi (`W1_SMAU_GRI_0650`, `W1_SMAU_ZEL_0660`), Kochlöffel auf Moderwort vor dem Niesen (`W1_THRO_MOD_0210`).
- Waldemar korrigiert eine falsche Ziegen-Reihenfolge (`W1_BRUE_WAL_0480`).
- Weg B bleibt offen, auch wenn der Leuchttrank schon abgegeben ist: keine Sackgasse durch GD-W1-K1.
- Abstellkammern nach R12: Raum ist aufgeräumt, Kronleuchter weg, Smaugi mit Staubwedel.
- Automatisches Speichern bei jedem Raumwechsel (`GESPEICHERT Platz 14/15/16`).

## Animationen

(folgt nach den Filmen in Tempo 1)

## Zeitmessungen

(folgen)

## Nicht geprüft

(wird am Ende ausgefüllt; Stand jetzt: siehe „Was noch aussteht“)

## Vorschläge für die Lessons Learned

(folgen)

## Werkzeug

- Erstes Gespräch eines Godot-Prozesses bei Tempo 4: Menü lag über dem oberen Bildrand (y −85), Optionen nicht anklickbar (von `pr-p` als R5-P-09 gemeldet). Abhilfe: erstes Gespräch in Tempo 1 öffnen.
- `@id`-Klicks dauern rund 8 s (36 Probestellen), Koordinaten-Klicks rund 2 s.
- Pixels Zurufe schlucken den nächsten Befehl der Fernsteuerung wie einen Spielerklick (GD-W1-04); vor wichtigen Klicks `warte`.
- `start welt-1` liefert einen Stand ohne Thunfischdose und Notizbuch; für R1c nicht brauchbar.
- `stand sichern` geht nicht in Gesprächen und Nahansichten („Spiel ist beschäftigt“).
- Eigener Kurzaufruf `/home/user/lauf/f.sh` (kürzt die Ausgabe; liegt außerhalb des Repos).
