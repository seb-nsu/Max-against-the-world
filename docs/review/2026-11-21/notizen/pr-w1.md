# pr-w1: Welt-Prüfer Welt 1 „Schwurbelstein“ (Fortsetzung in der Cloud, ab 25.11.2026)

**Stand: in Arbeit (25.11., gerader Durchlauf fertig, Sackgassen-Suche, Filme und Zeitmessung stehen aus). Wird nach jedem Block ergänzt und gesichert.**

- Rolle: Welt-Prüfer (Durchspieler, Level-, Game-Designer, Technical Artist, Gameplay-Scripter in einem Durchgang). Kürzel `pr-w1`.
- Umfang: Welt 1 vollständig, vom ersten freien Moment auf dem Dorfplatz bis zum ersten freien Moment in Welt 2 (einschließlich Welt-Ende, Übergang, Zwischenspiel 1).
- Geprüfter Commit: `04c5a79f` (Checkout `/home/user/Max-against-the-world`, Branch `claude/project-thread-me923s`).
- Wie geprüft: Fernsteuerung (`werkzeuge/cloud/fs`) ohne Testmodus, echte Klicks, Standard Tempo 4 und Textmodus `klick`. Lauf `/home/user/lauf/pr-w1-haupt` (Verlauf, Fotos, Stände). Anfang: echter Prolog-Endstand `kontrollpunkte/prolog/prolog_ende.json`.
- Kontrollpunkte: `kontrollpunkte/welt-1/` (`w00` bis `w44`, `welt1_ende.json`), Liste in `kontrollpunkte/welt-1/liste.md`.
- Vorgänger: `gd-w1.md` (Zwischenstand nach R1, R2, R3, R4, R5, R8). Dessen Funde stehen hier mit alter ID und sind neu nachgestellt.
- Alles in den Tabellen ist im laufenden Spiel beobachtet, außer wo „aus dem Code“ dabeisteht. „Verlauf“ meint `/home/user/lauf/pr-w1-haupt/verlauf.txt` (liegt nicht im Repo; die Befehlsfolge steht jeweils dabei).

## Stand der Arbeit

