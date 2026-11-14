# Ergebnis: Großes Review Prolog und Welt 1

Stand 14. November 2026, geprüft wurde `main` auf Commit `b2e0c00` in einem eigenen Checkout. Auftrag: `review-prolog-welt-1.md`. Am Spiel wurde nichts geändert. Belegbilder liegen in `review-prolog-welt-1/`, nummeriert wie die Funde.

**Wie geprüft wurde:** alle sieben Dokumente gelesen (beide Skripte vollständig), die drei Werkzeuge gelaufen, alle 17 Räume im Spiel fotografiert (mit und ohne Oberfläche, breite Räume über die ganze Breite) und ihre Klickflächen, Figuren und Laufbereiche aus dem laufenden Spiel ausgelesen. Prolog-Anfang, Ankunft in Welt 1, Taverne, Berta, Pilz-Verwandlung und Überspringen liefen ohne Testmodus und wurden als Bildfolgen aufgenommen; beim Gehen wurden Position und Animationsbild je Bild mitgeschrieben. Die Rätsellogik wurde zusätzlich in den Raum- und Figurenskripten nachgelesen.

## 1. Kurzfazit

Prolog und Welt 1 sind von Anfang bis Ende durchspielbar, der Durchspieltest ist mit 882 Prüfungen grün, und es gibt keine Skriptfehler in der Godot-Ausgabe. Die größte Stärke sind Hintergründe und Text: Die Räume sehen aus wie aus einem Guss, und die Dialoge von Waldemar, Gollo, Humbert und Zeldina tragen. Das größte Risiko liegt bei den Figuren: Opa wechselt bei jedem Satz und jedem Schritt den Körper (gemalt gegen 3D-Modell), Max' Füße rutschen deutlich, und fast alle Szenen, die das Skript als Bewegung beschreibt, sind im Spiel ein Sprung von einem Standbild zum nächsten. Die für 14 Nebenfiguren gebauten Gehzyklen werden im Spiel an keiner Stelle abgespielt. Im Slice stehen außerdem noch zwei Graubox-Platzhalter (Nahansicht Kalender, Opas Zettel ohne Text), und der Weg zum Wasserschloss ist von Waldemar verdeckt. Bei den Rätseln ist der Slice fair bis auf den Auslöser von Rätsel 1c; in der zweiten Hälfte von Welt 1 gibt es drei Stellen, an denen man ohne eigenes Verschulden festhängt oder weit zurücklaufen muss (Flasche, Kritzelei, Pollen). Der Slice ist noch nicht testreif: Die elf A-Funde unten sind zusammen etwa zwei bis drei Arbeitstage, danach kann der Test mit Fremden laufen. Die Zielzeit von 40 Minuten halte ich für zu knapp; ich schätze 50 bis 60 Minuten für Erstspieler.

## 2. Funde

Priorität: **A** vor dem Test mit Fremden, **B** vor der Demo mit ganz Welt 1, **C** irgendwann. Aufwand: klein (unter einer Stunde), mittel, groß.

