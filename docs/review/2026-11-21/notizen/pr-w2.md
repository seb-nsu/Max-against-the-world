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

### Speichern und Laden in Welt 2

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W2-06 | agora (gilt für jedes Gespräch mit Einmal-Optionen) | **kritisch** | Durchspielbarkeit, Technik | **Wer in derselben Sitzung einen älteren Stand lädt, bekommt schon gewählte Gesprächsoptionen nicht wieder: R9 wird unlösbar.** Ablauf: Stand `w2_17_agora_anfang` (Agora eben betreten, mit den Griechen noch nie geredet), Menge anklicken, „Wie haltet ihr Cicero aus?“ (0420, gibt Konter 5 und löst R9), „Danke für das Gespräch.“ Danach in derselben Sitzung `w2_17` wieder laden und die Menge anklicken: Das Gespräch bietet nur noch „Danke für das Gespräch.“ (als „schon gewählt“ markiert), die Option 0420 fehlt. `W2_KONTER` steht bei [1, 2, 3, 4], R9 ist offen und bleibt es; auch beim nächsten Ansprechen kommt die Option nicht wieder. Konter 5 ist Pflicht für das Rede-Ringen (einziger Konter für Linie 4), ohne R9 beginnt der Finaltag nicht. Zweimal hintereinander nachgestellt. Gleiche Familie wie R5-P-01 (Props) und R5-W1-34 (Gespräche nach Neustart), aber ein eigener Weg: Der Zustand der Optionen lebt im Speicher des laufenden Programms und wird beim Laden nicht zurückgesetzt, wenn der geladene Stand zu diesem Gespräch noch nichts enthält (Ursache aus dem Verhalten geschlossen, im Code noch nicht nachgelesen). Ob ein Programm-Neustart es heilt, wird noch geprüft. Betroffen sind alle Gespräche, deren Rätseloption nach der Wahl verschwindet. | `belege/pr-w2/agora_nach_laden_konter_option_fehlt.png`; Lauf `pr-w2-haupt`: `stand holen w2_17_agora_anfang`, `klick @menge`, `optionen` → nur „[0430] (schon gewählt)“; `lies Z.wert("W2_KONTER")` = [1, 2, 3, 4]; `lies Z.geloest("R9")` = false | Beim Laden den Zustand aller Gespräche zurücksetzen und dann aus dem Stand füllen (auch für Gespräche, die im Stand fehlen). Rätselwichtige Optionen zusätzlich an den Rätselschalter binden statt an „schon gewählt“ (0420 anbieten, solange Konter 5 fehlt). Test: Stand vor dem Gespräch, Option wählen, Stand laden, Option muss wieder da sein. |

