# Review Welt 3, 20.11.2026: Level Design (LD)

Grundlage: JSON-Belege unter `belege/raeume/` (alle Zustände: anfang, ende, var_*, code), eigener Lauftest mit echter Wegfindung `game/tests/_review_ld_w3_laufwege.gd` (48 Läufe in allen 12 Räumen, Testmodus, Max bzw. Pixel per `walk()`), Protokoll `belege/level-design/lauftest_w3.txt`, Bilder unter `belege/level-design/`. Laufbereiche ändern sich zwischen den Zuständen nicht (Abgleich aller JSON-Dateien); in `_ende` fehlen nur Klon, Hausmeister und Bernd, in der Basis kommt `AusgangKuehlung` dazu.

## Funde

| ID | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- |
| LD-01 | apothekengasse (R02) | wichtig | Laufwege, Größen | **Die Gasse ist im Spiel nur 640 px breit, Bild und Laufbereich sind 1280 px.** `room_apothekengasse.tscn` hat `width = 640`, die Kamera scrollt nicht. Der Laufbereich reicht bis x 1180: Wer rechts vom Automaten klickt, läuft aus dem Bild (Lauftest: Kamera bleibt bei x 320, Max endet bei x 1100 unsichtbar, 6,9 s). Der Pastillenautomat (Rätsel 3) ist am rechten Bildrand halb abgeschnitten; Wandlampe, Müllcontainer und Rattenloch (Entscheidung 20.11., `entscheidungen.md` Z. 237) sind nie zu sehen. | [Max läuft aus dem Bild](belege/level-design/LD01_apothekengasse_max_laeuft_aus_dem_bild.png), [Overlay](belege/raeume/apothekengasse_anfang_klick.png), `apothekengasse_anfang.json` (`breite: 640`, Laufbereich x 8–1180), `game/game/rooms/apothekengasse/room_apothekengasse.tscn` Z. 20, Hintergrund `w3_bg_apothekengasse_v01.png` 1280×360 | Raumbreite auf 1280 setzen (Godot-Bau neu laufen lassen), danach Pixels Doppelgang und den Start-Marker (640, 322) im Breitbild prüfen. |
| LD-02 | testkammer_2 (R10) | wichtig | Rätsel, Laufwege | **Die Lasersperre sperrt nichts.** Der Strahl läuft an der Rückwand entlang (Hotspot x 140–506, y 176–194), beide Türen liegen in den Seitenwänden. Max geht im Lauftest von Tür zu Tür vor dem Laser vorbei, ohne ihn zu kreuzen (3,3 s). Der Spieler sieht nicht, warum er erst nach dem Tausch in Kammer 3 darf; der Grafikplan wollte den Strahl „across the room“. | [Max vor dem Laser](belege/level-design/LD02_testkammer_2_laser_sperrt_nichts.png), `tools/layout/welt-3.yaml` (testkammer_2: laser), `docs/grafik/welt-3.md` Z. 80 | Laser vor die rechte Ausgangstür legen (Effekt-Sprite quer vor der Tür) und den Laufbereich vor der Tür bis R9c abschneiden. |
| LD-03 | testkammer_3 (R11) | wichtig | Rätsel, Positionierung, Laufwege | **Bernd steht nicht vor der Tür, und Max läuft durch die Grube.** Bernd steht bei (380, 300) links neben der Bodenspalte; die Tür liegt bei x 522–582, der Weg dorthin ist frei. Max sagt aber „du stehst genau vor der Tür“ (`W3_KAM3_MAX_0030`), und Rätsel 9 lebt davon, dass Bernd im Weg ist. Außerdem passt die Aussparung im Laufbereich nicht zur gemalten Grube: Im Lauftest steht Max bei x 470 mit den Füßen in der Grube. | [Bernd und Grube](belege/level-design/LD03_testkammer_3_bernd_und_grube.png), [Overlay](belege/raeume/testkammer_3_anfang_klick.png), `texte.csv` W3_KAM3_MAX_0030, `docs/grafik/welt-3.md` Z. 81 („floor gap … in front of it“) | Bernd in die Spalte vor der Tür stellen (etwa 535, 300), Laufbereich bis R9d vor der Tür enden lassen; Aussparung an die gemalte Grube anpassen (reicht im Bild bis etwa y 344). |
| LD-04 | unterstadt_strasse, widerstandsbasis, kueche_orakel, laboreingang, buero_50 | wichtig | Positionierung, Laufwege | **Max kommt in Figuren an** (Art wie W2-24 im Review 17.11.). Gehe-Punkte liegen auf Figuren: Vordach und Neon-Pizza-Plakat in Deckert (0/10 px daneben), Steuerpult in Kalle (15 px), Stromkasten und Plakat in der Rebellin (10/20 px), Ofen und Tapete in der Orakel-Oma (8/2 px), „Platz des Hausmeisters“ im Hausmeister (15 px), „Klone“ im Klon (12 px tiefer). Der Stromkasten ist Pixels Nacht-Gag, der Ofen gehört zur Küche des Orakels. | [Sechs Ankünfte im Spiel](belege/level-design/LD04_ankunft_in_figuren.png), `*_anfang.json` (walk_to gegen Figur-pos) | Gehe-Punkte 40 bis 50 px seitlich der Figuren setzen (z. B. Vordach 800, 304; Steuerpult 760, 326; Stromkasten 650, 326; Ofen 240, 336) oder die Figuren verschieben. |
| LD-05 | widerstandsbasis (R03) | wichtig | Klickflächen, Rätsel | **Die „Kaffeepfütze“ ist von Anfang an da.** Der Boden-Hotspot (x 760–1230, y 318–358) gilt auch vor Rätsel 13, obwohl das Bild noch keine Pfütze zeigt. Beim Überfahren des rechten Bodens steht „Kaffeepfütze“, Ansehen gibt „Eine Kaffeepfütze, die nicht wegläuft“ und verrät Pixels Lösung (Tasse vom Tisch werfen). Linksklick läuft dank `boden: true` richtig. | [Overlay](belege/raeume/widerstandsbasis_anfang_klick.png), `widerstandsbasis_anfang.json`, `texte.csv` W3_PIEP_MAX_0290, Bild vor R13 `w3_bg_widerstandsbasis_v01.png` | Hotspot nur nach R13 und auf die gemalte Pfütze verkleinern. |
| LD-06 | stadtstrasse (R06), kern (R12) | kosmetisch | Laufwege, Perspektive | **Max läuft durch gemalte Möbel.** Stadtstraße: Der Nachttisch mit dem Radiowecker (Fuß bei y ≈ 333) steht im nur 28 px tiefen Laufstreifen; Max steht beim Vorbeigehen auf ihm. Kern: Der Laufbereich umfasst Sockel der Energiezelle und Bodenkabel; Max geht bei x 330 mitten durch den Sockel. | [Nachttisch und Sockel](belege/level-design/LD06_durch_gemalte_moebel.png), Laufbereiche in `stadtstrasse_anfang.json`, `kern_anfang.json` | Laufbereich um Nachttisch (x 105–160) und Sockel (x 295–345 oberhalb y 330) ausschneiden. |
| LD-07 | stadtstrasse (R06) | kosmetisch | Größen | **Max ist auf der Stadtstraße doppelt so groß wie Autos und Haustüren.** Hinten (Skala 0,66) ist Max etwa 120 px hoch, die parkenden Autos 55 px, die Haustür zur Küche der Orakel-Oma 60 px; Max betritt eine Tür von halber Körpergröße. Die Glastür des Büroturms (105 px) passt dagegen. | [Max neben Auto, Kücheneingang](belege/level-design/LD07_stadtstrasse_groessen.png) | Omas Haustür als größeres Prop näher am Gehweg; beim Betreten nicht vor die kleine Tür laufen lassen, sondern ausblenden. |
| LD-08 | stadtstrasse, widerstandsbasis, unterstadt_strasse | kosmetisch | Laufwege, Timing | **Wichtige Punkte an entgegengesetzten Enden der Breitbild-Räume** (wie W2-07 im Review 17.11., in Welt 3 kürzer). Stadtstraße: Radiowecker/Ankunft (x 200) bis Glaseingang (x 1148) 7,3 s, zurück 7,9 s, bei jedem Wiedereinstieg am Radiowecker. Basis: Kapsel (x 170) bis Lüftungsschacht 6,7 s, bis Kalles Tasse 6,0 s (Pixel). Unterstadt: Nudelbude bis Laborgang 8,3 s, Luke bis Laborgang 4,8 s. | `belege/level-design/lauftest_w3.txt` (w_wecker_buero, w_buero_wecker, w_kapsel_schacht, w_kapsel_tasse, w_nudel_laborgang) | Doppelklick auf Ausgänge als Sofortwechsel (wie für W2-07 vorgeschlagen). |
| LD-09 | stadtstrasse (R06) | kosmetisch | Timing | **Der Radiowecker-Countdown beginnt bei jedem Betreten neu.** Die 30 s zählen nur, solange Max auf der Straße bleibt; geht er in die Küche und zurück, startet die Wartezeit von vorn. Vor dem ersten Klingeln gibt der Wecker nur „Immer noch 5:59“. Keine Sackgasse (die Eieruhr in der Küche weckt sofort; nach einmaligem Aufstehen am Radiowecker wirkt er ohne Klingeln), aber wer vor dem ersten Aufstehen zwischen Küche und Straße pendelt, hört ihn nie klingeln. | `game/skripte/welt_3.gd` Z. 432–444 (`_wecker_warten`, Abbruch bei Raumwechsel), Z. 503, Z. 819 | Startzeit einmal je Traum merken statt je Betreten, oder die Wartezeit kürzen. |
| LD-10 | testkammer_1, laboreingang | kosmetisch | Laufwege | Offene Durchgänge ohne Ausgang (wie W1-21 im Review 17.11.): Die Eingangstür von Kammer 1 steht sichtbar offen, hat aber keine Klickfläche; im Laboreingang sieht der „Gang“ rechts wie ein Ausgang aus, Benutzen gibt die Ersatzzeile. | [Kammer 1](belege/raeume/testkammer_1_anfang_klick.png), [Laboreingang](belege/raeume/laboreingang_anfang_klick.png), `game/daten/raeume/welt-3.json` (gang ohne `benutzen`) | Hotspot „Eingang“ mit Zeile („Zu. Von außen geht nur die Kapsel.“); Gang mit Benutzen-Zeile. |