| Nr. | Priorität | Bereich | Raum, Figur oder Rätsel | Fund | Beleg | Vorschlag | Aufwand |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | A | Animation | Opa, Dachboden | Opa hat zwei Körper. Im Stand das gemalte Sprite (rotbraune Strickjacke mit Werkzeugtaschen, rote Schuhe), beim Reden (`talk`, 12 Bilder) und Gehen (`walk`, 17 Bilder) den Körper aus dem 3D-Modell: graubrauner Pulli ohne Zeichnung, andere Hände, Pantoffeln, schlanker, etwa 15 Pixel versetzt. Der Wechsel passiert bei jeder einzelnen Sprechzeile, also in den ersten Minuten dutzendfach. | [Spiel](review-prolog-welt-1/01_opa_koerperwechsel_spiel.png), [Sprites](review-prolog-welt-1/01_opa_koerperwechsel_sprites.png), [GIF](review-prolog-welt-1/01_opa_reden.gif) | Sofort: in `daten/figuren/opa.json` `talk` auf die Bilder von `talk_alt` und `walk` auf `walk_alt` legen (beide gemalt, sind schon im Sheet). Danach Opa so neu rechnen wie Max in Commit 2f492ae: gemaltes Sprite, nur Arme und Beine nach den 3D-Winkeln gedreht. Den gerenderten 3D-Körper nie direkt zeigen. | klein, danach mittel |
| 2 | A | Animation | Opa, Dachboden | Beim Umhergehen läuft Opa auf Max' Ankunftsplatz und verdeckt ihn ganz (Ziel 520, 332; Max steht auf 527, 315). Er bewegt sich mit 170 Pixeln je Sekunde, ein Weg von 60 Pixeln dauert 0,35 Sekunden und zeigt drei Bilder: Das wirkt wie ein Zucken, nicht wie ein gebückter alter Mann. | [Bildfolge](review-prolog-welt-1/02_opa_laeuft_in_max.png), [GIF](review-prolog-welt-1/02_opa_geht.gif) | In `room_dachboden.gd` Plätze auslassen, die näher als 70 Pixel an der Spielfigur liegen; Opas `walk_speed` auf 60 bis 80; erste Pause auf 25 Sekunden. | klein |
| 3 | A | Animation | Max, alle Räume | Fußrutschen. Gemessen im Wohnzimmer: Max legt je Gehzyklus (14 Bilder, 1,33 s) 227 Pixel zurück, die Füße greifen im Sprite aber nur etwa 45 Pixel je Schritt. Der aufgesetzte Fuß gleitet also je Schritt rund 70 Pixel über den Teppich. Dazu fransen Schuhe und Hosensäume beim Drehen aus, einzelne Pixel stehen unter der Bodenlinie. Kopf und Oberkörper sind ruhig, Nähte am Rumpf sieht man nicht; das ist gut. | [Bildfolge am Tischbein](review-prolog-welt-1/03_max_fussrutschen.png), [GIF](review-prolog-welt-1/03_max_gang.gif), [Sprites](review-prolog-welt-1/03_max_gang_sprites.png) | Drei Stellschrauben zusammen: Beinwinkel aus der 3D-Bewegung um den Faktor 1,6 bis 2 spreizen (Schritt etwa 75 Pixel), Zyklus auf etwa 0,8 s kürzen (`ms` 95 auf 57), `walk_speed` von 180 auf 150. Die Schuhe nicht mitdrehen, sondern drei gemalte Fußstellungen (flach, Ferse, Spitze) ansetzen; Säume einmal in Aseprite nachziehen. | mittel |
| 4 | A | Grafik | Prolog P3, Ankunft Welt 1 | Die Nahansichten „Kalender“ und „Opas Zettel“ sind Graubox-Tafeln mit der Überschrift „NAHANSICHT (Platzhalter)“. Opas Zettel ist leer, der Satz „Das Ei muss ganz bleiben“ steht nicht darauf. Beide liegen im Slice. | [Bild](review-prolog-welt-1/04_nahansichten_platzhalter.png) | Zwei Bilder wie die vier von Welt 1: Kalenderblatt mit dickem rotem Kreis und kleiner Bleistiftnotiz „K3 – Schwurbelstein“; Zettel in Opas Handschrift, zweimal unterstrichen. Schrift mit `tools/nahansichten_welt1_schrift.py`. | mittel |
| 5 | A | Bedienung | Troll-Brücke, Rätsel 4 | Waldemar (440, 275) steht genau vor dem neu gezeichneten rosa Wasserschloss und vor dem Ausgang „Weg zum Wasserschloss“ (420 bis 500, 115 bis 160). Der Spieler sieht weder Schloss noch Weg; der Gag „Die Prinzessin ist in einem anderen Schloss“ steht aber auf dem Beobachtungsbogen. Der P15-Eintrag „prüfen, ob er Rampe oder Schloss verdeckt“ ist damit beantwortet: ja. | [Klickflächen](review-prolog-welt-1/05_trollbruecke_waldemar_verdeckt_wasserschloss.png) | Waldemar auf das rechte Brückenende stellen (etwa 400, 205), dort versperrt er auch sichtbar den Weg, wie es der Text sagt („sehr höflich, aber sehr breit“). Ausgang auf etwa 100 × 60 Pixel vergrößern und einen kleinen Wegweiser malen. | klein |
| 6 | A | Rätsel | Taverne, Rätsel 1c | Das Rätselspiel startet nur, wenn man einen Gegenstand auf Gollo zieht. Im Gespräch gibt es keine Option dafür; Gollo sagt nur, er verliere, „wenn jemand etwas fragt, das niemand wissen kann“. Der Schritt von dort zu „Thunfischdose auf Gollo“ ist Durchprobieren. Ich erwarte hier bei den meisten Testern Hinweisstufe 2 oder 3. | Skript `character_gollo.gd`, `W1_TAV_GOL_0780` | Zusätzlich eine Gesprächsoption, sobald Minka und Humbert weg sind: „Ich hab ein Rätsel für dich.“ Sie ruft dieselbe Szene auf. Der Weg über den Gegenstand bleibt. Dazu ein Zuruf von Pixel, wenn beide weg sind: „Jetzt guckt keiner mehr.“ | klein |
| 7 | A | Grafik, Text | Taverne, Rätsel 1a | Minka sitzt am Kamin (470, 250), der Fondue-Topf steht drei Meter weiter auf dem Tresen. Die Texte sagen das Gegenteil: „Sie sitzt neben dem Topf wie ein Türsteher“ (`W1_TAV_MAX_0140`), „solange Minka danebensitzt“ (`W1_TAV_HUM_0522`), Hinweis `W1_HINT_PIX_0111`. Das Ziel von 1a ist damit nur über Text zu verstehen. | [Klickflächen](review-prolog-welt-1/07_taverne_minka_laute_ei.png) | Minka auf das Tresenende rechts neben den Topf setzen (etwa 262, 176, vor `tresen_vorn`). | klein |
| 8 | A | Animation | Ankunft Welt 1, Wohnzimmer | (a) Die Gemini-Posen „sitzt“ und „kniet“ zeigen Max mit fast schwarzen Haaren und größerem Kopf; zwischen Liegen und Stehen sieht er eine halbe Sekunde wie eine andere Figur aus. Dasselbe bei der Sitzpose auf dem Sofa. (b) Toadi „rennt“ nicht: Er gleitet in 1,3 s über 290 Pixel und zeigt dabei die Rede-Bilder, obwohl ein Gehzyklus im Sheet liegt. | [Posen](review-prolog-welt-1/08_ankunft_posen_haarfarbe.png), [Sofa](review-prolog-welt-1/31_wohnzimmer_aufstehen.png), [Toadi](review-prolog-welt-1/08_toadi_gleitet.png), [GIF](review-prolog-welt-1/08_toadi_gleitet.gif) | (a) In Aseprite Haar- und Hoodie-Farben der drei Posen auf die des Sprites umfärben, Kopfgröße angleichen. (b) In `_toadi_rennt_herbei()` während des Tweens `C.Toadi.play_animation("walk")` mit doppeltem Tempo, danach Idle. | klein |
| 9 | A | Grafik, Text | Toadi | Toadi liest sich als Kind mit blau-weißem Zauberhut, nicht als Pilz. Damit laufen drei Witze ins Leere: „Familie?“ bei Max als Pilz (`W1_HOGG_TOA_0730`), „ein Hut, der aussieht wie ein Frühstück“ (`W1_DORF_PIX_0810`) und „Er ist ein Pilz, und Pilze sind empfindlich“ (`W1_DORF_PIX_1330`). Seine Pixel sind außerdem gröber als bei allen anderen Figuren. | [Sprite](review-prolog-welt-1/09_toadi_kein_pilz.png) | Hut in Aseprite zur Pilzkappe umzeichnen: Spitze weg, runde gewölbte Kappe mit breitem Rand und Lamellen an der Unterseite, Streifen bleiben (kein Rot, keine Punkte, wie im Prompt). Wenn das Aussehen bleiben soll: die drei Zeilen ändern. | mittel |
| 10 | A | Text, Bedienung | alle Räume | Sprechtexte mit fünf Zeilen wachsen nach oben hinter die Porträts; die ersten Wörter sind verdeckt. 93 Blasen haben mehr als 120 Zeichen, 8 mehr als 140. Im Slice betrifft das `W1_TAV_HUM_0580` (179 Zeichen, die Stelle mit dem Schicksalsberg) und `W1_BRUE_MAX_0650` (155). | [Bild](review-prolog-welt-1/10_lange_texte_hinter_portraets.png) | Die 8 Blasen über 140 Zeichen mit „//“ teilen (`W1_BRUE_WAL_0050`, `W1_HOGG_ALW_0620`, `W1_TAV_HUM_0580`, `W1_DORF_MAX_0180`, `W1_BRUE_MAX_0650`, `W1_HINT_PIX_1121`, `W1_HINT_PIX_0330`, `W1_HOGG_ALW_0380`) und in `pruefen.py` eine Warnung ab 140 Zeichen. Zusätzlich den Text nie höher als y = 48 beginnen lassen. | klein |
| 11 | A | Bedienung | alle Gespräche | Das Gesprächsmenü zeigt vier Optionen, der Rest liegt hinter einem schmalen Rollbalken. Schon Opa hat im Prolog fünf bis sechs; „Ich muss noch was anderes machen“ ist nicht zu sehen. Wer das Rollen nicht entdeckt, kommt aus dem ersten Gespräch nur über Durchklicken. | [Bild](review-prolog-welt-1/11_dialogmenue_vier_optionen.png) | Menü auf sechs Zeilen erhöhen oder Zeilenabstand verkleinern; die Abschiedsoption immer als letzte sichtbare Zeile festhalten. | klein |
| 12 | B | Bedienung | Dachboden | Opas Text ist orange auf orangebraunem Holz. Er ist lesbar, aber anstrengend, gerade bei drei Zeilen. | [Bild](review-prolog-welt-1/12_opa_text_kontrast.png) | Dunklere, breitere Kontur für alle Sprechtexte oder ein halbdurchsichtiges dunkles Band dahinter; Opas Farbe heller (Hellgelb). | klein |
| 13 | B | Rätsel | Klassenzimmer, Rätsel 6 | Max kann eine Flasche schon vor den drei Zutaten nehmen, aber nie zurückstellen: Beim Griff zur zweiten kommt `W1_HOGG_MAX_0940`. Wer früh eine falsche nimmt und später richtig schließt, muss die falsche in den Kessel kippen und wird zum Pilz. Das ist ein erzwungener Fehlversuch nach richtiger Lösung. | `flasche_im_regal.gd`, `hotspot_kessel.gd` | Klick auf eine Flasche im Regal, während Max eine trägt: Er stellt die getragene zurück und nimmt die neue („Dann eben die.“). Oder Flaschen erst nach `W1_HOGG_ALW_0580` nehmbar machen. | klein |
| 14 | B | Rätsel | Luftschloss, Rätsel 11 Teil 1 | Die Maklerin (905, 262) steht genau vor der Kritzelei (866 bis 928, 138 bis 192). Bis Rätsel 9 ist der vierte Passwort-Teil nicht zu sehen und nicht anzuklicken; danach geht der Spieler mit Zeldina sofort weiter. An der Geheimtür heißt es dann nur „Unvollständig“, ohne zu sagen, was fehlt. Die Pfote verrät in Stufe 3 das ganze Passwort, die Tür nimmt es trotzdem nicht an. Der Rückweg zum Luftschloss sind sechs Raumwechsel je Richtung. | [Klickflächen](review-prolog-welt-1/14_luftschloss_maklerin_verdeckt_kritzelei.png) | Maklerin nach rechts neben Zeldina (etwa 965, 262). Nach Rätsel 9 eine Zeile von Zeldina oder Pixel, die auf die Wand zeigt. An der Tür sagt Pixel, welcher Teil fehlt („Uns fehlt das Ende. Ich tippe auf die Wand im Luftschloss.“). Hinweisstufen für R11a erst freigeben, wenn alle vier Teile im Notizbuch stehen; vorher Hinweise auf den fehlenden Fundort. | mittel |
| 15 | B | Rätsel | Thronsaal, Rätsel 13 | Der Thronsaal ist ohne Pollen betretbar (Zugang braucht nur R11 und R12, das Duell aber R7). Wer die Niesrosen ausgelassen hat, steht vor Moderwort und muss fünf Räume zurück in den Wald und wieder herauf. Das bricht den Höhepunkt. | `welt-1.json`, `room_thronsaal.gd` | An der offenen Geheimtür prüfen: Ohne Pollen-Socke hält Zeldina Max zurück („Er niest bei Blumen. Ohne Blumen gehe ich da nicht rein.“). Der Rückweg liegt dann vor dem Finale und hat ein klares Ziel. | klein |
| 16 | B | Rätsel, Bedienung | Taverne, Rätsel 6 Teil 1 | Das Huhn-Rätsel selbst ist gut und fair (Berta hackt, Pixel bietet an zu übersetzen, „schlechte Musik“, Laute). Drei Schwächen: Die Klickfläche des Eis ist 12 × 12 Pixel und liegt unter dem Huhn; ein Klick mit Max auf das Huhn bringt nur die allgemeine Tierzeile, nicht den Hack; und die Pfote kennt Berta nicht (Stufe 3 `W1_HINT_PIX_0631` sagt nur „wirf Ei, Milch und Pilz in den Kessel“). Die Rätseldoku sagt noch „nimmt das Ei einfach weg“. | [Klickflächen](review-prolog-welt-1/07_taverne_minka_laute_ei.png) | Klick mit Max auf das sitzende Huhn löst dasselbe aus wie der Klick auf das Ei. Eigener Hinweisschritt R6a-Ei mit drei Stufen (Pixel fragen lassen, schlechte Musik, Laute). Rätseldoku nachziehen. | klein |
| 17 | B | Rätsel, Animation | Turmkeller, Rätsel 11 Teil 2; Klassenzimmer | Die Besen patrouillieren nicht. Im Bild lehnen sechs gemalte Besen an der Wand, der Text beschreibt drei, die Muster fegen („Bildschirmschoner mit Aggressionen“, „er dreht und dreht“). Die Sprites `zauberbesen` und `uebungsbesen` liegen fertig vor, werden aber in keinem Raum verwendet. Die Übungsbesen-Szene im Klassenzimmer (`W1_HOGG_NAR_0010`) ist eine Sekunde Pause ohne Bild; Alwins Hinweis auf Rätsel 11 hängt damit in der Luft. Die drei Kreuzungen sind 30 × 14 Pixel groß und nur über den Namen beim Überfahren zu finden. | [Klickflächen](review-prolog-welt-1/17_turmkeller_besen_nur_gemalt.png) | Drei Zauberbesen als Figuren auf festen Wegpunkten entlang der roten, gelben und blauen Fliesen laufen lassen (`walk`-Bilder sind da). Nach jeder Haarspur biegt der passende Besen sichtbar zur Kammertür ab. Übungsbesen im Klassenzimmer einmal quer durchs Bild in den Schrank. Kreuzungsfliesen im Hintergrund leicht aufhellen. | mittel |
| 18 | B | Animation | Welt 1, alle Szenen | Was das Skript als Bewegung beschreibt, ist im Spiel ein Sprung: Minka geht hinaus (verschwindet), Humbert geht in den Keller und kommt zurück (verschwindet, erscheint), Gollo wirft den Ring (nichts), Rotkäppchen liefert (erscheint, verschwindet), Berta flieht auf den Balken (springt zwischen zwei Bildern um), Waldemar geht in den Wald (erscheint dort), die Maklerin springt von der Wolke (verschwindet), Pilz-Verwandlung (Bildtausch ohne Rauch), Moderwort niest und der Stab fliegt (nur Text). Regiezeilen (NAR) sind eine Sekunde Pause ohne Text. Die Gehzyklen mit 14 Bildern für Alwin, Humbert, Schmied, Stabmacher, Maklerin, Rotkäppchen, Grimmzahn, beide Goblins, Toadi, Waldemar, Zeldina, Moderwort und Gollo ruft kein Skript auf: Außer Max laufen im ganzen Spiel nur Opa (Umhergehen) und Pixel (zum Dachbalken). Begleiter werden beim Betreten eines Raums hingestellt. Gelungen sind Pixels Sprung auf den Balken und das Aufstehen. | [Berta](review-prolog-welt-1/18_berta_springt_ohne_flug.png), [Pilz](review-prolog-welt-1/18_pilz_verwandlung.png), [Pixels Sprung](review-prolog-welt-1/18_pixel_sprung_dachbalken.png) | Reihenfolge nach Wirkung, siehe Animationsplan: Humbert und Rotkäppchen wirklich gehen lassen (`walk_to` zum Marker, dann ausblenden), Berta mit `springen_zu` im Bogen und zwei Flatterbildern, Minka geht mit Pixel zur Tür, Ring als kleines Sprite im Bogen in den Topf mit Zischen, Rauchwolke (drei Bilder) für Pilz und Flüche. Für Regiezeilen ohne Animation vorerst eine kursive Erzählzeile zeigen, damit der Spieler erfährt, was passiert. | mittel bis groß |
| 19 | B | Text | Klassenzimmer | `W1_HOGG_MAX_0950` „In welchem Schloss?“ folgt auf Alwins Satz über Milch und Ziegen, in dem kein Schloss vorkommt. Der Bezugssatz („Die Milch ist in einem anderen Schloss“) ist beim Umschreiben verloren gegangen, damit fehlt auch der Running Gag des Konzepts an dieser Stelle. | `texte.csv`, `W1_HOGG_ALW_0360` | In 0360 nach „nicht mehr“ einfügen: „Die Milch ist in einem anderen Schloss.“ Englisch nachziehen. | klein |
| 20 | B | Grafik | Smaugi, Grimmzahn, dunkle Räume | Smaugi ist flächig knallrot und steht wie ein Aufkleber in der gedämpft violetten Kammer. Grimmzahn hält ein reinweißes, leeres Schild, das im dunklen Bergwerk das hellste Ding im Bild ist. Allgemein nehmen Figuren kein Raumlicht an: Im Zauberwald, Bergwerk und Turm leuchten Max und Pixel gegen den Hintergrund. | [Smaugi](review-prolog-welt-1/20_smaugi_sticht_heraus.png), [Bergwerk](review-prolog-welt-1/20_bergwerk_weisses_schild.png) | Smaugi in Aseprite um zwei Stufen entsättigen, Schatten in Raumviolett, dunklere Kontur. Schild in Pergamentton mit Kritzelstrichen. Je Raum eine Tönung im Layout (`licht: "#b9b4d0"`), die `CQRaum` als `modulate` auf alle Figuren legt: ein Eintrag je Raum, wirkt sofort. | klein bis mittel |
| 21 | B | Bedienung | Zauberwald, Rätsel 6 | Nehmbar ist nur ein einzelner Leuchtpilz von 16 × 25 Pixeln. Ein Linksklick auf die übrige Pilzgruppe (Hotspot „Leuchtpilze“) bringt eine Ersatzzeile („Funktioniert nicht.“), obwohl Alwin genau diese Pilze verlangt. Gut gelöst ist dagegen die Einbindung: Pilz und Ketchup fallen nicht mehr auf. | [Klickflächen](review-prolog-welt-1/21_zauberwald_klickflaechen.png) | Linksklick auf den Hotspot „Leuchtpilze“ nimmt den Pilz, solange er noch da ist. Dieselbe Regel für alle Fälle „kleines Prop in großem Hotspot“. | klein |
| 22 | B | Technik | `bildschirm_vergleich.gd` | Der Vergleich schlägt bei zwei Räumen fehl (Abstellkammern 1,74 Prozent, Thronsaal 0,60 Prozent) und endet mit Code 1. Ursache ist kein Grafikfehler: Smaugi und Moderwort atmen, das Foto trifft ein anderes Animationsbild als die Referenz. In GitHub Actions ist das ein zufällig roter Lauf. | [Abweichung](review-prolog-welt-1/22_bildvergleich_abweichung_smaugi.png) | Vor dem Foto alle `AnimationPlayer` der Figuren anhalten und auf Bild 0 setzen (`seek(0, true)`), dann Referenzen neu schreiben. | klein |
| 23 | B | Bedienung | Ankunft Welt 1 | Überspringen mit Esc funktioniert, alle stehen danach richtig (Max aufrecht auf 600, 320, Pixel sitzt, Toadi am Platz, Balken und Figurenwechsel in der Taverne stimmen). Es dauert aber 8,7 Sekunden, bis man wieder klicken kann, und mittendrin öffnet sich trotzdem die Nahansicht mit Opas Zettel. | Messung im Lauf, Protokollzeile „SKIP Ankunft: 8750 ms“ | In `Spiel.nahansicht_zeigen()` bei `E.cutscene_skipped` die Überlagerung auslassen (der Zettel bleibt im Inventar lesbar); Tweens in `_landung` und `pose_zeigen` beim Überspringen nicht abwarten. | klein |
| 24 | B | Bedienung, Grafik | alle Räume | Max läuft zum Reden in sein Gegenüber hinein und verdeckt es (Alwin und den Kessel, Gollo an der Laute). Pixel wird 20 Pixel neben Max gestellt und überlappt in jedem Raum seine Beine; bei der Landung steht er auf dem liegenden Max. | [Bild](review-prolog-welt-1/11_dialogmenue_vier_optionen.png), [Posen](review-prolog-welt-1/08_ankunft_posen_haarfarbe.png) | `gehe`-Punkte der Figuren etwa 55 Pixel seitlich vor die Figur legen; Partner-Abstand in `partner_aufstellen()` von 20 auf 45 Pixel. | klein |
| 25 | B | Text | mehrere Räume | Text und Bild widersprechen sich: Kessel „blubbert leer“ (`W1_HOGG_MAX_0130`), ist aber voll mit grünem Trank; Flaschen „ohne Etikett“ (`0140`, `0930`) und im Inventar „Auf dem Etikett steht ‚Trink mich‘“ (`W1_INV_MAX_0135`); „doppelt so groß“, gemalt etwa 1,4-fach; Streikschilder einmal „ohne Text“ (`W1_BERG_MAX_0030`), einmal mit Aufschrift (`0025`); Dosenöffner „hängt an der Werkbank“ (`P0_DACH_MAX_0260`, Opas Hinweis `1326`), liegt aber flach darauf; Krug „hängt beim Kochgeschirr“, steht am Türpfosten; Smaugi „sitzt auf einem Haufen Gerümpel“ (`W1_SMAU_MAX_0020`), sitzt davor; Zeugnis „Betragen: herausragend böse. Mit Sternchen“ (`W1_HOGG_MAX_0890`), im Bild „Betragen 1“; „Stern mit Hut“ gegen lächelnden Kessel (bekannt). | [Nahansichten](review-prolog-welt-1/25_nahansichten_welt1.png) | Jeweils den Text ans Bild anpassen, das ist billiger als umzuzeichnen. Beim Kessel: „Ein Kessel, in dem schon etwas Grünes blubbert. Alwin nennt das Grundlage.“ Beim Dosenöffner Text und Opas Hinweis auf „liegt auf der Werkbank“. | klein |
| 26 | B | Grafik, Spielfluss | Dorfplatz | Beim Start sieht man die Taverne nicht: Der Bildausschnitt beginnt rechts von ihr, ihr Schild ist leer. Pixel „geht los Richtung Kneipe“ (`W1_ANK_PIX_0220`), bleibt aber stehen. Die Größen sind besser als beschrieben, aber noch nicht stimmig: Max ist vorn 123 Pixel hoch, am Zauberstab-Laden etwa 86 bei einer 72 Pixel hohen Tür; die Tiefe von 0,4 lässt ihn auf 20 Pixeln Weg um 8 Prozent schrumpfen. | [Erste Ansicht](review-prolog-welt-1/26_dorfplatz_erste_ansicht.png), [links](review-prolog-welt-1/26_dorfplatz_links_klickflaechen.png), [rechts](review-prolog-welt-1/26_dorfplatz_rechts_klickflaechen.png), [Größe](review-prolog-welt-1/26_dorfplatz_max_groesse.png) | Pixel am Ende der Ankunft wirklich zur Tavernentür laufen lassen, die Kamera folgt kurz und kehrt zurück. Tiefe auf 0,55 und `skala` auf 0,75, den Laufbereich hinten um etwa 10 Pixel kürzen, damit Max nicht bis an die Schwellen der kleinen Häuser kommt. | klein bis mittel |
| 27 | B | Animation | Pixel | Sitzen und Stehen sind verschieden gemalt (Sitzbild dunkler und graublau, Stehbild heller mit anderem Gesicht); beim Gehen bewegen sich die Beine kaum, er gleitet. Auf dem Weg zum Balken landet er im Hühnerkorb auf Berta. | [Posen](review-prolog-welt-1/27_pixel_posen.png), [Sprung](review-prolog-welt-1/18_pixel_sprung_dachbalken.png) | Farben des Sitzbilds auf das Stehbild ziehen. Gang als acht gemalte Bilder in Aseprite (Pose zu Pose, Katze ist kein Fall für den 3D-Weg). Zwischenlandung auf die Kistenkante neben dem Korb (352, 205). | mittel |
| 28 | B | Text | Prolog, Welt 1 | Muster, die auffallen: „junger Mann“ steht im Prolog in 8 von 37 Zeilen von Pixel (in Welt 1 in 16 von 268, das passt). Max' Vergleiche mit Serien, Handy, Apps und Downloads häufen sich in einzelnen Räumen, in der Taverne dreimal (`0360`, `1230`, `1330`), auf dem Dorfplatz dreimal (`0110`, `0150`, `1160`). 44 Zweitzeilen beginnen mit „Ich hab …“ (Max hat etwas angefasst), was Ansehen und Benutzen verwischt. Der Ton der Figuren selbst stimmt durchgehend. | Zählung über `texte.csv` | Im Prolog „junger Mann“ auf drei bis vier Stellen kürzen (behalten: `0320`, `0340`, `0420`). Je Raum höchstens einen Medienvergleich von Max; in der Taverne `1230` streichen oder umschreiben. | klein |
| 29 | B | Grafik | Notizbuch | Das Notizbuch ist eine halbdurchsichtige graue Tafel mit drei Knöpfen. Es funktioniert, sieht aber neben den Hintergründen nach Graubox aus. | [Bild](review-prolog-welt-1/29_notizbuch_graubox.png) | Eine gemalte Doppelseite als Hintergrund, Schrift in Pixelify Sans, Knöpfe als Eselsohren. Für den Test mit Fremden reicht der jetzige Stand. | mittel |
| 30 | C | Animation | Treppenhaus | Die Treppe funktioniert: Füße auf den Stufen, Geländer davor, Knie hoch. Am gestreckten hinteren Bein sieht man eine helle Naht, in einzelnen Bildern schwebt ein Fuß zwei bis drei Pixel über der Stufe. | [Bildfolge](review-prolog-welt-1/30_treppe_max.png) | Bei der Überarbeitung des Gangs (Fund 3) mit erledigen. | klein |
| 31 | C | Bedienung | Troll-Brücke, Smaugi, Laden | Sehr kleine Klickflächen: Ausgang zum Dorfplatz an der Brücke 22 × 45, Okarina 14 × 10, Lerntagebuch 18 × 16, Zahnstocher 15 × 12. Mit der Maus geht das, mit Controller wird es mühsam. | Tabelle der Klickflächen aus dem Spiel | Ausgänge mindestens 50 Pixel breit, kleine Dinge mindestens 20 × 20 (die Fläche darf größer sein als das Bild). | klein |
| 32 | C | Grafik | Max | Max' Auge ist in der Seitenansicht ein dunkler Strich; er wirkt in allen Räumen, als hätte er die Augen zu. | [Sprites](review-prolog-welt-1/03_max_gang_sprites.png) | Zwei Pixel Weiß und eine Pupille in den Stand- und Gehbildern. | klein |
| 33 | C | Grafik | Luftschloss | Die Bodenlinie an der Naht ist weg, aber die Hälften haben sichtbar verschiedene Fugen (links blass und schräg, rechts dunkel und gerade). Der Raum ist insgesamt flächiger und konturloser als alle anderen. | [Übersicht](review-prolog-welt-1/00_uebersicht_welt-1.png) | Fugen der linken Hälfte in der Farbe der rechten nachziehen; ein paar dunklere Konturen an Torbogen und Mauer. | mittel |
| 34 | C | Spielfluss | Inventar | Am Ende von Welt 1 liegen 14 Dinge im Inventar, darunter verbrauchte (Steckbrief, Hinweiszettel, Eimer, Vorleger, Ketchup). | Ausgabe des Durchspieltests | Steckbrief nimmt die Maklerin mit, Hinweiszettel verschwindet mit dem Trank, den Eimer behält der Brunnen nach Rätsel 8. | klein |
| 35 | C | Text | Dokumente | `raetsel/prolog-und-welt-1.md` ist an zwei Stellen überholt: Das Ei „nimmt Max einfach weg“ (jetzt Huhn-Rätsel), die Thunfischdose „guckt aus Opas Mantel“ (jetzt Karton). P11 (acht statt neun Buchstaben) ist weiter offen. | Dokument | Nachziehen. | klein |
| 36 | C | Technik | Godot-Ausgabe | Beim allerersten Import eines frischen Checkouts meldet Godot „Failed to create an autoload … not compiling“ und fehlende Übersetzungsdateien; nach dem Import ist alles sauber. Beim Beenden der Tests gibt es Warnungen über nicht freigegebene Ressourcen. Beides stört das Spiel nicht. | Importprotokoll | In der README einen Satz „erster Import meldet Fehler, zweiter Start ist sauber“. | klein |