### Inventarleiste in Welt 2

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W1-03 | alle (gesehen: Palastküche, Startbüro) | wichtig | Sonstiges (Oberfläche), Durchspielbarkeit | **In Welt 2 bestätigt und hier schwerer.** Ab 12 Gegenständen rutscht die Leiste nach links unter die Porträts: bei 12 und 13 liegt das Pixel-Feld bei x 92 unter dem Pixel-Porträt (Mitte 80). Nach 14 Gegenständen (Formular und Kugelschreiber zusammen) beginnt die Leiste bei x 53 und bleibt dort auch mit 13: Pixel-Feld **und Thunfischdose** sind unsichtbar, das erste sichtbare Bild ist das Notizbuch. Ein Klick auf die Thunfischdose (Leiste, x 92) trifft das Porträt: „FIGUR jetzt Pixel“. `maus 92 24` und `maus 75 24` melden das Porträt, erst bei x 108 die Leiste: von 36 px Breite bleiben rund 6 px. Welt 2 hat viel Inventar; wer vor dem Götter-Duell erkundet (Papyrus, Brot, Datteln, Zwiebel, Traubensaft, Bildtafel und nach der Fähre Formular, Waage, Messbecher, Brennspiegel, Essigkrug, Tintenfass), hat 14 und mehr Teile, und die Opfergabe für R2b (Thunfischdose, zweiter Platz) ist dann weder zu sehen noch sinnvoll anzuklicken. Wie die Leiste sich ab 16 Teilen verhält, wird im weiteren Lauf geprüft. | `belege/pr-w2/leiste_13_gegenstaende_pixelfeld_unter_portraet.png`, `belege/pr-w2/leiste_13_nach_14_zwei_gegenstaende_unter_portraets_hermes.png`; `inv` (PixelFeld bei (53,24), Thunfischdose bei (92,24)); `klick inv:thunfischdose` → „FIGUR jetzt Pixel“ | Leiste rechts neben den Porträts beginnen lassen (x ab 110) und bei Überlänge blättern (Pfeile) oder zweizeilig; nie unter Porträts oder Pfote schieben. |
| R5-W2-07 | alle Gespräche (gesehen: Startbüro, Stadion) | wichtig | Sonstiges (Oberfläche) | **Das Gesprächsmenü bleibt gerollt.** Hat man in einem Menü nach unten gerollt (nötig für die letzte, abgeschnittene Zeile, GD-W2-01), öffnet das nächste Menü in derselben Rollstellung: Bei Beamter 1, Beamter 2 (je drei Optionen) und Leonidas (vier) ist dann die **erste** Zeile oben abgeschnitten statt der letzten. Der Vorgänger hat es bei der Bildtafel gesehen (Teil von GD-W2-07); es gilt für alle Menüs. | `belege/pr-w2/buero_menue_bleibt_gerollt_erste_option_abgeschnitten_max_verdeckt_beamter.png`; `optionen` bei Beamter 1: „1 [0170] (erst nach Rollen sichtbar)“ | Beim Öffnen jedes Menüs die Rollstellung auf den Anfang setzen (und das Feld hoch genug machen, R5-P-13). |

### Nil-Delta, Nachtrag

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W2-08 | nil_delta | wichtig | Positionierung, Zustandswechsel | **Nach dem Götter-Duell liegt Sobek im Sand unter dem Fährmann.** Sobeks Bild im Nil-Delta ist das flache Wasserbild (Kopf und Rücken über der Wasserlinie). Nach R2b steht er bei Raum (209,325) auf dem Strand, direkt vor den Füßen des Fährmanns (235,302), statt im Wasser bei (312,240): ein grüner Streifen im Sand. `W2_SOBEK_FOLGT` bleibt nach dem Duell gesetzt. | `belege/pr-w2/nil_sobek_nach_duell_im_sand_unter_faehrmann.png`; `status` im Nil-Delta nach R2b: „Sobek bei Raum (209,325)“ | Nach R2b `W2_SOBEK_FOLGT` löschen und Sobek an seinen Platz im Wasser setzen; im Nil-Delta beim Folgen das Kriech-Bild aus dem Thronsaal benutzen. |
| R5-W2-09 | nil_delta, thronsaal_ramses | kosmetisch | Animation, Hinweise | Pixel holt Sobek als Gefolge (Pixel klickt Sobek): Es kommt nur die Ansehen-Pointe („Das erste vernünftige Reptil …“, `W2_INV_PIX_0080`), kein Wort und keine Bewegung dazu, dass Sobek jetzt mitkommt. Dass es geklappt hat, sieht man erst im Thronsaal. Auch bei R1 verneigt sich Sobek nur im Text (Teil von W2-04). | Stand `w2_04_nach_R2a`: `portraet pixel`, `klick @sobek` → `W2_INV_PIX_0080`, `ZUSTAND W2_SOBEK_FOLGT` | Eine Zeile („Komm mit. Du bist ab jetzt Gefolge.“) und Sobek sichtbar aus dem Wasser kriechen lassen. |

