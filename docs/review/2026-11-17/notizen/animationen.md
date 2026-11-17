# Animationen (Review 17.11.2026)

Prüfer-Rolle Technical Artist, Kürzel AN. Geprüft: main `ae6619c1`, Checkout `cq-r3`. Nur geprüft, nichts geändert.
Belege relativ zu `docs/review/2026-11-17/`:
- Inventar: `belege/technical-art/animations_inventar.csv` (354 Animationen in 55 Figuren-Sheets, Status und Aufrufstellen), Prüfdaten `belege/technical-art/_inventar_meta.json`.
- Messwerte je Animation (Höhe gegen Stand, Fußlinie, Versatz der Körpermitte, Schleifennaht, Magenta-Reste): `belege/technical-art/sheet_messwerte.csv`.
- Kontaktbögen je Figur (alle Einzelbilder, 1- bis 3-fach, rote Linie = Fußlinie): `belege/animationen/kontaktboegen/<figur>.png`.
- Aufnahmen im echten Spiel (Skript `game/tests/_review_ta_anim.gd`, Bild alle ~0,11 s, GIF 2-fach in gemessenem Spieltempo, Ausschnitt um die bewegte Stelle): `belege/animationen/<abschnitt>_<raum>_<figur>_<bewegung>.gif` (65 GIFs).

Stand: fertig (17.11.).

