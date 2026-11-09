# Offene Punkte

Hier steht nur, was noch offen ist. Erledigtes steht in der Git-Historie, die gültigen Entscheidungen mit Begründung in `entscheidungen.md`. Ist ein Punkt erledigt, wird er hier gestrichen und, falls er etwas entscheidet, in `entscheidungen.md` und der Besitzer-Datei eingetragen.

Stand 9. November 2026. Kennungen: S = zurückgestellte Punkte aus Gutachten 4, A = Automatisierung, P = weitere Punkte, K = Abgleich zwischen Dateien.

## Entscheidungen und Aufgaben von Sebastian

| Nr. | Was offen ist | Wer, was zu tun ist | Besitzer-Datei |
| --- | --- | --- | --- |
| S6 | Feste Termine für Stufen, Steam-Seite und Demo | Sebastian legt das Startdatum fest, dann werden die Termine aus der Schätzung (20 Prozent Puffer) fest eingetragen | `03-produktion.md` (Puffer und Termin) |
| S7 | Gewerbe und Steuer | Sebastian, vor der Steam-Seite: Gewerbe anmelden, Steuernummer, Steuerberater-Erstgespräch (Kleinunternehmerregelung, Steam-Steuerinterview) | `03-produktion.md` (Rechtliches) |
| S10 | Registersuche zum Titel „Couch Quest“ in DPMAregister und EUIPO eSearch (Klassen 9, 28, 41) | Sebastian sucht und schickt das Ergebnis; danach mit Datum eintragen | `03-produktion.md` (Rechtliches), `01-konzept.md` (Rechtscheck) |
| P1 | Anwaltsstunde für Figurenliste und Titel | Sebastian, vor der Veröffentlichung (Budget 200 bis 350 €) | `03-produktion.md` (Rechtliches, Kosten) |
| P2 | Schrift festlegen | Sebastian nach dem Umlaut-Test (Monogram Extended oder m5x7, OFL- bzw. CC0-Lizenz) | `05-spielsysteme.md` (Schrift) |
| P3 | Zwei-Klick-Steuerung bestätigen oder doch eine Verbenleiste | Sebastian nach dem ersten Test | `05-spielsysteme.md` (UI) |
| P4 | Vollvertonung oder Brabbel-Laute | Sebastian, spätestens zu Beginn von Stufe 5 (ab etwa 10.000 Wunschlisten Vollvertonung) | `03-produktion.md`, `04-audio.md` |
| P5 | Zeilenbudget der Welten: Die Skript-Entwürfe haben 879 (W1), 911 (W2), 873 (W3) und 884 (W4) Zeilen, Budget 700 bis 850. Mit der Prolog-Datei (174 Zeilen: 124 Prolog-Zeilen P0, Budget 170, und 50 Ersatzzeilen SYS\_ERS, die zum Posten Menüs und Systemtexte zählen), den Zwischenspielen (168, Budget 170) und dem Finale (276, Budget 280) sind es insgesamt 4.165 Zeilen statt 3.000 bis 4.000 (ID-Zeilen je Skript-Datei gezählt am 9. November 2026). Prolog, Zwischenspiele und Finale liegen im Budget | Sebastian: beim Kürzen (Ablauf pro Raum, Schritt 3) auf das Budget bringen oder das Budget anheben; danach `05-spielsysteme.md` (Umfang) und `04-audio.md` (Umfang Sprachausgabe) angleichen | `05-spielsysteme.md` (Umfang) |

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
| S15 | Neues Dachboden-Konzeptbild in Seitenansicht | Sebastian erzeugt es mit dem neuen Prompt (Konzept und Retro Diffusion) | `grafik/02-prolog-und-finale.md` |
| S16 | Erstes Sprite-Paar Max und Pixel mit Silhouetten-Test | Sebastian: beide erzeugen, von Hand nachziehen, als schwarze Umrisse auf hellem und dunklem Grund prüfen; danach Freigabe für alle Figuren und für A10 | `grafik/01-max-und-pixel.md` |
| S17 | UI-Mockup 320×180 | Bildschirmaufbau einmal zeichnen (Dachboden, Inventarleiste, Sprechblase mit drei Zeilen, Dialogauswahl), Sebastian gibt frei | `05-spielsysteme.md` (Bildschirmaufbau) |
| S18 | Hörtest des Goblin-Lieds | Sobald das Lied erzeugt ist: Ist der Passwort-Teil verständlich? Untertitel sind schon fest eingeplant | `04-audio.md` |
| P7 | Retro Diffusion vor dem ersten Auftrag prüfen | Sebastian: Modellnamen und Stil-Liste auf der Website prüfen und mit Datum ins KI-Protokoll; die lokale Version vorher auf der Radeon 7900 XT mit der Demo testen | `grafik/00-stil-und-werkzeuge.md`, `03-produktion.md` (System 2) |
| P8 | Bildschirm-Einblendungen des Zapp-O-Mat (80×60, im Spiel etwa 40×30): Sind Gesichter lesbar? | Test in Godot; sonst die 80×60-Fassung auch beim Ansehen nutzen | `grafik/02-prolog-und-finale.md` |
| P9 | Wartezeiten der Hinweise (30 und 60 Sekunden) | Nach dem ersten Test mit Fremden anpassen | `05-spielsysteme.md` (Hinweissystem) |
| P10 | Gemeinsames Zustandssystem: dieselben Schalter wie Speichern und Hinweise? | Claude prüft es im Grundgerüst (Stufe 1) | `05-spielsysteme.md`, `03-produktion.md` (System 1) |
| P11 | Godot 4.7.x und Popochiu 2.2.x auf Fehlerkorrekturen prüfen | Claude beim Projektstart | `03-produktion.md` (System 1) |

