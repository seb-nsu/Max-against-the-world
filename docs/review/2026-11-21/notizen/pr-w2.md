# pr-w2: Welt 2 „Antikodonien“ bis zum Anfang von Welt 3 (Komplett-Review 21.11.2026, Fortsetzung in der Cloud ab 25.11.)

**Stand: in Arbeit (25.11.). Gerader Durchlauf läuft; die Notiz wird nach jedem Block ergänzt und gesichert.**

- **Rolle:** Welt-Prüfer `pr-w2` (ein Durchgang aus fünf Blickwinkeln: Beleg-Sammler, Level-Designer, Game-Designer, Technical Artist, Gameplay-Scripter).
- **Umfang:** Welt 2 vollständig, alle Räume in allen Zuständen, alle Rätselketten, vom ersten freien Moment im Nil-Delta bis zum ersten freien Moment in Welt 3 (einschließlich Welt-Ende, Übergang und Zwischenspiel 2 im Spielfluss).
- **Geprüfter Stand:** `main` auf `04c5a79f` (Branch `claude/project-thread-me923s`), Godot 4.7.2, Linux-Container, Fernsteuerung `werkzeuge/cloud/fs` ohne Testmodus, echte Klicks. Standard Tempo 4 und Textmodus `klick`; Zeit, Bewegung und Hänger in Tempo 1.
- **Anfangsstand:** `kontrollpunkte/welt-1/welt1_ende.json` (echter Endstand von Welt 1, erspielt von `pr-w1`; Wahlfächer Socke und Dosenöffner).
- **Läufe:** `/home/user/lauf/pr-w2-*` (nicht im Repo; „Verlauf“ meint `verlauf.txt` des Laufs `pr-w2-haupt`). Kontrollpunkte: `kontrollpunkte/welt-2/` mit `liste.md`, Lösungsweg: `belege/pr-w2/loesungsweg.txt`.
- **Vorgänger:** `notizen/gd-w2.md` (12 Funde, Zwischenstand); Funde stehen hier mit alter ID und sind neu nachgestellt.
- Alles in den Tabellen ist im laufenden Spiel beobachtet, außer wo „aus dem Code“ oder „aus dem Dokument“ dabeisteht.

## Funde

### Übergreifend in Welt 2 (Oberfläche, Hinweise, Notizbuch)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W2-01 | alle (gesehen: Thronsaal nach der Audienz) | wichtig | Hinweise | **Das Notizbuch führt in Welt 2 keine Ziele und keine Regeln.** Direkt nach der Audienz (Ramses verlangt den Olympiasieg, „Startpass in Olympia“) steht unter „Ziele“: „Gerade ist nichts offen.“ Die Seite „Regeln und Passwort-Teile“ (Titel aus Welt 1) zeigt nur zwei Stichwörter („Hieroglyphen-Grammatik“, „Tafel“), nicht deren Inhalt. Die acht bis dahin gesammelten Rätsel-Bausteine der Sphinx (laut Rätseldoku „im Notizbuch“) stehen auf keiner Seite. „Pixels Einkaufsliste“ zeigt noch das Ei aus Welt 1. Gleiche Art wie R5-P-05 (c). | `belege/pr-w2/notizbuch_ziele_leer_nach_audienz.png`, `belege/pr-w2/notizbuch_regeln_nur_titel_keine_bausteine.png`; Stand `w2_08_nach_audienz`: `klick inv:notizbuch`, `knopf UI_SEITE_WEITER` | Ziele aus den offenen Schritten der Welt füllen, auch wenn der Raum noch nicht besucht ist („Olympia: Startpass besorgen“); Regeln mit ihrem Satz eintragen (Grammatik, Tafel mit 112/25 Jahren); eigene Seite „Bausteine“; Titel in Welt 2 „Regeln und Bausteine“. |
| R5-W2-02 | nil_delta | kosmetisch | Grafik, Humor | **Die „Flusskarte“ ist eine Textliste.** Pixel sagt „Flussaufwärts wird alles jünger, sagt die Karte“, Max „Drei Haltestellen, eine Linie, kein Umsteigen“; zu sehen ist das normale Auswahlmenü mit „Fährsteg Olympia / Hafen Syrakus / Doch nicht“ (die dritte Zeile halb abgeschnitten, siehe GD-W2-01). Eine Karte gibt es nicht. | `belege/pr-w2/nil_flusskarte_ist_textliste.png`; `klick @faehre` nach R1 | Kleines Kartenbild als Überlagerung (drei Stege an einer Linie, Jahre dazwischen, Standort markiert) oder die beiden Zeilen ohne „Karte“. |

