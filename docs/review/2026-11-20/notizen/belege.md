# Review Welt 3, 20.11.2026: Evidence Collector (EV), Prüfung der Funde gegen Beleg und Spiel

Geprüft: alle Spiel-Funde der Rollen LD, ND, GD, TA, AN, GS (95 Funde), dazu drei Stichproben aus WF. Grundlage: `main` `a65f55e0` im Checkout `cq-r4` (HEAD `263b57e0` enthält nur Review-Notizen; `git diff a65f55e0 HEAD -- game tools` ist leer).

Eigenes Skript (nicht committen): `game/tests/_review_ev_w3_belege.gd -- <ausgabe> <szenario>`, Szenarien `nd01`, `sackgasse`, `tuer`, `apo`, `mutti`. Klicks gehen als echte Maus-Ereignisse über `push_input` ins Fenster; der Testmodus ist nur beim Aufbau an, danach aus (Texte laufen mit automatischem Weiter). Belege unter `belege/evidenz/`: je Szenario ein Log `ev_<szenario>_log.txt` und Bilder.

Zur Methode:
- Die Abfrage, was unter der Maus liegt (`E.hovered`), war in meinen Läufen unzuverlässig und zeigte oft den zuletzt überfahrenen Hotspot. Maßgeblich sind die gesagten Zeilen und die Schalter im Log. In `ev_sackgasse_log.txt` steht deshalb zu jedem Pixel-Klick noch eine Gegenprobe über `on_click()` desselben Hotspots, mit gleichem Ergebnis.
- Bei Pixel-Klicks mischen sich Pixels Zurufe (`SYS_ERS_PIX_*`) ins Protokoll. Entscheidend ist, dass sich kein Schalter ändert.
- „bestätigt“ heißt: Ich habe Beleg und Code/Daten selbst nachgesehen (Bild gesichtet, Zeile gelesen, Wert gemessen) oder im Spiel nachgestellt. „teilweise“ heißt: Ein Teil stimmt, oder der Beleg ist vorhanden, aber ich habe ihn nicht vollständig nachgerechnet bzw. ein Teil der Aussage stimmt nicht. Gesichtet habe ich die Bilder in zwei Kontaktbögen; Zählungen über `texte.csv` nur stichprobenweise.

## 1. Kritische Funde und Sackgassen (im Spiel nachgestellt)