## 3. Rätsel-Übersicht

Zeit: meine Schätzung für Erstspieler ohne Hinweise, mit Lesen der Texte.

| Rätsel | Fairness | Zeit | Wichtigster Fund |
| --- | --- | --- | --- |
| P1 Der schlafende Kater | gut | 6 bis 9 min | Drei Schritte, drei Räume, jeder mit eigener Rückmeldung; Opas Hinweise führen sauber. Hinweistext sagt „hängt“, der Dosenöffner liegt (Fund 25). |
| P2 Nur Rauschen | gut | 2 min | Kleiderbügel ist klar zu sehen, Opa nennt „Modell Kleiderbügel“. |
| P3 Der richtige Kanal | gut | 2 bis 3 min | Kanal 4 als Fehlversuch ist ein guter Gag. Nahansicht ist Platzhalter (Fund 4). Opa verdeckt weder Drehknopf noch Kalender, steht aber auf Max (Fund 2). |
| Prolog gesamt | gut | 13 bis 16 min | Über dem Ziel von 10 Minuten, vor allem durch 18 Zeilen Auftragsszene. Kein Schaden, aber die Zielzeit des Slice anpassen. |
| R1a Minka | gut | 3 min | Wechsel wird gut gelehrt; Minka sitzt am falschen Platz (Fund 7). |
| R1b Wirt | gut | 3 bis 4 min | Zwei Hinweise (Weinkarte, Pixel) führen zum Schicksalsberg. |
| R1c Gollo | knapp | 4 bis 8 min | Auslöser fehlt (Fund 6). Die Auflösung selbst ist der beste Moment der Taverne. |
| R2 Zauberstab | gut | 4 bis 6 min | „Honigfinger“ ist ein fairer Wink; die Regel „nur im Laden“ hat eine eigene Zeile. |
| R3 Drei Ziegenböcke | gut | 8 bis 11 min | Drei Quellen in drei Räumen, zweimal über den Dorfplatz. Pixels Ahnung beim Vorleger ist der Hinweis auf Ziege drei. |
| R4 Märchen an der Brücke | gut | 11 bis 14 min | a, b und c bauen sauber aufeinander auf; der Eimer kostet einen Weg zum Brunnen. Wasserschloss verdeckt (Fund 5). |
| **Slice Prolog bis R4** | gut bis knapp | **50 bis 60 min** | Mit Ankunftsszene (34 Zeilen) und Wegen über dem Ziel von 40 Minuten. Entweder Ziel auf 55 setzen oder die Ankunft um ein Drittel kürzen. |
| R5 Brunnen | gut | 3 bis 5 min | Falsche Wünsche geben die Münze zurück, kein Feststecken. |
| R6 Sechs Flaschen | knapp | 15 bis 20 min | Logik eindeutig, Pixels Lüge gut vorbereitet. Flasche nicht zurückstellbar (Fund 13), Ei und Pfote (Fund 16), Satz ohne Bezug (Fund 19). |
| R7 Niesrosen | gut | 5 bis 8 min | Kette Rotkäppchen, Brücke, Wald ist klar; ein Weg hin und zurück. |
| R8 Bohnenranke | gut | 2 bis 3 min | Erdfleck ist benannt und sichtbar. |
| R9 Zeldina | gut | 5 bis 8 min | Ohne Steckbrief sagt die Maklerin, was fehlt; ein Raum zurück. |
| R10 Goblin-Frage | gut | 5 bis 8 min | Beide Wege im Test grün; Hinweise nennen beide. |
| R11 Teil 2 Besen | knapp | 5 bis 10 min | Besen bewegen sich nicht, Kreuzungen sind klein (Fund 17). Lösbar über Namen der Hotspots und Pixels Zeile. |
| R11 Teil 1 Passwort | unfair, wenn die Kritzelei fehlt | 5 bis 20 min | Kritzelei verdeckt, Tür sagt nicht, was fehlt (Fund 14). Mit allen vier Teilen ist es ein schönes Rätsel. |
| R12 Smaugi | gut | 4 bis 6 min | Abnehmer stehen bereit, falsche Paarungen haben Gags. |
| R13 Moderwort | gut, mit langem Rückweg ohne Pollen | 4 bis 6 min, sonst 15 | Thronsaal ohne Pollen betretbar (Fund 15). |