### Nil-Delta

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W2-01 | alle Gespräche (hier Fährmann, Schreiber, Flusskarte) | wichtig | Klickflächen | **Bestätigt** (derselbe Fund wie R5-P-13 und GD-W1-01): Die letzte Zeile jedes Menüs ist halb abgeschnitten; beim Fährmann (vier Optionen) ist es der Ausstieg „Dann warte ich halt.“, bei der Flusskarte „Doch nicht“. | `belege/pr-w2/nil_faehrmann_menue_vierte_option_abgeschnitten_max_im_faehrmann.png`; `optionen` → „[0360] (erst nach Rollen sichtbar)“ | wie R5-P-13 |
| GD-W2-04 | nil_delta | wichtig | Klickflächen | **Bestätigt:** Die Sanduhr am Fährsteg ist nicht anklickbar, der Fährmann liegt ganz darüber. | `rklick @sanduhr` → „gewinnt an 0 von 36 Probestellen (sonst: faehrmann 36)“ | Fährmann oder Sanduhr versetzen. |
| GD-W2-05 | nil_delta | kosmetisch | Positionierung | **Bestätigt:** Max stellt sich zum Reden Nase an Nase in den Fährmann (Max x 285, Fährmann x 235 bei rund 45 px breiten Figuren). | `belege/pr-w2/nil_faehrmann_menue_vierte_option_abgeschnitten_max_im_faehrmann.png` | Gesprächsplatz 40 px weiter weg. |
| R5-W2-03 | nil_delta | kosmetisch | Animation | Der Steinmetz holt mit Hammer und Meißel aus, vor ihm steht kein Stein: Er meißelt in die Luft (gleiche Art wie W2-18 bei Nebet, dort inzwischen behoben). | `belege/pr-w2/nil_steinmetz_meisselt_in_die_luft.png` | Steinblock als Prop vor ihn stellen. |

