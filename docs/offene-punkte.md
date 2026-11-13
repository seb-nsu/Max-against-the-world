# Offene Punkte

Hier steht nur, was noch offen ist. Erledigtes steht in der Git-Historie, die gültigen Entscheidungen mit Begründung in `entscheidungen.md`. Ist ein Punkt erledigt, wird er hier gestrichen und, falls er etwas entscheidet, in `entscheidungen.md` und der Besitzer-Datei eingetragen.

Stand 11. November 2026. Kennungen: S = zurückgestellte Punkte aus Gutachten 4, A = Automatisierung, P = weitere Punkte, K = Abgleich zwischen Dateien.

## Entscheidungen und Aufgaben von Sebastian

| Nr. | Was offen ist | Wer, was zu tun ist | Besitzer-Datei |
| --- | --- | --- | --- |
| S6 | Feste Termine für Stufen, Steam-Seite und Demo | Sebastian legt das Startdatum fest, dann werden die Termine aus der Schätzung (20 Prozent Puffer) fest eingetragen | `03-produktion.md` (Puffer und Termin) |
| S7 | Gewerbe und Steuer | Sebastian, vor der Steam-Seite: Gewerbe anmelden, Steuernummer, Steuerberater-Erstgespräch (Kleinunternehmerregelung, Steam-Steuerinterview) | `03-produktion.md` (Rechtliches) |
| S10 | Registersuche zum Titel „Couch Quest“ in DPMAregister und EUIPO eSearch (Klassen 9, 28, 41) | Sebastian sucht und schickt das Ergebnis; danach mit Datum eintragen | `03-produktion.md` (Rechtliches), `01-konzept.md` (Rechtscheck) |
| P1 | Anwaltsstunde für Figurenliste und Titel | Sebastian, vor der Veröffentlichung (Budget 200 bis 350 €) | `03-produktion.md` (Rechtliches, Kosten) |
| P3 | Zwei-Klick-Steuerung bestätigen oder doch eine Verbenleiste | Sebastian nach dem ersten Test | `05-spielsysteme.md` (UI) |
| P4 | Vollvertonung oder Brabbel-Laute | Sebastian, spätestens zu Beginn von Stufe 5 (ab etwa 10.000 Wunschlisten Vollvertonung) | `03-produktion.md`, `04-audio.md` |
| P10 | Englisch: Pixel spricht ohne Kurzformen. Passt der Tonfall? | Sebastian liest ein paar Zeilen von Pixel in `uebersetzung/en.csv`; gefällt es nicht, stellt der Commit vor der Durchsicht den alten Tonfall wieder her | `05-spielsysteme.md` (Englische Fassung) |
| P11 | `P0_WOHN_MAX_0355` verlangt „neun Buchstaben“, ZAPPOMAT hat acht, und Opa malt „für den neunten ein Kästchen dazu“ | Sebastian entscheidet den Wortlaut (aufgehen würde es mit „sieben“ und „für den achten“); danach Englisch nachziehen | `skript/prolog.md` |
| P14 | Zeilenbudget: Das Skript hat 5.450 Zeilen bei einem Budget von etwa 5.000; bis auf Welt 3 liegt jeder Abschnitt darüber (Zahlen in `05-spielsysteme.md`, Umfang) | Sebastian: Budgets anheben oder kürzen. Wichtig für die Kosten der Vertonung (`04-audio.md`, Umfang) | `05-spielsysteme.md` (Umfang) |

## Vor der Steam-Seite auffrischen

| Nr. | Was offen ist | Wer, was zu tun ist | Besitzer-Datei |
| --- | --- | --- | --- |
| S9 | Store-Text zur KI-Offenlegung an den tatsächlichen Ablauf anpassen | Claude mit Sebastian, vor der Steam-Seite | `03-produktion.md` (KI-Offenlegung) |
| S11 | Markt-Zahlen (Vergleichstitel, Wunschlisten-Quoten) auffrischen | Claude, kurz vor der Steam-Seite | `03-produktion.md` (Markt) |
| S12 | Abspann mit Toadi vor dem Trailer-Schnitt prüfen; Trailer, Kapselbilder und erste Screenshots ohne Toadi und Zeldina | Sebastian beim Trailer-Schnitt | `03-produktion.md` (Parodien), `01-konzept.md` (Rechtscheck) |
| P6 | Errungenschaften und Barrierefreiheits-Tags gegen die aktuellen Steam-Felder prüfen | Claude, vor der Steam-Seite | `05-spielsysteme.md` (Optionen, Errungenschaften) |

