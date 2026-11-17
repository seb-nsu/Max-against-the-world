# Review 17.11.2026 – Belegprüfung (Evidence Collector, EV)

Rolle: Evidence Collector. Je Fund (ND, GD, LD, GS, TA, AN; nicht WF) geprüft: gibt es einen Bildbeleg, zeigt er den Fund, stimmt die Aussage am Bild bzw. am Code?
Stand: `main` auf `ae6619c1` (Checkout `cq-r3` steht auf einem späteren Notiz-Commit; `git diff ae6619c1 -- game tools` ist leer, Spielcode also gleich).
Pfade relativ zu `docs/review/2026-11-17/`. Neue Belege unter `belege/evidenz/`, Aufnahme-Skripte `game/tests/_review_ev_*.gd` (nicht committet).

Bewertung: **ja** = am Beleg/Code nachvollzogen; **teilweise** = Kern stimmt, Teile übertrieben, ungenau oder nicht belegbar; **nein** = stimmt nicht; **nicht prüfbar** = mit vertretbarem Aufwand weder bestätigt noch widerlegt.

Stand: fertig (17.11.).

## Narrative (ND)

| Fund-ID | Beleg vorhanden (Pfad) | Neuer Beleg (Pfad) | Bestätigt? | Bemerkung |
| --- | --- | --- | --- | --- |
| ND-01 | – (nur Zählung) | `belege/evidenz/ND-01_blase_203_zeichen.png`, `ND-01_blase_pixel_172_zeichen.png` | ja | Im Spiel (Stadion, Testmodus aus): `W2_RING_MAX_0030` steht als eine fünfzeilige Blase, `W2_HINT_PIX_0331` ebenso. Hinter die Porträts wächst sie hier nicht (Max steht rechts), Länge bestätigt. Nachgezählt in `texte.csv`: W2 26 Zeilen > 140, 144 > 120; P0/W1 je 0 > 140. `pruefen.py` Z. 385: Warnung nur bei `prolog`/`welt-1`, sonst `H` (Hinweis). Längste Sprecherblasen wie angegeben (W2_RING_MAX_0030 = 203). |
| ND-02 | – (Zählung, Code) | `belege/evidenz/ND-02_nar_211_zeichen.png` | ja | Im Spiel: `W2_FINA_NAR_0120` füllt vier Zeilen oben im Bild und ist nach 5 s weg. `spiel.gd` Z. 285 `clampf(len/15, 1.6, 5.0)` stimmt. Längen 211/207/187/177/148 stimmen. Zählung leicht abweichend: ich finde 29 W2-Schlüssel mit `_NAR_` (27 davon > 75 Zeichen) statt 31/26, W1 10 statt 11. Aussage bleibt gleich. |
| ND-03 | – (Code) | – | teilweise | Zeilen in `welt_2.gd` (382, 768, 779, 794, 894 …) existieren und sind reine NAR-Text-Szenen. „Rund 19 ohne Bild“ ist eine Einschätzung, nicht einzeln nachgezählt; dass Sobeks Verbeugung als Text kommt, deckt sich mit AN-17. Nicht im Spiel angesehen. |
| ND-04 | – (Code, CSV) | `belege/evidenz/ND-04_satz_platzhalter.png` | ja | Im Spiel nachgestellt (Thronsaal, Kacheln Auge ×4): Schreiber sagt wörtlich „Das liest sich: „[Satz]“. … Ich les es vor.“, danach kommt nichts (Protokoll endet mit 0120). `texte.csv` Z. 3086 „Das liest sich: „[Satz]“ …“; `welt_2.gd` Z. 691 `_szene(["W2_HIER_SCH_0120"] + pointe)` ohne Einsetzen; Restfall `pointe = []` bekommt nur 0120. |
| ND-05 | – (CSV) | – | ja | Sechs Stellen gefunden (0910, 0970, AUDI_RAM_0100, BUER_HER_0330, BUER_MAX_0340, ABS_HER_0060). |
| ND-06 | `belege/raeume/nil_delta_anfang.png` | – | ja | Im Panorama liegt der Bauplan (Pyramide verkehrt) als Blatt im Weizenfeld (ca. 960–1000 × 215–247), Steinmetz hält einen Hammer; `W2_NIL_MAX_0710` „Er hält den Plan …“ passt nicht zum Bild. |
| ND-07 | `belege/narrative/thronsaal_ramses_saeule_inschrift_thron.png`, `belege/raeume/thronsaal_ramses_anfang.png` | – | ja | Alle vier Teile am Bild: Säulen glatt mit Blattband, Inschrift-Feld leer (8 Felder), Holzthron ohne Kissen mit stehendem Ramses, nur ein Wedler. |
| ND-08 | `game/grafik/nahansichten/hieroglyphen_grammatik.png` | – | ja | Nahansicht: Ohr → Wellen, Mund → Brot, Hand → Scheibe mit Punkt (gleich dem 2. Feld der oberen Reihe). Text `W2_THRO_MAX_0280` sagt Gehör/Brot/Gold. |
| ND-09 | `belege/raeume/sphinx_anfang_klick.png` | – | ja | Schreibpult (Hotspot 280–358 × 178–235) ist ein kleiner Tisch, niedriger als Max; „so groß wie ein Auto“ passt nicht. |
| ND-10 | `belege/narrative/w2_hintergrund_varianten.png` | – | ja | `welt-2.json` Z. 2433–2435 `hintergrund_nach` nur R12/R13; Hotspot `sandale_auf_der_saeule` ohne Sichtbarkeitsbedingung (`ansehen_sandale_auf_der_saeule` gibt vor R12 bzw. nach R6a Ersatz, `welt_2.gd` Z. 452–456). Bild nach R6a nicht selbst aufgenommen, folgt aber zwingend aus den Daten. |
| ND-11 | – (CSV) | – | ja | `W2_AGOR_MAX_0225` wörtlich wie zitiert; Sandalen-Szene `W2_SAND_TOU_0020` vorhanden. Wertung (wer den Film kennt) ist Geschmack. |
| ND-12 | – (Testlauf-Protokoll) | `belege/evidenz/ND-12_hermes_menue_vorher.png`, `ND-12_hermes_menue_leer.png`, `ND-12_hermes_nach_klick_und_esc.png` | ja | Im Spiel (Startbüro, Testmodus aus, Skript `_review_ev_w2.gd nd12`): Menü mit der einen Option, nach der Wahl leere Menüleiste am unteren Rand, `D.current_dialog` bleibt Hermes. Bodenklick bewegt Max danach nicht (Gegenprobe vor dem Gespräch: Max läuft), auch Esc beendet das Gespräch nicht: Spiel hängt, kritisch zu Recht. Nebenbei: Hermes steht im Startbüro direkt vor Max und Pixel (Überlappung, siehe Bild). `welt-2.json` Dialog `hermes`: genau eine Option 0650, `beendet: false`, `bleibt: false`; `welt_2.gd` Z. 349 Hermes im Startbüro bei `W2_HERMES_IM_BUERO` und nicht R12. |
| ND-13 | `belege/narrative/thronsaal_ramses_saeule_inschrift_thron.png` | – | ja | Hotspot `saeulen` (355, 20, 55, 255) hat nur Ansehen 0260/0265, keine Nahansicht; `ansehen_inschrift()` (`welt_2.gd` Z. 614–620) öffnet `hieroglyphen_grammatik`. `W2_HIER_SCH_0050` und `W2_HINT_PIX_0221` sagen „an der Säule“. |
| ND-14 | `belege/narrative/startbuero_bank_beamter.png`, `belege/raeume/startbuero_anfang.png` | – | ja | Vier Wartende, keiner mit Bart bis zum Boden; Berg loser Blätter statt Schriftrollen; Beamter 1 ohne lange Rolle. |
| ND-15 | `belege/raeume/stadion_anfang_klick.png` | – | ja | Wurfhebel im Anfangspanorama bei ca. 88–198 × 160–225 gemalt; Hotspot ohne Sichtbarkeitsbedingung. |
| ND-16 | – (CSV) | – | ja | (a) „Die spinnen, die Griechen“ in `W2_AUDI_MAX_0110` und `W2_STAD_MAX_0010`; (b) Schildkröte/Philosoph in `W2_STAD_MAX_0255` und `W2_TAG1_PIX_0070`; (c) Geduld (`AGOR_CIC_0350`/`ABS_CIC_0200`), Kreise (`WERK_ARC_0440`/`ABS_ARC_0160`), fester Punkt (`TRAI_ARC_0030`/`ABS_ARC_0150`) je doppelt. |
| ND-17 | – (CSV) | – | ja | W2 sieben Zeilen mit „freiwillig“ (u. a. `GRAB_MAX_0090`, `PARA_MAX_0280`), W1 vier. |
| ND-18 | – (CSV) | – | ja | `W2_NIL_MAX_0730` („In jedem Spiel …“) und `W2_THRO_MAX_0120` (Startbildschirm) wörtlich; Häufung ist Wertung. |
| ND-19 | – (CSV) | – | ja | `W2_INV_MAX_0060` „seit Welt eins nervös“. |
| ND-20 | – (CSV) | – | ja | `W2_KUCH_MAX_0105` „in hundert Jahren Essig“; `W2_FAHR_MAX_0090` macht ihn zu Wein. „Rechnet falsch“ ist Vermutung; die Zeile ist eher irreführend als rätselbrechend. |
| ND-21 | – (CSV) | – | ja | `W2_WERK_MAX_0450` „Ihr seid der König?“, `0490` „… setzt du …“. |
| ND-22 | – (Code) | – | ja | 27 Zeilen-IDs in der Ankunftsszene (`room_dorfplatz.gd` ab Z. 25) nachgezählt. Die Minutenangabe ist eine Formel-Schätzung ohne Laufwege, kein Messwert. |
| ND-23 | – (Code) | – | ja | 32 Zeilen-IDs in `zs1_ankunft()` (`room_dachboden.gd` Z. 401–436) nachgezählt; Dauer nur geschätzt. |
| ND-24 | – (CSV) | – | ja | W1-NAR-Längen 122/105/96/91 stimmen (10 W1-NAR-Schlüssel gefunden, 4 über 75). |