| Fund-ID | Urteil | Begründung | (neuer) Beleg | Priorität-Empfehlung |
| --- | --- | --- | --- | --- |
| ND-01 | bestätigt | Im echten Gesprächsmenü stehen vor dem Test 0040, 0060 und 0090. Nach einer falschen Antwort fehlt 0090 dauerhaft; Deckert bietet nur noch 0040/0060, danach ist das Gespräch erschöpft (nur die Abschiedszeile). Der Ausgang zur Apothekengasse bleibt ohne R1b gesperrt (`W3_STR_DEC_0290`). Einen anderen Einstieg in den Test gibt es nicht (`option_deckert_0090` ist die einzige Stelle). **Für die Behebung wichtig:** `cq_dialog.gd` `option_sichtbar()` prüft `opt.used` (Z. 60) vor der Regel `sichtbar_<figur>_<nr>`. Der vorgeschlagene `sichtbar_deckert_0090()` würde deshalb nicht greifen; 0090 braucht „(bleibt)“ im Skript. Dieselbe Falle hat Herr Vier 0090, wenn man die Bestellauswahl mit Esc abbricht (`bestellen()` kehrt bei `w < 0` zurück); das habe ich nicht im Spiel geprüft. Mein Lauf hat R1a nicht vollständig gesetzt (zwei Beobachtungsklicks gingen daneben); dass 0090 auch mit R1a fehlt, folgt aber zwingend aus der Reihenfolge in `option_sichtbar()`. | `belege/evidenz/ev_nd01_log.txt`; `ND-01_deckert_menue_erstes_mal.png`, `ND-01_deckert_menue_mit_beobachtungen.png` (nur noch zwei Fragen), `ND-01_deckert_nur_abschied.png`; `welt-3.json` Dialog deckert (0090 `bleibt: false`) | **kritisch** (harte Sackgasse auf dem Pflichtweg nach einer falschen Antwort, die das Spiel ausdrücklich zulässt) |
| GS-01 | bestätigt, schwerer als gemeldet | Pixel als Spielfigur in der Basis, Max im Büroturm. Klicks auf Kalles Tasse, Patch-Panel, Stromkasten, Fenster, Max' Kapsel und Lüftungsschacht ergeben nur Pixel-Ansehen- oder Ersatzzeilen; R13, R7b, Nacht, Schnee, Ebene und Raum bleiben gleich. Die Gegenprobe über den Regelaufruf `benutzen max_kapsel` weckt Max sofort. **Folgen:** Auch **R13 (Kalles Tasse)** ist per Klick unlösbar. Ohne Morse-Tabelle gibt es kein R7a (`gegenstand_terminal`), ohne Pixel kein R7b, und Schütteln geht ebenfalls nicht. Max' Ausgang aus dem Büro ist gesperrt (`W3_TURM_MAX_0250`), einen Wecker gibt es dort nicht. Wer den Büroturm betritt (Pflicht für R6), kommt nie wieder heraus: **harte Sackgasse für jeden Spieler** in der Mitte der Welt. | `belege/evidenz/ev_sackgasse_log.txt`; `GS-01_buero_ausgang_gesperrt.png`, `GS-01_pixel_klickt_PatchPanel.png`, `GS-01_pixel_klickt_MaxKapsel.png`; Code `cq_hotspot.gd` Z. 41–44 (Art `pixel`), `welt_3.gd` Z. 129–159 (sucht `pixel_<id>`, es gibt keins), Z. 859, 880, 1266 | **kritisch**, zuerst beheben |
| GS-02 | bestätigt | Zweimal Rechtsklick auf die Glasfläche: `W3_SIM_MAX_0260`, dann `W3_SIM_MAX_0265`, keine Code-Sicht. Zweimal Rechtsklick auf den Streifen der Figur „Tür“ (1148, 283): `W3_TUER_MAX_0130`, dann die Freischalt-Szene `W3_TUER_MAX_0150`–`0170`. Die Freischaltung geht also nur über den 14 × 33-px-Streifen (Polygon `Tuer` 1141–1155 × 267–300, Ausgang 1112–1185 × 195–300). Eine harte Sackgasse ist es nicht: Der Streifen ist da, beim Überfahren heißt er „Die Tür“ statt „Büroturm, 50. Stock“, und Hinweis 2 sagt „sieh dir die Tür an“. Auf dem Pflichtweg ist es aber ein Suchbild. | `belege/evidenz/ev_tuer_log.txt`; `GS-02_glastuer_klickflaechen_3x.png` (Hintergrund mit beiden Klickflächen); Zeigerkarte `belege/godot/stadtstrasse_anfang_zeiger.png` | kritisch → **wichtig (hoch)**: lösbar, aber für viele ein Hänger; die Behebung ist billig |
| TA-01 = LD-01 = GS-04 | bestätigt | Raum `width = 640` (Szene Z. 20), Hintergrund 1280 × 360. Im Spiel steht die Kamera bei (320, 180), Max am Startmarker (640, 322) ist nur halb im Bild, der Automat halb abgeschnitten. Für R3 ist das nicht blockierend: Der sichtbare Teil des Automaten (x 545–640) ist klickbar, Morphäus steht bei x 470, der Ausgang links. Nichts Pflichtiges liegt rechts von x 640 (Wandlampe, Ratte, Gully sind Kulisse). | `belege/evidenz/LD-01_max_am_automaten.png`, `ev_apo_log.txt` (Raumbreite 640, Kamera 320); vorhandene Belege LD/TA/GS gesichtet | TA „kritisch“ → **wichtig** (stark sichtbar, aber spielbar) |
| GD-04 | teilweise | Im Code stimmt es: `benutzen_max_kapsel` (Z. 859) holt Max aus jeder Ebene, auch aus dem Büroturm. Im heutigen Spiel lässt es sich aber **per Klick nicht nachstellen**, weil Pixels Klick auf die Kapsel wirkungslos ist (GS-01). GDs Lauf nutzte den Regelaufruf. Nach der Behebung von GS-01 wird GD-04 real: Dann kann man R7/R13 auslassen. Die Aussage „Keine harte Sackgasse gefunden“ in GDs Sackgassen-Prüfung stimmt für das heutige Spiel nicht (ND-01, GS-01). | `ev_sackgasse_log.txt` (MaxKapsel per Klick: nur `W3_BAS_PIX_0530`; Gegenprobe per Regel: Max wacht auf) | wichtig (bleibt), Entscheidung zusammen mit der Behebung von GS-01 treffen |
| GD-01 | bestätigt | Pfote-Schritt in der Gasse: R3a. Dem Hinweisweg gefolgt (zu Pixel wechseln, zweimal am Automaten vorbeigehen und ihn benutzen): Pixel sagt `W3_APO_PIX_0230`; `W3_PIXEL_EINMAL` wird per Klick nicht einmal gesetzt (Art `pixel`, siehe GS-01). Zurück bei Max, Automat, „Déjà-vu“: `W3_APO_AUT_0100` (Behauptung ohne Befund), R3a bleibt offen. Lösbar ist R3a nur, wenn Max Pixel benutzt (`benutzen_pixel`), was kein Hinweis sagt. | `belege/evidenz/ev_apo_log.txt`, `GD-01_dejavu_ohne_befund.png`; `texte.csv` `W3_HINT_PIX_0320`, `0330` | wichtig (hoch; der Hinweis der Stufe 3 führt nachweislich nicht zum Ziel) |
| AN-01 | bestätigt | Paradoxon im Kern nachgespielt. Bei `W3_KERN_MUT_0200` läuft `talk`; während `W3_KERN_NAR_0210` („Das Auge wird dunkel …“) steht M.U.T.T.I. in `idle` mit leuchtend rotem Auge; nach R10 ist sie sichtbar und unverändert. `mutti_aus` hat keine Fundstelle in `game/skripte`, `game/game`, `game/daten`. Im selben Bild ist der orange Platzhalter auf der Energiezelle zu sehen (TA-03). | `belege/evidenz/AN-01_kern_W3_KERN_NAR_0210.png`, `AN-01_kern_nach_R10.png`, `ev_mutti_log.txt`; `gesten_welt_3.gd` Z. 101 | wichtig (bleibt; keine Blockade, aber die Pointe des Rätsels fehlt) |

