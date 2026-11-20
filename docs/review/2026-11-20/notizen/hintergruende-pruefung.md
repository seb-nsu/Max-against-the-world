# Prüfung der neuen Welt-3-Hintergründe (Sebastians Gemini-Chat, 20.11.2026)

Geprüft auf `8238f09d` im Checkout `cq-r4`. Quelle: 24 JPEG-Originale im Upload-Ordner der Sitzung (17 aus der ersten Lieferung, 7 nachgereicht), nur gelesen, nicht kopiert. Panoramen 3904 × 1088 (3,59 : 1, beim Einbau auf 1280 × 360 sind das 0,9 % Höhenverzerrung oder 3 px Beschnitt), übrige 2752 × 1536 (1,79 : 1, wird 640 × 360).

Maßstab: Rohbau und Notiz je Raum (`docs/grafik/skizzen/welt-3/rohbau/`, inkl. `.json` mit Figurenplätzen), Prompts in `docs/grafik/fertige-prompts/welt-3.md`, AP-09 und die zugehörigen Funde im `bericht.md`, Ansehen-Zeilen in `docs/skript/welt-3.md`, Zustandsbedingungen in `tools/layout/welt-3.yaml`, Stil gegen `game/grafik/hintergruende/w1_*`, `w2_*`.

Belege unter [`belege/hintergruende/`](../belege/hintergruende/):

- `vergleich_<raum>_<zustand>_<id>.png`: Rohbau-Notiz | Bild | Überlagerung 55/45, auf Rohbaugröße skaliert (24 Stück).
- `differenz_<raum>_<a>-<b>.png`: A | B | Differenz auf Spielauflösung (rot = geändert außerhalb der gelben Box, blau = in der Box; 13 Paare).
- `details_zoom.png`: Kaffee-Ecke, Wecker Tag/Nacht, Kritzelei, Küchenregal, Einhorn, Fenster über Kapsel 1, Farbfelder.
- `stadtstrasse_tueren_massstab.png`: Glastür und Omas Haustür gegen Rohbau.
- `stil_w1_w2_w3alt_neu.png`: W1 Taverne, W2 Palastküche, alter Laboreingang, drei neue Bilder auf 640 × 360.

## Zuordnung

Die Zuordnung des Koordinators für die 7 Nachlieferungen stimmt (rr2u8f, rrypic, sriwbd, ts0zpi, u18lmq, vlptf0, xbk7bh).

| Bild (Kennung) | Raum | Zustand | Datei im Spiel (Layout) |
| --- | --- | --- | --- |
| 909jin | unterstadt_strasse | Grund (Panorama) | w3_bg_unterstadt_strasse |
| 6738f7 | apothekengasse | Fächer zu (Panorama) | w3_bg_apothekengasse |
| xbk7bh | apothekengasse | Fächer offen (R3a) | w3_bg_apothekengasse_faecher_offen |
| 8erqoz | widerstandsbasis | Grund: Fenster zu, Tasse auf dem Tisch (Panorama) | w3_bg_widerstandsbasis |
| cggbpp | widerstandsbasis | Schnee: Fenster offen, Tasse noch da (W3_SCHNEE) | w3_bg_widerstandsbasis_schnee |
| 3qpige | widerstandsbasis | Schnee + Kaffee: Fenster offen, Tasse weg (R13+W3_SCHNEE) | w3_bg_widerstandsbasis_schnee_kaffee |
| e84lk0 | kuehlung | Eimer voll | w3_bg_kuehlung |
| nujisr | kuehlung | Eimer gekippt, getaut (W3_EIMER_GEKIPPT) | w3_bg_kuehlung_taut |
| rr2u8f | laboreingang | Panzertür zu | w3_bg_laboreingang |
| e4htav | laboreingang | Panzertür offen (W3_PANZERTUER_OFFEN) | w3_bg_laboreingang_offen |
| dznfdm | stadtstrasse | Tag (Panorama) | w3_bg_stadtstrasse |
| i6wbqn | stadtstrasse | Nacht (W3_NACHT) | w3_bg_stadtstrasse_nacht |
| l337lu | kueche_orakel | mit Sparschwein | w3_bg_kueche_orakel |
| p50wdf | kueche_orakel | Sparschwein weg, Scherben (R4) | w3_bg_kueche_orakel_scherben |
| u18lmq | buero_50 | Grund (Panorama, Vorraum mit endlosem Flur) | w3_bg_buero_50 |
| vlptf0 | testkammer_1 | Ausgangstür zu | w3_bg_testkammer_1 |
| ts0zpi | testkammer_1 | Ausgangstür offen (R9b) | w3_bg_testkammer_1_offen |
| ha447k | testkammer_2 | Laser tödlich, rot | w3_bg_testkammer_2 |
| sriwbd | testkammer_2 | Laser harmlos, rosa (R9c) | w3_bg_testkammer_2_laser_gestoert |
| rrypic | testkammer_3 | Tür zu, Schloss-Symbol | w3_bg_testkammer_3 |
| bfift3 | testkammer_3 | Tür offen (R9d) | w3_bg_testkammer_3_offen |
| 3psofb | kern | Zelle glühend | w3_bg_kern |
| p0l1a6 | kern | Zelle vereist (W3_ZELLE_KALT) | w3_bg_kern_vereist |
| 16psne | kern | Sockel leer (R11) | w3_bg_kern_sockel_leer |