## Game Design (GD)

| Fund-ID | Beleg vorhanden (Pfad) | Neuer Beleg (Pfad) | Bestätigt? | Bemerkung |
| --- | --- | --- | --- | --- |
| GD-01 | `belege/game-design/szenario_lauf1.txt`/`lauf2.txt` (A2) | `belege/evidenz/GD-01_pfote_fernseher.png` | ja | Im Spiel nach R1 im Nil-Delta, Klick auf die Pfote: Pixel sagt „Es ist alles erledigt. Jetzt fehlt nur noch, dass du in den Fernseher steigst.“ A2 in beiden Läufen `offen=[]`, Zeile `P0_HINT_PIX_0010`. `hinweise.gd` `_sonderzeile()` fällt auf Prolog zurück; `daten/hinweise/welt-2.json` `sonderzeilen` nur `wartezeile`; `zustand.gd` Z. 160 `war_in(r.raum)`. |
| GD-02 | Szenario A6–A9 | – | ja | A6–A9 zeigen R4/R6a vor Pflichtschritten; `hinweise.gd` Z. 59 natürliche Sortierung; `optional` wird in `hinweise.gd`/`zustand.gd` nicht gelesen. |
| GD-03 | Szenario A5, A8 | – | ja | A5 `offen=["R8"]` nach Audienz; A8 nur R4/R6a(/R8). Ursache wie GD-01 (`war_in`). |
| GD-04 | Szenario B1 | – | ja | B1 Ersatzzeile bei 1 Baustein; `welt_2.gd` Z. 1507 `if vorrat.size() < 3: await Spiel.ersatz()`; Wunderdinge haben eine zweite Ansehen-Zeile mit `mal: 2` (`welt-2.json` gegenstaende[0–2]). |
| GD-05 | Szenario C1–C3, I2 | – | ja | `welt_2.gd` Z. 776–778 Brennspiegel nur `and not _hat("kaugummi")`; Z. 1791 Bonus braucht alle drei. Folgerung „unerreichbar“ schlüssig (Kaugummi geht nur im Duell/bei Nebet). |
| GD-06 | Szenario C1/C2 | – | ja | `behandelt=false` in beiden Läufen. |
| GD-07 | Szenario E1–E4 | – | ja | `kombi_kugelschreiber_leeres_formular` (Z. 871) und `kombi_tintenfass_papyrusblatt` (Z. 882) prüfen nur `audienz()`, `_schalter` (Z. 919) prüft R3b nicht; E2/E3 bestätigen. |
| GD-08 | Szenario G1 | – | ja | `_einmal("W2_VERHOERT_…")` (Z. 1403); `notizbuch.gd` `regeln()` listet nur Nahansichten; Kommentar Z. 1406 verspricht „alle acht Aussagen im Notizbuch“. |
| GD-09 | Szenario G2, I1 (Lauf 2) | – | ja | `welt_2.gd` Z. 1666 Bestleistung für `["diskus", "wurfscheibe"]`; I1 Lauf 2 `true`. |
| GD-10 | – (Code) | – | ja | `benutzen_startlinie`: eine Zeile `W2_STAD_MAX_0300` für alle drei fehlenden Teile (Z. 1148–1149). |
| GD-11 | Szenario H3/H4 | – | ja | H3 „grau“ in Olympia, H4 R10b sofort; `welt_2.gd` Z. 1619. Bewusste Bauweise, Wertung stimmt. |
| GD-12 | Szenario I3 | – | ja | Protokoll endet mit `W2_PARA_ARC_0090`, R11a false. |

