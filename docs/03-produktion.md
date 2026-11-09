# Produktion: Was noch fehlt und wie du mit KI baust

Diese Datei sammelt alle Absprachen zu Technik, Grafik und Audio an einer Stelle; die Details stehen in den Grafik-Dateien (`grafik/`) und in `04-audio.md`.

## Absprachen auf einen Blick

| Bereich | Entscheidung | Warum |
| --- | --- | --- |
| Spielart | 2D-Point-and-Click in Seitenansicht wie eine Bühne, zwei spielbare Figuren (Max und Pixel) | Klassische Adventure-Ansicht, wenig Zeichenarbeit, passt zu KI-Hintergründen |
| Engine | Godot 4 mit dem Plugin Popochiu | Kostenlos, Popochiu bringt Räume, Hotspots, Inventar, Dialoge und Speichern für Point-and-Click mit |
| Auflösung | 320×180 Pixel, 6-fach auf 1920×1080 skaliert; breite Räume bis 640×180 | Echte Pixel-Art, passt in die Bildgrößen von Retro Diffusion |
| Palette | Eine gemeinsame 32-Farben-Palette, z. B. Endesga 32 von Lospec | Alle Bilder, auch fremde, werden darauf umgefärbt und passen zusammen |
| Programmierung | Claude schreibt alle Skripte (GDScript) | Du konzentrierst dich auf Grafik, Laufbereiche und Testen |
| Grafik | KI-gestützt: Konzeptbilder mit ChatGPT oder Gemini, Spielgrafik mit Retro Diffusion, Nacharbeit in Aseprite | Schnell und einheitlich; Nacharbeit hält die Qualität |
| Audio | KI-gestützt: ElevenLabs für Stimmen, Geräusche und Musik, ACE-Step lokal für Musik-Experimente, Audacity für Nacharbeit | Ein Abo deckt fast alles ab, lizenzrechtlich sauberer als Suno |
| Parodien | Keine geschützten Namen, Logos oder Figurendesigns; bekannte Zitate erlaubt, wenn sie als Anspielung erkennbar sind; Parodienamen nie im Titel, Store-Text, Tags, Trailer oder Screenshots; Toadi und Zeldina erscheinen in keinem Marketing-Material (auch nicht in Kapselbildern und Social Media), der Abspann-Pilz wird vor dem Trailer-Schnitt geprüft; Rechtscheck der Namen in `01-konzept.md` | Rechtliche Sicherheit, eigene Witze statt Kopien |
| KI-Offenlegung | Steam-Formular für KI-Inhalte ausfüllen (Grafik, Musik, Stimmen); jede Erzeugung im KI-Protokoll festhalten; Strategie, Formularangaben und Store-Text unter „KI-Offenlegung“ weiter unten | Pflicht auf Steam, Nachweis bei Rückfragen |
| Vorgehen | Erst ein Vertical Slice (Prolog und Rätsel 1 bis 4 aus Welt 1: 8 Räume, 13 Figuren, etwa 450 Zeilen), dann die Demo mit ganz Welt 1 für die Steam-Seite, dann Serienproduktion; Stufen unter Meilensteine | Früh testen, ob Rätsel und Witz funktionieren |
| Veröffentlichung | Ein Spiel mit kostenloser Demo (Prolog und Welt 1) statt verkaufter Episoden; die frühere Idee, Prolog und Welt 1 vorab als eigene Episode zu verkaufen, ist damit verworfen (8. November 2026) | Eine Demo sammelt Wunschlisten ohne Bruch; vier Episoden wären vier Veröffentlichungen mit je eigener Steam-Seite |
| Hauptfiguren | Max, Pixel und Opa entstehen als KI-Entwurf und werden in Aseprite Pixel für Pixel von Hand nachgezogen; alle anderen Figuren KI mit Nacharbeit | Mittelweg zwischen „Hauptfiguren ganz von Hand“ und der freigegebenen KI-Pipeline; die drei Figuren sind in jedem Screenshot und tragen die Store-Seite. Für Pixels Posen darf ein freies Katzen-Asset (CC0) nur als Anschauung neben dem Bild liegen; seine Pixel werden nicht übernommen |
| Umfang | Etwa 8 Stunden Spielzeit, 53 Rätsel, 3 Zwischenspiele (Rückkehren nach Welt 1 bis 3, das Packen ist jeweils eingebaut; laut Skript 168 Zeilen, Budget 170) und ein Finale in acht Abschnitten (276 Zeilen, Budget 280; Budgets in `05-spielsysteme.md`, Umfang); der Vertical Slice dauert etwa 40 Minuten | Richtwert für Zeitplan, Zeilenbudget und Steam-Seite; 8 bis 12 Minuten je Rätsel sind klassisch |

## System 1: Godot und Popochiu

