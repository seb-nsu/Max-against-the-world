# 360-Grad-Prüfung von Couch Quest

> **Stand der Arbeit (wird laufend aktualisiert, am Ende entfernt)**
>
> - Geprüfter Stand: `main` bei Commit `6fe02fd` (enthält den Humor-Durchgang aus Pull Request 14).
> - Arbeitszweig: `claude/project-thread-769z6c`.
> - **Erledigt:** Dateiliste aufgenommen (Abschnitt „Bestandsaufnahme“, noch ohne Inhaltsangaben).
> - **Als Nächstes:** Alles vollständig lesen, in dieser Reihenfolge: `docs/01-konzept.md`, `docs/entscheidungen.md`, `docs/05-spielsysteme.md`, `docs/skript/prolog.md`, `docs/skript/welt-1.md` bis `welt-4.md`, `docs/skript/zwischenspiele-und-finale.md`, `docs/raetsel/*`, `docs/welten/*`, `docs/grafik/*`, `docs/04-audio.md`, `docs/03-produktion.md`, `docs/offene-punkte.md`, `docs/uebersetzung/ui.csv`, dann die Bilder.
> - **Noch offen:** Story-Bibel, Abschnitte A bis N, Gesamtbild, Korrekturen, Fundliste, Zusammenfassung.
> - Zuletzt gelesen bis: noch nichts.

## 1. Zusammenfassung

*(folgt am Ende)*

## 2. Fundliste

*(folgt; Funde werden während der Prüfung hier gesammelt)*

| Nr. | Bereich | Ort | Problem | Schwere | Vorschlag |
| --- | --- | --- | --- | --- | --- |

## Bestandsaufnahme

### Welche Dateien es gibt

Die Hauptfassung liegt im Repository `seb-nsu/Max-against-the-world`. Der Projektordner (Bibliothek) enthält zusätzlich Exporte, ältere Konzeptfassungen, Layout-Skizzen, Grafiktests und Oberflächen-Entwürfe.

**Repository, Texte (rund 1,6 MB, etwa 14.500 Zeilen):**

| Datei | Umfang | Inhalt |
| --- | --- | --- |
| `README.md` | 1 Seite | Kurzbeschreibung, Ordnerübersicht, Werkzeuge |
| `docs/00-aufbau.md` | 31 Zeilen | Welche Datei welche Information besitzt |
| `docs/01-konzept.md` | 390 Zeilen | Geschichte, Ton, Figuren, Welt-Ideen, Finale, Rechtscheck |
| `docs/03-produktion.md` | 240 Zeilen | Technik, Werkzeuge, Kosten, Meilensteine, Recht und Markt |
| `docs/04-audio.md` | 240 Zeilen | Musik, Geräusche, Stimmen mit Prompts |
| `docs/05-spielsysteme.md` | 349 Zeilen | Dialogsystem, Schrift, Oberfläche, Hinweissystem, Speichern |
| `docs/entscheidungen.md` | 251 Zeilen | Geltende Entscheidungen mit Begründung |
| `docs/offene-punkte.md` | 81 Zeilen | Offene Punkte |
| `docs/skript/prolog.md` | 495 Zeilen | Dialog-Skript Prolog |
| `docs/skript/welt-1.md` bis `welt-4.md` | 1.300 bis 1.547 Zeilen je Welt | Dialog-Skripte der vier Welten |
| `docs/skript/zwischenspiele-und-finale.md` | 675 Zeilen | Zwischenspiele und Finale |
| `docs/raetsel/*.md` (6 Dateien) | 89 bis 398 Zeilen | Rätsel-Abläufe, Hinweise, Abhängigkeitsdiagramme |
| `docs/welten/*.yaml` (6 Dateien) + `README.md` | 139 bis 774 Zeilen | Welt-Tabellen: Räume, Wege, Gegenstände, Figuren |
| `docs/grafik/00-stil-und-werkzeuge.md` | 212 Zeilen | Stilregeln und Werkzeuge |
| `docs/grafik/01-max-und-pixel.md` | 122 Zeilen | Steckbriefe der Hauptfiguren |
| `docs/grafik/02-prolog-und-finale.md`, `welt-1.md` bis `welt-4.md` | 157 bis 230 Zeilen | Szenen-, Figuren- und Gegenstandsbeschreibungen |
| `docs/grafik/fertige-prompts/*.md` (5 Dateien) | 65 bis 159 Zeilen | Zusammengesetzte Grafikprompts |
| `docs/uebersetzung/en.csv`, `ui.csv` | 609 KB, 47 KB | Englische Fassung, Oberflächentexte |
| `docs/test/beobachtungsbogen.md` | 1 Seite | Bogen für Spieltests |
| `game/lokalisierung/texte.csv` | 1,2 MB | Aus dem Skript erzeugte Spieltexte |
| `game/daten/*` (18 JSON-Dateien) | erzeugt | Räume, Welten, Hinweise als Spieldaten |
| `game/skripte/*.gd`, `game/oberflaeche/*.gd` | 39 Skripte | Spiellogik und Menüs (Godot) |
| `tools/*.py` (19 Skripte), `tools/layout/*.yaml` | – | Prüf-, Export- und Grafikwerkzeuge |

