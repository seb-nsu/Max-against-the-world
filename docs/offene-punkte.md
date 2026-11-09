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

Beim Bau der Graubox (Prolog, dann Welt 1 bis Rätsel 4) fielen Lücken in den Regeln auf. Die Graubox setzt sie vorläufig wie angegeben um; entschieden und in die Besitzer-Datei eingetragen werden sie, sobald der Raum über die Graubox hinaus gebaut wird. G1 bis G8 sind entschieden und eingetragen.

| Nr. | Was offen ist | Vorläufige Umsetzung | Besitzer-Datei |
| --- | --- | --- | --- |
| G9 | Welt 1 hat keine eigene Wartezeile der Hilfe-Pfote (Prolog: P0\_HINT\_PIX\_9995) | die Prolog-Zeile 9995 | `skript/welt-1.md` (Abschnitt 16) |
| G10 | Rätsel 2 außerhalb des Zauberstab-Ladens: Käse auf den Löffel geht im Inventar überall, die Socke gibt aber der Stabmacher | Lösung überall; die Stabmacher-Zeilen (0510–0530) nur im Laden, die Socke immer | `raetsel/prolog-und-welt-1.md` (Rätsel 2) |
| G11 | Figuren, deren Gespräch zu Rätseln ab R5 gehört (Alwin, Grimmzahn, Rotkäppchen), im Vertical Slice | Alwin sagt 0060 bzw. 0070, danach und bei Grimmzahn und Rotkäppchen die Meldung `UI_WELT_1_ENDE` | `03-produktion.md` (Vertical Slice) |
| G12 | Eimer mit Wasser auf Waldemar vor Rätsel 4b hat keine Zeile | Ersatzzeile | `skript/welt-1.md` (Abschnitt 7) |
| G13 | „Benutzen: Waldemar; Bach“ (0930): Ein Klick auf Waldemar öffnet sein Gespräch | 0930 entfällt vorläufig, der Bach hat nur Ansehen | `skript/welt-1.md` (Abschnitt 7) |
| G14 | Pixel redet an der Brücke mit den Ziegen, bevor Max die Satzung vorgelesen hat | die allgemeinen Ziegisch-Zeilen (SCHM 0410/0420, DORF 0990/1000) | `skript/welt-1.md` (Abschnitt 7) |
| G15 | Wohin folgen die Ziegen? „bis zur Troll-Brücke“, aber auch in Taverne, Laden und Hoggelwarz? | in jeden Raum, bis R4c | `raetsel/prolog-und-welt-1.md` (Rätsel 3) |
| G16 | Sprecher ohne Figur (Grammophon GRA, Brunnen BRU) | Systemtext unten im Bild | `05-spielsysteme.md` (Schreibregeln) |
| G17 | Zuruf-Bedingung „Pixel auf dem Balken“ (TAV 1630) ist nicht prüfbar, Pixel steht nach dem Wechsel neben Max | der Zuruf entfällt vorläufig | `skript/welt-1.md` (Abschnitt 3) |
| G18 | Prolog-Optionen 1362–1366 sind nicht in Zehnerschritten (nach dem Umzug in Baum 2b) | Prüfwarnung bleibt; beim nächsten Umnummern glätten | `skript/prolog.md` |