| Thema | Absprache |
| --- | --- |
| Version | Godot 4.7.2 (stabil, 18. August 2026) mit Popochiu 2.2.1 (18. Oktober 2026), geprüft am 9. November 2026. Popochiu 2.2 hat Godot 4.7 als Standardziel; Godot 4.8 ist noch Beta und kommt nicht in Frage. Während des Projekts nicht wechseln; nur Fehlerkorrekturen innerhalb von 4.7.x und 2.2.x, jeweils erst in einem eigenen Git-Zweig testen; Popochiu hat zwischen Minor-Versionen das GUI-Vorlagensystem geändert |
| Pixel-Einstellungen | Viewport 320×180, Stretch-Modus „viewport“, ganzzahlige Skalierung, Texturfilter „Nearest“; richte ich beim Projektstart ein |
| Aufbau | Ein Popochiu-Raum pro Szene; Hintergrund, Laufbereich, Hotspots, Props mit Zuständen, Regionen für Größenwechsel |
| Mechaniken | Figurenwechsel (alle Welten), Zeitfähre (Welt 2), Code-Sicht und Ebenenwechsel (Welt 3), Fernbedienung und Genre-Zustände (Welt 4); alle auf einem gemeinsamen Zustandssystem (Objektzustände per Overlay umschalten, Code-Sicht und Fernbedienung auf derselben Grundlage), gebaut in Stufe 1 |
| KI-Anbindung | Claude Code auf deinem PC plus Godot-MCP-Server: Coding-Solo (kostenlos) für den Anfang, GDAI MCP (19 $ einmalig) sobald Claude Screenshots braucht |
| Arbeitsteilung | Claude legt Räume an, importiert Bilder, schreibt Skripte und behebt Fehler; du ziehst Laufbereiche und Hotspot-Umrisse mit der Maus nach und spielst |
| Sicherung | Git mit GitHub ab dem ersten Tag, Git LFS für die Ordner audio/ und concepts/ (GitHub-LFS-Kontingent prüfen); nach jedem fertigen Raum ein Stand |
| Lernen | Godot-Dokumentation „Dein erstes 2D-Spiel“, die Popochiu-Dokumentation und deren Beispielprojekt, Einsteigervideos von Brackeys und GDQuest auf YouTube; Ziel ist, den Editor zu verstehen, nicht selbst zu programmieren |

## System 2: Grafik mit KI

| Schritt | Werkzeug | Absprache |
| --- | --- | --- |
| Konzeptbild | ChatGPT oder Gemini | Baustein KONZEPT voranstellen, 16:9; nur als Vorlage, nie ins Spiel |
| Hintergründe | Retro Diffusion, Modell `rd_plus__environment` | 320×180 direkt erzeugen oder ein Konzeptbild lokal mit Neural Pixelate umwandeln |
| Figuren | Retro Diffusion Cloud, `rd_pro__default` mit Referenzbild, `rd_plus__character_turnaround` | Erst eine Seitenansicht festlegen, dann als Referenz für alles Weitere |
| Animationen | Retro Diffusion Cloud, `rd_advanced_animation__walking`, `__idle`, `__custom_action` | Nur auf der Website möglich, nicht in der lokalen Erweiterung |
| Gegenstände | `rd_plus__item_sheet` oder `rd_pro__inventory_items` | Sammelbilder, dann ausschneiden und auf 24×24 bringen |
| Oberfläche | `rd_pro__ui_panel` | Rahmen und Knöpfe; Schrift immer von Hand |
| Nacharbeit | Aseprite mit der lokalen Retro-Diffusion-Erweiterung | Palette anwenden, Freistellen, Laufbereich frei lassen, Text von Hand setzen |

**Lokal oder Cloud:** Die lokale Retro-Diffusion-Erweiterung für Aseprite kostet einmalig 65 $ (Lite 20 $) und braucht keine Credits. Sie enthält aber nicht das große Standardmodell der Website und keine Animationen. Die Website rechnet mit Credits ab und ist für Figuren und Animationen nötig. Die Bilder darfst du kommerziell nutzen. Deine Radeon 7900 XT: Laut deiner Info läuft die lokale Version inzwischen auch unter Windows auf AMD; auf der Produktseite steht in einem Entwickler-Kommentar noch „nur Linux“. Vor dem Kauf die Demo testen. Empfehlung: Cloud für Figuren und Animationen, lokal für Hintergründe, Umfärben und Freistellen.

**Regeln:** Prompts nach den Bausteinen in `grafik/00-stil-und-werkzeuge.md`; keine Schrift im Bild erzeugen; jedes Asset auf die gemeinsame Palette bringen; Dateinamen wie `w1_bg_taverne.png`; jede Erzeugung mit Prompt und Datum im KI-Protokoll. Das KI-Protokoll hat die Spalten Datum, Werkzeug und Modell, Prompt, Seed, Datei, Nacharbeit und „Ähnlichkeitsprüfung ok“. Die letzte Spalte ist Pflicht bei allen Parodiefiguren und -orten (zum Beispiel Morphäus, Agent Schmidt, Toadi, Zeldina, Hausmeister 08/15): Das Bild neben das Original legen; wirkt es wie eine Kopie statt wie eine Anspielung, neu erzeugen oder von Hand umzeichnen und das im Protokoll vermerken.

