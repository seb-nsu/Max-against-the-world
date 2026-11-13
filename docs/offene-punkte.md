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
| P13 | Fertige Musik als Ergänzung (Humble-Bundle „The Complete Works“) | Sebastian prüft vor dem Kauf Lizenz (verkauftes Spiel erlaubt?) und Schleifen-Eignung | `04-audio.md` (Werkzeuge) |

## Nacharbeiten an eingebauten Hintergründen (P15)

Jede Änderung, die nach dem Gemini-Bild von Hand oder per Skript gemacht wurde, damit sie später geprüft und in Aseprite sauber nachgearbeitet werden kann. Koordinaten in Spielpixeln (640×360), Rechteck = x, y, Breite, Höhe. Originale in voller Größe: `E:\Game Engine\Grafikenssets\welt-1\` auf Sebastians PC. Umgerechnet wurde immer mit `tools/pixelieren.py` (32 Farben); „nachgefärbt“ heißt: Pixel, deren Farbe im Original weit von den 32 Farben abwich, bekamen bis zu acht zusätzliche Farben aus dem Original (Skript `nachfaerben.py`, nicht im Repo). Weitere Funde je Raum hier anhängen.

| Raum, Datei | Änderung | Wie gemacht | Prüfen und nacharbeiten |
| --- | --- | --- | --- |
| Troll-Brücke, `w1_bg_trollbruecke_v01.png` | Grundlage: Sebastians vierte Gemini-Fassung (`trollbruecke_sebastian_v4.jpeg`) | Gemini-Chat, vier Runden | – |
| Troll-Brücke | Grammophon und Notenblätter nachgefärbt, Bereich 250, 212 bis 288, 266 | Skript, 6 Zusatzfarben | Grammophon sauber nachzeichnen, goldenes Horn deutlich |
| Troll-Brücke | Wasserschloss rosa nachgezeichnet, Bereich 428, 124 bis 448, 140 | Skript, Umriss aus dem Original, 4 Rosatöne | Form des Schlosses von Hand verbessern |
| Troll-Brücke | Waldemar steht als Platzhalter rechts der Brücke (440, 275) | Layout | Mit echtem Sprite prüfen, ob er Rampe oder Schloss verdeckt |
| Klassenzimmer, `w1_bg_klassenzimmer_v01.png` | Grundlage: Sebastians Fassung mit Kessel unter dem Fenster und Bänken vor der Tafel (`klassenzimmer_sebastian_v6.png`, aus dem Chat-Bild „Unterricht4“) | Gemini-Chat, fünf Runden (Aufteilung, Seiten tauschen, Regal leeren, Neuaufteilung) | – |
| Klassenzimmer | Sechs Flaschen eingesetzt: Kopien von Flasche 1 (klein, Plätze 1, 3, 4, 6) und Flasche 2 (groß, Plätze 2, 5) aus der Fassung „Unterricht2“; im Spiel 402, 94 bis 506, 141 | Skript, Freistellen über die grüne Wand | Ränder der Flaschen, fehlender Schatten auf der Wand; große Flaschen sind 1,5-mal statt doppelt so hoch |
| Klassenzimmer | Feuer, Blasen und Trank am Kessel nachgefärbt, Bereich 150, 100 bis 240, 240 | Skript, 5 Zusatzfarben | Trank grüner machen, Blasen klarer |
| Klassenzimmer | Flasche 3 ist noch im Hintergrund gemalt | – | Als eigenes Sprite ausschneiden und im Hintergrund übermalen (Max nimmt sie) |
| Klassenzimmer | Socke fehlt auf dem Hocker (388, 192) | – | Deko-Sprite Socke |
| Zauberwald, `w1_bg_zauberwald_v01.png` | Grundlage: Sebastians erste Fassung (`zauberwald_sebastian_v1.jpeg`) | Gemini-Chat, eine Runde | – |
| Zauberwald | Riesenpilze nachgefärbt, Bereich 55, 70 bis 215, 262 | Skript, 8 Zusatzfarben | Hüte bunter, besonders rosa und violett |
| Zauberwald | Leuchtpilze nachgefärbt, Bereich 75, 200 bis 215, 262 | Skript, 4 Zusatzfarben | Leuchten und Schein |
| Zauberwald | Lieferkarren und Ketchup nachgefärbt, Bereich 385, 175 bis 470, 250 | Skript, 4 Zusatzfarben | Rot des Karrens |
| Zauberwald | Ketchup ausgeschnitten als `grafik/props/ketchup.png` (417, 209, 11, 29); Stelle im Hintergrund mit dem Karrenstück 12 Pixel links daneben überdeckt | Skript, rechteckig ohne Freistellen | Sprite freistellen, übermalte Karrenseite prüfen |
| Zauberwald | Leuchtpilz ausgeschnitten als `grafik/props/leuchtpilz.png` (157, 226, 16, 24); Stelle mit dem Stück 16 Pixel links daneben überdeckt | Skript, rechteckig ohne Freistellen | Sprite freistellen, übermalte Stelle prüfen |
| Zauberwald | Niesrosen fehlen in der Lichtung (250, 212, 80, 40) | Platz frei gelassen | Sprites geschlossen und offen |
| Zauberwald | Raum hat 48 statt 32 Farben | Folge des Nachfärbens | Palette angleichen |
| Dachboden | Zapp-O-Mat wirkt, als schwebe er (Sebastian, 13. November 2026) | – | Füße oder Standfläche und Schatten auf den Boden |

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