## Level Design (LD)

| Fund-ID | Beleg vorhanden (Pfad) | Neuer Beleg (Pfad) | Bestätigt? | Bemerkung |
| --- | --- | --- | --- | --- |
| LD-01 | `belege/level-design/LD_werkstatt_brennspiegel_lauf.png` | – | ja | Vier Bilder: Max verschwindet bei x 520 hinter Hieron, Ankunft mit Max vor dem Essigkrug, Pixel an Hierons Füßen. JSON: Hieron (520, 312), Max/Start (590, 310), Pixel (545, 310). |
| LD-02 | `belege/raeume/trollbruecke_ende_klick.png`, `trollbruecke_ende.json` | `belege/evidenz/LD-02_zeldina_in_xxl_ziege.png` (Ausschnitt aus dem vorhandenen Panorama, roter Rahmen) | ja | Zeldina steht sichtbar im Körper der XXL-Ziege, beide (110, 196). Code `welt_1.gd` `figuren_anwenden()`: `i` wird nur bei folgenden Figuren erhöht, die XXL-Ziege bekommt `i = 0`, Zeldina als erste Folgende ebenfalls. Endzustand Welt 1 ist hier aussagekräftig (der Fehler hängt nur an „Zeldina folgt“). |
| LD-03 | `belege/raeume/abstellkammer_1_anfang_klick.png` | – | ja | Hotspot-Rechteck rechts unten liegt auf leerem Boden, kein Besen im Bild. |
| LD-04 | `belege/raeume/stadion_anfang_klick.png`, `trollbruecke_anfang_klick.png`, `zauberwald_anfang_klick.png` | – | ja | Laufbahn 160–1060 × 300–324 quer im Laufbereich und Startlinie senkrecht am Boden im Bild sichtbar. Troll-Brücke `Bruecke` 150–480 × 160–205 liegt auf dem Laufweg (JSON). Zauberwald: Prop `AlterBaum` klickbar, Rechteck 340–490 × 0–360 (JSON; das Zauberwald-Panorama selbst ist falsch zusammengesetzt, die JSON-Werte stimmen). Prozentwerte nicht nachgerechnet. |
| LD-05 | `belege/raeume/faehrsteg_olympia_anfang_mitmax.png` | – | teilweise | Max steht im Fährmann (Start = VonFaehre 130/310, Fährmann 118/302), das stimmt. Übertrieben: Max verdeckt die Fährtafel nur am linken Rand, die Sanduhr verdeckt eher der Fährmann als Max. |
| LD-06 | `belege/level-design/LD06_nil_delta_faehrtafel.png` | – | ja | Fährmann steht vor der Tafel und verdeckt den größten Teil. Max-Überlappung am Marker VonFaehre nur aus JSON (Max-Rechteck rund 260 px breit bei Skala, Abstand 40 px), nicht im Bild. |
| LD-07 | `belege/level-design/LD08_agora_tuer_startbuero.png` | – | ja | Tür 85 px gegen Max 167 px am walk_to-Punkt; Tonne überdeckt den rechten Türrand (etwa ein Drittel, „halb“ ist leicht übertrieben). Dateiname „LD08“ passt nicht zur ID LD-07. |
| LD-08 | `belege/raeume/grabhuegel_anfang_klick.png` | – | ja | Der sandige Pfad mit Zeigertext „Hafen“ liegt ganz im Rechteck „Brombeeren“; Ausgang nur der schmale Streifen links. |
| LD-09 | `belege/level-design/LD13_luftschloss_brunnen.png`, `belege/level-design/lauf/b03_luftschloss_ende.png` | – | ja | Grüne Laufbereichsgrenze verläuft oberhalb des Brunnens, das Becken liegt im Laufbereich. Dateiname „LD13“ passt nicht zur ID LD-09. |
| LD-10 | `belege/raeume/klassenzimmer_anfang_mitmax.png` | – | ja | Toadi an der Tür, Max und Pixel direkt daneben, Rest des Raums leer. |
| LD-11 | `belege/raeume/sphinx_anfang_klick.png`, `sphinx_anfang.json` | – | ja | Magenta-Streifen `SphinxFigur` an der Vorderpfote, sonst keine Klickfläche auf dem Körper; Kopf nur `Nase`. Gleicher Fund wie GS-11 (doppelt gemeldet). |
| LD-12 | `belege/raeume/abstellkammern_anfang_klick.png`, `stadion_anfang_klick.png` | – | ja | Abstellkammern: Rundbogen mit Treppe rechts neben der Geheimtür ohne Hotspot; Stadion: Sandweg links oben führt aus dem Bild, kein Ausgang. Dorfplatz-Ringladen nicht einzeln angesehen. |
| LD-13 | `belege/raeume/startbuero_anfang_klick.png`, `startbuero_anfang.png` | – | ja | Bank `BankMitWartenden` 0–110 × 160–280 steht vor dem unteren Teil der Tür `AusgangAgora` (55–120 × 40–215). |
| LD-14 | `belege/level-design/lauf/14_dorfplatz_ende.png`, `17_trollbruecke_ende.png` | – | ja | Rechnung nachvollzogen: Dorfplatz `skala 0.72`, `tiefe 0.4` → 150 × 0,72 × 0,4 = 43 px/s hinten, 108 px/s vorn; `cq_raum.gd` `tiefe_anwenden()` setzt `scaling_region`, Popochius `current_walk_speed` multipliziert. Laufzeiten aus dem Lauftest-Protokoll übernommen, nicht neu gemessen. |
| LD-15 | `belege/level-design/lauf/01_…` bis `05_…` | – | ja | Laufzeiten aus Lauftest (140 px/s, Raumbreite 1280) plausibel; nicht neu gemessen. Wertung (zu viel Laufen) ist Design-Einschätzung. |
| LD-16 | `belege/level-design/lauf/06_hafen_syrakus_ende.png` | – | ja | Laufbereich Hafen `[8,215],[560,215],[580,280],[632,300]…`: bei y 255 endet er bei etwa x 572, walk_to (590, 255) liegt also rund 17 px außerhalb. |
| LD-17 | `belege/raeume/agora_anfang_klick.png`, `stadion_anfang_klick.png`, `bergwerk_anfang_klick.png`, `grabhuegel_anfang_klick.png` | – | ja | Agora: Sockel der linken Bogensäule im grünen Bereich; Stadion: Sandgruben-Rand; Bergwerk: Füße der gemalten Streikposten im Laufbereich. Grabhügel-Busch rechts unten nur knapp im Bereich. |