**Umfang der Grafik** (gezählt aus den Grafik-Dateien unter `grafik/`, Stand 8. November 2026; nach jeder Welt neu zählen):

| Asset | Stückzahl | Werkzeug | Zeit je Stück | Summe |
| --- | --- | --- | --- | --- |
| Hintergründe | etwa 80 (59 Räume plus etwa 20 Zustandsvarianten) | Retro Diffusion, Aseprite | 2 bis 4 h | 160 bis 320 h |
| Figurensprites mit Gehen, Stehen, Sprechen | etwa 105 (Prolog 7, W1 22, W2 26, W3 22, W4 27) | Retro Diffusion Cloud, Aseprite | 2 bis 3 h | 210 bis 315 h |
| Sonderanimationen | etwa 60 | rd\_advanced\_animation\_\_custom\_action | 1 h | 60 h |
| Effekte | etwa 25 | Baustein EFFEKT | 0,5 h | 13 h |
| Inventar-Icons | etwa 150 | Sammelbilder, Aseprite | 15 Minuten | 38 h |
| Nahansichten | 14 (Prolog 2, W1 4, W2 3, W3 4, W4 1 Programmzeitschrift) | Baustein HINTERGRUND, Schrift von Hand | 2 h | 28 h |
| UI-Panels | etwa 12 | rd\_pro\_\_ui\_panel | 2 h | 24 h |
| Summe Grafik |  |  |  | rund 600 bis 800 h |

## System 3: Audio mit KI

| Aufgabe | Werkzeug | Absprache |
| --- | --- | --- |
| Stimmen | ElevenLabs, Voice Design | Stimmen per Beschreibung erfinden, keine echten Stimmen klonen; erst erzeugen, wenn das Skript fertig ist |
| Geräusche | ElevenLabs Sound Effects, CC0-Sammlungen | Mehrere Varianten pro Geräusch, die beste behalten |
| Musik | ElevenLabs Music, ACE-Step 1.5 lokal in ComfyUI Desktop | Leitmotiv pro Welt abwandeln; drei gesungene Stücke mit Rätselfunktion; kein Suno |
| Nacharbeit | Audacity | Loops schneiden, Lautstärke angleichen, Funk- und Radio-Filter |
| Umfang Stimmen | Entscheidung spätestens zu Beginn von Stufe 5 | Ab etwa 10.000 Wunschlisten Vollvertonung, darunter Hauptfiguren vertont und der Rest als Brabbel-Laute (siehe Markt); alle Zeilen bekommen trotzdem von Anfang an IDs |

## Kosten

| Posten | Kosten | Wann |
| --- | --- | --- |
| Godot, Popochiu, Git, Audacity, ACE-Step | kostenlos | sofort |
| Aseprite | etwa 20 $ einmalig | sofort |
| Retro Diffusion lokal | 65 $ einmalig (Lite 20 $) | nach erfolgreichem Demotest |
| Retro Diffusion Cloud | Credits nach Verbrauch; geschätzt mehrere hundert Dollar bei etwa 80 Hintergründen und 300 Animationsjobs mit je drei Versuchen | ab den ersten Figuren |
| GDAI MCP | 19 $ einmalig, optional | wenn Claude Screenshots braucht |
| ElevenLabs | ab 6 $ im Monat; für die Vollvertonung etwa 3 Monate Pro (rund 300 $) | Geräusche und Musik laufend, Stimmen am Ende |
| Steam-Veröffentlichung | 100 $ Gebühr pro Spiel | vor der Steam-Seite |
| Claude-Abo | 100 bis 200 $ im Monat; über 30 Monate 3.000 bis 6.000 $ | laufend, größter Posten |
| ChatGPT oder Gemini | etwa 20 $ im Monat in den Grafikphasen | Konzeptbilder je Welt |
| Muttersprachler für die englische Fassung | 300 bis 800 € freiberuflich | Stufe Finale und Politur |
| Anwaltsstunde für Figurenliste und Titel | 200 bis 350 € | vor der Steam-Seite |
| Gesamt über die Laufzeit | etwa 5.000 bis 9.000 $ | Grundlage für die Entscheidung Demo statt Episode |