## Grafik, Audio und UI erzeugen und testen

| Nr. | Was offen ist | Wer, was zu tun ist | Besitzer-Datei |
| --- | --- | --- | --- |
| S16 | Erstes Sprite-Paar Max und Pixel mit Silhouetten-Test | Sebastian: beide erzeugen, von Hand nachziehen, als schwarze Umrisse auf hellem und dunklem Grund prüfen; danach Freigabe für alle Figuren und für A10 | `grafik/01-max-und-pixel.md` |
| S18 | Hörtest des Goblin-Lieds | Sobald das Lied erzeugt ist: Ist der Passwort-Teil verständlich? Untertitel sind schon fest eingeplant | `04-audio.md` |
| P7 | Retro Diffusion vor dem ersten Auftrag prüfen | Sebastian: Modellnamen und Stil-Liste auf der Website prüfen und mit Datum ins KI-Protokoll; die lokale Version vorher auf der Radeon 7900 XT mit der Demo testen | `grafik/00-stil-und-werkzeuge.md`, `03-produktion.md` (System 2) |
| P8 | Bildschirm-Einblendungen des Zapp-O-Mat (80×60, im Spiel etwa 40×30): Sind Gesichter lesbar? | Test in Godot; sonst die 80×60-Fassung auch beim Ansehen nutzen | `grafik/02-prolog-und-finale.md` |
| P9 | Wartezeiten der Hinweise (30 und 60 Sekunden) | Nach dem ersten Test mit Fremden anpassen | `05-spielsysteme.md` (Hinweissystem) |
| P12 | Animation aus eigenen Bildern: Test an Max | Sebastian liefert ein Bild von Max (flach, sauber, vier- bis achtfache Größe). Claude säubert es mit Pixel Snapper, zerlegt es und baut Atmen, Sprechen und Gehen per Code. Danach Entscheidung, woher neue Posen kommen: Retro Diffusion wie geplant oder Agent Sprite Forge | `grafik/00-stil-und-werkzeuge.md` (Zusätzliche Werkzeuge) |
| P15 | Aseprite-Durchgang über die eingebauten Hintergründe, danach Gesamtprüfung | Sebastian: Aseprite kaufen, MCP einrichten. Claude: jede Änderung aus dem Abschnitt „Nacharbeiten an eingebauten Hintergründen“ unten prüfen und in Aseprite sauber nacharbeiten. Danach eine Gesamtprüfung über Grafik, Spielbarkeit, Optimierungen und Animationen (Sebastian will sie mit einem anderen Modell laufen lassen) | `grafik/00-stil-und-werkzeuge.md` (Ablauf), `grafik/welt-1.md` (Abweichungen) |
| P16 | Lebendige Hintergründe (Sebastian, 13. November 2026): kleine Bewegungen im Bild, damit Räume nicht wie Standbilder wirken | Stand 13. November 2026: Ebene gebaut (`skripte/objekte/cq_ambiente.gd`, angelegt von `CQRaum.ambiente_starten()`, Eintrag `ambiente:` im Layout mit `bereich` je Baustein; im Testmodus nur auf Abruf). Erster Raum Dorfplatz mit Vogelschwarm (3 bis 6 Vögel, zwei Flügelbilder) und Windstoß mit 10 bis 16 Blättern (drei Drehstufen, fünf Herbst- und Grüntöne), gezeichnet aus Punkten der Palette. Offen: weitere Bausteine und Räume, Windgeräusch, in Aseprite echte Vogel- und Blatt-Sprites. Claude: eine allgemeine Ambiente-Ebene in `CQRaum`, je Raum im Layout eingetragen (`ambiente: [...]`), Auslöser zufällig alle 15 bis 45 Sekunden, nur Optik, kein Einfluss auf Rätsel. Bausteine: Vogelschwarm quer durchs Bild, Windstoß mit Blättern oder Blüten, Glühwürmchen, Staubflocken im Lichtstrahl, flackernde Glut und Fackeln, Glitzern auf Wasser, Dampf und Blasen am Kessel, Rauch. Vorschlag je Raum: Dorfplatz Vögel und Blätter; Troll-Brücke Vögel, Bach-Glitzern, Blüten; Wasserschloss Glitzern, Vögel; Zauberwald Glühwürmchen, Lichtstrahl-Staub, Leuchtpilz-Pulsieren; Taverne und Schmiede Feuerflackern, Funken; Klassenzimmer Kesselblasen, Staub im Fensterlicht; Zauberstab-Laden Staub; Bergwerk Fackeln, rieselnder Staub; Prolog-Räume Staub im Licht, Dachboden-Uhr | `05-spielsysteme.md`, `grafik/00-stil-und-werkzeuge.md` |
| P13 | Fertige Musik als Ergänzung (Humble-Bundle „The Complete Works“) | Sebastian prüft vor dem Kauf Lizenz (verkauftes Spiel erlaubt?) und Schleifen-Eignung | `04-audio.md` (Werkzeuge) |