## Godot Gameplay Scripter (GS)

| Fund-ID | Beleg vorhanden (Pfad) | Neuer Beleg (Pfad) | Bestätigt? | Bemerkung |
| --- | --- | --- | --- | --- |
| GS-01 | `belege/godot/*_anfang_zeiger.png` | – | ja | Code nachgelesen: `popochiu_clickable.gd` Z. 499–503 vergleicht `get_index()`; `spiel.gd` `_zeiger_flaeche()` (Z. 709–713) liest `bauplan().rect`, Figuren haben im Bauplan kein `rect` (Schlüssel der Figuren in `welt-2.json` geprüft) → 0 → Ausnahme greift nie. Zeiger-Karten zeigen niedrige Prozente bei Figuren (z. B. Humbert 9 %, Fährmann Syrakus 22 %). |
| GS-02 | `belege/godot/taverne_anfang_zeiger.png` | `belege/evidenz/GS-02_fischsuppe_richtungsabhaengig.png` | ja | Der vorhandene Bildbeleg zeigt nur eine Fahrtrichtung (Fischsuppe dort 100 %) und belegt den Fund nicht; die Rohdaten von `_review_gs_zeiger2.gd` waren nicht abgelegt. Selbst nachgefahren (Taverne): Maus von links → an allen 48 Rasterpunkten der Suppe „Tresen“, von rechts → überall „Fischsuppe“. Mechanismus in `spiel.gd` Z. 703–705 (`add_hovered(obj, true)`). Andere Objekte der Liste nicht nachgemessen. |
| GS-03 | `belege/godot/taverne_anfang_zeiger.png`, `dachboden_…`, `klassenzimmer_…`, `bergwerk_…`, `turmkeller_…` | – | ja | Taverne-Karte: Humbert 9 %. Übrige Werte aus den Karten übernommen, Stichprobe stimmig. |
| GS-10 | `belege/godot/palastkueche_anfang_zeiger.png` | `belege/evidenz/GS-10_traubensaft_nie_getroffen.png` | ja | Karte zeigt „Traubensaft 0 %“. Daten: Prop `traubensaft` und Hotspot `traubensaft_amphore` beide `[492, 148, 45, 70]`. Nachgefahren in beide Richtungen: an allen 77 Punkten gewinnt `TraubensaftAmphore`. Der Saft ist mit der Maus nicht zu bekommen. |
| GS-11 | `belege/raeume/sphinx_anfang_klick.png` | – | ja | Wie LD-11 (Doppelmeldung). Klickfläche 20 × 51 an der Pfote im Bild sichtbar. Dass `sphinx_figur.png` leer ist, nicht selbst geöffnet, passt aber zu `sphinx_figur` idle 1 Bild (AN-Inventar). |
| GS-12 | `belege/godot/werkstatt_modell_leer.png` | – | ja | Rechteck `ModellSchieferTurm` liegt auf einem leeren Brett; `W2_WERK_MAX_0250` beschreibt Turmmodell mit Zettel. |
| GS-13 | `belege/godot/agora_anfang_zeiger.png`, `belege/raeume/agora_anfang_klick.png` | – | ja | Hotspot `SandaleAufDerSaeule` (870–932 × 0–42) im Anfangszustand sichtbar über dem leeren Adler. Gleicher Kern wie ND-10 (Doppelmeldung). Inventarleiste ab y < 24 nicht selbst geprüft. |
| GS-14 | Tabelle aus `belege/raeume/*_anfang.json` | – | ja | Breiten nachgemessen: Sandweg 44, Sphinx-Ausgang 40, Agora 44/42, Stadion 45, Werkstatt 40, Grabhügel 40, Wasserschloss 30 px. |
| GS-15 | `belege/raeume/stadion_anfang_klick.png` | – | ja | Wie LD-04 (Doppelmeldung); Benutzen-Zeilen der Startlinie 0280–0310 in `welt-2.json` vorhanden. |
| GS-16 | `belege/godot/hafen_syrakus_anfang_zeiger.png`, `nil_delta_…`, `faehrsteg_olympia_…` | – | ja | Syrakus-Karte: Fährmann 22 %, Rumpf unter `Fischernetze`. |
| GS-17 | `belege/godot/<raum>_anfang_zeiger.png` | – | ja | Palastküche-Karte: Nebet 42 % (Oberkörper unter `Oelkruege`). Übrige Werte nicht einzeln nachgesehen. |
| GS-18 | – (Protokoll nur im Notiztext) | – | ja | Code: `_figur_laeuft` außerhalb von `_szene` (`welt_2.gd` Z. 389–390, 939, 1111; Max-Lauf Z. 1172; Fährmann Z. 521). Das Lauf-Protokoll von `_review_gs_eingabe.gd` ist nicht als Datei abgelegt, nicht wiederholt. |
| GS-19 | `belege/godot/sobek_folgt_thronsaal.png` | – | ja | Im Bild nur die Krokodilschnauze am linken Rand. Code `welt_2.gd` Z. 369–371: Pixel + (−150, 5) ohne Randprüfung. |
| GS-20 | – (`statisch.py`-Abgleich) | – | ja | Szene (JSON aus der Laufzeit): Ei, Zahnstocher, Okarina je 20 × 20, Schwerterbündel 40 × 40; Layout `tools/layout/welt-1.yaml` Z. 156 Ei `[366,166,12,12]`, Z. 215 Zahnstocher `[285,140,15,12]`. Bauwerkzeug übernimmt bei `--cq-layout` die Daten (`bauer.gd` Z. 367 ff.). |
| GS-21 | – (Code) | – | ja | `popochiu.gd` Z. 270–284 setzt `cutscene_skipped` nach jeder `cutscene()` zurück; Abläufe in `welt_2.gd` bestehen aus mehreren `_szene`-Aufrufen. Im Spiel nicht mit Esc nachgespielt. |
| GS-22 | – (Protokoll `klicks_welt-2_anfang.txt` nicht abgelegt) | – | teilweise | Bestätigt: `_bedingung_text()` (`welt_2.gd` Z. 304–324) kennt „vor dem Training“ nicht (liefert `null`). Die Liste der Ersatzzeilen beim Rechtsklick ist ohne abgelegtes Protokoll nicht nachprüfbar; nicht nachgeklickt. |
| GS-23 | `belege/godot/*_anfang_zeiger.png` | – | ja | Weiße Flächen unter Porträts und Pfote in den Karten sichtbar (z. B. Stadion `Glockenturm` an der Pfote, `stadion_anfang_klick.png`). Startbüro-Mittelbank: `BankMitWartenden` deckt nur 0–110 × 160–280, die mittlere Bank (ca. 125–205) hat keinen Hotspot. |