### Sphinx

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W2-10 | sphinx | wichtig | Positionierung, Klickflächen | **Max steht zum Reden auf der Sphinx, und die Rätsel-Option ist die abgeschnittene.** Gesprächsplatz ist Raum (513,241): Max' Füße stehen mitten auf dem Körper der Sphinx, nicht im Sand; er schaut auf ihre Brust, die Sphinx schaut nach rechts aus dem Bild. Im Menü mit fünf Zeilen ist „Ich stell dir ein Rätsel.“ (0250), die einzige Zeile, die R8 startet, die fünfte und nur als halbe Zeile zu sehen. | `belege/pr-w2/sphinx_max_steht_auf_der_sphinx_raetseloption_abgeschnitten.png`; `optionen` → „5 [0250] (erst nach Rollen sichtbar)“ | Gesprächsplatz im Sand vor den Vorderpfoten (etwa (400,290)); Rätsel-Option an die erste Stelle. |
| R5-W2-11 | sphinx | kosmetisch | Rätsel, Humor | Kleinigkeiten bei R8: (a) Die Bausteine stehen in der Reihenfolge, in der man sie gesammelt hat; nach dem normalen Anfang (Fährmann, dann Handy ansehen) sind die ersten drei Zeilen die Lösung für „Handy“. (b) In der Bausteinliste gibt es kein „Doch nicht“. (c) Wer ein Wort wählt, für das ihm ein Baustein fehlt (Kugelschreiber ohne „blau“), erfährt das nicht; die Sphinx kommentiert nur den dritten, unpassenden Baustein. (d) Nach der Lösung mit dem Handy sagt Pixel: „… du hast sie mit einem Kugelschreiber gelöst. Oder mit Kaugummi.“ (`W2_SPHX_PIX_0530`). (e) „Ich stell dir ein Rätsel.“ bleibt nach R8 im Menü. Gut: Ansehen eines Wunderdings gibt jetzt beide Bausteine auf einmal, falsche Bausteine werden konkret kommentiert (W2-22 damit im Kern behoben). | Lauf ab `w2_13_sphinx_anfang`: `option 0250`, `option "Kugelschreiber"`, drei Bausteine → `W2_SPHX_SPH_0370`; Lösung → `W2_SPHX_PIX_0530` | (a) Liste mischen; (b) „Doch nicht“ ergänzen; (c) Zeile der Sphinx: „Zwei passen. Der dritte fehlt dir noch.“; (d) Zeile je Lösungswort; (e) Option nach R8 ausblenden. |