## 2. Übrige Funde

### Level Design (LD)

| Fund-ID | Urteil | Begründung | (neuer) Beleg | Priorität-Empfehlung |
| --- | --- | --- | --- | --- |
| LD-01 | bestätigt | siehe Abschnitt 1 (= TA-01 = GS-04). | `belege/evidenz/LD-01_max_am_automaten.png` | wichtig |
| LD-02 | bestätigt | Laser-Hotspot 140–506 × 176–194 an der Rückwand, Ausgang 518–560 in der Seitenwand; im Bild läuft Max vor dem Strahl zur Tür. | Beleg LD02 gesichtet; `testkammer_2_anfang.json` | wichtig |
| LD-03 | bestätigt | Bernd (380, 300), Ausgang 522–582; im Bild steht Max bei x 470 in der Grube. Gleicher Sachverhalt wie ND-10 und TA-17. | Beleg LD03 gesichtet; `testkammer_3_anfang.json` | wichtig |
| LD-04 | bestätigt (Beleg gesichtet) | Die sechs Ankünfte im Bild zeigen Max in bzw. an der Figur. walk_to-Werte nicht alle nachgerechnet. Verwandt mit TA-08. | Beleg LD04 gesichtet | wichtig → **kosmetisch bis wichtig**: kurz sichtbar, ohne Folgen fürs Spiel; zusammen mit TA-08 beheben |
| LD-05 | bestätigt | = GS-07. Hotspot 760–1230 × 318–358 ohne Bedingung; Klickprotokoll `Kaffeepfuetze ANSEHEN=W3_PIEP_MAX_0290` schon am Anfang. | `belege/godot/klicks_welt-3_anfang.txt` | wichtig |
| LD-06 | bestätigt | Bild zeigt Max auf dem Nachttisch (x 140) und im Sockel (Kern x 330). Der Nachttisch-Teil gehört zur Gruppe TA-04/AN-14/GS-10. | Beleg LD06 gesichtet | kosmetisch |
| LD-07 | bestätigt | Bild zeigt Max etwa doppelt so hoch wie die parkenden Autos und die Haustür. | Beleg LD07 gesichtet | kosmetisch |
| LD-08 | teilweise | Protokoll `lauftest_w3.txt` vorhanden, Zeiten nicht nachgemessen. | – | kosmetisch |
| LD-09 | bestätigt (Code) | `_wecker_warten()` (Z. 432–444) bricht ab, sobald der Raum nicht mehr `stadtstrasse` ist, und beginnt beim nächsten Betreten neu. Ausweg über Eieruhr bzw. „W3_ZELLE_BENUTZT“ stimmt laut Code. | `welt_3.gd` Z. 432–444, 819 | kosmetisch |
| LD-10 | bestätigt (Daten) | Kammer 1 hat außer dem Ausgang zu Kammer 2 keinen Ausgang-Hotspot; „gang“ ohne `benutzen`. Nicht im Spiel angesehen. | `testkammer_1_anfang.json`, `welt-3.json` | kosmetisch |

### Narrative (ND)