## Funde

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| AN-01 | W1 | taverne | wichtig | Animation | Gollo hat beim Reden einen anderen Körper: `talk` ist eine gebückte, nach vorn geschobene Zeichnung, 126–138 px hoch gegen 144 px im Stand (bis 12,5 % kleiner). Bei jedem Satz sackt er sichtbar zusammen und springt danach wieder hoch (gleiches Muster wie früher Opa, Fund Nr. 1). | belege/technical-art/gollo_idle_vs_talk.png; belege/animationen/w1_tav_gollo_rede.gif; sheet_messwerte.csv (gollo talk) | Talk aus der Standpose bauen (Kopf, Mund, Hände an der Schachtel), Höhe höchstens 5 % Abweichung. |
| AN-02 | W1 | bergwerk | wichtig | Animation | Früher Fund Nr. 20, halb offen: Grimmzahns Schild hat im Stand Kritzel, beim Reden (`talk`, 5 Bilder) ist es wieder leer und hell. Die Figur ist beim Reden bis 18,5 % größer (139–160 px gegen 135). Das Schild „wechselt“ bei jedem Satz. | belege/technical-art/grimmzahn_idle_vs_talk.png; belege/animationen/w1_berg_grimmzahn_rede.gif | Kritzel und Größe aus dem Stand in die Talk-Bilder übernehmen. |
| AN-03 | W1 | dorfplatz, schmiede, trollbruecke | wichtig | Animation | Die Ruhe-Schleife der XXL-Ziege (`kauen`, RUHE in `gesten_welt_1.gd`) ist eine andere Zeichnung: Dreiviertel-Ansicht statt Seitenansicht, etwa ein Viertel schmaler und 6 px über der Fußlinie. Bei jedem Anhalten und Losgehen (`gehen`) dreht sich die Ziege, schrumpft und hebt ab. | belege/technical-art/xxl_ziege_kauen_andere_zeichnung.png; sheet_messwerte.csv (xxl_ziege kauen) | Kauen aus der Seitenansicht des Stands bauen (nur Maul und Kopf bewegt) oder `idle` als Ruhe lassen und Kauen nur als Warte-Geste. |
| AN-04 | W1 | klassenzimmer und folgende | wichtig | Animation | Max als Pilz (`max_pilz`): `walk` ist bitgleich mit `idle` (4 Standbilder), er gleitet also beim Laufen. Das Sheet zeigt das alte Max-Design (Gesicht ohne die weißen Augenpixel aus Fund Nr. 32, andere Proportionen); die „Pilzkappe“ liest sich als braune Topffrisur. | belege/technical-art/max_pilz_idle_gleich_walk.png; Prüfung doppelter Bilder (max_pilz: idle = walk) | Gang aus dem aktuellen Max-Gang mit aufgesetzter Kappe ableiten (Kappe als Teil im Teile-Rig), Kappe mit Lamellen und Punkten wie bei Toadi. |
| AN-05 | W1 | schmiede | wichtig | Animation | Max `melken` (R6, Skriptzeile `W1_SCHM_MAX_0440` „Melk-Animation“) ist gebaut, wird aber nirgends aufgerufen (`character_schmiede_ziege.gd:46`, nur Sätze). Die Bildfolge steht außerdem 6 px über der Fußlinie, Max ist darin 26 % kleiner (kniend, aber ohne Bodenkontakt). | belege/animationen/w1_schm_max_melken_ungenutzt.gif; animations_inventar.csv; sheet_messwerte.csv | `geste_halten("melken", …)` vor 0440 wie in der Regie; Bilder 6 px absenken. |
| AN-06 | W1 | turmkeller | wichtig | Animation | Pixel `haare` (R11, `W1_TURM_PIX_0200` „Haare-Animation“, auch Kreuzungen 2 und 3) ist gebaut, wird aber nicht aufgerufen (`room_turmkeller.gd:168 kreuzung_pixel`). Der Kern des Rätsels (Haare auf die Kreuzung) bleibt Text. | animations_inventar.csv (pixel haare: ungenutzt) | Geste vor 0200 und bei jeder Kreuzung; Haarhäufchen als Prop liegen lassen. |
| AN-07 | W2 | stadion | wichtig | Animation | Tag-1-Rennen: Nur Max läuft (`barfuss`, ohne Öl). Leonidas „rennt los, biegt falsch ab“ (`W2_TAG1_LEO_0020`) und die Schildkröte überholt laut Erzähler (`W2_TAG1_NAR_0060`), beide stehen aber still, obwohl `losrennen`, `rennen` und `laufen` gebaut sind und im Raum gut aussehen (Entscheidung 10: bewusst offen). Die sichtbarste Pointe der Welt bleibt Text. | belege/animationen/w2_stad_leonidas_losrennen.gif, w2_stad_schildkroete_rennen.gif, w2_stad_max_barfuss.gif; welt_2.gd:1158–1185 | Zwei Marker an der Bahn genügen: Leonidas mit `laufen_zu(…, "losrennen")` links hinaus, Schildkröte mit `rennen` an Max vorbei. |
| AN-08 | W2 | palastkueche | wichtig | Animation | Nebets Ruhe-Schleife `ruehren` rührt mit dem Löffel in der Luft: Vor ihr steht kein Topf, Tisch und Schüsseln sind links hinter ihr. Die offene Frage der Regie („Rührt sie in einem Topf aus dem Hintergrund?“) ist nicht gelöst. | belege/technical-art/nebet_ruehren_ohne_topf.png; belege/animationen/w2_kueche_nebet_ruehren.gif | Nebet hinter den Tisch an die Schüssel stellen oder einen Topf als Prop vor sie setzen. |
| AN-09 | W2 | werkstatt | kosmetisch | Animation | Archimedes `heureka_posen` endet nach links laufend etwa 50 px neben dem Start; der anschließende Lauf `heureka` beginnt wieder am Startpunkt und geht nach rechts: Sprung zurück und Richtungswechsel. Die Körpermitte der Posen liegt bis 56 px neben der des Stands (Sprung beim Start). | belege/animationen/w2_werk_archimedes_heureka_posen.gif, w2_werk_archimedes_heureka_lauf.gif; sheet_messwerte.csv (cx_abw_idle 56,5) | Lauf am Endpunkt der Posen beginnen (Figur um den Versatz verschieben) oder die letzte Pose spiegeln, damit er Richtung Tür losrennt. |
| AN-10 | W2 | nil_delta, alle Hermes-Auftritte | kosmetisch | Animation | Hermes rutscht beim Joggen: Der Standfuß wandert im Sheet 40 px in 4 Bildern zu 75 ms (rund 133 px/s bei Skala 1, im Nil-Delta bei Skala ≈ 0,93 also rund 124 px/s); `_figur_laeuft` schiebt ihn mit festen 160 px/s (`welt_2.gd:390/395/939`). Die Füße gleiten etwa 25 % vorwärts. Zum Vergleich passt Max `barfuss` (Fußweg ≈ 150 px/s, Tempo 150). | belege/animationen/w2_nil_hermes_joggen.gif; Fußkontakt-Messung unten | Tempo auf etwa 125 px/s senken oder mit der Raumskala multiplizieren. |
| AN-11 | alle | – | kosmetisch | Animation | Mehrere Bewegungen stehen höher als die Fußlinie des Stands und hüpfen beim Wechsel: Fächerwedler `faecheln` (Ruhe-Schleife) 3 px, Waldemar `regelbuch` 3 px, Sobek an Land `kriechen` 3 px, XXL-Ziege `kauen` 6 px (AN-03), Max `melken` 6 px (AN-05). Fächeln liegt außerdem mit der Körpermitte 43 px neben dem Stand. | sheet_messwerte.csv (fuss_min/fuss_max, cx_abw_idle) | Bildfolgen auf die Fußlinie des Stands setzen (`tools/sheet_verschieben.py`), automatische Prüfung „Fußlinie gleich Stand“ ergänzen. |
| AN-12 | alle | – | kosmetisch | Animation | Die Größenregel „höchstens 5 % Abweichung zum Stand“ (lessons-learned, Abschnitt 1) wird oft gerissen, teils sinnvoll (Strecken, Arme hoch), teils nicht: Fächerwedler `faecheln` 22 %, Zeldina `kiste_schwert` 22 %, Goblin 2 `gaehnen` 20 %, Hofkater `talk` 12 %, Toadi `walk` 12 % kleiner als im Stand, Schmied-Arbeitsgesten 13–14 %. | sheet_messwerte.csv (h_abw_max > 8) | Liste gegen die Kontaktbögen durchgehen; nur Gesten mit gestreckten Armen ausnehmen. |
| AN-13 | Prolog, alle | – | kosmetisch | Animation | Atem-Schleifen mit Sprung am Schleifenende: Opa `idle` ändert sich von Bild 7 zu Bild 0 siebenmal so stark wie zwischen den übrigen Bildern, Max `idle` 4,5-mal, Max `gehen_hinten` 3,6-mal. Ergibt alle 2,4 s ein kleines Zucken. | sheet_messwerte.csv (naht_faktor) | Letztes Bild an das erste angleichen oder ein Zwischenbild einfügen. |
| AN-14 | W1 | taverne u. a. | kosmetisch | Animation | Huhn Berta, Schwan, Smaugi und Zauberbesen haben ein `walk`, das bitgleich mit `idle` ist; wenn sie bewegt werden (Berta flattert im Bogen, früher Fund 18), gleiten sie mit Standbildern. | Prüfung doppelter Bilder (huhn, schwan, smaugi, zauberbesen: idle = walk) | Für Berta zwei Flatterbilder; bei den anderen klären, ob sie je laufen. |
| AN-15 | alle | – | kosmetisch | Workflow | 44 Altfassungen (`talk_alt`, `walk_alt`, `idle_alt`) liegen ungenutzt in den Sheets, dazu 327 pixelgleiche doppelte Einzelbilder (Gesten speichern das Standbild erneut, statt es über `folge` zu verwenden). Das Max-Sheet ist 16 240 px breit (über der Texturgrenze, deshalb `spalten`). | animations_inventar.csv (Status „Altfassung“) | Pakete in `tools/figur.py` ohne `_alt` neu packen, gleiche Bilder einmal speichern. |
| AN-16 | alle | – | kosmetisch | Workflow | Doku hinkt hinterher: `gesten-regie.md` nennt veraltete Dauern (Max `gehen_vorn` 4 × 110 ms, JSON 8 × 60; Pixel `gehen_vorn` 2 × 170, JSON 8 × 70); `status-alle-shots.md` führt Bewegungen, die auf main sind, als „auf claude/gesten-menschen eingebaut“ (z. B. W1-B08, W1-B19, W2-B05). | docs/grafik/gesten-regie.md, Tabelle „Weltenübergreifend“; docs/grafik/status-alle-shots.md:45/56/130 | Dauer-Spalten aus den JSONs erzeugen; Statusliste auf „main“ nachführen. |
| AN-17 | W2 | nil_delta | kosmetisch | Animation | `W2_NIL_NAR_0110` und `W2_NIL_FAE_0410` („Sobek-Verbeugung“) haben im Wasser keine Bewegung; `verbeugen` gibt es nur an Land (`sobek_land`) und ist ungenutzt. Ebenso ungenutzt: `faehre_ziehen` (die Fahrt hat kein Bild). | animations_inventar.csv | Kurzes Abtauchen oder Kopfnicken im Wasser per Code aus `idle` (Versatz 2 bis 3 px). |

