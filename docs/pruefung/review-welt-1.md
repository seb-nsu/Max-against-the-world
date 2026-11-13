# Review Welt 1 (Auftrag für Fable)

Stand 13. November 2026. Dieses Dokument ist der Auftrag für einen einmaligen, gründlichen Durchgang durch Prolog und Welt 1 von Couch Quest, sobald alle Grafiken von Welt 1 eingebaut sind. Empfohlene Einstellung: Fable, Denkstufe „hoch“. Ergebnis ist ein Bericht, keine Code-Änderung.

## Auftrag in einem Satz

Spiel Prolog und Welt 1 wie ein Tester durch, sieh dir jeden Raum an und bewerte Spielbarkeit, Rätsel, Witz, Grafik und Animationen; liefere eine priorisierte Liste, was vor dem Test mit fünf Fremden und vor dem Aseprite-Durchgang geändert werden sollte.

## Regeln

- **Nur prüfen und berichten.** Keine Dateien im Spiel ändern, nichts committen. Ausnahme: Hilfsskripte und Bildschirmfotos im eigenen Arbeitsordner.
- **Belege.** Jeder Fund nennt Raum, Objekt oder Zeilen-ID (etwa `W1_TAV_MAX_1425`) und, wo es um Optik geht, ein Bildschirmfoto mit markierter Stelle.
- **Bekanntes nicht doppelt melden.** Was schon in `docs/offene-punkte.md` steht (P15 Nacharbeiten, Animationen, P16 lebendige Hintergründe), nur erwähnen, wenn es schlimmer ist als dort beschrieben oder die Priorität falsch ist.
- **Deutsch schreiben**, Spielernamen und Texte im Original zitieren (kurz).
- **Spielerperspektive zuerst.** Nicht „was steht im Design-Dokument“, sondern „was erlebt jemand, der das Spiel zum ersten Mal spielt“.

## Was zu lesen ist (in dieser Reihenfolge)

1. `docs/01-konzept.md`: Ton, Figuren, Geschichte, Zielgruppe.
2. `docs/raetsel/prolog-und-welt-1.md`: Rätselkette, Lösungen, Hinweise.
3. `docs/skript/prolog.md` und `docs/skript/welt-1.md`: alle Zeilen (überfliegen, gezielt nachschlagen).
4. `docs/05-spielsysteme.md`: Bedienung, Hinweissystem, Speichern.
5. `docs/offene-punkte.md`: bekannte Baustellen (P15, P16, Animationen).
6. `docs/grafik/welt-1.md`: Grafik-Plan, Abschnitt „Umgesetzt und Abweichungen“.
7. `docs/test/beobachtungsbogen.md`: woran der spätere Test mit Fremden gemessen wird.

## Werkzeuge

Aus dem Ordner `game/`, Godot-Konsole `"E:/Game Engine/Godot_v4.7.2-stable_win64.exe/Godot_v4.7.2-stable_win64_console.exe"`:

- Durchspieltest (Logik, alle Rätsel, beide Wege): `--headless --path . -s res://tests/prolog_durchlauf.gd`
- Bildschirmfotos aller Räume: `--path . --rendering-driver opengl3 --resolution 640x360 -s res://tests/bildschirm_vergleich.gd -- <ordner>` (Übersicht je Abschnitt als `uebersicht_*.png`)
- Prüfskript Daten und Skript: `py -3 tools/pruefen.py` (aus dem Hauptordner)
- Für eigene Ansichten (Kamera an eine Stelle, Zustand setzen, Szene aufnehmen) ein kleines `SceneTree`-Skript in `game/tests/_name.gd` schreiben und nach Gebrauch löschen. Vorlage: `tests/bildschirm_vergleich.gd`. Im Testmodus (`Spiel.testmodus = true`) laufen Szenen ohne Wartezeit; für Aufnahmen von Szenen den Testmodus weglassen und `E.settings.auto_continue_text = true` setzen.

## Prüfliste

### 1. Spielfluss und Rätsel (wichtigster Teil)

Für jedes Rätsel P1 bis P3 und R1 bis R13 (Tabelle in `raetsel/prolog-und-welt-1.md`):

- Ist das Ziel klar, bevor der Spieler die Lösung braucht? Wer oder was sagt es?
- Ist die Lösung fair: Gibt es im Spiel einen Hinweis, der zur Lösung führt, ohne sie zu verraten? Ist sie logisch im Sinn der Spielwelt (Märchenlogik ist erlaubt, Zufall nicht)?
- Gibt es Mondlogik, also Schritte, auf die man nur durch Durchprobieren kommt?
- Reihenfolge: Kann man stecken bleiben (Gegenstand verbraucht, Raum gesperrt, Figur weg)? Gibt es Sackgassen oder Stellen, an denen der Spieler nicht weiß, wo er weitermachen soll?
- Laufwege: Wie oft muss man für ein Rätsel zwischen Räumen hin und her? Ist das angenehm oder mühsam?
- Hilfe-Pfote: Führen die Stufen 1 bis 3 wirklich zur Lösung, und sind sie unterhaltsam?
- Neu und besonders prüfen: das Huhn-Rätsel in der Taverne (Berta, Pixels Übersetzung, Laute; `W1_TAV_*_1425` bis `1605`). Ist es zu leicht, zu schwer, gut gesetzt?
- Schätzung: Wie lange braucht ein Erstspieler pro Rätsel (Ziel laut Konzept 8 bis 12 Minuten)?