| Fund-ID | Urteil | Begründung | (neuer) Beleg | Priorität-Empfehlung |
| --- | --- | --- | --- | --- |
| ND-01 | bestätigt | siehe Abschnitt 1. | `belege/evidenz/ev_nd01_log.txt` | kritisch |
| ND-02 | bestätigt | `nahansicht_zeigen` wird in `welt_3.gd` nur für kochbuch, schmidts_akte, kritzelei_kammer_2 und telefonbuchseite aufgerufen, nie für morse_tabelle. | `grep nahansicht_zeigen game/skripte/welt_3.gd` (Z. 1129, 1182, 1409, 1648, 1654) | wichtig |
| ND-03 | bestätigt | T in der Tabelle zwei lange Striche (Ausschnitt gesichtet); `W3_PIEP_MAX_0220` sagt „Miiiau heißt T“. = TA-12. | Beleg `narrative/morse_tabelle_T.png` | kosmetisch (Rätsel ist trotzdem lösbar, Max liest vor) |
| ND-04 | bestätigt | Nachgezählt: 25 W3-NAR-Zeilen, davon 14 über 104 Zeichen; `W3_TURM_NAR_0080` 150, `W3_SOFA_NAR_0480` 149 Zeichen. | Auswertung `texte.csv` | wichtig |
| ND-05 | bestätigt (Stichprobe) | `W3_KUCH_ORA_0310` 190, `W3_KERN_MUT_0170` 189 Zeichen; `pruefen.py` Z. 385 warnt (W) nur für Prolog/Welt 1/Welt 2, sonst Hinweis (H). Die Gesamtzahl 73 habe ich nicht nachgezählt. | `tools/pruefen.py` Z. 380–385 | wichtig |
| ND-06 | bestätigt | `w3_portal`, `w3_hologramm`, `w3_kopieren`, `w3_verwandlung` haben keine Fundstelle in Skripten, Szenen oder Daten; die blaue Pastille spielt nur Zeilen (`welt_3.gd` Z. 797–801). Überschneidet sich mit AN-02, AN-03, AN-12. | grep (0 Treffer) | wichtig |
| ND-07 | teilweise | Im Raum stehen nur Schmidt und ein Klon (`buero_50_anfang.json`); die Bildfolge der Klone hinter der Glaswand und die Zahl der Pflanzen habe ich nicht nachgezählt. | – | wichtig → **kosmetisch** (Text gegen Bild, das Rätsel läuft über die Code-Sicht) |
| ND-08 | bestätigt | Ausschnitt zeigt Kreis, Dreieck und Quadrat jeweils über allen drei Streifen. | Beleg `narrative/buero_50_farbcode.png` gesichtet | wichtig |
| ND-09 | bestätigt | = GD-08. `_code_sicht()` ruft `Spiel.auswahl(texte)` mit fertigen Tauschpaaren auf; `W3_TUER_MAX_0180` sagt „Ich klick zwei Wörter an“. | `welt_3.gd` Z. 945–954; `texte.csv` | wichtig |
| ND-10 | bestätigt | = LD-03, ≈ TA-17. | wie LD-03 | kosmetisch (wie ND gemeldet; der Spielteil steht in LD-03) |
| ND-11 | bestätigt (Code) | `benutzen_wassereimer` setzt nur `W3_EIMER_GEKIPPT`. Im heutigen Spiel per Klick gar nicht erreichbar (GS-01). | `welt_3.gd` Z. 902–907 | kosmetisch |
| ND-12 | teilweise | Die Sonne stimmt (= GS-17, Hotspot 800–980 × 0–24 über leerem Himmel). Türschild, Plakat und Fenster habe ich nicht gesichtet. | `stadtstrasse_anfang.json` | kosmetisch |
| ND-13 | teilweise | Die genannten IDs gibt es; ob es eine Formel ist, ist eine Geschmacksfrage. | – | kosmetisch |
| ND-14 | teilweise | Stichprobe `W3_KUCH_ORA_0310` „Das ist kein Kochbuch. Das ist …“ bestätigt; nicht alle zehn gezählt. | `texte.csv` | kosmetisch |
| ND-15 | nicht prüfbar | Statistik über Satzlängen, nicht nachgerechnet; Wertung ist Geschmack. | – | kosmetisch |
| ND-16 | nicht prüfbar | Zählung der Kaskaden nicht nachgerechnet; Wertung ist Geschmack. | – | kosmetisch |
| ND-17 | teilweise | Die Szenenlisten in `welt_3.gd` Z. 489, 526, 1272 sind lang wie beschrieben; die Dauern sind geschätzt, nicht gemessen. | – | kosmetisch |
| ND-18 | teilweise | `W3_KUCH_NAR_0610` steht als Zeile im Raumplan der Küche (`welt-3.json` Z. 3888); im Spiel nicht angesehen. | `welt-3.json` | kosmetisch |
| ND-19 | bestätigt | EN `W3_ABS_HAU_0130` „Greetings is my hello, my goodbye …“; `W3_TURM_MAX_0100` „Slipped disc“. | `texte.csv` | kosmetisch |
| ND-20 | bestätigt | `zwischenspiele-und-finale.md` Z. 209 „sie glüht orange“, Z. 217 „warm, aber nicht mehr heiß“ gegen die kalte Zelle am Ende von Welt 3. | Doku | kosmetisch |
| ND-21 | bestätigt | Zeile vorhanden (151 Zeichen), Wertung Geschmack. | `texte.csv` | kosmetisch |

### Game Design (GD)

