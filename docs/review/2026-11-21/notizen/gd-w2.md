# Notiz gd-w2: Game Designer und Durchspieler, Welt 2 „Antikodonien“

**Stand: in Arbeit (Zwischenstand, wird nach jedem Block ergänzt).**

- Rolle: Game Designer und Durchspieler. Umfang: Welt 2 vollständig (11 Räume, Fähre, R1 bis R13, Minispiele, Zustände, Max und Pixel) von der Ankunft bis zum Beginn des Zwischenspiels 2.
- Geprüfter Commit: `04c5a79f` (Prüf-Checkout `cq-r5`).
- Vorgehen: Fernsteuerung (`fs.py`) ohne Testmodus, echte Klicks. Lauf `cq-r5-lauf\gd-w2-haupt` (Hauptlauf), Kontrollpunkte unter `cq-r5-lauf\kontrollpunkte\welt-2\` mit `liste.md`. Lösungsweg als Befehlsfolge: `belege/gd-w2/loesungsweg.txt`.
- Ausgangslage: siehe „Werkzeug“ (Prolog mit Klicks gespielt, dann `start welt-2`, weil `start welt-2` allein kein Pflichtfach gibt).

## Funde

### Übergreifend (Oberfläche, Hinweise)

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W2-01 | nil_delta (alle Gespräche) | wichtig | Klickflächen | **Gesprächsmenü zeigt nur drei Zeilen, die vierte ist abgeschnitten.** Beim Fährmann (vier Optionen) ist „Dann warte ich halt.“, also der Ausstieg, nur zur Hälfte sichtbar und erst nach Rollen anklickbar. Im Probelauf am Dorfplatz (fünf Optionen) schon beobachtet; hier reicht die vierte. | `belege/gd-w2/nil_faehrmann_vierte_option_abgeschnitten.png`; Fernsteuerung: `klick @faehrmann`, `optionen` → „[0360] (erst nach Rollen sichtbar)“ | Menü auf vier ganze Zeilen auslegen (Zeilenhöhe oder Leistenhöhe), Ausstiegszeile immer sichtbar halten. |
| GD-W2-02 | nil_delta (alle Räume) | kosmetisch | Hinweise | **Ein Klick auf die Pfote während eines Zurufs schaltet nur den Zuruf weiter.** Zurufe („Der Fluss fließt …“) kommen nach etwa 45 s ohne Eingabe, also genau dann, wenn man auf die nächste Hinweisstufe wartet (30/60 s). Der Pfoten-Klick wird als Weiterklicken des Zurufs verbraucht, der Hinweis kommt erst beim zweiten Klick. Dreimal hintereinander so erlebt. Noch in Tempo 1 nachzustellen. | Fernsteuerung im Nil-Delta: `warte 61`, `pfote` → nur `W2_ZURU_PIX_0010_2`; zweites `pfote` → `HINWEIS Schritt R1, Stufe 2` (verlauf.txt des Laufs, Spielzeit 974–993) | Pfoten-Klick während eines Zurufs: Zuruf abbrechen und den Hinweis sofort geben; oder keine Zurufe, solange ein Hinweis läuft bzw. die Pfote für die nächste Stufe „reift“. |

| GD-W2-03 | alle Räume mit nehmbaren Dingen (belegt: nil_delta) | **kritisch** | Technik, Durchspielbarkeit | **Laden in derselben Sitzung lässt genommene Gegenstände verschwinden.** F5 (Schnellspeichern), Papyrusblatt nehmen, F9 (Schnellladen): Das Blatt ist weder im Inventar noch im Schilf; ein Klick auf die Stelle trifft nur noch „Schilf“. Dasselbe mit Laden über den Speicherweg (`stand holen`). Ursache am Code: `cq_raum.gd` Z. 765 blendet ein Prop aus, wenn `I.has_item_been_collected()` wahr ist; das Merkmal `ever_collected` der Gegenstands-Instanz (Popochiu `i_inventory.gd` Z. 273, 393) wird beim Laden nicht zurückgesetzt. Erst nach einem Neustart des Spiels ist das Prop wieder da (geprüft: derselbe Stand in neuem Prozess geladen, Blatt liegt wieder im Schilf). Betrifft jedes nehmbare Prop, in Welt 2 auch Pflichtdinge: Waage, Messbecher (R5), Brennspiegel (R11a), Essigkrug (R11b). Wer nach dem Einsammeln einen älteren Stand lädt, steht ohne Neustart in einer Sackgasse und erfährt nicht, warum. | Tempo 1, neuer Prozess: `stand holen 03_R1_geloest`, `taste f5`, `klick @papyrusblatt` (INVENTAR + papyrusblatt), `taste f9` → `objekte`: „@papyrusblatt … (unsichtbar)“, `inv`: ohne Papyrusblatt; `belege/gd-w2/laden_f9_papyrus_weg.png`, `belege/gd-w2/laden_papyrus_weg_nach_stand_holen.png` | Beim Laden `ever_collected` aller Gegenstände aus dem geladenen Stand neu setzen (oder zurücksetzen und aus dem Inventar plus einem gespeicherten Schalter „genommen“ ableiten); Sichtbarkeit der Props nicht an Popochius Sitzungsmerkmal hängen, sondern an einen eigenen Schalter im Spielstand. Test dazu: speichern, nehmen, laden, Prop muss sichtbar sein. |

### Nil-Delta

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W2-04 | nil_delta | wichtig | Klickflächen, Rätsel | **Die Sanduhr am Fährsteg ist nicht anklickbar.** Ihre Klickfläche (Bild-x 220–256) liegt ganz unter dem Fährmann (212–257); an 0 von 36 Probestellen gewinnt die Sanduhr. Laut Rätseldoku zeigt sie die Fahrtrichtung der Zeit an (Teil der Erklärung der Zeitfähre). | Fernsteuerung: `rklick @sanduhr` → „gewinnt an 0 von 36 Probestellen (sonst: faehrmann 36)“ | Fährmann oder Sanduhr um eine Figurbreite versetzen. |
| GD-W2-05 | nil_delta | kosmetisch | Positionierung | Max stellt sich zum Reden Nase an Nase in den Fährmann (Max x 184, Fährmann x 235, beide überlappen) und verdeckt dabei die Fährtafel. Schließt an W2-10 an (dort stand der Fährmann vor der Tafel; heute steht er rechts daneben, aber Max' Gesprächsplatz liegt vor der Tafel). | `belege/gd-w2/nil_faehrmann_vierte_option_abgeschnitten.png` | Gesprächsplatz (walk_to) 30 px weiter links oder rechts vom Fährmann. |

### Thronsaal

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W2-06 | thronsaal_ramses | wichtig | Timing, Positionierung | **Szenen im breiten Thronsaal spielen am Eingang, die Sprecher sind nicht im Bild.** Beim ersten Betreten bleibt die Kamera bei x 0; Max beschreibt „einen Thron, drei Stufen und einen Mann mit zwei Zeptern“, Ramses (Raum-x 955) und der Hofkater (770) antworten von außerhalb des Bildes, Pixel empört sich über ein Kissen, das man nicht sieht. Dasselbe bei der Gefolge-Szene (R2b): Sie läuft an der Tür ab, der Hofkater spricht unsichtbar, Pixel ist zu x 742 gelaufen und nicht im Bild, Sobek liegt quer vor dem Schreiber. | `belege/gd-w2/thron_erstes_betreten_thron_nicht_im_bild.png` (Stand direkt nach der Szene, Kamera x 0), `belege/gd-w2/thron_gefolge_szene_ohne_kater_und_pixel.png`; `status` nach der Szene: Ramses 955, Hofkater 770, Kamera 0 | Vor solchen Szenen Max bis vor den Thron laufen lassen (oder Kamerafahrt zum Thron und zurück); Gefolge-Szene erst auslösen, wenn Max beim Hofkater steht. |
| GD-W2-07 | thronsaal_ramses | wichtig | Rätsel | **Die Bildtafel ist eine Textliste, und ihre ersten vier Zeilen sind die Lösung.** Die „16 Kacheln“ erscheinen als Auswahlmenü mit Wörtern; sichtbar sind sechs, davon die ersten vier in Lösungsreihenfolge: Mann, Katze, Pharao, Ohr. Wer viermal von oben nach unten klickt, hat R2a gelöst, ohne die Inschrift gelesen zu haben. Es gibt keine Bilder (Max nennt es ein „Emoji-Menü aus Stein“), keine Anzeige, welches der vier Felder gerade dran ist, und keinen Abbruch: Esc öffnet das Pausemenü, eine Zeile „Doch nicht“ fehlt. Die Liste bleibt außerdem dort gerollt, wo die letzte Wahl lag. Falsche Sätze werden gut aufgefangen (eigene Pointen, Restfall erklärt die Grammatik, beliebig wiederholbar). | `belege/gd-w2/thron_kacheln_als_textliste_loesung_oben.png`; `welt_2.gd` Z. 34–36 (`KACHELN` beginnt mit `BOTSCHAFT`); Fernsteuerung: `klick inv:bildtafel`, `klick @schreiber`, `optionen` | Reihenfolge der Kacheln mischen (fest, aber nicht Lösung zuerst); Kopfzeile „Feld 1 von 4: Wer handelt?“; letzte Zeile „Doch nicht“. Besser: eigene Spielfläche mit 16 Bildkacheln und vier Feldern wie bei Hebel und Ringen. |
| GD-W2-08 | thronsaal_ramses (auch agora, stadion) | wichtig | Rätsel, Hinweise | **Das Wunder im Götter-Duell verlangt „Gegenstand auf sich selbst“, und nichts sagt das.** Die Kaugummiblase entsteht nur, wenn man den Kaugummi in der Leiste anklickt und dann noch einmal auf ihn selbst klickt. Naheliegende Versuche während des Duells geben nur Ersatzzeilen: Kaugummi auf den Hofkater („Nicht mal mit Cheatcode.“), auf Pixel, auf Ramses, auf das Pixel-Feld. Ansehen sagt immerhin „Ein Wunder? Ich hab einen Kaugummi. Erdbeere.“ Hinweisstufe 3 sagt „und dann: Kaugummiblase“, aber nicht, wie. Laut `cq_gegenstand.gd` Z. 87 ist „Gegenstand auf sich selbst“ nur als Zusatzreaktion gedacht; in Welt 2 hängen daran R2b (Kaugummi oder Brennspiegel) und R6a (Sandale anziehen). | Stand `10_duell_vor_wunder`; Fernsteuerung: `klick inv:kaugummi`, `klick @hofkater` → `SYS_ERS_MAX_0160`; … `klick @pixel` → `SYS_ERS_MAX_0020`; `klick @ramses` → `SYS_ERS_MAX_0200`; `klick inv:kaugummi`, `klick inv:kaugummi` → `W2_DUEL_MAX_0220` (Blase) | Kaugummi auf Hofkater, Pixel, Max und Ramses während des Duells ebenfalls als Lösung annehmen; Stufe 3 mit Bedienung: „Nimm den Kaugummi und kau ihn (zweimal anklicken).“ |
| GD-W2-09 | thronsaal_ramses | kosmetisch | Technik, Humor | Beim ersten Ansehen der Inschrift kommt Pixels Pointe („Eine Grammatik, in der das Essen ein Mund ist.“) **vor** der Nahansicht statt Max' Beschreibung (`W2_THRO_MAX_0270` kommt nie); nach dem Schließen sagt Pixel die Pointe noch einmal. Ursache: Der Eintrag hat die Bedingung „nach dem Lesen“, die `_bedingung_text()` nicht kennt (gleiche Art wie X-08). | Fernsteuerung: `rklick @inschrift` → `W2_THRO_PIX_0290`, dann Nahansicht, `knopf X` → `W2_THRO_MAX_0280`, `W2_THRO_PIX_0290`; `game/daten/raeume/welt-2.json` Z. 957–987 | Bedingung „nach dem Lesen“ in `_bedingung_text()` aufnehmen (Nahansicht schon gesehen) oder den Eintrag aus der Ansehen-Liste nehmen (die Szene nach der Nahansicht sagt ihn ohnehin). |
| GD-W2-10 | thronsaal_ramses | kosmetisch | Positionierung | Max stellt sich zum Reden in die Figuren: beim Schreiber Kopf an Kopf, bei Ramses auf die Thronstufen genau vor ihn (Max 955,292; Ramses 955,266), Ramses ist dann ganz verdeckt. Der Hofkater „lässt nicht durch“ (`W2_DUEL_MAX_0010`), Max kann aber vorher schon zum Thron und in die Küche laufen. Nach dem Duell bleibt Sobek bis zum nächsten Raumwechsel bei x 255 vor dem Schreiber liegen (`status` nach R2b). | `belege/gd-w2/thron_ramses_letzte_option_fast_unsichtbar_max_verdeckt_ramses.png`, `belege/gd-w2/thron_kacheln_als_textliste_loesung_oben.png` | Gesprächsplätze neben die Figuren legen; Sobek nach dem Duell hinauskriechen lassen. |

### Palastküche

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| GD-W2-11 | palastkueche | kosmetisch | Rätsel, Hinweise | **R4 setzt die Sandalen voraus, bevor es sie gibt.** Die Küche ist ab Start erreichbar. Max eröffnet bei Nebet mit „Ich bräuchte etwas Öl“, ohne Grund; Hinweisstufe 1 sagt „Die Sandalen wollen weg, und Öl hält Riemen“, obwohl Max die Sandalen erst nach dem Startpass bekommt und bis dahin nichts von ihnen weiß. | Stand `12_palastkueche_erstes_betreten`: `pfote` → `W2_HINT_PIX_0410`; `klick @nebet` → `W2_KUCH_MAX_0140` | Vor den Sandalen andere Eröffnung („Riecht gut hier. Kann man bei dir was bekommen?“) und Stufe 1 ohne Sandalen („Die Köchin hütet ihr Öl. So ein Krug ist bestimmt noch für etwas gut.“); die Sandalen-Fassung erst, wenn Max sie hat. |
| GD-W2-12 | palastkueche | kosmetisch | Rätsel | Kleinigkeiten beim Kochen: (a) Ansehen des Traubensafts (Rechtsklick) sagt die Nehmen-Zeile „Ich nehm den Saft mit“ samt Nebets Erlaubnis, nimmt aber nichts; der Hotspot „Traubensaft-Amphore“ dahinter gewinnt an 0 von 36 Stellen (Umkehrung von W2-17, der Saft selbst ist jetzt nehmbar). (b) Der Fladen „mit Datteln“ (ohne Zwiebel) im Ofen: „Ab in den Ofen. Und jetzt warten …“, es passiert aber nichts, er bleibt „mit Datteln“. (c) Falsche Reihenfolgen (Zwiebel auf Brot, Zwiebel auf Datteln, Brot in den Ofen, Brot an Nebet) geben nur Ersatzzeilen ohne Richtung. | Fernsteuerung: `rklick @traubensaft` → `W2_KUCH_MAX_0110`, `W2_KUCH_NEB_0120`, kein INVENTAR; `rklick @traubensaft_amphore` → „gewinnt an 0 von 36“; `klick inv:fladen`, `klick @lehmoefen` (Fladen mit Datteln) → `W2_KUCH_MAX_0380`, Wert `W2_FLADEN` bleibt „mit Datteln“ | (a) eigene Ansehen-Zeile für den Saft, Hotspot entfernen; (b) Zeile „Da fehlt noch was obendrauf. Pixel hat Zwiebeln gesagt.“; (c) eine Zeile für „falsche Reihenfolge“ („Pixel hat gesagt: erst Datteln.“). |

## Rätsel-Übersicht

(folgt)

## Pacing

- Ankunft im Nil-Delta (13 Zeilen), Textmodus `lesen`: rund 107 Spielsekunden vom Raumwechsel bis zur Eingabe (Messung im ersten Probestart, Raumwechsel bei 94,6 s, frei bei 202,0 s).

## Frühere Funde, Stand heute

(folgt)

## Gut gelöst

(folgt)

## Nicht geprüft

(folgt)

## Vorschläge für die Lessons Learned

(folgt)

## Werkzeug

- **`start welt-2` aus dem Hauptmenü gibt Max kein Pflichtfach:** Reisetasche, Notizbuch und Thunfischdose fehlen (Inventar nur Handy, Kaugummi, Kugelschreiber, Pixel-Feld), weil `welt_beginnen` nur behält, was Max schon hat. Ohne Thunfischdose ist R2b nicht lösbar. Umgangen: Prolog mit echten Klicks gespielt („Neues Spiel“ bis zur Ankunft am Dorfplatz, rund 8 Spielminuten), dort `start welt-2`. Es fehlen damit nur der Kochlöffel-Zauberstab und die zwei Wahlfächer aus Welt 1 (Weg D mit der Sortierenden Socke ist so nicht prüfbar).
- `start hauptmenue` nach `start welt-2` im selben Prozess und dann „Neues Spiel“: Der Prolog begann mit den Schaltern und dem Inventar von Welt 2 und ohne Max im Raum. Das ist sehr wahrscheinlich ein Artefakt des Werkzeugs (Szenenwechsel ohne den Rückweg des Spiels über das Pausemenü), kein Fund; Godot neu gestartet.
- „Neues Spiel“ im Hauptmenü braucht zwei bis drei Klicks (Kanal wählen, bei vorhandenem Stand Sicherheitsabfrage).