Preise Stand November 2026, laut [Retro Diffusion auf itch.io](https://astropulse.itch.io/retrodiffusion) und den Quellen in `04-audio.md`.

## Meilensteine und Stundenbudget

Fünf Stufen mit Dauer, Stundenbudget und einer Regel, wann umgesteuert wird. Nach jeder Stufe Ist und Plan vergleichen und die nächste Stufe neu schätzen. Der Umfang des Spiels bleibt dabei fest; umgesteuert wird am Ablauf, nicht an den Rätseln.

| Stufe | Dauer | Ergebnis | Stundenbudget | Umsteuern, wenn |
| --- | --- | --- | --- | --- |
| 1 Grundgerüst | 4 Wochen | Godot und Popochiu eingerichtet, Git mit LFS, gemeinsames Zustandssystem, Figurenwechsel, Speichern, Nahansicht, Notizbuch, tr() in allen Texten, Dachboden mit Platzhaltergrafik; Prüfskript für die Skript-Tabellen (Zeilenlänge, doppelte IDs, Zehnerschritte, Sprecherliste; A1, A2) und Konsistenz-Check der Rätsel-Dateien (Benötigt und Belohnung, Sackgassen, falsche Verweise; A13) laufen bei jedem Push in GitHub Actions (A7); dazu ein automatischer Speichern/Laden-Test und ein Rundreise-Test (A4): Spielstand an jeder Stelle speichern, laden und vergleichen | 60 h | Der Figurenwechsel läuft nach vier Wochen nicht: Popochiu-Version prüfen, dann Hilfe im Popochiu-Discord holen |
| 2 Vertical Slice | 8 Wochen | Prolog und Welt 1 Rätsel 1 bis 4: 8 Räume, 13 Figuren, etwa 450 Zeilen, Platzhalter erlaubt; fünf Fremde testen mit Telemetrie-Log; die Hinweis-Datei der Hilfe-Pfote wird automatisch aus Skript und Rätseltabelle erzeugt (A14) | 120 h | Tester lösen Rätsel 1 bis 4 mit Hinweisen nicht in 40 Minuten: Hinweise und Hotspots nachbessern, bevor Grafik in Serie geht |
| 3 Demo Welt 1 | 6 Monate | Prolog und Welt 1 komplett mit fertiger Grafik und Audio, Zwischenspiel 1, Steam-Seite mit Demo online | 350 h | Mehr als 9 Monate: Zeitplan der Welten 2 bis 4 neu rechnen und Prompt-Vorlagen verbessern |
| 4 Welten 2 bis 4 | je 5 bis 7 Monate | Eine Welt je Stufe mit Rückkehr, Packszene und Test; Reihenfolge 2, 3, 4 | je 300 h | Eine Welt dauert mehr als 9 Monate: Ablauf prüfen (Automatisierung, Sammelbilder, Wiederverwendung), nicht die Rätselzahl |
| 5 Finale und Politur | 3 Monate | Finale, Abspann, Übersetzung, Sprachausgabe oder Brabbel, Errungenschaften, Barrierefreiheit, Steam-Einreichung | 180 h | Die Entscheidung Vollvertonung oder Brabbel fällt spätestens am Anfang dieser Stufe |

Welche Automatisierung in welche Stufe gehört, steht unter Automatisierung.

Bei 10 bis 15 Stunden pro Woche sind das rund drei Jahre, bei 20 Stunden gut zwei. Die Stundenbudgets sind Messlatten, keine Versprechen; die Grafikstunden aus der Zähltabelle stecken darin.

**Puffer und Termin für die Steam-Seite (Schätzung vom 9. November 2026, wird später festgelegt):** Auf jede Stufe kommen 20 Prozent Puffer: Grundgerüst 5 statt 4 Wochen, Vertical Slice 10 statt 8 Wochen, Demo Welt 1 gut 7 statt 6 Monate, Welten 2 bis 4 je 6 bis 8,5 statt 5 bis 7 Monate, Finale und Politur knapp 4 statt 3 Monate. Ohne Puffer ergibt das 27 bis 33 Monate, mit Puffer 32 bis 40 Monate.

Die Steam-Seite geht online, sobald der Vertical Slice bestanden ist und ein fertiges Kapselbild und fünf echte Screenshots aus Welt 1 vorliegen, geschätzt im Monat 7 bis 9 nach Projektstart. Die Demo folgt am Ende von Stufe 3 (etwa Monat 10 bis 11) und zielt auf das nächste Steam Next Fest (Februar, Juni oder Oktober). Beispiel bei Projektstart im Januar 2027: Steam-Seite im Herbst 2027, Demo zum Next Fest im Februar 2028, Veröffentlichung zwischen Herbst 2029 und Frühjahr 2030. Die Seite hätte damit gut zwei Jahre, um Wunschlisten zu sammeln.

## Automatisierung

Sechzehn Ideen aus dem Gutachten vom 8. November 2026 (A1 bis A16), mit Nutzen, Aufwand (Tage für Claude und Sebastian), Risiko und Stufe. Die Pflichtteile stehen zusätzlich in den Meilensteinen. Schon vorhanden (Stand 9. November 2026): `tools/pruefen.py` prüft die Dokumente selbst, also Welt-Tabellen, Lösbarkeit, Verweise, Zeilen-IDs, Sprecher und Zeilenlänge im Skript. Das deckt A13 und die Dokument-Hälfte von A2 ab; die Prüfung der Export-CSV und des Godot-Codes kommt in Stufe 1 dazu.

| Nr. | Was | Nutzen | Aufwand | Risiko | Stufe | Hinweis |
| --- | --- | --- | --- | --- | --- | --- |
| A1 | Skript-Pipeline: Skript-Tabelle → Prüfskript → Godot-Übersetzungs-CSV (ID, de, en) → Zeilen-ID-Liste für Audio | hoch | 1 bis 2 | niedrig | 1 | Pflicht; ohne sie keine Übersetzung und keine Vertonung. Zuerst bauen, mit dem Prolog als Testdaten |
| A2 | Prüfregeln: Zeilen über 120 Zeichen, doppelte IDs, IDs ohne Zehnerschritt, Sprecher nicht in der Liste, Pixel-Zeile vor P1 ohne Bedingung, Zeilen im Code ohne Skripteintrag und umgekehrt | hoch | 0,5 | niedrig | 1 | Dokument-Teil läuft schon in `tools/pruefen.py`; Code-Abgleich folgt |
| A3 | Godot headless: automatischer Rätsel-Durchlauf (Lösungspfad als Skript, danach Prüfung aller Schalter) | hoch | 3 bis 5, dann 0,5 je Welt | mittel (Popochiu ist nicht für Headless gebaut, Zwischensequenzen) | Machbarkeit in 1 an P1, vollständig in 2 | Lösungspfad aus den „benötigt“-Feldern der Welt-Tabellen ableiten |
| A4 | Speichern/Laden-Test nach jedem gelösten Schritt plus Rundreise-Test (speichern, laden, vergleichen) | hoch | 1 | niedrig | 1 | Pflicht; der Test enthält auch den Fall „Tausch-Budget in Welt 3 verbraucht“ |
| A5 | Parallele Claude-Agenten je Raum (Rätsel, Grafikliste und Skript des Raums → Hotspots, Props, Dialoge) | hoch | 1 für die Vorlage | mittel (Stil-Drift, Konflikte an Inventar und Schalterliste) | 4 | Ein Agent je Raum, gemeinsame Dateien nur in einem Integrations-Durchgang, jeder Agent liefert seinen A3-Test mit; Welt 1 noch der Reihe nach bauen |
| A6 | Audio-Pipeline: Skript-CSV → ElevenLabs-API (Stimme je Sprecher, Regie als Stil-Hinweis) → Dateiname = Zeilen-ID → Audacity-Batch (normalisieren, Stille trimmen) → Import | hoch | 2 | mittel (Kosten bei versehentlichem Mehrfachlauf) | Technik in 2 mit 20 Zeilen, Vollvertonung in 5 | Erzeugt nur Zeilen mit Status „final“, für die es noch keine Datei gibt |
| A7 | GitHub Actions bei jedem Push: Prüfskript, Godot-Export headless, Rätsel-Test, spielbarer Build als Artefakt | hoch | 1 bis 2 | niedrig | 1 | Pflicht, sobald A2 und A3 laufen |
| A8 | Web-Export (HTML5) für Testspieler per Link, privat auf itch.io | hoch | 0,5 | mittel (SharedArrayBuffer-Header, Audio-Autoplay im Browser, Popochiu im Web-Export erst prüfen) | 2 | Kein Download, kein Installer |
| A9 | Telemetrie im Testbuild: Zeit je Rätselschritt, Hinweisstufen, Fehlklicks je Hotspot, Ersatzzeilen; Upload als JSON, Auswertung per Skript | hoch | 2 | niedrig (nur anonym und mit Zustimmung im Testbuild) | 2 | Ziel: kein Schritt über 10 Minuten im Median, Stufe 3 bei unter 20 Prozent der Tester |
| A10 | Grafik-Batch: Prompt-Tabelle → Retro-Diffusion-API → Palettize auf die Welt-Palette → Zuschnitt → Dateiname nach Schema → Eintrag ins KI-Protokoll | mittel | 2 bis 3 | mittel (API-Kosten bei Fehlläufen, Nacharbeit bleibt Handarbeit) | 3, sobald der Stil mit dem ersten Sprite-Paar steht | Lohnt für Gegenstände und Deko-Sammelbilder; bei Hintergründen und Figuren nur Protokoll und Palettize automatisieren |
| A11 | KI-Protokoll automatisch: jedes Werkzeug-Skript (A6, A10) schreibt seine Zeile in eine CSV, Export für das Steam-Formular | hoch | 0,5 | niedrig | 1 | Spalten wie unter System 2; Nacharbeit und Ähnlichkeitsprüfung bleiben Handeinträge |
| A12 | Englische Fassung: EN-Spalte per Claude aus der CSV mit Kontext (Art, Auslöser, Regie), Längenprüfung in EN, Eigennamen-Glossar (Spielsysteme) | hoch | 1 plus Übersetzungsläufe | mittel (Wortspiele) | Technik früh, Inhalt in 5 | Englische Fassung fest beschlossen; Muttersprachler prüft die Witze |
| A13 | Konsistenz-Check der Dokumente: Abhängigkeiten, Sackgassen, Verweise | mittel | 1 | niedrig | 1 | Läuft als `tools/pruefen.py` (siehe oben) |
| A14 | Hinweis-Datei (`hints_wX.tres`) aus Skript und Rätseltabelle erzeugen statt von Hand pflegen | mittel | 1 | niedrig | 2 | Hält Hinweise, Notizbuch-Ziele und Schalter gleich |
| A15 | Playtest-Auswertung per Claude: Telemetrie-JSON plus Beobachtungsbogen → Bericht je Rätsel mit Vorschlag | mittel | 0,5 | niedrig | 3 | Erst sinnvoll, wenn A9 Daten liefert |
| A16 | Screenshot-Regressionstest: Headless-Build rendert jeden Raum mit Max an fester Position und vergleicht mit einer Referenz (Laufbereich, Größe, Palette) | niedrig bis mittel | 1 | niedrig | 4 | Erst mit mehreren Agenten (A5) nötig |

Nicht automatisieren: Laufbereiche, Hotspot-Umrisse, Freigabe der Pointen und die Nacharbeit der Hintergründe.

## Was noch fehlt

| Baustein | Was zu tun ist | Wer |
| --- | --- | --- |
| Dialog-Skript | Alle Zeilen von Max, Pixel und den Figuren, jede mit fester ID für Übersetzung und Sprachausgabe; dazu Kommentare für „Benutze X mit Y“, die nicht gehen | Claude schreibt, du kürzt |
| Schrift | Pixel-Schrift mit deutschen Umlauten und offener Lizenz (OFL), z. B. von Google Fonts oder itch.io | du wählst aus |
| Menüs und UI | Hauptmenü, Speichern und Laden, Optionen (Lautstärke, Textgeschwindigkeit, Untertitel), Hotspot-Anzeige | Popochiu bringt Vorlagen mit, Claude passt sie an |
| Hinweis-System | Der Pfoten-Hilfeknopf aus dem Prolog: drei Stufen pro Rätsel, vom Wink bis zur Lösung | Claude schreibt die Hinweise |
| Speichern | Spielstand mit Inventar, Rätsel-Fortschritt und aktueller Figur | Claude skriptet |
| Übersetzung | Englisch verdoppelt den Markt auf Steam; alle Texte ab Tag 1 über tr() und Zeilen-IDs, keine festen Strings im Skript; Eigennamen-Glossar in `05-spielsysteme.md` | Englische Fassung fest beschlossen (9. November 2026); Claude übersetzt aus der Skript-CSV mit Glossar (A12), Muttersprachler prüft Witze |
| Testen | Ab dem Vertical Slice Fremde spielen lassen. Der Build schreibt ein Telemetrie-Log (Raum, Rätsel, Zeit, Hinweisstufe, Klicks ins Leere); dazu ein Beobachtungsbogen je Tester mit Zielwerten: Rätsel unter 12 Minuten, höchstens eine Hinweisstufe 3 je Welt, jeder Witz mindestens einmal gelacht | du und Testspieler |
| Steam-Seite | Kapselbilder in mehreren Formaten, 5+ Screenshots, Trailer, Beschreibung, KI-Offenlegung; Seite früh online stellen, um Wunschlisten zu sammeln | du, Claude hilft bei Texten |
| Rechtliches | Rechtscheck der Namen (`01-konzept.md`) vor jeder Welt durchgehen; Markencheck des Titels „Couch Quest – Max against the worlds“ in DPMAregister, EUIPO eSearch und der Steam-Suche vor der Steam-Seite, Ergebnis mit Datum hier eintragen (Stand 9. November 2026: Websuche erledigt, Registersuche offen. Kein Videospiel namens „Couch Quest“ auf Steam gefunden; der Name ist aber belegt durch eine Live-Gameshow „Couch Quests“ auf Twitch und YouTube, Social-Media-Konten „Couch Quest“ und „Couch Quest Gaming“ sowie einen Möbelhändler in den USA. Die Suche in DPMAregister und EUIPO eSearch nach „Couch Quest“ in den Klassen 9, 28 und 41 fehlt noch); eine Anwaltsstunde für Figurenliste und Titel vor der Veröffentlichung; Gewerbe und Steuer vor der Steam-Seite: Gewerbe anmelden (oder Kleinunternehmerregelung klären), Steuernummer für das Steam-Steuerinterview, Erstgespräch beim Steuerberater (Umsatzsteuer auf Steam-Umsätze führt Valve ab, Einkommensteuer bleibt), Impressum mit Anschrift auch auf der Steam-Seite; Lizenznachweise für Schrift, Musik und Geräusche sammeln; Impressum für die Seite. Altersfreigabe: Ziel USK 6 und PEGI 7 über den IARC-Fragebogen auf Steam (Wein in Welt 1 und 2 nur als Bestellung oder Rätselgegenstand, Max trinkt keinen Alkohol, Pastillen statt Pillen in Welt 3, Slapstick ohne Blut); fällt die Einstufung höher aus, ist USK 12 akzeptiert. Das Dokument ersetzt keine Rechtsberatung | du |
| Versionierung | Git mit GitHub und Git LFS für audio/ und concepts/; wichtig, sobald eine KI Dateien im Projekt ändert, damit jeder Schritt rückgängig gemacht werden kann | einmal einrichten |

**Reihenfolge:** Erst das Grundgerüst, dann der Vertical Slice (Prolog und Welt 1 Rätsel 1 bis 4: 8 Räume, 13 Figuren, etwa 450 Zeilen, Platzhaltergrafik erlaubt), dann testen, dann Grafik und Audio in Serie. Die Stufen stehen unter Meilensteine.

## KI-Offenlegung

Steam fragt im Fragebogen zu den Inhalten zwei Arten ab: vorab erzeugte KI-Inhalte (mit KI erstellt und mit dem Spiel ausgeliefert) und live erzeugte (KI erzeugt während des Spielens Inhalte). Dieses Spiel hat nur vorab erzeugte Inhalte. Strategie: offen und konkret, weder versteckt noch entschuldigend. Der Absatz steht unten in der Store-Beschreibung, die Angaben im Steam-Formular, und der Abspann nennt die Werkzeuge. Der Text wird vor der Steam-Seite an den tatsächlichen Ablauf angepasst.

**Angaben im Steam-Formular (vorab erzeugt):**

- Grafik: Konzeptbilder mit ChatGPT oder Gemini als Vorlage, nie im Spiel. Hintergründe, Figuren, Animationen und Gegenstände mit Retro Diffusion erzeugt und in Aseprite von Hand nachbearbeitet; Max, Pixel und Opa Pixel für Pixel von Hand nachgezogen.
- Audio: Stimmen, Geräusche und Musik mit ElevenLabs (Voice Design, keine geklonten Stimmen echter Personen) und ACE-Step, Nacharbeit in Audacity; Liedtexte von Hand.
- Text: Geschichte, Welten, Figuren und Rätsel von Sebastian; Dialoge mit Claude als Schreibpartner entworfen und von Sebastian überarbeitet; englische Fassung mit Claude übersetzt und von einem Muttersprachler geprüft.
- Code: mit Claude Code geschrieben.
- Live erzeugt: nein. Das Spiel erzeugt beim Spielen keine Inhalte mit KI.
- Nachweis: KI-Protokoll mit Prompt, Datum und Ähnlichkeitsprüfung für jedes Asset.

**Store-Text, deutsch (Entwurf):** „Couch Quest ist ein kleines Indie-Projekt, bei dem KI ein Werkzeug ist und nicht der Autor. Geschichte, Figuren und Rätsel stammen von mir. Grafik und Audio sind mit KI-Werkzeugen entstanden (Retro Diffusion, ElevenLabs); jedes Bild ist in Aseprite von Hand nachgearbeitet, und Max, Pixel und Opa sind Pixel für Pixel von Hand gezeichnet. Die Dialoge habe ich mit Claude als Schreibpartner entworfen und selbst überarbeitet, der Code ist mit Claude Code entstanden. Keine Stimme einer echten Person wurde geklont, und das Spiel erzeugt beim Spielen keine Inhalte mit KI.“

**Store-Text, englisch (Entwurf):** „Couch Quest is a small indie project where AI is a tool, not the author. The story, characters and puzzles are mine. Art and audio were made with AI tools (Retro Diffusion, ElevenLabs); every image was reworked by hand in Aseprite, and Max, Pixel and Grandpa were drawn pixel by pixel. I drafted the dialogue with Claude as a writing partner and edited it myself, and the code was written with Claude Code. No real person’s voice was cloned, and the game generates no AI content while you play.“

## Markt

Stand 9. November 2026. Alle Verkaufszahlen sind Schätzungen von Analyse-Seiten (meist nach der Boxleiter-Methode, 20 bis 60 Verkäufe je Steam-Rezension), keine offiziellen Zahlen.

| Vergleichstitel | Was passt | Zahlen |
| --- | --- | --- |
| Lucy Dreaming (2022) | Pixel-Art, Comedy, klassisches Point-and-Click, kleines Studio | 18,99 $, rund 280 Rezensionen, Metacritic 87; geschätzt 4.000 bis 6.000 Kopien, 90.000 bis 105.000 $ brutto, rund 30.000 $ netto für das Studio |
| Sam & Max: Beyond Time and Space (Remaster) | Comedy-Adventure mit Popkultur-Humor | 19,99 $, rund 520 Rezensionen; geschätzt etwa 18.000 Kopien |
| Frog Detective 3 | kurzes Comedy-Adventure, sehr gute Bewertungen | 4,99 $, rund 1.900 Rezensionen; geschätzt etwa 58.000 Kopien; zeigt, wie weit Humor trägt, ist aber viel kürzer und billiger |
| Unforeseen Incidents (2018) | deutsches Studio, Publisher Application Systems Heidelberg, englische Fassung | keine öffentlichen Zahlen; Metacritic 80, später auf Switch |

**Richtwerte:** Das mittlere bezahlte Steam-Spiel nimmt in seiner ganzen Laufzeit nur 1.100 bis 3.500 $ brutto ein; Spiele mit mehr als 100 Rezensionen verkaufen meist 3.000 bis 10.000 Kopien. Im ersten Monat verkauft ein Spiel im Mittel etwa 12 Prozent seiner Wunschlisten zum Start (andere Quellen: 15 bis 25 Prozent); gemütliche Point-and-Click-Spiele mit Pixel-Art liegen eher darüber. Der erste Monat bringt 30 bis 50 Prozent des ersten Jahres.

**Preis:** 17,99 € bzw. 17,99 $ zum Start, Demo kostenlos, 10 bis 15 Prozent Startrabatt. Acht Stunden Spielzeit tragen diesen Preis; Lucy Dreaming und Sam & Max liegen bei 19 bis 20 $.

**Zielgruppe:** Adventure-Fans zwischen 25 und 45 mit Erinnerungen an die LucasArts- und Daedalic-Zeit, auf Deutsch und Englisch; dazu Popkultur-Fans, die Parodien mögen, und Steam-Deck-Spieler. Nebenzielgruppe Jugendliche ab 12 (Freigabe-Ziel USK 6 und PEGI 7, siehe Was noch fehlt, Rechtliches).

**Wunschlisten-Ziel:** 10.000 zum Start, mindestens 7.000. Bei 10.000 Wunschlisten sind 1.200 bis 2.500 Verkäufe im ersten Monat und 3.000 bis 6.000 im ersten Jahr realistisch.

**Rechnung:** 5.000 Kopien zu durchschnittlich 14 $ nach Rabatten ergeben 70.000 $ brutto, nach dem Steam-Anteil von 30 Prozent rund 49.000 $ vor Steuern. Die Kosten von 5.000 bis 9.000 $ sind nach etwa 500 bis 950 Kopien gedeckt.

**Folgen für offene Entscheidungen:** Die englische Fassung lohnt sich klar, weil sie den Markt etwa verdoppelt und nur 300 bis 800 € kostet. Die Vollvertonung lohnt sich ab etwa 10.000 Wunschlisten zu Beginn von Stufe 5; darunter Hauptfiguren vertont und der Rest als Brabbel-Laute.

Quellen: [games-stats.com zu Lucy Dreaming](https://games-stats.com/steam/game/lucy-dreaming/), [steam-revenue-calculator.com](https://steam-revenue-calculator.com/app/1532710/lucy-dreaming), [steamdata.ai Point-and-Click](https://steamdata.ai/best/point-and-click), [Game Oracle: Wishlist to Sales 2025](https://www.game-oracle.com/blog/wishlist-to-sales-2025), [Steam Page Analyzer: Indie Game Revenue](https://www.steampageanalyzer.com/blog/indie-game-revenue-data), [Wikipedia: Unforeseen Incidents](https://en.wikipedia.org/wiki/Unforeseen_Incidents).

## Brauchst du einen Level-Editor?

Nein. Bei einem Point-and-Click in Seitenansicht ist jeder Raum ein Hintergrundbild mit unsichtbaren Flächen darüber. Das erledigt der Godot-Editor mit Popochiu bereits:

- **Räume:** Hintergrund, Laufbereich (Polygon, auf dem die Figur gehen darf), Hotspots (anklickbare Flächen), Props (Objekte mit Zuständen), Regionen (z. B. Figur wird kleiner, wenn sie nach hinten geht).
- **Figuren, Inventar und Dialoge:** eigene Fenster im Popochiu-Panel.
- Ein Kachel-Editor wie Tiled ist nur für Spiele aus Kacheln nötig, nicht für gemalte Hintergründe.

## Godot mit KI steuern

Statt eines KI-Editors verbindest du Claude direkt mit Godot. Dafür gibt es MCP-Server: kleine Programme, über die Claude Szenen anlegen, Skripte schreiben, das Spiel starten und Fehlermeldungen lesen kann.

| Werkzeug | Kosten | Kann | Für dich |
| --- | --- | --- | --- |
| Claude Code | läuft mit deinem Claude-Abo | Liest und schreibt das ganze Projekt, führt Befehle aus | Die Grundlage: arbeitet direkt in deinem Projektordner |
| Godot MCP (Coding-Solo) | kostenlos, Open Source | Szenen bearbeiten, Spiel starten, Konsole und Fehler lesen | Reicht für den Anfang |
| GDAI MCP | 19 $ einmalig | Zusätzlich Screenshots vom Editor und vom laufenden Spiel, Tastatureingaben | Lohnt sich, sobald Claude selbst nachsehen soll, ob ein Raum richtig aussieht |

**Arbeitsteilung pro Raum:**

1. Du erzeugst den Hintergrund mit Retro Diffusion und räumst ihn in Aseprite auf.
2. Claude legt per MCP den Popochiu-Raum an, importiert Bild und Props, legt Hotspots grob an und schreibt die Skripte für alle Kommentare und Rätsel.
3. Du ziehst Laufbereich und Hotspot-Umrisse mit der Maus nach. Das geht von Hand in einer Minute schneller und genauer als per KI.
4. Claude startet das Spiel, liest Fehler aus und behebt sie.
5. Du spielst den Raum und sagst, was nicht stimmt.

Wichtig: vorher Git mit LFS einrichten und nach jedem fertigen Raum einen Stand sichern. Popochiu-Version und Godot-Version vor Projektbeginn festlegen (System 1) und nicht mitten im Projekt wechseln.