| Fund-ID | Urteil | Begründung | (neuer) Beleg | Priorität-Empfehlung |
| --- | --- | --- | --- | --- |
| GD-01 | bestätigt | siehe Abschnitt 1. | `belege/evidenz/ev_apo_log.txt` | wichtig |
| GD-02 | bestätigt (Code + Spiel) | Das Budget wird nur in `_raum_betreten()` neu gesetzt; der Büro-Ausgang ist gesperrt (im Spiel: `W3_TURM_MAX_0250`). Der Figurenwechsel funktioniert im Spiel (Log: Wechsel in die Basis) und setzt beim Zurückkommen zurück. | `ev_sackgasse_log.txt`; `welt_3.gd` Z. 375–381 | wichtig |
| GD-03 | bestätigt (Daten/Code) | Kammer 1 hat nur den Ausgang zu Kammer 2. | `testkammer_1_anfang.json` | kosmetisch |
| GD-04 | teilweise | siehe Abschnitt 1 (heute per Klick nicht möglich, im Code richtig beschrieben). | `ev_sackgasse_log.txt` | wichtig |
| GD-05 | teilweise | Der Befund (Pfote im Büroturm schlägt R4 vor) steht im Log A7/A8. „Fast alle Schritte haben `objekte: []`“ stimmt so nicht: 9 von 20 Schritten in `daten/hinweise/welt-3.json` haben keine Objekte, 11 haben welche. | `game/daten/hinweise/welt-3.json` | wichtig |
| GD-06 | bestätigt | `sonderzeilen` enthält nur `wartezeile` (`W3_HINT_PIX_9995`), also keine eigene Zeile für „nichts offen“. | `game/daten/hinweise/welt-3.json` | wichtig |
| GD-07 | bestätigt | `_loese("R6b", ["W3_REGEL_1"])` (Z. 1173) hält Regel 1 beim Erhalt der Akte ausdrücklich aus; erst `ansehen_inventar_schmidts_akte` setzt sie. | `welt_3.gd` Z. 1173, 1180–1183 | wichtig |
| GD-08 | bestätigt | = ND-09. | `welt_3.gd` Z. 945–959 | wichtig (dass die Bedienung umgebaut wird, ist eine Entscheidung, kein Fehler) |
| GD-09 | bestätigt (Code) | Lösung B prüft nur `nach_uebergang_kern` (Z. 557–564), nicht am Ende von `_paradoxon`. | `welt_3.gd` Z. 557–564 | kosmetisch |
| GD-10 | bestätigt | `gegenstand_herr_vier` hat `FALSCH = {"hundekuchen": …}`, der Gegenstand heißt `omas_kekse`. | `welt_3.gd` Z. 1349–1351 | kosmetisch |
| GD-11 | bestätigt (Code) | Nur `rote_pastille` wird abgegeben (Z. 807); die blaue bleibt und spielt überall die Szene. | `welt_3.gd` Z. 797–807 | kosmetisch |
| GD-12 | bestätigt | `raetsel/welt-3.md` Z. 41 und 60 sprechen noch von Telefonzellen. | Doku | kosmetisch |

### Technical Art (TA)