## Fehlende Bilder und Zustände

- **widerstandsbasis Kaffee ohne Schnee** (`w3_bg_widerstandsbasis_kaffee`, Bedingung R13 ohne W3_SCHNEE). Kein neues Bild nötig: Grund 8erqoz plus Kaffee-Ecke aus 3qpige (x ≈ 970–1280 von 1280, vor dem Einsetzen 4 px nach rechts schieben, siehe Varianten). Vorher muss der Kaffee selbst nachgearbeitet werden (siehe 3qpige).
- **Code-Sicht (W3-R13)**: kein Bild geliefert. Laut Prompt eine Überlagerung je Szene; sie lässt sich aus den fertigen Hintergründen per Kantenfilter erzeugen und muss nicht gemalt werden.
- Alle zwölf Räume mit allen Zuständen aus Prompt und Layout sind sonst da. Büro 50, Testkammer 1 und der geschlossene Laboreingang sind geliefert.

## Varianten: nur die geänderte Stelle?

Gemessen auf Spielauflösung (1280 × 360 oder 640 × 360, Box-Verkleinerung), Schwelle 40 je Kanal. „Versatz“ per Phasenkorrelation auf Kantenbildern, je 256-px-Streifen. „Kanten verschoben“ = Anteil der Kanten außerhalb der erwarteten Stelle, die im anderen Bild nicht innerhalb von 2 px liegen.

| Paar | Versatz (px, 1280 breit bzw. 640) | geändert außerhalb der Stelle | Kanten verschoben außerhalb | Ergebnis |
| --- | --- | --- | --- | --- |
| Basis Grund → Schnee (8erqoz → cggbpp) | links 0, nach rechts zunehmend −2 bis −5 | 12,3 % | 12,5 % | **Neu gezeichnet und gedehnt.** Nur Fenster und Schnee (x 215–435) in den Grund einsetzen; dort beträgt der Versatz 0 bis 2 px, das ist in Aseprite machbar. |
| Basis Schnee → Schnee+Kaffee (cggbpp → 3qpige) | −1 bis −5, rechts +1 bis +2 | 10,1 % | 13,1 % | Neu gezeichnet. Nur die Ecke rechts übernehmen. |
| Basis Grund → Schnee+Kaffee (8erqoz → 3qpige) | −1 bis −6 | 15,5 % | 21,5 % | Als Ganzes nicht verwendbar; aus Grund + Fensterstelle + Kaffee-Ecke (Ecke 4 px versetzt) zusammensetzen. |
| Kern glühend → vereist | 0 | 1,6 % | 1,8 % | Gut. Nur Zelle und Sockel einsetzen. |
| Kern vereist → leer | 0 | 1,7 % | 1,9 % | Gut. |
| Stadtstraße Tag → Nacht | −2 bis −6, rechter Rand 0 | (ganzes Bild neu belichtet) | 13,3 % | Neu gezeichnet und um bis zu 6 px gedehnt. Einsetzen geht nicht, weil das Licht überall wechselt. Als eigenes Vollbild nutzbar; Klickflächen weichen um höchstens 6 px ab. Den Nachttisch aus jedem Bild getrennt ausschneiden. |
| Küche Sparschwein → Scherben | 0 | 1,5 % | 4,9 % | Gut. Nur Regal und Scherben einsetzen. |
| Kühlung voll → gekippt | 0 | 0,4 % | 5,7 % | Gut. |
| Laboreingang zu → offen | 0 | 0,5 % | 11,3 % (Pfützen und Eimer leicht anders) | Gut. Nur die Tür einsetzen. |
| Apotheke zu → offen | 0 bis −1 | 2,2 % | 13,6 % (Regenstriche, Neonschein) | Gut. Nur die Fächer einsetzen, der gemalte Regen ist zufällig anders. |
| Kammer 1 zu → offen | 0 | 2,3 % | 1,0 % | Sehr gut. |
| Kammer 2 tödlich → harmlos | 0 | 1,2 % | 1,6 % (Kritzelei neu geschrieben) | Gut. Nur die Strahlen einsetzen. |
| Kammer 3 zu → offen | 0 | 0,1 % | 2,5 % | Sehr gut. |