## Gesamt

### Inventar (a)

354 Animationen in 55 Sheets (`game/daten/figuren/*.json`), dazu 4 Einzelposen (`max_posen/`: kniet, liegt_flach, liegt_kapuze, sitzt_boden) und gemalte Ambiente-Bildfolgen je Raum (`effekte` mit `art: bild` in `tools/layout/*.yaml`, Quellen `tools/ambiente.yaml`; Code-Effekte Vögel, Blätter, Schüler in `cq_ambiente.gd`). Ambiente-Einträge je Raum: Turmkeller 8, Hafen 7, Nil-Delta 6, Bergwerk 5, Luftschloss 4, die meisten anderen 1 bis 3, Prolog-Räume 0.

Abgleich mit Aufrufen (`geste(`, `geste_halten(`, `rede_geste(`, `warte_geste(`, `play_animation(`, `idle_animation =`, `walk_animation =`, `laufen_zu(…, anim)`, `_figur_laeuft(…, anim)`, Tabellen ZEILE/RUHE/WARTEN) und mit `gesten-regie.md`:

| Status | Anzahl | Bemerkung |
| --- | --- | --- |
| generisch (idle, talk, walk, gehen_vorn/hinten, treppe_walk, Ersatzgänge) | 149 | über Popochiu und `grafik_laden()` |
| per Tabelle oder Code aufgerufen | 133 | |
| nur über Sonderweg im Raumcode (Besen als Sprite2D, `springen_zu`, Varianten, `gehen` als walk) | 15 | geprüft: genutzt |
| ungenutzt | 13 | siehe unten |
| Altfassungen `_alt` | 44 | AN-15 |