### Fährsteg Olympia, Agora, Startbüro, Stadion (erster Besuch)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| R5-W2-12 | faehrsteg_olympia, startbuero (und die übrigen fünf Räume aus derselben Quelle, noch anzusehen) | wichtig | Grafik (Stil-Einheit) | **Zwei Malstile in einer Welt.** Nil-Delta, Thronsaal, Agora und Stadion sind weich gemalt, ohne Konturen. Fährsteg Olympia und Startbüro haben dicke schwarze Konturen, kräftigere Farben und einen Comic-Strich. Der Wechsel fällt bei der ersten Fährfahrt auf: derselbe Fährmann, derselbe Fluss, anderes Bild. | `belege/pr-w2/olympia_steg_stil_dicke_konturen.png` gegen `belege/pr-w2/nil_faehrmann_menue_vierte_option_abgeschnitten_max_im_faehrmann.png`; `belege/pr-w2/buero_beamte_groesser_als_max_bank_vor_tuer.png` | Die sieben Räume der zweiten Quelle nachbearbeiten (Konturen aufhellen oder entfernen, Sättigung an die vier Breiträume angleichen) oder die vier Breiträume im selben Strich neu fassen. |
| R5-W2-13 | agora | wichtig | Lokalisierung, Technik | **Die Option „Wie haltet ihr Cicero aus?“ wird als Zeile eines unbekannten Sprechers abgespielt.** Die Fernsteuerung meldet `SAGT UI_OPT_W2_AGOR_GRI_0420 | W2: Wie haltet ihr Cicero aus?`: Der Textschlüssel der Option steht dort, wo sonst die Zeile von Max steht, als Sprecher „W2“. Wie das im Bild aussieht (Farbe, Lage, wer den Mund bewegt), ist noch aufzunehmen. | Lauf ab `w2_17_agora_anfang`: `klick @menge`, `option 0420` | Eigene Zeile `W2_AGOR_MAX_0420` für Max anlegen. |
| R5-W2-14 | agora | kosmetisch | Klickflächen, Hinweise | Konter aus der Tonne: Pixel auf den Philosophen gibt eine Ersatzzeile („Ich bin ein Kater, kein Schraubenzieher.“), nur der Klick auf die Tonne zählt; die Tonne gewinnt aber nur an 10 von 36 Probestellen (sonst Philosoph 16, Max 10). Die Menge (Griechen, Pflicht für R9) gewinnt an 10 von 31 (sonst Rednerpult, Cicero, Säule). | `portraet pixel`, `klick @philosoph` → `SYS_ERS_PIX_0240`; `klick @tonne` → „gewinnt 10/36“; `klick @menge` → „gewinnt 10/31“ | Pixel auf Philosoph wie Pixel auf Tonne behandeln; Klickfläche der Menge vor Rednerpult und Säule legen. |
| R5-W2-15 | startbuero | kosmetisch | Größen, Positionierung | Beamter 2 steht hinter dem Schalter und ist größer als Max im Vordergrund (Klickfläche y 57–214 gegen Max 90–250 an der Tür); die Wartenden auf der Bank sind halb so groß. Zum Reden stellt sich Max bei (255,218) genau vor Beamter 1 und verdeckt ihn ganz, seine Füße stehen auf Höhe der Schalterplatte. | `belege/pr-w2/buero_beamte_groesser_als_max_bank_vor_tuer.png`, `belege/pr-w2/buero_menue_bleibt_gerollt_erste_option_abgeschnitten_max_verdeckt_beamter.png` | Gesprächsplatz vor den Schalter (y um 270) und seitlich versetzt; Beamte um etwa 15 % kleiner. |
| R5-W2-16 | palastkueche, startbuero | kosmetisch | Animation, Positionierung | Übergaben ohne Hingehen: Mit einem Gegenstand in der Hand geht Max nicht zur Figur. Der Fladen wird Nebet vom Ofen aus gegeben (Max (170,260), Nebet (408,262)), das Rundschreiben dem Beamten aus der Raummitte (Max (300,320), Beamter (255,213)). In Tempo 1 noch zu filmen. | `klick inv:fladen`, `klick @nebet` → `LAGE … Max (170,260)`; `klick inv:rundschreiben`, `klick @beamter_1` → `LAGE … Max (300,320)` | Bei „Gegenstand auf Figur“ erst zum Gesprächsplatz laufen, dann die Geste `benutzen`. |

**Offene Verdachtsfälle (noch nachzustellen):** Woher der Spieler das Fladen-Rezept erfährt (Pixel verspricht es „später, unter vier Augen“; im Lauf nie gehört). Zurufe mehrfach gestapelt nach langer Pause (`W2_ZURU_PIX_0100_2`/`0040_2` je viermal im selben Augenblick). Leiste ab 16 Gegenständen. R5-W2-06 nach Programm-Neustart.

**Nächster Schritt (Stand 25.11., 13:10 UTC):** Lauf neu starten, `w2_22_nach_R3` holen (R1, R2a, R2b, R4, R8, R9, R3a, R3b gelöst, Sandalen geölt), dann Syrakus (R5), Tag 1, R6, R7, R10, Finaltag, R11, Zwischenspiel 2, Welt 3.

## Rätselübersicht des Klickwegs

(wird mit dem Durchlauf ergänzt)