## Technical Art (TA)

| Fund-ID | Beleg vorhanden (Pfad) | Neuer Beleg (Pfad) | Bestätigt? | Bemerkung |
| --- | --- | --- | --- | --- |
| TA-01 | `belege/technical-art/raumlicht_pixel_abstellkammer1_vs_abstellkammern_turmkeller.png`, `belege/raeume/schmiede_anfang_mitmax.png` | – | ja | `licht:` nur fünfmal in `tools/layout/welt-1.yaml` (Z. 356/409/492/551/597), in Prolog/Welt 2 gar nicht. Im Vergleichsbild ist Pixel in der Abstellkammer 1 deutlich heller als in den Abstellkammern. Wirkung in Taverne/Schmiede ist Geschmackssache. |
| TA-02 | `belege/technical-art/luftschloss_naht_640.png` | – | ja | Harte senkrechte Kante bei x 640, Bodenfugen links blass/schräg, rechts dunkel/gerade. Messwert (Faktor 20) nicht nachgerechnet. |
| TA-03 | `belege/technical-art/luftschloss_ranke_vor_max_gesicht.png` | – | ja | Ein Rankenblatt liegt vor Max' Gesicht. |
| TA-04 | `belege/technical-art/faehrsteg_max_verdeckt_faehrmann.png`, `hafen_start_ueberlappung.png`, `werkstatt_start_ueberlappung.png`, `dachboden_start_ueberlappung_opa.png` | – | teilweise | Fährsteg (Max im Fährmann, siehe auch LD-05), Hafen (Pixel auf den Füßen des Fährmanns, Max am Stab) und Werkstatt (siehe LD-01) stimmen. Dachboden: im Beleg überdecken sich Max und Opa nicht, sie stehen nur dicht; „Max' Arm über Opa“ ist am Bild nicht zu sehen (Opa wandert, die Lage hängt vom Zeitpunkt ab). |
| TA-05 | `belege/technical-art/palastkueche_rechte_wand.png` | – | ja | Rechte Wand flach blaugrau ohne Struktur. Wertung „wirkt unfertig“ ist Geschmack. |
| TA-06 | `belege/technical-art/nil_delta_bauplan_prop.png` | – | ja | Dicke dunkle Kontur, flache Flächen, steht wie aufgeklebt im Gras. |
| TA-07 | `belege/technical-art/bergwerk_figuren_auf_einer_linie.png`, `agora_figuren_auf_einer_linie.png`, `belege/raeume/bergwerk_anfang_klick.png`, `agora_anfang_klick.png` | – | ja | In beiden Panoramen stehen die Figuren auf fast gleicher Fußlinie. |

