# Produktion: Was noch fehlt und wie du mit KI baust

Dieser Tab sammelt alle Absprachen zu Technik, Grafik und Audio an einer Stelle; die Details stehen in den Tabs Grafik und Audio.

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
| Parodien | Keine geschützten Namen, Logos oder Figurendesigns; bekannte Zitate erlaubt, wenn sie als Anspielung erkennbar sind; Parodienamen nie im Titel, Store-Text, Tags, Trailer oder Screenshots; Rechtscheck der Namen im Tab Konzept | Rechtliche Sicherheit, eigene Witze statt Kopien |
| KI-Offenlegung | Steam-Formular für KI-Inhalte ausfüllen (Grafik, Musik, Stimmen); jede Erzeugung im KI-Protokoll festhalten | Pflicht auf Steam, Nachweis bei Rückfragen |
| Vorgehen | Erst ein Vertical Slice (Prolog und Rätsel 1 bis 4 aus Welt 1: 8 Räume, 13 Figuren, etwa 450 Zeilen), dann die Demo mit ganz Welt 1 für die Steam-Seite, dann Serienproduktion; Stufen unter Meilensteine | Früh testen, ob Rätsel und Witz funktionieren |
| Veröffentlichung | Ein Spiel mit kostenloser Demo (Prolog und Welt 1) statt verkaufter Episoden; Überarbeitung Nr. 3 ist damit verworfen | Eine Demo sammelt Wunschlisten ohne Bruch; vier Episoden wären vier Veröffentlichungen mit je eigener Steam-Seite |
| Hauptfiguren | Max, Pixel und Opa entstehen als KI-Entwurf und werden in Aseprite Pixel für Pixel von Hand nachgezogen; alle anderen Figuren KI mit Nacharbeit | Mittelweg zwischen Überarbeitung Nr. 57 und der freigegebenen Pipeline; die drei Figuren sind in jedem Screenshot und tragen die Store-Seite |
| Umfang | Etwa 8 Stunden Spielzeit, 53 Rätsel, 12 Zwischenspiele (Rückkehren und Packszenen); der Vertical Slice dauert etwa 40 Minuten | Richtwert für Zeitplan, Zeilenbudget und Steam-Seite; 8 bis 12 Minuten je Rätsel sind klassisch |

## System 1: Godot und Popochiu

| Thema | Absprache |
| --- | --- |
| Version | Eine stabile Godot-4-Version und die dazu passende Popochiu-2-Version mit Nummer und Prüfdatum hier eintragen (Stand 8. November 2026 noch offen; Beispielform: „Godot 4.4.1, Popochiu 2.0.x, geprüft am …“) und während des Projekts nicht wechseln; Popochiu hat zwischen Minor-Versionen das GUI-Vorlagensystem geändert |
| Pixel-Einstellungen | Viewport 320×180, Stretch-Modus „viewport“, ganzzahlige Skalierung, Texturfilter „Nearest“; richte ich beim Projektstart ein |
| Aufbau | Ein Popochiu-Raum pro Szene; Hintergrund, Laufbereich, Hotspots, Props mit Zuständen, Regionen für Größenwechsel |
| Mechaniken | Figurenwechsel (alle Welten), Zeitfähre (Welt 2), Code-Sicht und Ebenenwechsel (Welt 3), Fernbedienung und Genre-Zustände (Welt 4); nach Überarbeitung Nr. 23 möglichst auf einem gemeinsamen Zustandssystem |
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

**Regeln:** Prompts nach den Bausteinen im Tab Grafik; keine Schrift im Bild erzeugen; jedes Asset auf die gemeinsame Palette bringen; Dateinamen wie `w1_bg_taverne.png`; jede Erzeugung mit Prompt und Datum im KI-Protokoll.

**Umfang der Grafik** (gezählt aus den Grafik-Tabs, Stand 8. November 2026; nach jeder Welt neu zählen):