Feststecken im engeren Sinn (Gegenstand verbraucht, Raum gesperrt) habe ich nicht gefunden. Die Hilfe-Pfote wählt immer einen offenen Schritt und sagt in Stufe 3 die Lösung klar; Lücken sind Berta (Fund 16) und das Passwort (Fund 14). Die Stufen sind unterhaltsam, die Wartezeiten von 30 und 60 Sekunden passen.

## 4. Witz und Text

Je Raum die Stellen, die am besten tragen, und die schwächsten. „Schwach“ heißt hier meist: ein Medienvergleich, der überall stehen könnte.

| Raum | Am stärksten | Am schwächsten |
| --- | --- | --- |
| Wohnzimmer | `P0_WOHN_MAX_0120` (Foto, „Nicht die Torte“), `0365` („Funknetz, vier Buchstaben: NEIN“), `0044` („Wir leiden beide“) | `0355` (Rechnung geht nicht auf, P11), `0200` mit `0205` (Tatort-Gag ein drittes und viertes Mal nach `0145`), `0320` |
| Treppenhaus | `P0_TREP_MAX_0025` (Kaktus), `0065` („Das war die dritte!“), `0175` („Erfindungen, halb“) | `0140`, `0160`, `0120` |
| Dachboden | `P0_DACH_PIX_0310` bis `0320` (Aufwachen), `OPA_0060` („nicht Bus“), `MAX_1635` („Pixel: Lachs“) | `MAX_0100` (dritte Staffel), `PIX_0490` (Techniker und Kekse, lang ohne Pointe), `MAX_1840` |
| Dorfplatz, Ankunft | `W1_ANK_MAX_0121` („Ich hab einen Hoodie“), `W1_DORF_MAX_0950` („Sofa mit Hörnern“), `W1_DORF_TOA_0522` (Bäcker ist ein Brot) | `W1_ANK_MAX_0050` (Staffel), `W1_DORF_MAX_0110` (Apps), `W1_DORF_MAX_1160` (Download) |
| Taverne | `W1_TAV_GOL_1210` („Betrug! Ich liebe es“), `PIX_0340` („Sie interpretiert“), `HUM_1250` bis `1270` (Etikett, Macht und Gruyère) | `MAX_1230`, `MAX_1330` (zweimal „In Serien …“ in einer Szene), `MAX_0360` |
| Schmiede | `W1_SCHM_SCH_0240` („Wie Schulden“), `0280` (Denkmal aus Blech), `0222` („Mit meinem“) | `MAX_0010` (Handy), `MAX_0110`, `MAX_0500` |
| Zauberstab-Laden | `W1_STAB_STA_0260` („ein Flur“), `0780` („Schachtel mit Würde“), `0420` (Blutstropfen) | `MAX_0090` („in 4K“), `MAX_0020`, `MAX_0590` |
| Klassenzimmer | `W1_HOGG_PIX_0780` („Interpretiert.“), `ALW_0342` („mit Pilz ist es Bildung“), `ALW_0980` bis `0987` (Schleim) | `MAX_0950` (ohne Bezug, Fund 19), `MAX_0040` (Follower), `TOA_0730` (zündet erst, wenn Toadi ein Pilz ist) |
| Troll-Brücke | `W1_BRUE_WAL_1270` („nie beschlussfähig“), `0700` und `0770` (Übersetzungsfehler), `0440` bis `0460` („Zugelassen. Mit Bauchschmerzen.“) | `MAX_0030` (Handyvertrag), `MAX_0630` (App), `MAX_0120` |
| Wasserschloss | `W1_WASS_MAX_0065` („Fische sind Vormieter“), `0115` (Seerose I), `PIX_0050` | `MAX_0010`, `MAX_0090`, `MAX_0150` |
| Zauberwald | `W1_WALD_ROT_0260` mit `0780` (Wolf ist Kunde, gießt die Blumen), `PIX_0430` (Modem), `WAL_0500` („WAAASSEEER!“) | `MAX_0050` (Chat), `MAX_0140` (Standby), `MAX_0560` |
| Luftschloss | `W1_LUFT_ZEL_0540` mit `MAX_0550` („Vermittelt.“), `TOA_0640` („Finden mit Anlauf“), `PIX_0460` („Das ist mein Gesicht“) | `MAX_0010`, `MAX_0145`, `MAX_0050` |
| Bergwerk | `W1_BERG_GRI_0320` mit `0520` (Daumen), `MAX_0670` („eine ganze Kindheit“), `W1_WALD_ROT_0242` (zählen bis eins) | `MAX_0070` (Nachtmodus), `MAX_0025` gegen `0030` (Widerspruch), `MAX_0160` |
| Turmkeller, Abstellkammer 1 | `W1_TURM_MAX_0010` (Bildschirmschoner), `PIX_0180` („am häufigsten gefegt“), `MAX_0315` (Besen mit Schal) | `MAX_0095` (erklärt die Vorlage), `MAX_0070` (Autoplay), `MAX_0085` |
| Smaugis Kammer | `W1_SMAU_TUE_0770` („Richtig. Mama?“), `SMA_0030` („Das ist noch schlimmer“), `HUM_0530` (Taufe der Schwerter) | `MAX_0690` (Staffel), `MAX_0740` (Autokorrektur), `MAX_0140` |
| Thronsaal | `W1_THRO_MOD_0050` („Fotos! Vom Schlafzimmer!“), `MOD_0410` mit `MAX_0420` („nur Käse“), `PIX_0140` (Lerntagebuch) | `MAX_0310` (wiederholt `STAB_0550` wörtlich), `MAX_0230`, `MAX_0060` |