| Fund-ID | Urteil | Begründung | (neuer) Beleg | Priorität-Empfehlung |
| --- | --- | --- | --- | --- |
| TA-01 | bestätigt | siehe Abschnitt 1. | `belege/evidenz/LD-01_max_am_automaten.png` | kritisch → **wichtig** |
| TA-02 | bestätigt | = GS-03. `welt_3.gd` Z. 986 `bild.global_position = bg.global_position`; Background-Knoten (640, 0), Sprite (640, 180) laut GS-Log; im Panorama liegt das grüne Bild nur in der oberen Hälfte. | `belege/raeume/stadtstrasse_codesicht.png` gesichtet; `belege/godot/zustaende_stadtstrasse_log.txt` Z. 82 | wichtig |
| TA-03 | bestätigt | Alle sechs `grafik/platzhalter/prop_*.png` (Tasse, Brille, Akte, Huhn, Energiezelle, Telefonbuchseite) bestehen aus Platzhalter-Orange (228, 166, 114) und Rand; die Szenen verweisen darauf. Im Spiel auf der Energiezelle zu sehen. | `belege/evidenz/AN-01_kern_nach_R10.png`; Farbzählung der Platzhalter | wichtig |
| TA-04 | bestätigt | Bild: rotes Auto fährt über den Rasen und ist größer als das geparkte. Bahn `weg [[-170,304],[1290,304]]` (`welt-3.yaml` Z. 208–210). ≈ AN-14 ≈ GS-10. | Beleg TA r06 gesichtet | wichtig |
| TA-05 | bestätigt | `tools/layout/welt-3.yaml` hat keinen `licht:`-Eintrag (die zwei Treffer für „licht“ sind Statuslicht und Lichtband); Welt 1 hat sie. ⊃ GS-11. | grep | wichtig |
| TA-06 | bestätigt (Beleg gesichtet) | Im Bild reicht die Tischplatte Max bis zur Brust. Maße nicht nachgemessen. | Beleg TA r07 gesichtet | wichtig |
| TA-07 | bestätigt | Bild: Einhorn etwa so groß wie Pixel und hell. | Beleg gesichtet | kosmetisch |
| TA-08 | bestätigt (Daten) | Start (640, 320), Pixel 685, Frau 700 in `unterstadt_strasse_anfang.json`. Verwandt mit LD-04. | JSON | kosmetisch |
| TA-09 | bestätigt | Bild: Fransen oben, Stiel unten. | Beleg gesichtet | kosmetisch |
| TA-10 | bestätigt (Beleg gesichtet) | Weiche Frostwolke statt Pixel-Reif; die Farbzählung habe ich nicht wiederholt. | Beleg gesichtet | wichtig → **kosmetisch** (ein Zustandsbild am Ende der Welt, ohne Folgen fürs Spiel) |
| TA-11 | teilweise | „47×“ ist in 6-fach als 47 lesbar, die 4 ist aber dünn; das „E“ der Morse-Tabelle sieht wie „€“ aus. Akte und Kritzelei habe ich nicht gesichtet. | Belege n01/n05 gesichtet | kosmetisch |
| TA-12 | bestätigt | = ND-03. | wie ND-03 | kosmetisch |
| TA-13 | nicht prüfbar | Planabweichung; Nahansicht nicht gesichtet. | – | kosmetisch |
| TA-14 | bestätigt | Bild: „[harmlos] [gelb]“ und „[fest]“ überlagern sich. | Beleg gesichtet | kosmetisch |
| TA-15 | bestätigt | Szene `CharacterRebellin` (700, 320), Layout `rebellin: [380, 318]`; im Bild steht sie vor dem Stromkasten. ≈ AN-15. | `room_widerstandsbasis.tscn` Z. 216 | kosmetisch |
| TA-16 | teilweise | Belege vorhanden, nicht einzeln gesichtet. | – | kosmetisch |
| TA-17 | bestätigt | Bild: breite Grube, eckige Lüfter. ≈ LD-03/ND-10. | Beleg gesichtet | kosmetisch |

### Animationen (AN)

| Fund-ID | Urteil | Begründung | (neuer) Beleg | Priorität-Empfehlung |
| --- | --- | --- | --- | --- |
| AN-01 | bestätigt | siehe Abschnitt 1. | `belege/evidenz/AN-01_*.png` | wichtig |
| AN-02 | bestätigt | `"Opa": false` (Z. 400), `opa_hologramm` ohne Fundstelle. ⊂ ND-06. | grep | wichtig |
| AN-03 | bestätigt | `ohrfeige` ohne Fundstelle in Skripten. ⊂ ND-06. | grep | wichtig |
| AN-04 | bestätigt | `kapsel_aufstehen`, `kapsel_hinlegen` u. a. ohne Fundstelle. | grep | wichtig |
| AN-05 | teilweise | `talk_alt` hat keine Fundstelle in Skripten/Daten (außer den Figur-Sheets); die GIFs sind vorhanden, aber nicht gesichtet. | grep | wichtig |
| AN-06 | teilweise | Beleg `stand_gegen_gestenpose_w3.png` vorhanden, nicht gesichtet. | – | wichtig → **kosmetisch** (Sprünge von einem Bild, keine Spielfolge) |
| AN-07 | bestätigt | `schmidt_ohne_brille` ohne Fundstelle. Verwandt mit GS-05: Brille und Akte liegen zusätzlich schon im Raum. | grep | wichtig |
| AN-08 | bestätigt (Code) | `_max_gang()` tauscht nur `walk_animation`, `walk_speed` bleibt. Die Rutsch-Rechnung habe ich nicht nachgerechnet. | `welt_3.gd` Z. 476–483 | wichtig |
| AN-09 | bestätigt | `laufen_zu` kommt in `welt_3.gd` nicht vor. | grep | wichtig → **kosmetisch** (Ein-/Ausblenden statt Gang, kein Fehler im Ablauf) |
| AN-10 | teilweise | CSV vorhanden, nicht nachgerechnet. | – | kosmetisch |
| AN-11 | bestätigt | `"W3_KAM1_BER_0170": ["BER", "davonschweben", "vor"]` (`gesten_welt_3.gd` Z. 100). | Code | kosmetisch |
| AN-12 | bestätigt | Alle geprüften Namen (`w3_lautsprecher`, `w3_kuechenradio`, `w3_tuer_kammer3`, `w3_hologramm`, `w3_verwandlung`, `w3_portal`, `w3_kopieren`, `w3_hausmeister_rollen`, `w3_faecher`, `w3_schnee`) ohne Fundstelle. | grep | wichtig |
| AN-13 | teilweise | Zählung nicht nachgerechnet. | – | kosmetisch |
| AN-14 | bestätigt | Bild: Auto vor dem Nachttisch. = GS-10 ≈ TA-04. | Beleg gesichtet | kosmetisch |
| AN-15 | bestätigt | Die Szene hat nur `CharacterRebellin`, keinen Rebell. ≈ TA-15. | `room_widerstandsbasis.tscn` | kosmetisch |
| AN-16 | bestätigt | `kater_halten`, Piepsi `"fahren"` ohne Fundstelle; Hausschuh nur bei Schmidt (`gesten_welt_3.gd` Z. 54). | grep | kosmetisch |
| AN-17 | nicht geprüft | Doku-Fund (Workflow). | – | kosmetisch |