| Asset | Stückzahl | Werkzeug | Zeit je Stück | Summe |
| --- | --- | --- | --- | --- |
| Hintergründe | etwa 80 (59 Räume plus etwa 20 Zustandsvarianten) | Retro Diffusion, Aseprite | 2 bis 4 h | 160 bis 320 h |
| Figurensprites mit Gehen, Stehen, Sprechen | etwa 105 (Prolog 7, W1 22, W2 26, W3 22, W4 27) | Retro Diffusion Cloud, Aseprite | 2 bis 3 h | 210 bis 315 h |
| Sonderanimationen | etwa 60 | rd\_advanced\_animation\_\_custom\_action | 1 h | 60 h |
| Effekte | etwa 25 | Baustein EFFEKT | 0,5 h | 13 h |
| Inventar-Icons | etwa 150 | Sammelbilder, Aseprite | 15 Minuten | 38 h |
| Nahansichten | 11 | Baustein HINTERGRUND, Schrift von Hand | 2 h | 22 h |
| UI-Panels | etwa 12 | rd\_pro\_\_ui\_panel | 2 h | 24 h |
| Summe Grafik |  |  |  | rund 600 bis 800 h |

## System 3: Audio mit KI

| Aufgabe | Werkzeug | Absprache |
| --- | --- | --- |
| Stimmen | ElevenLabs, Voice Design | Stimmen per Beschreibung erfinden, keine echten Stimmen klonen; erst erzeugen, wenn das Skript fertig ist |
| Geräusche | ElevenLabs Sound Effects, CC0-Sammlungen | Mehrere Varianten pro Geräusch, die beste behalten |
| Musik | ElevenLabs Music, ACE-Step 1.5 lokal in ComfyUI Desktop | Leitmotiv pro Welt abwandeln; drei gesungene Stücke mit Rätselfunktion; kein Suno |
| Nacharbeit | Audacity | Loops schneiden, Lautstärke angleichen, Funk- und Radio-Filter |
| Umfang Stimmen | Entscheidung am Ende | Vollvertonung, nur Hauptfiguren oder Brabbel-Laute; alle Zeilen bekommen trotzdem von Anfang an IDs |

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