Ungenutzt (gebaut, nie aufgerufen): max `melken` (AN-05), pixel `haare` (AN-06), schildkroete `rennen` (AN-07), sobek_land `verbeugen`, sobek `faehre_ziehen` (AN-17), hermes `joggen_posen` (Entscheidung 8, doppelt zu `joggen`), schmied `ins_feuer`, `blasebalg`, `zum_amboss`, `abschrecken` (bewusst, siehe Regie), pixel `tragen`, `ohrfeige`, `vom_schrank_fallen` (erst Welt 3 oder Finale).
Fehlend (Aufruf ohne Animation): keine. Die Tabellen-Einträge für `sobek` (`schwanz_wedeln`, `gaehnen`, `hut_zurechtruecken`) gelten für die Variante `sobek_land` und sind dort vorhanden.
Fehlend laut Skript/Regie (bewusst nicht gebaut, Entscheidung 14): Minka und Hofkater fauchen, Toadi rennt auf der Stelle, Fährmann verbeugt sich, Leonidas außer Atem.
Doppelt: `sphinx_figur` idle = talk (leeres Sheet, die Sphinx ist gemalt); Ziegen `walk` neben `gehen` (walk wird ersetzt, liegt aber im Sheet); `joggen_posen`; `_alt`-Fassungen; 327 doppelte Einzelbilder (AN-15).

Inventar je Figur (Bilder × ms; Aufrufstellen in der CSV):