Zahl der Funde: kritisch 0, wichtig 5, kosmetisch 5.

## Messwerte Lauftempo (Bezug X-03 im Review 17.11.)

Max hat `walk_speed` 150, ausgeglichen um 1/Skala (188). Gemessen auf 200 px waagerecht:

| Raum | vorn | hinten | Skala hinten |
| --- | --- | --- | --- |
| Unterstadt, Apothekengasse, Basis, Laboreingang | 146–148 px/s | 129–131 px/s | 0,70 |
| Stadtstraße (Tiefe 0,69) | 145 | 125 | 0,67 (am Glaseingang 0,56) |
| Büro, Testkammern | 146 | 121 | 0,65 |
| Küche, Kern | 148 | 133–137 | 0,73 |
| Kühlung (Pixel, ohne Raumskala) | 158 | 138 | 0,87 |

X-03 ist für Welt 3 behoben: hinten höchstens 18 % langsamer (Dorfplatz damals 60 %).

## Pacing der Welt (aus Rätselplan, Ausgängen und Lauftest)

- Raumwechsel auf dem kürzesten Weg: Mensch-Test und Nudelbude 0 (alles auf der Straße), Hausmeister 2, Pastille 1 plus Ebenenwechsel, Orakel 2, Glastür 0, Büroturm 1, Kabel als Pixel 2 Figurenwechsel, vierte Zutat 1, Leitung legen 4 (Straße → Laboreingang → Straße → Basis → Kapsel), Kammern 3 (bis 5, wenn das Huhn fehlt), Kern 1. Zusammen rund 20 Raumwechsel und 4 bis 6 Ebenenwechsel, ohne lange Pendelstrecken.
- Gut gelegt: Die Eieruhr steht in der Küche, in der auch Rätsel 4 gelöst wird; Max wacht danach mit der Rezeptkarte auf und geht zu Herrn Vier. Pixels Eingriffe (Fenster, Patch-Panel, Stromkasten) liegen nahe der Kapsel, nur Tasse und Lüftungsschacht am anderen Ende (LD-08).
- Längste Laufstrecken 7 bis 8 s je Durchgang (LD-08), deutlich kürzer als in Welt 2 (17–19 s je Gang).