**Anspielungen:** Fast alles ist Augenzwinkern und funktioniert ohne Vorlage (Kokosnüsse, Okarina, Schwert im Stein, „Trink mich“). Am nächsten an einer Kopie bleibt Toadi mit dem wörtlichen Satz „Danke, Max! Aber die Prinzessin ist in einem anderen Schloss“; das ist als S12 bekannt und wird durch den jetzigen Hut eher entschärft. `W1_TURM_MAX_0095` erklärt die Vorlage („alter Meister mit Hut“), was die Dialogregeln ausschließen. Gollos „Mein Ssschätzchen“ ist die einzige Stelle, die wie ein Zitat klingt.

## 5. P15-Abgleich

Jeder Eintrag aus „Nacharbeiten an eingebauten Hintergründen“ in der Reihenfolge der Tabelle.

| Eintrag | Stand | Anmerkung |
| --- | --- | --- |
| Troll-Brücke, Grundlage | erledigt | – |
| Taverne, Tresen als Vordergrund | erledigt | Kante im Spiel sauber, Humbert steht glaubhaft dahinter. |
| Luftschloss, Naht | teilweise | Linie weg, Fugenbild der Hälften verschieden (Fund 33). |
| Turmkeller, Türkante und gemalte Besen | teilweise | Zu-Fassung sitzt sauber. Die Abgrenzung zu Zauberbesen-Sprites stellt sich nicht, weil es keine gibt (Fund 17). |
| Smaugis Abstellkammern, Bündel und Kronleuchter | erledigt | Aufgeräumte Fassung passt; Kronleuchter hängt. |
| Nahansichten Hinweiszettel, Zeugnis, Kritzelei | offen | Verse laufen über die Zeilen, „Stern mit Hut“, Sternchen im Zeugnis, englische Fassung fehlt (Fund 25). |
| Figuren Moderwort, Zeldina, Maklerin, Max als Pilz | offen | Optisch unkritisch; Grün und Violett sind da. Palette nicht nachgezogen. |
| Deko Welt 1 | teilweise | Socke und Hufeisen sitzen; Kokosnüsse und Glasschuh sind so klein, dass man sie ohne Text nicht erkennt. |
| Niesrosen, Bohnenranke | teilweise | Rosen rosa; Ranke oben und beide Animationen offen. |
| Smaugis Kram | erledigt | In der Kammer platziert. |
| Klassenzimmer, Schüler am Fenster | nicht geprüft | In meinen Aufnahmen nicht aufgetaucht (Zufallsauslöser). |
| Grammophon | erledigt | Original bleibt. Es ist sehr unauffällig; das passt zu „heimlich“. |
| Wasserschloss rosa nachgezeichnet | erledigt, im Spiel verdeckt | Fund 5. |
| Waldemar als Platzhalter rechts der Brücke | offen, schlimmer als beschrieben | Verdeckt Schloss und Ausgang (Fund 5). |
| Klassenzimmer, Grundlage | erledigt | – |
| Klassenzimmer, sechs Flaschen | teilweise | Sprites sauber, kein Schatten auf der Wand, große Flaschen etwa 1,4-fach bei Text „doppelt“. |
| Klassenzimmer, Kessel | erledigt | Text sagt jetzt das Falsche (Fund 25). |
| Klassenzimmer, Flasche 3 | erledigt | Im Test geprüft. |
| Dachboden, Aseprite-Durchgang | erledigt | Kabel unter Pixel nach P1 nicht eigens angesehen. |
| Dachboden, Props | erledigt | Dosenöffner liegt, Text sagt „hängt“. |
| Treppenhaus, Geländer und Stufen | erledigt | In der Aufnahme stimmig (Fund 30). |
| Wohnzimmer, Liegen und Aufstehen | teilweise | Posen eingebaut, Überblenden statt Animation, Sitzpose mit falscher Haarfarbe (Fund 8). |
| Figuren Max, Pixel, Opa, neue Bilder | erledigt | Blinzeln und Halsband-Leuchte funktionieren. |
| Mauszeiger | teilweise | Zeiger sind da; der Ausgangspfeil zeigt weiter immer nach oben. |
| Gemini-Posen | teilweise | Eingebaut, aber farblich nicht am Sprite (Fund 8); Rest nicht eingebaut. |
| Klassenzimmer, Socke fehlt | erledigt | Liegt auf dem Hocker. |
| Zauberwald, Breitbild und Naht bei 421 | erledigt | Keine Naht erkennbar. |
| Zauberwald, dicker Baum | erledigt | Max verschwindet glaubhaft dahinter. |
| Zauberwald, Weggabelung, Naht bei 609 | erledigt | – |
| Zauberwald, Riesenpilze | erledigt | – |
| Zauberwald, Leuchtpilze | teilweise | Farbe gut, kein Pulsieren. |
| Zauberwald, Lieferkarren | erledigt | – |
| Zauberwald, Ketchup | erledigt | Gut eingebunden. |
| Zauberwald, Leuchtpilz | erledigt | Gut eingebunden; Klickfläche siehe Fund 21. |
| Zauberwald, Niesrosen fehlen | erledigt | Sprites da. |
| Zauberwald, 47 Farben | offen | Fällt nicht auf. |
| Kamera in breiten Räumen | erledigt | Alle vier breiten Räume bis an beide Ränder aufgenommen. |
| Wasserschloss, Größenverhältnis, Schwan | teilweise | Schwan echt; Max am Eingang 145 Pixel bei 75 Pixel Tor. |
| Bergwerk, Fackeln und Helligkeit | teilweise | Fackeln gut, Raum dunkel, weißes Schild (Fund 20). |
| Bergwerk, offene Rune-Tür | teilweise | Wie eingetragen; Lichtschein auf dem Boden fehlt. |
| Gegenstände Welt 1, Fläschchen und Ei | offen | Ei-Klickfläche zu klein (Fund 16). |
| Nahansicht Märchen-Satzung | offen | „§“ liest sich als „2“, Zeilen auf Fugen. |
| Figuren Humbert, Gollo, Stabmacher, Minka | teilweise | Gehzyklen gebaut, aber ungenutzt; kein Mund. |
| Bergwerk, Streik-Goblins | offen | Atmen nicht. |
| Dachboden, Zapp-O-Mat schwebt | erledigt | Steht mit Schatten auf dem Rolltisch. |
| Dachboden, Farben Zapp-O-Mat und Dosenöffner | erledigt | – |
| Dachboden, Aussparung bei Pixel | nicht geprüft | – |
| Wohnzimmer, Staubrand | erledigt | – |
| Treppenhaus, Laufweg | erledigt | – |
| Treppenhaus, Thunfischdose im Karton | erledigt | Halb verdeckt, trotzdem klickbar. |
| Opa, Schuhe und Fußpunkt | teilweise | Im Stand gut; beim Reden und Gehen anderer Körper (Fund 1). |
| Max, Augen | offen | Fund 32. |
| Drahtkleiderbügel | erledigt | – |
| Dorfplatz, Weg nach Hoggelwarz | erledigt | Sichtbar und klickbar. |
| Dorfplatz, Größe der Läden | teilweise | Fund 26. |
| Dorfplatz, Eimer, Zettel, Steckbrief | erledigt | – |
| Taverne, Vorleger | erledigt | – |
| Taverne, Laute und Drachen-Steckbrief | teilweise | Laute halb hinter Gollo, bleibt klickbar. |
| Taverne, Gerhard und Limo sichtbar | erledigt | – |
| Zauberstab-Laden, Helligkeit | offen | Einziger kalt-blauer Innenraum; lesbar. |
| Zauberstab-Laden, Kissen und Sprites | teilweise | Drei Sprites von 12 Pixeln Höhe, ohne Namen kaum zu unterscheiden. |
| Schmiede, Krug | erledigt | Text „hängt“ stimmt nicht (Fund 25). |