**Repository, Bilder:**

| Ort | Anzahl | Inhalt |
| --- | --- | --- |
| `concepts/` | 3 | Freigegebene Konzeptbilder: Max, Pixel, Dachboden |
| `game/grafik/hintergruende/` | 6 | Echte Hintergründe: Dachboden (4 Stimmungen), Treppenhaus, Wohnzimmer |
| `game/grafik/platzhalter/` | 453 | Platzhalter für alle übrigen Räume, Figuren, Gegenstände |
| `docs/grafik/skizzen/` | 55 | Layout-Skizzen aller Räume |
| `tests/bildschirm/referenz/` | 55 | Referenz-Bildschirmfotos der Räume |

**Projektordner (Bibliothek):**

| Ort | Inhalt |
| --- | --- |
| `export/01` bis `07` | Sieben zusammengefasste Exportdateien (Stand vor dem Humor-Durchgang prüfen) |
| `konzepte/` | Ältere Konzeptfassungen und die drei Konzeptbilder |
| `grafik/` | Dachboden-Tests (Farben, Maßstab, Figurengrößen), Auflösungstest, Stimmungen, fertige Prompts, Layout-Skizzen |
| `grafik-pruefung/` | Layoutvergleich Dachboden |
| `skript/` | Vorher-Nachher-Gegenüberstellungen des Humor-Durchgangs |
| `ui/` | 22 Menü- und Oberflächen-Entwürfe, Schrifttests |
| `git/` | Drei Git-Bündel (Sicherungen) |
| `uploads/hearth/` | 8 hochgeladene Dateien ohne Endung (noch zu sichten) |

### Was zu fehlen scheint (erster Stand)

- **Audiodateien:** Im Repository liegt keine einzige Audiodatei. Geprüft werden kann nur `docs/04-audio.md`.
- **Fertige Grafiken:** Nur 6 Hintergründe (alle Prolog) sind echt. Alle übrigen 453 Bilder sind Platzhalter. Figuren- und Gegenstandsgrafiken fehlen ganz.
- **`docs/02-…`:** In der Nummerierung der Hauptdokumente fehlt die 02 (es gibt 00, 01, 03, 04, 05). Noch zu klären, ob das Absicht ist.
- **README:** nennt 320×180 als Auflösung, der Stand im Repository ist 640×360 (Commit `bd6e948`). Noch am Material zu bestätigen.

*(Inhaltsangaben und Story-Bibel folgen nach dem vollständigen Lesen.)*

## Story-Bibel

*(folgt)*

## 3. Abschnitte A bis N

*(folgen)*

## Gesamtbild

*(folgt)*

## 4. Was auf keinen Fall verloren gehen darf

*(folgt)*

## 5. Direkt korrigierte Kleinigkeiten

| Datei | Vorher | Nachher |
| --- | --- | --- |

*(noch keine)*

## 6. Empfohlene Reihenfolge

*(folgt)*