### Godot (GS)

| Fund-ID | Urteil | Begründung | (neuer) Beleg | Priorität-Empfehlung |
| --- | --- | --- | --- | --- |
| GS-01 | bestätigt, schwerer | siehe Abschnitt 1. | `belege/evidenz/ev_sackgasse_log.txt` | kritisch |
| GS-02 | bestätigt | siehe Abschnitt 1. | `belege/evidenz/ev_tuer_log.txt` | **wichtig (hoch)** |
| GS-03 | bestätigt | = TA-02. Log-Zeile 82: Bild oben links (0, −180). | `belege/godot/zustaende_stadtstrasse_log.txt` | wichtig |
| GS-04 | bestätigt | = TA-01 = LD-01. | wie TA-01 | wichtig |
| GS-05 | bestätigt | Sonnenbrille und Akte haben `nehmen` ohne Bedingung; Log: beide vor R6 im Inventar. Folge über GS hinaus: Wer die Akte vorher liest, hat Regel 1 schon (R10), damit wird R6 umgehbar. | `belege/godot/nehmen_vor_dem_raetsel.txt`; `welt-3.json` | wichtig |
| GS-06 | bestätigt | Datenanschluss 270–360 × 125–235 liegt auf der Panzertür (248–400 × 108–248). Klickprotokoll am Anfang: `BENUTZEN=W3_EING_KAL_0380`. `benutzen_datenanschluss` gibt vor dem Öffnen `false` zurück, deshalb fällt der Klick auf die Bauplan-Zeile mit dem ungeprüften `bedingung_text` durch. | `belege/godot/klicks_welt-3_anfang.txt`; `welt_3.gd` Z. 1334–1340 | wichtig |
| GS-07 | bestätigt | = LD-05 (dazu Scherben 470–550 × 286–316 ohne Bedingung, Ansehen am Anfang nur Ersatzzeile). | Klickprotokolle | wichtig |
| GS-08 | bestätigt (Daten) | Halterung 108–136 × 184–220 liegt fast deckungsgleich in `PortalgeraetInDerHalterung` 106–138 × 180–222. | `testkammer_1_anfang.json` | wichtig |
| GS-09 | bestätigt (Daten) | Radiowecker y 262–280, klingelnder y 280–302. | `stadtstrasse_anfang.json` | kosmetisch |
| GS-10 | bestätigt | = AN-14 ≈ TA-04. | Beleg AN gesichtet | kosmetisch |
| GS-11 | bestätigt | Bild: Passanten, Max und Auto hell in der Nacht. ⊂ TA-05. | Beleg gesichtet | wichtig |
| GS-12 | bestätigt (Stichprobe) | Ersatzzeilen mit `*` z. B. bei Datenanschluss, Halterung, Scherben im Protokoll. | Klickprotokolle | wichtig |
| GS-13 | bestätigt (Daten) | Rebellen 340–740 × 230–260. | JSON | kosmetisch |
| GS-14 | bestätigt (Daten) | Omas Haustür 500–540 (40 px), Ausgänge der Kammern 518–560 (42 px). | JSON | kosmetisch |
| GS-15 | teilweise | Zeigerkarten vorhanden, Prozente nicht nachgerechnet. | – | kosmetisch |
| GS-16 | bestätigt (Daten) | Lüftungsschacht und AusgangKuehlung beide 1122–1242 × 296–332. Folgen erst nach GS-01. | `widerstandsbasis_ende.json` | kosmetisch |
| GS-17 | bestätigt | Hotspot 800–980 × 0–24; Klickprotokoll `Sonne ANSEHEN=W3_SIM_MAX_0320`. ⊂ ND-12. | JSON, Protokoll | kosmetisch |
| GS-18 | bestätigt | Bild: gelbe Fläche 439–501 nur über dem Körper, Kopf/Auge außerhalb. | `belege/godot/kern_mutti_klickflaeche.png` gesichtet | kosmetisch |

### Workflow (WF, Stichproben)

| Fund-ID | Urteil | Begründung | Beleg | Priorität-Empfehlung |
| --- | --- | --- | --- | --- |
| WF L-09 / WF-11 | bestätigt | `tools/gemini_bild_mcp.py` Z. 19: `STANDARD_MODELL = "gemini-3-pro-image"  # Nano Banana Pro`. | Code | wie gemeldet |
| WF-15 | bestätigt | `docs/lessons-learned.md` hat 433 Zeilen. | `wc -l` | wie gemeldet |
| WF-16 | bestätigt | `.gitignore` enthält keinen Eintrag für `game/tests/_*`. | `.gitignore` | wie gemeldet |