Erledigt: gerader Durchlauf, Lösungsweg als Befehlsdatei, Wiederholung vom echten Prolog-Endstand (siehe „Zeitmessungen“), Filme R7, Besen, Thronsaal und Welt-Ende, Pfote an Stichproben, Bestand der Animationen. Was offen geblieben ist, steht unter „Nicht geprüft“.

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
| GD-W2-03 (bei `pr-p`: R5-P-01) | dorfplatz, abstellkammern (gilt für alle Räume mit aufhebbaren Props) | kritisch | Speichern/Laden | **Für Welt 1 an zwei Stellen bestätigt: Wer in derselben Sitzung einen älteren Stand lädt, findet die inzwischen aufgehobenen Gegenstände nicht mehr.** Im Wiederholungslauf (ein Prozess, ganze Welt durchgespielt) danach (1) `prolog_ende` geladen: Auf dem Dorfplatz sind Eimer, Bestellzettel und Steckbrief unsichtbar und nicht im Inventar (Besitz: Dose, Pixel, Reisetasche, Notizbuch, Opas Zettel). Ohne Eimer und Bestellzettel sind R3, R4c und R5 nicht lösbar. (2) `l08_nach_R11b` geladen und die Wendeltreppe hochgegangen: Schwerter-Bündel und Fackel-Bündel sind unsichtbar und nicht im Inventar, R12 ist nicht lösbar. Geladen wurde mit `stand holen` (nutzt `Spielstand.speichern`/Laden auf Platz 12, also den Lader des Spiels); den Weg über das Lade-Menü hat `pr-p` als R5-P-01 belegt. **Kürzeste Nachstellung (zweiter Prozess, Lauf `pr-w1-haupt`):** `stand holen w36_kammern_anfang` (Bündel da), Klick aufs Schwerter-Bündel (im Inventar), `stand holen w36_kammern_anfang`: Bündel unsichtbar und nicht im Inventar, der Klick trifft den „Stapel“ dahinter. Im selben Prozess war danach in `w00_anfang` der Eimer unsichtbar, obwohl er in diesem Prozess nie aufgehoben wurde; vorher waren nur spätere Stände geladen, in denen Max ihn schon trägt. Es reicht also, erst einen späteren und dann einen früheren Stand zu laden. Ob ein Programmneustart vor dem Laden den Fehler vermeidet, habe ich nur für `w36` gesehen (Bündel beim ersten Laden im neuen Prozess sichtbar). | `belege/pr-w1/GD-W2-03_welt1_ruecksprung_dorf_ohne_eimer_kammern_ohne_buendel.png` (links Dorfplatz ohne Eimer am Brunnen, rechts Abstellkammern ohne Bündel); `belege/pr-w1/GD-W2-03_welt1_ruecksprung_protokoll_kurz_kammern.txt` (kürzeste Nachstellung), `belege/pr-w1/GD-W2-03_welt1_ruecksprung_protokoll.txt` (`objekte`: „(unsichtbar)“, `klick @eimer` → „Objekt eimer ist unsichtbar“); Befehle: Lösungsweg Block 1–9, dann `stand holen prolog_ende`, `objekte`, `klick @eimer`; `stand holen l08_nach_R11b`, `klick @treppe_nach_oben`, `objekte` | Beim Laden die Sichtbarkeit aller Props aus dem Stand neu setzen (auch für Räume, die in dieser Sitzung schon geladen waren), nicht nur für den aktuellen Raum. Test in die CI: Gegenstand nehmen, älteren Stand laden, Gegenstand muss wieder da sein. |
| GD-W1-01 | alle Gespräche und Auswahlmenüs | wichtig | Sonstiges (Oberfläche) | **Weiterhin offen, in Tempo 1 nachgestellt.** 5 Optionen: 4 ganz, eine halb (Toadi). 4 Optionen: die vierte halb (Geheimtür: „Bärchen“). 3 Optionen: die dritte halb (Toadi, Maklerin, Grimmzahn). 1 Option (Schmied „Bis dann.“, Maklerin 0470): Feld bleibt so hoch wie vorher, die Zeile ist „erst nach Rollen sichtbar“ (einmal 40 Rollschritte). Am Brunnen braucht die **richtige** Antwort zwei Rollschritte. Das Menü verdeckt außerdem die Füße der Sprecher. Aus dem Code: `dialog_menu.gd` setzt die Höhe 0,1 s nach dem Aufbau auf `min(Summe der Zeilenhöhen, max_height = 112)`, ohne die Ränder (4 + 4 px) mitzuzählen, und `remove_options` setzt die alte Höhe erst ein Bild später zurück. | `belege/pr-w1/GD-W1-01_toadi_5optionen_tempo1.png`, `…_toadi_3optionen_tempo1.png`, `…_schmied_1option_feld_zu_hoch.png`, `…_grimmzahn_3optionen.png`, `belege/pr-w1/R5-W1_geheimtuer_optionen_in_loesungsreihenfolge.png`; `optionen` meldet „(erst nach Rollen sichtbar)“ bei Humbert, Gollo, Grimmzahn, Waldemar, Zeldina, Maklerin | Höhe = Zeilen + Ränder, bis sechs Zeilen ohne Rollen; nach jedem Neuaufbau zuerst zurücksetzen. |
| GD-W1-03 | alle | wichtig (vorher kosmetisch) | Sonstiges (Oberfläche) | **Bestätigt und schwerer als gemeldet.** Ab 12 Gegenständen liegt das Pixel-Feld der Leiste bei (72–92, 24) unter dem Pixel-Porträt. `klick inv:PixelFeld` mit dem Fell in der Hand traf das Porträt: „FIGUR jetzt Pixel“ statt „Fell auf Pixel“. R3 ließ sich so nur über die Figur im Raum lösen. Bei 13 Gegenständen ist das Feld ganz verdeckt. | `belege/pr-w1/GD-W1-03_leiste_13_gegenstaende_pixelfeld_verdeckt.png`; Verlauf: `klick inv:ziegenfell_vorleger`, `klick inv:PixelFeld` → „Oberfläche @TextureButton@16“, „FIGUR jetzt Pixel“; `inv`: „inv:PixelFeld bei (72,24)“ | Leiste rechts neben den Porträts beginnen, bei vielen Gegenständen blättern. |
| GD-W1-04 | alle | kosmetisch (tritt oft auf) | Sonstiges (Bedienung) | **Bestätigt, im Durchlauf über zwanzigmal.** Pixels Zuruf nach 45 Spielsekunden ohne Eingabe ist stehender Text; der nächste Klick (Ausgang, Gegenstand in der Leiste, Pfote, Porträt) schaltet nur weiter und geht verloren. Folgefehler: Der Klick auf den Krug in der Leiste ging verloren, der nächste Klick auf den Kessel lief ohne Gegenstand (Ersatzzeile). | Verlauf Spielzeit 6381–6385: `klick inv:krug` → nur `W1_HOGG_PIX_0920_2`, `klick 196 200` → `SYS_ERS_MAX_0240`; ebenso 8323 (`klick` Schwerter-Bündel → nur `W1_SMAU_PIX_0800_2`) | Zuruf nicht blockierend zeigen (Sprechblase läuft aus) oder Klick zugleich als Aktion werten. |
| R5-W1-01 | bergwerk bis thronsaal | wichtig | Hinweise | **Die Pfote bleibt nach R10 auf R10 stehen.** Nach „Leuchttrank auf Grimmzahn“ und Lösung über Weg B führt das Spiel R10a weiter als offen (`status`: „Offene Rätselschritte: R10a, R11b“, später „R10a, R13“). Die Pfote gibt im Bergwerk, im Turmkeller (R11b offen) und im Thronsaal (R13 offen) nur R10-Hinweise, bis Stufe 3: „Gib Grimmzahn den Leuchttrank und unterschreib den Vertrag mit Ketchup. Oder biete ihm … den Hausmeisterposten an.“ Zu den Besen, zur Geheimtür und zu Moderwort kommt kein Hinweis. Nachgeprüft im Wiederholungslauf vom Prolog-Endstand (Weg B direkt, Leuchttrank nie abgegeben): genauso. Nach R11b meldet `status` im Turmkeller „Offene Rätselschritte: R10a“, die Pfote leuchtet und sagt dreimal `W1_HINT_PIX_1010` (ab dem zweiten Mal mit der Wartezeile `W1_HINT_PIX_9995`). Weil Weg A wegen GD-W1-K1 nicht geht, trifft das jeden Spieler: Im ganzen Turm (R11a, R11b, R12, R13) hilft die Pfote nicht. | Verlauf 7856 (Bergwerk, `W1_HINT_PIX_1010`, dreimal Stufe 1), 8112 (Turmkeller, `W1_HINT_PIX_1020`), 8760–8768 (Thronsaal, `W1_HINT_PIX_1030` dreimal); Stände `w34`, `w35`, `w40`; Wiederholungslauf `block_7`, Spielzeit 3406–3420 | R10 als Ganzes schließen, sobald ein Weg gelöst ist; offene Schritte nach Raum und Fortschritt ordnen. |
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
| R5-W1-38 | taverne | kosmetisch | Klickflächen | Der Hotspot „Dachbalken“ (x 0–640, y 0–40) liegt fast ganz unter der Zone, in der die Inventarleiste aufklappt: Von 36 Probestellen trifft die Fernsteuerung ihn an 10, an 22 klappt die Leiste auf, 4 liegen unter Porträts und Pfote. Für die Lösung wird er nicht gebraucht (nur Ansehen `W1_TAV_MAX_0260`). Gleiche Art wie X-07 vom 17.11. (Dachfenster im Prolog). | Verlauf 1311 (`rklick @dachbalken`, Stand `w06_nach_R1`) | Klickfläche auf y 25–60 legen (unter die Leistenzone) oder die Leiste nur am obersten Rand (wenige Pixel) aufklappen lassen. |

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
| R5-W1-27 | turmkeller | wichtig | Animation / Timing | **R11b: Die Besen laufen nie in die Kammer (in Tempo 1 gefilmt).** Pixel läuft zu jeder Kreuzung, schüttelt sich (Bewegung `haare`), ein Haarbüschel bleibt liegen: Das ist gut und neu (W1-19 behoben). Die drei Besen fegen aber unverändert ihre Routen weiter. Nach Max' Klick auf die Kammertür ist die Tür zu, Max sagt „Tür zu. Drei Besen in einer Kammer voller Staub“, Pixel „Ich höre sie fegen“, Zeldina „Treppe frei“, und währenddessen fegen alle drei Besen sichtbar weiter durch den Raum. Erst nach der letzten Zeile sind sie weg. Die Tür lässt sich auch erst nach der dritten Kreuzung schließen, ohne dass man sieht, warum. Außerdem: Max kann vorher mitten auf einer Route stehen, ein Besen fährt durch ihn hindurch, nichts passiert (die Bewegung `max_wegfegen` kam im Film nicht); Bodenklicks auf die Routen treffen die Hotspots „Zickzack-Route“ usw. und geben Ersatzzeilen statt zu laufen. | `belege/pr-w1/R5-W1-27_turmkeller_tuer_zu_besen_noch_im_raum.png` (Bilder 851 und 881 von 922, 6 Bilder/s, Tempo 1); Film im Lauf-Ordner `filme/besen`; Befehle: `stand holen w34_nach_R10b`, `klick @rune_tuer`, `portraet pixel`, `klick 307 257`, `klick 417 257`, `klick 371 240`, `portraet max`, `klick 555 160` | Nach jedem Büschel den Besen dieser Route sichtbar zur Kammertür fegen lassen (Bewegung `haarspur` ist vorhanden) und ausblenden; Max' Zeile erst, wenn alle drei drin sind. Routen-Hotspots für Bodenklicks durchlässig machen. |
| W1-20 | abstellkammer_1 | wichtig | Grafik / Klickflächen | **Weiterhin offen (W1-20 vom 17.11.).** In Abstellkammer 1 sind keine Besen zu sehen. Die Klickfläche „Besen“ (x 290–520, y 246–300) liegt auf leerem Boden; Max sagt „Die Besen fegen Smaugis Kram zu Stapeln und ignorieren mich“. Auch das Schild „Eigentum Smaugi, Kammer 1 von 6“ ist eine leere Holztafel. | `belege/pr-w1/R5-W1_kammer1_keine_besen_sichtbar.png`; Verlauf 8221 | Drei Besen als Props (gern mit Fege-Schleife) und Schrift aufs Schild. |
| R5-W1-29 | abstellkammern | wichtig | Rätsel | Die Geheimtür bietet die vier Passwort-Teile schon in der richtigen Reihenfolge an (Mo, Knuddel, Puddi, Bärchen). Viermal die oberste Zeile klicken löst das Rätsel; die vier Fundorte muss niemand kombinieren. Während der Eingabe sieht man nicht, was schon gewählt ist. Eine falsche Reihenfolge wird erst nach dem vierten Teil abgelehnt (`W1_SMAU_TUE_0730`). | `belege/pr-w1/R5-W1_geheimtuer_optionen_in_loesungsreihenfolge.png`; Verlauf 8640–8654 | Teile mischen (fest, nicht zufällig), gewählte Teile als Zeile über dem Menü zeigen („Mo-Puddi-…“). |
| R5-W1-30 | abstellkammern | wichtig | Positionierung | Humbert, Grimmzahn und Zeldina stehen in einer Reihe vor Smaugi und den Haufen. Smaugi ist zur Hälfte verdeckt, „Schwert im Stein“, Okarina und Goldhaufen liegen hinter Humbert und Grimmzahn. Humbert ist mit Skala 0,93 die größte Figur im Bild. | `belege/pr-w1/R5-W1_kammern_figuren_verdecken_smaugi.png` | Abnehmer links und rechts an die Wände, Smaugi frei in der Mitte. |
| R5-W1-31 | thronsaal | wichtig | Hinweise | Ein Klick auf Moderwort, den Endgegner, gibt vor und nach dem Niesen nur Ersatzzeilen („Ich könnte. Aber warum sollte ich?“, „Nicht mal mit Cheatcode.“). Erst nach Socke und Kochlöffel löst derselbe Klick das Ende aus. Mit GD-W1-K1-Folge R5-W1-01 gibt auch die Pfote hier keinen Hinweis. | Verlauf 8726 (`SYS_ERS_MAX_0040`), 8835 (`SYS_ERS_MAX_0160`), 8875 (Auflösung) | Gesprächszeilen je Phase („Er zaubert. Erst muss der Stab weg.“ / „Jetzt der Löffel.“). |
| R5-W1-35 | thronsaal (gilt für alle Räume, hier belegt) | wichtig | Lokalisierung | Mit einem Gegenstand in der Hand steht über Moderwort im deutschen Spiel die Zeile „Use Sortierende Socke with UI_OBJ_MODERWORT“: englisches Satzmuster und ein roher Textschlüssel statt des Namens. Ohne Gegenstand steht dort richtig „Moderwort“. Der roh angezeigte Schlüssel betrifft nur Ziele, deren Name ein Schlüssel ist; das englische „Use … with …“ kommt vom Popochiu-Standard und dürfte überall gelten (an anderen Zielen nicht eigens fotografiert). | `belege/pr-w1/R5-W1_thronsaal_use_socke_with_UI_OBJ_MODERWORT_max_in_moderwort.png` (Film `filme/thron`, Bild 127, Tempo 1); Befehle: `stand holen w40_thronsaal_anfang`, `klick inv:socke`, Zeiger auf (400, 220) | Satzmuster übersetzen („Sortierende Socke benutzen mit Moderwort“) und den Namen des Ziels vor der Anzeige durch `tr()` schicken. |
| R5-W1-36 | thronsaal | wichtig | Positionierung / Animation | **Finale in Tempo 1 gefilmt: Die Schlussszene ist ein Standbild.** (a) Max steht während des ganzen Finales Nase an Nase in Moderwort (Abstand etwa 25 px, Figuren überlappen). (b) Toadi spricht „Danke, Max! Aber die Prinzessin ist in … da ist sie.“, ist aber nicht im Raum; die Zeile hängt mittig über dem Fenster, die Tür bleibt zu (das Skript sagt „stürmt herein, Keuchen“). (c) Zeldina sagt „Ich hab jetzt einen Zauberstab“, steht aber die ganze Szene 190 px entfernt mit dem Schwerter-Karton; ein Stab fliegt nicht und ist nie zu sehen. (d) Smaugi sagt nichts Sichtbares und schläft auf dem Thron. Moderwort bewegt beim Niesen den Arm; sonst bewegt sich nichts. | `belege/pr-w1/R5-W1-36_thronsaal_toadi_spricht_ist_nicht_im_raum.png` (Film `filme/thron`, Bild 671 von 828, 4 Bilder/s); Befehle: `stand holen w40_thronsaal_anfang`, `klick inv:socke`, `klick 400 220`, `klick inv:kochloeffel`, `klick 400 220`, `klick 400 220` | Max vor der Szene auf einen festen Platz links vor Moderwort stellen (etwa x 300); Toadi durch die Tür hereinlaufen lassen; Stab als Prop, der zu Zeldina wechselt (sie mit Stab statt Karton zeigen). |