## Nacharbeiten an eingebauten Hintergründen (P15)

Jede Änderung, die nach dem Gemini-Bild von Hand oder per Skript gemacht wurde, damit sie später geprüft und in Aseprite sauber nachgearbeitet werden kann. Koordinaten in Spielpixeln (640×360), Rechteck = x, y, Breite, Höhe. Originale in voller Größe: `E:\Game Engine\Grafiken\assets\welt-1\` auf Sebastians PC. Umgerechnet wurde immer mit `tools/pixelieren.py` (32 Farben); „nachgefärbt“ heißt: Pixel, deren Farbe im Original weit von den 32 Farben abwich, bekamen bis zu acht zusätzliche Farben aus dem Original (Skript `nachfaerben.py`, nicht im Repo). Weitere Funde je Raum hier anhängen.

| Raum, Datei | Änderung | Wie gemacht | Prüfen und nacharbeiten |
| --- | --- | --- | --- |
| Troll-Brücke, `w1_bg_trollbruecke_v01.png` | Grundlage: Sebastians vierte Gemini-Fassung (`trollbruecke_sebastian_v4.jpeg`) | Gemini-Chat, vier Runden | – |
| Troll-Brücke | Grammophon und Notenblätter nachgefärbt, Bereich 250, 212 bis 288, 266 | Skript, 6 Zusatzfarben | Grammophon sauber nachzeichnen, goldenes Horn deutlich |
| Troll-Brücke | Wasserschloss rosa nachgezeichnet, Bereich 428, 124 bis 448, 140 | Skript, Umriss aus dem Original, 4 Rosatöne | Form des Schlosses von Hand verbessern |
| Troll-Brücke | Waldemar steht als Platzhalter rechts der Brücke (440, 275) | Layout | Mit echtem Sprite prüfen, ob er Rampe oder Schloss verdeckt |
| Klassenzimmer, `w1_bg_klassenzimmer_v01.png` | Grundlage: Sebastians Fassung mit Kessel unter dem Fenster und Bänken vor der Tafel (`klassenzimmer_sebastian_v7.png`, aus dem Chat-Bild „Unterricht5“ mit drei Fenstern) | Gemini-Chat, sechs Runden (Aufteilung, Seiten tauschen, Regal leeren, Neuaufteilung, zwei Fenster dazu) | – |
| Klassenzimmer | Sechs Flaschen eingesetzt (stehen vor dem rechten Fenster): Kopien von Flasche 1 (klein, Plätze 1, 3, 4, 6) und Flasche 2 (groß, Plätze 2, 5) aus der Fassung „Unterricht2“; im Spiel 402, 94 bis 506, 141 | Skript, Freistellen über die grüne Wand | Ränder der Flaschen, fehlender Schatten auf der Wand; große Flaschen sind 1,5-mal statt doppelt so hoch |
| Klassenzimmer | Feuer, Blasen und Trank am Kessel nachgefärbt, Bereich 150, 100 bis 240, 240 | Skript, 5 Zusatzfarben | Trank grüner machen, Blasen klarer |
| Klassenzimmer | Flasche 3 ist noch im Hintergrund gemalt | – | Als eigenes Sprite ausschneiden und im Hintergrund übermalen (Max nimmt sie) |
| Klassenzimmer | Socke fehlt auf dem Hocker (388, 192) | – | Deko-Sprite Socke |
| Zauberwald, `w1_bg_zauberwald_v01.png` | Breitbild 1066×360: rechts Sebastians erste Fassung (`zauberwald_sebastian_v1.jpeg`), links ein tieferer Waldteil (`zauberwald_sebastian_links_v2.jpeg`), zusammengesetzt als `zauberwald_breit_v2.png` | Gemini-Chat: Vorlage mit grauer Fläche ergänzen lassen, dann Boden freigeräumt; Naht um 8 Pixel ausgerichtet, 60 Pixel weich überblendet | Naht im dicken Baum prüfen (Spielpixel um x 421) |
| Zauberwald | Dicker Baum auf der Naht als Vordergrund-Prop `grafik/props/alter_baum.png` (340, 0, 150, 360), Umriss als Vieleck freigestellt, Baseline am unteren Rand | Skript | Umriss sauber freistellen; prüfen, ob Max dahinter natürlich verschwindet |
| Zauberwald | Weggabelung hinter dem dicken Baum (alter Weg zur Brücke) entfernt: Sebastian hat den linken Waldteil in Gemini ohne die Abzweigung neu machen lassen (`zauberwald_sebastian_links_v4.jpeg`); Naht jetzt bei Spielpixel x 609, rechts der Riesenpilze, 60 Pixel überblendet (`zauberwald_breit_v2.png`) | Gemini-Chat | Naht neben den Riesenpilzen prüfen |
| Zauberwald | Riesenpilze nachgefärbt, Bereich 479, 70 bis 639, 262 | Skript, 8 Zusatzfarben | Hüte bunter, besonders rosa und violett |
| Zauberwald | Leuchtpilze nachgefärbt, Bereich 499, 200 bis 639, 262 | Skript, 4 Zusatzfarben | Leuchten und Schein |
| Zauberwald | Lieferkarren und Ketchup nachgefärbt, Bereich 809, 175 bis 894, 250 | Skript, 4 Zusatzfarben | Rot des Karrens |
| Zauberwald | Ketchup ausgeschnitten als `grafik/props/ketchup.png` (841, 209, 11, 30); Stelle mit dem Karrenstück 12 Pixel links daneben überdeckt | Skript, rechteckig ohne Freistellen | Sprite freistellen, übermalte Karrenseite prüfen |
| Zauberwald | Leuchtpilz ausgeschnitten als `grafik/props/leuchtpilz.png` (580, 226, 16, 25); Stelle mit dem Stück 16 Pixel links daneben überdeckt | Skript, rechteckig ohne Freistellen | Sprite freistellen, übermalte Stelle prüfen |
| Zauberwald | Niesrosen fehlen in der Lichtung (674, 212, 80, 40) | Platz frei gelassen | Sprites geschlossen und offen |
| Zauberwald | Raum hat 47 statt 32 Farben; Waldemars Platz bei Rätsel 7 im Raumskript auf (824, 300) verschoben | Folge des Nachfärbens und der Verbreiterung | Palette angleichen |
| Alle breiten Räume | Kamera zeigte links graue Fläche und erreichte das rechte Drittel nie (Popochiu rechnet Räume mittig um den Bildschirm); behoben in `skripte/objekte/cq_raum.gd` (setup_camera) | Code | Dorfplatz und Agora mit allen Ausgängen durchlaufen |
| Wasserschloss, `w1_bg_wasserschloss_v01.png` | Grundlage: Sebastians erste Fassung (`wasserschloss_sebastian_v1.jpeg`), ohne Nachfärben | Gemini-Chat, eine Runde | Max auf dem Steg ist größer als das Tor (Tiefe 0.45): Größenverhältnis prüfen; Schwan noch Platzhalter im Wasser |
| Goblin-Bergwerk, `w1_bg_bergwerk_v01.png` | Breitbild 1280×360 aus Sebastians Fassung mit geschlossener Rune-Tür (`bergwerk_sebastian_zu_v1.jpeg`), ohne Nachfärben | Gemini-Chat, zwei Runden (Bild, Tür schließen) | Fackelflammen sind nach dem Umrechnen klein und blass; Raum insgesamt dunkel |
| Goblin-Bergwerk | Offene Rune-Tür als Prop `grafik/props/rune_tuer_offen.png` (1070, 80, 100, 160) aus der offenen Fassung (`bergwerk_sebastian_offen_v1.jpeg`), rechteckig ausgeschnitten; `room_bergwerk.gd` blendet sie nach Rätsel 10 ein | Skript | Ränder freistellen (violett getöntes Felsstück am Rand), violetten Lichtschein auf dem Boden ergänzen |
| Gegenstände Welt 1 | Fläschchen (klein und groß) als Inventarbilder `grafik/gegenstaende/flasche_klein.png` und `flasche_gross.png` aus den Flaschen-Kopien im Klassenzimmer; Ei als Inventarbild und Szenenbild (`grafik/props/ei.png`, Korb in der Taverne) aus Sebastians Ei-Bogen | `tools/figur.py gegenstaende` | Fläschchen heben sich im Inventar wenig vom dunklen Grund ab; Größe des Eis im Korb prüfen |
| Nahansicht Märchen-Satzung, `grafik/nahansichten/maerchen_satzung.png` | Leeres Schild aus Sebastians Gemini-Fassung (Gravuren in zweiter Runde entfernt), Satzungstext per Skript in Pixelify Sans als eingeschnitzte Schrift (dunkler Schnitt, helle Kante); `tools/godot_raeume.py` nimmt jetzt echte Nahansichten aus `grafik/nahansichten/` | Gemini-Chat, zwei Runden; Skript | Schrift von Hand nachschnitzen (Zeilen liegen teils auf Brettfugen, „§“ sieht in der Schrift wie „&“ aus); englische Fassung fehlt |
| Figuren Humbert, Gollo, Zauberstabmacher, Minka | Aus Sebastians Figurenblättern; Reste von Max' Vorlageblatt (Köpfe, Beine, Schuhe) vorher übermalt, Bodenlinie abgeschnitten; Sprite mit `tools/figur.py sprite`, Splitter entfernt, Lücke zwischen Humberts Beinen freigestellt | Skript | Atmen und Reden per Rig (`tools/figuren/<id>_rig.json`, Kopfnicken ohne Mundbewegung); Gehen zeigt vorerst das Atmen; Mund, Gehen und Szenen-Animationen im Aseprite-Durchgang; Gollo steht in der Taverne auf (375, 300) |
| Goblin-Bergwerk | Stumme Streik-Goblins (Sebastian, 13. November 2026): Streik-Goblin 1 liegt als `grafik/props/streik_goblin_1.png` bereit, 2 und 3 fehlen noch; einbauen als Deko links und rechts von Grimmzahn an der Streikposten-Linie, gemeinsame Klickfläche „Streikende Goblins“ | – | Einbauen, sobald alle drei da sind |
| Dachboden, `w0_bg_dachboden_v03.png` | Zapp-O-Mat wirkt, als schwebe er (Sebastian, 13. November 2026), obwohl am 12. November ein Schatten unter den Fernseher gesetzt wurde | Skript (Schatten), Sprite `grafik/props/zapp_o_mat.png` mit sieben Zuständen | Füße oder Standfläche und Schatten auf den Boden |
| Dachboden | Zapp-O-Mat und Dosenöffner farblich an den Raum angeglichen (Sebastian, 12. November 2026: stachen heraus) | Skript | Farben prüfen; Dosenöffner soll nicht herausstechen |
| Dachboden | Aussparung im Laufbereich, wo Pixel schläft (218 bis 302 × 262 bis 284) | Layout | Mit fertigem Schlaf-Sprite prüfen |
| Wohnzimmer, `w0_bg_wohnzimmer_v03.png` | Staubrand der Fernbedienung als heller Fleck auf den Couchtisch gemalt | Von Hand per Skript | Fleck sauber zeichnen |
| Treppenhaus, `w0_bg_treppenhaus_v02.png` | Laufweg nur auf den Stufenkanten, weil Max über der Treppe schwebte (Sebastian, 12. November 2026) | Layout | Auf jeder Stufe prüfen, ob die Füße aufsetzen |
| Treppenhaus | Thunfischdose liegt im offenen Karton unter der Treppe (vorher in Opas Mantel, war zu auffällig) | Sprite im Karton | Dose soll halb verdeckt und unauffällig sein |
| Prolog, Figuren | Opa: Schuhe ergänzt, weil die Füße im Boden einzusinken schienen (Sebastian, 12. November 2026); hellgraue Kanten am Saum umgefärbt | Skript am Sprite | Fußpunkt und Schuhe in allen Räumen prüfen |
| Prolog, Figuren | Max: Augen der Seitenansicht mit Weiß statt dunklem Balken; Standbild ohne Bodenstrich | Skript am Sprite | Augen in allen Bildern prüfen |
| Prolog, Gegenstände | Drahtkleiderbügel gezeichnet (fehlte ganz) | Skript | Form und Farbe prüfen |
| Dorfplatz, `w1_bg_dorfplatz_v03.png` | Dritte Fassung: Bohnenranke entfernt (kommt in Rätsel 8 als Sprite), Steckbrief ohne Schrift, Läden an den Rand vor eine Mauer, Weg nach Hoggelwarz zwischen den Läden | Gemini-Chat, drei Runden | Weg nach Hoggelwarz auf Durchgängigkeit prüfen (Sebastian: „den Weg nochmal optimieren“) |
| Dorfplatz | Läden hinten nur halb so groß wie Max; ausgeglichen über starke Tiefe 0.4 | Layout | Größenverhältnis Max zu Ladentüren prüfen |
| Dorfplatz | Eimer, Bestellzettel und Steckbrief als eigene Sprites ausgeschnitten | Skript | Freistellen und übermalte Stellen prüfen |
| Taverne, `w1_bg_taverne_v01.png` | Ziegenfell-Vorleger als eigenes Sprite ausgeschnitten | Skript | Übermalte Stelle prüfen |
| Taverne | Laute mit Münzbecher und Drachen-Steckbrief nachträglich eingesetzt (aus einem eigenen Gegenstandsbogen) | Skript | Größe, Licht und Schatten an den Raum angleichen |
| Taverne | Schwert „Gerhard“ und Vielsaft-Limo sind Bonus-Gags | – | Prüfen, ob beide im Bild sichtbar sind |
| Zauberstab-Laden, `w1_bg_zauberstabladen_v01.png` | Raum deutlich dunkler als die anderen, als „gewollt dunkel“ markiert | – | Helligkeit gegen die anderen Räume prüfen (`tools/stimmigkeit.py`) |
| Zauberstab-Laden | Lila Kissen erhalten (wäre beim Umrechnen grau geworden); Kochlöffel, Zollstock, Zahnstocher als eigene Sprites | Skript | Kissenfarbe, Sprites freistellen |
| Schmiede, `w1_bg_schmiede_v01.png` | Krug fehlte im Bild, aus dem Gegenstandsbogen unter die Pfannen gesetzt | Skript | Größe, Licht und Schatten an den Raum angleichen |

### Animationen (komplett prüfen und überarbeiten)

Sebastian will alle Animationen im Aseprite-Durchgang vollständig prüfen und überarbeiten lassen (13. November 2026). Bisher entstehen sie per Code aus Standbildern (`tools/figur.py`) oder fehlen:

Grundsatz für das Review (Sebastian, 13. November 2026): Gehen bekommen nur Figuren, die im Spiel wirklich laufen. Für jede Figur neu überlegen, welche Bewegungen zu ihr passen, auch kleine Eigenheiten im Stand, zum Beispiel dreht die Schmiede-Ziege ab und zu eine Runde.

| Figur oder Objekt | Stand | Überarbeiten |
| --- | --- | --- |
| Max | Stehen: Atmen per Rig (nur Oberkörper und Kopf); Sprechen: Mund auf und Kopfnicken; Gehen: per Code aus dem Standbild (Ober-, Unterschenkel, Fuß, hinteres Bein als Kopie) | Gang flüssiger, Mundbewegung, Wenden |
| Opa | Ein Standbild für alle Bewegungen, Atmen und Reden per Rig, Gehen per Code | Eigene Posen, Gang |
| Pixel | Sitzen, Schlafpose, Gehen auf vier Beinen per Code (Stand- und Schwungphase); Aufstehen nur als Überblendung, weil eine Aufsteh-Animation fehlt (Sebastian, 12. November 2026) | Aufstehen und Hinlegen als echte Animation, Gang prüfen |
| Lippen | Mund bewegt sich nur so lange, wie der Satz geschätzt dauert; mit Aufnahmen nach deren Länge | Mit Vertonung abgleichen |
| Zapp-O-Mat | Sieben Zustände als Bildreihe | Übergänge prüfen |
| Humbert, Gollo, Zauberstabmacher, Minka, Toadi, Alwin, Schmied, Rotkäppchen, Waldemar, Grimmzahn, Goblin 1 und 2 | Atmen (4 Bilder) und Reden mit Kopfnicken (4 Bilder) per Rig aus dem Standbild; Gehen = Atmen | Mund beim Reden, echtes Gehen (Humbert in den Keller), Szenen-Animationen |
| Huhn, Schwan, Schmiede-Ziege, XXL-Ziege, Pixel als Ziege | Atmen per Rig, Reden als Kopfwippen um einen Pixel (Drehen gab bei Tieren Nähte); Gehen = Atmen; Pixel im Ziegenfell lädt jetzt sein eigenes Bild (`welt_1.gd`, `CQFigur.grafik_laden(variante)`) | Gehen auf vier Beinen für die Ziegen und Pixel als Ziege; das Huhn sitzt mit eigenem Korb, der Korb im Taverne-Hintergrund ist doppelt |
| Übrige Figuren (Welt 1 bis 4) | Noch Platzhalter; jede neue Figur bekommt beim Einbau dasselbe Grundpaket (Atmen, Reden) | Animationen von Grund auf |

## Automatisierung

Alle sechzehn Ideen sind in `03-produktion.md` (Abschnitt Automatisierung) mit Nutzen, Aufwand und Stufe beschrieben. Hier stehen nur die, an denen noch etwas offen ist. Erledigt und deshalb gestrichen: A13 (`tools/pruefen.py`), A14 (`tools/spieldaten.py`) und A16 (`game/tests/bildschirm_vergleich.gd`). Die Dokument-Prüfung deckt auch den Dokument-Teil von A2 ab.

| Nr. | Was | Stufe |
| --- | --- | --- |
| A1 | Skript-Pipeline: Skript-Tabelle, Prüfskript, Godot-Übersetzungs-CSV, Zeilen-ID-Liste für Audio | 1 |
| A2 | Prüfregeln für Export-CSV und Code (Dokument-Teil läuft) | 1 |
| A3 | Godot headless: automatischer Rätsel-Durchlauf und Schalterprüfung | Machbarkeit 1, vollständig 2 |
| A4 | Speichern/Laden-Test und Rundreise-Test | 1 |
| A5 | Parallele Claude-Agenten je Raum | 4 |
| A6 | Audio-Pipeline mit ElevenLabs-API und Audacity-Batch | Technik 2, Vollvertonung 5 |
| A7 | GitHub Actions: Prüfskript, Export, Rätsel-Test, Build | 1 |
| A8 | Web-Export für Testspieler: gebaut. Vorlage „Web Testbuild“ in `game/export_presets.cfg` (ohne Threads, also ohne SharedArrayBuffer-Header), der Workflow „Testbuild“ liefert ihn als drittes Artefakt, im Browser lädt der Telemetrie-Knopf das Protokoll als Datei herunter. In Chromium geprüft: Zustimmung, Epilepsie-Hinweis, Menü und Prolog-Start laufen; am 11. November 2026 auch Pausemenü und „Hauptmenü“ (die Seite lädt neu, der Spielstand bleibt). Offen: einmal an einem echten Bildschirm mit Ton durchspielen, privat auf itch.io hochladen | gebaut, Rest 2 |
| A9 | Telemetrie im Testbuild: gebaut (Protokoll, Zustimmung, Auswertung, Beobachtungsbogen, Testbuild-Workflow; Stand in `03-produktion.md`). Offen: Testbuild einmal am Bildschirm unter Linux und Windows prüfen (Zustimmungsdialog, Einstellungen, Mauszeiger, da Popochiu im Export Fehler in seinen Editor-Skripten meldet), Upload an einen eigenen Dienst statt Datei per Hand | gebaut, Rest 2 |
| A10 | Grafik-Batch: Prompt-Tabelle, Retro-Diffusion-API, Palettize, Zuschnitt, Protokoll | 3, nach S16 |
| A11 | KI-Protokoll automatisch als CSV | 1 |
| A12 | Englische Fassung per Claude aus der CSV mit Glossar: Werkzeug `tools/en_eintragen.py`, alle Skriptzeilen, Systemzeilen und Menüs sind übersetzt und am 11. November 2026 einmal ganz gelesen und vereinheitlicht (Stand in `05-spielsysteme.md`). Offen: Prüfung der Witze und Wortspiele durch einen Muttersprachler | Text fertig, Prüfung in 5 |
| A15 | Playtest-Auswertung per Claude | 3 |

## Funde aus der Graubox (9. November 2026)

Beim Bau der Graubox (Prolog, dann Welt 1 bis Rätsel 4, dann bis Rätsel 13 und Zwischenspiel 1) fielen Lücken in den Regeln auf. Die Graubox setzt sie vorläufig wie angegeben um; entschieden und in die Besitzer-Datei eingetragen werden sie, sobald der Raum über die Graubox hinaus gebaut wird. G1 bis G8 sind entschieden und eingetragen.

Am 9. November 2026 gegen Spielablauf, Ton und Bedienung geprüft und eingetragen: G9 (eigene Wartezeile 9995 je Welt, auch W2 und W3), G10 (Käse auf den Löffel nur im Laden, sonst W1\_STAB\_MAX\_0600), G11, G12, G13 (0930 am Bach, neu W1\_BRUE\_WAL\_1070 für den Eimer am Bach), G14, G15, G16 (sprechende Dinge mit Blase über dem Objekt), G19 (Zeugnis: Szene 0830, im Inventar 0890, dann 0860), G20 (Passwort Teil für Teil in der Dialogauswahl), G22 (eigene Zeilen W1\_WALD\_MAX\_0730, W1\_HOGG\_MAX\_0930/0940), G23 (alle drei Kreuzungen mit 0080/0085), G24 und G25 (Zeldina 0620 und Moderwort 0630 in der Schlussszene). Eingetragen in `05-spielsysteme.md` (Zeilenarten, UI, Hinweissystem), `raetsel/prolog-und-welt-1.md` (Rätsel 2, 3, 7, 11), `skript/welt-1.md` bis `welt-3.md` und `uebersetzung/ui.csv`.

Am 10. November 2026 abgeschlossen: G17 (Pixel sitzt in der Taverne wieder auf dem Dachbalken, sobald Max dort spielt oder Pixel den Balken benutzt; dann kommt auch Zuruf 1630), G18 (bleibt so: Zeilen-IDs sind feste Schlüssel für Übersetzung und Audio, Lücken in den Zehnerschritten sind erlaubt und nur eine Prüfwarnung) und G21 (der Generator liest den Zustand jetzt auch außerhalb des Inventars, „Ansehen: Tarifvertrag, unterschrieben“; Bach 0930, Kreuzung 2 und 3 und Abstellkammer 1 bleiben handgeschrieben, `tools/abdeckung.py` stellt sicher, dass jede Zeile im Spiel vorkommt). Damit sind alle G-Punkte entschieden.

## Funde aus der Durchsicht aller Welten (10. November 2026)

Das ganze Spiel lief noch einmal durch: Prolog bis Finale im Testmodus, dazu ein Abgleich, welche Skriptzeilen das Spiel nie abspielt. Behoben und im Code oder Skript eingetragen sind:

- Welt 3 blieb nach dem Abschluss am Übergang zum Dachboden hängen, weil Popochiu einen Raumwechsel verschluckt, solange der vorige noch läuft. Das hätte auch im echten Spiel zugeschlagen. Verkettete Raumwechsel gehen jetzt über `Spiel.raum_wechseln_und_warten` (Entscheidung).
- Die vier Nahansichten in Welt 3 (Telefonbuchseite, Schmidts Akte, Kochbuch, Kritzelei) öffneten sich nie. Damit war auch die Errungenschaft für alle Nahansichten nicht zu schaffen.
- Viele Zeilen kamen im Spiel nie vor: Erstgespräche (Deckert, Herr Vier, Schmidt, Hausmeister, Kalle), M.U.T.T.I.s Kammer-Kommentare, Pixels Schnupper- und Hungerzeilen in Welt 4, der Gong im Rauschen, die Bonus-Pause bei Gerd, Zeldinas Ofen und die Luke des Roboters im Finale. Alle sind eingebaut. Übrig sind nur Reservezeilen, die im Skript als „Reserve, kommt nicht vor“ markiert sind (FI\_INV 0010 bis 0045, ZS3\_DACH\_PIX\_0550).
- Die Einstiegszeile des FBI-Agenten kam vor seiner Vorstellung, und Schmidts Einstieg in Welt 3 hatte eine falsche Bedingung.
- Dialogoptionen in Welt 2 bis 4 endeten oft nach einer einzigen Antwortzeile. 151 neue Zeilen geben ihnen einen Nachsatz oder eine Rückfrage. Was noch einzeilig ist, sind Abschiede. Danach bekamen auch Welt 1, Prolog und Finale 52 solche Zeilen.
- Welt 2 und Welt 3 haben jetzt eigene Headless-Tests (`welt_2_anspiel`, `welt_3_anspiel`), die auch in GitHub Actions laufen.

Am selben Tag erledigt: G28 (Pixels Zeilen auf Herrn Vier und den weinenden Mann finden ihre Figur in der Straße über einen Alias), G29 (der Generator akzeptiert den Namen eines späteren Zustands, „Kochlöffel-Zauberstab“), G30 (Nehmen an einem Hotspot, das die Rätsel-Logik spielt, gilt nicht mehr als fehlendes Prop). G27 ist entschieden: Reaktionen „Gegenstand auf Ziel“ aus Regie-Tabellen bleiben von Hand im Code, und `tools/abdeckung.py` meldet in GitHub Actions jede Zeile, die dabei verloren geht (`entscheidungen.md`).
