# 360-Grad-Prüfung von Couch Quest

> **Stand der Arbeit (wird laufend aktualisiert, am Ende entfernt)**
>
> - Geprüfter Stand: `main` bei Commit `6fe02fd` (enthält den Humor-Durchgang aus Pull Request 14).
> - Arbeitszweig: `claude/project-thread-769z6c`.
> - **Erledigt:** Dateiliste aufgenommen. Vollständig gelesen: `docs/00-aufbau.md`, `docs/01-konzept.md`, `docs/entscheidungen.md`, `docs/05-spielsysteme.md`, `docs/skript/prolog.md`. Rohfunde dazu stehen im Abschnitt „Arbeitsnotizen“ ganz unten.
> - **Als Nächstes lesen:** `docs/skript/welt-1.md` bis `welt-4.md`, `docs/skript/zwischenspiele-und-finale.md`, `docs/raetsel/*`, `docs/welten/*`, `docs/grafik/*`, `docs/04-audio.md`, `docs/03-produktion.md`, `docs/offene-punkte.md`, `docs/uebersetzung/ui.csv`, dann die Bilder, dann der Spielcode (`game/skripte`, `game/oberflaeche`, `game/tests`, `tools`).
> - **Auftrag erweitert (Sebastian, 10. November, 22:03 Uhr):** Der Spielcode im Repository wird mitgeprüft.
> - **Noch offen:** Story-Bibel, Abschnitte A bis N, Codeprüfung, Gesamtbild, Korrekturen, Fundliste, Zusammenfassung.

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

## Arbeitsnotizen (Rohfunde, werden am Ende in die Abschnitte einsortiert und dann gelöscht)

Noch nicht alle am Material gegengeprüft. „Z.“ ist die Zeilennummer der Datei.

### Aus `README.md`, `docs/00-aufbau.md`, `docs/entscheidungen.md`, `docs/05-spielsysteme.md`

- `README.md` Z.5: nennt „Pixel-Art in 320×180, Grafik mit Retro Diffusion“. Stand laut `entscheidungen.md` Z.143: 640×360, Hintergründe aus Gemini-Konzeptbild mit `tools/pixelieren.py`. Veraltet.
- Die fehlende Nummer 02 ist erklärt: `entscheidungen.md` Z.3 nennt `docs/02-ueberarbeitung.md` als Datei in der Git-Historie. Kein Fehler.
- `entscheidungen.md` Z.148: „Figuren um ein Viertel größer: Max 105 Pixel“ steht ohne Durchstreichung da, ist aber durch Z.144 (Max 189 Pixel) überholt und steht in der Tabelle hinter der neueren Zeile. Verwirrt.
- `entscheidungen.md` Z.83 sagt, Errungenschaften seien der „sechste Kanal“ im Hauptmenü. `05-spielsysteme.md` Z.191 und Z.250: Kanal 5 (Fortsetzen, Neues Spiel, Laden, Optionen, Errungenschaften, Beenden). Widerspruch.
- `05-spielsysteme.md` Z.345–346 („Offene Entscheidungen“): „Schrift festlegen (Monogram Extended oder m5x7)“ ist noch offen angehakt, obwohl Nunito am 9. November festgelegt wurde (Z.124). Der Punkt darunter sagt „Text bleibt in Spielauflösung“, Z.142 sagt das Gegenteil (Textebene in 1920×1080). Veraltet.
- `05-spielsysteme.md` Z.142 gegen Z.144: Sprechblasen „46 px“ gegen „12 Spielpixel (bei 1080p 48 px)“; Blasenbreite „1.080 px“ gegen „270 Spielpixel“. Bei 640×360 und Faktor 3 sind 12 Spielpixel 36 px und 270 Spielpixel 810 px. Die Zahlen stammen noch aus 480×270. Am Code prüfen (`gui_theme.tres`).
- `05-spielsysteme.md` Z.205: Fenstergrößen „960×540, 1440×810, 1920×1080“ als „ganzzahlige Stufen“. Bei 640×360 sind das die Faktoren 1,5 und 2,25. Ganzzahlig wären 1280×720 und 1920×1080. Am Code prüfen (`optionen.gd`).
- `05-spielsysteme.md` Z.124: Begründung nennt noch „bei 320×180“.
- `05-spielsysteme.md` Z.104 („Max spricht kurz“) passt nicht mehr ganz zur neuen Dialogregel in `01-konzept.md` Z.63 („erzählt einen Gedanken zu Ende“).

### Aus `docs/01-konzept.md`

- Z.59–60 (neue Dialogregeln) gegen Z.69–78 (Beispielsätze): Die Regel verbietet Reihen aus Ein- und Zwei-Wort-Sätzen und begrenzt „Wie X, nur Y“. Die Beispielsätze direkt darunter tun genau das: „Sport. Freiwillig. Die spinnen, die Griechen.“, „Klebt. Ich nenne das eine Bindung.“, „Sieht aus wie Montagmorgen, nur grüner.“, „Sie klingt wie die Schulsekretärin, nur mit Laser.“ Die Beispiele stammen aus der Zeit vor dem Humor-Durchgang. Wer künftig danach schreibt, bekommt zwei widersprüchliche Vorgaben.
- Z.177: Quelle für Cicero und das Archimedes-Grab ist eine unbekannte Biografie-Seite (`alankyerematen.org`). Die Zahl 137 stimmt (212 v. Chr. bis 75 v. Chr.), die Quelle ist schwach. Besser Wikipedia oder Cicero, Tusculanae 5,64.
- Z.362: Tabelle nennt den Titel noch „Arbeitstitel“, obwohl er festgelegt ist. Repository heißt „Max-against-the-world“ (Einzahl), Titel „…the worlds“ (Mehrzahl).
- Z.73: „Die spinnen, die Griechen“ ist das bekannteste Asterix-Zitat (in den Rechtscheck-Tabellen nicht aufgeführt).

