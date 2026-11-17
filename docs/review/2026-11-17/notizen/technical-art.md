# Technical Art: Grafik je Raum (Review 17.11.2026)

Prüfer-Rolle Technical Artist, Kürzel TA. Geprüft: main `ae6619c1`, Checkout `cq-r3`. Nur geprüft, nichts geändert.
Belege relativ zu `docs/review/2026-11-17/`. Messwerte der Figuren-Sheets: `belege/technical-art/sheet_messwerte.csv`.

Stand: fertig (17.11.).

## Funde

| ID | Welt | Raum | Priorität | Kategorie | Beschreibung | Beleg | Vorschlag |
| --- | --- | --- | --- | --- | --- | --- | --- |
| TA-01 | Prolog, W1, W2 | mehrere | wichtig | Grafik | Raumlicht (`licht:` im Layout, `cq_raum.gd:74`) gibt es nur in 5 von 28 Räumen (zauberwald, bergwerk, turmkeller, abstellkammern, thronsaal). In der dunklen Abstellkammer 1 (gleicher Stil wie die Abstellkammern) fehlt es: Pixel leuchtet dort hellweiß-blau, in den Abstellkammern ist er getönt. Ebenso ohne Tönung: Taverne und Schmiede (warmes Feuerlicht, Max blau-kalt, Ziege reinweiß), Zauberstabladen, alle Welt-2-Innenräume (thronsaal_ramses, palastkueche, startbuero, werkstatt). Für die Abstellkammer 1 ist das früher Fund Nr. 20 („Raumlicht in … Kammern“), dort noch offen. | belege/technical-art/raumlicht_pixel_abstellkammer1_vs_abstellkammern_turmkeller.png; belege/raeume/schmiede_anfang_mitmax.png; tools/layout/welt-1.yaml:356/409/492/551/597 | `licht` für abstellkammer_1 wie abstellkammern (`#c8c0dc`); warme, leichte Tönung (etwa `#f2e2cc`) für Taverne, Schmiede, Laden und die Welt-2-Innenräume; im Raum mit allen Figuren gegenprüfen. |
| TA-02 | W1 | luftschloss | kosmetisch | Grafik | Früher Fund Nr. 33, noch offen: Naht bei x = 640. Die rosa Mauer endet mit einer harten senkrechten Kante, rechts beginnt eine andere Wand; Bodenfugen links blass und schräg, rechts dunkel und gerade. Messwert: Farbsprung zwischen Spalte 639 und 640 ist 20-mal so groß wie der Durchschnitt der Nachbarspalten (andere Breiträume 0,7 bis 1,7). | belege/technical-art/luftschloss_naht_640.png (Ausschnitt 560–720, 4-fach, rot = Naht) | Naht übermalen (Mauerende als Pfeiler oder Turm), Bodenfugen der linken Hälfte an die rechte angleichen. |
| TA-03 | W1 | luftschloss | wichtig | Positionierung | An der Startstelle (beim Betreten von unten) liegt ein Blatt der Bohnenranke vor Max' Gesicht; man sieht ihn beim ersten Bild mit verdecktem Gesicht. | belege/technical-art/luftschloss_ranke_vor_max_gesicht.png | Startmarker 30 bis 40 px nach rechts oder die Ranke dort hinter die Figuren legen. |
| TA-04 | Prolog, W2 | dachboden, faehrsteg_olympia, hafen_syrakus, werkstatt | wichtig | Positionierung | Startstellen liegen auf Nebenfiguren: Fährsteg Olympia (Max steht vor dem Fährmann und verdeckt ihn zur Hälfte), Hafen Syrakus (Max und Pixel auf dem Fährmann), Werkstatt (Max und Pixel überdecken Hierons Füße und Mantel), Dachboden (Max' Arm über Opa). Welt 2 wurde so nie im Spiel geprüft. | belege/technical-art/faehrsteg_max_verdeckt_faehrmann.png, hafen_start_ueberlappung.png, werkstatt_start_ueberlappung.png, dachboden_start_ueberlappung_opa.png | Startmarker (`von_…` im Layout) mindestens eine Figurbreite neben Nebenfiguren legen; Pixel-Platz daneben mitprüfen. |
| TA-05 | W2 | palastkueche | kosmetisch | Grafik | Die rechte Seitenwand ist eine flache, kalte blaugraue Fläche ohne Struktur, mitten im sonst warmen, gemalten Raum. Wirkt unfertig. | belege/technical-art/palastkueche_rechte_wand.png | Wand in der Raumfarbe nachfärben (Lehmputz, Schatten statt Blaugrau). |
| TA-06 | W2 | nil_delta | kosmetisch | Grafik | Bauplan-Prop (Pyramide auf Papyrus) mit dicker dunkler Kontur und flachen Flächen steht wie ein Aufkleber im gemalten Gras. | belege/technical-art/nil_delta_bauplan_prop.png; tools/layout/welt-2.yaml:65 | Kontur auf Raumfarbe abdunkeln statt Schwarzblau, leichter Schatten. |
| TA-07 | W1, W2 | bergwerk, agora | kosmetisch | Positionierung | Viele Figuren stehen wie aufgereiht auf derselben Bodenlinie (Bergwerk: fünf Goblins und Grimmzahn zwischen y 250 und 290 nebeneinander; Agora: Tiro, Brian, Tourist, Touristin auf y ≈ 300). Wirkt wie eine Gegenüberstellung statt einer belebten Szene; Max läuft beim Durchqueren auf derselben Tiefe durch sie hindurch. | belege/technical-art/bergwerk_figuren_auf_einer_linie.png, agora_figuren_auf_einer_linie.png | Zwei bis drei Figuren je Raum 15 bis 30 px nach hinten oder vorn versetzen (Tiefe staffeln), Lücken für Max' Weg lassen. |

## Je Raum (Kurzbefund)

Gesehen: Panorama, Kameraausschnitt mit Max, Klickflächen-Overlay; bei Auffälligkeiten 3- bis 5-fache Ausschnitte. Nähte gemessen an allen 28 Hintergründen (Farbsprung je Spalte und Zeile, lange gerade Kanten); nur das Luftschloss fällt auf (TA-02). Eingesetzte Rechteck-Props geprüft (Ränder ohne Transparenz: nur Korbvorderseite Taverne, Kante nicht sichtbar).

- **Prolog:** wohnzimmer gut (Max im Sonnenfleck, Größe zum Sofa stimmig); treppenhaus gut; dachboden TA-04.
- **Welt 1:** dorfplatz gut, Tiefe 0,4 wirkt (Max an den Türen klein); taverne TA-01 (Max kalt im Feuerlicht, Minka sehr hell); schmiede TA-01 (Ziege reinweiß); zauberstabladen TA-01; klassenzimmer gut; trollbruecke gut (Waldemar vor dem Schloss behoben); wasserschloss gut; zauberwald gut (Raumlicht); luftschloss TA-02, TA-03; bergwerk TA-07; turmkeller gut; abstellkammer_1 TA-01; abstellkammern gut; thronsaal gut.
- **Welt 2:** nil_delta TA-06, sonst stimmig; thronsaal_ramses gut (Fries durchgehend, Figuren in Stil und Licht passend), TA-01; palastkueche TA-05, TA-01, Nebet siehe AN-08; sphinx gut; faehrsteg_olympia TA-04; agora TA-07, sonst sehr gut; startbuero gut (Beamte sauber hinter den Pulten), TA-01; stadion gut (Leonidas groß, passt zur Figur); hafen_syrakus TA-04; werkstatt TA-04, TA-01; grabhuegel gut (Max zum Sockel plausibel, belege/technical-art/grabhuegel_max_am_sockel.png).

## Gut gelöst

- Stil-Einheit der Welt-2-Räume: gleiche Kontur und Palette in Hintergrund und Figuren, das Fries im Thronsaal läuft ohne Naht durch, keine Naht bei x = 640 in Nil-Delta, Agora, Stadion, Thronsaal Ramses (Farbsprung-Faktor 0,7 bis 1,7).
- Keine Magenta- oder Grau-Halos an Figuren (Prüfung aller 354 Animationen) und keine sichtbaren Rechteck-Kanten eingesetzter Props.
- Größen Max zu Türen und Möbeln in allen 28 Räumen plausibel; Tiefenskalierung auf Dorfplatz und Brücke überzeugend.
- Früher Fund 17 (Besen), 20 (Smaugi, Grimmzahns Schild im Stand), 26 (Dorfplatz-Ausschnitt), 32 (Augen) sind sichtbar umgesetzt.

## Nicht geprüft

- Endzustände (`*_ende.png`) nicht geprüft, nur die Anfangszustände.
- Bodenschatten der Figuren nicht systematisch geprüft.
- Hinweis zu den gemeinsamen Belegen: `belege/raeume/zauberwald_anfang.png` ist falsch zusammengesetzt (Raum 1066 px breit, zweiter Kameraausschnitt bei x 426 statt 640, die Pilzgruppe erscheint doppelt); der Hintergrund selbst ist in Ordnung (`game/grafik/hintergruende/w1_bg_zauberwald_v01.png`). In den Panoramen von Dorfplatz, Bergwerk, Luftschloss, Stadion, Agora und Thronsaal Ramses ist die Oberfläche (Porträts, Pfote) zweimal mit eingeblendet.
- Perspektive einzelner Figuren gegen Fluchtpunkte nur nach Augenmaß (keine Linienkonstruktion).