## Automatisierung

Alle sechzehn Ideen sind in `03-produktion.md` (Abschnitt Automatisierung) mit Nutzen, Aufwand und Stufe beschrieben. Offen ist ihr Bau. Die Dokument-Prüfung `tools/pruefen.py` deckt A13 und den Dokument-Teil von A2 schon ab.

| Nr. | Was | Stufe |
| --- | --- | --- |
| A1 | Skript-Pipeline: Skript-Tabelle, Prüfskript, Godot-Übersetzungs-CSV, Zeilen-ID-Liste für Audio | 1 |
| A2 | Prüfregeln für Export-CSV und Code (Dokument-Teil läuft) | 1 |
| A3 | Godot headless: automatischer Rätsel-Durchlauf und Schalterprüfung | Machbarkeit 1, vollständig 2 |
| A4 | Speichern/Laden-Test und Rundreise-Test | 1 |
| A5 | Parallele Claude-Agenten je Raum | 4 |
| A6 | Audio-Pipeline mit ElevenLabs-API und Audacity-Batch | Technik 2, Vollvertonung 5 |
| A7 | GitHub Actions: Prüfskript, Export, Rätsel-Test, Build | 1 |
| A8 | Web-Export für Testspieler | 2 |
| A9 | Telemetrie im Testbuild | 2 |
| A10 | Grafik-Batch: Prompt-Tabelle, Retro-Diffusion-API, Palettize, Zuschnitt, Protokoll | 3, nach S16 |
| A11 | KI-Protokoll automatisch als CSV | 1 |
| A12 | Englische Fassung per Claude aus der CSV mit Glossar | Technik früh, Inhalt 5 |
| A13 | Konsistenz-Check der Dokumente (läuft als `tools/pruefen.py`, in A7 eingebunden) | erledigt |
| A14 | Hinweis-Datei aus Skript und Rätseltabelle erzeugen (läuft als `tools/spieldaten.py`) | erledigt |
| A15 | Playtest-Auswertung per Claude | 3 |
| A16 | Screenshot-Regressionstest headless | 4 |

## Funde aus der Graubox (9. November 2026)