### Aus `docs/skript/prolog.md`

Stärken (bleiben): „Die Wissenschaft hat Knie, Junge! Alte Knie!“ (P0_WOHN_OPA_0042), „Zu einem Flugzeug sagst du ja auch nicht Bus.“ (P0_DACH_OPA_0060), „Fair, motivierend, großväterlich.“ (0130), „Funknetz, vier Buchstaben: NEIN“ (P0_WOHN_MAX_0365), „ZAPPOMAT“ mit dazugemaltem Kästchen (0355), Pixels Auftritt „Wer. Hat. Mich. Geweckt.“ mit Lachs-Traum (0310–0360), „Ein Hase, der Empfang hat“ (0470), Kochbuch mit „Nicht wieder vergessen.“ (0955), Kartons „Später“ / „Später, wirklich. Der ist von 1979.“ (1810/1815), „230 Volt. Nicht lecken.“ (1835).

Funde:

- **Regelbruch Retro-Wissen:** P0_DACH_MAX_0680 – Max sagt „Das ist ein Testbild“. Laut `01-konzept.md` Z.55 kennt Max mit 16 kein Testbild; die Pointe gehört Pixel oder Opa. Drei Zeilen vorher (0430) kennt er den Sendeschluss korrekt nicht. Vorschlag: „Kanal 4. Bunte Streifen und ein Pfeifton. Das ist das Langweiligste …“
- **Widerspruch Pixels Vorwissen:** P0_DACH_OPA_0370 „Er kennt die Welten, und er kennt alle Antworten.“ gegen P0_DACH_PIX_0850 „Fernsehreisen … Ich habe nur noch keine gemacht.“ Entweder kennt Pixel die Welten oder er war nie dort.
- **Tageszeit:** P0_TREP_MAX_0020 „Draußen wird es langsam dunkel.“ Laut Konzept Z.124 ist im Prolog Nachmittag, das Licht wird erst von Rückkehr zu Rückkehr abendlicher, und das Treppenhaus kommt „im Finale am Abend“ wieder. Gegen Grafik-Datei prüfen.
- **Lösung hinter dem zweiten Ansehen:** P0_DACH_MAX_0630 – die Kanalnummer (und die Nahansicht) kommt erst beim zweiten Ansehen des Kalenders. Überall sonst ist das zweite Ansehen nur ein Bonus-Gag. Spieler, die einmal schauen, haben den roten Kreis, aber nicht die Nummer. Gegen `raetsel/prolog-und-welt-1.md` und Code prüfen.
- **Wiederholung:** Opa sagt zweimal fast dasselbe über die Zeit (0155 „vergeht die Zeit hier oben irgendwie anders“, 0845 „Drüben vergeht die Zeit anders als hier“).
- **Wiederholung:** „seit ich denken kann“ zweimal im Treppenhaus (P0_TREP_MAX_0050 und 0110).
- **Muster „nicht X, sondern Y“:** P0_WOHN_MAX_0365 („keine Lösung, … eine Haltung“), P0_TREP_MAX_0115 („keine Bitte, sondern eine Warnung“), P0_DACH_PIX_0215 („keine Freundlichkeit, sondern eine förmliche Warnung“), SYS_WDH_PIX_0020 („keine Meinung, sondern ein Messergebnis“), SYS_WDH_PIX_0030, SYS_ERS_PIX_0150. Zwei davon enden auf „Warnung“.
- **Muster im Benutzen:** Fast jedes Deko-Objekt folgt derselben Bauform: erstes Mal „Ich mach das nicht, weil …“, zweites Mal „Ich hab’s doch getan, und …, ich lass das jetzt“. Rund 25 Objekte in drei Räumen. Einzeln gut, in Serie vorhersehbar. Vorschlag: bei jedem dritten Objekt die Form brechen (Opa ruft dazwischen, Pixel kommentiert, oder es passiert schlicht nichts).
- **Glatte Schlusssätze:** Viele Max-Zeilen enden mit einem angehängten Kurzsatz als Pointe („Ruhe in Frieden, Keks.“, „Die Lampe sammelt.“, „Er gewinnt.“, „Ich lass das ab sofort.“, „Ich fass hier nichts mehr an.“, „Wir reden nie wieder darüber.“). Gleiche Satzmelodie über ganze Räume.
- Kopfzeile Z.3: „rund 180 Zeilen“; `05-spielsysteme.md` Z.111 sagt „165 Zeilen“, Budget 170. Nachzählen.
- P0_DACH_PIX_0340 „Der redet seit Jahren“ – Max kennt den Kater seit Jahren und hat es nie bemerkt, Opa „schaltet den Lautsprecher ein“. Kleiner Wackler, als Gag vertretbar.