## Gut gelöst

- Lauftempo von der Raumskala entkoppelt (s. o.); Bewegung in die Tiefe wirkt in allen Räumen gleichmäßig.
- Alle walk_to-Punkte und Marker liegen im Laufbereich (zwei Punkte 1 bis 2 px am Rand: Endlos-Treppe im Büro, Lautsprecher in Kammer 3, ohne Folgen); alle 48 Testläufe kamen ohne Hängenbleiben exakt am Ziel an.
- Boden-Hotspots (Origami-Einhorn, Pfützen, Dampfgitter, Bodenschalter, Lüftungsschacht) lassen Linksklicks durch (`cq_hotspot.gd` Z. 69 ff.); W1-11/W2-33 aus dem Review 17.11. sind damit behoben.
- Ausgänge der Unterstadt gut erkennbar und verteilt (Luke in der Mitte, Gasse mit Apothekenkreuz, Labortunnel am Rand); der Büroturm als Einbahnraum ist sauber gesperrt.
- In der Küche bleibt vor dem Tisch ein schmaler Streifen frei; Figuren werden dort korrekt vor den Tischbeinen gezeichnet.

## Nicht geprüft

- Kühlung und Pixels Wege im echten Ablauf (Figurenwechsel, Pixel als Spielfigur); gemessen nur mit Pixel per `walk()` im Testmodus.
- Ankunftsorte nach Ebenenwechsel (Wecker, Kapsel, Leitung) im echten Ablauf; im Testmodus wurde direkt per `goto_room` gewechselt. Ob Pixel im Labor und Kern mitläuft (in den Raumaufnahmen steht er dort), nicht im Normalablauf geprüft.
- Z-Sortierung am Vordergrund-Tresen der Nudelbude: Laufbereich liegt ganz davor, nicht gezielt aufgenommen.
- Die Overlay-Panoramen der breiten Räume (`stadtstrasse_*_klick.png`, `widerstandsbasis_*_klick.png`) sind aus Kameraausschnitten zusammengesetzt und zeigen Figuren doppelt bzw. versetzt; ich habe dort nur JSON-Koordinaten und eigene Lauftestbilder verwendet.
- Übergang in Zwischenspiel 3 nur im Code gelesen (`welt_3.gd` `_abschluss()`: Basis → Straße → Szene, kein Laufweg).