Beim Bau der Graubox (Prolog, dann Welt 1 bis Rätsel 4, dann bis Rätsel 13 und Zwischenspiel 1) fielen Lücken in den Regeln auf. Die Graubox setzt sie vorläufig wie angegeben um; entschieden und in die Besitzer-Datei eingetragen werden sie, sobald der Raum über die Graubox hinaus gebaut wird. G1 bis G8 sind entschieden und eingetragen.

| Nr. | Was offen ist | Vorläufige Umsetzung | Besitzer-Datei |
| --- | --- | --- | --- |
| G9 | Welt 1 hat keine eigene Wartezeile der Hilfe-Pfote (Prolog: P0\_HINT\_PIX\_9995) | die Prolog-Zeile 9995; vorläufig umgesetzt (Commit COMMIT): eigene Zeile W1\_HINT\_PIX\_9995 im Skript | `skript/welt-1.md` (Abschnitt 16) |
| G10 | Rätsel 2 außerhalb des Zauberstab-Ladens: Käse auf den Löffel geht im Inventar überall, die Socke gibt aber der Stabmacher | Lösung überall; die Stabmacher-Zeilen (0510–0530) nur im Laden, die Socke immer | `raetsel/prolog-und-welt-1.md` (Rätsel 2) |
| G11 | Figuren, deren Gespräch zu Rätseln ab R5 gehört (Alwin, Grimmzahn, Rotkäppchen), im Vertical Slice | Alwin sagt 0060 bzw. 0070, danach und bei Grimmzahn und Rotkäppchen die Meldung `UI_WELT_1_ENDE`; vorläufig umgesetzt (Commit COMMIT): mit dem Ausbau bis R13 führen alle drei ihr Gespräch, die Meldung kommt nur noch am Drehknopf in Zwischenspiel 1 | `03-produktion.md` (Vertical Slice) |
| G12 | Eimer mit Wasser auf Waldemar vor Rätsel 4b hat keine Zeile | Ersatzzeile; vorläufig umgesetzt (Commit COMMIT): eigene Zeile W1\_BRUE\_WAL\_1060 im Skript | `skript/welt-1.md` (Abschnitt 7) |
| G13 | „Benutzen: Waldemar; Bach“ (0930): Ein Klick auf Waldemar öffnet sein Gespräch | 0930 entfällt vorläufig, der Bach hat nur Ansehen | `skript/welt-1.md` (Abschnitt 7) |
| G14 | Pixel redet an der Brücke mit den Ziegen, bevor Max die Satzung vorgelesen hat | die allgemeinen Ziegisch-Zeilen (SCHM 0410/0420, DORF 0990/1000) | `skript/welt-1.md` (Abschnitt 7) |
| G15 | Wohin folgen die Ziegen? „bis zur Troll-Brücke“, aber auch in Taverne, Laden und Hoggelwarz? | in jeden Raum, bis R4c | `raetsel/prolog-und-welt-1.md` (Rätsel 3) |
| G16 | Sprecher ohne Figur (Grammophon GRA, Brunnen BRU) | Systemtext unten im Bild | `05-spielsysteme.md` (Schreibregeln) |
| G17 | Zuruf-Bedingung „Pixel auf dem Balken“ (TAV 1630) ist nicht prüfbar, Pixel steht nach dem Wechsel neben Max | der Zuruf entfällt vorläufig | `skript/welt-1.md` (Abschnitt 3) |
| G18 | Prolog-Optionen 1362–1366 sind nicht in Zehnerschritten (nach dem Umzug in Baum 2b) | Prüfwarnung bleibt; beim nächsten Umnummern glätten | `skript/prolog.md` |
| G19 | Moderworts Zeugnis hat zwei „zweites Mal“-Zeilen (HOGG 0835 in der Nahansicht, 0860 im Inventar) | vorläufig umgesetzt (Commit COMMIT): 0860, die spätere Zeile gewinnt; 0835 kommt nicht | `skript/welt-1.md` (Abschnitt 5) |
| G20 | Auswahl ohne Gesprächsfigur: Wünsche am Brunnen (DORF 0730) und Passwort-Eingabe an der Geheimtür (SMAU 0710) haben keine festgelegte Oberfläche, die Reihenfolgen der Passwort-Teile stehen nirgends als Text | vorläufig umgesetzt (Commit COMMIT): Popochius Inline-Auswahl; Wünsche mit Max' Zeilen 0740/0790/0840 als Text, Passwort mit drei festen Reihenfolgen `UI_PASSWORT_W1_1` bis `_3` (die zweite falsche Wahl bringt 0750) | `05-spielsysteme.md` (UI), `uebersetzung/ui.csv` |
| G21 | Auslöser in Tabellen mit der Spalte „Regie“ liest der Generator nicht: Socke voller Pollen (WALD 0600/0605), Tarifvertrag unterschrieben (BERG 0710/0715), Brücke nach R4 (BRUE 1040/1045), Melken (SCHM 0430–0490), Brunnen ohne Münze (DORF 0710) u. a. | vorläufig umgesetzt (Commit COMMIT): Socke und Tarifvertrag von Hand im Gegenstandsskript, Benutzen- und Kombinationszeilen im Rätselcode; Brücke nach R4 fehlt | `skript/welt-1.md` (Tabellenkopf „Regie oder Auslöser“) |
| G22 | Nehmen ohne Zeile: Ketchup vor Rotkäppchens Erlaubnis, eine Flasche aus dem Regal | vorläufig umgesetzt (Commit COMMIT): Ersatzzeile bzw. stumm | `skript/welt-1.md` (Abschnitte 5 und 9) |
| G23 | Ansehen in Abstellkammer 1 (TURM 0310–0335) und an Kreuzung 2 und 3: Abstellkammer 1 hat keinen Skript-Code, „Kreuzung“ trifft nur Kreuzung 1 | vorläufig umgesetzt (Commit COMMIT): Abstellkammer 1 von Hand im Raumskript; Kreuzung 2 und 3 ohne Ansehen (Ersatzzeile) | `welten/welt-1.yaml` (skript\_code), `skript/welt-1.md` (Abschnitt 13) |
| G24 | Auslöser ohne Ort: Wann beginnt Waldemars Nummer nach Option 0290 („geht Richtung Wald“), wo steht er bis dahin? Wann erwischt ein Besen Max (TURM 0160)? Optionsbeschreibungen wie „Feilschen“, „richtig“ oder „Zauberwald betreten“ liest der Generator als Bedingung | vorläufig umgesetzt (Commit COMMIT): Nummer beim nächsten Betreten des Zauberwalds, Waldemar bleibt bis dahin an der Brücke; Besen trifft Max beim Benutzen eines Besens; die Optionstexte prüft `Spiel.bedingung_text_ok()` | `raetsel/prolog-und-welt-1.md` (Rätsel 7, 11), `skript/welt-1.md` |
| G25 | Zeilen nach dem Abschluss (THRO 0620 Zeldina, 0630 Moderwort) sind nicht erreichbar, weil 0610 direkt ins Zwischenspiel führt | vorläufig umgesetzt (Commit COMMIT): 0630 beim Reden nach R13, praktisch unerreichbar; 0620 entfällt | `skript/welt-1.md` (Abschnitt 15) |
| G26 | Zwischenspiel 1 hat keinen eigenen Bauplan: „Werkbank-Ablage“ und „Fundkiste“ sind keine Objekte des Dachbodens, der Figurenwechsel braucht einen Schalter (ZS1\_WECHSEL\_FREI?), Opa-Option 0380 und Reisetasche fehlen | vorläufig umgesetzt (Commit COMMIT): Ankunft und Abgabe des Eis; Ansehen 0310–0375 von Hand im Raumskript (Werkbank-Ablage = Werkbank), Fundkiste ohne Hotspot, kein Wechsel; Drehknopf meldet „Ende der Graubox“ | `tools/layout/` (Zwischenspiel-Bauplan), `skript/zwischenspiele-und-finale.md` |