| Schritt | Wie gelöst | Ergebnis im Spiel | Stand |
| --- | --- | --- | --- |
| R1 | Wechsel zu Pixel, Klick auf die Fähre | `W2_R01_GELOEST`, Flusskarte | geht |
| R2a | Bildtafel vom Schreiber, Bildtafel auf Schreiber: Mann, Katze, Pharao, Ohr | `W2_R02_A_GELOEST` | geht (Lösung steht oben in der Liste, GD-W2-07) |
| R2b | Pixel: Sobek im Nil-Delta anklicken (folgt), Pixel: Hofkater anklicken; Max: Thunfischdose auf Hofkater, Kaugummi auf Kaugummi | `W2_R02_B_GELOEST`, Audienz | geht (Bedienung des Wunders unklar, GD-W2-08) |
| R4 | Brot, Datteln, Zwiebel nehmen; Datteln auf Brot, Zwiebel auf Fladen, Fladen in den Ofen, Fladen auf Nebet | Olivenöl, `W2_R04_GELOEST` | geht |
| R8 | Sphinx: „Ich stell dir ein Rätsel.“, Wort Handy, Bausteine stirbt, klingelt, leuchtet | Schriftrolle, Konter 1 bis 3 | geht (Rätsel-Option abgeschnitten, R5-W2-10) |
| R9 | Agora: Menge anklicken (Konter 4), Option „Wie haltet ihr Cicero aus?“ (Konter 5); freiwillig Pixel auf die Tonne (Konter 6, 7) | `W2_R09_GELOEST` | geht; nach Laden eines älteren Stands in derselben Sitzung nicht mehr (R5-W2-06) |
| R3a | Startbüro: leeres Formular nehmen, Kugelschreiber auf Formular (Weg A) | Rundschreiben, Kugelschreiber weg | geht |
| R3b | Rundschreiben auf Beamter 1 | Startpass, Sandalen von Hermes | geht |
| (Öl) | Olivenöl auf Sandalen | `W2_SANDALEN_GEOELT` | geht |

## Weltübergreifende Funde, in Welt 2 bestätigt / nicht bestätigt

(wird ergänzt)

| Fund | In Welt 2 | Woran gesehen |
| --- | --- | --- |
| R5-P-13 / GD-W1-01 (letzte Menüzeile abgeschnitten) | bestätigt | Fährmann, Flusskarte, Schreiber (= GD-W2-01) |
| R5-P-08 / GD-W1-04 (Zuruf schluckt den nächsten Klick) | bestätigt, auch bei offenem Auswahlmenü | Flusskarte offen, `option` → nur `W2_ZURU_PIX_0010_2`, Auswahl bleibt offen; `klick @pharaonenteller` → nur `W2_ZURU_PIX_0030`, Teller bleibt liegen (= GD-W2-02) |
| GD-W1-03 (Pixel-Feld der Leiste unter dem Porträt) | bestätigt ab 12 Gegenständen | `belege/pr-w2/leiste_13_gegenstaende_pixelfeld_unter_portraet.png`; `inv`: PixelFeld bei (92,24), Porträt bei (80,28) |
| R5-W1-06 (Schrift der Nahansichten: B, Z) | bestätigt | Fährtafel: „Bitte“ liest sich „6itte“, „Zeit“ „2eit“ (`belege/pr-w2/nil_faehrtafel_nah_de_schrift_B_Z.png`) |
| R5-W1-34 (Gespräche hängen nach Neustart und Laden) | **bestätigt (kritisch)** | Frischer Prozess, `stand holen w2_22_nach_R3`, `klick @beamter_1` (mit ihm war vor dem Speichern geredet worden): `GESPRÄCH beginnt: Beamter1`, danach `STEHT seit 20 Spielsekunden ohne Fortschritt`, keine Optionen, Esc und Klick wirkungslos (`belege/pr-w2/buero_gespraech_haengt_nach_neustart_und_laden.png`). In Welt 2 trifft das nach jedem Weiterspielen am nächsten Tag: Fährmann, Schreiber, Nebet, Sphinx (Empfehlungsschreiben), Cicero, Brian, Leonidas, Beamte. |
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