Preise Stand November 2026, laut [Retro Diffusion auf itch.io](https://astropulse.itch.io/retrodiffusion) und den Quellen im Tab Audio.

## Meilensteine und Stundenbudget

Fünf Stufen mit Dauer, Stundenbudget und einer Regel, wann umgesteuert wird. Nach jeder Stufe Ist und Plan vergleichen und die nächste Stufe neu schätzen. Der Umfang des Spiels bleibt dabei fest; umgesteuert wird am Ablauf, nicht an den Rätseln.

| Stufe | Dauer | Ergebnis | Stundenbudget | Umsteuern, wenn |
| --- | --- | --- | --- | --- |
| 1 Grundgerüst | 4 Wochen | Godot und Popochiu eingerichtet, Git mit LFS, gemeinsames Zustandssystem, Figurenwechsel, Speichern, Nahansicht, Notizbuch, tr() in allen Texten, Dachboden mit Platzhaltergrafik | 60 h | Der Figurenwechsel läuft nach vier Wochen nicht: Popochiu-Version prüfen, dann Hilfe im Popochiu-Discord holen |
| 2 Vertical Slice | 8 Wochen | Prolog und Welt 1 Rätsel 1 bis 4: 8 Räume, 13 Figuren, etwa 450 Zeilen, Platzhalter erlaubt; fünf Fremde testen mit Telemetrie-Log | 120 h | Tester lösen Rätsel 1 bis 4 mit Hinweisen nicht in 45 Minuten: Hinweise und Hotspots nachbessern, bevor Grafik in Serie geht |
| 3 Demo Welt 1 | 6 Monate | Prolog und Welt 1 komplett mit fertiger Grafik und Audio, Zwischenspiel 1, Steam-Seite mit Demo online | 350 h | Mehr als 9 Monate: Zeitplan der Welten 2 bis 4 neu rechnen und Prompt-Vorlagen verbessern |
| 4 Welten 2 bis 4 | je 5 bis 7 Monate | Eine Welt je Stufe mit Rückkehr, Packszene und Test; Reihenfolge 2, 3, 4 | je 300 h | Eine Welt dauert mehr als 9 Monate: Ablauf prüfen (Automatisierung, Sammelbilder, Wiederverwendung), nicht die Rätselzahl |
| 5 Finale und Politur | 3 Monate | Finale, Abspann, Übersetzung, Sprachausgabe oder Brabbel, Errungenschaften, Barrierefreiheit, Steam-Einreichung | 180 h | Die Entscheidung Vollvertonung oder Brabbel fällt spätestens am Anfang dieser Stufe |

Bei 10 bis 15 Stunden pro Woche sind das rund drei Jahre, bei 20 Stunden gut zwei. Die Stundenbudgets sind Messlatten, keine Versprechen; die Grafikstunden aus der Zähltabelle stecken darin.

## Was noch fehlt

| Baustein | Was zu tun ist | Wer |
| --- | --- | --- |
| Dialog-Skript | Alle Zeilen von Max, Pixel und den Figuren, jede mit fester ID für Übersetzung und Sprachausgabe; dazu Kommentare für „Benutze X mit Y“, die nicht gehen | Claude schreibt, du kürzt |
| Schrift | Pixel-Schrift mit deutschen Umlauten und offener Lizenz (OFL), z. B. von Google Fonts oder itch.io | du wählst aus |
| Menüs und UI | Hauptmenü, Speichern und Laden, Optionen (Lautstärke, Textgeschwindigkeit, Untertitel), Hotspot-Anzeige | Popochiu bringt Vorlagen mit, Claude passt sie an |
| Hinweis-System | Der Pfoten-Hilfeknopf aus dem Prolog: drei Stufen pro Rätsel, vom Wink bis zur Lösung | Claude schreibt die Hinweise |
| Speichern | Spielstand mit Inventar, Rätsel-Fortschritt und aktueller Figur | Claude skriptet |
| Übersetzung | Englisch verdoppelt den Markt auf Steam; alle Texte ab Tag 1 über tr() und Zeilen-IDs, keine festen Strings im Skript; Eigennamen-Glossar im Tab Spielsysteme | Claude übersetzt, Muttersprachler prüft Witze |
| Testen | Ab dem Vertical Slice Fremde spielen lassen. Der Build schreibt ein Telemetrie-Log (Raum, Rätsel, Zeit, Hinweisstufe, Klicks ins Leere); dazu ein Beobachtungsbogen je Tester mit Zielwerten: Rätsel unter 12 Minuten, höchstens eine Hinweisstufe 3 je Welt, jeder Witz mindestens einmal gelacht | du und Testspieler |
| Steam-Seite | Kapselbilder in mehreren Formaten, 5+ Screenshots, Trailer, Beschreibung, KI-Offenlegung; Seite früh online stellen, um Wunschlisten zu sammeln | du, Claude hilft bei Texten |
| Rechtliches | Rechtscheck der Namen (Tab Konzept) vor jeder Welt durchgehen; Markencheck des Arbeitstitels in DPMAregister, EUIPO eSearch und der Steam-Suche vor der Steam-Seite, Ergebnis mit Datum hier eintragen (Stand 8. November 2026: noch nicht gemacht); eine Anwaltsstunde für Figurenliste und Titel vor der Veröffentlichung; Lizenznachweise für Schrift, Musik und Geräusche sammeln; Impressum für die Seite. Das Dokument ersetzt keine Rechtsberatung | du |
| Versionierung | Git mit GitHub und Git LFS für audio/ und concepts/; wichtig, sobald eine KI Dateien im Projekt ändert, damit jeder Schritt rückgängig gemacht werden kann | einmal einrichten |

**Reihenfolge:** Erst das Grundgerüst, dann der Vertical Slice (Prolog und Welt 1 Rätsel 1 bis 4: 8 Räume, 13 Figuren, etwa 450 Zeilen, Platzhaltergrafik erlaubt), dann testen, dann Grafik und Audio in Serie. Die Stufen stehen unter Meilensteine.

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