| Figur | Gang/Ruhe/Reden (generisch) | per Tabelle oder Code aufgerufen | nur im Raumcode/Sonderweg erwähnt | ungenutzt | Altfassungen im Sheet |
| --- | --- | --- | --- | --- | --- |
| aegypter | idle (4×320), talk (3×150) | fuss_tippen (3×120), klatschen (3×120), schulterzucken (2×120) | – | – | talk_alt |
| alwin | idle (4×320), walk (8×45), talk (8×150) | kochbuch (6×120), ruehren (8×140) | – | – | talk_alt |
| archimedes | idle (4×320), talk (2×150) | gruebeln (2×120), kopf_kratzen (2×120), zirkel (4×120) | – | – | talk_alt |
| archimedes_handtuch | idle (4×320), talk (4×150), heureka (8×70) | heureka_posen (4×120) | – | – | – |
| beamter_1 | idle (4×320), talk (3×150) | eindoesen (3×120), gaehnen (2×120) | – | – | talk_alt |
| beamter_2 | idle (4×320), talk (2×150) | brille_putzen (2×120), haare_richten (2×120), stempel_anhauchen (3×120), stempeln (5×120) | – | – | talk_alt |
| brian | idle (4×320), talk (3×150) | abwehren (4×120), schild_richten (2×120), seufzen (2×120) | – | – | talk_alt |
| cicero | idle (4×320), talk (2×150) | armreif (2×120), raeuspern (2×120), rede (5×120), toga_zupfen (3×120) | – | – | talk_alt |
| faecherwedler | idle (4×320), talk (3×150) | arm_ausschuetteln (5×120), bauch (3×120), faecheln (3×120) | – | – | talk_alt |
| faecherwedler_gelb | idle (4×320), talk (4×150) | – | – | – | – |
| faehrmann | idle (4×320), walk (8×95), talk (3×150) | bart_kratzen (3×120), gaehnen (3×120), gaehnen_stab (3×120), muenze (4×120), staken (3×120) | – | – | talk_alt |
| goblin_1 | idle (4×320), walk (8×40), talk (2×110) | pickel (2×140) | – | – | talk_alt |
| goblin_2 | idle (4×320), walk (8×35), talk (4×130) | gaehnen (4×120) | – | – | talk_alt |
| gollo | idle (4×320), walk (8×55), talk (4×120) | ring_werfen (6×130), ringschachtel (6×110) | – | – | talk_alt |
| grimmzahn | idle (4×320), walk (8×45), talk (5×110) | protest (3×130) | – | – | talk_alt |
| hermes | idle (4×320), joggen (8×75), talk (3×150) | tasche (3×120) | – | joggen_posen (4×130) | talk_alt |
| hieron | idle (4×320), talk (3×150) | bart_streichen (3×120), finger_trommeln (3×120), ungeduld (6×120) | – | – | talk_alt |
| hofkater | idle (4×320), talk (4×150), weggehen (8×100) | abziehen (4×120), putzen (7×120), schwanz_zucken (4×120) | – | – | talk_alt |
| huhn | idle (4×320), talk (4×150), walk (4×200) | plustern (3×140) | – | – | – |
| humbert | idle (4×320), walk (8×60), talk (6×110) | keller (10×130), polieren (7×150) | – | – | talk_alt |
| leonidas | idle (4×320), losrennen (8×100), talk (2×150) | bruellen (6×120), dehnen (3×120), pfeife_drehen (3×120) | – | – | talk_alt |
| maklerin | idle (4×320), walk (8×50), talk (4×110) | notieren (3×140) | – | – | talk_alt |
| max | idle (8×280), walk (8×60), treppe_walk (17×95), talk (6×130), gehen_hinten (8×60), gehen_vorn (8×60) | barfuss (8×73), benutzen (7×120), bohne (11×120), fallen (8×100), gaehnen (7×130), hinsetzen (9×110), kochloeffel (8×110), kopf_kratzen (7×110), schulterzucken (5×120), vom_boden_aufstehen (9×130), vom_sofa_aufstehen (9×120), wenden (6×110), zeigen (5×100), diskus (11×100), wackeln (7×100), heisser_sand (8×90), katapult (14×110), speer (12×100) | aufheben (7×110) | melken (8×140) | talk_alt, walk_alt |
| max_pilz | idle (4×320), talk (4×150), walk (4×200) | – | – | – | – |
| minka | idle (4×320), talk (4×150), walk (16×66) | putzen (3×140) | – | – | – |
| moderwort | idle (4×320), walk (8×70), talk (6×110) | nase_putzen (5×120), niesen (9×90), zaubern (4×120) | – | – | talk_alt |
| nebet | idle (4×320), talk (3×150) | abschmecken (3×120), mehl_wischen (3×120), probieren (3×120), ruehren (2×130), teig_kneten (5×120) | – | – | talk_alt |
| opa | idle (8×300), walk (12×120), talk (9×140) | erklaeren (6×150), kopf_kratzen (8×100), panik (12×80), werkbank (5×120) | – | – | talk_alt, walk_alt |
| philosoph | idle (4×320), talk (3×150) | bart_kratzen (3×120), laterne_putzen (5×120), laterne_spaehen (3×120), schimpfen (5×120) | – | – | talk_alt |
| pixel | idle (6×450), walk (5×100), talk (4×160), gehen_hinten (8×70), gehen_vorn (8×70) | schlafen (4×550), stehen (8×300), aufstehen (7×110), aufwachen (3×120), fauchen (5×120), hinlegen (6×120), minka_umgarnen (8×110), putzen (6×140), schnuppern (4×130), schwanz_zucken (4×140) | springen (7×110) | haare (5×90), ohrfeige (4×110), tragen (8×100), vom_schrank_fallen (4×100) | talk_alt |
| pixel_ziege | idle (4×320), talk (4×150), walk (4×200) | – | gehen (8×110) | – | – |
| ramses | idle (4×320), talk (2×150) | kopftuch (2×120), unentschlossen (5×120), zepter_tauschen (5×120), zepter_wiegen (2×120) | – | – | talk_alt |
| rotkaeppchen | idle (4×320), walk (8×60), talk (6×110) | pakete (4×120) | – | – | talk_alt |
| schildkroete | idle (4×320), talk (4×150), laufen (8×110) | kopf_einziehen (7×120) | – | rennen (8×100) | – |
| schmied | idle (4×320), walk (8×45), talk (8×150) | haemmern (7×100), schweiss_abwischen (7×110) | – | abschrecken (6×130), blasebalg (6×130), ins_feuer (8×120), zum_amboss (8×120) | talk_alt |
| schmiede_ziege | idle (4×320), talk (4×150), walk (12×100) | drehen (4×120) | gehen (8×110) | – | – |
| schreiber | idle (4×320), talk (3×150) | schreiben (2×120) | einnicken (2×120), stift_kauen (2×120), strecken_gaehnen (3×120) | – | talk_alt |
| schwan | idle (4×320), talk (4×150), walk (4×200) | fauchen (3×120) | – | – | – |
| smaugi | idle (4×320), walk (4×200), talk (4×130) | kram_hergeben (6×120), schniefen (3×130), staubwedel (6×110) | – | – | talk_alt |
| sobek | talk (3×150), idle (6×120) | – | – | faehre_ziehen (7×110) | idle_alt, talk_alt |
| sobek_land | idle (4×320), talk (4×150), kriechen (4×130) | – | gaehnen (4×120), hut_zurechtruecken (7×120), schwanz_wedeln (6×120) | verbeugen (5×120) | – |
| sphinx_figur | idle (1×500), talk (1×500) | – | – | – | – |
| stabmacher | idle (4×320), walk (8×58), talk (9×140) | mustern (3×140) | – | – | talk_alt |
| steinmetz | idle (4×320), talk (3×150) | meisseln (2×120), staub_pusten (2×120), stirn_wischen (2×120) | – | – | talk_alt |
| strassenmusiker | idle (4×320), talk (3×150) | lyra (4×120), stimmen (2×120) | – | – | talk_alt |
| tiro | idle (4×320), talk (3×150) | kritzeln (2×120), schreiben (4×120), tafel_glaetten (3×120), umsehen (2×120) | – | – | talk_alt |
| toadi | idle (4×320), walk (8×80), talk (8×150) | auf_max_zeigen (6×140), haende_ringen (6×130), keuchen (4×180) | – | – | talk_alt |
| tourist | idle (4×320), talk (3×150) | hut_faecheln (2×120), stirn_wischen (2×120) | – | – | talk_alt |
| touristin | idle (4×320), talk (3×150) | amphore (2×120), brille_putzen (3×120), faecheln_mustern (4×120) | – | – | talk_alt |
| uebungsbesen | idle (4×320), talk (4×150), walk (4×200) | – | jagen (5×120) | – | – |
| waldemar | idle (4×320), walk (12×45), talk (6×110) | fussbad (2×160), musical (3×130), regelbuch (5×120) | – | – | talk_alt |
| xxl_ziege | idle (4×320), talk (4×150), walk (12×110) | kauen (2×220) | gehen (8×110) | – | – |
| zauberbesen | idle (4×320), talk (4×150), walk (4×200) | – | fegen (3×130), haarspur (3×110), max_wegfegen (8×100) | – | – |
| zeldina | idle (4×320), walk (8×60), talk (6×110) | kiste_schwert (10×130) | – | – | talk_alt |
| zeremonienmeister | idle (4×320), talk (3×150) | ankuendigen (4×120), federkrone (2×120) | – | – | talk_alt |