### Thronsaal

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W2-06 | thronsaal_ramses | wichtig | Timing, Positionierung | **Bestätigt:** Beim ersten Betreten bleibt die Kamera bei x 0; Ramses (Raum-x 955) und der Hofkater (770) sprechen von außerhalb des Bildes, Pixel empört sich über ein Kissen, das man nicht sieht. Die Gefolge-Szene dagegen lief in meinem Lauf am Thron, weil ich Pixel selbst zum Hofkater geführt habe. | `belege/pr-w2/thron_erstes_betreten_sprecher_nicht_im_bild.png`; `status` nach der Szene: Kamera 0, Ramses 955, Hofkater 770 | Kamerafahrt zum Thron und zurück oder Max bis vor den Thron laufen lassen. |
| GD-W2-07 | thronsaal_ramses | wichtig | Rätsel | **Bestätigt:** Die 16 Kacheln sind eine Textliste, sechs sind sichtbar, die ersten vier sind die Lösung in Lösungsreihenfolge (Mann, Katze, Pharao, Ohr). Kein Abbruch, keine Anzeige des Feldes. | `belege/pr-w2/thron_kacheln_textliste_loesung_oben.png`; `klick inv:bildtafel`, `klick @schreiber`, `optionen` | wie gd-w2 (mischen, Kopfzeile, „Doch nicht“). |
| GD-W2-08 | thronsaal_ramses | wichtig | Rätsel, Hinweise | **Bestätigt:** Die Kaugummiblase gibt es nur mit „Kaugummi auf Kaugummi“. Kaugummi auf Hofkater und auf Pixel: Ersatzzeilen. Stufe 3 der Pfote nennt außerdem Dose und Sobek, obwohl beide schon gezeigt sind. | Stand `w2_07_duell_vor_wunder`: `klick inv:kaugummi`, `klick @hofkater` → `SYS_ERS_MAX_0200`; `klick @pixel` → `SYS_ERS_MAX_0170`; `pfote` → `W2_HINT_PIX_0232` | wie gd-w2 |
| GD-W2-09 | thronsaal_ramses | kosmetisch | Technik, Humor | **Bestätigt:** Erstes Ansehen der Inschrift: Pixels Pointe kommt vor der Nahansicht und nach dem Schließen noch einmal. | `rklick @inschrift` → `W2_THRO_PIX_0290`, Nahansicht, `knopf X` → `W2_THRO_MAX_0280`, `W2_THRO_PIX_0290` | wie gd-w2 |
| GD-W2-10 | thronsaal_ramses | kosmetisch | Positionierung | **Bestätigt:** Pixel stellt sich in den Hofkater (beide auf dem Kissen), Max steht vor Ramses; Sobek liegt als Gefolge quer vor dem Schreiber und verdeckt ihn. | `belege/pr-w2/thron_pixel_im_hofkater_max_vor_ramses.png`, `belege/pr-w2/thron_sobek_liegt_vor_schreiber.png` | wie gd-w2 |
| R5-W2-04 | thronsaal_ramses | kosmetisch | Rätsel | **W2-12 nur halb behoben.** Der Platzhalter „[Satz]“ ist weg. Der Schreiber kündigt aber weiter an „Na gut. Ich les es vor.“ und liest dann nichts vor: Bei „Vogel, Sonne, Wasser, Feder“ und bei „Krokodil, Mann, Pharao, Hand“ folgt nur „Es ergibt keinen Sinn. … In dieser Reihenfolge, bitte.“ Der zweite Satz hält die Reihenfolge ein (wer, wem, wen, Tat); laut Rätseldoku sollte der Schreiber ihn aus den Kachelnamen vorlesen („Krokodil, Diener des Mannes, bittet den Pharao um Gold“). Eigene Pointe nur bei „… um Brot“ (`W2_HIER_SCH_0240`). | `klick inv:bildtafel`, `klick @schreiber`, `option "Krokodil"`, `"Mann"`, `"Pharao"`, `"Hand"` → `W2_HIER_SCH_0120`, `W2_HIER_SCH_0125` | Lesung wirklich aus den vier Kachelnamen bauen; „Reihenfolge“ nur sagen, wenn die Reihenfolge falsch ist. |
| R5-W2-05 | thronsaal_ramses | kosmetisch | Zustandswechsel | Nach R2a (Botschaft ist abgegeben) antwortet ein Klick auf Ramses weiter mit der Schreiber-Zeile vom Anfang: „Der Pharao empfängt nur schriftlich, in Hieroglyphen …“; der Schreiber steht dabei 600 px weiter links außerhalb des Bildes. | Stand `w2_04_nach_R2a`: `klick @ramses` → `W2_THRO_SCH_0050`, `_2` | Nach R2a: Ramses selbst („Erst der Kater. Dann ich. Oder umgekehrt. Nein, erst der Kater.“). |

### Palastküche

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W2-11 | palastkueche | kosmetisch | Rätsel, Hinweise | **Bestätigt:** Vor den Sandalen sagt die Pfote „Die Sandalen wollen weg, und Öl hält Riemen“, und Max eröffnet bei Nebet mit „Ich bräuchte etwas Öl“. | Stand `w2_09_kueche_anfang`: `pfote` → `W2_HINT_PIX_0410`; `klick @nebet` → `W2_KUCH_MAX_0140` | wie gd-w2 |
| GD-W2-12 | palastkueche | kosmetisch | Rätsel | **Bestätigt:** (a) Rechtsklick auf den Traubensaft sagt die Nehmen-Zeile mit Nebets Erlaubnis, nimmt aber nichts. (b) Fladen „mit Datteln“ im Ofen: „Ab in den Ofen. Und jetzt warten …“, nichts geschieht. (c) Zwiebel auf Brot, Brot in den Ofen: Ersatzzeilen. | `rklick @traubensaft` → `W2_KUCH_MAX_0110`, `W2_KUCH_NEB_0120`, kein INVENTAR; `klick inv:fladen`, `klick @lehmoefen` → `W2_KUCH_MAX_0380`, `W2_FLADEN` bleibt „mit Datteln“; `klick inv:zwiebel`, `klick inv:brot` → `SYS_ERS_MAX_0120` | wie gd-w2 |