Abschnitt „Animationen“ aus `offene-punkte.md`: Max' Gang ist neu, aber rutscht (Fund 3); Ankunft hat Posen, Toadi gleitet weiter (Fund 8); Opa hat Posen und Gang, aber den falschen Körper (Fund 1); Pixel wie beschrieben (Fund 27); die Zeile „Gehen = Atmen“ für die Nebenfiguren stimmt nicht mehr, die Gänge sind gebaut, nur nicht verdrahtet (Fund 18).

**P16, lebendige Hintergründe:** Die Vögel am Dorfplatz sind in den Aufnahmen zu sehen und stimmig, eher zu wenig als zu viel. Am meisten fehlt Bewegung dort, wo das Bild sie verspricht: Kaminfeuer und Dampf über dem Fondue in der Taverne, Glut in der Schmiede, Kesselblasen im Klassenzimmer, Bach an der Brücke, Fackeln im Turm. Das sind jeweils zwei bis drei Bilder in Schleife und wirken stärker als ein weiterer Zufallsbaustein.

## 6. Animationsplan

Grundsatz wie in `offene-punkte.md`: Gehen bekommt nur, wer im Spiel läuft. Weg: **gemalt** (Pose zu Pose in Aseprite), **Mischweg** (gemaltes Sprite, Teile nach 3D-Winkeln gedreht), **Code** (Tween, Bildtausch).