### Ablauf (b)

- Leere Bilder: keine (außer `sphinx_figur`, gewollt leer). Magenta-Reste: keine gefunden (Prüfung r > 170, b > 150, g < 110 auf allen Einzelbildern).
- Schleifen-Nähte: AN-13; alle übrigen Schleifen unter dem 2,5-Fachen des mittleren Bildwechsels.
- Fußkontakt-Messung (Weg des Standfußes im Sheet gegen Tempo im Spiel): Max `walk` rund 30 px in 3 Bildern zu 60 ms (≈ 165 px/s bei Skala 1, `walk_speed` 150): passt, früher Fund Nr. 3 erledigt. Max `barfuss` ≈ 150 px/s bei Tempo 150: passt. Archimedes `heureka` ≈ 155 px/s bei Tempo 170: passt fast. Hermes `joggen`: AN-10. Leonidas `losrennen`: Bild 4–7 = Bild 0–3 (eigentlich ein 4-Bilder-Lauf, wirkt im Spiel trotzdem flüssig).
- Übergänge: Gesten kehren in den Aufnahmen sauber in die Ruhe zurück. Abbruch per Klick während einer Geste (Max `benutzen` im Dachboden, Max `zeigen` auf der Agora): Die Geste bricht sofort ab, Max geht ohne hängende Pose in den Gang über (`p_dach_max_benutzen_abbruch.gif`, `w2_agora_max_zeigen_abbruch.gif`). Harte Wechsel gibt es dort, wo Talk oder Ruhe eine andere Zeichnung sind (AN-01 bis AN-03).
- Blickrichtung: Gespiegelte Läufe (Hermes, Leonidas, Hofkater, Max) schauen in Laufrichtung; keine verkehrt gespiegelten gefunden.