## Rätselübersicht des Klickwegs

(wird mit dem Durchlauf ergänzt)

| Schritt | Wie gelöst | Ergebnis im Spiel | Stand |
| --- | --- | --- | --- |
| R1 | Wechsel zu Pixel, Klick auf die Fähre | `W2_R01_GELOEST`, Flusskarte | geht |
| R2a | Bildtafel vom Schreiber, Bildtafel auf Schreiber: Mann, Katze, Pharao, Ohr | `W2_R02_A_GELOEST` | geht (Lösung steht oben in der Liste, GD-W2-07) |
| R2b | Pixel: Sobek im Nil-Delta anklicken (folgt), Pixel: Hofkater anklicken; Max: Thunfischdose auf Hofkater, Kaugummi auf Kaugummi | `W2_R02_B_GELOEST`, Audienz | geht (Bedienung des Wunders unklar, GD-W2-08) |
| R4 | Brot, Datteln, Zwiebel nehmen; Datteln auf Brot, Zwiebel auf Fladen, Fladen in den Ofen, Fladen auf Nebet | Olivenöl, `W2_R04_GELOEST` | geht |

## Weltübergreifende Funde, in Welt 2 bestätigt / nicht bestätigt

(wird ergänzt)

| Fund | In Welt 2 | Woran gesehen |
| --- | --- | --- |
| R5-P-13 / GD-W1-01 (letzte Menüzeile abgeschnitten) | bestätigt | Fährmann, Flusskarte, Schreiber (= GD-W2-01) |
| R5-P-08 / GD-W1-04 (Zuruf schluckt den nächsten Klick) | bestätigt, auch bei offenem Auswahlmenü | Flusskarte offen, `option` → nur `W2_ZURU_PIX_0010_2`, Auswahl bleibt offen; `klick @pharaonenteller` → nur `W2_ZURU_PIX_0030`, Teller bleibt liegen (= GD-W2-02) |
| GD-W1-03 (Pixel-Feld der Leiste unter dem Porträt) | bestätigt ab 12 Gegenständen | `belege/pr-w2/leiste_13_gegenstaende_pixelfeld_unter_portraet.png`; `inv`: PixelFeld bei (92,24), Porträt bei (80,28) |
| R5-W1-06 (Schrift der Nahansichten: B, Z) | bestätigt | Fährtafel: „Bitte“ liest sich „6itte“, „Zeit“ „2eit“ (`belege/pr-w2/nil_faehrtafel_nah_de_schrift_B_Z.png`) |
| R5-W1-02 (Pfote: „geh irgendwohin, wo du noch nicht warst“) | bestätigt | nach der Audienz: `pfote` → `W2_HINT_PIX_0010`; `status`: „Offene Rätselschritte: -“ (W2-01 damit nur zum Teil behoben: eigene Zeile für Welt 2, aber kein Ziel) |

## Frühere Funde, Stand heute

(wird ergänzt)

## Nicht bestätigt

## Gut gelöst

## Nicht geprüft

## Animationen

## Zeitmessungen

## Vorschläge für die Lessons Learned

## Werkzeug

- Zurufe: In Tempo 4 dauert ein `@id`-Klick rund 30 Spielsekunden (36 Probestellen); nach 45 s ohne Klick kommt Pixels Zuruf und schluckt den nächsten Befehl. Vor wichtigen Klicks `warte`.
- `option 2` wählt die zweite Zeile, nicht die Kennung [2]; Auswahllisten besser mit dem Text wählen (`option "Doch nicht"`).
- `stand sichern` klappt auch bei offenem Auswahlmenü (Flusskarte); ein solcher Stand wurde verworfen und neu angelegt.
