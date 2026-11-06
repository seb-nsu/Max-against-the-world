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
| Parodien | Keine geschützten Namen, Logos oder Figurendesigns; Zitate nur abgewandelt | Rechtliche Sicherheit, eigene Witze statt Kopien |
| KI-Offenlegung | Steam-Formular für KI-Inhalte ausfüllen (Grafik, Musik, Stimmen); jede Erzeugung im KI-Protokoll festhalten | Pflicht auf Steam, Nachweis bei Rückfragen |
| Vorgehen | Erst ein spielbarer Ausschnitt (Prolog und Rätsel 1 bis 4 aus Welt 1), dann Serienproduktion | Früh testen, ob Rätsel und Witz funktionieren |

## System 1: Godot und Popochiu

| Thema | Absprache |
| --- | --- |
| Version | Eine stabile Godot-4-Version und die dazu passende Popochiu-Version festlegen und während des Projekts nicht wechseln |
| Pixel-Einstellungen | Viewport 320×180, Stretch-Modus „viewport“, ganzzahlige Skalierung, Texturfilter „Nearest“; richte ich beim Projektstart ein |
| Aufbau | Ein Popochiu-Raum pro Szene; Hintergrund, Laufbereich, Hotspots, Props mit Zuständen, Regionen für Größenwechsel |
| Mechaniken | Figurenwechsel (alle Welten), Zeitfähre (Welt 2), Code-Sicht und Ebenenwechsel (Welt 3), Fernbedienung und Genre-Zustände (Welt 4); nach Überarbeitung Nr. 23 möglichst auf einem gemeinsamen Zustandssystem |
| KI-Anbindung | Claude Code auf deinem PC plus Godot-MCP-Server: Coding-Solo (kostenlos) für den Anfang, GDAI MCP (19 $ einmalig) sobald Claude Screenshots braucht |
| Arbeitsteilung | Claude legt Räume an, importiert Bilder, schreibt Skripte und behebt Fehler; du ziehst Laufbereiche und Hotspot-Umrisse mit der Maus nach und spielst |
| Sicherung | Git mit GitHub ab dem ersten Tag; nach jedem fertigen Raum ein Stand |
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
| Retro Diffusion Cloud | Credits nach Verbrauch | ab den ersten Figuren |
| GDAI MCP | 19 $ einmalig, optional | wenn Claude Screenshots braucht |
| ElevenLabs | ab 6 $ im Monat; für die Vollvertonung 1 bis 2 Monate Pro (99 $) | Geräusche und Musik laufend, Stimmen am Ende |
| Steam-Veröffentlichung | 100 $ Gebühr pro Spiel | vor der Steam-Seite |

Preise Stand November 2026, laut [Retro Diffusion auf itch.io](https://astropulse.itch.io/retrodiffusion) und den Quellen im Tab Audio.

## Was noch fehlt

| Baustein | Was zu tun ist | Wer |
| --- | --- | --- |
| Dialog-Skript | Alle Zeilen von Max, Pixel und den Figuren, jede mit fester ID für Übersetzung und Sprachausgabe; dazu Kommentare für „Benutze X mit Y“, die nicht gehen | Claude schreibt, du kürzt |
| Schrift | Pixel-Schrift mit deutschen Umlauten und offener Lizenz (OFL), z. B. von Google Fonts oder itch.io | du wählst aus |
| Menüs und UI | Hauptmenü, Speichern und Laden, Optionen (Lautstärke, Textgeschwindigkeit, Untertitel), Hotspot-Anzeige | Popochiu bringt Vorlagen mit, Claude passt sie an |
| Hinweis-System | Der Pfoten-Hilfeknopf aus dem Prolog: drei Stufen pro Rätsel, vom Wink bis zur Lösung | Claude schreibt die Hinweise |
| Speichern | Spielstand mit Inventar, Rätsel-Fortschritt und aktueller Figur | Claude skriptet |
| Übersetzung | Englisch verdoppelt den Markt auf Steam; mit Zeilen-IDs ist das später wenig Aufwand | Claude übersetzt, Muttersprachler prüft Witze |
| Testen | Ab dem ersten spielbaren Abschnitt Fremde spielen lassen; wo sie hängen, ist ein Rätsel zu schwer oder ein Hinweis fehlt | du und Testspieler |
| Steam-Seite | Kapselbilder in mehreren Formaten, 5+ Screenshots, Trailer, Beschreibung, KI-Offenlegung; Seite früh online stellen, um Wunschlisten zu sammeln | du, Claude hilft bei Texten |
| Rechtliches | Parodien ohne geschützte Namen und Logos, Lizenznachweise für Schrift, Musik und Geräusche sammeln, Impressum für die Seite | du |
| Versionierung | Git mit GitHub; wichtig, sobald eine KI Dateien im Projekt ändert, damit jeder Schritt rückgängig gemacht werden kann | einmal einrichten |

**Reihenfolge:** Erst einen spielbaren Ausschnitt bauen (Prolog und zwei, drei Räume aus Welt 1 mit Platzhaltergrafik), dann testen, dann Grafik und Audio in Serie.

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

Wichtig: vorher Git einrichten und nach jedem fertigen Raum einen Stand sichern. Popochiu-Version und Godot-Version vor Projektbeginn festlegen und nicht mitten im Projekt wechseln.