## Animationen (AN)

| Fund-ID | Beleg vorhanden (Pfad) | Neuer Beleg (Pfad) | Bestätigt? | Bemerkung |
| --- | --- | --- | --- | --- |
| AN-01 | `belege/technical-art/gollo_idle_vs_talk.png`, `belege/animationen/w1_tav_gollo_rede.gif` | – | ja | Talk ist eine gebückte andere Zeichnung; `sheet_messwerte.csv` gollo talk h 126–138 gegen 144 (12,5 %). |
| AN-02 | `belege/technical-art/grimmzahn_idle_vs_talk.png`, `belege/animationen/w1_berg_grimmzahn_rede.gif` | – | ja | Schild im Stand mit Kritzel, im Talk leer; h 139–160 gegen 135 (18,5 %). |
| AN-03 | `belege/technical-art/xxl_ziege_kauen_andere_zeichnung.png` | – | ja | `kauen` deutlich schmaler, andere Ansicht; Fußlinie 6 px höher (CSV `fuss` 6). „Ein Viertel schmaler“ nicht nachgemessen. |
| AN-04 | `belege/technical-art/max_pilz_idle_gleich_walk.png` | – | ja | Kontaktbogen: `walk` sieht wie `idle` aus (4 Standbilder). Bitgleichheit nicht selbst nachgerechnet. „Altes Max-Design“ nur nach Augenmaß nachvollziehbar. |
| AN-05 | `belege/animationen/w1_schm_max_melken_ungenutzt.gif` | – | ja | Kein Aufruf von `melken` in `gesten_*.gd` oder Raumcode (`character_schmiede_ziege.gd` `melken()` spielt nur Sätze). CSV: max melken Fußlinie 6, h 26,5 % kleiner. |
| AN-06 | – (Inventar-CSV) | – | ja | Kein Aufruf `"haare"` im Code; `room_turmkeller.gd` `kreuzung_pixel()` nur `Spiel.sagen`. |
| AN-07 | `belege/animationen/w2_stad_leonidas_losrennen.gif`, `w2_stad_schildkroete_rennen.gif`, `w2_stad_max_barfuss.gif` | – | ja | `_tag_1` (`welt_2.gd` Z. 1158–1185) bewegt nur Max (`laufen_zu … "barfuss"`); `rennen` nirgends aufgerufen, `losrennen`/`laufen` nur als Ersatzgang in `cq_figur.gd` Z. 233. |
| AN-08 | `belege/technical-art/nebet_ruehren_ohne_topf.png`, `belege/animationen/w2_kueche_nebet_ruehren.gif` | – | ja | Nebet hält den Löffel in die Luft, kein Topf vor ihr, Tisch hinter ihr. Ruhe-Geste `ruehren` in `gesten_welt_2.gd` Z. 78. |
| AN-09 | `belege/animationen/w2_werk_archimedes_heureka_posen.gif`, `…_heureka_lauf.gif` | – | ja | CSV `cx_abw_idle` 56,5. GIFs nicht Bild für Bild nachgemessen. |
| AN-10 | `belege/animationen/w2_nil_hermes_joggen.gif` | – | ja | Tempo 160 px/s in `welt_2.gd` Z. 390/939 bestätigt; Fußweg im Sheet nicht selbst gemessen. |
| AN-11 | – (`sheet_messwerte.csv`) | – | ja | CSV: faecheln 3, regelbuch 3, kriechen 3, kauen 6, melken 6 px über der Fußlinie; faecheln cx 43,5. |
| AN-12 | – (`sheet_messwerte.csv`) | – | ja | CSV: faecheln 21,7 %, kiste_schwert 21,9 %, gaehnen 20,0 %, hofkater talk 11,6 %, toadi walk 12,0 %. |
| AN-13 | – (`sheet_messwerte.csv`) | – | ja | CSV `naht_faktor`: opa idle 7,26, max idle 4,53, max gehen_hinten 3,57. Ob das Zucken im Spiel auffällt, nicht angesehen. |
| AN-14 | – (Prüfung doppelter Bilder) | – | nicht prüfbar | Bitgleichheit von walk/idle bei Huhn, Schwan, Smaugi, Zauberbesen nicht selbst nachgerechnet; kein Bildbeleg. |
| AN-15 | `belege/technical-art/animations_inventar.csv` | – | ja | 44 Einträge „Altfassung“ in der CSV. 327 doppelte Bilder und Sheet-Breite nicht nachgeprüft. |
| AN-16 | – (Doku) | – | ja | `gesten-regie.md` Z. 213: max `gehen_vorn` „4 × 110 ms“; `status-alle-shots.md` Z. 45: W1-B08 „auf claude/gesten-menschen eingebaut“. |
| AN-17 | – (Inventar-CSV) | – | ja | Kein Aufruf von `verbeugen` oder `faehre_ziehen` im Code. |