### 2. Witz und Text

- Tragen die Witze? Drei beste und drei schwächste Stellen je Raum nennen, mit Zeilen-ID.
- Wiederholen sich Muster zu oft (Pixels „junger Mann“, „//“-Nachsätze, bestimmte Satzbauten)?
- Passen Ton und Stimme der Figuren zu ihrer Beschreibung im Konzept?
- Sind Zeilen zu lang für Sprechblasen (Lesbarkeit bei 640×360)?
- Anspielungen: Wirkt etwas wie eine Kopie statt wie eine Anspielung (rechtlich heikel, `03-produktion.md`, Regeln zu Parodien)?

### 3. Räume und Grafik

Für jeden der 14 Räume von Welt 1 und die drei Prolog-Räume, anhand von Bildschirmfotos:

- Lesbarkeit: Erkennt man Ausgänge, Hotspots und wichtige Gegenstände, ohne sie zu suchen? Fallen nehmbare Dinge zu sehr auf oder gar nicht?
- Maßstab: Passen Figuren zu Türen, Möbeln und Häusern (`tiefe:` und `skala:` in `tools/layout/welt-1.yaml`)? Stehen sie auf dem Boden, schweben sie, verdecken sie Wichtiges?
- Blickrichtung und Platzierung der Figuren: wirken sie sinnvoll in den Raum gestellt?
- Stilbruch: Wirkt ein Hintergrund, eine Figur oder ein Sprite wie aus einem anderen Spiel (Strich, Farben, Licht)?
- Übergänge: Passen Laufwege und Ausgänge zwischen benachbarten Räumen zusammen (wer rechts hinausgeht, kommt links herein)?
- Breitbild-Räume (Dorfplatz, Zauberwald, Bergwerk, Luftschloss): Läuft die Kamera sauber, ist die Naht unsichtbar?
- Lebendige Hintergründe (Dorfplatz Vögel und Blätter, Klassenzimmer Schüler am Fenster): stimmig, zu viel, zu wenig?

### 4. Figuren und Animationen

- Welche Figur braucht welche Bewegung wirklich? Grundsatz: Gehen nur, wer im Spiel läuft; jede Figur darf eine kleine Eigenheit haben (siehe `offene-punkte.md`, Animationen). Pro Figur eine Empfehlung: Atmen reicht, Eigenheit (welche), Gehen, Szenen-Animation.
- Szenen, in denen eine fehlende Animation den Witz kostet (etwa Max' Landung, Toadis Auftritt, Bertas Flucht, Waldemars Musical-Nummer).
- Reihenfolge für den Aseprite-Durchgang: was zuerst, weil es am meisten bringt.

### 5. Bedienung und Technik

- Maus und Controller: Ist alles erreichbar, verdecken Figuren Hotspots, sind Klickflächen zu klein?
- Speichern und Laden mitten in Rätseln: geht nichts verloren?
- Fehlermeldungen in der Godot-Ausgabe beim Durchspielen (SCRIPT ERROR, fehlende Dateien).
- Leistung: ruckelt etwas (Breitbild-Räume, Ambiente-Ebene)?

### 6. Gesamtbild

- Fühlt sich Welt 1 wie ein zusammenhängendes Märchenbuch an (Konzept: je näher am Turm, desto violetter)?
- Was ist das Stärkste an Welt 1, was das Schwächste?
- Ist der Vertical Slice (Prolog bis R4) bereit für den Test mit fünf Fremden? Falls nein: die drei Dinge, die vorher sein müssen.

## Ergebnis

Eine Datei `docs/pruefung/review-welt-1-ergebnis.md` mit:

1. **Kurzfazit** (höchstens zehn Sätze): Zustand, größte Stärke, größtes Risiko.
2. **Funde als Tabelle**, sortiert nach Priorität:

   | Nr. | Priorität | Bereich | Raum oder Rätsel | Fund | Beleg | Vorschlag | Aufwand |
   | --- | --- | --- | --- | --- | --- | --- | --- |

   Priorität: **A** vor dem Test mit Fremden, **B** vor dem Aseprite-Durchgang, **C** irgendwann. Bereich: Rätsel, Text, Grafik, Animation, Bedienung, Technik. Aufwand: klein (unter einer Stunde), mittel, groß.
3. **Rätsel-Übersicht**: je Rätsel eine Zeile mit Fairness (gut, knapp, unfair), geschätzter Zeit und dem wichtigsten Fund.
4. **Animationsplan**: Tabelle Figur, empfohlene Bewegungen, Priorität.
5. **Bildschirmfotos** zu den Funden in `docs/pruefung/review-welt-1/` (nummeriert wie die Funde).

Bitte am Ende kurz angeben, was nicht geprüft werden konnte und warum.