| Figur | Zustand heute | Empfohlene Bewegungen | Weg | Priorität |
| --- | --- | --- | --- | --- |
| Max | Gang 14 Bilder (rutscht), Treppe 17, Blinzeln, Mund, Posen liegen/sitzen/knien | Gang neu abstimmen (Fund 3); Posen umfärben; später Bücken beim Nehmen und Zeigen | Mischweg, Aseprite für Kanten | A |
| Opa | Stand gemalt, Reden und Gehen mit 3D-Körper | Reden und Gehen auf gemaltem Körper; langsamer, gebückter Gang; Eigenheit: am Zapp-O-Mat schrauben | Mischweg, sofort `talk_alt` | A |
| Pixel | Sitzen, Stehen, Schlafen, Gang fast ohne Beine, Sprung per Code | Gang 8 Bilder, Aufstehen 3 Bilder, Putzen als Eigenheit | gemalt | B |
| Toadi | Gehzyklus ungenutzt, gleitet | Rennen bei jedem Auftritt, Keuchen (2 Bilder), Hüpfen im Stand | Mischweg vorhanden, Code | A |
| Humbert | Gehzyklus ungenutzt; Schürze verdeckt die Beine | Geht zur Kellertür und kommt staubig zurück; Eigenheit: Krug polieren | Code mit vorhandenem Gang, Polieren gemalt (3 Bilder) | B |
| Gollo | Gehzyklus ungenutzt | Kein Gang nötig. Ringwurf (3 Bilder) und Einrollen zum Schlafen | gemalt | B |
| Minka | 4 Bilder | Geht mit Pixel zur Tür (4 Bilder reichen), Schwanzzucken im Stand | gemalt | B |
| Huhn Berta | 4 Bilder | Flattern auf den Balken (2 Bilder im Bogen), Hacken (2 Bilder) | Code mit `springen_zu`, gemalt | B |
| Schmied | Gehzyklus ungenutzt | Kein Gang. Hämmern am Amboss mit Funken | gemalt (4 Bilder) | B |
| Schmiede-Ziege | 12 Bilder Gang | Kauen im Stand; Gang nur, wenn Begleiter wirklich folgen | gemalt | C |
| Stabmacher | Gehzyklus ungenutzt | Kein Gang. Monokel zurechtrücken, Träne bei „Er hat dich gewählt“ | gemalt (3 Bilder) | C |
| Alwin | Gehzyklus ungenutzt; Robe verdeckt die Beine | Kein Gang. Rühren im Kessel, Zeugnis holen als Überblendung | gemalt (4 Bilder) | B |
| Waldemar | Gehzyklus ungenutzt | Fliege zurechtrücken; Musical-Nummer mit drei Posen (Arme auf, Schlusston, Verbeugung); Fußbad sitzend | gemalt | B |
| Rotkäppchen | Gehzyklus ungenutzt | Kommt mit Karren und fährt ab | Code mit vorhandenem Gang | B |
| XXL-Ziege | 12 Bilder Gang | Hinlegen auf der Brücke (Übersetzungsfehler), Hörner senken | gemalt (2 Posen) | B |
| Maklerin | Gehzyklus ungenutzt | Kein Gang. Klemmbrett zuklappen, Sprung mit Schirm | gemalt (2 Posen), Code | C |
| Zeldina | Gehzyklus ungenutzt | Folgt Max sichtbar im Raum (einziger Begleiter, bei dem sich der Gang lohnt); Stab fangen | Mischweg vorhanden, Code | B |
| Grimmzahn, Goblins | Gehzyklen ungenutzt | Kein Gang. Trillerpfeife, Schilder hochhalten beim Lied, Streik-Goblins atmen | gemalt | C |
| Zauberbesen, Übungsbesen | Sprites ungenutzt | Fegen auf den Routen, Jagd in die Kammer; Übungsbesen in den Schrank | Code mit vorhandenen Bildern | B |
| Smaugi | 4 Bilder | Staubwedel, Rauchwölkchen beim Seufzen, Schniefen | gemalt (3 Bilder) | C |
| Moderwort | Gehzyklus ungenutzt | Niesen (3 Bilder, Stab fliegt als eigenes Sprite), Zaubern, Hinsetzen auf die Stufe | gemalt, Code | B |
| Schwan | 4 Bilder | Hals drehen | gemalt | C |