## Zusammenfassung

94 Funde geprüft (WF ausgenommen): **89 ja, 4 teilweise, 0 nein, 1 nicht prüfbar.**

| Rolle | ja | teilweise | nein | nicht prüfbar |
| --- | --- | --- | --- | --- |
| ND | 23 | 1 | 0 | 0 |
| GD | 12 | 0 | 0 | 0 |
| LD | 16 | 1 | 0 | 0 |
| GS | 16 | 1 | 0 | 0 |
| TA | 6 | 1 | 0 | 0 |
| AN | 16 | 0 | 0 | 1 |

Nicht voll bestätigt:
- **ND-03 teilweise:** „rund 19 NAR-Zeilen ohne Bild“ ist eine Einschätzung; Einzelstellen stimmen, die Zahl ist nicht nachgezählt.
- **LD-05 teilweise:** Max steht im Fährmann (stimmt), verdeckt aber Fährtafel und Sanduhr kaum; das tut eher der Fährmann.
- **GS-22 teilweise:** „vor dem Training“ fehlt in `_bedingung_text()` (stimmt); die Liste der Rechtsklick-Ersatzzeilen ist ohne abgelegtes Protokoll nicht nachprüfbar.
- **TA-04 teilweise:** Fährsteg, Hafen, Werkstatt stimmen; Dachboden zeigt im Beleg keine Überdeckung von Max und Opa.
- **AN-14 nicht prüfbar:** Bitgleichheit walk/idle bei Huhn, Schwan, Smaugi, Zauberbesen ohne Bildbeleg, nicht nachgerechnet.