## Vorschläge für die Lessons Learned

- **Lauftests: nach dem Versetzen einer Figur `sync_buffered_position()` aufrufen.** Popochiu puffert die Position (`_buffered_position`); wer nur `position` setzt, dessen Figur springt beim nächsten Bild an das Ende des vorigen Laufs zurück. Im ersten Durchlauf dieses Reviews begannen dadurch alle weiteren Läufe im selben Raum am falschen Ort (z. B. „Kapsel → Steuerpult“ 0,8 s statt 4,6 s). Die Laufskripte vom 17.11. (`_review_ld_laufwege*.gd`) versetzen genauso; ihre Zweitläufe im selben Raum (Agora, Hafen, Werkstatt, Luftschloss) sollten nachgemessen werden. Beleg: `game/tests/_review_ld_w3_laufwege.gd` (Kommentar beim Versetzen), `addons/popochiu/engine/objects/character/popochiu_character.gd` Z. 1320–1340.
- **Raumbreite nach einer Breitbild-Entscheidung im gebauten Raum prüfen.** Bild, Layout und Laufbereich waren 1280 px, die Szene blieb bei 640 (LD-01). Eine Prüfung „Hintergrundbreite = Raumbreite“ in `alles_pruefen.py` hätte das gefunden.

FERTIG