**Zum Mischweg:** Er hat ein echtes Ergebnis gebracht, nämlich einen gleichmäßigen Gang und eine glaubhafte Treppe für Max bei unverändert gemaltem Aussehen. Er hat drei Grenzen, die man an den Belegen sieht. Erstens entscheidet nicht die 3D-Bewegung über die Qualität, sondern die Abstimmung von Schrittweite und Lauftempo; die fehlt noch (Fund 3). Zweitens verträgt Pixelgrafik das Drehen kleiner Teile schlecht: Schuhe, Säume und Hände fransen aus und brauchen nach jedem Lauf Handarbeit in Aseprite. Drittens bringt er bei Figuren mit Robe, Schürze oder Kleid fast nichts, weil man nur zwei Schuhe sieht (Alwin, Humbert, Zeldina, Moderwort). Den gerenderten 3D-Körper direkt zu zeigen, wie bei Opa, ist kein Mischweg mehr und bricht den Stil. Meine Empfehlung: den Mischweg für Max behalten und fertig abstimmen, für Opa auf dieselbe Art nachziehen und sonst nur für Figuren nutzen, die wirklich Strecke gehen (Toadi, Zeldina, Rotkäppchen, Humbert). Alle anderen brauchen keinen Gehzyklus, sondern zwei bis vier gemalte Schlüsselposen für ihre Eigenheit und ihren Szenenmoment; das ist in Aseprite schneller und trägt den Witz. Für die Welten 2 bis 4 heißt das: erst je Figur aufschreiben, wo sie im Spiel geht und welche Pose ihr Gag braucht, dann animieren.

## 7. Bedienung und Technik

- **Werkzeuge:** `prolog_durchlauf.gd` 882 Prüfungen, 0 Fehler, beide Wege von Rätsel 10. `pruefen.py` 0 Fehler, 0 Warnungen, 104 Hinweise (alle „Nummer nicht aufsteigend im Block“). `bildschirm_vergleich.gd` 55 Prüfungen, 2 Fehler durch Atem-Animation (Fund 22).
- **Speichern und Laden:** Der Durchspieltest macht rund 40 Rundreisen, auch mit Pixel als aktiver Figur, mitten in R4, R6, R11 Teil 2, R12 und R13 und nach den Hintergrundwechseln; alles gleich. Die Hintergrundfassung wird in jedem Bild aus dem Rätselstand abgeleitet und kann nach dem Laden nicht falsch sein. Nicht von Hand geprüft: die Speicherplätze im Menü.
- **Überspringen:** Ankunft und Taverne geprüft, der Zustand danach stimmt (Fund 23). Pilz und Berta habe ich im Code nachgelesen: Die Schritte, die den Zustand setzen, laufen auch beim Überspringen.
- **Fehlermeldungen:** keine Skriptfehler und keine fehlenden Zeilen in allen Läufen mit und ohne Testmodus (Fund 36 betrifft nur den ersten Import).
- **Leistung:** durchgehend 60 Bilder je Sekunde, auch auf dem breiten Dorfplatz mit Ambiente; ein einzelner Hänger von etwa 0,15 s beim automatischen Speichern am Raumwechsel. Gemessen auf Sebastians Rechner mit einer Radeon RX 7900 XT, das sagt nichts über schwache Geräte.
- **Verdeckte Hotspots:** Wasserschloss-Ausgang (Fund 5), Kritzelei (Fund 14), Ei (Fund 16). Drehknopf und Kalender im Prolog sind frei.

## 8. Gesamtbild

- **Zusammenhang:** Welt 1 liest sich als ein Bilderbuch. Der Verlauf von sonnig (Dorf, Brücke) über Waldgrün zu Violett (Bergwerk, Turm, Thronsaal) ist da und trägt. Der Prolog passt mit seinem warmen Licht gut davor. Aus der Reihe fallen das flächige Luftschloss (gewollt verträumt, aber konturlos), der kalt-blaue Zauberstab-Laden und einzelne Figuren (Toadi, Smaugi).
- **Stärkstes Element:** die Hintergründe zusammen mit den Dialogen der eigenen Figuren, vor allem Waldemar mit der Satzung. Rätsel 4 ist das Vorzeigestück des Slice.
- **Schwächstes Element:** die Figurenanimation, und dort an erster Stelle Opa.
- **Testreife des Slice:** noch nicht. Vorher müssen sein: erstens Opa mit einem Körper und Max ohne Rutschen (Funde 1 bis 3), zweitens keine Platzhalter und keine verdeckten Ziele (Funde 4, 5, 7), drittens Rätsel 1c mit sichtbarem Auslöser und lesbaren Texten (Funde 6, 10, 11). Die Funde 8 und 9 kosten wenig und machen den ersten Eindruck von Welt 1 deutlich besser.
- **Für die Welten 2 bis 4:** Figuren erst platzieren, dann Hotspots prüfen (die Klickflächen-Übersicht aus diesem Review lässt sich als Test dauerhaft einbauen: Figur über Ausgang oder Nahansicht ist ein Fehler). Texte, die ein Bild beschreiben, erst nach dem Einbau des Bildes festschreiben. Nahansichten und Notizbuch gehören zum Raum und nicht ans Ende. Animation nach Liste „wer geht, wer hat welchen Moment“, nicht pauschal Gehzyklen. Gemini-Posen immer gegen die Farben des Sprites ziehen, bevor sie ins Spiel kommen.

## 9. Bilder

Alle in `review-prolog-welt-1/`. Die Zahl am Anfang ist die Nummer des Funds; `00_uebersicht_prolog.png` und `00_uebersicht_welt-1.png` zeigen alle Räume beim ersten Betreten. Bilder mit gelben, grünen, türkisen und magentafarbenen Rahmen zeigen die Klickflächen aus dem laufenden Spiel (gelb Hotspot, grün Ausgang, türkis nehmbar, magenta Figur, weiße Linie Laufbereich). Die GIFs zu den Funden 1, 2, 3 und 8 laufen in doppelter Größe.

## 10. Nicht geprüft

- **Controller und Steam Deck:** kein Gerät am Prüfrechner; die Klickflächen-Tabelle zeigt nur, wo es eng wird (Fund 31).
- **Ton:** Es gibt nur Platzhalter-Klänge, und die Aufnahmen liefen ohne Lautsprecher. Ob das Goblin-Lied verständlich ist (S18), ist offen.
- **Spielen mit der Maus von Hand:** Alle Aktionen wurden über dieselben Funktionen ausgelöst, die ein Klick aufruft. Wege, Sprechtexte und Szenen liefen echt, aber Zeigerverhalten, Doppelklick und das Aufklappen der Inventarleiste habe ich nur als Standbild gesehen.
- **Zeiten:** Die Minuten in der Rätsel-Übersicht sind Schätzungen aus Schritten, Wegen und Textmenge, keine Messung an Menschen.
- **Einzelne Zustände:** Zeldina, Grimmzahn und Humbert in Smaugis Kammer, die Bohnenranke, die offene Rune-Tür und Waldemars Nummer habe ich im Code und im Durchspieltest geprüft, aber nicht als Bild aufgenommen. Der Schüler am Fenster ist in den Aufnahmen nicht erschienen.
- **Englische Fassung** und die Welten 2 bis 4 waren nicht Teil des Auftrags.