### Sinnhaftigkeit (d), querschnittlich

- Fehlende Bewegungen mit dem größten Gewinn: Tag-1-Rennen (AN-07), Pixels Haare (AN-06), Max melkt (AN-05). Alle drei sind gebaut und nur nicht aufgerufen.
- Unterstützt die Pointe gut: Archimedes' Heureka-Lauf mit flatterndem Handtuch, Besen-Patrouille im Turmkeller, Opas Panik als Redebewegung, Cicero mit erhobenem Arm, Leonidas brüllt, Beamter 2 stempelt.

## Prolog

### wohnzimmer
Nicht im Spiel aufgenommen (Aufstehen vom Sofa war Fund 8 am 14.11., erledigt).

### treppenhaus
Nicht neu aufgenommen; Treppengang laut Umsetzung von Fund 30 erledigt.

### dachboden
Max-Gang links und rechts sauber, Füße greifen (`p_dach_max_gehen_links.gif`). Opa redet und geht mit einem Körper (früher Fund 1 erledigt, `p_dach_opa_gehen.gif`, `p_dach_opa_erklaeren_rede.gif`). Kopfkratzen und Panik passen. Siehe AN-13 (Opas Atemschleife).

## Welt 1

### dorfplatz
Max nach hinten, nach vorn und seitlich: Tiefenskalierung (0,4) und `gehen_hinten`/`gehen_vorn` greifen (`w1_dorf_max_nach_hinten.gif`). Toadi rennt, keucht, zeigt: passt (`w1_dorf_toadi_*.gif`); Toadi `walk` ist 12 % kleiner als der Stand (AN-12). Max `aufheben` und `bohne` sauber. XXL-Ziege: AN-03.

### taverne
AN-01 (Gollo). Gollo `ring_werfen` und Humbert `keller` laufen sauber und kehren zurück (`w1_tav_*.gif`). Berta: AN-14.

### schmiede
Hämmern als Ruhe-Schleife mit Funken (`w1_schm_schmied_haemmern.gif`); Schweiß abwischen und das Drehen der Ziege sauber. AN-05 (Melken).

### zauberstabladen
Nicht im Spiel aufgenommen.

### klassenzimmer
Übungsbesen saust (`w1_klass_uebungsbesen.gif`), Alwin rührt am Kessel. Max als Pilz: AN-04.

