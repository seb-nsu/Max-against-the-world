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
| P2 | Grundauflösung 480×270 nach den ersten Testszenen noch einmal prüfen (Alternative 640×360) | Sebastian; ein Wechsel ist `python3 tools/aufloesung.py --umrechnen 480x270 640x360`, danach Platzhalter, Prüfung und Tests | `03-produktion.md` (Auflösung), `tools/aufloesung.py` |
| P3 | Zwei-Klick-Steuerung bestätigen oder doch eine Verbenleiste | Sebastian nach dem ersten Test | `05-spielsysteme.md` (UI) |
| P4 | Vollvertonung oder Brabbel-Laute | Sebastian, spätestens zu Beginn von Stufe 5 (ab etwa 10.000 Wunschlisten Vollvertonung) | `03-produktion.md`, `04-audio.md` |

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
| A9 | Telemetrie im Testbuild: gebaut (Protokoll, Zustimmung, Auswertung, Beobachtungsbogen, Testbuild-Workflow; Stand in `03-produktion.md`). Offen: Testbuild einmal am Bildschirm unter Linux und Windows prüfen (Zustimmungsdialog, Einstellungen, Mauszeiger, da Popochiu im Export Fehler in seinen Editor-Skripten meldet), Upload an einen eigenen Dienst statt Datei per Hand | gebaut, Rest 2 |
| A10 | Grafik-Batch: Prompt-Tabelle, Retro-Diffusion-API, Palettize, Zuschnitt, Protokoll | 3, nach S16 |
| A11 | KI-Protokoll automatisch als CSV | 1 |
| A12 | Englische Fassung per Claude aus der CSV mit Glossar | Technik früh, Inhalt 5 |
| A13 | Konsistenz-Check der Dokumente (läuft als `tools/pruefen.py`, in A7 eingebunden) | erledigt |
| A14 | Hinweis-Datei aus Skript und Rätseltabelle erzeugen (läuft als `tools/spieldaten.py`) | erledigt |
| A15 | Playtest-Auswertung per Claude | 3 |
| A16 | Screenshot-Regressionstest headless | 4 |

## Funde aus der Graubox (9. November 2026)

Beim Bau der Graubox (Prolog, dann Welt 1 bis Rätsel 4, dann bis Rätsel 13 und Zwischenspiel 1) fielen Lücken in den Regeln auf. Die Graubox setzt sie vorläufig wie angegeben um; entschieden und in die Besitzer-Datei eingetragen werden sie, sobald der Raum über die Graubox hinaus gebaut wird. G1 bis G8 sind entschieden und eingetragen.

Am 9. November 2026 gegen Spielablauf, Ton und Bedienung geprüft und eingetragen: G9 (eigene Wartezeile 9995 je Welt, auch W2 und W3), G10 (Käse auf den Löffel nur im Laden, sonst W1\_STAB\_MAX\_0600), G11, G12, G13 (0930 am Bach, neu W1\_BRUE\_WAL\_1070 für den Eimer am Bach), G14, G15, G16 (sprechende Dinge mit Blase über dem Objekt), G19 (Zeugnis: Szene 0830, im Inventar 0890, dann 0860), G20 (Passwort Teil für Teil in der Dialogauswahl), G22 (eigene Zeilen W1\_WALD\_MAX\_0730, W1\_HOGG\_MAX\_0930/0940), G23 (alle drei Kreuzungen mit 0080/0085), G24 und G25 (Zeldina 0620 und Moderwort 0630 in der Schlussszene). Eingetragen in `05-spielsysteme.md` (Zeilenarten, UI, Hinweissystem), `raetsel/prolog-und-welt-1.md` (Rätsel 2, 3, 7, 11), `skript/welt-1.md` bis `welt-3.md` und `uebersetzung/ui.csv`. Offen bleiben:

| Nr. | Was offen ist | Vorläufige Umsetzung | Besitzer-Datei |
| --- | --- | --- | --- |
| G17 | Zuruf-Bedingung „Pixel auf dem Balken“ (TAV 1630) ist nicht prüfbar, Pixel steht nach dem Wechsel neben Max | der Zuruf entfällt, bis Pixel in der Taverne einen eigenen Platz auf dem Balken bekommt (Grafik); die Taverne hat mit 1610 und 1620 trotzdem zwei Zurufe | `skript/welt-1.md` (Abschnitt 3) |
| G18 | Prolog-Optionen 1362–1366 sind nicht in Zehnerschritten (nach dem Umzug in Baum 2b) | Prüfwarnung bleibt; beim nächsten Umnummern glätten | `skript/prolog.md` |
| G21 | Der Generator liest „Ansehen:“-Zellen jetzt auch aus reinen Regie-Tabellen (Brücke nach R4, Socke voller Pollen, Opas Zettel kommen aus den Daten). „Benutzen:“-Zellen in Regie-Tabellen (z. B. Bach 0930) liest er nicht; Kreuzung 2 und 3 und Abstellkammer 1 brauchen eigene Raum-Codes oder Mehrfach-Aliase; der Tarifvertrag braucht im Skript den Zustand („Ansehen: Tarifvertrag, unterschrieben“) | von Hand im Raum- bzw. Gegenstandsskript, Verhalten wie im Skript | `skript/welt-1.md`, `tools/godot_raeume.py` |
| G26 | Zwischenspiel 1 hat keinen eigenen Bauplan: „Werkbank-Ablage“ und „Fundkiste“ sind keine Objekte des Dachbodens, der Figurenwechsel braucht einen Schalter (ZS1\_WECHSEL\_FREI?), Opa-Option 0380 und Reisetasche fehlen | Graubox endet nach der Abgabe des Eis (Meldung am Drehknopf); entschieden wird beim Bau von Zwischenspiel 1 | `tools/layout/` (Zwischenspiel-Bauplan), `skript/zwischenspiele-und-finale.md` |