Fazit: Alle 16:9-Varianten und die Apotheke sind sauber genug, dass das Einsetzen nur der geänderten Stelle ohne Nacharbeit klappt. Die Panorama-Varianten von Basis und Stadtstraße hat Gemini neu gezeichnet und dabei waagerecht gedehnt (bis 6 px auf 1280).

## Prüfung je Bild

Maßstab: Max vorn ist im Rohbau 183 px hoch (51 % der Bildhöhe), hinten im Laufband etwa 156–162 px. In allen Bildern passen Türen, Möbel und Geräte zu diesen Maßen auf ±15 % (Beispiele: Telefonzelle 203 px ≈ 2,2 m, Automat 205 px ≈ 2,2 m, Küchentisch auf Hüfthöhe wie im Rohbau, Glastür im Turm nach Perspektive ≈ 2,0 m, Omas Haustür ≈ 2,3 m). Personen oder Tiere sind in keinem Bild gemalt. Das Laufband vorn ist überall frei.

| Bild | Raum, Zustand | Passt zu Rohbau, Prompt, AP-09, Skript | Abweichungen | Urteil |
| --- | --- | --- | --- | --- |
| 909jin | Unterstadt | Aufbau deckt sich mit dem Rohbau: Nudelbude mit vier Hockern, Topf, Laterne, Säule, Telefonzelle mit Telefon und Buch, Luke halb offen, Heckflosse, Vordach mit Rolltor, Pizza-Neon, grüne Gasse, Unterführung mit runder Tür, Dampfgitter. Plätze für Herrn Vier, den weinenden Mann, Deckert, Musiker und Frau sind frei. | **Origami-Einhorn etwa 44 × 30 px**, AP-09 (W3-R01-03) will etwa handgroß, also rund 20 px; es ist hell und zieht den Blick. Dampf über Topf und Gitter sowie Regenstriche sind gemalt, obwohl es dafür die Effekte Nudeltopf, Regen und Gitter gibt (doppelt, aber stimmig). | **Kleine Nacharbeit:** Einhorn in Aseprite auf etwa 20 × 14 px verkleinern und eine Stufe abdunkeln, Pfütze drumherum lassen. |
| 6738f7 | Apothekengasse, zu | Volle Breite, Automat mittig mit Linse, Kreuz, Fächern rot/blau zu; Kisten, Fallrohr, Ausgang links, Wandlampe, Container, Rattenloch, freie Bahn davor. Morphäus' Platz frei. Deckt sich fast deckungsgleich mit dem Rohbau. | Fallrohr tropft kaum sichtbar („Ein Rohr, das tropft“), gemalter Regen zusätzlich zum Effekt. | **Einbaufertig.** |
| xbk7bh | Apothekengasse, offen | Beide Fächer offen, je eine flache Dose mit grünem Kreuz. | Außerhalb der Fächer nur Regen und Glühen anders. | **Einbaufertig** (nur die Fächer einsetzen). |
| 8erqoz | Basis, Grund | Luke links offen mit Neon, vier Kapseln mit Glasdeckel, rundes Fenster über Kapsel 1 (AP-09), Patch-Panel mit drei Buchsen und Symbolen, Stecker mit Anhängern, Terminal, Stromkasten mit drei Schaltern und leeren Etiketten, Plakat mit Küchenmaschine in Schürze und freien Textflächen (AP-09), Steuerpult ohne Bildschirm, Großrechner mit Spulen und gelber Lampe, Handtuch, Pizzastapel bis zur Decke, Tisch mit Tasse, Schacht. Plätze für Rebellin, Rebell und Kalle frei. | (1) **Zusätzlicher leerer, dunkler Türrahmen** zwischen Luke und Kapsel 1 (x ≈ 185–265), im Rohbau steht dort die Luke. Er liest sich als zweiter Ausgang. (2) Fenster sitzt in der oberen Rückwand, nicht in der Decke; Max sagt „in der Decke, direkt über meiner Kapsel“. Die Lage über Kapsel 1 stimmt ungefähr. (3) Tasse steht mittig links auf dem Tisch, Skript: „genau am Rand“. (4) Zusätzliche Schlüsselleiste mit Anhängern (x ≈ 565–615), nicht im Prompt. (5) Schacht ist ein Bodenloch rechts (x 1105–1200), im Rohbau eine Wandöffnung neben dem Tisch. Piepsi (Layout x 1238) passt rechts daneben, der Rohbau-Platz x 1085–1135 läge auf dem Loch. | **Kleine Nacharbeit:** Türrahmen mit Wandblech übermalen, Tasse 15–20 px an die Tischkante schieben, Schlüsselleiste optional entfernen. Piepsi im Layout rechts vom Loch lassen. „Fenster in der Decke“ als Text auf „oben in der Wand“ ändern (AP-07) oder so lassen. |
| cggbpp | Basis, Schnee | Fenster aufgeklappt, Schnee rieselt auf Kapsel 1 und 2. Tasse noch da (passt zu W3_SCHNEE ohne R13). | Ganzes Bild neu gezeichnet und gedehnt (siehe Varianten); Plakat und Pizzastapel leicht anders. | **Einbaufertig als Quelle:** nur Fenster, Schnee und Kapseldeckel (x 215–435) in 8erqoz einsetzen. |
| 3qpige | Basis, Schnee + Kaffee | Fenster offen, Schnee, Tasse weg. | **Kaffee am Boden ist nicht als Kaffee zu erkennen.** Unter dem Tisch liegt nur ein etwas größerer dunkler Fleck zwischen den Ölflecken, die schon im Grund da sind; keine „dicke schwarze Kaffeespur in die Ecke“. Die Klickfläche `kaffeepfuetze` und „Eine Kaffeepfütze, die nicht wegläuft“ brauchen eine sichtbare Pfütze. Bild ist zudem neu gezeichnet und gedehnt. | **Kleine Nacharbeit** in Aseprite: von der Tischkante eine zähe Spur in Schwarzbraun (#2b1a12, Glanzpunkt #6b4a36) bis in die Ecke malen, deutlich anders als die blaugrauen Ölflecken. Dann nur die Ecke in den Grund einsetzen. Für den zusammengesetzten Grund+Kaffee dieselbe Ecke verwenden. Wenn neu erzeugt werden soll, Satz für den Chat: „Edit the attached image. Change only the floor area between the small table and the right corner: remove the mug from the table and paint a thick, glossy, dark brown-black coffee trail that starts directly below the table edge and runs as one clear stream into the right corner, clearly different in colour from the grey oil stains. Everything else stays pixel-identical: same framing, same width, nothing shifted or redrawn.“ |
| e84lk0 | Kühlung, voll | Schacht-Öffnung links am Boden, Kühlgerät mittig mit vereisten Rohren, Ventilen und Statuslichtern, Eimer voll Wasser und Mopp rechts. Pixels Platz frei. Lage deckt sich mit dem Rohbau. | Deutlich mehr Perspektive als der Rohbau: breite Seitenwände (je etwa 12 %) und sichtbare Deckenträger. Unter der Schachtöffnung liegt eine zusätzliche Bodenplatte. Beides stört nicht. | **Einbaufertig.** |
| nujisr | Kühlung, gekippt | Eimer umgekippt, Wasser läuft zum Gerät, Dampfwolken, Eis taut. | Nur 0,4 % außerhalb der Stelle geändert. | **Einbaufertig** (nur die Stelle einsetzen). |
| rr2u8f | Laboreingang, zu | Runde Panzertür zu, Kartenleser mit rotem Licht rechts, Pinnwand mit Diagrammen und Zetteln, Eimer mit klarem Wasser, Ausgang links, Warnstreifen hinten, nasser Boden vorn, Deckenlampe mit Tropfen. Hausmeister-Platz frei. Deckt sich mit dem Rohbau. | Ein **gemalter Mopp** lehnt am Eimer. Der Hausmeister trägt einen eigenen Mopp (W3-R05-02), es gibt dann zwei. | **Einbaufertig**; optional den gemalten Mopp entfernen (Wand und Boden nachziehen, klein). |
| e4htav | Laboreingang, offen | Tür innen aufgeschwenkt, Wand mit cyan leuchtenden Buchsen, ein dickes Kabel steckt. | Prompt sagt „rolled aside“, im Bild schwenkt sie nach rechts in den Ring; für den Text egal. | **Einbaufertig** (nur die Tür einsetzen). |
| dznfdm | Stadtstraße, Tag | Ein durchgehendes Panorama ohne Naht: Nachttisch mit Radiowecker vorn links, leere Fahrbahn über die ganze Breite (AP-09: Autos im Takt), Gehweg drüben, fünf gleiche Bäume und Laternen, gleiche weiße Häuser, Omas Haus mit Spitzengardinen, großer Tür und leerem Schild (AP-09), Glasturm mit Glastür und Sprechanlage, Zebrastreifen (steht im Rohbau), Sonne (AP-09), dieselbe Wolke dreimal. Schmidts Platz und der der Katze frei. Deckt sich fast deckungsgleich mit dem Rohbau. | (1) **Wecker zeigt gemalte Ziffern** (etwa „16:80“), Skript und Effekt-Sprite zeigen 5:59 und 6:00. Das Sprite liegt bei [134, 298] darüber, Reste der gemalten Ziffern stören aber. (2) Nachttisch ist gemalt, soll laut AP-09 ein eigenes Vordergrundteil sein. (3) Die schmale Gasse beim Nachttisch ist nur als Lücke zwischen zwei Häusern zu erkennen. (4) Text W3_SIM_MAX_0140 spricht von „roten Autos, alle gleich geparkt“; es parkt keins (gewollt). | **Kleine Nacharbeit:** Anzeige des Weckers schwarz füllen; Nachttisch samt Wecker als eigenes Sprite ausschneiden und dahinter Gehweg ergänzen. Text 0140 auf die fahrenden Autos umschreiben (AP-07). |
| i6wbqn | Stadtstraße, Nacht | Dunkelblauer Himmel, Laternen an mit Lichtkegeln, Fenster dunkel. | (1) **Neu gezeichnet und um bis zu 6 px gedehnt** gegen Tag (siehe Varianten). (2) Mond statt Sonne: Hotspot „Sonne“ und W3_SIM_MAX_0320 passen nachts nicht. (3) Wecker zeigt „030“. | **Kleine Nacharbeit:** Anzeige schwarz füllen, Nachttisch getrennt ausschneiden (nicht das Tag-Sprite wiederverwenden), Sonne-Hotspot nachts ausblenden oder als Mond beschreiben. |
| l337lu | Küche, Sparschwein | Herd mit Fenster und Keksen, Kehrblech und Besen zum Raum gedreht, Tisch auf Hüfthöhe (AP-09, W3-R07-01 erfüllt: Tischplatte etwa 125 px bei Max hinten etwa 235 px), Teller, Kanne, gerade Gabel, Handbuch mit Küchenmaschine, hohes Regal mit Sparschwein und Radio, Eieruhr-Huhn, Haustür in Max-Größe rechts, Blumentapete, Spitzenfenster, Kuckucksuhr. | (1) **Nur zwei Gläser** auf dem Regal; Prompt und Skript (W3_KUCH_MAX_0700: „Zimt“, „Zucker“, „Nicht anfassen“) wollen drei. (2) Stuhl steht rechts vom Tisch, im Rohbau links. Der Platz der Oma (x 250–315) liegt vor dem Besen wie im Rohbau. | **Kleine Nacharbeit:** drittes Glas durch Kopieren eines Glases ergänzen (Regal reicht). Stuhl so lassen, Klickflächen im Layout anpassen. |
| p50wdf | Küche, Scherben | Sparschwein weg, blaue Scherben unter dem Regal am Boden. | Nur 1,5 % außerhalb der Stelle. Ebenfalls nur zwei Gläser. | **Einbaufertig** (nur Schwein-Stelle und Scherben auf den nachgearbeiteten Grund setzen). |
| u18lmq | Büro 50 | Neuer Rohbau (Vorraum mit endlosem Flur) gut getroffen: Aufzug mit Ruftaste, Fenster mit weiterem Flur, Kopierer mit Ausgabefach davor, Flur mit grauen Türen und Pflanzen bis in die Tiefe, Deckenlichter werden kleiner, drei getrennte Farbfelder mit je einem Symbol (AP-09, W3-R08-05 erfüllt), Beistelltisch mit Terminal, genau ein Wasserspender, offene Treppe mit Handlauf bis an die Decke. Flur frei für die Klone, Vorraum frei. | (1) Etwa 15–20 % größer als der Rohbau (Rückwand höher), passt aber zu Max. (2) Mehr als zwölf Pflanzen (rund acht je Seite), Skript sagt „zwölfmal“, unkritisch. (3) Farbfelder statt Streifen: W3_TERM_MAX_0010 sagt „Drei Streifen“. (4) Stil am flachsten von allen: wenig Schattierung und Textur. Für die „zu saubere“ Simulation ist das gewollt, wirkt aber etwas glatter als Stadtstraße und Küche. (5) Die Klone-tippen-Animation (W3-B28) hat hier keine Schreibtische mehr, sie braucht einen neuen Platz. | **Einbaufertig.** Text 0010 auf „Drei Felder“ ändern (AP-07), W3-B28 neu setzen (AP-09). |
| vlptf0 | Kammer 1, zu | Eingang offen links, leere Wandhalterung (Lage exakt wie im Rohbau), großer roter Bodenknopf, geschlossene Schiebetür rechts, Deckenlautsprecher, Pappkuchen mit gemalter Kerze in der Ecke. Bernds Platz frei. | Ausgangstür ist eine breite Doppeltür (225 statt 115 px breit), Höhe passt. | **Einbaufertig.** |
| ts0zpi | Kammer 1, offen | Tür offen, dahinter Gang. | 2,3 % außerhalb, nur Kantenrauschen. | **Einbaufertig.** |
| ha447k | Kammer 2, tödlich | Laser zwischen zwei Pfosten **quer vor der Ausgangstür** (AP-09, W3-R10-01 erfüllt), leerer Sockel links, Kritzelei unten mit Zettel, großer Lautsprecher. Entspricht dem Rohbau. | (1) **Kritzelei ist Schein-Schrift** („Hasty … the …“), wirkt wie halb lesbares Englisch. Der echte Satz kommt über die Nahansicht. (2) Vier Strahlen statt drei, Skript sagt „Ein roter Strahl“. | **Kleine Nacharbeit:** Kritzelei in Aseprite durch unlesbare Zickzack-Linien ersetzen (oder leer lassen und Schrift von Hand setzen). Vier Strahlen sind in Ordnung, Text „Rote Strahlen“ wäre genauer. |
| sriwbd | Kammer 2, harmlos | Vier blassrosa, wellige Strahlen. | Kritzelei leicht anders geschrieben, nicht übernehmen. | **Einbaufertig** (nur die Strahlen einsetzen). |
| rrypic | Kammer 3, zu | Große Tür mit Schloss-Symbol, schmaler Spalt direkt davor (AP-09, W3-R11-01 erfüllt), Lautsprecher groß wie ein Fenster mit Lochgitter, Eingang links. Bernd-Platz im Spalt frei. | Zusätzliche flache Bodenplatte vor dem Eingang (aus der Rohbau-Beschriftung „spot for the rubber chicken“ entstanden). Liest sich wie ein Schalter. | **Einbaufertig**; optional die Platte übermalen, damit sie nicht als Rätsel gelesen wird. |
| bfift3 | Kammer 3, offen | Tür offen, ohne Schloss. | 0,1 % außerhalb. | **Einbaufertig.** |
| 3psofb | Kern, glühend | Runde weiße Halle mit Warnstreifen, Sockel mit glühender Zelle, Kabel hinten zum Sockel, Tür links, oben rechts leer für M.U.T.T.I. Deckt sich mit dem Rohbau. | (1) Hitzeflimmern ist gemalt und kommt zusätzlich als Effekt W3-B52. (2) Zusätzliche Kabelschlaufe vorn rechts am Rand (im Laufband, aber am Rand). (3) Tür etwa 20 % höher als im Rohbau, unkritisch. | **Einbaufertig**; optional die drei gemalten Flimmerlinien entfernen. |
| p0l1a6 | Kern, vereist | Zelle dunkelgrau mit harten weißen Frostkanten, ein paar Eisflocken, kein Dampf (AP-09, W3-R12-03 erfüllt). | Nur 1,6 % außerhalb. | **Einbaufertig.** |
| 16psne | Kern, leer | Sockel leer, Kabel enden am leeren Sockel, Eisreste am Boden (passt, weil die Zelle immer erst kalt genommen wird). | Nur 1,7 % außerhalb. | **Einbaufertig.** |

## Stil

Gegen W1 Taverne und W2 Palastküche: gleiche Machart (schwarze Kontur, flächige Schatten, feines Dithering, Licht von oben links). Die Simulationsräume (Stadtstraße, Küche, Büro) und das Labor sind bewusst leerer und glatter als W1/W2. Am glattesten ist das Büro 50. Die Realitätsräume (Unterstadt, Gasse, Basis, Kühlung, Laboreingang) passen in Dichte und Licht gut zu W1/W2 und zum alten Laboreingang. Alles kommt als JPEG; `raeume_pixelieren.py` muss die Kompressionsränder vor dem Palettieren glätten.

## Zusammenfassung

- **Einbaufertig (17):** 6738f7, xbk7bh, cggbpp, e84lk0, nujisr, rr2u8f, e4htav, p50wdf, u18lmq, vlptf0, ts0zpi, sriwbd, rrypic, bfift3, 3psofb, p0l1a6, 16psne. Die Zustandsbilder davon werden nur als Quelle der geänderten Stelle genutzt; cggbpp muss das wegen der Dehnung zwingend.
- **Kleine Nacharbeit in Aseprite (7):** 909jin (Einhorn verkleinern), 8erqoz (leeren Türrahmen weg, Tasse an den Rand), 3qpige (Kaffeespur sichtbar malen, nur Ecke verwenden), dznfdm und i6wbqn (Weckeranzeige leeren, Nachttisch als eigenes Teil), l337lu (drittes Glas), ha447k (Schein-Schrift der Kritzelei).
- **Neu erzeugen:** keins zwingend. Nur falls die Kaffeespur in Aseprite nicht überzeugt, den Satz bei 3qpige im Chat verwenden.
- **Zusammensetzen statt neu erzeugen:** Basis „Kaffee ohne Schnee“ aus 8erqoz und der nachgearbeiteten Kaffee-Ecke.
- **Textanpassungen (AP-07):** W3_SIM_MAX_0140 (geparkte Autos), W3_SIM_MAX_0320 nachts (Mond), W3_TERM_MAX_0010 („Streifen“ → „Felder“), W3_BAS_MAX_0580 („in der Decke“), W3_KAM2_MAX_0020 (ein Strahl → mehrere).

FERTIG