Kleinere Ungenauigkeiten innerhalb bestätigter Funde: ND-02 Zählung 29 statt 31 W2-NAR-Schlüssel (W1 10 statt 11); LD-07 Tür eher zu einem Drittel als „halb“ hinter der Tonne; Dateinamen `LD08_…`/`LD13_…` passen nicht zu LD-07/LD-09. Doppelmeldungen: LD-11 = GS-11, LD-04 ≈ GS-15, ND-10 ≈ GS-13, LD-01 ≈ TA-04 (Werkstatt).

Wichtigste Bestätigung im Spiel: **ND-12** ist ein echter Hänger. Nach der einzigen Hermes-Option bleibt eine leere Menüleiste, das Gespräch läuft weiter, Bodenklick und Esc wirken nicht (Gegenprobe vor dem Gespräch: Bodenklick bewegt Max).

GS-02: Der vorhandene Zeiger-Beleg zeigte den Fund nicht (nur eine Fahrtrichtung); mit eigener Auswertung von `_review_gs_zeiger2.gd` nachgewiesen.

Zu Fehlerquellen: Kein geprüfter Fund stützt sich allein auf das alte Zauberwald-Panorama (LD-04 nutzt die JSON-Werte) oder auf ein Welt-2-`_ende`-Bild. LD-02 nutzt das Welt-1-`_ende`-Bild; der Fehler ist dort echt und im Code begründet.

## Neue Belege

11 Bilder unter `belege/evidenz/` (2-fach, roter Rahmen an der Stelle):
`ND-01_blase_203_zeichen.png`, `ND-01_blase_pixel_172_zeichen.png`, `ND-02_nar_211_zeichen.png`, `ND-04_satz_platzhalter.png`, `ND-12_hermes_menue_vorher.png`, `ND-12_hermes_menue_leer.png`, `ND-12_hermes_nach_klick_und_esc.png`, `GD-01_pfote_fernseher.png`, `LD-02_zeldina_in_xxl_ziege.png`, `GS-02_fischsuppe_richtungsabhaengig.png`, `GS-10_traubensaft_nie_getroffen.png`.

Skript: `game/tests/_review_ev_w2.gd` (Szenarien nd04, nd12, gd01, nd01; Testmodus aus, `auto_continue_text = false`). GS-02/GS-10 aus einem eigenen Lauf von `_review_gs_zeiger2.gd` (taverne, palastkueche), Auswertung im Scratchpad.

## Nicht geprüft

- GIFs nur stichprobenhaft angesehen (Erstbild), Bewegungsmesswerte aus `sheet_messwerte.csv` übernommen.
- Laufzeiten (LD-14, LD-15) und Prozentwerte der Zeiger-Karten nicht neu gemessen, nur Rechenweg bzw. Stichproben.
- Englische Texte, Controller-Bedienung.