### trollbruecke
Waldemar Regelbuch, Fußbad, Musical laufen im Raum (`w1_brue_waldemar_*.gif`); Regelbuch 3 px über der Fußlinie (AN-11).

### wasserschloss, zauberwald, luftschloss
Nicht im Spiel aufgenommen (Schwan, Maklerin, Zeldina nur im Sheet geprüft: Zeldina `kiste_schwert` 22 % größer, AN-12).

### bergwerk
AN-02 (Grimmzahn).

### turmkeller
Drei Besen fegen ihre Routen (früher Fund 17 erledigt, `w1_turm_besen_patrouille.gif`). AN-06 (Haare).

### abstellkammer_1, abstellkammern
Smaugi `kram_hergeben` sauber (`w1_abst_smaugi_kram.gif`).

### thronsaal
Moderwort `niesen` und `zaubern` sauber (`w1_thro_moderwort_*.gif`).

## Welt 2 (erstmals im Spiel geprüft)

### nil_delta
Max-Gang auf Sand sauber (`w2_nil_max_gehen.gif`), Steinmetz meißelt, Fährmann stakt. Hermes: AN-10. Sobek: AN-17.

### thronsaal_ramses
Ramses' Rede aufgenommen (`w2_thro_ramses_rede.gif`), Hofkater `weggehen` (`w2_thro_hofkater_weggehen.gif`). Ramses `unentschlossen`, Fächerwedler `faecheln` und Hofkater `abziehen` lagen außerhalb des Kameraausschnitts (Kamera bei Max links): im Spiel nicht geprüft, nur im Sheet (Fächeln: AN-11, AN-12).

### palastkueche
AN-08 (Nebet rührt in der Luft). Teig kneten sauber.

### sphinx
Keine Figurenanimation (Sphinx gemalt). Max-Gang zum Tisch sauber (`w2_sphinx_max_zum_tisch.gif`).

### faehrsteg_olympia, hafen_syrakus
Fährmann wie im Nil-Delta (gleiche Figur); nicht gesondert aufgenommen.

### agora
Cicero `rede`, Philosoph `schimpfen`, Brian `abwehren`, Max `zeigen` sauber und gut lesbar (`w2_agora_*.gif`). Klick-Abbruch sauber.

### startbuero
Beamter 2 `stempeln`, Beamter 1 `eindoesen` sauber (`w2_buer_*.gif`).

### stadion
Leonidas `bruellen` sehr gut; AN-07 (Rennen). Max `diskus`, `speer`, `barfuss` sauber.

### werkstatt
Archimedes `zirkel` gut; AN-09 (Heureka-Übergang). Max `katapult` sitzt 6 px über dem Boden (laut Regie gewollt).

### grabhuegel
Max-Gang zum Sockel; Größe Max zu Sockel plausibel (`belege/technical-art/grabhuegel_max_am_sockel.png`).

## Gut gelöst

- Gesten-Mechanik: Rückkehr in die Ruhe, Abbruch per Klick und Sperre in Szenen funktionieren in allen Aufnahmen.
- Max-Gang (Tempo und Schrittweite) und Opas Körper sind seit dem 14.11. stimmig; Besen-Patrouille im Turmkeller.
- Welt 2: viele Nebenfiguren mit mehreren gut lesbaren Warte-Gesten (Cicero, Tiro, Beamte, Leonidas, Archimedes); Läufe aus dem Teile-Rig sehen im Raum aus wie die Standfigur.
- Keine Magenta-Reste und keine leeren Bilder in 354 Animationen.

## Nicht geprüft

- Warte-Gesten im zufälligen Takt (15–45 s) und Max' Leerlauf-Gesten im Spielverlauf (nur einzeln ausgelöst).
- Thronsaal Ramses: Gesten rechts außerhalb der Kamera (siehe oben). Wohnzimmer, Treppenhaus, Zauberstabladen, Wasserschloss, Zauberwald, Luftschloss, Fährsteg, Hafen nicht im Spiel aufgenommen.
- Pixel `springen` (Sprung-Tween) und `aufstehen` im Spiel; Rotkäppchen-Lieferung, Sobek folgt Pixel, Ziegen folgen Max.
- Ton-Synchronität der Gesten.
- Aufnahmen liefen unter Windows; der reale Bildabstand lag bei 100–117 ms, die GIF-Dauern sind die gemessenen Abstände.