## Funde: Welt-Ende und Zwischenspiel 1

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W1-32 | dachboden (ZS1, Packen) | wichtig | Grafik | Der Dosenöffner hat im Pack-Fenster ein Platzhalterbild: grünes Feld mit „Dos“. | `belege/pr-w1/R5-W1_zs1_packen_dosenoeffner_platzhalter_reisetasche.png` | Inventarbild für den Dosenöffner. |
| R5-W1-37 | thronsaal → dachboden (Welt-Ende) | kosmetisch | Animation / Timing | Der Werbeblock, der Max und Pixel zurückholt, ist nicht zu sehen. Nach der Kreisblende steht man schon auf dem Dachboden, und ein Erzählsatz beschreibt ihn nachträglich wie eine Regieanweisung: „Werbeblock: Milchglas, Kuh, leeres Preisschild, Blitz. Fünf Sekunden, dann Rauschen.“ Während dieser Szene zeigt der Zeiger (Sanduhr) den Namen „Zapp-O-Mat 3000“ an, obwohl nichts klickbar ist. Im Film in Tempo 1 gesehen. | `belege/pr-w1/R5-W1-37_weltende_blende_und_werbeblock_nur_text.png` (Film `filme/thron`, Bilder 866 und 884, 4 Bilder/s); Vorlage `docs/skript/welt-1.md` Z. 1422 (`W1_THRO_MAX_0600`) | Fünf Sekunden Vollbild-Werbung (ein Standbild Milchglas mit Blitz und Rauschen reicht) zwischen Blende und Dachboden; Namensanzeige in Szenen ausblenden. |
| R5-W1-39 | dorfplatz (nach Laden aus Welt 2) | kosmetisch | Speichern/Laden | Nach dem Laden eines Welt-1-Stands aus Welt 2 heraus spricht Pixel auf dem Dorfplatz sofort zwei zweite Hälften von Welt-2-Zurufen: „Zwei von drei Dingen hier bewegen sich …“ (`W2_ZURU_PIX_0010_2`) und „Genau wie Fähren. Und Öfen. Und … Dosenöffner.“ (`W2_ZURU_PIX_0100_2`). Angefangene Zurufe überleben das Laden. | `belege/pr-w1/GD-W2-03_welt1_ruecksprung_protokoll.txt`, Spielzeit 4146.5 | Beim Laden wartende Zuruf-Zeilen verwerfen. |
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
| 17.11. W1-03 (Bestellzettel nur aus einer Richtung) | behoben: gewinnt an 36 von 36 Probestellen | Verlauf 620 (`rklick @bestellzettel`) |
| 17.11. W1-04 (Humbert nur an 9 % anklickbar, Fischsuppe) | behoben: Humbert 32 und 36 von 36 Probestellen (zwei Standorte), Fischsuppe 36 von 36 | `ZIEL`-Zeilen im Verlauf der Taverne |
| 17.11. W1-07 (Regale, Zollstock) | Zollstock behoben (36 von 36); Regale nicht gemessen | `ZIEL @zollstock` im Verlauf |
| 17.11. W1-08 (Toadi in der Tür) | behoben: Toadi steht bei (470, 262) | `status` Klassenzimmer |
| 17.11. W1-12 (Alter Baum) | **weiterhin offen** → R5-W1-07 | Ersatzzeile |
| 17.11. W1-10 (Zeldina steckt in der XXL-Ziege) | behoben: an der Brücke Zeldina (158, 196), XXL-Ziege (338, 178); Zeldina steht jetzt aber vor dem Schild (R5-W1-12) | `status` Brücke, Spielzeit 8265 |
| 17.11. W1-14 (Blatt vor Max' Gesicht im Luftschloss) | behoben: beim Betreten steht Max rechts neben dem Blatt, Gesicht frei | Foto `w49_luftschloss` im Lauf-Ordner |
| 17.11. W1-17 (Bergwerk, eine Bodenlinie) | **weiterhin offen** | `status` Bergwerk: Goblins y 285–292 |
| 17.11. W1-18 (Goblin 1 hinter der Kaffeemaschine) | behoben: Der Goblin gewinnt jetzt gegen die Kaffeemaschine (die verliert 9 von 36 an ihn). Goblin 1 selbst 22 von 36, die übrigen 14 gehen an Pixel, der davor sitzt | `ZIEL @goblin_1`, `ZIEL @kaffeemaschine` im Verlauf |
| 17.11. W1-19 (Pixel legt keine Haare) | behoben: Pixel läuft zur Kreuzung, Bewegung `haare`, Büschel am Boden | Film `filme/besen`, Bilder 385–470 |
| 17.11. W1-20 (Besen-Hotspot auf leerem Boden) | **weiterhin offen**, siehe Tabelle Turm | `belege/pr-w1/R5-W1_kammer1_keine_besen_sichtbar.png` |
| 17.11. W1-21 (Rundbogen neben der Geheimtür ohne Klickfläche) | **weiterhin offen**: `objekte` in den Abstellkammern kennt rechts nur „Geheimtür“ (x 508–570) | `objekte`, Spielzeit 8948 |
| 17.11. W1-23 (Waldemar neben der Brücke) | behoben: Waldemar bei (395, 168) auf der Brücke | `status` Brücke |
| 17.11. X-07 (Klickflächen unter der Leistenzone) | **weiterhin offen** in Welt 1: Dachbalken der Taverne → R5-W1-38 | Verlauf 1311 |
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

Grundlage: (a) Filme in Tempo 1 mit `textmodus lesen` aus dem laufenden Spiel (`film an`), (b) Bestand aus den Sheet-Dateien und Aufruf-Tabellen, erzeugt mit dem vorhandenen Werkzeug `werkzeuge/an-a_inventar.py` (Ausgabe in einen Arbeitsordner umgelenkt; Auszug für Welt 1 in `belege/pr-w1/animationen_welt1_inventar.csv` und `…_messwerte_animationen.csv`). Was nur aus (b) stammt, ist als „aus den Dateien“ markiert.

### Im Spiel gefilmt

| Szene | Was zu sehen ist | Urteil |
| --- | --- | --- |
| R7, Waldemars Lied (Zauberwald) | Kamera bleibt am Eingang; Waldemar (`musical`), Niesrosen, Rotkäppchen, Toadi außerhalb des Bildes | Die teuerste Szene der Welt ist nicht zu sehen (R5-W1-17) |
| R11b, Kreuzungen (Turmkeller) | Pixel läuft hin, `haare` spielt, Büschel bleibt liegen | gut (W1-19 behoben) |
| R11b, Besen | `fegen`-Schleife auf drei Routen, laufen bis nach der letzten Zeile weiter, dann weg; `haarspur` und `max_wegfegen` nicht gesehen | Auflösung fehlt im Bild (R5-W1-27) |
| Abstellkammer 1 | keine Besen | W1-20 weiterhin offen |
| Klassenzimmer | Alwin `ruehren` mit eigenem Kessel im Figurenbild, der Max' Beine überdeckt | R5-W1-21 |
| Abstellkammern nach R12 | Smaugi `staubwedel`, Raum aufgeräumt | gut |
| R13, Thronsaal-Finale (Socke, Kochlöffel, Passwort) | Moderwort hebt beim Niesen den Arm; sonst stehen Max, Zeldina und Pixel die ganze Szene still, Max in Moderwort; Toadi spricht ohne im Raum zu sein; kein Stab zu sehen | Schlussszene ohne Bewegung (R5-W1-36) |
| Welt-Ende, Übergang zum Dachboden | Kreisblende zu, Einblendung „Errungenschaft: Ohne Pfote: Welt 1“, dann Dachboden; der Werbeblock ist nur ein Erzählsatz über dem Dachboden („Werbeblock: Milchglas, Kuh, leeres Preisschild, Blitz. Fünf Sekunden, dann Rauschen.“) | Blende gut; der Werbeblock selbst hat kein Bild (R5-W1-37) |

(Thronsaal, Melken, Pilz-Verwandlung, Fußbad, Lieferszene: siehe Nachtrag unten, soweit gefilmt.)

### Bestand gegen Gesten-Regie (aus den Dateien)

- 24 Figuren und Objekte der Welt 1 mit zusammen 133 Bildfolgen. Jede Figur hat `idle` (4 Bilder, 320 ms), `talk` und `walk`.
- **Gebaut, aber nicht aufgerufen:** Gollo `talk_geste`, Grimmzahn `talk_geste`, Schmied `abschrecken`, `blasebalg`, `ins_feuer`, `zum_amboss`, XXL-Ziege `kauen`. Dazu je Figur eine Altfassung `talk_alt` (11 Stück), die nur Platz im Sheet kostet (A-07 weiterhin offen).
- **`walk` besteht aus den Standbildern** (Figur gleitet, wenn sie bewegt wird): Smaugi, Huhn Berta, Schwan, Zauberbesen, Übungsbesen (A-06 weiterhin offen). Pixel im Fell und die Ziegen haben eine eigene Folge `gehen` (8 Bilder).
- **Früher gemeldet, nach den Messwerten behoben:** Gollo `talk` ist jetzt so hoch wie der Stand (144 px gegen 143–144; die gebückte Fassung liegt als ungenutztes `talk_geste` im Sheet) → W1-05 behoben. Grimmzahn `talk` 134–136 px gegen 134–135 → W1-16 behoben (Schild im Film nicht eigens geprüft). Max als Pilz hat einen eigenen Gang mit 8 Bildern (`max_pilz walk`, nicht gleich `idle`) → W1-09 nach den Dateien behoben, im Spiel nicht gesehen. `melken` und `haare` stehen in der Aufruf-Tabelle (`gesten_einsatz.gd` Z. 88–91) → W1-06 und W1-19 angebunden.
- **Fehlt ganz:** Max spielt die Laute (R6a, Berta flieht) ohne eigene Bewegung; Max als Abnehmer-Übergabe bei Smaugi, Zeldina fängt den Zauberstab (R13), Maklerin läuft ab (R9), Rotkäppchen liefert (R3) haben keine eigene Folge außer `walk`/`talk` (Zeldina `kiste_schwert` ist für R13 gebaut und aufgerufen).
- Sprech-Schleifen mit nur 4 Bildern ohne Geste: Gollo, Grimmzahn, Minka, Huhn, beide Ziegen, Max (4 × 130 ms).

### Kandidaten für bessere Animationen (für `ext`)

| Figur oder Objekt | Bewegung | Datei | Bildzahl und Größe | Was daran schwach ist | Was man bräuchte |
| --- | --- | --- | --- | --- | --- |
| Zauberbesen (Turmkeller) | Lauf auf der Route, Abgang in die Kammer | `game/grafik/figuren/zauberbesen.png` | `fegen` 3 Bilder, 100 px hoch; `walk` = Standbilder | gleitet beim Fahren; Abgang in die Kammer wird nicht gespielt | Fege-Lauf von der Seite, 6–8 Bilder, etwa 48 × 100; kurzer „hinterherjagen“-Zyklus |
| Übungsbesen (Klassenzimmer) | jagt Pixels Haaren nach | `…/uebungsbesen.png` | `jagen` 5 Bilder, 74 px; `walk` = Standbilder | nur einmalige Geste, kein Laufzyklus | derselbe Besen-Lauf wie oben |
| Smaugi | Sitzen, Atmen, Reden | `…/smaugi.png` | `idle` 4, `talk` 4 Bilder, 250 px hoch | große Figur mit wenig Bewegung; `walk` = Standbilder | Atem-Schleife 8 Bilder (Bauch, Flügel), Blinzeln, Rauch aus den Nüstern |
| Huhn Berta | Flattern auf den Balken | `…/huhn.png` | `springen` 7 Bilder, 34–47 px; `walk` = Standbilder | Flucht ist ein Sprungbogen ohne Flügelschlag | Flattern 4–6 Bilder, etwa 40 × 40, Seitenansicht |
| Schwan (Wasserschloss) | Schwimmen | `…/schwan.png` | `idle` 4 Bilder, 79 px; `walk` = Standbilder | steht im Wasser | Schwimm-Schleife 4–6 Bilder mit Wasserring |
| Schmiede-Ziege, XXL-Ziege | Gehen von der Seite | `…/schmiede_ziege.png`, `…/xxl_ziege.png` | `gehen` 8 Bilder; 93 und 236 px hoch | XXL-Ziege schwankt in der Höhe 223–244 px (9 %) | Gehzyklus Vierbeiner von der Seite, 8 Bilder, sauber auf einer Fußlinie |
| Pixel im Ziegenfell | Gehen | `…/pixel_ziege.png` | `gehen` 8 Bilder, 56–61 px | Höhe schwankt, `walk` = Standbilder als Rückfall | Gehzyklus Katze mit Fell, 8 Bilder, etwa 64 × 60 |
| Waldemar | Musical-Nummer | `…/waldemar.png` | `musical` 3 Bilder in 16 Schritten, 270 px | drei Bilder für die größte Nummer der Welt | Tanz- oder Gesangsschleife 8–12 Bilder (Arme, Schritt), dazu Notenblasen als Effekt |
| Waldemar | Fußbad | `…/waldemar.png` | `fussbad` 2 Bilder | zwei Bilder | Hinsetzen 4–6 Bilder plus Planschen-Schleife 4 Bilder, Wasserspritzer als Effekt |
| Max | Laute spielen | `…/max.png` | fehlt | Max steht beim Spielen still | Zupfen 4–6 Bilder, 185 px hoch, Seitenansicht |
| Max | Melken | `…/max.png` | `melken` 8 Bilder × 140 ms, 136–141 px | wird noch im Spiel angesehen (siehe Nachtrag) | falls steif: Hocken und Armzug 8 Bilder |
| Niesrosen (Zauberwald) | Aufgehen, Pollenwolke | Hintergrund, kein eigenes Bild gefunden | fehlt | Rosen „öffnen sich“ nur im Text | Blüten-Schleife 4–6 Bilder (zu, halb, offen) und Wolken-Effekt |
| Fackeln (Bergwerk, Turm) | Flamme | Ambiente | nicht geprüft | laut `offene-punkte.md` Flammen nach dem Umrechnen blass | Feuer-Schleife 4–6 Bilder, 16 × 24 |
| Gollo, Grimmzahn, Minka | Reden | jeweilige Sheets | `talk` 4 Bilder | nur Mund, keine Geste (die Gesten-Fassungen sind zu groß und deshalb ungenutzt) | Rede-Geste in Standhöhe, 6–8 Bilder |

## Zeitmessungen

### Wiederholung des Lösungswegs vom echten Prolog-Endstand

Lauf `pr-w1-weg`: frischer Prozess, `stand holen prolog_ende`, dann `belege/pr-w1/loesungsweg.txt` Block 1 bis 9 am Stück, ohne Neuladen, alles echte Klicks. **Ergebnis: Die Welt ist vom Prolog-Endstand bis zum ersten freien Moment in Welt 2 durchspielbar**, R10 nur über Weg B (GD-W1-K1). Endinventar: Thunfischdose, Pixel, Notizbuch, Socke, Kochlöffel, Dosenöffner, Handy, Kaugummi, Kugelschreiber.

Die Spielzeit steht im Protokoll (Tempo 4, Text sofort weitergeklickt, kürzester Weg ohne Umsehen; `@id`-Klicks der Fernsteuerung kosten je etwa 8 s zusätzlich). Das ist eine **untere Grenze**, keine Lesezeit.

| Abschnitt | Spielzeit am Ende (s) | Dauer (s) |
| --- | --- | --- |
| Start Dorfplatz | 8 | |
| R1 (Taverne, a bis c) | 457 | 449 |
| R2, R5, R8 (Laden, Brunnen, Bohne) | 1274 | 817 |
| R3, R4 (Lieferung, Brücke) | 1891 | 617 |
| R7 (Zauberwald, mit Bergwerk-Besuch) | 2199 | 308 |
| R6 (Hoggelwarz, mit Melken) | 2637 | 438 |
| R9 (Luftschloss) | 3000 | 363 |
| R10 Weg B (Bergwerk) | 3225 | 225 |
| R11b (Turmkeller) | 3350 | 125 |
| R12, R11a (Abstellkammern) | 3659 | 309 |
| R13 (Thronsaal) | 3768 | 109 |
| Zwischenspiel 1 bis Ankunft Welt 2 | 4014 | 246 |

Zusammen rund 67 Minuten Spielzeit für den reinen Lösungsweg ohne Lesen. Mit Lesen und Suchen schätze ich 2,5 bis 3,5 Stunden für Welt 1 (Schätzung, nicht gemessen).

### In Tempo 1 mit `textmodus lesen` gemessen

| Szene | Dauer | Wie gemessen |
| --- | --- | --- |
| R7, Waldemars Lied (vom Betreten des Zauberwalds bis zur letzten Zeile) | etwa 80 s | Film `filme/r7`, 5 Bilder/s |
| R11b, alle drei Kreuzungen und Tür (ohne Wege dazwischen) | etwa 150 s | Film `filme/besen`, 6 Bilder/s |
| R13, Socke auf Moderwort (Niesen) | etwa 24 s | `zeit` im Protokoll des Thronsaal-Films (Klick 478, frei bei 503) |
| R13, Kochlöffel auf Moderwort (Käse) | etwa 36 s | wie oben (Klick 528, frei bei 564) |
| R13, Klick auf Moderwort mit Passwort bis Raumwechsel zum Dachboden | 110 s | wie oben (Klick 603,7; `W1_R13_GELOEST` 634,0; Raum `dachboden` 713,5) |
| Zwischenspiel 1, Ankunft bis Ei abgegeben | 66 s, Szene läuft danach weiter | wie oben (713,5 bis 779,1; danach hat die Fernsteuerung nicht weitergeklickt) |

Nicht gemessen: Ankunftsszene (W1-01), Lieferszene, Gespräche mit Lesezeit je Raum.

## Nicht geprüft

(wird am Ende ausgefüllt; Stand jetzt: siehe „Was noch aussteht“)

## Vorschläge für die Lessons Learned

- **Speichern und Laden immer über einen Programmneustart prüfen.** Alle bisherigen Tests laden im selben Programmlauf; dort sind Gesprächsoptionen, aufgehobene Props und Ähnliches noch im Speicher. Der Fehler R5-W1-34 (Gespräche ohne Optionen nach Neustart) und R5-P-01 (Props nach Rücksprung) fallen nur auf, wenn man speichert, das Programm beendet, neu startet, lädt und dann **jede schon benutzte Figur anspricht**. Vorschlag für die CI: ein Test, der genau das mit einem Stand je Welt tut. Beleg: R5-W1-34.
- **Popochiu speichert alle Skript-Variablen einer Ressource, auch interne** (`_has_done_init`). Neue Variablen an Gesprächen, Räumen und Figuren deshalb daraufhin prüfen, ob sie in den Spielstand gehören; sonst in `cq_save_load.gd` beim Laden überspringen. Beleg: Speicherstand `kontrollpunkte/welt-1/w33_bergwerk_vor_R10.json`, Schlüssel `popochiu.dialogs.*`.
- **Szenen brauchen eine Kamera-Regie.** In breiten Räumen spielt eine Szene dort, wo die Figuren stehen, die Kamera bleibt aber bei Max. Jede Szene, die beim Betreten eines Breitraums startet, vor dem Zeigen in Tempo 1 filmen und prüfen, ob alle Sprecher im Bild sind. Beleg: R5-W1-17 (Waldemars Lied), R5-W1-05.
- **Folgende und wartende Figuren im Raum mit allen anderen Figuren prüfen** (Regel steht schon in CLAUDE.md, „im Raum mit allen Figuren prüfen“), und zwar je Zustand: Abnehmer in den Abstellkammern, Zeldina an der Brücke, XXL-Ziege vor Schild und Schmiede. Beleg: R5-W1-30, GD-W1-10, R5-W1-12.
- **Hinweis-Schritte mit zwei Lösungswegen als ein Schritt führen.** R10a blieb nach Weg B offen und hat die Pfote für den Rest der Welt blockiert. Beleg: R5-W1-01.
- **Auswahlmenüs mit Reihenfolge-Rätseln nie in Lösungsreihenfolge anlegen.** Beleg: R5-W1-29.

## Werkzeug

- Erstes Gespräch eines Godot-Prozesses bei Tempo 4: Menü lag über dem oberen Bildrand (y −85), Optionen nicht anklickbar (von `pr-p` als R5-P-09 gemeldet). Abhilfe: erstes Gespräch in Tempo 1 öffnen.
- `@id`-Klicks dauern rund 8 s (36 Probestellen), Koordinaten-Klicks rund 2 s.
- Pixels Zurufe schlucken den nächsten Befehl der Fernsteuerung wie einen Spielerklick (GD-W1-04); vor wichtigen Klicks `warte`.
- `start welt-1` liefert einen Stand ohne Thunfischdose und Notizbuch; für R1c nicht brauchbar.
- `stand sichern` geht nicht in Gesprächen und Nahansichten („Spiel ist beschäftigt“).
- Eigener Kurzaufruf `/home/user/lauf/f.sh` (kürzt die Ausgabe; liegt außerhalb des Repos).