## 3. Doppelungen über die Rollen

- **Apothekengasse 640 statt 1280:** TA-01 = LD-01 = GS-04 (ein Fund; Priorität wichtig).
- **Code-Sicht 180 px zu hoch:** TA-02 = GS-03.
- **Raumlicht fehlt:** TA-05 ⊃ GS-11 (GS-11 ist der Nacht-Teil).
- **Code-Sicht als Liste statt Etiketten / Tutorialtext:** GD-08 = ND-09.
- **Ankunft in Figuren:** LD-04 ≈ TA-08 (TA-08 ist die Ankunft der Unterstadt, Pixel an der Frau).
- **Kaffeepfütze vor R13:** LD-05 = GS-07 (GS-07 dazu Scherben).
- **Autos/Nachttisch:** TA-04 ≈ AN-14 = GS-10 ≈ LD-06 (Nachttisch-Teil; LD-06 dazu Sockel im Kern).
- **Testkammer 3, Bernd/Grube:** LD-03 = ND-10 ≈ TA-17.
- **Morse-Tabelle T:** ND-03 = TA-12.
- **Sonne ohne Sonne:** GS-17 ⊂ ND-12.
- **Bild-Pointen nicht eingebaut:** ND-06 ⊃ AN-02 (Hologramm), AN-03 (Ohrfeige), Teile von AN-12 (Portal, Verwandlung, Kopieren).
- **Rebell/Rebellin:** TA-15 ≈ AN-15 (eine Ursache: Szene nicht nach Layout gebaut).
- **Büroturm, Brille und Akte:** GS-05 und AN-07 hängen zusammen (Gegenstände liegen schon im Raum, und Schmidt behält sie trotzdem).
- **Pixel-Klickweg:** GS-01 ist die Ursache, von der GD-01 (Pixel-Weg zählt nicht), GD-04 (Schütteln, heute nicht möglich), ND-11 (Eimer) und GS-16 (Folgen erst danach) abhängen.
- **Budget ohne Ausgang:** GD-02 und GD-03 haben dieselbe Ursache.

## 4. Zählung

Urteile über 95 Spiel-Funde (LD 10, ND 21, GD 12, TA 17, AN 17, GS 18; Doppelungen einzeln gezählt), dazu 3 WF-Stichproben:

| Urteil | Anzahl |
| --- | --- |
| bestätigt (davon im Spiel nachgestellt: ND-01, GS-01, GS-02, TA-01/LD-01/GS-04, GD-01, AN-01) | 75 |
| teilweise (darunter GD-04: im Code richtig, im heutigen Spiel nicht erreichbar) | 16 |
| nicht bestätigt | 0 |
| nicht prüfbar / nicht geprüft | 4 (ND-15, ND-16, TA-13, AN-17) |
| WF-Stichproben bestätigt | 3 von 3 |

Kritische Funde: **ND-01 und GS-01 sind echte harte Sackgassen** (im Spiel nachgestellt). GS-02 und TA-01 sind nicht blockierend (→ wichtig).

Empfohlene Prioritätsänderungen:
- GS-02: kritisch → wichtig (hoch).
- TA-01: kritisch → wichtig (wie LD-01/GS-04).
- TA-10: wichtig → kosmetisch.
- ND-07: wichtig → kosmetisch.
- AN-06: wichtig → kosmetisch.
- AN-09: wichtig → kosmetisch.
- LD-04: wichtig → kosmetisch bis wichtig (zusammen mit TA-08).
- GD-04 bleibt wichtig, ist aber heute wegen GS-01 nicht erreichbar; mit GS-01 zusammen entscheiden.
- Hinweis zu GD: „Keine harte Sackgasse“ ist zu streichen.
- Hinweis zu ND-01: Die vorgeschlagene Sichtbarkeitsregel greift nicht, weil `option_sichtbar()` zuerst `used` prüft; 0090 braucht „(bleibt)“.

## Nicht geprüft

- Herr Vier 0090 nach einem Abbruch der Bestellauswahl mit Esc (gleiche Falle wie ND-01 vermutet, nur im Code gesehen).
- Weitere Wege aus dem Büroturm ohne Pixel habe ich gesucht (Ausgang, Wecker, Pastillen, Terminal), aber nicht jeden Gegenstand auf jedes Objekt im Spiel kombiniert.
- Die Bewegungs- und Textstatistiken (AN-08, AN-10, AN-13, ND-13 bis ND-17) habe ich nicht nachgerechnet.
- Englische Nahansichten, die Bildfolgen der Animationen und den Übergang ins Zwischenspiel 3 habe ich nicht gesichtet.

FERTIG
